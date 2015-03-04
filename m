From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 4
Date: Wed, 4 Mar 2015 15:03:41 +1100
Message-ID: <20150304150341.2afe09fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PHHb=sjW/ug7=3jRu+Cj6bU"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47661 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757095AbbCDEDt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2015 23:03:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/PHHb=sjW/ug7=3jRu+Cj6bU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150303:

The md tree still had its build failure so I applied a fix patch.

The mfd tree gained a build failure so I used the version from
next-20150303.

The clk tree still had its build failure so I again used the version
from next-20150225.

Non-merge commits (relative to Linus' tree): 2315
 2429 files changed, 70869 insertions(+), 52760 deletions(-)

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
Merging origin/master (13a7a6ac0a11 Linux 4.0-rc2)
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
Merging powerpc-merge-mpe/fixes (6262fc474431 powerpc/iommu: Remove IOMMU d=
evice references via bus notifier)
Merging sparc/master (53eb2516972b sparc: semtimedop() unreachable due to c=
omparison error)
Merging net/master (f4f8e7385058 openvswitch: Fix serialization of non-mask=
ed set actions.)
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (8cdebf71098c ALSA: dice: fix wrong offsets=
 for Dice interface)
Merging pci-current/for-linus (4efe874aace5 PCI: Don't read past the end of=
 sysfs "driver_override" buffer)
Merging wireless-drivers/master (c8f034558669 rtlwifi: Improve handling of =
IPv6 packets)
Merging driver-core.current/driver-core-linus (c517d838eb7d Linux 4.0-rc1)
Merging tty.current/tty-linus (c517d838eb7d Linux 4.0-rc1)
Merging usb.current/usb-linus (b20b1618b8fc cdc-acm: Add support for Denso =
cradle CU-321)
Merging usb-gadget-fixes/fixes (a0456399fb07 usb: gadget: configfs: don't N=
UL-terminate (sub)compatible ids)
Merging usb-serial-fixes/usb-linus (c7d373c3f0da usb: ftdi_sio: Add jtag qu=
irk support for Cyber Cortex AV boards)
Merging staging.current/staging-linus (abe46b8932dd staging: comedi: adv_pc=
i1710: fix AI INSN_READ for non-zero channel)
Merging char-misc.current/char-misc-linus (6c15a8516b81 mei: make device di=
sabled on stop unconditionally)
Merging input-current/for-linus (4a6155a46565 Input: sun4i-ts - add thermal=
 driver dependency)
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
Merging drm-intel-fixes/for-linux-next-fixes (a6ddea78fa94 drm/i915: Check =
for driver readyness before handling an underrun interrupt)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (3240dd57e533 ARC: Fix thread_saved_pc())
Merging arm/for-next (42203614b435 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (4a3a6f866939 ARM: multi_v7_defconfig: Enable shmo=
bile platforms)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (72a6dbe0ea91 ARM: bcm2835: Use pinctrl header)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (395ae1400a35 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (edb09a949e81 ARM: Kirkwood: enable GPIO fan alarm s=
upport for 2Big Network v2)
Merging omap/for-next (67fd14b3eca6 ARM: dts: am335x-bone*: usb0 is hardwir=
ed for peripheral)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
Merging renesas/next (e83af0aeab0c Merge branch 'heads/sh73a0-multiplatform=
-for-v4.1' into next)
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
Merging microblaze/next (a01d37d914f9 microblaze: Remove *.dtb files in mak=
e clean)
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
Merging nfs/linux-next (369d6b7f0097 NFS: Fix stateid used for NFS v4 close=
s)
Merging nfsd/nfsd-next (76cb4be993c0 sunrpc: integer underflow in rsc_parse=
())
Merging overlayfs/overlayfs-next (4330397e4e8a ovl: discard independent cur=
sor in readdir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (b388e6a7a6ba UBI: fix missing brace control flow)
Merging xfs/for-next (88e8fda99a4c Merge branch 'xfs-mmap-lock' into for-ne=
xt)
Merging file-locks/linux-next (b2b89ebfc0f0 Merge tag 'locks-v3.20-2' of gi=
t://git.samba.org/jlayton/linux)
Merging vfs/for-next (ca160d0085b6 kill struct filename.separate)
Merging pci/next (c517d838eb7d Linux 4.0-rc1)
Merging hid/for-next (921d240536dc Merge branch 'for-4.1/huion-uclogic-merg=
e' into for-next)
Merging i2c/i2c/for-next (c517d838eb7d Linux 4.0-rc1)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (7bb8bd34c133 hwmon: (it87) No need to ski=
p fan4 for IT8603)
Merging v4l-dvb/master (48b777c0833b Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (94100b52d1c0 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (29200f12a116 sata-fsl: Apply link speed limits)
Merging pm/linux-next (2cabcb5b1dce Merge branch 'suspend-to-idle' into lin=
ux-next)
Merging idle/next (210109f4a19a Merge branches 'turbostat', 'sfi' and 'cpui=
dle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (5912e264d9ee Merge branch 'tmon-fixes' of .git into n=
ext)
Merging thermal-soc/next (c57d2a8eba22 Merge branch 'work-fixes' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (4b18b4fc017b Merge branch 'for-linus' into next)
Merging net-next/master (1cea7e2c9fb3 l2tp: Use eth_<foo>_addr instead of m=
emset)
CONFLICT (content): Merge conflict in drivers/net/ethernet/rocker/rocker.c
Merging ipsec-next/master (ff660f75be36 Merge branch 'stmmac-pci')
Merging wireless-drivers-next/master (0cbfc065fe15 bcma: gpio: enable GPIO =
IRQ domain on BCM5301X)
Merging bluetooth/master (263be3326b89 at86rf230: restore trx len when need=
ed)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (393d23c4e229 mtd: atmel_nand: fix typo in dev_err er=
ror message)
Merging crypto/master (d9850fc529ef crypto: powerpc/sha1 - kernel config)
Merging drm/drm-next (329414c4e7b7 Merge tag 'topic/drm-misc-2015-02-25' of=
 git://anongit.freedesktop.org/drm-intel into drm-next)
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (302e0cd54b7f drm/i915/skl: Only use the 8=
00mV+2bB HDMI translation entry)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
Merging drm-tegra/drm/tegra/for-next (07d05cbf60ed drm/tegra: dc: Move more=
 code into ->init())
Merging drm-misc/topic/drm-misc (756ed95dd717 drm/dp: add DPCD definitions =
from eDP 1.4)
Merging sound/for-next (9603cded0e2c ALSA: cmipci: remove a stray space cha=
racter)
Merging sound-asoc/for-next (cd76d3a1b443 Merge remote-tracking branches 'a=
soc/topic/rt5677', 'asoc/topic/tegra', 'asoc/topic/wm-adsp' and 'asoc/topic=
/wm8804' into asoc-next)
Merging modules/modules-next (9cc019b8c94f module: Replace over-engineered =
nested sleep)
Merging virtio/virtio-next (5b40a7daf518 virtio: don't set VIRTIO_CONFIG_S_=
DRIVER_OK twice.)
Merging input/next (0c7e67a928ac Input: add driver for Broadcom keypad cont=
roller)
Merging block/for-next (434c26478166 Merge branch 'for-3.20/core' into for-=
next)
Merging device-mapper/for-next (cc707072be1f dm: rename __dm_get_reserved_i=
os() helper to __dm_get_module_param())
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (c517d838eb7d Linux 4.0-rc1)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (b7f12cb56a52 md/bitmap: fix incorrect DIV_ROUND_UP usa=
ge.)
Applying: md/bitmap: use sector_div for sector_t divisions
Merging mfd/for-mfd-next (f1d3e86a2456 mfd: max77843: Add max77843 MFD driv=
er core driver)
$ git reset --hard HEAD^
Merging next-20150303 version of mfd
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (1d93b8502963 power/smb347-charger.c: set IRQF_ONESH=
OT flag to ensure IRQ request)
Merging omap_dss2/for-next (d6c2152b3efd Merge branches '3.20/fbdev' and '3=
.20/omapdss' into for-next)
Merging regulator/for-next (224c7f4452a2 Merge remote-tracking branches 're=
gulator/topic/load-op' and 'regulator/topic/wm8350' into regulator-next)
Merging security/next (74f0414b2f9a Merge tag 'yama-4.0' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/kees/linux into next)
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (387fb779789d selinux: reconcile security_netlbl_secat=
tr_to_sid() and mls_import_netlbl_cat())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (c517d838eb7d Linux 4.0-rc1)
Merging iommu/next (a3f447a4f19c iommu/msm: Mark driver BROKEN)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (6140a8f56238 vfio-pci: Add device request interface)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (b0e1ee8e1405 MSI-HOWTO.txt: remove reference on =
IRQF_DISABLED)
Merging trivial/for-next (edb0ec0725bb kexec, Kconfig: spell "architecture"=
 properly)
Merging audit/next (5b28255278dd audit: reduce mmap_sem hold for mm->exe_fi=
le)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (48b744da6697 Documentation: DT: Renamed of-serial.t=
xt to 8250.txt)
Merging mailbox/mailbox-for-next (9f3e3cacb2ff dt: mailbox: add generic bin=
dings)
Merging spi/for-next (32c1b872adbd Merge remote-tracking branch 'spi/topic/=
spidev' into spi-next)
Merging tip/auto-latest (be8061cdff5d Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (2ec591ac7422 EDAC, amd64_edac: Get rid of per-no=
de driver instances)
Merging irqchip/irqchip/for-next (5e3227d73d4d Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c19565fc83e6 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (adf08d96e008 rcu: Modulate grace-period slow init to =
normalize delay)
Merging kvm/linux-next (4ff6f8e61eb7 KVM: emulate: fix CMPXCHG8B on 32-bit =
hosts)
Merging kvm-arm/next (4b990589952f KVM: Remove unused config symbol)
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (4779b5e32723 KVM: s390: Create ioctl for Getting/Sett=
ing guest storage keys)
Merging xen-tip/linux-next (a2e75bc2ee20 xenbus: Add proper handling of XS_=
ERROR from Xenbus for transactions.)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (bba5a377507e workqueue: fix hang involving rac=
ing cancel[_delayed]_work_sync()'s for PREEMPT_NONE)
Merging drivers-x86/for-next (c57c0fa4bc9c toshiba_acpi: Cleanup GPL header)
Merging chrome-platform/for-next (f3f837e52b14 platform/chrome: Expose Chro=
me OS Lightbar to users)
Merging regmap/for-next (48bbdbb173fa Merge remote-tracking branch 'regmap/=
fix/irq' into regmap-linus)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (0cd1b0c3adaa leds: Let the binding document example =
for leds-gpio follow the gpio bindings)
Merging ipmi/for-next (3a31f945b709 ipmi: Remove incorrect use of seq_has_o=
verflowed)
Merging driver-core/driver-core-next (c517d838eb7d Linux 4.0-rc1)
Merging tty/tty-next (c517d838eb7d Linux 4.0-rc1)
Merging usb/usb-next (c517d838eb7d Linux 4.0-rc1)
Merging usb-gadget/next (c517d838eb7d Linux 4.0-rc1)
Merging usb-serial/usb-next (394a10331a9e USB: ch341: remove redundant clos=
e from open error path)
Merging staging/staging-next (ef2e1a4410e3 staging/lustre/llite: Fix obd na=
me after c&p error)
Merging char-misc/char-misc-next (c517d838eb7d Linux 4.0-rc1)
Merging cgroup/for-next (587945147cfe cgroup: Use kvfree in pidlist_free())
Merging scsi/for-next (cad8000836ef Merge branch 'misc' into for-next)
Merging target-updates/for-next (d4c5dcacfaff target: rewrite fd_execute_wr=
ite_same)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (c517d838eb7d Linux 4.0-rc1)
Merging vhost/linux-next (1179c21e8917 virtio_blk: fix comment for virtio 1=
.0)
Merging remoteproc/for-next (9a3c4145af32 Linux 3.16-rc6)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (2f97c20e5f7c gpio: tps65912: fix wrong container_of =
arguments)
Merging dma-mapping/dma-mapping-next (dda02fd6278d mm, cma: make parameters=
 order consistent in func declaration and definition)
Merging pwm/for-next (b65af27ad89d pwm: tegra: Use NSEC_PER_SEC)
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (ebd367676852 clk: clk_set_parent() with current paren=
t shouldn't fail)
$ git reset --hard HEAD^
Merging next-20150225 version of clk
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
Merging luto-misc/next (4710be56d76e x86_64, entry: Remove a bogus ret_from=
_fork optimization)
Merging access_once/linux-next (c5b19946eb76 kernel: Fix sparse warning for=
 ACCESS_ONCE)
Merging livepatching/for-next (0b1446be10a0 Merge branch 'for-4.0/upstream-=
fixes' into for-next)
Merging akpm-current/current (c607a4d95b88 lib/lz4/lz4_decompress.c: pull o=
ut constant tables)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/fid/lpr=
oc_fid.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/pgtable.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: mips: ip32: add platform data hooks to use DS1685 driver
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (1788925de436 mm: add strictlimit knob)

--Sig_/PHHb=sjW/ug7=3jRu+Cj6bU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU9oQiAAoJEMDTa8Ir7ZwV09EP/infnQG6K1sY3DdkCCM7UP61
ExSVyVpD+aswt9IPfoMhnd8ACFQZRHrqs5JyG74uoujina2nk6sAw4YKfzwP0YWe
NRdXQjZUqm3Tvp4ZEocRJkCjH9TviK6CEkXdW5ce5aJ3YBvCvirOxI8i9xS78cka
tEL12q4YCebut2gfeIwYQqPQ8+WC4GApHTxFsWvjMlIyfpM2sB8tb++zhm5IM0xO
jiLASPXVF7642z/hCh08tWStBWFJZzdjm38l6aq2gXMKwQE3RmYGSpP5zOmSY2Eg
w0vNw3mIERBlIaIfUf0R3V01PADnsqkhBjsorZjQrVR1eeBOwzPT+E6hV4FM9q4+
7JlFbm+9Yn8Pq6J2v8VUDNonjvjwElE9PXc8ePdxHsz5S9qkwUOwLC5+cDpOZ8AN
dvmTji9Qk8F+GvNC2gikxt9Q3wG6EWQPNaWxn86Iio519UPpawWaOdGlnuQEt6Sp
rFUQ7YClhu0tDMK10xcwa9hApBf56A1lZaqO46i8lBdeaooTmyH4p/n74K4T/sDx
mpaEuo5f0k92OP6TucNo19biZyabbCJv/y+nTAPEq+3n8HnjhK5UzAtwL+B3dw8J
gjmfBH33thFwF8/r43X3cEbCI2Y/o0MmAkA6Mp0dKf7UJL9Y7hXhLscCcbQ6QvFE
CE3jKl9MUtWb+N2JrUch
=IM8K
-----END PGP SIGNATURE-----

--Sig_/PHHb=sjW/ug7=3jRu+Cj6bU--
