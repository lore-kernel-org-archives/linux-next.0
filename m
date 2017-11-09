From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: Tree for Nov 8 (timer conversions)
Date: Wed, 8 Nov 2017 16:30:22 -0800
Message-ID: <CAGXu5jKVLMYQ_=msd6Es5St5EP9d6tOHWGeNVxte1v4oH7HrLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Allen Pais <allen.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org

timer_setup() conversion[1] status update:

As of this -next tree, there are (at least) 249 "non trivial" conversions
staged (with a matching subject of ": Convert timers to use timer_setup"),
producing:
 736 files changed, 3446 insertions(+), 4001 deletions(-)

There are 20 outstanding non-trivial conversions (all are now in-flight).
Combined with the trivial treewide conversions and API adjustments
it produces an additional:
 392 files changed, 1388 insertions(+), 1925 deletions(-)

After that, all 1116 timer_setup() callsites will be finished. My
tree, based on next-20171108, is here:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=kspp/timer/next/20171108/conversions

Notes and break-down of patch statuses:

# in-flight (tip/timers/core)
ARM: footbridge: Fix typo in timer conversion
crypto: Convert timers to use timer_setup()
block/aoe: discover_timer: Convert timers to use timer_setup()
ide: Convert timers to use timer_setup()
drbd: Convert timers to use timer_setup()
mailbox: Convert timers to use timer_setup()
scsi: qla2xxx: Convert timers to use timer_setup()
netfilter: ipvs: Convert timers to use timer_setup()
timer: Prepare to change all DEFINE_TIMER() callbacks

# in-flight (s390)
s390: qdio: Convert timers to use timer_setup()
s390/sclp: Convert timers to use timer_setup()
s390/cio: Convert timers to use timer_setup()
s390/scsi: Convert timers to use timer_setup()
s390/ap_bus: Convert timers to use timer_setup()

# late rc1 (through tip/timers/core, depends on other trees)
drm/vc4: Convert timers to use timer_setup()
video: fbdev: Convert timers to use timer_setup()
block/laptop_mode: Convert timers to use timer_setup()
usb: usbatm: Convert timers to use timer_setup()
drm/i915/selftests: Convert timers to use timer_setup()
lightnvm: Convert timers to use timer_setup()
drivers/firmware: psci: Convert timers to use timer_setup()
net/atm/mpc: Avoid open-coded assignment of timer callback function
s390: cmm: Convert timers to use timer_setup()
drivers/net: cris: Convert timers to use timer_setup()
treewide: Switch DEFINE_TIMER callbacks to struct timer_list *

# late rc1 (through tip/timers/core or scripted by linus, tree-wide changes)
treewide: init_timer() -> setup_timer()
treewide: setup_timer() -> timer_setup()
treewide: setup_timer() -> timer_setup() (2 field)

# late rc1 (through tip/timers/core, API removal and clean up)
timer: Remove init_timer() interface
timer: Remove setup_*timer() interface
Coccinelle: Remove setup_timer.cocci
timer: Pass timer_list pointer to callbacks unconditionally
timer: Switch callback prototype to take struct timer_list * argument
timer: Remove unused data arguments from macros
timer: Pass function down to initialization routines
timer: Remove redundant __setup_timer*() macros
treewide: Remove TIMER_FUNC_TYPE cast

Thanks to everyone who has suffered through this with me. Looks like
everything is now covered. I'll keep my fingers crossed for the merge
window. :)

-Kees

[1] https://git.kernel.org/linus/686fef928bba6be13cabe639f154af7d72b63120

-- 
Kees Cook
Pixel Security
