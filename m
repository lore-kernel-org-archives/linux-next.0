From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 23
Date: Thu, 23 Jun 2016 17:03:05 +1000
Message-ID: <20160623170305.3827d63c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50466 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751454AbcFWHDI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2016 03:03:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160622:

The pci tree gained a conflict against Linus' tree.

The sunxi tree gained a conflict against the drm-misc tree.

The audit tree gained a conflict against the security tree.

Non-merge commits (relative to Linus' tree): 5152
 4945 files changed, 228135 insertions(+), 97006 deletions(-)

-----------------------------------------------------------------------=
-----

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pul=
l"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc and an allmodconfig (with
CONFIG_BUILD_DOCSRC=3Dn) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(this fails its final link) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 234 trees (counting Linus' and 34 trees of patch=
es
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to a=
dd
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (f9020d17416a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging fixes/master (5edb56491d48 Linux 4.7-rc3)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize export=
ed variables)
Merging arc-current/for-curr (5edb56491d48 Linux 4.7-rc3)
Merging arm-current/fixes (56530f5d2ddc ARM: 8579/1: mm: Fix definition=
 of pmd_mknotpresent)
Merging m68k-current/for-linus (9a6462763b17 m68k/mvme16x: Include gene=
ric <linux/rtc.h>)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_c=
ached build errors)
Merging powerpc-fixes/fixes (8550e2fa34f0 powerpc/mm/hash: Use the corr=
ect PPP mask when updating HPTE)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (6b15d6650c53 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/davem/net)
Merging net/master (acd43fe85b2d Merge branch 'mlx4-fixes')
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (50219538ffc0 vmxnet3: segCnt can be 1 for LRO pack=
ets)
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from at=
h.git)
Merging mac80211/master (3d5fdff46c4b wext: Fix 32 bit iwpriv compatibi=
lity issue with 64 bit Kernel)
Merging sound-current/for-linus (c9058d43d994 ALSA: hda/tegra: iomem fi=
xups for sparse warnings)
Merging pci-current/for-linus (ef0dab4aae14 PCI: Fix unaligned accesses=
 in VC code)
Merging driver-core.current/driver-core-linus (e80dac114c63 Merge tag '=
usb-4.7-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/us=
b)
Merging tty.current/tty-linus (33688abb2802 Linux 4.7-rc4)
Merging usb.current/usb-linus (33688abb2802 Linux 4.7-rc4)
Merging usb-gadget-fixes/fixes (50c763f8c1ba usb: dwc3: Set the ClearPe=
ndIN bit on Clear Stall EP command)
Merging usb-serial-fixes/usb-linus (33688abb2802 Linux 4.7-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common:=
 otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (df013212a1b6 Merge tag 'iio-fixe=
s-for-4.7b' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio =
into staging-linus)
Merging char-misc.current/char-misc-linus (e80dac114c63 Merge tag 'usb-=
4.7-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging input-current/for-linus (30172936eefb MAINTAINERS: add Pali Roh=
=C3=A1r as reviewer of ALPS PS/2 touchpad driver)
Merging crypto-current/master (19ced623db2f crypto: ux500 - memmove the=
 right size)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/davem/ide)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/ka=
llsyms vs module insertion race.)
Merging vfio-fixes/for-linus (ce7585f3c4d7 vfio/pci: Allow VPD short re=
ad)
Merging kselftest-fixes/fixes (f80eb4289491 selftests/exec: Makefile is=
 a run-time dependency, add it to the install list)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pw=
m: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch=
 tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (59461c018204 mfd: max77620: Fix FPS sw=
itch statements)
Merging drm-intel-fixes/for-linux-next-fixes (1e3fa0acfec6 drm/i915/fbc=
: Disable on HSW by default for now)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat sys=
call from default list)
Merging arc/for-next (5edb56491d48 Linux 4.7-rc3)
Merging arm/for-next (f07617e99523 Merge branches 'component', 'fixes' =
and 'misc' into for-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose =
CHAIN event in sysfs)
Merging arm-soc/for-next (ea371ddc86ff ARM: SoC: Document merges)
Merging amlogic/for-next (00b3dbd4ccce Merge branch 'v4.7/deps/external=
' into tmp/aml-reset)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' =
of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at=
91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-6=
4-next into for-next)
Merging berlin/berlin/for-next (1a695a905c18 Linux 4.7-rc1)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,de=
vice compatible strings)
Merging imx-mxs/for-next (b2f6951491c7 Merge branch 'imx/defconfig' int=
o for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' int=
o next)
Merging mvebu/for-next (56454a34f5d6 Merge branch 'mvebu/defconfig64' i=
nto mvebu/for-next)
Merging omap/for-next (6d319b7e94e9 Merge branch 'omap-for-v4.8/soc' in=
to for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _id=
le() hwmod state sanity check sequence)
Merging qcom/for-next (275804c07f41 firmware: qcom: scm: Peripheral Aut=
hentication Service)
Merging renesas/next (58ad5755a31c Merge branch 'heads/arm64-dt-for-v4.=
8' into next)
Merging rockchip/for-next (3c77879bcab7 Merge branch 'v4.8-armsoc/dts64=
' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (87c76faf017f Merge branch 'next/drivers'=
 into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (7c7a0b23a909 Merge branch for-4.8/arm64 into fo=
r-next)
Merging arm64/for-next/core (d770b5a04790 Revert "arm64: Add support AR=
CH_SUPPORTS_INT128")
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk=
 clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h head=
er)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in arc=
hitecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file =
to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c =
compile error")
Merging ia64/next (70f4f9352317 ia64: efi: use timespec64 for persisten=
t clock)
Merging m68k/for-next (9a6462763b17 m68k/mvme16x: Include generic <linu=
x/rtc.h>)
Merging m68knommu/for-next (33688abb2802 Linux 4.7-rc4)
Merging metag/for-next (592ddeeff8cb metag: Fix typos)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_ba=
se to fix link errors)
Merging mips/mips-for-linux-next (847e858f3d0e SSB: Change bare unsigne=
d to unsigned int to suit coding style)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependen=
cy to %.dtb target)
Merging parisc-hd/for-next (5975b2c0c10a Merge branch 'parisc-4.7-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc/next (9497a1c1c5b4 powerpc/powernv: Print correct PHB t=
ype names)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (1eef33bec12d powerpc/86xx: Fix PCI interrupt map defi=
nition)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the ma=
naged version of kzalloc)
Merging s390/features (63bf903583d7 Revert "s390/kdump: Clear subchanne=
l ID to signal non-CCW/SCSI IPL")
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (ca768667d873 tile 32-bit big-endian: fix bugs in s=
yscall argument order)
Merging uml/linux-next (a78ff1112263 um: add extended processor state s=
ave/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing pa=
rameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi varia=
nt)
Merging btrfs/next (c315ef8d9db7 Merge branch 'for-chris-4.7' of git://=
git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4=
=2E7)
Merging btrfs-kdave/for-next (8f4aa7bf64af Merge branch 'for-next-next-=
4.7-20160617' into for-next-20160617)
Merging ceph/master (f6973c09490c ceph: use i_version to check validity=
 of fscache)
Merging cifs/for-next (3bdc426e2497 cifs: dynamic allocation of ntlmssp=
 blob)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR=
_[RW]O definitions)
Merging ecryptfs/next (40f0fd372a62 ecryptfs: fix spelling mistakes)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (12735f881952 ext4: pre-zero allocated blocks for DAX =
IO)
Merging f2fs/dev (a2481adac819 f2fs: avoid latency-critical readahead o=
f node pages)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's =
primary_index if registering failed)
Merging fuse/for-next (507c552aa58f fuse: improve aio directIO write pe=
rformance for size extending writes)
Merging gfs2/for-next (1e875f5a95a2 gfs2: Initialize iopen glock holder=
 for new inodes)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (2e96ce77ba0a Merge branch 'writeback')
Merging nfsd/nfsd-next (ee8f2a36a99c nfsd: allow nfsd to advertise mult=
iple layout types)
Merging orangefs/for-next (2dcd0af568b0 Linux 4.6)
Merging overlayfs/overlayfs-next (f920c41f047a ovl: move some common co=
de in a function)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather tha=
n spinlock)
Merging ubifs/linux-next (4ac1c17b2044 UBIFS: Implement ->migratepage()=
)
Merging xfs/for-next (f477cedc4e79 Merge branch 'xfs-4.8-misc-fixes-2' =
into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patche=
s from Andrew))
Merging vfs/for-next (1eb82bc8e712 Merge branch 'for-linus' into for-ne=
xt)
Merging pci/next (c8a6cb73aefa Merge branch 'pci/resource' into next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging pstore/for-next/pstore (35da60941e44 pstore/ram: add Device Tre=
e bindings)
Merging hid/for-next (02dc1efc8e62 Merge branch 'for-4.8/i2c-hid' into =
for-next)
Merging i2c/i2c/for-next (d86a4c24d68e Merge branch 'i2c/for-current' i=
nto i2c/for-next)
Merging jdelvare-hwmon/master (18c358ac5e32 Documentation/hwmon: Update=
 links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9=
 System Slots)
Merging hwmon-staging/hwmon-next (d4db8217f4b7 hwmon: (dell-smm) In deb=
ug mode log duration of SMM calls)
Merging v4l-dvb/master (2ed52999aaf3 Merge branch 'patchwork' into to_n=
ext)
Merging pm/linux-next (8251efc372e0 Merge branch 'acpi-thermal' into li=
nux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (2c5ce98e1e83 thermal: sysfs: add comments describ=
ing locking strategy)
Merging thermal-soc/next (ddc8fdc6e2f0 Merge branch 'work-fixes' into w=
ork-next)
CONFLICT (add/add): Merge conflict in drivers/thermal/tango_thermal.c
CONFLICT (content): Merge conflict in drivers/thermal/rockchip_thermal.=
c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval=
 with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make=
_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h =
standalone includible)
Merging slave-dma/next (73a14400c949 Merge branch 'topic/xilinx' into n=
ext)
Merging net-next/master (b95e5928fcc7 openvswitch: Add packet len info =
to upcall.)
CONFLICT (content): Merge conflict in tools/virtio/ringtest/Makefile
CONFLICT (content): Merge conflict in net/rds/tcp_listen.c
CONFLICT (content): Merge conflict in net/rds/tcp_connect.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/qlogic/qed/q=
ed_hsi.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.=
dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2-=
svk.dts
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic count=
er on inner mode error)
Merging ipvs-next/master (625b44fc15f8 ipvs: count pre-established TCP =
states as active)
Merging wireless-drivers-next/master (1bb57c8a5e33 Merge ath-next from =
ath.git)
Merging bluetooth/master (0e9390ebf1fe Merge branch 'mlxsw-next')
Merging mac80211-next/master (e69f73bfecb0 Merge branch 'remove-qdisc-t=
hrottle')
Merging rdma/for-next (61c78eea9516 IB/IPoIB: Don't update neigh validi=
ty for unresolved entries)
Merging rdma-leon/rdma-next (33688abb2802 Linux 4.7-rc4)
Merging rdma-leon-test/testing/rdma-next (8d5a226336a1 Merge branch 'to=
pic/xrq-api' into testing/rdma-next)
Merging mtd/master (becc7ae544c6 MAINTAINERS: Add file patterns for mtd=
 device tree bindings)
Merging l2-mtd/master (95193796256c mtd: m25p80: read in spi_max_transf=
er_size chunks)
Merging nand/nand/next (ba6f6d603b45 mtd: nandbiterrs: Support for NAND=
 biterrors test on platforms without raw write)
Merging crypto/master (01ac94580ac2 crypto: drbg - fix an error code in=
 drbg_init_sym_kernel())
Merging drm/drm-next (a0877f520352 Merge tag 'topic/drm-misc-2016-06-15=
' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_displa=
y.c
Merging drm-panel/drm/panel/for-next (f103b93d90c2 drm/dsi: Add uevent =
callback)
Merging drm-intel/for-linux-next (64989ca4b27a drm/i915: Refresh cached=
 DP port register value on resume)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_fbc.c
Merging drm-tegra/drm/tegra/for-next (057eab2013ec MAINTAINERS: Remove =
Terje Bergstr=C3=B6m as Tegra DRM maintainer)
Merging drm-misc/topic/drm-misc (f510f34c12f6 drm/vc4: Remove unused co=
nnector)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2b669875332f drm/msm: Drop load/unload drm_dr=
iver ops)
Merging hdlcd/for-upstream/hdlcd (f6c68b4bd4a9 drm: hdlcd: Add informat=
ion about the underlying framebuffers in debugfs)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add ent=
ry for Mali-DP driver)
Merging sunxi/sunxi/for-next (b7e7559f439c Merge branches 'sunxi/clk-fi=
xes-for-4.7', 'sunxi/dt-for-4.8' and 'sunxi/fixes-for-4.7' into sunxi/f=
or-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sun4i/sun4i_drv.c
Merging kbuild/for-next (7e01dad0469b Merge branch 'kbuild/kbuild' into=
 kbuild/for-next)
Applying: gcc-plugins: disable under COMPILE_TEST
Merging kspp/for-next/kspp (20f0992c935f latent_entropy: Add the extra_=
latent_entropy kernel parameter)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace r=
epeat count after "tristate")
Merging regmap/for-next (e568f95409ca Merge remote-tracking branches 'r=
egmap/topic/i2c', 'regmap/topic/irq' and 'regmap/topic/maintainers' int=
o regmap-next)
Merging sound/for-next (3915bf294652 ALSA: seq_timer: use monotonic tim=
es internally)
Merging sound-asoc/for-next (429d6433f544 Merge remote-tracking branch =
'asoc/topic/wm8985' into asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE=
_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (9096a45d99d0 Input: psmouse - use same format for s=
econdary devices as for primary)
Merging block/for-next (3cee5575153a Merge branch 'for-4.8/core' into f=
or-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in block/blk-lib.c
Merging lightnvm/for-next (2a65aee4011b lightnvm: reserved space calcul=
ation incorrect)
Merging device-mapper/for-next (0fe0a864be7f Merge branch 'dm-4.7' into=
 for-next)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic=
 when handling anonymous cards)
Merging mmc-uh/next (14c5283a54a5 mmc: sdhci: use pr_err for sdhci_dump=
regs)
Merging md/for-next (d787be4092e2 md: reduce the number of synchronize_=
rcu() calls when multiple devices fail.)
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/raid1.c
Merging mfd/for-mfd-next (1cf9326d4c07 mfd: max14577: Allow driver to b=
e built as a module)
Merging backlight/for-backlight-next (4db8c9572ce1 backlight: lp855x: A=
dd enable regulator)
Merging battery/master (2e05b518c897 power_supply: bq27xxx_battery: Gro=
up register mappings into one table)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instea=
d of checking for built-in or module)
Merging regulator/for-next (2ba439344fde Merge remote-tracking branches=
 'regulator/topic/qcom-smd' and 'regulator/topic/twl' into regulator-ne=
xt)
Merging security/next (26703c636c1f um/ptrace: run seccomp after ptrace=
)
Merging integrity/next (848b134bf8e7 ima: extend the measurement entry =
specific pcr)
Merging keys/keys-next (75aeddd12f20 MAINTAINERS: Update keyrings recor=
d and add asymmetric keys record)
Merging selinux/next (309c5fad5de4 selinux: fix type mismatch)
Merging tpmdd/next (3051e8c00764 tpm_crb: fix address space of the retu=
rn pointer in crb_map_res())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/vendor-prefixes.txt
Merging watchdog/master (1a695a905c18 Linux 4.7-rc1)
Merging iommu/next (8d16cf6b773d Merge branches 'iommu/fixes', 'x86/amd=
', 'x86/vt-d' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/=
intel-iommu)
Merging vfio/next (f70552809419 vfio_pci: Test for extended capabilitie=
s if config space > 256 bytes)
Merging jc_docs/docs-next (8569de68e79e docs: kernel-doc: Add "example"=
 and "note" to the magic section types)
Merging trivial/for-next (dcc381e8330e fat: fix typo s/supeblock/superb=
lock/)
Merging audit/next (bba696c2c083 s390: ensure that syscall arguments ar=
e properly masked on s390)
CONFLICT (content): Merge conflict in arch/s390/kernel/ptrace.c
Merging devicetree/for-next (06dfeef88573 drivers: of: add definition o=
f early_init_dt_alloc_reserved_memory_arch)
Merging mailbox/mailbox-for-next (9ef3c5112139 mailbox: mailbox-test: s=
et tdev->signal to NULL after freeing)
Merging spi/for-next (32b805cdb668 Merge remote-tracking branches 'spi/=
topic/pxa2xx', 'spi/topic/rockchip', 'spi/topic/sh-msiof' and 'spi/topi=
c/sunxi' into spi-next)
Merging tip/auto-latest (f6e78bb49b4b Merge branch 'perf/core')
Merging clockevents/clockevents/next (5a634113ad0e Merge branch 'clocke=
vents/compile-test' into clockevents/next)
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM wid=
th on Ivy Bridge and Haswell)
Merging edac-amd/for-next (bba142957e04 EDAC: Correct channel count lim=
it)
Merging irqchip/irqchip/for-next (d46fe981bead Merge branch 'irqchip/as=
peed' into irqchip/for-next)
Merging ftrace/for-next (97f8827a8c79 ftracetest: Use proper logic to f=
ind process PID)
Merging rcu/rcu/next (2f939e1fc208 rcu: Use rcu_gp_kthread_wake() to wa=
ke up grace period kthreads again)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Applying: rcu: merge fix for kernel/rcu/tree_exp.h
Merging kvm/linux-next (8ff7b956471f Merge tag 'kvm-s390-next-4.8-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/s390/hypfs/hypfs_diag.c
Applying: s390: fix merge conflict in arch/s390/kvm/kvm-s390.c
Applying: s390: merge fix up for __diag204 move
Merging kvm-arm/next (35a2d58588f0 KVM: arm/arm64: vgic-new: Synchroniz=
e changes to active state)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct wi=
dth in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b1a4286b8f33 KVM: PPC: Book3S HV: =
Re-enable XICS fast path for irqfd-generated interrupts)
Merging kvms390/next (a411edf1320e KVM: s390: vsie: add module paramete=
r "nested")
Merging xen-tip/linux-next (bdadcaf2a7c1 xen: remove incorrect forward =
declaration)
Merging percpu/for-next (6710e594f71c percpu: fix synchronization betwe=
en synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affini=
ty of unbound worker threads)
Merging drivers-x86/for-next (ab9bb11ccbaa dell-wmi: Add a WMI event co=
de for display on/off)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome:=
 chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (ea12c45f1b36 hsi: Only descend into hsi directory=
 when CONFIG_HSI is set)
Merging leds/for-next (a8b8c8d67557 leds: Only descend into leds direct=
ory when CONFIG_NEW_LEDS is set)
Merging ipmi/for-next (4e80ad011c9c ipmi: Remove smi_msg from waiting_r=
cv_msgs list before handle_one_recv_msg())
Merging driver-core/driver-core-next (5edb56491d48 Linux 4.7-rc3)
Merging tty/tty-next (33688abb2802 Linux 4.7-rc4)
Merging usb/usb-next (aa5e94a2e133 Revert "usb: ohci-at91: Forcibly sus=
pend ports while USB suspend")
Merging usb-gadget/next (1d23d16a88e6 usb: gadget: pch_udc: reorder spi=
n_[un]lock to avoid deadlock)
Merging usb-serial/usb-next (33688abb2802 Linux 4.7-rc4)
Merging usb-chipidea-next/ci-for-usb-next (ebfad91c5da3 dt-bindings: ci=
-hdrc-usb2: s/gadget-itc-setting/itc-setting in example)
Merging staging/staging-next (9936913e549b staging: lustre: quiet lockd=
ep recursive lock warning)
CONFLICT (modify/delete): drivers/staging/lustre/lustre/llite/lloop.c d=
eleted in staging/staging-next and modified in HEAD. Version HEAD of dr=
ivers/staging/lustre/lustre/llite/lloop.c left in tree.
CONFLICT (modify/delete): drivers/staging/android/sync.h deleted in sta=
ging/staging-next and modified in HEAD. Version HEAD of drivers/staging=
/android/sync.h left in tree.
$ git rm -f drivers/staging/lustre/lustre/llite/lloop.c drivers/staging=
/android/sync.h
Applying: staging/android: merge fix up for sync.h renaming
Merging char-misc/char-misc-next (c0ff9019ee64 mei: drop wr_msg from th=
e mei_dev structure)
Merging extcon/extcon-next (70a7da458712 Merge branch 'ib-extcon-powers=
upply-4.8' into extcon-next)
Merging cgroup/for-next (ba4b8079e034 Merge branch 'for-4.8' into for-n=
ext)
Merging scsi/for-next (09aa8c2f3963 Merge branch 'misc' into for-next)
Merging target-updates/for-next (8f0dfb3d8b11 iscsi-target: Fix early s=
k_data_ready LOGIN_FLAGS_READY race)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig=
 and Makefile)
Merging libata/for-next (da780c64d2b6 Merge branch 'for-4.7-fixes' into=
 for-next)
Merging pinctrl/for-next (3ee9dbbdd06b Merge branch 'devel' into for-ne=
xt)
Merging vhost/linux-next (139ab4d4e68b tools/virtio: add noring tool)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODUL=
E_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (ef583d362047 Merge branch 'rproc-next' into for=
-next)
Merging gpio/for-next (c35285cb1570 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (318480569156 pwm: lpss: pci: Enable PWM module on=
 Intel Edison)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/pwm/pwm-tiehrpwm.txt
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconf=
ig description for Sync Files)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FO=
WNER in userns)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (b6f4f1f2c6da Merge tag 'clk-samsung-4.8' of git:/=
/linuxtv.org/snawrocki/samsung into clk-next)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1a695a905c18 Linux 4.7-rc1)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and =
min inode times)
Merging luto-misc/next (6436d4c1a83c x86/vdso: Fail the build if the vd=
so image has no dynamic section)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core'=
 into for-next)
Merging coresight/next (7c8cd269d93e coresight: Add better messages for=
 coresight_timeout)
Merging rtc/rtc-next (c361db5c2c64 x86: include linux/ratelimit.h in nm=
i.c)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb=
 in regmap_field)
Merging nvdimm/libnvdimm-for-next (36092ee8ba69 Merge branch 'for-4.7/d=
ax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protect=
ion)
Merging akpm-current/current (262ebac6fd7b ipc/msg.c: use freezable blo=
cking call)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in ipc/sem.c
CONFLICT (content): Merge conflict in arch/arm64/mm/dma-mapping.c
CONFLICT (modify/delete): arch/arm/configs/bcm_defconfig deleted in HEA=
D and modified in akpm-current/current. Version akpm-current/current of=
 arch/arm/configs/bcm_defconfig left in tree.
$ git rm -f arch/arm/configs/bcm_defconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min()=
 expression
Applying: drivers/fpga/Kconfig: fix build failure
Applying: tree-wide: replace config_enabled() with IS_ENABLED()
Applying: include/linux/bitmap.h: cleanup
Merging akpm/master (7d11873f1dc2 include/linux/bitmap.h: cleanup)
