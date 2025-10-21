#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string>
#include <fstream>
#include <iostream>
#include "CNN.h"
#include "Conv.h"
#include "Pool.h"
#include "Dense.h"
#define NumberOfPicture 1
#define d 1
int main(){
	fxp OutModel;
	fxp* Weights = (fxp*)malloc(11065 * sizeof(fxp));
	float tmp;
	FILE* Weight = fopen("Float_Weights.txt", "r");
	for (int i = 0; i < 11065; i++){
		fscanf(Weight, "%f", &tmp);
		*(Weights + i)=tmp;
	}
	fclose(Weight);
	////read Input
	fxp* InModel = (fxp*)malloc((NumberOfPicture * d * 1 * 320) * sizeof(fxp));
	FILE* Input = fopen("signals2.txt", "r");
	for (int i = 0; i < NumberOfPicture * d * 1 * 320; i++){
		fscanf(Input, "%f", &tmp);
		*(InModel + i)=tmp;
	}
	fclose(Input);
	//Read Label
	/*fxp*Label = (fxp*)malloc((NumberOfPicture) * sizeof(fxp));
	FILE* Output = fopen("labels2.txt", "r");
	for (int i = 0; i < NumberOfPicture ; i++)
	{
		fscanf(Output, "%f", &tmp);
		*(Label + i) = tmp;
	}
	fclose(Output);*/
	//fxp OutArray[NumberOfPicture] = {};
	fxp Image[d * 320 * 1] = {};
	for (int i = 0; i < NumberOfPicture ; i++)
	{
		int startIndex = i * d * 320 * 1;
		for (int k = 0; k < d * 320 * 1; k++)
		{
			Image[k] = *(InModel + startIndex + k);
		}
		CNN(Image, OutModel, Weights);
		//OutArray[i] = OutModel;
	}
	/*float countTrue = 0;
	for (int i = 0; i < NumberOfPicture; i++)
	{
		int labelValue = *(Label + i);
		if (labelValue == OutArray[i])
		{
			countTrue = countTrue + 1;
		}
	}
	float accuracy = (float)((countTrue / NumberOfPicture) * 100);
	std::cout << "accuracy of Model: " << accuracy << "%\n";
	//std::cout << "Result: " <<  OutModel <<  "\n";*/
	return 0;
}
