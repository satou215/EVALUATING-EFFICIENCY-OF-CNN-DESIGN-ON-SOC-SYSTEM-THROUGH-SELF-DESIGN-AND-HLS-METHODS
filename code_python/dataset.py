import sys

sys.path.append('..')
from operator import itemgetter

import torch
import numpy as np


def collate_fn(data):
    """Creates mini-batch tensors from the dicts (waveform, samplebase, gain, id, captions).

    We should build custom collate_fn rather than using default collate_fn,
    because merging caption (including padding) is not supported in default.
    Args:
        data: list of dict (waveform, samplebase, gain, id, captions).

    Returns:
    """
    captions = [d['label'] for d in data]
    lengths = [len(cap) for cap in captions]

    # if len(lengths) == 1:
    #     return data[0]['waveform'].unsqueeze(0), data[0]['spec'].unsqueeze(0), np.array([data[0]['id']]), data[0][
    #         'label'].unsqueeze(0).long(), lengths, data[0]['weights'], data[0]['extra_label'].unsqueeze(0).long()

    ind = np.argsort(lengths)[::-1]

    lengths = list(itemgetter(*ind)(lengths))
    captions = list(itemgetter(*ind)(captions))

    waveforms = list(itemgetter(*ind)([d['waveform'] for d in data]))
    ids = list(itemgetter(*ind)([d['id'] for d in data]))


    padded_waveforms = []
    for waveform in waveforms:
        if len(waveform) < 320:
            # Pad waveform with zeros
            padded_waveform = torch.nn.functional.pad(waveform, (0, 320 - len(waveform)), mode='constant', value=0)
        elif len(waveform) > 320:
            # Truncate waveform
            padded_waveform = waveform[:320]
        else:
            padded_waveform = waveform
        padded_waveforms.append(padded_waveform)

    # Merge images (from tuple of 3D tensor to 4D tensor).
    reshaped_waveforms = [torch.reshape(waveform, (320,)) for waveform in padded_waveforms]
    waveforms = torch.stack(reshaped_waveforms, 0)
    #waveforms = torch.stack(waveforms, 0)
    waveforms = waveforms[:, None, None, :]
    

    targets = torch.zeros(len(captions), max(lengths)).long()
    for i, cap in enumerate(captions):
        end = lengths[i]
        targets[i, :end] = cap[:end]

    return waveforms, ids, targets, lengths
