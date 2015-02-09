From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 9
Date: Mon, 9 Feb 2015 21:18:27 +1100
Message-ID: <20150209211827.652dc2ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a8WrpBIqCozBOPzrcTNUs72"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58582 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759999AbbBIKSe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2015 05:18:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/a8WrpBIqCozBOPzrcTNUs72
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please oo not add any material destined for v3.21 to your linux-next
included trees until after v3.20-rc1 has been released.

Changes since 20150204:

The pm tree gained a build failure for which I applied a merge fix patch.

The net-next tree gained a build failure for which I applied a fix patch.

The wireless-drivers-next tree gained a conflict against Linus' tree.

The sound-asoc tree gained a build failure for which I applied a fix
patch.

The block tree gained a conflict against the vfs tree and a build failure
for which I applied a merge fix patch.

The kvm tree gained a conflict against Linus' tree.

The scsi tree lost its build failure.

The target-updates tree gained a conflict against the net-next tree.

The akpm-current tree lost its build failure and gained conflicts against
the net-next tree.

Non-merge commits (relative to Linus' tree): 8278
 7966 files changed, 341565 insertions(+), 183907 deletions(-)

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

I am currently merging 206 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (0b1ce1a8ca14 Merge tag 'rdma-for-linus' of git://git=
.kernel.org/pub/scm/linux/kernel/git/roland/infiniband)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (a16c5f99a28c kbuild: Fix removal of the de=
bian/ directory)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (8e6480667246 ARM: 8299/1: mm: ensure local activ=
e ASID is marked as allocated on rollover)
Merging m68k-current/for-linus (f27bd5bfeda5 m68k: Wire up execveat)
Merging metag-fixes/fixes (ffe6902b66aa asm-generic: remove _STK_LIM_MAX)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (31345e1a071e powerpc/pci: Remove unused force_=
32bit_msi quirk)
Merging powerpc-merge-mpe/fixes (c59c961ca511 Merge branch 'drm-fixes' of g=
it://people.freedesktop.org/~airlied/linux)
Merging sparc/master (66d0f7ec9f10 sparc32: destroy_context() and switch_mm=
() needs to disable interrupts.)
Merging net/master (fd972b736bfe amd-xgbe: Check per channel DMA interrupt =
use in main ISR)
Merging ipsec/master (cd3bafc73d11 xfrm6: Fix a offset value for network he=
ader in _decode_session6)
Merging sound-current/for-linus (d2255c016365 Merge tag 'asoc-fix-ac97-v3.1=
9-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into =
for-linus)
Merging pci-current/for-linus (06cf35f903aa PCI: Handle read-only BARs on A=
MD CS553x devices)
Merging wireless-drivers/master (e3f31175a3ee ath9k: fix race condition in =
irq processing during hardware reset)
Merging driver-core.current/driver-core-linus (26bc420b59a3 Linux 3.19-rc6)
Merging tty.current/tty-linus (ec6f34e5b552 Linux 3.19-rc5)
Merging usb.current/usb-linus (e36f014edff7 Linux 3.19-rc7)
Merging usb-gadget-fixes/fixes (0df8fc37f6e4 usb: phy: never defer probe in=
 non-OF case)
Merging usb-serial-fixes/usb-linus (a6f0331236fa USB: cp210x: add ID for RU=
GGEDCOM USB Serial Console)
Merging staging.current/staging-linus (e36f014edff7 Linux 3.19-rc7)
Merging char-misc.current/char-misc-linus (e36f014edff7 Linux 3.19-rc7)
Merging input-current/for-linus (47c1ffb2b6b6 Input: elantech - add more Fu=
jtisu notebooks to force crc_enabled)
Merging crypto-current/master (3e14dcf7cb80 crypto: add missing crypto modu=
le aliases)
Merging ide/master (f96fe225677b Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging devicetree-current/devicetree/merge (6b1271de3723 of/unittest: Over=
lays with sub-devices tests)
Merging rr-fixes/fixes (d5db139ab376 module: make module_refcount() a signe=
d integer.)
Merging vfio-fixes/for-linus (7c2e211f3c95 vfio-pci: Fix the check on pci d=
evice type in vfio_pci_probe())
Merging kselftest-fixes/fixes (f5db310d77ef selftests/vm: fix link error fo=
r transhuge-stress test)
Merging drm-intel-fixes/for-linux-next-fixes (e36f014edff7 Linux 3.19-rc7)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (091f56be10ef ARC: Fix earlycon build breakage)
Merging arm/for-next (3cc3bcce6a7a Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (d281aa6c6538 arm-soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/Kconfig.debug
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (8553bf8fd181 Merge branch 'berlin/dt' into =
berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (395ae1400a35 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (feeddcd9c17b Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (5cb1e109eee0 Merge tag 'omap-for-v3.20/dt-pt3-v2' in=
to for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
Merging renesas/next (b2cb094d275e Merge branch 'heads/soc-fixes-for-v3.19'=
 into next)
Merging samsung/for-next (aeb011501873 Merge branch 'v3.20-samsung-defconfi=
g-2' into for-next)
Merging sunxi/sunxi/for-next (16e8c17e18d6 Merge branch 'sunxi/clocks-for-3=
.20' into sunxi/for-next)
Merging tegra/for-next (794345d409ad Merge branch for-3.20/arm64 into for-n=
ext)
Merging arm64/for-next/core (d476d94f180a arm64: compat: Remove incorrect c=
omment in compat_siginfo)
CONFLICT (content): Merge conflict in arch/arm64/mm/dump.c
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
Merging c6x/for-linux-next (ae72758f1dd9 c6x: fix build failure caused by c=
ache.h)
Merging cris/for-next (a74f9ec869a8 CRIS: macro whitespace fixes in uaccess=
.h)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (a6b8978c54b7 pstore: Fix sprintf format specifier in pst=
ore_dump())
Merging m68k/for-next (4436820a98cd m68k/defconfig: Enable Ethernet bridgin=
g)
Merging m68knommu/for-next (21b30ca5da14 arch: m68k: 68360: config: Remove =
unused function)
Merging metag/for-next (f93125ae17d1 metag: cachepart: Fix failure check)
Merging microblaze/next (51cae8bfe7dd microblaze: Remove generated *.dtb fi=
les from dts)
Merging mips/mips-for-linux-next (61299b95c369 Merge branch '3.19-fixes' in=
to mips-for-linux-next)
Merging nios2/nios2-next (d24c8163b755 nios2: fix kuser trampoline address)
Merging parisc-hd/for-next (b2776bf7149b Linux 3.18)
Merging powerpc/next (d557b09800da powerpc/mm/thp: Use tlbiel if possible)
Merging powerpc-mpe/next (a6130ed253a9 cxl: Add missing return statement af=
ter handling AFU errror)
Merging fsl/next (0dc294f717d4 powerpc/mm: bail out early when flushing TLB=
 page)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (5c75a0dac309 s390/smp: increase maximum value of NR_=
CPUS to 512)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (b9f705758a4f tile: enable sparse checks for get/put_us=
er)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (1f2fdbd0078c xtensa: disable link optimization)
Merging btrfs/next (eb710b152003 Btrfs: Remove unnecessary placeholder in b=
trfs_err_code)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
Merging cifs/for-next (0a545e3a7494 [SMB3] Update negotiate protocol for SM=
B3.1 dialect)
Merging ecryptfs/next (e7a823be2adc Merge tag 'linux-kselftest-3.19-rc-5' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging ext3/for_next (6981498d7956 udf: remove bool assignment to 0/1)
Merging ext4/dev (d7e9b1b7b9ab ext4: change to use setup_timer() instead of=
 init_timer())
Merging f2fs/dev (d57741508299 f2fs: introduce a batched trim)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (9759bd518994 fuse: add memory barrier to INIT)
Merging gfs2/master (7456a37d55ce GFS2: use __vmalloc GFP_NOFS for fs-relat=
ed allocations.)
Merging jfs/jfs-next (648695c74811 jfs: Deletion of an unnecessary check be=
fore the function call "unload_nls")
Merging nfs/linux-next (bc3203cdca96 Merge tag 'nfs-rdma-for-3.20-part-2' o=
f git://git.linux-nfs.org/projects/anna/nfs-rdma)
Merging nfsd/nfsd-next (168db98e1a62 nfsd: default NFSv4.2 to on)
Merging overlayfs/overlayfs-next (4330397e4e8a ovl: discard independent cur=
sor in readdir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (832b52a15085 UBI: Block: Explain usage of blk_rq_=
map_sg())
Merging xfs/for-next (354240eb1037 Merge branch 'xfs-misc-fixes-for-3.20-4'=
 into for-next)
Merging file-locks/linux-next (8116bf4cb62d locks: update comments that ref=
er to inode->i_flock)
Merging vfs/for-next (c55c3f626bf1 Merge branch 'lazytime' into for-next)
Merging pci/next (cb8e92d8e4d9 Merge branch 'pci/misc' into next)
CONFLICT (content): Merge conflict in arch/mips/pci/pcie-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-bcm1480.c
Merging hid/for-next (dc5439f4c356 Merge branch 'for-3.20/wacom' into for-n=
ext)
Merging i2c/i2c/for-next (19aadd29d23c Merge branch 'i2c/for-3.20' into i2c=
/for-next)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (dd378b1bcaa0 hwmon: (tmp102) add hibernat=
ion callbacks)
Merging v4l-dvb/master (4be541403b86 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (8d18d1d514d1 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (b2776bf7149b Linux 3.18)
Merging libata/for-next (d85aa1624b05 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging pm/linux-next (f877d4a7cf5d Merge branch 'lenb' into linux-next)
Applying: of/pci: fix up for "PCI: Use common resource list management code=
 instead of private implementation"
Merging idle/next (2985a86aa4ec Merge branch 'turbostat' into next)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (ec6f34e5b552 Linux 3.19-rc5)
Merging thermal-soc/next (6c247393cfdd thermal: exynos: Add TMU support for=
 Exynos7 SoC)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (6ed0123a70ac Merge branch 'for-linus' into next)
Merging net-next/master (51a00daf7369 tipc: fix bug in socket reception fun=
ction)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stih410.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stih407-family.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3288.dtsi
Applying: rhashtable: using ERR_PTR requires linux/err.h
Merging ipsec-next/master (ff660f75be36 Merge branch 'stmmac-pci')
Merging wireless-drivers-next/master (d53071143aa5 Merge ath-next from ath.=
git)
CONFLICT (content): Merge conflict in drivers/net/wireless/rtlwifi/pci.c
Merging bluetooth/master (88d9077c27d0 Bluetooth: Fix potential NULL derefe=
rence)
Merging infiniband/for-next (43c6116573ca Revert "IB/core: Add support for =
extended query device caps")
Merging mtd/master (97bf6af1f928 Linux 3.19-rc1)
Merging l2-mtd/master (72f55d74bd12 mtd: hisilicon: add device tree binding=
 documentation)
Merging crypto/master (db71f29a1c32 crypto: testmgr - mark rfc4106(gcm(aes)=
) as fips_allowed)
Merging drm/drm-next (2f8997902e64 Merge tag 'drm-amdkfd-next-fixes-2015-02=
-03' of git://people.freedesktop.org/~gabbayo/linux into drm-next)
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (460822b0b1a7 drm/i915: Prevent use-after-=
free in invalidate_range_start callback)
Merging drm-tegra/drm/tegra/for-next (31f40f86526b drm/tegra: Use correct r=
elocation target offsets)
Merging drm-misc/topic/core-stuff (eb2ed66fe56f drm/irq: Don't disable vbla=
nk interrupts when already disabled)
Merging sound/for-next (d34890cf4113 ALSA: control: fix failure to return n=
umerical ID in 'add' event)
Merging sound-asoc/for-next (5f2885aebca9 Merge remote-tracking branches 'a=
soc/topic/wm8804', 'asoc/topic/wm8904', 'asoc/topic/wm8960', 'asoc/topic/wm=
8988' and 'asoc/topic/xtfpga' into asoc-next)
Applying: ASoC: max98357a: fix !CONFIG_OF build
Merging modules/modules-next (97bf6af1f928 Linux 3.19-rc1)
Merging virtio/virtio-next (76545f066d2a virtio_pci_modern: drop an unused =
function)
Merging input/next (98a4a59ee31a Input: elan_i2c - fix wrong %p extension)
Merging block/for-next (0fede881565b Merge branch 'for-3.20/core' into for-=
next)
CONFLICT (content): Merge conflict in fs/configfs/configfs_internal.h
CONFLICT (content): Merge conflict in drivers/mtd/mtdcore.c
CONFLICT (content): Merge conflict in drivers/ata/libata-core.c
Applying: libata: fix for move of sas tag allocation code
Applying: pnfs/flexfiles: fix FlexFile Layout Driver for removal mapping->b=
acking_dev_info
Merging device-mapper/for-next (d0ce7e911c97 dm snapshot: remove unnecessar=
y NULL checks before vfree() calls)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (017210d1c0dc mmc: sdhci-s3c: solve problem with sleepi=
ng in atomic context)
CONFLICT (content): Merge conflict in drivers/mmc/host/sunxi-mmc.c
Merging kgdb/kgdb-next (c7d9ebf81c45 kdb: Fix off by one error in kdb_cpu())
Merging md/for-next (dfe15ac1c6ad md: wakeup thread upon rdev_dec_pending())
Merging mfd/for-mfd-next (bb400d2120bd mfd: rtsx_usb: Defer autosuspend whi=
le card exists)
Merging backlight/for-backlight-next (3d6969a641d0 MAINTAINERS: Remove my n=
ame from Backlight subsystem)
Merging battery/master (24727b45b484 power_supply: 88pm860x: Fix leaked pow=
er supply on probe fail)
Merging omap_dss2/for-next (d6c2152b3efd Merge branches '3.20/fbdev' and '3=
.20/omapdss' into for-next)
Merging regulator/for-next (5a4eff8e1d1d Merge remote-tracking branches 're=
gulator/topic/rk808', 'regulator/topic/rpm', 'regulator/topic/rt5033' and '=
regulator/topic/tps65023' into regulator-next)
Merging security/next (6eb4e2b41b26 SELinux: fix error code in policydb_ini=
t())
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (7c596bd904b3 SELinux: fix error code in policydb_init=
())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (3b1947a95d33 watchdog: jz4740: Add DT support)
Merging iommu/next (dfc4940c0347 Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/exynos', 'arm/omap', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (c5e6688752c2 vfio/type1: Add conditional rescheduling)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (67c47cfcc710 can-doc: Fixed a wrong filepath in =
can.txt)
Merging trivial/for-next (edb0ec0725bb kexec, Kconfig: spell "architecture"=
 properly)
Merging audit/next (2fded7f44b8f audit: remove vestiges of vers_ops)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (ffe24b28ebff of: Add vendor prefix for OmniVision T=
echnologies)
Merging mailbox/mailbox-for-next (9f3e3cacb2ff dt: mailbox: add generic bin=
dings)
Merging spi/for-next (83a068bb05fc Merge remote-tracking branch 'spi/topic/=
xilinx' into spi-next)
Merging tip/auto-latest (be00467d2161 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (30263b4052c6 EDAC, mv64x60_edac: Fix an error co=
de in probe())
Merging irqchip/irqchip/for-next (91d117921216 irqchip: atmel-aic-common: P=
revent clobbering of priority when changing IRQ type)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (eae473581cf9 tracing: Have mkdir and rmdir be part=
 of tracefs)
Merging rcu/rcu/next (0bf66a0cc45e rcu: Reverse rcu_dereference_check() con=
ditions)
Merging kvm/linux-next (f78195129963 kvm: add halt_poll_ns module parameter)
CONFLICT (content): Merge conflict in arch/arm64/kvm/sys_regs.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/Kconfig
CONFLICT (content): Merge conflict in arch/arm/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm/kvm/Kconfig
Merging kvm-arm/next (4b990589952f KVM: Remove unused config symbol)
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (9903039fb5b0 KVM: Disable compat ioctl for s390)
Merging xen-tip/linux-next (a2e75bc2ee20 xenbus: Add proper handling of XS_=
ERROR from Xenbus for transactions.)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (b5b3ab523e31 Merge branch 'for-3.19-fixes' int=
o for-next)
Merging drivers-x86/for-next (ed52ccbce7ff asus-laptop: use DEVICE_ATTR_xx =
macros)
Merging chrome-platform/for-next (5502486a2077 platform/chrome: chromeos_la=
ptop - Add a limit for deferred retries)
Merging regmap/for-next (b7928606d545 Merge remote-tracking branches 'regma=
p/topic/ac97', 'regmap/topic/doc' and 'regmap/topic/smbus' into regmap-next)
Merging hsi/for-next (67e9a2ce6e07 hsi: nokia-modem: fix uninitialized devi=
ce pointer)
Merging leds/for-next (c6e71f813f72 leds: leds-gpio: Pass on error codes un=
modified)
Merging ipmi/for-next (b942c653ae26 Merge tag 'trace-sh-3.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging driver-core/driver-core-next (adf305f77878 sysfs: fix warning when =
creating a sysfs group without attributes)
Merging tty/tty-next (79ce9d52ae17 tty: remove unused variable sprop)
Merging usb/usb-next (4d4bac4499e9 Merge tag 'usb-for-v3.20' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next)
Merging usb-gadget/next (9298b4aad37e usb: musb: fix device hotplug behind =
hub)
Merging usb-serial/usb-next (3e264ffc831e USB: mos7840: remove unused code)
Merging staging/staging-next (b5d78b7f816e staging: cptm1217: blow it all a=
way)
Merging char-misc/char-misc-next (5fb31cd839c2 coresight: fix function etm_=
writel_cp14() parameter order)
CONFLICT (content): Merge conflict in drivers/char/mem.c
Merging cgroup/for-next (8abba61bcfd4 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging scsi/for-next (4fa3d28c8b88 Merge branch 'misc-next' into for-next)
Merging target-updates/for-next (11378cdbb695 iser-target: Remove duplicate=
 function names)
CONFLICT (content): Merge conflict in drivers/vhost/scsi.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (f724e05baaf0 sh-pfc: emev2 - Fix mangled author n=
ame)
Merging vhost/linux-next (ac26e40d1c8a vhost/net: fix up num_buffers endian=
-ness)
CONFLICT (content): Merge conflict in drivers/vhost/net.c
Merging remoteproc/for-next (9a3c4145af32 Linux 3.16-rc6)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (0a4a3529df40 gpio: kconfig: replace PPC_OF with PPC)
Merging dma-mapping/dma-mapping-next (dda02fd6278d mm, cma: make parameters=
 order consistent in func declaration and definition)
Merging pwm/for-next (8d6cc0738540 pwm: Remove unnecessary check before of_=
node_put())
Merging dma-buf/for-next (4eb2440ed60f reservation: Remove shadowing local =
variable 'ret')
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (73e0e496afda clkdev: Always allocate a struct clk and=
 call __clk_get() w/ CCF)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/io.c
CONFLICT (modify/delete): arch/arm/mach-omap2/cclock3xxx_data.c deleted in =
clk/clk-next and modified in HEAD. Version HEAD of arch/arm/mach-omap2/cclo=
ck3xxx_data.c left in tree.
$ git rm -f arch/arm/mach-omap2/cclock3xxx_data.c
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
Merging luto-misc/next (188c901941ef Merge branch 'leds-fixes-for-3.19' of =
git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds)
Merging access_once/linux-next (c5b19946eb76 kernel: Fix sparse warning for=
 ACCESS_ONCE)
Merging livepatching/for-next (f638f4dc0880 livepatch: add missing newline =
to error message)
Merging akpm-current/current (d07b956c650a scripts/gdb: Add infrastructure)
CONFLICT (content): Merge conflict in mm/swap.c
CONFLICT (content): Merge conflict in mm/pagewalk.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in include/linux/mm.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: rtc: isl12022: deprecate use of isl in compatible string for isil
Applying: rtc: isl12057: deprecate use of isl in compatible string for isil
Applying: staging: iio: isl29028: deprecate use of isl in compatible string=
 for isil
Applying: arm: dts: zynq: update isl9305 compatible string to use isil vend=
or prefix
Applying: mm: fix XIP fault vs truncate race
Applying: mm-fix-xip-fault-vs-truncate-race-fix
Applying: mm-fix-xip-fault-vs-truncate-race-fix-fix
Applying: mm: allow page fault handlers to perform the COW
Applying: mm-allow-page-fault-handlers-to-perform-the-cow-fix
Applying: mm-allow-page-fault-handlers-to-perform-the-cow-fix-fix-3
Applying: mm-allow-page-fault-handlers-to-perform-the-cow-fix-fix
Applying: vfs,ext2: introduce IS_DAX(inode)
Applying: dax,ext2: replace XIP read and write with DAX I/O
Applying: dax,ext2: replace ext2_clear_xip_target with dax_clear_blocks
Applying: dax,ext2: replace the XIP page fault handler with the DAX page fa=
ult handler
Applying: daxext2-replace-the-xip-page-fault-handler-with-the-dax-page-faul=
t-handler-fix
Applying: daxext2-replace-the-xip-page-fault-handler-with-the-dax-page-faul=
t-handler-fix-2
Applying: daxext2-replace-the-xip-page-fault-handler-with-the-dax-page-faul=
t-handler-fix-3
Applying: dax,ext2: replace xip_truncate_page with dax_truncate_page
Applying: dax: replace XIP documentation with DAX documentation
Applying: vfs: remove get_xip_mem
Applying: ext2: remove ext2_xip_verify_sb()
Applying: ext2: remove ext2_use_xip
Applying: ext2: remove xip.c and xip.h
Applying: vfs,ext2: remove CONFIG_EXT2_FS_XIP and rename CONFIG_FS_XIP to C=
ONFIG_FS_DAX
Applying: ext2: remove ext2_aops_xip
Applying: ext2: get rid of most mentions of XIP in ext2
Applying: dax: add dax_zero_page_range
Applying: dax-add-dax_zero_page_range-fix
Applying: ext4: add DAX functionality
Applying: ext4-add-dax-functionality-fix
Applying: brd: rename XIP to DAX
Applying: MAINTAINERS: fix spelling mistake & remove trailing WS
Applying: ocfs2: prepare some interfaces used in append direct io
Applying: ocfs2: add functions to add and remove inode in orphan dir
Applying: ocfs2-add-functions-to-add-and-remove-inode-in-orphan-dir-fix
Applying: ocfs2: add orphan recovery types in ocfs2_recover_orphans
Applying: ocfs2: implement ocfs2_direct_IO_write
Applying: ocfs2-implement-ocfs2_direct_io_write-fix
Applying: ocfs2: allocate blocks in ocfs2_direct_IO_get_blocks
Applying: ocfs2: do not fallback to buffer I/O write if appending
Applying: ocfs2: complete the rest request through buffer io
Applying: ocfs2: wait for orphan recovery first once append O_DIRECT write =
crash
Applying: ocfs2: set append dio as a ro compat feature
Applying: ocfs2: use 64bit variables to track heartbeat time
Applying: powerpc: drop _PAGE_FILE and pte_file()-related helpers
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: lib/Kconfig: use bool instead of boolean
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (66ec96d7f305 mm: add strictlimit knob)

--Sig_/a8WrpBIqCozBOPzrcTNUs72
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2Il3AAoJEMDTa8Ir7ZwVNrsP/RfhcQG54SKukXMBfYFPsLWM
A/ZITZp6UYkQeSI+KxzZBvOPdJdI6gvVbGdrgGIf3yc13b9PTc4RktElpxAn0RAh
XmrHtl1bPpVUNUmqXKgBg88MCGhAp0IrCC7XTAYB1Hi+64mve0+9Rm/NjAWIvvE4
BK+MIknXBaZnDH8K9tQh2w+tSeRulVo/9qhekZfGXwxwkJ/B8hJmZ1HY/FDOCucQ
WteTCmerVrugJMS5vZ/mGGbmuvvjKrwLRWBDJmAAcQFC2H9SmkMVdQ3zhdh7Mjl5
QXKema+T/30qWjk7fL/yNXeKweqOeImervf1NDC+y/uS5cXGe7tPM6wappOWHyl5
yUDvq0NRwABAgnASW6QXOEAvS4+QXjbM0gEyCfbx+5LQKCKAdbUqHFmM4/RZJHZs
ls0i9/OGaNg+dWDD/deM6X+/EmXIZOTNpALuRtMUCMRRulLmFMfStkFHDtUE7BSm
oVtMv3FAEzK2DZYN1SpOw6crqy8zq/l0y0LKofZHWiGUzKBEtgJKq6iG7PmMchov
0GFHAyIfJRJs1ZviUgjDLLcvwyC6hlOUui/IMnon7FqgoyIToohRe5WJ6rhK5mpj
FjqJWYLtDuhywIwBocvfRlqAEOaFuIXty2xbDUrSVcdFdgCLoJ2XfghaJ4oPuOlL
ndkEK1lea6vxr5+jjLdm
=sR5E
-----END PGP SIGNATURE-----

--Sig_/a8WrpBIqCozBOPzrcTNUs72--
