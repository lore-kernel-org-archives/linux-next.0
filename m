From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the 52xx-and-virtex tree with the
	tree
Date: Tue, 15 Dec 2009 11:38:47 -0700
Message-ID: <fa686aa40912151038o13b5fd60icbfd28f225a2c6d4@mail.gmail.com>
References: <20091215103117.dab34f72.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f187.google.com ([209.85.210.187]:52697 "EHLO
	mail-yx0-f187.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755075AbZLOSjH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 13:39:07 -0500
In-Reply-To: <20091215103117.dab34f72.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Linus <torvalds@linux-foundation.org>

On Mon, Dec 14, 2009 at 4:31 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the 52xx-and-virtex tree got a conflict i=
n
> arch/powerpc/mm/fsl_booke_mmu.c between commit
> 8b27f0b61db57f5555fc2d3fc95c3ea9fd1a9d6c ("powerpc/fsl-booke: Rework =
TLB
> CAM code") from Linus' tree and commit
> ae4cec4736969ec2196a6bbce4ab263ff7cb7eef ("powerpc: fix up for
> mmu_mapin_ram api change") from the 52xx-and-virtex tree.
>
> I fixed it up (see below) and can carry the fix for a while. =A0Grant=
, you
> can (of course) fix this by merging with Linus' tree. =A0(Or Linus, i=
f you
> merge Grant's tree, I think this fixup is correct).

Yup, this looks like the correct fix to me.  I came out to the same
result when I merged.  I've also build tested for booke.

Linus, I've done a trial merge and pushed it out to the next-resolved
branch on my tree (pull req below).  You can either use my previous
pull request and fix it up yourself or use this one:

The following changes since commit 8bea8672edfca7ec5f661cafb218f1205863=
b343:
  Stephen Rothwell (1):
        mfd: compile fix for twl4030 renaming

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 next-resolved

Albert Herranz (22):
      powerpc: gamecube/wii: usbgecko bootwrapper console support
      powerpc: gamecube: device tree
      powerpc: gamecube: bootwrapper bits
      powerpc: gamecube/wii: introduce GAMECUBE_COMMON
      powerpc: gamecube/wii: declare as non-coherent platforms
      powerpc: gamecube/wii: do not include PCI support
      powerpc: gamecube/wii: udbg support for usbgecko
      powerpc: gamecube/wii: flipper interrupt controller support
      powerpc: gamecube: platform support
      powerpc: gamecube: default config
      powerpc: wii: device tree
      powerpc: wii: bootwrapper bits
      powerpc: broadway processor support
      powerpc: wii: hollywood interrupt controller support
      powerpc: wii: platform support
      powerpc: wii: default config
      powerpc: reserve fixmap entries for early debug
      powerpc: gamecube/wii: early debugging using usbgecko
      wii: bootwrapper: add fixup to calc useable mem2
      wii: use both mem1 and mem2 as ram
      powerpc: allow ioremap within reserved memory regions
      powerpc: wii: allow ioremap within the memory hole

Grant Likely (1):
      powerpc: Merge Nintendo branch with Linus' tree to resolve merge =
conflicts

Stephen Rothwell (1):
      powerpc: fix up for mmu_mapin_ram api change

 .../powerpc/dts-bindings/nintendo/gamecube.txt     |  109 ++
 .../powerpc/dts-bindings/nintendo/wii.txt          |  184 +++
 arch/powerpc/Kconfig                               |    2 +-
 arch/powerpc/Kconfig.debug                         |    8 +
 arch/powerpc/boot/Makefile                         |    7 +-
 arch/powerpc/boot/dts/gamecube.dts                 |  114 ++
 arch/powerpc/boot/dts/wii.dts                      |  218 +++
 arch/powerpc/boot/gamecube-head.S                  |  111 ++
 arch/powerpc/boot/gamecube.c                       |   35 +
 arch/powerpc/boot/ugecon.c                         |  147 ++
 arch/powerpc/boot/ugecon.h                         |   24 +
 arch/powerpc/boot/wii-head.S                       |  142 ++
 arch/powerpc/boot/wii.c                            |  158 +++
 arch/powerpc/boot/wrapper                          |    4 +
 arch/powerpc/configs/gamecube_defconfig            | 1061 ++++++++++++=
+++
 arch/powerpc/configs/wii_defconfig                 | 1406 ++++++++++++=
++++++++
 arch/powerpc/include/asm/fixmap.h                  |    3 +
 arch/powerpc/include/asm/udbg.h                    |    1 +
 arch/powerpc/kernel/cputable.c                     |    6 +-
 arch/powerpc/kernel/head_32.S                      |   25 +
 arch/powerpc/kernel/udbg.c                         |    2 +
 arch/powerpc/mm/40x_mmu.c                          |    2 +-
 arch/powerpc/mm/44x_mmu.c                          |    2 +-
 arch/powerpc/mm/fsl_booke_mmu.c                    |    2 +-
 arch/powerpc/mm/init_32.c                          |    9 +
 arch/powerpc/mm/mmu_decl.h                         |   17 +-
 arch/powerpc/mm/pgtable_32.c                       |   36 +-
 arch/powerpc/mm/ppc_mmu_32.c                       |    4 +-
 arch/powerpc/platforms/Kconfig.cputype             |    2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig         |   33 +
 arch/powerpc/platforms/embedded6xx/Makefile        |    4 +
 arch/powerpc/platforms/embedded6xx/flipper-pic.c   |  263 ++++
 arch/powerpc/platforms/embedded6xx/flipper-pic.h   |   25 +
 arch/powerpc/platforms/embedded6xx/gamecube.c      |  118 ++
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c      |  241 ++++
 arch/powerpc/platforms/embedded6xx/hlwd-pic.h      |   22 +
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c |  328 +++++
 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.h |   32 +
 arch/powerpc/platforms/embedded6xx/wii.c           |  268 ++++
 include/linux/lmb.h                                |    1 +
 lib/lmb.c                                          |    7 +-
 41 files changed, 5161 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/powerpc/dts-bindings/nintendo/gamecub=
e.txt
 create mode 100644 Documentation/powerpc/dts-bindings/nintendo/wii.txt
 create mode 100644 arch/powerpc/boot/dts/gamecube.dts
 create mode 100644 arch/powerpc/boot/dts/wii.dts
 create mode 100644 arch/powerpc/boot/gamecube-head.S
 create mode 100644 arch/powerpc/boot/gamecube.c
 create mode 100644 arch/powerpc/boot/ugecon.c
 create mode 100644 arch/powerpc/boot/ugecon.h
 create mode 100644 arch/powerpc/boot/wii-head.S
 create mode 100644 arch/powerpc/boot/wii.c
 create mode 100644 arch/powerpc/configs/gamecube_defconfig
 create mode 100644 arch/powerpc/configs/wii_defconfig
 create mode 100644 arch/powerpc/platforms/embedded6xx/flipper-pic.c
 create mode 100644 arch/powerpc/platforms/embedded6xx/flipper-pic.h
 create mode 100644 arch/powerpc/platforms/embedded6xx/gamecube.c
 create mode 100644 arch/powerpc/platforms/embedded6xx/hlwd-pic.c
 create mode 100644 arch/powerpc/platforms/embedded6xx/hlwd-pic.h
 create mode 100644 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.c
 create mode 100644 arch/powerpc/platforms/embedded6xx/usbgecko_udbg.h
 create mode 100644 arch/powerpc/platforms/embedded6xx/wii.c


> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/powerpc/mm/fsl_booke_mmu.c
> index fcfcb6e,6da4b90..0000000
> --- a/arch/powerpc/mm/fsl_booke_mmu.c
> +++ b/arch/powerpc/mm/fsl_booke_mmu.c
> @@@ -172,44 -148,27 +172,44 @@@ static void settlbcam(int index, unsi=
gn
> =A0 =A0 =A0 =A0loadcam_entry(index);
> =A0}
>
> =A0-void invalidate_tlbcam_entry(int index)
> =A0-{
> =A0- =A0 =A0 =A0TLBCAM[index].MAS0 =3D MAS0_TLBSEL(1) | MAS0_ESEL(ind=
ex);
> =A0- =A0 =A0 =A0TLBCAM[index].MAS1 =3D ~MAS1_VALID;
> =A0-
> =A0- =A0 =A0 =A0loadcam_entry(index);
> =A0-}
> =A0-
> =A0-unsigned long __init mmu_mapin_ram(unsigned long top)
> =A0+unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx)
> =A0{
> =A0+ =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0unsigned long virt =3D PAGE_OFFSET;
> =A0 =A0 =A0 =A0phys_addr_t phys =3D memstart_addr;
> =A0+ =A0 =A0 =A0unsigned long amount_mapped =3D 0;
> =A0+ =A0 =A0 =A0unsigned long max_cam =3D (mfspr(SPRN_TLB1CFG) >> 16)=
 & 0xf;
> =A0+
> =A0+ =A0 =A0 =A0/* Convert (4^max) kB to (2^max) bytes */
> =A0+ =A0 =A0 =A0max_cam =3D max_cam * 2 + 10;
>
> =A0- =A0 =A0 =A0while (tlbcam_index < ARRAY_SIZE(cam) && cam[tlbcam_i=
ndex]) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0settlbcam(tlbcam_index, virt, phys, c=
am[tlbcam_index], PAGE_KERNEL_X, 0);
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0virt +=3D cam[tlbcam_index];
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0phys +=3D cam[tlbcam_index];
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0tlbcam_index++;
> =A0+ =A0 =A0 =A0/* Calculate CAM values */
> =A0+ =A0 =A0 =A0for (i =3D 0; ram && i < max_cam_idx; i++) {
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int camsize =3D __ilog2(ram)=
 & ~1U;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int align =3D __ffs(virt | p=
hys) & ~1U;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long cam_sz;
> =A0+
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (camsize > align)
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0camsize =3D align;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (camsize > max_cam)
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0camsize =3D max_cam;
> =A0+
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0cam_sz =3D 1UL << camsize;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0settlbcam(i, virt, phys, cam_sz, PAGE=
_KERNEL_X, 0);
> =A0+
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ram -=3D cam_sz;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0amount_mapped +=3D cam_sz;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0virt +=3D cam_sz;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0phys +=3D cam_sz;
> =A0 =A0 =A0 =A0}
> =A0+ =A0 =A0 =A0tlbcam_index =3D i;
> =A0+
> =A0+ =A0 =A0 =A0return amount_mapped;
> =A0+}
>
> - unsigned long __init mmu_mapin_ram(void)
> =A0- =A0 =A0 =A0return virt - PAGE_OFFSET;
> ++unsigned long __init mmu_mapin_ram(unsigned long top)
> =A0+{
> =A0+ =A0 =A0 =A0return tlbcam_addrs[tlbcam_index - 1].limit - PAGE_OF=
=46SET + 1;
> =A0}
>
> =A0/*
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
