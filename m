From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: triage for April 12, 2012
Date: Thu, 12 Apr 2012 22:02:24 -0400
Message-ID: <CAP=VYLpq2BUcNEBKJ9bruZb5FAK2fHFPTdUC7=dnJgRU1MMFuQ@mail.gmail.com>
References: <20120413014505.GC30438@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:37096 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819Ab2DMCC4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Apr 2012 22:02:56 -0400
In-Reply-To: <20120413014505.GC30438@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Thu, Apr 12, 2012 at 9:45 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> This is kind of a "two days in one" report. =A0Remember that this
> report lags sfr's treegen by ~24h so that kisskb builds can run.
>
> The i386 allmodconfig lost its rc5t583-regulator license typo fail
> but picked up two more new fails (one still via rc5t583-regulator).

I forgot to mention that the m86k builds lost their android/persistent_=
ram.c
issue, but got fetched up on wiznet (reported by Geert and fix already
applied by DaveM) --  https://lkml.org/lkml/2012/4/12/369

P.

>
> ----------------------
>
> New breakage since last report:
> =A0 =A0 =A0 =A0i386:allmodconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0("rc5t583_ext_power_req_config" undefi=
ned)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0("__udivdi3" [ethernet/mellanox/mlx4/m=
lx4_en.ko] undefined)
> =A0 =A0 =A0 =A0ARM:u8500_defconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(implicit declaration of function 'reg=
ulator_disable')
> =A0 =A0 =A0 =A0powerpc:mpc85xx_defconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(spi-fsl-lib.c:68 dereferencing pointe=
r to incomplete type)
>
> Randconfig fails that may or may not be new (by their very nature):
> =A0 =A0 =A0 =A0powerpc: iommu.c: implicit decl of function 'pci_dev_t=
o_eeh_dev'
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0( http://kisskb.ellerman.id.au/kisskb/=
buildresult/6095808/ )
>
> Builds that are fixed since last report:
> =A0 =A0 =A0 =A0ARM:eseries_pxa_defconfig,em_x270_defconfig,imx_v4_v5_=
defconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(sound/soc/codecs/wm9712.c: error: 'ru=
ntime' undeclared)
> =A0 =A0 =A0 =A0ARM/MIPS:magician_defconfig,omap1_defconfig,ip27_defco=
nfig,s3c2410_defconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(regmap.c: too few arg to 'regmap_debu=
gfs_init')
> =A0 =A0 =A0 =A0s390/sparc:allmodconfig,allyesconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(wiznet Kconfig fallout)
> =A0 =A0 =A0 =A0i386:allmodconfig
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(GPL-incompatible module rc5t583-regul=
ator.ko uses GPL-only symbol)
>
> Note: The randconfig fails are only listed once and not tracked
> in the below listing.
>
> I'm also not tracking the kallsyms extra pass stuff on ARM on
> a per board basis anymore. =A0It has nothing to do with the board.
> Why? See: =A0http://marc.info/?l=3Dlinux-next&m=3D133267456809502
>
> =A0 =A0 =A0 =A0 =A0 =A0----------------------------------------------=
--
>
> Latest results at:
> =A0 =A0 =A0 =A0http://kisskb.ellerman.id.au/kisskb/branch/9/
>
> Failures as of April 12th, 2012:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> AM33:asb2303_defconfig,asb2364_defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 15
> =A0 =A0 =A0 =A0why: =A0 =A0cc1: error: unrecognized command line opti=
on '-mmem-funcs'
> =A0 =A0 =A0 =A0status: Possible fix from TonyB sent for review.
> =A0 =A0 =A0 =A0fix: =A0 =A0http://marc.info/?l=3Dlinux-kernel&m=3D133=
185020313818&w=3D2
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5878400/
> ----------------
>
> ARM:u8500_defconfig
> =A0 =A0 =A0 =A0when: =A0 Apr 11
> =A0 =A0 =A0 =A0why: =A0 =A0ste_dma40.c: implicit declaration of funct=
ion 'regulator_disable'
> =A0 =A0 =A0 =A0status: reported
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://marc.info/?l=3Dlinux-next&m=3D13342=
8028418892&w=3D2
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6091624/
>
> ARM:netx_defconfig,pnx4008_defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 14
> =A0 =A0 =A0 =A0why: =A0 =A0net/core/pktgen.c: can't find a register i=
n class 'GENERAL_REGS'
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5869486/
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/13/670
>
> ARM:ixp4xx_defconfig
> =A0 =A0 =A0 =A0when: =A0 Oct 26
> =A0 =A0 =A0 =A0why: =A0 =A0gpio.h: implicit declaration of function '=
__gpio_get_value'
> =A0 =A0 =A0 =A0status: fixed (Imre Kaloz) - but possibly needs rework=
?
> =A0 =A0 =A0 =A0fix: =A0 =A0https://lkml.org/lkml/2012/2/8/288
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/8/287
>
> ARM:raumfeld_defconfig
> =A0 =A0 =A0 =A0when: =A0 Nov 23
> =A0 =A0 =A0 =A0why: =A0 =A0eeti_ts.c: implicit declaration of functio=
n 'irq_to_gpio'
> =A0 =A0 =A0 =A0status: perhaps broken since 2010? =A0See ref below.
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://www.gossamer-threads.com/lists/linu=
x/kernel/1291618?do=3Dpost_view_threaded#1291618
>
> ARM:arm-allnoconfig
> =A0 =A0 =A0 =A0when: =A0 forever
> =A0 =A0 =A0 =A0why: =A0 =A0not supported
> =A0 =A0 =A0 =A0status: nothing pending, but patches accepted
> =A0 =A0 =A0 =A0fix: =A0 =A0n/a
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2009/4/30/105
> =A0 =A0 =A0 =A0ref: =A0 =A0http://lists.infradead.org/pipermail/linux=
-arm-kernel/2012-January/081218.html
> ----------------
>
> AVR32:allnoconfig
> =A0 =A0 =A0 =A0when: =A0 May 26 2010, 20:49
> =A0 =A0 =A0 =A0why: =A0 =A0at32_map_usart: undefined reference to `at=
mel_default_console_device'
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref:
> ---------------
>
> bfin: 50% of builds
> =A0 =A0 =A0 =A0when: =A0 Mar 31
> =A0 =A0 =A0 =A0why: =A0 =A0"Error: pcrel too far BFD_RELOC_BFIN_10" f=
rom kernel/time/timekeeping.c
> =A0 =A0 =A0 =A0status: unknown, binutils issue?
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6087324/
> ---------------
>
> cris:allyesconfig,allmodconfig
> =A0 =A0 =A0 =A0when: =A0 Apr 3
> =A0 =A0 =A0 =A0why: =A0 =A0too many to list here
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6035250/
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6035249/
> ----------------
>
> frv:defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 15
> =A0 =A0 =A0 =A0why: =A0 =A0undefined reference to `pci_cardbus_resour=
ce_alignment'
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6030067/
> ----------------
>
> i386:allmodconfig
> =A0 =A0 =A0 =A0when: =A0 Apr 11
> =A0 =A0 =A0 =A0why: =A0 =A0"rc5t583_ext_power_req_config" [drivers/re=
gulator/rc5t583-regulator.ko] undefined!
> =A0 =A0 =A0 =A0why: =A0 =A0"__udivdi3" [drivers/net/ethernet/mellanox=
/mlx4/mlx4_en.ko] undefined!
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/6091475/
> ----------------
>
> h8300:defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 15
> =A0 =A0 =A0 =A0why: =A0 =A0time.c: implicit declaration of function '=
get_irq_regs'
> =A0 =A0 =A0 =A0why: =A0 =A0also seems gcc suffers an ICE
> =A0 =A0 =A0 =A0status: ICE bug lodged with gcc folks (TonyB)
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D52598
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5884668/
> ----------------
>
> m32r:m32700ut.smp_defconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 15
> =A0 =A0 =A0 =A0why: =A0 =A0No rule to make target `arch/m32r/boot/com=
pressed/vmlinux.bin
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5884670/
> ----------------
>
> m68k:allmodconfig
> =A0 =A0 =A0 =A0when: =A0 Mar 16
> =A0 =A0 =A0 =A0why: =A0 =A0persistent_ram.c: implicit declaration of =
'memblock_reserve'
> =A0 =A0 =A0 =A0status:
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5884324/
> =A0 =A0 =A0 =A0ref: =A0 =A0http://www.spinics.net/lists/linux-next/ms=
g19343.html
> ----------------
>
> mips:allmodconfig
> =A0 =A0 =A0 =A0when:
> =A0 =A0 =A0 =A0why: =A0 =A0driver_pci_host.c: implicit declaration of=
 function 'pcibios_enable_device'
> =A0 =A0 =A0 =A0status: one of many fixes mips needs...
> =A0 =A0 =A0 =A0fix: =A0 =A0http://marc.info/?l=3Dlinux-wireless&m=3D1=
33272031621916&w=3D2
> =A0 =A0 =A0 =A0ref: =A0 =A0http://patchwork.ozlabs.org/patch/148614/
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5807000/
> ----------------
>
> parisc:allmodconfig
> =A0 =A0 =A0 =A0when:
> =A0 =A0 =A0 =A0why: =A0 =A0include/linux/log2.h: implicit declaration=
 of function 'fls'
> =A0 =A0 =A0 =A0status: reported by PaulG, WIP by David Howells
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/29/409
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/6/228
>
> parisc64:a500_defconfig
> =A0 =A0 =A0 =A0when:
> =A0 =A0 =A0 =A0why: =A0 =A0include/linux/log2.h: implicit declaration=
 of function 'fls'
> =A0 =A0 =A0 =A0status: reported by PaulG, WIP by David Howells
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/2/29/409
> =A0 =A0 =A0 =A0ref: =A0 =A0https://lkml.org/lkml/2012/3/6/228
> ------------------
>
> powerpc:allyesconfig
> =A0 =A0 =A0 =A0when: =A0 May 18 2009, 22:11
> =A0 =A0 =A0 =A0why: =A0 =A0fat ass kernel with everything simply won'=
t link
> =A0 =A0 =A0 =A0status: need to fix build config to ignore the final l=
ink
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildr=
esult/5806793/
> ------------------
>
> um:um-defconfig
> =A0 =A0 =A0 =A0when: =A0 Sep 16 2010, 01:28
> =A0 =A0 =A0 =A0why: =A0 =A0os-Linux/start_up.c: error: 'PTRACE_SETOPT=
IONS' undeclared
> =A0 =A0 =A0 =A0status: clearly broken forever, so does anyone care?
> =A0 =A0 =A0 =A0fix:
> =A0 =A0 =A0 =A0ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/target=
/2979/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
