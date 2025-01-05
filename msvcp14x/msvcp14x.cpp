// msvcp14x.cpp: 定义 DLL 应用程序的导出函数。
//

#include "stdafx.h"

//由于无法修改winapisupp.cpp,所以目前通过下面这样来防止pinit的符号因我们的链接选项中指定了/OPT:REF而被剔除
#include "winapisupp.cpp"
#ifndef _WIN64
#pragma comment(linker, "/include:?force_included__winapisupp_pinit@@3P6AHXZA")
#else
#pragma comment(linker, "/include:?force_included__winapisupp_pinit@@3P6AHXZEA")
#endif
_CRTALLOC(".CRT$XIC") /*static*/ _PIFV force_included__winapisupp_pinit = initialize_pointers;
