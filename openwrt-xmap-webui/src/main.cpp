#include <stdio.h>
#include "print_msg.h"

int main()
{

PrintMsgInit();
PrintDebugMsgEnable(1);

SYS_PRINTF("hello xmap\r\n");
return 0;
}