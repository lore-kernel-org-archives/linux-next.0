From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the usb-gadget tree
Date: Mon, 14 Nov 2016 13:36:49 +1100
Message-ID: <20161114133649.348eb08e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Felipe,

After merging the usb-gadget tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/staging/iio/frequency/ad9832.c: In function 'ad9832_probe':
drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]
  st->avdd = devm_regulator_get(&spi->dev, "avdd");
           ^

This was probably because -Wmaybe-uninitialized has been reenabled in Linus' tree

In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:35:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:37:0,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:34:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_kern_lib.c:42:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:751,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_kern_lib.c:37:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:56:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:751,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:36:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c:53:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from arch/x86/include/asm/mmu.h:5:0,
                 from arch/x86/include/asm/acpi.h:31,
                 from arch/x86/include/asm/fixmap.h:19,
                 from arch/x86/include/asm/apic.h:11,
                 from arch/x86/include/asm/smp.h:12,
                 from include/linux/smp.h:59,
                 from include/linux/percpu.h:6,
                 from include/linux/context_tracking_state.h:4,
                 from include/linux/vtime.h:4,
                 from include/linux/hardirq.h:7,
                 from include/linux/interrupt.h:12,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c:37:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_kern_lib.c:42:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:751,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_kern_lib.c:37:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_util.c:35:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_util.h:39:0,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_util.c:34:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c:36:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:37:0,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c:35:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c:36:0:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined
 #define mutex_lock_interruptible mutex_lock_interruptible_killable
 ^
In file included from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:37:0,
                 from drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c:35:
include/linux/mutex.h:161:0: note: this is the location of the previous definition
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
 ^

I am not sure where the reset of these came from.

-- 
Cheers,
Stephen Rothwell
