From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 10
Date: Tue, 10 Mar 2015 16:59:37 +1100
Message-ID: <20150310165937.4f43b2ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//OcToB8/.CMnjGXI3mypqWD"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50182 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751685AbbCJF7p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 01:59:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_//OcToB8/.CMnjGXI3mypqWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150306:

The net-next tree gained a conflict against the net tree.

The sound-asoc tree gained a build failure so I used the version from
next-20150306.

The regulator tree gained a build failure for which I applied a fix patch.

The staging tree gained a build failure so I disabled a driver.

Non-merge commits (relative to Linus' tree): 3360
 3394 files changed, 129356 insertions(+), 72245 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log files
in the Next directory.  Between each merge, the tree was built with
a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
multi_v7_defconfig for arm. After the final fixups (if any), it is also
built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
allyesconfig (this fails its final link) and i386, sparc, sparc64 and arm
defconfig.

Below is a summary of the state of the merge.

I am currently merging 207 trees (counting Linus' and 30 trees of patches
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (9eccca084320 Linux 4.0-rc3)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (23be7fdafa50 ARM: 8305/1: DMA: Fix kzalloc flags=
 in __iommu_alloc_buffer())
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (c2996cb29bfb metag: Fix KSTK_EIP() and KSTK_ESP(=
) macros)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-merge-mpe/fixes (4ad04e598711 powerpc/iommu: Remove IOMMU d=
evice references via bus notifier)
Merging sparc/master (53eb2516972b sparc: semtimedop() unreachable due to c=
omparison error)
Merging net/master (e6441bae3262 tipc: fix bug in link failover handling)
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (a1f3f1ca66bd ALSA: hda - Fix regression of=
 HD-audio controller fallback modes)
Merging pci-current/for-linus (085a68d0010f PCI: xgene: Add register offset=
 to config space base address)
Merging wireless-drivers/master (3f1615340ace brcmfmac: Perform bound check=
ing on vendor command buffer)
Merging driver-core.current/driver-core-linus (c517d838eb7d Linux 4.0-rc1)
Merging tty.current/tty-linus (9eccca084320 Linux 4.0-rc3)
Merging usb.current/usb-linus (9eccca084320 Linux 4.0-rc3)
Merging usb-gadget-fixes/fixes (a0456399fb07 usb: gadget: configfs: don't N=
UL-terminate (sub)compatible ids)
Merging usb-serial-fixes/usb-linus (9eccca084320 Linux 4.0-rc3)
Merging staging.current/staging-linus (1f51d5801859 vt6655: Fix late settin=
g of byRFType.)
Merging char-misc.current/char-misc-linus (9eccca084320 Linux 4.0-rc3)
Merging input-current/for-linus (4eb8d6e7e5aa Input: psmouse - disable "pal=
m detection" in the focaltech driver)
Merging crypto-current/master (001eabfd54c0 crypto: arm/aes update NEON AES=
 module to latest OpenSSL version)
Merging ide/master (f96fe225677b Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging devicetree-current/devicetree/merge (6b1271de3723 of/unittest: Over=
lays with sub-devices tests)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (7c2e211f3c95 vfio-pci: Fix the check on pci d=
evice type in vfio_pci_probe())
Merging kselftest-fixes/fixes (f5db310d77ef selftests/vm: fix link error fo=
r transhuge-stress test)
Merging drm-intel-fixes/for-linux-next-fixes (ab3be73fa7b4 drm/i915: gen4: =
work around hang during hibernation)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (3240dd57e533 ARC: Fix thread_saved_pc())
Merging arm/for-next (42203614b435 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (c419b68f817c arm-soc: document merges)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (72a6dbe0ea91 ARM: bcm2835: Use pinctrl header)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (9f668126a81c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (fe0b6f2a33ae Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (67fd14b3eca6 ARM: dts: am335x-bone*: usb0 is hardwir=
ed for peripheral)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
Merging renesas/next (3176fc942f43 Merge branch 'heads/dt-for-v4.1' into ne=
xt)
Merging samsung/for-next (e0e94a5fb27a Merge branch 'v4.0-samsung-defconfig=
' into for-next)
Merging sunxi/sunxi/for-next (762ad65c7bda Merge branch 'sunxi/dt-for-4.1' =
into sunxi/for-next)
Merging tegra/for-next (794345d409ad Merge branch for-3.20/arm64 into for-n=
ext)
Merging arm64/for-next/core (d476d94f180a arm64: compat: Remove incorrect c=
omment in compat_siginfo)
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
Merging c6x/for-linux-next (3591276d16f8 c6x: kernel: setup: Include "linux=
/console.h")
Merging cris/for-next (a38ecbbd0be0 Merge branch 'x86-urgent-for-linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (a6b8978c54b7 pstore: Fix sprintf format specifier in pst=
ore_dump())
Merging m68k/for-next (4436820a98cd m68k/defconfig: Enable Ethernet bridgin=
g)
Merging m68knommu/for-next (c517d838eb7d Linux 4.0-rc1)
Merging metag/for-next (f93125ae17d1 metag: cachepart: Fix failure check)
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (c517d838eb7d Linux 4.0-rc1)
Merging nios2/nios2-next (d16d2be111a6 nios2: add kgdb support)
Merging parisc-hd/for-next (bfa76d495765 Linux 3.19)
Merging powerpc/next (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-mpe/next (a6130ed253a9 cxl: Add missing return statement af=
ter handling AFU errror)
Merging fsl/next (0dc294f717d4 powerpc/mm: bail out early when flushing TLB=
 page)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (f6839dbf80eb s390/traps: panic() instead of die() on=
 translation exception)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (740e1433f50e tile: change MAINTAINERS website from til=
era.com to ezchip.com)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (1f2fdbd0078c xtensa: disable link optimization)
Merging btrfs/next (a742994aa2e2 Btrfs: don't remove extents and xattrs whe=
n logging new names)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/ceph_common.c
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in include/linux/ceph/libceph.h
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
CONFLICT (content): Merge conflict in fs/ceph/inode.c
Merging cifs/for-next (5a090583c3fc Update negotiate protocol for SMB3.1 di=
alect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (6981498d7956 udf: remove bool assignment to 0/1)
Merging ext4/dev (6f30b7e37a82 ext4: fix indirect punch hole corruption)
Merging f2fs/dev (ee2383f796e0 f2fs: report -ENOENT for unreached data indi=
ces)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (6a57f2a7bb7d fuse: write inode even if no FLUSH)
Merging gfs2/for-next (89d4899e65a7 GFS2: Move gfs2_file_splice_write outsi=
de of #ifdef)
Merging jfs/jfs-next (648695c74811 jfs: Deletion of an unnecessary check be=
fore the function call "unload_nls")
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (c517d838eb7d Linux 4.0-rc1)
Merging overlayfs/overlayfs-next (4330397e4e8a ovl: discard independent cur=
sor in readdir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (b388e6a7a6ba UBI: fix missing brace control flow)
Merging xfs/for-next (88e8fda99a4c Merge branch 'xfs-mmap-lock' into for-ne=
xt)
Merging file-locks/linux-next (df92ba1a3d6e locks: use cmpxchg to assign i_=
flctx pointer)
Merging vfs/for-next (ca160d0085b6 kill struct filename.separate)
Merging pci/next (c517d838eb7d Linux 4.0-rc1)
Merging hid/for-next (88a29e668da6 Merge branch 'for-4.1/multitouch' into f=
or-next)
Merging i2c/i2c/for-next (c517d838eb7d Linux 4.0-rc1)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (18fd303fea21 hwmon: (pwm-fan) Fix build w=
hen THERMAL=3Dm)
Merging v4l-dvb/master (48b777c0833b Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (94100b52d1c0 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (29200f12a116 sata-fsl: Apply link speed limits)
Merging pm/linux-next (e62522c1d01c Merge branch 'pm-sleep' into linux-next)
Merging idle/next (210109f4a19a Merge branches 'turbostat', 'sfi' and 'cpui=
dle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (5912e264d9ee Merge branch 'tmon-fixes' of .git into n=
ext)
Merging thermal-soc/next (3d1b493e9886 Merge branch 'work-fixes' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (d826e611272a Merge branch 'for-linus' into next)
Merging net-next/master (115403df818a tipc: Add Ying Xue to TIPC maintainer=
s list)
CONFLICT (content): Merge conflict in drivers/net/ethernet/cadence/macb.c
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (1b5ef07e3dd3 rocker: sparse: fix dyna=
mic allocation on stack warning)
Merging bluetooth/master (0402d9f233ac Bluetooth: fix sco_exit compile warn=
ing)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (393d23c4e229 mtd: atmel_nand: fix typo in dev_err er=
ror message)
Merging crypto/master (3265c4babe93 crypto: powerpc - move files to fix bui=
ld error)
Merging drm/drm-next (3a656b54c843 drm/i915: Fix struct_mutex deadlock due =
to merge fumble)
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (0005372df9ee drm/i915: Use crtc->state->a=
ctive in ilk/skl watermark calculations (v3))
Merging drm-tegra/drm/tegra/for-next (07d05cbf60ed drm/tegra: dc: Move more=
 code into ->init())
Merging drm-misc/topic/drm-misc (eca93e28c256 drm: Check in setcrtc if the =
primary plane supports the fb pixel format)
Merging sound/for-next (4aa01c408b70 Merge branch 'for-linus' into for-next)
Merging sound-asoc/for-next (15c465af052c Merge remote-tracking branches 'a=
soc/topic/wm5100', 'asoc/topic/wm8804' and 'asoc/topic/wm8996' into asoc-ne=
xt)
$ git reset --hard HEAD^
Merging next-20150306 version of sound-asoc
Merging modules/modules-next (6587457b4b3d Merge tag 'dma-buf-for-4.0-rc3' =
of git://git.kernel.org/pub/scm/linux/kernel/git/sumits/dma-buf)
Merging virtio/virtio-next (6d3bdb735651 virtio_balloon: set DRIVER_OK befo=
re using device)
Merging input/next (b3beed7fe83b Input: elan_i2c - return error code when r=
esume fails)
Merging block/for-next (434c26478166 Merge branch 'for-3.20/core' into for-=
next)
Merging device-mapper/for-next (5013e29ef8a4 dm: impose configurable deadli=
ne for dm_request_fn's merge heuristic)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (313f2bc9037d mmc: sdhci-pltfm: remove the unneeded che=
ck of disabled device)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (4400755e356f md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (c7f585fe46d8 mfd: max77843: Add max77843 MFD driv=
er core driver)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (0595439a0a87 power: generic-adc-battery: Fix power_=
supply_property returned value)
Merging omap_dss2/for-next (d6c2152b3efd Merge branches '3.20/fbdev' and '3=
.20/omapdss' into for-next)
Merging regulator/for-next (95d61a38bff8 Merge remote-tracking branches 're=
gulator/topic/dbx500', 'regulator/topic/load-op', 'regulator/topic/mode', '=
regulator/topic/notifier' and 'regulator/topic/wm8350' into regulator-next)
Applying: fixes for regulator_set_optimum_mode name change
Merging security/next (74f0414b2f9a Merge tag 'yama-4.0' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/kees/linux into next)
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (1cad16744b21 selinux: remove unnecessary pointer reas=
signment in avc_has_perm_noaudit())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (c517d838eb7d Linux 4.0-rc1)
Merging iommu/next (eccd732182ce Merge branches 'iommu/fixes', 'x86/vt-d' a=
nd 'x86/amd' into next)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (6140a8f56238 vfio-pci: Add device request interface)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (b0e1ee8e1405 MSI-HOWTO.txt: remove reference on =
IRQF_DISABLED)
Merging trivial/for-next (c1f4775ab576 powerpc: Fix comment in smu.h)
Merging audit/next (5b28255278dd audit: reduce mmap_sem hold for mm->exe_fi=
le)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (48b744da6697 Documentation: DT: Renamed of-serial.t=
xt to 8250.txt)
Merging mailbox/mailbox-for-next (33350e6b1833 Mailbox: Restructure and sim=
plify PCC mailbox code)
Merging spi/for-next (ca9f41d6d92a Merge remote-tracking branches 'spi/topi=
c/rockchip', 'spi/topic/s3c64xx', 'spi/topic/sc18is602' and 'spi/topic/spid=
ev' into spi-next)
Merging tip/auto-latest (ba518c0a33ad Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (2ec591ac7422 EDAC, amd64_edac: Get rid of per-no=
de driver instances)
Merging irqchip/irqchip/for-next (4f55cf3266ee Merge branch 'irqchip/mvebu'=
 into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c19565fc83e6 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (dc8809d42a48 kernel/locking/locktorture: fix deadlock=
 in 'rw_lock_irq' type)
Merging kvm/linux-next (4ff6f8e61eb7 KVM: emulate: fix CMPXCHG8B on 32-bit =
hosts)
Merging kvm-arm/next (4b990589952f KVM: Remove unused config symbol)
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (13211ea7b47d KVM: s390: Enable vector support for cap=
able guest)
Merging xen-tip/linux-next (a2e75bc2ee20 xenbus: Add proper handling of XS_=
ERROR from Xenbus for transactions.)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (8603e1b30027 workqueue: fix hang involving rac=
ing cancel[_delayed]_work_sync()'s for PREEMPT_NONE)
Merging drivers-x86/for-next (b4dd04ac6ef8 thinkpad_acpi: use DEVICE_ATTR_*=
 macros)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (7d720ee52598 Merge remote-tracking branches 'regma=
p/fix/irq', 'regmap/fix/rbtree' and 'regmap/fix/sync' into regmap-linus)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (ca1bb4ee4c3a leds: Introduce devres helper for led_c=
lassdev_register)
Merging ipmi/for-next (3a31f945b709 ipmi: Remove incorrect use of seq_has_o=
verflowed)
Merging driver-core/driver-core-next (c517d838eb7d Linux 4.0-rc1)
Merging tty/tty-next (becba85f0e1c Merge 4.0-rc3 into tty-testing)
Merging usb/usb-next (9eccca084320 Linux 4.0-rc3)
Merging usb-gadget/next (9eccca084320 Linux 4.0-rc3)
Merging usb-serial/usb-next (394a10331a9e USB: ch341: remove redundant clos=
e from open error path)
Merging staging/staging-next (355a73f07d1d Merge 4.0-rc3 into staging-next)
Merging char-misc/char-misc-next (e94f16a4fde6 Merge 4.0-rc3 into char-misc=
-next)
Merging cgroup/for-next (695df2132cfe cpuset: initialize cpuset a bit early)
Merging scsi/for-next (0530c35ca4a3 Merge branch 'misc' into for-next)
Merging target-updates/for-next (d23dbaaaa454 tcm_qla2xxx: Expose per endpo=
int dynamic_sessions attribute)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (8b6d5fb9fd02 Merge branch 'devel' into for-next)
Merging vhost/linux-next (1179c21e8917 virtio_blk: fix comment for virtio 1=
.0)
CONFLICT (content): Merge conflict in drivers/virtio/virtio_balloon.c
Merging remoteproc/for-next (9a3c4145af32 Linux 3.16-rc6)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (e6726ee87ee6 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (b65af27ad89d pwm: tegra: Use NSEC_PER_SEC)
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (5bc43f9b6fff Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (6ddf898c23d6 selftests/exec: Check if the syscall e=
xists and bail if not)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (c5b19946eb76 kernel: Fix sparse warning for=
 ACCESS_ONCE)
Merging livepatching/for-next (ebf4ab31f66e Merge branch 'for-4.1/core' int=
o for-next)
Applying: staging: disable the Silicon Motion SM750 framebuffer support
Merging akpm-current/current (1aa4f29f7c1d Fix build errors in asm-generic/=
pgtable.h)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/fid/lpr=
oc_fid.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: mips: ip32: add platform data hooks to use DS1685 driver
Applying: tile/elf: reorganize notify_exec()
Applying: oprofile: reduce mmap_sem hold for mm->exe_file
Applying: powerpc/oprofile: reduce mmap_sem hold for exe_file
Applying: oprofile-reduce-mmap_sem-hold-for-mm-exe_file-fix
Applying: tomoyo: reduce mmap_sem hold for mm->exe_file
Applying: tomoyo-reduce-mmap_sem-hold-for-mm-exe_file-checkpatch-fixes
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (0e30959ba87e mm: add strictlimit knob)

--Sig_//OcToB8/.CMnjGXI3mypqWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/ohOAAoJEMDTa8Ir7ZwV4roP/3mdkY5Mhz0gq4JdCDRJEgH+
6XlHmgBNKcja1/7CQ2hnI90ECgz4kNHOLojsrVy+pEz5Yor+yN9NKbJCi61/DFr7
zhIeF0XW9jx4BMrF/eEoy077JXeTHlhCTTKnJ9/m03h85ElynD4e3CW01ccMritZ
2+km4KdzT75Uh/ivL78LqstKKW76Q+QYGBFGpxUJhAvYHH0Eo9paafJw/ia92q3t
s/WHbAFzKBsBow/swM27d5+MWrzofX1ddnB+OX6sftV3UuJ2hKyubNlZLF0zuN3s
i4PGOOgu67oBf5ZEqIhAHwBnbztSdJxkBsQx1wXsaFtLyQ0yFsIhPFdblDgomULh
/Cl5+jyLq7e+LOpjmTdyYznyjrOZVTc+42tBJda0Rthye+HgHC3Rc3RITLVNxW67
mJ+jlSQWXYyB+XD2F6fNEExwstOjkCYbtQDeZxYy+ZMEOtlg/kD9YjunYzYn3c9I
XKy+JpExfLQ46Foghqgi3KtOh9jrJb1/7uFea/9F1YUAmcUbRJEFfG+J1rQYsPp9
vVhMcqAeBN9ujZDNeGBupqnGvNL3MT8btRSNMIuTZhx4+0exOTTcsR83u6BQ08VG
Y1ScZdrX3Nc3kbtYDadZgm7jkyKkcN+oIrsk3EDIrOmpmqevannQIB8AqNxLBD4I
MWUYyXi7bIo0IRidXUri
=shkA
-----END PGP SIGNATURE-----

--Sig_//OcToB8/.CMnjGXI3mypqWD--
