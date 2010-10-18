From: Richard Weinberger <richard@nod.at>
Subject: linux-next: user mode linux build failure
Date: Tue, 19 Oct 2010 01:41:10 +0200
Message-ID: <201010190141.10365.richard@nod.at>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_WsNvMWxFjz2hJOp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dhowells@redhat.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Boundary-00=_WsNvMWxFjz2hJOp
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

df9ee292 (Fix IRQ flag handling naming) breaks um build.
Build log is attached.

Thanks,
//richard

--Boundary-00=_WsNvMWxFjz2hJOp
Content-Type: text/x-log;
  charset="UTF-8";
  name="build.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="build.log"

make[1]: `arch/um/sys-i386/user-offsets.s' is up to date.
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      init/version.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
  LD      init/built-in.o
  CC      arch/um/kernel/physmem.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/bootmem.h:7,
                 from arch/um/kernel/physmem.c:6:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
  CC      arch/um/kernel/process.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/hardirq.h:4,
                 from arch/um/kernel/process.c:9:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
  CC      arch/um/kernel/ptrace.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from include/linux/audit.h:362,
                 from arch/um/kernel/ptrace.c:6:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
  CC      arch/um/kernel/reboot.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:56,
                 from arch/um/kernel/reboot.c:6:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
  CC      arch/um/kernel/sigio.o
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:11:1: warning: "local_save_flags" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:143:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:13:1: warning: "local_irq_restore" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:142:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:16:1: warning: "local_irq_save" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:138:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:19:1: warning: "local_irq_enable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:136:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:20:1: warning: "local_irq_disable" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:137:1: warning: this is the location of the previous definition
In file included from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
/media/data1/linux-next/arch/um/include/asm/system.h:22:1: warning: "irqs_disabled" redefined
In file included from /media/data1/linux-next/arch/um/sys-i386/shared/sysdep/system.h:11,
                 from /media/data1/linux-next/arch/um/include/asm/system.h:4,
                 from /media/data1/linux-next/arch/um/include/asm/fixmap.h:5,
                 from /media/data1/linux-next/arch/um/include/shared/um_uaccess.h:10,
                 from /media/data1/linux-next/arch/um/include/asm/uaccess.h:41,
                 from /media/data1/linux-next/arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:56,
                 from include/linux/preempt.h:9,
                 from include/linux/interrupt.h:8,
                 from arch/um/kernel/sigio.c:6:
include/linux/irqflags.h:144:1: warning: this is the location of the previous definition
arch/um/kernel/sigio.c: In function 'sigio_interrupt':
arch/um/kernel/sigio.c:19: error: 'SIGIO_WRITE_IRQ' undeclared (first use in this function)
arch/um/kernel/sigio.c:19: error: (Each undeclared identifier is reported only once
arch/um/kernel/sigio.c:19: error: for each function it appears in.)
arch/um/kernel/sigio.c: In function 'write_sigio_irq':
arch/um/kernel/sigio.c:27: error: 'SIGIO_WRITE_IRQ' undeclared (first use in this function)
make[1]: *** [arch/um/kernel/sigio.o] Error 1
make: *** [arch/um/kernel] Error 2

--Boundary-00=_WsNvMWxFjz2hJOp--
