#include <substrate.h>

float (*get_deltaTime)(void *_this) = (float (*)(void *))(_dyld_get_image_vmaddr_slide(0) + /*get_deltaTime() offset here*/ + 1);

float _getFPS(void *_this){
float FPS = 1.0f/get_deltaTime(_this);

return getFPS(_this);
}

%ctor{
MSHookFunction((void*)(_dyld_get_image_vmaddr_slide(0) + /*get_time() offset here*/ + 1),(void*)_getFPS,(void**)&getFPS);
}
