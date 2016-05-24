From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 24
Date: Tue, 24 May 2016 12:43:31 +1000
Message-ID: <20160524124331.3c7530b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56832 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752763AbcEXCnf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2016 22:43:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add any v4.8 destined material to your linux-next include=
d
branches until after v4.7-rc1 has been released.

Changes since 20160523:

The drm-intel tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1334
 1188 files changed, 42483 insertions(+), 14509 deletions(-)

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

I am currently merging 236 trees (counting Linus' and 35 trees of patch=
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
Merging origin/master (1d6da87a3241 Merge branch 'drm-next' of git://pe=
ople.freedesktop.org/~airlied/linux)
Merging fixes/master (b507146bb6b9 Merge branch 'linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and =
xz on module install)
Merging arc-current/for-curr (44549e8f5eea Linux 4.6-rc7)
Merging arm-current/fixes (ec953b70f368 ARM: 8573/1: domain: move {set,=
get}_domain under config guard)
Merging m68k-current/for-linus (9a6462763b17 m68k/mvme16x: Include gene=
ric <linux/rtc.h>)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_c=
ached build errors)
Merging powerpc-fixes/fixes (b4c112114aab powerpc: Fix bad inline asm c=
onstraint in create_zero_mask())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (1d6da87a3241 Merge branch 'drm-next' of git://peo=
ple.freedesktop.org/~airlied/linux)
Merging net/master (54b9430f04b0 qed: signedness bug in qed_dcbx_proces=
s_tlv())
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (f28f20da704d Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/net)
Merging wireless-drivers/master (cbbba30f1ac9 Merge tag 'iwlwifi-for-ka=
lle-2016-05-04' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-fixes)
Merging mac80211/master (e6436be21e77 mac80211: fix statistics leak if =
dev_alloc_name() fails)
Merging sound-current/for-linus (423cd785619a ALSA: hda - Fix headphone=
 noise on Dell XPS 13 9360)
Merging pci-current/for-linus (9a2a5a638f8e PCI: Do not treat EPROBE_DE=
=46ER as device attach failure)
Merging driver-core.current/driver-core-linus (5469dc270cd4 Merge branc=
h 'akpm' (patches from Andrew))
Merging tty.current/tty-linus (5469dc270cd4 Merge branch 'akpm' (patche=
s from Andrew))
Merging usb.current/usb-linus (5469dc270cd4 Merge branch 'akpm' (patche=
s from Andrew))
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use=
-after-free)
Merging usb-serial-fixes/usb-linus (74d2a91aec97 USB: serial: option: a=
dd even more ZTE device ids)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipide=
a: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (5469dc270cd4 Merge branch 'akpm'=
 (patches from Andrew))
Merging char-misc.current/char-misc-linus (5469dc270cd4 Merge branch 'a=
kpm' (patches from Andrew))
Merging input-current/for-linus (affa80bd97f7 Input: uinput - handle co=
mpat ioctl for UI_SET_PHYS)
Merging crypto-current/master (bad6a185b4d6 crypto: public_key: select =
CRYPTO_AKCIPHER)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: F=
ix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/ka=
llsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handli=
ng)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the s=
eccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pw=
m: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch=
 tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max778=
43_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (2dcd0af568b0 Linux 4.6)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat sys=
call from default list)
Merging arc/for-next (776d7f1694a7 arc: axs103_smp: Fix CPU frequency t=
o 100MHz for dual-core)
Merging arm/for-next (b6810489fa29 Merge branch 'devel-stable' into for=
-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose =
CHAIN event in sysfs)
Merging arm-soc/for-next (74db14d8d952 Merge remote-tracking branch 'ma=
inline/master' into for-next)
Merging at91/at91-next (5a0d7c6a48ae Merge branch 'at91-4.7-defconfig' =
into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (896ad420db8d dt/bindings: bcm2835: =
correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc=
1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (3652bb35abf6 ARM: bcm=
2835: Enable NFS root support.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes=
' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,de=
vice compatible strings)
Merging imx-mxs/for-next (63b44471754b Merge branch 'imx/defconfig64' i=
nto for-next)
Merging keystone/next (02e15d234006 Merge branch 'for_4.7/kesytone' int=
o next)
Merging mvebu/for-next (01316cded75b Merge branch 'mvebu/defconfig' int=
o mvebu/for-next)
Merging omap/for-next (5c66191b5c76 Merge branch 'omap-for-v4.7/dt' int=
o for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _id=
le() hwmod state sanity check sequence)
Merging qcom/for-next (2dd0d1733417 ARM: dts: msm8974: Add SCM firmware=
 node)
Merging renesas/next (e5c640c6f9cc Merge branches 'heads/arm64-defconfi=
g-for-v4.7', 'heads/arm64-dt-pm-domain-for-v4.7', 'heads/dt-for-v4.7' a=
nd 'heads/pci-defconfig-for-v4.7' into next)
Merging rockchip/for-next (a108aca0c77f Merge branch 'v4.7-clk/fixes' i=
nto for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (35e691cf5165 Merge branch 'fixes-v4.7' i=
nto for-next)
Merging tegra/for-next (5c282bc9d0a3 Merge branch for-4.7/defconfig int=
o for-next)
Merging arm64/for-next/core (e6d9a5254333 arm64: do not enforce strict =
16 byte alignment to stack pointer)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk=
 clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h head=
er)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in arc=
hitecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c =
compile error")
Merging ia64/next (787ca32dc704 ia64/unaligned: Silence another GCC war=
ning about an uninitialised variable)
Merging m68k/for-next (9a6462763b17 m68k/mvme16x: Include generic <linu=
x/rtc.h>)
Merging m68knommu/for-next (44156affd184 m68k: change m68knommu maintai=
ner email address)
Merging metag/for-next (592ddeeff8cb metag: Fix typos)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_ba=
se to fix link errors)
Merging mips/mips-for-linux-next (7d3bce57b0ca MAINTAINERS: Add file pa=
tterns for mips device tree bindings)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependen=
cy to %.dtb target)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolu=
tion sched_clock() implementation)
Merging powerpc/next (138a076496e6 Merge branch 'next' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (1eef33bec12d powerpc/86xx: Fix PCI interrupt map defi=
nition)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the ma=
naged version of kzalloc)
Merging s390/features (5e19a42ac6d9 s390/cpuinfo: show dynamic and stat=
ic cpu mhz)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (bdf03e59f8c1 Fix typo)
CONFLICT (content): Merge conflict in arch/tile/Kconfig
Merging uml/linux-next (a78ff1112263 um: add extended processor state s=
ave/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing pa=
rameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi varia=
nt)
Merging btrfs/next (c315ef8d9db7 Merge branch 'for-chris-4.7' of git://=
git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4=
=2E7)
Merging btrfs-kdave/for-next (a3a7fdf24a89 Merge branch 'for-next-next-=
4.7-20160512' into for-next-20160512)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/dev-replace.c
Merging ceph/master (d3767f0faeda rbd: report unsupported features to s=
yslog)
Merging cifs/for-next (5469dc270cd4 Merge branch 'akpm' (patches from A=
ndrew))
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR=
_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before des=
troy functions)
Merging ext3/for_next (7888824b0b1c udf: Use correct partition referenc=
e number for metadata)
Merging ext4/dev (12735f881952 ext4: pre-zero allocated blocks for DAX =
IO)
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/ext4/indirect.c
CONFLICT (content): Merge conflict in fs/ext4/ext4.h
Merging f2fs/dev (f6c658df6385 Merge tag 'for-f2fs-4.7' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's =
primary_index if registering failed)
Merging fuse/for-next (4441f63ab7e5 fuse: update mailing list in MAINTA=
INERS)
Merging gfs2/for-next (68cd4ce2caf2 GFS2: Refactor gfs2_remove_from_jou=
rnal)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (1b3c6d07e295 pnfs: make pnfs_layout_process mor=
e robust)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
CONFLICT (content): Merge conflict in fs/nfs/direct.c
Applying: nfs: fix for i_mutex to i_rwsem change
Merging nfsd/nfsd-next (d9e4084f6c97 svcrdma: Generalize svc_rdma_xdr_d=
ecode_req())
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variabl=
e)
Merging overlayfs/overlayfs-next (c782aa1a515e Merge branch 'd_real' in=
to overlayfs-next)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather tha=
n spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (555b67e4e729 Merge branch 'xfs-4.7-inode-reclaim'=
 into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patche=
s from Andrew))
Merging vfs/for-next (51085a1f913a cifs: use C99 syntax for inode_opera=
tions initializer)
CONFLICT (content): Merge conflict in fs/cifs/cifsfs.c
Merging pci/next (31c4833c2879 Merge branch 'pci/pm' into next)
Applying: iommu/amd: fix up for aliases API change
Merging hid/for-next (185a9cac5b1e Merge branch 'for-4.6/upstream-fixes=
' into for-next)
Merging i2c/i2c/for-next (0b008267ec1b Merge branch 'i2c/for-4.7' into =
i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update=
 links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9=
 System Slots)
Merging hwmon-staging/hwmon-next (d6a442df63b2 hwmon: (sch5636) trivial=
 fix of spelling mistake on revision)
Merging v4l-dvb/master (73dfb701d254 Merge branch 'v4l_for_linus' into =
to_next)
Merging pm/linux-next (fe520bf9f15b Merge branches 'pm-cpufreq', 'pm-cp=
uidle', 'pm-core' and 'acpi-battery' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (f1ba9eb85b5e thermal: int340x: processor_thermal:=
 support acpi notification)
Merging thermal-soc/next (ddc8fdc6e2f0 Merge branch 'work-fixes' into w=
ork-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval=
 with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make=
_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h =
standalone includible)
Merging slave-dma/next (628b5139c906 Merge branch 'for-linus' into next=
)
Merging net-next/master (07b75260ebc2 Merge branch 'upstream' of git://=
git.linux-mips.org/pub/scm/ralf/upstream-linus)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic count=
er on inner mode error)
Merging ipvs-next/master (698e2a8dca98 ipvs: make drop_entry protection=
 effective for SIP-pe)
Merging wireless-drivers-next/master (52776a700b53 Merge ath-next from =
ath.git)
Merging bluetooth/master (07b75260ebc2 Merge branch 'upstream' of git:/=
/git.linux-mips.org/pub/scm/ralf/upstream-linus)
Merging mac80211-next/master (4f45bb3e8a8f mac80211_hwsim: Allow managi=
ng radios from non-initial namespaces)
Merging rdma/for-next (c16d2750a08c IB/mlx5: Fire the CQ completion han=
dler from tasklet)
Merging rdma-leon/rdma-next (2dcd0af568b0 Linux 4.6)
Merging rdma-leon-test/testing/rdma-next (2dcd0af568b0 Linux 4.6)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement =
in nand_scan)
Merging l2-mtd/master (e5366a266a8c mtd: spi-nor: support GigaDevice gd=
25lq64c)
Merging nand/nand/next (666b65683dad mtd: brcmnand: respect ECC algorit=
hm set by NAND subsystem)
Merging crypto/master (256b1cfb9a34 crypto: qat - change the adf_ctl_st=
op_devices to void)
Merging drm/drm-next (a39ed680bddb drm/edid: add displayid detailed 1 t=
imings to the modelist. (v1.1))
Merging drm-panel/drm/panel/for-next (227e4f4079e1 drm/panel: simple: A=
dd support for TPK U.S.A. LLC Fusion 7" and 10.1" panels)
Merging drm-intel/for-linux-next (157d2c7fad08 drm/i915: Stop automatic=
ally retiring requests after a GPU hang)
Merging drm-tegra/drm/tegra/for-next (057eab2013ec MAINTAINERS: Remove =
Terje Bergstr=C3=B6m as Tegra DRM maintainer)
Merging drm-misc/topic/drm-misc (b80d3942329d drm/mm: avoid possible nu=
ll pointer dereference)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2b669875332f drm/msm: Drop load/unload drm_dr=
iver ops)
Merging hdlcd/for-upstream/hdlcd (c466cbed691a drm: hdlcd: Revamp runti=
me power management)
Merging drm-vc4/drm-vc4-next (efea172891fc drm/vc4: Return -EBUSY if th=
ere's already a pending flip event.)
Merging sunxi/sunxi/for-next (ed490b3ebfa4 Merge branches 'sunxi/drm-fi=
xes-for-4.7' and 'sunxi/dt-for-4.7' into sunxi/for-next)
Merging kbuild/for-next (0c644e04ad1b Merge branch 'kbuild/misc' into k=
build/for-next)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace r=
epeat count after "tristate")
Merging regmap/for-next (d4ab78d7076d Merge remote-tracking branches 'r=
egmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (17e1717c11a3 ALSA: firewire-lib: change a membe=
r of event structure to suppress sparse wanings to bool type)
Merging sound-asoc/for-next (349982487e26 Merge remote-tracking branche=
s 'asoc/fix/ak4642' and 'asoc/fix/twl6040' into asoc-linus)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE=
_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (4feacbc24eea Input: add new driver for the Surface =
3)
Merging block/for-next (661806a31989 Merge branch 'for-4.7/core' into f=
or-next)
Merging lightnvm/for-next (2a65aee4011b lightnvm: reserved space calcul=
ation incorrect)
Merging device-mapper/for-next (202bae52934d dm thin: unroll issue_disc=
ard() to create longer discard bio chains)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic=
 when handling anonymous cards)
Merging mmc-uh/next (fc24637efecf Merge branch 'fixes' into next)
Merging md/for-next (03b979dd0323 Merge tag 'please-pull-misc-4.7' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging mfd/for-mfd-next (b52207ef4ea5 mfd: hi655x: Add MFD driver for =
hi655x)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: F=
ree PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when=
 battery charging near dry)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instea=
d of checking for built-in or module)
Merging regulator/for-next (6b3f657e5e3e Merge remote-tracking branch '=
regulator/fix/ccv' into regulator-linus)
Merging security/next (b937190c40de LSM: LoadPin: provide enablement CO=
NFIG)
Merging integrity/next (05d1a717ec04 ima: add support for creating file=
s using the mknodat syscall)
Merging keys/keys-next (75aeddd12f20 MAINTAINERS: Update keyrings recor=
d and add asymmetric keys record)
Merging selinux/next (b937190c40de LSM: LoadPin: provide enablement CON=
=46IG)
Merging tpmdd/next (e8f2f45a4402 tpm: Fix suspend regression)
Merging watchdog/master (540be8b2add1 MAINTAINERS: Add file patterns fo=
r watchdog device tree bindings)
Merging iommu/next (6c0b43df74f9 Merge branches 'arm/io-pgtable', 'arm/=
rockchip', 'arm/omap', 'x86/vt-d', 'ppc/pamu', 'core' and 'x86/amd' int=
o next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA c=
aching)
Merging vfio/next (f70552809419 vfio_pci: Test for extended capabilitie=
s if config space > 256 bytes)
Merging jc_docs/docs-next (9f8036643dd9 doc: self-protection: provide i=
nitial details)
Merging trivial/for-next (52bbe141f37f gitignore: fix wording)
Merging audit/next (188e3c5cd2b6 tty: provide tty_name() even without C=
ONFIG_TTY)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_d=
esc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (f2c27767af0a devicetree: Add Creative Technolog=
y vendor id)
Merging mailbox/mailbox-for-next (c430cf376fee mailbox: Fix devm_iorema=
p_resource error detection code)
Merging spi/for-next (c4e85b7e6ff7 Merge remote-tracking branch 'spi/to=
pic/zynqmp' into spi-next)
Merging tip/auto-latest (65fd15a016cc Merge branch 'perf/urgent')
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/=
tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM wid=
th on Ivy Bridge and Haswell)
Merging edac-amd/for-next (3f37a36b6282 EDAC, amd64_edac: Drop pci_regi=
ster_driver() use)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mv=
ebu' into irqchip/for-next)
Merging ftrace/for-next (97f8827a8c79 ftracetest: Use proper logic to f=
ind process PID)
Merging rcu/rcu/next (0e7e2457e4e4 Merge commit 'dcd36d01fb3f99d1d5df01=
714f6ccbe3fbbaf81f' into HEAD)
Merging kvm/linux-next (9842df62004f KVM: MTRR: remove MSR 0x2f8)
Merging kvm-arm/next (35a2d58588f0 KVM: arm/arm64: vgic-new: Synchroniz=
e changes to active state)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct wi=
dth in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b1a4286b8f33 KVM: PPC: Book3S HV: =
Re-enable XICS fast path for irqfd-generated interrupts)
Merging kvms390/next (60a37709ce60 KVM: s390: Populate mask of non-hype=
rvisor managed facility bits)
Merging xen-tip/linux-next (51c2a7526e54 xen/gntdev: reduce copy batch =
size to 16)
CONFLICT (content): Merge conflict in drivers/xen/efi.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/setup.c
Applying: xen: efi: merge fix patch
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM=
 which is stale definition)
Merging workqueues/for-next (f1e89a8f3358 Merge branch 'for-4.6-fixes' =
into for-next)
Merging drivers-x86/for-next (d06784c21090 intel_menlow: reduce code du=
plication)
Merging chrome-platform/for-next (9e96aa70e9ac platform/chrome: chromeo=
s_laptop - Add Elan touchpad for Wolf)
Merging hsi/for-next (c2f90a465df7 HSI: omap-ssi: move omap_ssi_port_up=
date_fclk)
Merging leds/for-next (f1da6e1a4721 MAINTAINERS: Add file patterns for =
led device tree bindings)
Merging ipmi/for-next (a1b4e31bfabb IPMI: reserve memio regions separat=
ely)
Merging driver-core/driver-core-next (5469dc270cd4 Merge branch 'akpm' =
(patches from Andrew))
Merging tty/tty-next (5469dc270cd4 Merge branch 'akpm' (patches from An=
drew))
Merging usb/usb-next (5469dc270cd4 Merge branch 'akpm' (patches from An=
drew))
Merging usb-gadget/next (2a58f9c12bb3 usb: dwc3: gadget: disable automa=
tic calculation of ACK TP NUMP)
Merging usb-serial/usb-next (b923c6c62981 USB: serial: ti_usb_3410_5052=
: add MOXA UPORT 11x0 support)
Merging usb-chipidea-next/ci-for-usb-next (764763f0a0c8 doc: usb: chipi=
dea: update the doc for OTG FSM)
Merging staging/staging-next (5469dc270cd4 Merge branch 'akpm' (patches=
 from Andrew))
Merging char-misc/char-misc-next (5469dc270cd4 Merge branch 'akpm' (pat=
ches from Andrew))
Merging extcon/extcon-next (453fc627c7b5 extcon: usb-gpio: add support =
for ACPI gpio interface)
Merging cgroup/for-next (a6b18f07bc86 Merge branch 'for-4.6-fixes' into=
 for-next)
Merging scsi/for-next (787ab6e97024 aacraid: do not activate events on =
non-SRC adapters)
Merging target-updates/for-next (8f0dfb3d8b11 iscsi-target: Fix early s=
k_data_ready LOGIN_FLAGS_READY race)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig=
 and Makefile)
Merging libata/for-next (a85742332511 Merge branch 'for-4.7' into for-n=
ext)
Merging pinctrl/for-next (7639dad93a55 Merge tag 'trace-v4.7-2' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging vhost/linux-next (09e1257c4af9 MAINTAINERS: Add file patterns f=
or virtio device tree bindings)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODUL=
E_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (da5cb422f15d Merge branches 'rpmsg-next' and 'r=
proc-next' into for-next)
Merging gpio/for-next (7639dad93a55 Merge tag 'trace-v4.7-2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (18c588786c08 Merge branch 'for-4.7/pwm-atomic' in=
to for-next)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FO=
WNER in userns)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (ef56b79b66fa clk: fix critical clock locking)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (6eab37daf0ec tools: testing: define the _GNU_SO=
URCE macro)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and =
min inode times)
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core'=
 into for-next)
Merging coresight/next (f85f84cd36af coresight: Handle build path error=
)
Merging rtc/rtc-next (b9ba1eb03368 rtc: tps6586x: rename so module can =
be autoloaded)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb=
 in regmap_field)
Merging nvdimm/libnvdimm-for-next (36092ee8ba69 Merge branch 'for-4.7/d=
ax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protect=
ion)
CONFLICT (content): Merge conflict in include/linux/radix-tree.h
CONFLICT (content): Merge conflict in include/linux/dax.h
CONFLICT (content): Merge conflict in fs/dax.c
CONFLICT (content): Merge conflict in fs/block_dev.c
Merging akpm-current/current (b40abdc8a2ae ipc/msg.c: use freezable blo=
cking call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm: make optimistic check for swapin readahead fix
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min()=
 expression
Applying: fs/nfs/nfs4state.c: work around gcc-4.4 anon union initializa=
tion bug
Merging akpm/master (31453caf3fbd fs/nfs/nfs4state.c: work around gcc-4=
=2E4 anon union initialization bug)
