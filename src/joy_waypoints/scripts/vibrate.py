from evdev import ecodes, InputDevice, ff, util
import time, sys

dev = None
def vib (durartion):
    rumble = ff.Rumble(strong_magnitude=0xe000, weak_magnitude=0xe000)
    effect_type = ff.EffectType(ff_rumble_effect=rumble)
    duration_ms = durartion

    effect = ff.Effect(
        ecodes.FF_RUMBLE, # type
        -1, # id (set by ioctl)
        0,  # direction
        ff.Trigger(0, 0), # no triggers
        ff.Replay(duration_ms, 0), # length and delay
        ff.EffectType(ff_rumble_effect=rumble)
    )
    
    effect_id = dev.upload_effect(effect)
    
    repeat_count = 1
    

    dev.write(ecodes.EV_FF, effect_id, repeat_count)
    time.sleep(0.4)
    dev.erase_effect(effect_id)


def vibrate_as(mode):
    if mode == "follow":
        vib (170)
        vib (200)



    elif mode == "create":
        vib (300)

    elif mode == "saved":
        vib (200)

    elif mode == "finish_saving":
        vib (300)

    elif mode == "stopped":
        vib (370)

    elif mode == "paused":
        vib (170)

for name in util.list_devices():
    dev = InputDevice(name)
    if ecodes.EV_FF in dev.capabilities():
        break

if dev is None:
    print("Sorry, no FF capable device found")

else:
    print("found " + dev.name)
    print("Ready to give Joystick Feedback")
        



