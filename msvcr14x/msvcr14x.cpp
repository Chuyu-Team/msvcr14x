// msvcr14x.cpp: ���� DLL Ӧ�ó���ĵ���������
//

#include "stdafx.h"



extern "C" BOOL WINAPI __acrt_DllMain(_In_ HINSTANCE hInstance, _In_ DWORD fdwReason, _In_ LPVOID lpvReserved);

extern "C" const void* __pfnDllMainCRTStartupForYY_Thunks = __acrt_DllMain;