From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 29
Date: Fri, 29 Jul 2016 14:47:22 +1000
Message-ID: <20160729144722.629fafd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47114 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751855AbcG2Er0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2016 00:47:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add material destined for v4.9 to your linux-next include=
d
branches until after v4.8-rc1 has been released.

Changes since 20160728:

The vfs tree gained a build failure due to an interaction with Linus'
tree.  I applied a merge fix patch.

The drm tree gained a conflict against Linus' tree.

The kbuild tree lost its build failure.

The akpm-current tree gained a conflict against the tip tree.

The akpm tree lost a patch that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 5788
 5096 files changed, 220273 insertions(+), 89980 deletions(-)

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

I am currently merging 240 trees (counting Linus' and 35 trees of patch=
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
Merging origin/master (884316deb4c9 Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging fixes/master (3fc9d690936f Merge branch 'for-4.8/drivers' of gi=
t://git.kernel.dk/linux-block)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize export=
ed variables)
Merging arc-current/for-curr (9bd54517ee86 arc: unwind: warn only once =
if DW2_UNWIND is disabled)
Merging arm-current/fixes (f6492164ecb1 ARM: 8577/1: Fix Cortex-A15 798=
181 errata initialization)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update def=
configs for v4.7-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_c=
ached build errors)
Merging powerpc-fixes/fixes (bfa37087aa04 powerpc: Initialise pci_io_ba=
se as early as possible)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (344e3c7734d5 sparc: serial: sunhv: fix a double l=
ock bug)
Merging net/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipsec/master (7677c7560c3e xfrm: get rid of another incorrect W=
ARN)
Merging netfilter/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from at=
h.git)
Merging mac80211/master (16a910a6722b cfg80211: handle failed skb alloc=
ation)
Merging sound-current/for-linus (0984d159c8ad sound: oss: Use kernel_re=
ad_file_from_path() for mod_firmware_load())
Merging pci-current/for-linus (ef0dab4aae14 PCI: Fix unaligned accesses=
 in VC code)
Merging driver-core.current/driver-core-linus (523d939ef98f Linux 4.7)
Merging tty.current/tty-linus (0e06f5c0deee Merge branch 'akpm' (patche=
s from Andrew))
Merging usb.current/usb-linus (e65805251f2d Merge branch 'irq-core-for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging usb-gadget-fixes/fixes (50c763f8c1ba usb: dwc3: Set the ClearPe=
ndIN bit on Clear Stall EP command)
Merging usb-serial-fixes/usb-linus (4c2e07c6a29e Linux 4.7-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common:=
 otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (0e06f5c0deee Merge branch 'akpm'=
 (patches from Andrew))
Merging char-misc.current/char-misc-linus (0e06f5c0deee Merge branch 'a=
kpm' (patches from Andrew))
Merging input-current/for-linus (080888286377 Merge branch 'next' into =
for-linus)
Merging crypto-current/master (64ec6ccb76e6 crypto: marvell - Update ca=
che with input sg only when it is unmapped)
Merging ide/master (d4f8c2e0f827 ide: missing break statement in set_ti=
mings_mdma())
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
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explic=
it reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (ed2eebbd61af drm/i915: ad=
d missing condition for committing planes on crtc)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat sys=
call from default list)
Merging arc/for-next (3925a16ae980 ARC: mm: don't loose PTE_SPECIAL in =
pte_modify())
Merging arm/for-next (bf9cb4359182 Merge branches 'component', 'cpuidle=
', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (9914c2a60844 arm-soc: document merge)
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/fe=
c.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.=
dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2-=
svk.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/apm/apm-shado=
wcat.dtsi
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Applying: clocksource/drivers/clps_711x: fixup for "ARM: clps711x: Swit=
ch to MULTIPLATFORM"
Merging amlogic/for-next (4d9b3db03bd4 Merge remote-tracking branch 'cl=
k/clk-s905' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' =
of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at=
91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-6=
4-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/d=
t' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,de=
vice compatible strings)
Merging imx-mxs/for-next (63a404a3f177 Merge branch 'imx/defconfig' int=
o for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' int=
o next)
Merging mvebu/for-next (feaf6b0beba8 Merge branch 'mvebu/defconfig64' i=
nto mvebu/for-next)
Merging omap/for-next (370c3261ba8a Merge branch 'omap-for-v4.8/soc' in=
to for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _id=
le() hwmod state sanity check sequence)
Merging qcom/for-next (289f9fb05d0c ARM: dts: msm8916: Add smsm and smp=
2p nodes)
Merging renesas/next (314a0bb0dd88 Merge branch 'heads/soc-fixes-for-v4=
=2E8' into next)
Merging rockchip/for-next (ebbfb5d5627d Merge branch 'v4.8-armsoc/dts64=
' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (253256f64294 Merge branch 'next/soc' int=
o for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (6083e0f837ac Merge branch for-4.8/arm64/defconf=
ig into for-next)
Merging arm64/for-next/core (fd6380b75065 arm64: arm: Fix-up the remova=
l of the arm64 regs_query_register_name() prototype)
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
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead =
a sema down/up combo)
Merging m68k/for-next (6bd80f372371 m68k/defconfig: Update defconfigs f=
or v4.7-rc2)
Merging m68knommu/for-next (33688abb2802 Linux 4.7-rc4)
Merging metag/for-next (fb2bb461e2d8 metag: Remove duplicate KERN_<LEVE=
L> prefix)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_ba=
se to fix link errors)
Merging mips/mips-for-linux-next (737a004afb2c Merge branch '4.7-fixes'=
 into mips-for-linux-next)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependen=
cy to %.dtb target)
Merging parisc-hd/for-next (5975b2c0c10a Merge branch 'parisc-4.7-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc/next (fbef66f0adcd powerpc/mm: Parenthesise IS_ENABLED(=
) in if condition)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be =
a positive number)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the ma=
naged version of kzalloc)
Merging s390/features (370fc4a8d9f8 s390/zcrypt: Fix zcrypt suspend/res=
ume behavior)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (0748d718ba7e sh: Delete unnecessary checks before =
the function call "mempool_destroy")
CONFLICT (content): Merge conflict in arch/sh/include/asm/spinlock.h
Applying: locking/spinlock, arch: merge fix for "sh: add J2 atomics usi=
ng the cas.l instruction"
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_Z=
ERO) pattern)
Merging uml/linux-next (a78ff1112263 um: add extended processor state s=
ave/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing pa=
rameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi varia=
nt)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after c=
opy_from_user faults)
Merging btrfs-kdave/for-next (d84c090ad3e9 Fixup: fs_info/root cleanups=
 and qgroups patches)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
Merging ceph/master (a0f2b6527541 ceph: fix symbol versioning for ceph_=
monc_do_statfs)
Merging cifs/for-next (7893242e2465 CIFS: Fix a possible invalid memory=
 access in smb2_query_symlink())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_need=
s_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the=
 lower fs doesn't support it)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (194dc870a589 Add braces to avoid "ambiguous =E2=80=98=
else=E2=80=99" compiler warnings)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig inform=
ation)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's =
primary_index if registering failed)
Merging fuse/for-next (d26034dfc1cc fuse: fix wrong assignment of ->fla=
gs in fuse_send_init())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to mo=
dules"
Merging gfs2/for-next (e1cb6be9e142 GFS2: Fix gfs2_replay_incr_blk for =
multiple journal sizes)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (698c937b0d17 NFSv4: Clean up lookup of SECINFO_=
NO_NAME)
Merging nfsd/nfsd-next (4b954bf8b629 nfsd: check that S_IFDIR implies d=
_can_lookup)
Merging orangefs/for-next (78fee0b6846f orangefs: fix namespace handlin=
g)
Merging overlayfs/overlayfs-next (e9c5d5a5b272 Revert "ovl: get_write_a=
ccess() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather tha=
n spinlock)
Merging ubifs/linux-next (4ac1c17b2044 UBIFS: Implement ->migratepage()=
)
Merging xfs/for-next (f2bdfda9a1c6 Merge branch 'xfs-4.8-misc-fixes-4' =
into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patche=
s from Andrew))
Merging vfs/for-next (38a8a5e62f9a Merge branch 'work.const-qstr' into =
for-next)
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Applying: qstr: unconstify fuse_reverse_inval_entry parameter
Merging pci/next (bef6d4c88706 Merge branch 'pci/msi-affinity' into nex=
t)
CONFLICT (content): Merge conflict in drivers/pci/host/pci-tegra.c
Merging pstore/for-next/pstore (35da60941e44 pstore/ram: add Device Tre=
e bindings)
Merging hid/for-next (de1bcd764ea0 Merge branch 'for-4.8/upstream' into=
 for-next)
Merging i2c/i2c/for-next (c35d490516e6 Merge branch 'i2c/for-4.8' into =
i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after=
 calling device_register)
Merging hwmon-staging/hwmon-next (1d3dd4ce210f Documentation: dtb: xgen=
e: Add hwmon dts binding documentation)
Merging v4l-dvb/master (bcbadf9d8331 Merge branch 'topic/docs-next' int=
o to_next)
Merging pm/linux-next (e5467ddd7ea4 Merge branches 'acpi-ec' and 'acpi-=
button' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (2c5ce98e1e83 thermal: sysfs: add comments describ=
ing locking strategy)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into w=
ork-next)
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_sysfs.c
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_helpers.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval=
 with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and =
memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h =
standalone includible)
Merging slave-dma/next (61fa0c294347 Merge branch 'for-linus' into next=
)
Merging net-next/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic count=
er on inner mode error)
Merging netfilter-next/master (4b512e1c1f8d netfilter: nft_compat: fix =
crash when related match/target module is removed)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) in=
stead of IS_ERR(svc) || svc =3D=3D NULL)
Merging wireless-drivers-next/master (cb6a11518850 wlcore: spi: fix bui=
ld warning caused by redundant variable)
Merging bluetooth/master (4f6781836206 mac802154: use rate limited warn=
ings for malformed frames)
Merging mac80211-next/master (7d27a0ba7adc cfg80211: Add mesh peer AID =
setting API)
Merging rdma/for-next (fb92d8fb1b9c Merge branches 'cxgb4-4.8', 'mlx5-4=
=2E8' and 'fw-version' into k.o/for-4.8)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (92d21ac74a9e Linux 4.7-rc7)
Merging mtd/master (7ce9ea7e6b35 mtd: nand: omap2: Add check for old el=
m binding)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence Q=
uadSPI on non-ARM)
CONFLICT (content): Merge conflict in drivers/mtd/devices/Kconfig
Merging nand/nand/next (8490c03bd9d4 mtd: nand: jz4780: Update MODULE_A=
UTHOR email address)
Merging crypto/master (0f95e2ffc58f Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/herbert/crypto-2.6)
Merging drm/drm-next (162b20d2f9ef Merge branch 'drm-next-4.8' of git:/=
/people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (modify/delete): drivers/staging/android/sync.h deleted in HEA=
D and modified in drm/drm-next. Version drm/drm-next of drivers/staging=
/android/sync.h left in tree.
CONFLICT (content): Merge conflict in drivers/media/platform/omap/omap_=
voutdef.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip=
_drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_debugfs=
=2Ec
CONFLICT (content): Merge conflict in Documentation/index.rst
$ git rm -f drivers/staging/android/sync.h
Applying: staging/android: merge fix up for sync.h renaming
Merging drm-panel/drm/panel/for-next (9bb34c4c730d drm/panel: simple: A=
dd support for Starry KR122EA0SRA panel)
Merging drm-intel/for-linux-next (f15f6ca1e706 drm/i915/gen9: Add WaInP=
laceDecompressionHang)
Merging drm-tegra/drm/tegra/for-next (64ea25c3bc86 drm/tegra: sor: Reje=
ct HDMI 2.0 modes)
Merging drm-misc/topic/drm-misc (12ae57aab438 drm/arm: mali-dp: Fix err=
or return code in malidp_bind())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary c=
heck before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add ent=
ry for Mali-DP driver)
Merging sunxi/sunxi/for-next (25d6a931b3f3 Merge branches 'sunxi/clk-fi=
xes-for-4.7', 'sunxi/defconfig-for-4.8', 'sunxi/drm-fixes-for-4.7' and =
'sunxi/dt-for-4.8' into sunxi/for-next)
Merging kbuild/for-next (f6830d5346c9 Merge branch 'kbuild/misc' into k=
build/for-next)
CONFLICT (content): Merge conflict in Makefile
Merging kspp/for-next/kspp (6fbe16013e52 Merge branch 'for-next/ro_afte=
r_init' into for-next/kspp)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in drivers/char/random.c
CONFLICT (content): Merge conflict in arch/x86/kernel/x86_init.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/uaccess.h
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace r=
epeat count after "tristate")
Merging regmap/for-next (efeb1a3ab91d Merge remote-tracking branches 'r=
egmap/topic/bulk', 'regmap/topic/i2c', 'regmap/topic/iopoll', 'regmap/t=
opic/irq' and 'regmap/topic/maintainers' into regmap-next)
Merging sound/for-next (0984d159c8ad sound: oss: Use kernel_read_file_f=
rom_path() for mod_firmware_load())
Merging sound-asoc/for-next (e70a386d6f07 Merge remote-tracking branch =
'asoc/fix/rcar' into asoc-linus)
Merging modules/modules-next (0d21f8f36ab1 modules: add ro_after_init s=
upport)
Merging input/next (192bd2be1a75 Input: add driver for Silead touchscre=
ens)
Merging block/for-next (b013517951a1 Merge branch 'for-4.8/core' into f=
or-next)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' =
into for-next)
Merging device-mapper/for-next (b5ab4a9ba557 dm: allow bio-based table =
to be upgraded to bio-based with DAX support)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic=
 when handling anonymous cards)
Merging mmc-uh/next (d7ccea3cf9b9 mmc: rtsx_pci: Remove deprecated crea=
te_singlethread_workqueue)
Merging md/for-next (5d8817833c76 MD: fix null pointer deference)
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/raid1.c
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also =
ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: A=
dd enable regulator)
Merging battery/master (4fcd504edbf7 power: reset: add reboot mode driv=
er)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instea=
d of checking for built-in or module)
Merging regulator/for-next (a485f5fc8c8e Merge remote-tracking branches=
 'regulator/topic/qcom-spmi', 'regulator/topic/rn5t618', 'regulator/top=
ic/tps65218' and 'regulator/topic/twl' into regulator-next)
Merging security/next (7616ac70d1bb apparmor: fix SECURITY_APPARMOR_HAS=
H_DEFAULT parameter handling)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/vendor-prefixes.txt
Merging integrity/next (544e1cea03e6 ima: extend the measurement entry =
specific pcr)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' in=
to keys-next)
Merging selinux/next (3f09354ac84c netlabel: Implement CALIPSO config f=
unctions for SMACK.)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoto=
n i2c driver (NPCT6xx family))
Merging watchdog/master (1ac06563434e watchdog: gpio_wdt: Fix missing p=
latform_set_drvdata() in gpio_wdt_probe())
Merging iommu/next (f360d3241f55 Merge branches 'x86/amd', 'x86/vt-d', =
'arm/exynos', 'arm/mediatek', 'arm/msm', 'arm/rockchip', 'arm/smmu' and=
 'core' into next)
CONFLICT (content): Merge conflict in drivers/iommu/mtk_iommu.c
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/=
intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return=
 code during release)
Merging jc_docs/docs-next (a88b1672d4dd doc-rst: kernel-doc: fix handli=
ng of address_space tags)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus=
 number of directory entries)
Merging audit/next (43761473c254 audit: fix a double fetch in audit_log=
_single_execve_arg())
CONFLICT (content): Merge conflict in arch/s390/kernel/ptrace.c
Merging devicetree/for-next (e973f4ec130a xtensa: Partially Revert "xte=
nsa: Remove unnecessary of_platform_populate with default match table")
CONFLICT (content): Merge conflict in arch/arm/mach-imx/mach-imx51.c
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/board_bcm21664.=
c
CONFLICT (content): Merge conflict in arch/arc/kernel/setup.c
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and =
type mismatches in Broadcom PDC driver)
Merging spi/for-next (2932c287108e spi: img-spfi: Remove spi_master_put=
 in img_spfi_remove())
Merging tip/auto-latest (0bd99d3b2034 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/arm/xen/enlighten.c
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/=
time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM wid=
th on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a67adb32d941 ARM: dts: Add Arria10 Ethernet =
EDAC devicetree entry)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/mi=
sc' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneede=
d blank lines)
Merging rcu/rcu/next (5bc94664884a rcu: Avoid redundant quiescent-state=
 chasing)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (912902ce78b0 Merge tag 'kvm-arm-for-4.8' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into next)
CONFLICT (content): Merge conflict in virt/kvm/kvm_main.c
CONFLICT (modify/delete): virt/kvm/arm/vgic.c deleted in kvm/linux-next=
 and modified in HEAD. Version HEAD of virt/kvm/arm/vgic.c left in tree=
=2E
CONFLICT (content): Merge conflict in include/linux/irqchip/arm-gic-v3.=
h
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/s390/mm/gmap.c
CONFLICT (content): Merge conflict in arch/s390/hypfs/hypfs_diag.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/idle_book3s.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/exceptions-64=
s.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/Makefile
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/paca.h
$ git rm -f virt/kvm/arm/vgic.c
Applying: s390: fix merge conflict in arch/s390/kvm/kvm-s390.c
Applying: s390: merge fix up for __diag204 move
Merging kvm-arm/next (3f312db6b65b KVM: arm: vgic-irqfd: Workaround cha=
nging kvm_set_routing_entry prototype)
CONFLICT (content): Merge conflict in virt/kvm/irqchip.c
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct wi=
dth in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (93d17397e4e2 KVM: PPC: Book3S HV: =
Save/restore TM state in H_CEDE)
Merging kvms390/next (9acc317b183f KVM: s390: let ptff intercepts resul=
t in cc=3D3)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization=
 of steal_clock op to xen_time_ops)
Merging percpu/for-next (6710e594f71c percpu: fix synchronization betwe=
en synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affini=
ty of unbound worker threads)
Merging drivers-x86/for-next (c37636b450ae dell-wmi: Ignore WMI event 0=
xe00e)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome:=
 chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_s=
afe)
Merging leds/for-next (5706c01fcfb3 leds: is31fl32xx: define complete i=
2c_device_id table)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter =
and default init)
Merging driver-core/driver-core-next (523d939ef98f Linux 4.7)
Merging tty/tty-next (0e06f5c0deee Merge branch 'akpm' (patches from An=
drew))
Merging usb/usb-next (0bf048abebb6 staging: emxx_udc: allow modular bui=
ld)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the C=
=46IFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (3161da970d38 USB: serial: use variable for=
 status)
Merging usb-chipidea-next/ci-for-usb-next (229d43daf8ed usb: chipidea: =
imx: set over current polarity per dts setting)
Merging staging/staging-next (0e06f5c0deee Merge branch 'akpm' (patches=
 from Andrew))
Merging char-misc/char-misc-next (0e06f5c0deee Merge branch 'akpm' (pat=
ches from Andrew))
Merging extcon/extcon-next (c2692f2dad4f extcon: Block the bit masking =
operation for cable state except for extcon core)
Merging cgroup/for-next (1cab4a96cab6 Merge branch 'for-4.8' into for-n=
ext)
Merging scsi/for-next (d242e6680e81 fcoe: Use default VLAN for FIP VLAN=
 discovery)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mist=
ake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig=
 and Makefile)
Merging libata/for-next (737bee9308c4 libata-scsi: better style in ata_=
msense_*())
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option de=
scription to documentation)
Merging pinctrl/for-next (9573e7923007 pinctrl: fix pincontrol definiti=
on for marvell)
Merging vhost/linux-next (139ab4d4e68b tools/virtio: add noring tool)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODUL=
E_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (e937b335a738 Merge branches 'hwspinlock-next', =
'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (152b09f20130 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' int=
o for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/pwm/pwm-tiehrpwm.txt
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconf=
ig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the fil=
esystems creds)
CONFLICT (content): Merge conflict in fs/proc/root.c
CONFLICT (content): Merge conflict in fs/posix_acl.c
Applying: proc: fixup for "prevent stacking filesystems on top"
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (d22527fed2f0 Merge branch 'clk-fixes' into clk-ne=
xt)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to =
iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (d78388dbec25 selftests: media_tests add a new v=
ideo device test)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UU=
ID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core'=
 into for-next)
Merging coresight/next (27ee11458de3 coresight: tmc: Delete an unnecess=
ary check before the function call "kfree")
Merging rtc/rtc-next (144d2fe0ad37 rtc: asm9260: remove .owner field fo=
r driver)
CONFLICT (content): Merge conflict in arch/x86/platform/efi/efi_64.c
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb=
 in regmap_field)
Merging nvdimm/libnvdimm-for-next (0606263f24f3 Merge branch 'for-4.8/l=
ibnvdimm' into libnvdimm-for-next)
CONFLICT (content): Merge conflict in drivers/nvdimm/pmem.c
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
Applying: dm: merge fix for "pmem: kill __pmem address space"
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protect=
ion)
Merging akpm-current/current (af431322b900 ipc/msg.c: use freezable blo=
cking call)
CONFLICT (content): Merge conflict in include/linux/thread_info.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.=
h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min()=
 expression
Applying: drivers/fpga/Kconfig: fix build failure
Applying: tree-wide: replace config_enabled() with IS_ENABLED()
Applying: include/linux/bitmap.h: cleanup
Applying: powerpc: add explicit #include <asm/asm-compat.h> for jump la=
bel
Applying: sparc: support static_key usage in non-module __exit sections
Applying: tile: support static_key usage in non-module __exit sections
Applying: arm: jump label may reference text in __exit
Applying: jump_label: remove bug.h, atomic.h dependencies for HAVE_JUMP=
_LABEL
Applying: dynamic_debug: add jump label support
Applying: ipc/sem.c: fix complex_count vs. simple op race
Applying: media: mtk-vcodec: remove unused dma_attrs
Applying: dma-mapping: use unsigned long for dma_attrs
Applying: alpha: dma-mapping: use unsigned long for dma_attrs
Applying: arc: dma-mapping: use unsigned long for dma_attrs
Applying: ARM: dma-mapping: use unsigned long for dma_attrs
Applying: arm64: dma-mapping: use unsigned long for dma_attrs
Applying: avr32: dma-mapping: use unsigned long for dma_attrs
Applying: blackfin: dma-mapping: use unsigned long for dma_attrs
Applying: c6x: dma-mapping: use unsigned long for dma_attrs
Applying: cris: dma-mapping: use unsigned long for dma_attrs
Applying: frv: dma-mapping: use unsigned long for dma_attrs
Applying: drm/exynos: dma-mapping: use unsigned long for dma_attrs
Applying: drm/mediatek: dma-mapping: use unsigned long for dma_attrs
Applying: drm/msm: dma-mapping: use unsigned long for dma_attrs
Applying: drm/nouveau: dma-mapping: use unsigned long for dma_attrs
Applying: drm/rockship: dma-mapping: use unsigned long for dma_attrs
Applying: infiniband: dma-mapping: use unsigned long for dma_attrs
Applying: iommu: dma-mapping: use unsigned long for dma_attrs
Applying: media: dma-mapping: use unsigned long for dma_attrs
Applying: xen: dma-mapping: use unsigned long for dma_attrs
Applying: swiotlb: dma-mapping: use unsigned long for dma_attrs
Applying: powerpc: dma-mapping: use unsigned long for dma_attrs
Applying: video: dma-mapping: use unsigned long for dma_attrs
Applying: x86: dma-mapping: use unsigned long for dma_attrs
Applying: iommu: intel: dma-mapping: use unsigned long for dma_attrs
Applying: h8300: dma-mapping: use unsigned long for dma_attrs
Applying: hexagon: dma-mapping: use unsigned long for dma_attrs
Applying: ia64: dma-mapping: use unsigned long for dma_attrs
Applying: m68k: dma-mapping: use unsigned long for dma_attrs
Applying: metag: dma-mapping: use unsigned long for dma_attrs
Applying: microblaze: dma-mapping: use unsigned long for dma_attrs
Applying: mips: dma-mapping: use unsigned long for dma_attrs
Applying: mn10300: dma-mapping: use unsigned long for dma_attrs
Applying: nios2: dma-mapping: use unsigned long for dma_attrs
Applying: openrisc: dma-mapping: use unsigned long for dma_attrs
Applying: parisc: dma-mapping: use unsigned long for dma_attrs
Applying: misc: mic: dma-mapping: use unsigned long for dma_attrs
Applying: s390: dma-mapping: use unsigned long for dma_attrs
Applying: sh: dma-mapping: use unsigned long for dma_attrs
Applying: sparc: dma-mapping: use unsigned long for dma_attrs
Applying: tile: dma-mapping: use unsigned long for dma_attrs
Applying: unicore32: dma-mapping: use unsigned long for dma_attrs
Applying: xtensa: dma-mapping: use unsigned long for dma_attrs
Applying: remoteproc: qcom: use unsigned long for dma_attrs
Applying: dma-mapping: remove dma_get_attr
Applying: dma-mapping: document the DMA attributes next to the declarat=
ion
Applying: samples/kprobe: convert the printk to pr_info/pr_err
Applying: samples/jprobe: convert the printk to pr_info/pr_err
Applying: samples/kretprobe: convert the printk to pr_info/pr_err
Applying: samples/kretprobe: fix the wrong type
Merging akpm/master (ea2942c55b5e samples/kretprobe: fix the wrong type=
)
