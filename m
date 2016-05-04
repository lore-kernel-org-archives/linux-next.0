From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 4
Date: Wed, 4 May 2016 16:45:13 +1000
Message-ID: <20160504164513.6fc15780@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57732 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751293AbcEDGpQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2016 02:45:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160503:

Dropped tree: hsi (at the maintainer's request)

The tip tree gained a conflict against the arc tree.

The kvm-arm tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 7982
 6997 files changed, 298694 insertions(+), 148713 deletions(-)

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

I am currently merging 235 trees (counting Linus' and 35 trees of patch=
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
Merging origin/master (1248ded656d8 Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and =
xz on module install)
Merging arc-current/for-curr (1b10cb21d888 ARC: add support for reserve=
d memory defined by device tree)
Merging arm-current/fixes (ac36a881b72a ARM: 8564/1: fix cpu feature ex=
tracting helper)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update def=
configs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_c=
ached build errors)
Merging powerpc-fixes/fixes (b4c112114aab powerpc: Fix bad inline asm c=
onstraint in create_zero_mask())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (33656a1f2ee5 Merge branch 'for_linus' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging net/master (79e8dc8b80bf ipv6/ila: fix nlsize calculation for l=
wtunnel)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (f28f20da704d Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/net)
Merging wireless-drivers/master (e2841ea91611 Merge tag 'iwlwifi-for-ka=
lle-2016-04-12_2' of https://git.kernel.org/pub/scm/linux/kernel/git/iw=
lwifi/iwlwifi-fixes)
Merging mac80211/master (e6436be21e77 mac80211: fix statistics leak if =
dev_alloc_name() fails)
Merging sound-current/for-linus (2d2c038a9999 ALSA: usb-audio: Quirk fo=
r yet another Phoenix Audio devices (v2))
Merging pci-current/for-linus (9a2a5a638f8e PCI: Do not treat EPROBE_DE=
=46ER as device attach failure)
Merging driver-core.current/driver-core-linus (c3b46c73264b Linux 4.6-r=
c4)
Merging tty.current/tty-linus (02da2d72174c Linux 4.6-rc5)
Merging usb.current/usb-linus (9be427efc764 Revert "USB / PM: Allow USB=
 devices to remain runtime-suspended when sleeping")
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use=
-after-free)
Merging usb-serial-fixes/usb-linus (444f94e9e625 USB: serial: option: a=
dd support for Cinterion PH8 and AHxx)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipide=
a: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (431adc0aeca6 Merge tag 'iio-fixe=
s-for-4.6c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio =
into staging-linus)
Merging char-misc.current/char-misc-linus (d1306eb675ad nvmem: mxs-ocot=
p: fix buffer overflow in read)
Merging input-current/for-linus (eb43335c4095 Input: atmel_mxt_ts - use=
 mxt_acquire_irq in mxt_soft_reset)
Merging crypto-current/master (6dc5df71ee5c crypto: qat - fix adf_ctl_d=
rv.c:undefined reference to adf_init_pf_wq)
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
Merging drm-intel-fixes/for-linux-next-fixes (4ea3959018d0 drm/i915: Ma=
ke RPS EI/thresholds multiple of 25 on SNB-BDW)
Merging asm-generic/master (58adc350dad1 asm-generic: Drop renameat sys=
call from default list)
Merging arc/for-next (5abf3e828303 ARC: Add eznps platform to Kconfig a=
nd Makefile)
Merging arm/for-next (c6433ebdc184 Merge branch 'devel-stable' into for=
-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose =
CHAIN event in sysfs)
Merging arm-soc/for-next (bf7d0eb9d294 Merge branch 'fixes' into for-ne=
xt)
Merging at91/at91-next (087fb002b466 Merge branch 'at91-4.7-dt' into at=
91-next)
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
Merging omap/for-next (5c62bda50efd Merge branch 'omap-for-v4.7/dt' int=
o for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _id=
le() hwmod state sanity check sequence)
Merging qcom/for-next (100b83d52f51 ARM: dts: msm8974: Add SCM firmware=
 node)
Merging renesas/next (e5c640c6f9cc Merge branches 'heads/arm64-defconfi=
g-for-v4.7', 'heads/arm64-dt-pm-domain-for-v4.7', 'heads/dt-for-v4.7' a=
nd 'heads/pci-defconfig-for-v4.7' into next)
Merging rockchip/for-next (48f2a282081f Merge branch 'v4.7-clk/next' in=
to for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (bf501efa84e1 Merge branch 'for-v4.7-late=
/dts-exynos-devfreq' into for-next)
Merging sunxi/sunxi/for-next (f1e9b6675c26 Merge branches 'sunxi/clocks=
-for-4.7', 'sunxi/dt-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-=
next)
Merging tegra/for-next (5c282bc9d0a3 Merge branch for-4.7/defconfig int=
o for-next)
Merging arm64/for-next/core (2326df551b13 arm64: always use STRICT_MM_T=
YPECHECKS)
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
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
Merging ia64/next (e298c499cac1 ia64: Remove superfluous SMP function c=
all)
Merging m68k/for-next (9a6462763b17 m68k/mvme16x: Include generic <linu=
x/rtc.h>)
Merging m68knommu/for-next (04974df8049f Linux 4.6-rc6)
Merging metag/for-next (096a8b6d5e7a metag: Fix atomic_*_return inline =
asm constraints)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_bas=
e to fix link errors)
Merging mips/mips-for-linux-next (3740da5538f6 Merge branch '4.6-fixes'=
 into mips-for-linux-next)
Merging nios2/for-next (a8950e49bd24 nios2: memset: use the right const=
raint modifier for the %4 output operand)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolu=
tion sched_clock() implementation)
Merging powerpc/next (c3c900cf192e powerpc/mm/radix: Document software =
bits for radix)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/prom.c
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" fla=
sh compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the ma=
naged version of kzalloc)
Merging s390/features (e18eb2d1eb03 s390/cpum_sf: Remove superfluous SM=
P function call)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (4ef00aa30a3f tile: sort the "select" lines in the =
TILE/TILEGX configs)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for =
unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CP=
UFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi varia=
nt)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (1061156bbbcb Merge branch 'for-next-curre=
nt-4.7-20160502' into for-next-20160502)
Merging ceph/master (d3767f0faeda rbd: report unsupported features to s=
yslog)
Merging cifs/for-next (9fa4548b693d cifs: remove any preceding delimite=
r from prefix_path)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR=
_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before des=
troy functions)
Merging ext3/for_next (373afbd49942 ext2: Add alignment check for DAX m=
ount)
Merging ext4/dev (8f4c50d70cc1 ext4: remove trailing \n from ext4_warni=
ng/ext4_error calls)
Merging f2fs/dev (414fc80a6ac1 ext4 crypto: migrate into vfs's crypto e=
ngine)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's =
primary_index if registering failed)
Merging fuse/for-next (4441f63ab7e5 fuse: update mailing list in MAINTA=
INERS)
Merging gfs2/for-next (80f4781d2c0b gfs2: use inode_lock/unlock instead=
 of accessing i_mutex directly)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (04974df8049f Linux 4.6-rc6)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_=
size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variabl=
e)
Merging overlayfs/overlayfs-next (eb0f3db9508f ovl: ignore permissions =
on underlying lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather tha=
n spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' in=
to for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patche=
s from Andrew))
Merging vfs/for-next (36440d308ac6 Merge branch 'sendmsg.cifs' into for=
-next)
CONFLICT (content): Merge conflict in fs/overlayfs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
Merging pci/next (d9322d226f91 Merge branches 'pci/dpc', 'pci/resource'=
 and 'pci/thunderbolt' into next)
Applying: iommu/amd: fix up for aliases API change
Merging hid/for-next (185a9cac5b1e Merge branch 'for-4.6/upstream-fixes=
' into for-next)
Merging i2c/i2c/for-next (b3b859225348 Merge branch 'i2c/for-4.7' into =
i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update=
 links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9=
 System Slots)
Merging hwmon-staging/hwmon-next (71a9c23246fe hwmon: (it87) Add suppor=
t for IT8628E)
Merging v4l-dvb/master (d233973d22a4 Merge branch 'v4l_for_linus' into =
to_next)
Merging libata/for-next (c5cf484d03f1 Merge branch 'for-4.6-fixes' into=
 for-next)
Merging pm/linux-next (d09902199628 Merge branches 'pm-cpufreq-fixes' a=
nd 'acpica-fixes' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/Makefile
CONFLICT (content): Merge conflict in MAINTAINERS
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (ddc8fdc6e2f0 Merge branch 'work-fixes' into w=
ork-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval=
 with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make=
_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h =
standalone includible)
Merging slave-dma/next (dabb2414d1fd Merge branch 'topic/mv_xor' into n=
ext)
Merging net-next/master (26879da58711 ipv6: add new struct ipcm6_cookie=
)
CONFLICT (content): Merge conflict in net/ipv4/ip_gre.c
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic count=
er on inner mode error)
Merging ipvs-next/master (129aabdc2ec8 ipvs: make drop_entry protection=
 effective for SIP-pe)
Merging wireless-drivers-next/master (e1ca790c8a32 rtl8xxxu: Remove the=
 now obsolete mbox_ext_reg info from rtl8xxxu_fileops)
Merging bluetooth/master (32b9ccbc3522 Bluetooth: hci_intel: Fix null g=
pio desc pointer dereference)
Merging mac80211-next/master (866daf6eaae3 wext: remove a/b/g/n from SI=
OCGIWNAME)
Merging rdma/for-next (ccea5f0f0179 RDMA/i40iw: Fix for removing quad h=
ash entries)
Merging rdma-leon/rdma-next (33656a1f2ee5 Merge branch 'for_linus' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging rdma-leon-test/testing/rdma-next (598bd6103abc Merge branch 'to=
pic/ib-router' into testing/rdma-next)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement =
in nand_scan)
Merging l2-mtd/master (abbbc60a0c69 mtd: pmc551: add __init attribute)
Merging nand/nand/next (4ab41e74ae5d mtd: brcmnand: respect ECC algorit=
hm set by NAND subsystem)
Merging crypto/master (bc197b2a9c7e crypto: ccp - constify ccp_actions =
structure)
Merging drm/drm-next (b89359bdf0f1 Merge branch 'for-next' of http://gi=
t.agner.ch/git/linux-drm-fsl-dcu into drm-next)
Applying: drm/i915: fix up for edp_low_vswing change
Merging drm-panel/drm/panel/for-next (66d1accbd267 drm/bridge: Add Anal=
ogix anx78xx support)
Merging drm-intel/for-linux-next (5b4fd5b1111b drm/i915: Update DRIVER_=
DATE to 20160425)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbu=
ffer.c
Merging drm-tegra/drm/tegra/for-next (057eab2013ec MAINTAINERS: Remove =
Terje Bergstr=C3=B6m as Tegra DRM maintainer)
Merging drm-misc/topic/drm-misc (8636d45249ce MAINTAINERS: Add myself f=
or the new VC4 (RPi GPU) graphics driver.)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_displa=
y.c
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (c41c9bf07d5b drm/msm: Drop load/unload drm_dr=
iver ops)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_atomic.c
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an =
error code)
Merging drm-vc4/drm-vc4-next (5883980313af drm/vc4: Fix NULL deref in H=
DMI init error path)
Merging kbuild/for-next (7eb09bb55394 Merge branch 'kbuild/kbuild' into=
 kbuild/for-next)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace r=
epeat count after "tristate")
Merging regmap/for-next (8eabbbb9c0c9 Merge remote-tracking branches 'r=
egmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (57dd5414a087 ALSA: usb-audio: Limit retrying sa=
mple rate reads)
Merging sound-asoc/for-next (4d11b151b4a0 Merge remote-tracking branch =
'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE=
_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (5ad629a82de3 Input: byd - don't wipe dynamically al=
located memory twice)
Merging block/for-next (53ef859e7f7e Merge branch 'for-4.7/drivers' int=
o for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging lightnvm/for-next (99a670a749bd lightnvm: do not assume sequent=
ial lun alloc.)
Merging device-mapper/for-next (ecdb57d205b9 dm raid: make sure no feat=
ure flags are set in metadata)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic=
 when handling anonymous cards)
Merging mmc-uh/next (fa694a59dc66 mmc: sh_mobile_sdhi: check return val=
ue when changing clk)
Merging md/for-next (e9aee6b69174 md-cluster: fix ifnullfree.cocci warn=
ings)
Merging mfd/for-mfd-next (ba5776ab6f09 mfd: cros_ec: Allow building for=
 ARM64)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: F=
ree PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when=
 battery charging near dry)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unus=
ed variable)
Merging regulator/for-next (f52ac4321caf Merge remote-tracking branches=
 'regulator/topic/tps6524x' and 'regulator/topic/twl' into regulator-ne=
xt)
Merging security/next (da20dfe6b50e fs: fix over-zealous use of "const"=
)
Merging integrity/next (05d1a717ec04 ima: add support for creating file=
s using the mknodat syscall)
Merging keys/keys-next (1ea6102bba5f Merge branch 'keys-trust' into key=
s-next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_pars=
er.c
Merging selinux/next (c2316dbf1242 selinux: apply execstack check on th=
read stacks)
Merging tpmdd/next (1191ef663913 tpm: fix for typo in tpm/tpm_ibmvtpm.c=
)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not =
dereferenced if NULL)
Merging iommu/next (1229bc9a9973 Merge branches 'iommu/fixes', 'arm/io-=
pgtable', 'arm/rockchip', 'arm/omap', 'x86/vt-d', 'ppc/pamu' and 'x86/a=
md' into next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA c=
aching)
Merging vfio/next (5ed4aba1265f vfio_iommu_spapr_tce: Remove unneeded i=
ommu_group_get_iommudata)
Merging jc_docs/docs-next (2fd872bd84b3 Doc: correct the location of sy=
srq.c)
Merging trivial/for-next (52bbe141f37f gitignore: fix wording)
Merging audit/next (188e3c5cd2b6 tty: provide tty_name() even without C=
ONFIG_TTY)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_d=
esc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (011d6f5c3e5f of: include errno.h in of_graph.h)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/gpu/nvidia,gk20a.txt
Merging mailbox/mailbox-for-next (dd28216528cf mailbox/omap: kill omap_=
mbox_{save/restore}_ctx() functions)
Merging spi/for-next (90187a6aba7a Merge remote-tracking branches 'spi/=
topic/pxa2xx', 'spi/topic/qup', 'spi/topic/st-ssc4' and 'spi/topic/xlp'=
 into spi-next)
Merging tip/auto-latest (c258a22cb3df Merge branch 'core/signals')
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/firmware/efi/arm-init.c
CONFLICT (content): Merge conflict in drivers/cpufreq/longhaul.c
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/=
tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM wid=
th on Ivy Bridge and Haswell)
Merging edac-amd/for-next (2c1ea4c700af EDAC, sb_edac: Use cpu family/m=
odel in driver detection)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mv=
ebu' into irqchip/for-next)
Merging ftrace/for-next (904d1857ad09 tracing: Remove unused function t=
race_current_buffer_lock_reserve())
Merging rcu/rcu/next (2ba259ab67a8 fixup! rcu: Make call_rcu_tasks() to=
lerate first call with irqs disabled)
Merging kvm/linux-next (05b1159e641f Merge tag 'kvms390-20160420' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into next)
Merging kvm-arm/next (a53d892dfb6f clocksource: arm_arch_timer: Remove =
arch_timer_get_timecounter)
CONFLICT (content): Merge conflict in drivers/irqchip/irq-gic-v3.c
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct wi=
dth in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support=
 for 64bit TCE windows)
Merging kvms390/next (0c5022f50844 KVM: s390: document KVM_CAP_S390_RI)
Merging xen-tip/linux-next (d2c6bd8d6259 xen/x86: don't lose event inte=
rrupts)
CONFLICT (content): Merge conflict in drivers/xen/efi.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/setup.c
Applying: xen: efi: merge fix patch
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM=
 which is stale definition)
Merging workqueues/for-next (e55c35cf41c9 Merge branch 'for-4.6-fixes' =
into for-next)
Merging drivers-x86/for-next (19d46ee1aec0 asus-laptop: correct error h=
andling in sysfs_acpi_set)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_=
platform_device())
Merging leds/for-next (f15c65afddbe leds: ss4200: add DMI data for FSC =
SCALEO Home Server)
Merging ipmi/for-next (a1b4e31bfabb IPMI: reserve memio regions separat=
ely)
Merging driver-core/driver-core-next (c6e360a0d9d2 Revert "base: dd: do=
n't remove driver_data in -EPROBE_DEFER case")
Merging tty/tty-next (7da4b8b73787 serial: core: Fix port mutex assert =
if lockdep disabled)
CONFLICT (content): Merge conflict in include/uapi/linux/serial_core.h
CONFLICT (content): Merge conflict in drivers/tty/serial/Makefile
Merging usb/usb-next (e6c037bfcafa Merge tag 'phy-for-4.7' of git://git=
=2Ekernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-testin=
g)
Merging usb-gadget/next (2a58f9c12bb3 usb: dwc3: gadget: disable automa=
tic calculation of ACK TP NUMP)
Merging usb-serial/usb-next (8c34d82e9dc6 USB: serial: use IS_ENABLED()=
 instead of checking for FOO || FOO_MODULE)
Merging usb-chipidea-next/ci-for-usb-next (4e332df63487 usb: otg-fsm: s=
upport multiple instances)
Merging staging/staging-next (5c6958583768 staging: comedi: mite: tidy =
up module init/exit)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/lli=
te/rw26.c
CONFLICT (content): Merge conflict in drivers/iio/magnetometer/ak8975.c
Merging char-misc/char-misc-next (8cd1f9d01cbf mcb: Delete num_cells va=
riable which is not required)
CONFLICT (content): Merge conflict in drivers/hv/ring_buffer.c
Merging extcon/extcon-next (453fc627c7b5 extcon: usb-gpio: add support =
for ACPI gpio interface)
Merging cgroup/for-next (2dba083b163d Merge branch 'for-4.6-fixes' into=
 for-next)
Merging scsi/for-next (3bc07b38a251 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_releas=
e_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig=
 and Makefile)
Merging pinctrl/for-next (9fa5482fbd17 Merge branch 'devel' into for-ne=
xt)
Merging vhost/linux-next (e00f7bd22129 virtio: Silence uninitialized va=
riable warning)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODUL=
E_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (9735a22799b9 Linux 4.6-rc2)
Merging gpio/for-next (43e689b917d7 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (4295ada2fe87 Merge branch 'for-4.7/pwm-atomic' in=
to for-next)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FO=
WNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (c47265ad64fa clk: fix comment of devm_clk_hw_regi=
ster())
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and =
min inode times)
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (5c14ad932491 KVM: halt_polling: provide=
 a way to qualify wakeups during poll)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core'=
 into for-next)
Merging coresight/next (620a7feb9b3c coresight: etb10: adjust read poin=
ter only when needed)
Merging rtc/rtc-next (33505018409a rtc: rv3029: add alarm IRQ)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb=
 in regmap_field)
Merging nvdimm/libnvdimm-for-next (a390180291dd libnvdimm, pfn: fix nvd=
imm_namespace_add_poison() vs section alignment)
Merging akpm-current/current (e6a4a2daba94 mm: make optimistic check fo=
r swapin readahead fix)
CONFLICT (content): Merge conflict in include/linux/efi.h
CONFLICT (content): Merge conflict in arch/tile/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/book3s/6=
4/pgtable.h
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
CONFLICT (content): Merge conflict in arch/mips/Kconfig
CONFLICT (content): Merge conflict in arch/cris/Kconfig
Applying: mm-rename-_count-field-of-the-struct-page-to-_refcount-fix6
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min()=
 expression
Applying: mm: make mmap_sem for write waits killable for mm syscalls
Applying: mm: make vm_mmap killable
Applying: mm: make vm_munmap killable
Applying: mm, aout: handle vm_brk failures
Applying: mm, elf: handle vm_brk error
Applying: mm: make vm_brk killable
Applying: mm, proc: make clear_refs killable
Applying: mm, fork: make dup_mmap wait for mmap_sem for write killable
Applying: ipc, shm: make shmem attach/detach wait for mmap_sem killable
Applying: vdso: make arch_setup_additional_pages wait for mmap_sem for =
write killable
Applying: coredump: make coredump_wait wait for mmap_sem for write kill=
able
Applying: aio: make aio_setup_ring killable
Applying: exec: make exec path waiting for mmap_sem killable
Applying: prctl: make PR_SET_THP_DISABLE wait for mmap_sem killable
Applying: uprobes: wait for mmap_sem for write killable
Applying: drm/i915: make i915_gem_mmap_ioctl wait for mmap_sem killable
Applying: drm/radeon: make radeon_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: make amdgpu_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: use ERR_PTR() to return from amdgpu_mn_get
Merging akpm/master (d6c1e622f784 drm/amdgpu: use ERR_PTR() to return f=
rom amdgpu_mn_get)
