// msvcr14x.cpp: 定义 DLL 应用程序的导出函数。
//

#include "stdafx.h"



extern "C" BOOL WINAPI __acrt_DllMain(_In_ HINSTANCE hInstance, _In_ DWORD fdwReason, _In_ LPVOID lpvReserved);

extern "C" const void* __pfnDllMainCRTStartupForYY_Thunks = __acrt_DllMain;