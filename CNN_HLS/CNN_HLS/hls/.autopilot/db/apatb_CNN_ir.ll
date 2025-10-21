; ModuleID = 'D:/PJ/CNN_HLS/CNN_HLS/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 8, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 8, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline
define void @apatb_CNN_ir(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="320" %InModel, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull dereferenceable(2) %OutModel, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="11065" %Weights) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %InModel to [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]*
  %InModel_copy = alloca [320 x i16], align 512
  %OutModel_copy = alloca i16, align 512
  %1 = bitcast %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %Weights to [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]*
  %2 = call i8* @malloc(i64 22130)
  %Weights_copy = bitcast i8* %2 to [11065 x i16]*
  call fastcc void @copy_in([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %0, [320 x i16]* nonnull align 512 %InModel_copy, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* nonnull %OutModel, i16* nonnull align 512 %OutModel_copy, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %1, [11065 x i16]* %Weights_copy)
  call void @apatb_CNN_hw([320 x i16]* %InModel_copy, i16* %OutModel_copy, [11065 x i16]* %Weights_copy)
  call void @copy_back([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %0, [320 x i16]* %InModel_copy, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %OutModel, i16* %OutModel_copy, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %1, [11065 x i16]* %Weights_copy)
  call void @free(i8* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="0", [320 x i16]* noalias nocapture align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* readonly "unpacked"="2", i16* noalias nocapture align 512 "unpacked"="3.0", [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="4", [11065 x i16]* nocapture "unpacked"="5.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([320 x i16]* align 512 %1, [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.168"(i16* align 512 %3, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([11065 x i16]* %5, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([320 x i16]* noalias nocapture align 512 "unpacked"="0.0" %dst, [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([320 x i16]* %dst, [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %src, i64 320)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([320 x i16]* nocapture "unpacked"="0.0" %dst, [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [320 x i16], [320 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias "unpacked"="0" %dst, i16* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src, align 512
  store i16 %1, i16* %dst.0.0.04, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([11065 x i16]* nocapture "unpacked"="0.0" %dst, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([11065 x i16]* %dst, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %src, i64 11065)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"([11065 x i16]* nocapture "unpacked"="0.0" %dst, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [11065 x i16], [11065 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0", [320 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* "unpacked"="2", i16* noalias nocapture readonly align 512 "unpacked"="3.0", [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="4", [11065 x i16]* nocapture readonly "unpacked"="5.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.176"([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %0, [320 x i16]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2, i16* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.158"([11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %4, [11065 x i16]* %5)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.158"([11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0" %dst, [11065 x i16]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.161"([11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %dst, [11065 x i16]* %src, i64 11065)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a11065struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.161"([11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0" %dst, [11065 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [11065 x i16], [11065 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.168"(i16* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.0.0.03, align 2
  store i16 %1, i16* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.176"([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="0" %dst, [320 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.179"([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* nonnull %dst, [320 x i16]* %src, i64 320)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a320struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>.179"([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0" %dst, [320 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [320 x i16], [320 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"], [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_CNN_hw([320 x i16]*, i16*, [11065 x i16]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="0", [320 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* "unpacked"="2", i16* noalias nocapture readonly align 512 "unpacked"="3.0", [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* "unpacked"="4", [11065 x i16]* nocapture readonly "unpacked"="5.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %2, i16* align 512 %3)
  ret void
}

declare void @CNN_hw_stub(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull readonly)

define void @CNN_hw_stub_wrapper([320 x i16]*, i16*, [11065 x i16]*) #5 {
entry:
  %3 = call i8* @malloc(i64 640)
  %4 = bitcast i8* %3 to [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]*
  %5 = call i8* @malloc(i64 2)
  %6 = bitcast i8* %5 to %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"*
  %7 = call i8* @malloc(i64 22130)
  %8 = bitcast i8* %7 to [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]*
  call void @copy_out([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %4, [320 x i16]* %0, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %6, i16* %1, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %8, [11065 x i16]* %2)
  %9 = bitcast [320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %4 to %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"*
  %10 = bitcast [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %8 to %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"*
  call void @CNN_hw_stub(%"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %9, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %6, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %10)
  call void @copy_in([320 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %4, [320 x i16]* %0, %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"* %6, i16* %1, [11065 x %"struct.ap_fixed<16, 8, AP_TRN, AP_WRAP, 0>"]* %8, [11065 x i16]* %2)
  call void @free(i8* %3)
  call void @free(i8* %5)
  call void @free(i8* %7)
  ret void
}

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
