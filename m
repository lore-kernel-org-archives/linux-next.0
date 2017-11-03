From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: Tree for Nov 3
Date: Fri, 3 Nov 2017 14:03:44 -0700
Message-ID: <CAGXu5j+DypE0GnpaCW-urE3vSPv50=CxsPjyDy=sXXj+kdZLwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:48024 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751805AbdKCVDq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2017 17:03:46 -0400
Received: by mail-io0-f193.google.com with SMTP id h70so9070715ioi.4
        for <linux-next@vger.kernel.org>; Fri, 03 Nov 2017 14:03:46 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Allen Pais <allen.lkml@gmail.com>

On Fri, Nov 3, 2017 at 2:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Non-merge commits (relative to Linus' tree): 10201
>  9162 files changed, 500400 insertions(+), 233533 deletions(-)

We're close enough with the timer_setup() conversion[1] that I thought
I might start providing a status update. As of this -next tree, there
are (at least) 192 "non trivial" conversions staged (with a matching
subject of ": Convert timers to use timer_setup"), producing:
 600 files changed, 2695 insertions(+), 3088 deletions(-)

There are 72 outstanding non-trivial conversions (almost all are
in-flight to various trees and haven't appeared in -next yet).
Combined with the trivial treewide conversions it produces:
 518 files changed, 2086 insertions(+), 2686 deletions(-)

After that, all 1119 timer_setup() callsites will be finished. My
tree, based on next-20171103, is here:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=kspp/timer/next/20171103/conversions

Notes and break-down of patch statuses:

# in-flight (tip/timers/core)
scsi: aic7xxx: Convert timers to use timer_setup()
scsi: csiostor: Convert timers to use timer_setup()
scsi: cxgbi: Convert timers to use timer_setup()
scsi: ibmvscsi: Convert timers to use timer_setup()
scsi: ipr: Convert timers to use timer_setup()
scsi: lpfc: Convert timers to use timer_setup()
scsi: megaraid: Convert timers to use timer_setup()
scsi: pmcraid: Convert timers to use timer_setup()
scsi: sas: Convert timers to use timer_setup()
scsi: qla4xxx: Convert timers to use timer_setup()
target/iscsi: Simplify timer manipulation code
target/iscsi: Convert timers to use timer_setup()
RAS/CEC: Convert timers to use timer_setup()
usb: usbtest: Convert timers to use timer_setup()
drm: gma500: Convert timers to use timer_setup()
rcu: Convert timers to use timer_setup()
fs/ncpfs: Convert timers to use timer_setup()
hwrng/xgene-rng: Convert timers to use timer_setup()
sparc/led: Convert timers to use timer_setup()
mips: ip22/32: Convert timers to use timer_setup()
arm: pxa: Convert timers to use timer_setup()
powerpc/watchdog: Convert timers to use timer_setup()
watchdog: lpc18xx_wdt: Convert timers to use timer_setup()
ACPI / APEI: Convert timers to use timer_setup()
drm/etnaviv: Convert timers to use timer_setup()
media: pvrusb2: Convert timers to use timer_setup()
watchdog: cpwd: Convert timers to use timer_setup()
auxdisplay: Convert timers to use timer_setup()
ia64: Convert timers to use timer_setup()
ARM: footbridge: Convert timers to use timer_setup()
x86, calgary: Convert timers to use timer_setup()
xtensa: Convert timers to use timer_setup()
drivers/pcmcia: Convert timers to use timer_setup()
drivers/macintosh: Convert timers to use timer_setup()
drivers/memstick: Convert timers to use timer_setup()
drivers/sgi-xp: Convert timers to use timer_setup()
# in-flight (s390)
s390: qdio: Convert timers to use timer_setup()
s390/sclp: Convert timers to use timer_setup()
s390/cio: Convert timers to use timer_setup()
s390/scsi: Convert timers to use timer_setup()
s390/ap_bus: Convert timers to use timer_setup()
# in-flight (greg)
staging: greybus: Convert timers to use timer_setup()
staging: rtl8723bs: Convert timers to use timer_setup()
staging: ks7010: Convert timers to use timer_setup()
staging: vc04_services: Convert timers to use timer_setup()
staging: rtlwifi: Remove unused variable
# in-flight (other trees)
media: pci: Convert timers to use timer_setup()
netfilter: ipvs: Convert timers to use timer_setup()
drivers/wireless: iwlwifi/mvm: Convert timers to use timer_setup()
drm/vc4: Convert timers to use timer_setup()
mISDN: hfcpci: Convert timers to use timer_setup()
# waiting for commit to tree (greg)
serial: 8250: Convert timers to use timer_setup()
serial: sccnxp: Convert timers to use timer_setup()
serial: bfin_uart: Convert timers to use timer_setup()
serial: m32r_sio: Drop redundant .data assignment
tty/serial: altera_uart: Convert timers to use timer_setup()
tty/serial: atmel: Convert timers to use timer_setup()
tty: cyclades: Convert timers to use timer_setup()
tty: vcc: Convert timers to use timer_setup()
# waiting for commit to tree (andy)
intel_ips: Convert timers to use timer_setup()
# collected for tip/timers/core (part 4)
ARM: footbridge: Fix typo in timer conversion
crypto: Convert timers to use timer_setup()
# pending av7110 auto-repeat fixes (will go via input)
input: Convert timers to use timer_setup()
# pending test resolution (will go via tip/timers/core)
scsi: qla2xxx: Convert timers to use timer_setup()
# sent, awaiting feedback (will go via tip/timers/core if no feedback)
block/aoe: discover_timer: Convert timers to use timer_setup()
ide: Convert timers to use timer_setup()
drbd: Convert timers to use timer_setup()
mailbox: Convert timers to use timer_setup()
# late rc1 (through tip/timers/core, depends on other trees)
video: fbdev: Convert timers to use timer_setup()
block/laptop_mode: Convert timers to use timer_setup()
usb: usbatm: Convert timers to use timer_setup()
drm/i915/selftests: Convert timers to use timer_setup()
lightnvm: Convert timers to use timer_setup()
drivers/firmware: psci: Convert timers to use timer_setup()
timer: Prepare to change all DEFINE_TIMER() callbacks
treewide: Switch DEFINE_TIMER callbacks to struct timer_list *
net/atm/mpc: Avoid open-coded assignment of timer callback function
s390: cmm: Convert timers to use timer_setup()
drivers/net: cris: Convert timers to use timer_setup()
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

Thanks to everyone who has suffered through this with me. Only a
little bit more to go! :)

-Kees

[1] https://git.kernel.org/linus/686fef928bba6be13cabe639f154af7d72b63120

-- 
Kees Cook
Pixel Security
