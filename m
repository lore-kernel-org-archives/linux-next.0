From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: New ARM build coverage (was: linux-next: triage for April 18, 2012)
Date: Wed, 18 Apr 2012 22:13:45 -0400
Message-ID: <CAP=VYLrNpskLQDAw3Udnq7grddi-uD6TDjQQoZUd+FVg2rXPnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:50594 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751180Ab2DSCOR convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Apr 2012 22:14:17 -0400
Received: by lahj13 with SMTP id j13so6224231lah.19
        for <linux-next@vger.kernel.org>; Wed, 18 Apr 2012 19:14:15 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org

ARM folks,

Just a heads up that Stephen expanded the linux-next ARM coverage
today to add a whole bunch more builds.

Possibly "new" build fails were detected in these configs:

ARM:mackerel_defconfig,ag5evm_defconfig
ARM:ezx_defconfig
ARM:mini2440_defconfig
ARM:spear6xx_defconfig

More details below in the triage report.

If you happen to know anything about these, or care to have a poke
at posting a fix for one, by all means have at it.

Thanks,
Paul.

---------- Forwarded message ----------
=46rom: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Wed, Apr 18, 2012 at 10:01 PM
Subject: linux-next: triage for April 18, 2012
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org


A handful of "new" (most likely pre-existing?) ARM failures from the
50-odd ARM builds Stephen added. =A0(some are kallsyms fails & ignored)=
=2E
They are all tagged with the date "Apr 19 (possibly earlier?)" below.
[ http://marc.info/?l=3Dlinux-next&m=3D133472511300783&w=3D2 ]

Lots of "undefined reference to `vga_default_device'" stuff hitting
several arch (arm/m68k,...) =A0[ https://lkml.org/lkml/2012/4/18/157 ]

The samples/seccomp/bpf-direct.c stuff still breaks most allyes/allmod
configs. =A0Hopefully the fix for that is in the next treegen?
[ http://marc.info/?l=3Dlinux-next&m=3D133479674429442&w=3D2 ]

The gfs2 has issues, being broken on sparc and m68k. =A0Now bisected.
[ http://marc.info/?l=3Dlinux-next&m=3D133479890929994&w=3D2 ]

MIPS got a build failure in iwlwifi/iwl-core.h
[ http://kisskb.ellerman.id.au/kisskb/buildresult/6131791/ ]

All the rcu rcu_read_lock_nesting fallout is fixed

I've pushed some cris, frv and xtensa fixes into my linux-next feed,
so we'll see how that goes in several hours...

---------------------

New breakage since last report:
=A0 =A0 =A0 =A0all:all vga fallout -- too many to list below, so here a=
re some examples.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sh7785lcr_32bit_defconfig, tilegx_defcon=
fig, x86_64-randconfig
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m68k-allmodconfig, mips-p27_defconfig, o=
rion5x_defconfig ...

=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6131974/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6127336/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6131666/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6131694/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6127233/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6126942/

=A0 =A0 =A0 =A0arm:various -- may not be new; many ARM builds just adde=
d

=A0 =A0 =A0 =A0mips:ip27_defconfig iwl-core.h: static decl of 'iwl_allo=
c_traffic_mem'
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 follows non-static decl

Randconfig fails that may or may not be new (by their very nature):
=A0 =A0 =A0 =A0powerpc: mpc52xx_pci.c: format '%x' expects 'unsigned in=
t', but
=A0 =A0 =A0 =A0 arg2 has type 'resource_size_t'
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6131745/
=A0 =A0 =A0 =A0powerpc: leds-renesas-tpu.c: undefined ref to `led_class=
dev_register'
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/buil=
dresult/6127187/

Builds that are fixed since last report:
=A0 =A0 =A0 =A0all:all "rcu_read_lock_nesting undefined"

----------------------

Note1: The randconfig fails are only listed once and not tracked
in the below listing.

Note2: Build fails that are perpetual and/or unlikely to ever
get fixed are not tracked here.

Note3: Issues that Stephen finds and reverts/avoids before kicking
off the all-arch/all-config builds are also not tracked here.

Note4: I'm also not tracking the kallsyms extra pass on ARM on
a per board basis anymore. =A0It has nothing to do with the board.
Why? See: =A0http://marc.info/?l=3Dlinux-next&m=3D133267456809502

----------------------

Latest results at:
=A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/branch/9/

=46ailures as of April 18th, 2012:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

AM33:asb2303_defconfig,asb2364_defconfig
=A0 =A0 =A0 =A0when: =A0 Mar 15
=A0 =A0 =A0 =A0why: =A0 =A0cc1: error: unrecognized command line option=
 '-mmem-funcs'
=A0 =A0 =A0 =A0status: Possible fix from TonyB sent for review.
=A0 =A0 =A0 =A0fix: =A0 =A0http://marc.info/?l=3Dlinux-kernel&m=3D13318=
5020313818&w=3D2
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/5878400/
----------------

ARM:mackerel_defconfig,ag5evm_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 19 (possibly earlier?)
=A0 =A0 =A0 =A0why: =A0 =A0pfc-sh7372.c: undefined reference to `mmc_de=
tect_change'
=A0 =A0 =A0 =A0why: =A0 =A0pfc-sh73a0.c: undefined reference to `mmc_de=
tect_change'
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6131930/
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6131908/

ARM:bcmring_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 19 (possibly earlier?)
=A0 =A0 =A0 =A0why: =A0 =A0core.c: macro "AMBA_APB_DEVICE" requires 6 a=
rgs, but only 5 given
=A0 =A0 =A0 =A0status: fixed, pending feed into linux next.
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://www.spinics.net/lists/arm-kernel/msg1=
69724.html

ARM:ezx_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 19 (possibly earlier?)
=A0 =A0 =A0 =A0why: =A0 =A0ezx-pcap.c: implicit declaration of function=
 'irq_to_gpio'
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6131924/

ARM:mini2440_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 19 (possibly earlier?)
=A0 =A0 =A0 =A0why: =A0 =A0arm-unknown-linux-gnueabi-ld: no machine rec=
ord defined
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6131932/

ARM:spear6xx_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 19 (possibly earlier?)
=A0 =A0 =A0 =A0why: =A0 =A0asm/timex.h: fatal error: mach/timex.h: No s=
uch file
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref:

ARM:netx_defconfig,pnx4008_defconfig
=A0 =A0 =A0 =A0when: =A0 Mar 14
=A0 =A0 =A0 =A0why: =A0 =A0net/core/pktgen.c: can't find a register in =
class 'GENERAL_REGS'
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/5869486/
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/13/670

ARM:ixp4xx_defconfig
=A0 =A0 =A0 =A0when: =A0 Oct 26
=A0 =A0 =A0 =A0why: =A0 =A0gpio.h: implicit declaration of function '__=
gpio_get_value'
=A0 =A0 =A0 =A0status: fixed (Imre Kaloz) - but possibly needs rework?
=A0 =A0 =A0 =A0fix: =A0 =A0https://lkml.org/lkml/2012/2/8/288
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/8/287

ARM:raumfeld_defconfig
=A0 =A0 =A0 =A0when: =A0 Nov 23
=A0 =A0 =A0 =A0why: =A0 =A0eeti_ts.c: implicit declaration of function =
'irq_to_gpio'
=A0 =A0 =A0 =A0status: perhaps broken since 2010? =A0See ref below.
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://www.gossamer-threads.com/lists/linux/=
kernel/1291618?do=3Dpost_view_threaded#1291618

----------------

AVR32:allnoconfig
=A0 =A0 =A0 =A0when: =A0 May 26 2010, 20:49
=A0 =A0 =A0 =A0why: =A0 =A0at32_map_usart: undefined reference to
`atmel_default_console_device'
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref:
---------------

bfin: 50% of builds
=A0 =A0 =A0 =A0when: =A0 Mar 31
=A0 =A0 =A0 =A0why: =A0 =A0"Error: pcrel too far BFD_RELOC_BFIN_10" fro=
m
kernel/time/timekeeping.c
=A0 =A0 =A0 =A0status: unknown, binutils issue?
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6087324/
---------------

cris:various_defconfigs
=A0 =A0 =A0 =A0when: =A0 Apr 16
=A0 =A0 =A0 =A0why: =A0 =A0AS =A0 =A0 =A0arch/cris/arch-v10/lib/checksu=
mcopy.o
=A0 =A0 =A0 =A0why: =A0 =A0In file included from <command-line>:4:0:
=A0 =A0 =A0 =A0why: =A0 =A0include/linux/kconfig.h:23:0: error: syntax =
error in
macro parameter list
=A0 =A0 =A0 =A0why: =A0 =A0[macro magic for config_enabled]
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6123623/
=A0 =A0 =A0 =A0ref: =A0 =A0commit 69349c2dc01c489eccaa4c472542c08e370c6=
d7e

cris:allyesconfig,allmodconfig
=A0 =A0 =A0 =A0when: =A0 Apr 3
=A0 =A0 =A0 =A0why: =A0 =A0too many to list here
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6035250/
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6035249/
----------------

frv:defconfig
=A0 =A0 =A0 =A0when: =A0 Mar 15
=A0 =A0 =A0 =A0why: =A0 =A0undefined reference to `pci_cardbus_resource=
_alignment'
=A0 =A0 =A0 =A0status: PaulG submitted a fix
=A0 =A0 =A0 =A0fix: =A0 =A0http://marc.info/?l=3Dlinux-pci&m=3D13347843=
9025369&w=3D2
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6030067/

----------------

i386:allmodconfig
=A0 =A0 =A0 =A0when: =A0 Apr 17
=A0 =A0 =A0 =A0why: =A0 =A0samples/seccomp/bpf-direct.c:47:2: error: #e=
rror
Unsupported platform
=A0 =A0 =A0 =A0status: reported
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://marc.info/?l=3Dlinux-kernel&m=3D13347=
1624530782&w=3D2
----------------

h8300:defconfig
=A0 =A0 =A0 =A0when: =A0 Mar 15
=A0 =A0 =A0 =A0why: =A0 =A0time.c: implicit declaration of function 'ge=
t_irq_regs'
=A0 =A0 =A0 =A0why: =A0 =A0also seems gcc suffers an ICE
=A0 =A0 =A0 =A0status: ICE bug lodged with gcc folks (TonyB)
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
52598
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/5884668/
----------------

m32r:m32700ut.smp_defconfig
=A0 =A0 =A0 =A0when: =A0 Mar 15
=A0 =A0 =A0 =A0why: =A0 =A0No rule to make target `arch/m32r/boot/compr=
essed/vmlinux.bin
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/5884670/
----------------

mips:ip27_defconfig
=A0 =A0 =A0 =A0when: =A0 Apr 18
=A0 =A0 =A0 =A0why: iwlwifi/iwl-core.h: static decl of 'iwl_alloc_traff=
ic_mem'
follows non-static
=A0 =A0 =A0 =A0status:
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6131791/

mips:allmodconfig
=A0 =A0 =A0 =A0when: =A0 Apr 17
=A0 =A0 =A0 =A0why: =A0 =A0sound/oss/soundcard.c: 'MAX_DMA_CHANNELS' un=
declared
=A0 =A0 =A0 =A0status: one of many fixes mips needs...
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildres=
ult/6091660/
----------------

parisc:allmodconfig
=A0 =A0 =A0 =A0when: =A0 ?
=A0 =A0 =A0 =A0why: =A0 =A0include/linux/log2.h: implicit declaration o=
f function 'fls'
=A0 =A0 =A0 =A0status: reported by PaulG, WIP by David Howells
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/29/409
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/6/228

parisc64:a500_defconfig
=A0 =A0 =A0 =A0when: =A0 ?
=A0 =A0 =A0 =A0why: =A0 =A0include/linux/log2.h: implicit declaration o=
f function 'fls'
=A0 =A0 =A0 =A0status: reported by PaulG, WIP by David Howells
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/29/409
=A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/6/228
------------------

sparc/m68k:all
=A0 =A0 =A0 =A0when: =A0 Apr 18
=A0 =A0 =A0 =A0why: =A0 =A0fs/gfs2/lops.c:379:42: error: request for me=
mber
'virtual' in something not a structure or union
=A0 =A0 =A0 =A0status: reported/bisected by PaulG
=A0 =A0 =A0 =A0fix:
=A0 =A0 =A0 =A0ref: =A0 =A0http://marc.info/?l=3Dlinux-next&m=3D1334798=
90929994&w=3D2
------------------
--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
