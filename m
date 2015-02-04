From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 4
Date: Wed, 4 Feb 2015 19:35:35 +1100
Message-ID: <20150204193535.58f132c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l2yYTvZOIutM9SzVa21+vLY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36864 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932773AbbBDIfo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2015 03:35:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/l2yYTvZOIutM9SzVa21+vLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The next release I will be making will be next-20150209 - which will
probably be after the v3.19 release.

Changes since 20150203:

The sound-asoc tree gained a conflict against the sound tree.

The scsi tree gained a build failure caused by an interaction with the
driver-core tree.  I applied a merge fix patch.

The akpm-current tree gained a build failure for which I disabled
CONFIG_KASAN.

Non-merge commits (relative to Linus' tree): 7461
 7314 files changed, 309736 insertions(+), 172363 deletions(-)

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
Merging origin/master (0f98c38d725f Merge branch 'for-linus' of git://git.k=
ernel.dk/linux-block)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (a16c5f99a28c kbuild: Fix removal of the de=
bian/ directory)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (8e6480667246 ARM: 8299/1: mm: ensure local activ=
e ASID is marked as allocated on rollover)
CONFLICT (content): Merge conflict in arch/arm/mm/dma-mapping.c
Merging m68k-current/for-linus (f27bd5bfeda5 m68k: Wire up execveat)
Merging metag-fixes/fixes (ffe6902b66aa asm-generic: remove _STK_LIM_MAX)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (31345e1a071e powerpc/pci: Remove unused force_=
32bit_msi quirk)
Merging powerpc-merge-mpe/fixes (c59c961ca511 Merge branch 'drm-fixes' of g=
it://people.freedesktop.org/~airlied/linux)
Merging sparc/master (66d0f7ec9f10 sparc32: destroy_context() and switch_mm=
() needs to disable interrupts.)
Merging net/master (42b5212fee4f xen-netback: stop the guest rx thread afte=
r a fatal error)
Merging ipsec/master (59343cd7c480 Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging sound-current/for-linus (4161b4505f16 ALSA: ak411x: Fix stall in wo=
rk callback)
Merging pci-current/for-linus (51ac3d2f0c50 PCI: Add NEC variants to Stratu=
s ftServer PCIe DMI check)
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
Merging drm-intel-fixes/for-linux-next-fixes (6b96d705f3cf drm/i915: BDW Fi=
x Halo PCI IDs marked as ULT.)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (ffb7fcd66f14 ARC: Dynamically determine BASE_BAUD fro=
m DeviceTree)
Merging arm/for-next (9eebc2f34ed8 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (f9db7e23d11f Merge branch 'fixes' into for-next)
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
Merging samsung/for-next (ce275c369a0b Merge branch 'v3.20-samsung-cpuidle'=
 into for-next)
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
Merging m68knommu/for-next (8d84d4aaf311 arch: m68k: 68360: config: Remove =
unused function)
Merging metag/for-next (f93125ae17d1 metag: cachepart: Fix failure check)
Merging microblaze/next (51cae8bfe7dd microblaze: Remove generated *.dtb fi=
les from dts)
Merging mips/mips-for-linux-next (a788a832b557 Merge branch '3.19-fixes' in=
to mips-for-linux-next)
Merging nios2/nios2-next (d24c8163b755 nios2: fix kuser trampoline address)
Merging parisc-hd/for-next (b2776bf7149b Linux 3.18)
Merging powerpc/next (d557b09800da powerpc/mm/thp: Use tlbiel if possible)
Merging powerpc-mpe/next (fe12545e7650 powerpc/kernel: Avoid initializing d=
evice-tree pointer twice)
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
Merging btrfs/next (1edb647bb954 Btrfs: remove non-sense btrfs_error_discar=
d_extent() function)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
Merging cifs/for-next (7a1ceba07170 cifs: fix MUST SecurityFlags filtering)
Merging ecryptfs/next (e7a823be2adc Merge tag 'linux-kselftest-3.19-rc-5' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging ext3/for_next (b10a08194c2b quota: Store maximum space limit in byt=
es)
Merging ext4/dev (d7e9b1b7b9ab ext4: change to use setup_timer() instead of=
 init_timer())
Merging f2fs/dev (ef6cb91687cc f2fs: show the number of writeback pages in =
stat)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (9759bd518994 fuse: add memory barrier to INIT)
Merging gfs2/master (45094a58b1f5 GFS2: Eliminate a nonsense goto)
Merging jfs/jfs-next (648695c74811 jfs: Deletion of an unnecessary check be=
fore the function call "unload_nls")
Merging nfs/linux-next (c7c545d4a348 NFS: a couple off by ones)
Merging nfsd/nfsd-next (168db98e1a62 nfsd: default NFSv4.2 to on)
Merging overlayfs/overlayfs-next (4330397e4e8a ovl: discard independent cur=
sor in readdir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (832b52a15085 UBI: Block: Explain usage of blk_rq_=
map_sg())
Merging xfs/for-next (179073620d80 Merge branch 'xfs-ioctl-setattr-cleanup'=
 into for-next)
Merging file-locks/linux-next (8116bf4cb62d locks: update comments that ref=
er to inode->i_flock)
Merging vfs/for-next (795b4313ea3b Merge branch 'iov_iter' into for-next)
Merging pci/next (66e5bde9e5f9 Merge branches 'pci/misc' and 'pci/msi' into=
 next)
CONFLICT (content): Merge conflict in arch/mips/pci/pcie-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-bcm1480.c
Merging hid/for-next (dc5439f4c356 Merge branch 'for-3.20/wacom' into for-n=
ext)
Merging i2c/i2c/for-next (6d9130940f26 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (dd378b1bcaa0 hwmon: (tmp102) add hibernat=
ion callbacks)
Merging v4l-dvb/master (4be541403b86 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (8d18d1d514d1 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (b2776bf7149b Linux 3.18)
Merging libata/for-next (d85aa1624b05 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging pm/linux-next (12f24f2d78ce Merge branch 'master' into linux-next)
Merging idle/next (2985a86aa4ec Merge branch 'turbostat' into next)
CONFLICT (content): Merge conflict in arch/x86/include/uapi/asm/msr-index.h
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (ec6f34e5b552 Linux 3.19-rc5)
Merging thermal-soc/next (1024cf8b0fcd thermal: exynos: Remove exynos_tmu_d=
ata.c file)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (6d78a5eb4df8 Merge branch 'for-linus' into next)
Merging net-next/master (7d37d0c1591b net: sctp: Deletion of an unnecessary=
 check before the function call "kfree")
CONFLICT (content): Merge conflict in include/linux/if_vlan.h
CONFLICT (content): Merge conflict in drivers/net/vxlan.c
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stih410.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stih407-family.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3288.dtsi
Merging ipsec-next/master (ff660f75be36 Merge branch 'stmmac-pci')
Merging wireless-drivers-next/master (7201472ed376 wil6210: Remove msm plat=
form related code)
Merging bluetooth/master (88d9077c27d0 Bluetooth: Fix potential NULL derefe=
rence)
Merging infiniband/for-next (ecb7b1233c53 Merge branches 'ipoib' and 'odp' =
into for-next)
Merging mtd/master (97bf6af1f928 Linux 3.19-rc1)
Merging l2-mtd/master (cd145af99888 mtd: nand: jz4740: Convert to GPIO desc=
riptor API)
Merging crypto/master (db71f29a1c32 crypto: testmgr - mark rfc4106(gcm(aes)=
) as fips_allowed)
Merging drm/drm-next (e4bf44b3b558 drm/modes: Print the mode status in huma=
n readable form)
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (1293eaa3ebf9 drm/i915: Update DRIVER_DATE=
 to 20150130)
Merging drm-tegra/drm/tegra/for-next (31f40f86526b drm/tegra: Use correct r=
elocation target offsets)
Merging drm-misc/topic/core-stuff (eb2ed66fe56f drm/irq: Don't disable vbla=
nk interrupts when already disabled)
Merging sound/for-next (3fe9cf390f6d Merge branch 'topic/snd-device' into f=
or-next)
Merging sound-asoc/for-next (8c5628670450 Merge remote-tracking branches 'a=
soc/topic/wm8988' and 'asoc/topic/xtfpga' into asoc-next)
CONFLICT (content): Merge conflict in sound/soc/intel/sst-mfld-platform-pcm=
.c
Merging modules/modules-next (97bf6af1f928 Linux 3.19-rc1)
Merging virtio/virtio-next (76545f066d2a virtio_pci_modern: drop an unused =
function)
Merging input/next (83edfdf30b6f Input: ti_am335x_tsc - replace delta filte=
ring with median filtering)
Merging block/for-next (59a6b34ea094 Merge branch 'for-3.20/drivers' into f=
or-next)
CONFLICT (content): Merge conflict in drivers/mtd/mtdcore.c
CONFLICT (content): Merge conflict in drivers/ata/libata-core.c
Applying: libata: fix for move of sas tag allocation code
Merging device-mapper/for-next (f7b2d0c5f5f1 Merge tag 'dm-3.19-fixes-3' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm into =
dm-for-3.20)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (4febb7e20aa6 mmc: core: Invoke mmc_pwrseq_post_power_o=
n() prior MMC_POWER_ON state)
CONFLICT (content): Merge conflict in drivers/mmc/host/sunxi-mmc.c
Merging kgdb/kgdb-next (c7d9ebf81c45 kdb: Fix off by one error in kdb_cpu())
Merging md/for-next (02363a04af62 md: wakeup thread upon rdev_dec_pending())
Merging mfd/for-mfd-next (bb400d2120bd mfd: rtsx_usb: Defer autosuspend whi=
le card exists)
Merging backlight/for-backlight-next (3d6969a641d0 MAINTAINERS: Remove my n=
ame from Backlight subsystem)
Merging battery/master (24727b45b484 power_supply: 88pm860x: Fix leaked pow=
er supply on probe fail)
Merging omap_dss2/for-next (7efc436cd45c Merge branches '3.20/fbdev' and '3=
.20/omapdss' into for-next)
Merging regulator/for-next (8966da9ce0c8 Merge remote-tracking branches 're=
gulator/topic/rpm', 'regulator/topic/rt5033' and 'regulator/topic/tps65023'=
 into regulator-next)
Merging security/next (11cd64a234d5 ima: /proc/keys is now mandatory)
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (7c596bd904b3 SELinux: fix error code in policydb_init=
())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (3b1947a95d33 watchdog: jz4740: Add DT support)
Merging iommu/next (dfc4940c0347 Merge branches 'iommu/fixes', 'arm/renesas=
', 'arm/exynos', 'arm/omap', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (5e9f36c59a48 drivers/vfio: allow type-1 IOMMU instantiat=
ion on top of an ARM SMMU)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (202799be447b doc: brief user documentation for c=
ompletion)
Merging trivial/for-next (edb0ec0725bb kexec, Kconfig: spell "architecture"=
 properly)
Merging audit/next (2fded7f44b8f audit: remove vestiges of vers_ops)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (e94fbe607f8c dt-bindings: use isil prefix for Inter=
sil in vendor-prefixes.txt)
Merging mailbox/mailbox-for-next (9f3e3cacb2ff dt: mailbox: add generic bin=
dings)
Merging spi/for-next (a66975cfbd06 Merge remote-tracking branches 'spi/topi=
c/st-ssc' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (2619a5bcf0c8 manual merge of x86/ras)
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
Merging ftrace/for-next (7eeafbcab47f tracing: Separate out initializing to=
p level dir from instances)
Merging rcu/rcu/next (0bf66a0cc45e rcu: Reverse rcu_dereference_check() con=
ditions)
Merging kvm/linux-next (8fff5e374a2f Merge tag 'kvm-s390-next-20150122' of =
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-next)
CONFLICT (content): Merge conflict in arch/arm64/kvm/sys_regs.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/Kconfig
CONFLICT (content): Merge conflict in arch/arm/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/arm/kvm/Kconfig
Merging kvm-arm/next (4b990589952f KVM: Remove unused config symbol)
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (baef0b686c61 KVM: s390: add ioctl to inject local int=
errupts)
Merging xen-tip/linux-next (dab069c61aa3 xen/gntdev: provide find_special_p=
age VMA operation)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (b5b3ab523e31 Merge branch 'for-3.19-fixes' int=
o for-next)
Merging drivers-x86/for-next (ed52ccbce7ff asus-laptop: use DEVICE_ATTR_xx =
macros)
Merging chrome-platform/for-next (5502486a2077 platform/chrome: chromeos_la=
ptop - Add a limit for deferred retries)
Merging regmap/for-next (d367ebab510a Merge remote-tracking branches 'regma=
p/topic/ac97' and 'regmap/topic/doc' into regmap-next)
Merging hsi/for-next (67e9a2ce6e07 hsi: nokia-modem: fix uninitialized devi=
ce pointer)
Merging leds/for-next (c6e71f813f72 leds: leds-gpio: Pass on error codes un=
modified)
Merging ipmi/for-next (b942c653ae26 Merge tag 'trace-sh-3.19' of git://git.=
kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging driver-core/driver-core-next (d1f1052c5204 device: Change dev_<leve=
l> logging functions to return void)
Merging tty/tty-next (eb1527a8738b tty/serial: serial8250_set_divisor() can=
 be static)
Merging usb/usb-next (b3a54bf9ed76 Merge 3.19-rc7 into usb-next)
Merging usb-gadget/next (303fb92eabb8 usb: musb: fix device hotplug behind =
hub)
CONFLICT (content): Merge conflict in drivers/usb/musb/musb_virthub.c
Merging usb-serial/usb-next (3e264ffc831e USB: mos7840: remove unused code)
Merging staging/staging-next (178cf7de6f1d Merge 3.19-rc7 into staging-next)
Merging char-misc/char-misc-next (786f949631c7 Merge tag 'extcon-next-for-3=
.20' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into c=
har-misc-next)
CONFLICT (content): Merge conflict in drivers/char/mem.c
Merging cgroup/for-next (8abba61bcfd4 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging scsi/for-next (ec0c9b17ab9f Merge branch 'misc' into for-next)
Applying: scsi: merge resolution for dev_printk API change
Merging target-updates/for-next (2440cd3b0d21 vhost/scsi: Global tcm_vhost =
-> vhost_scsi rename)
CONFLICT (content): Merge conflict in drivers/vhost/scsi.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (8f61904b0b20 Merge branch 'devel' into for-next)
Merging vhost/linux-next (eaa27f34e91a linux 3.19-rc4)
Merging remoteproc/for-next (9a3c4145af32 Linux 3.16-rc6)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (8c8ec414bdf5 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (dda02fd6278d mm, cma: make parameters=
 order consistent in func declaration and definition)
Merging pwm/for-next (8d6cc0738540 pwm: Remove unnecessary check before of_=
node_put())
Merging dma-buf/for-next (4eb2440ed60f reservation: Remove shadowing local =
variable 'ret')
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (17150fef4ab1 ktest: Add back "tail -1" to kernelrel=
ease make)
Merging clk/clk-next (a251361ac4cc clkdev: Export clk_register_clkdev)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/io.c
CONFLICT (modify/delete): arch/arm/mach-omap2/cclock3xxx_data.c deleted in =
clk/clk-next and modified in HEAD. Version HEAD of arch/arm/mach-omap2/cclo=
ck3xxx_data.c left in tree.
$ git rm -f arch/arm/mach-omap2/cclock3xxx_data.c
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (f84249f4cfef fs/aio: fix sleeping while TASK_INTERRUPTI=
BLE)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (ef6c93c78457 kbuild: add a new kselftest_install ma=
ke target to install selftests)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
Merging luto-misc/next (188c901941ef Merge branch 'leds-fixes-for-3.19' of =
git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds)
Merging access_once/linux-next (c5b19946eb76 kernel: Fix sparse warning for=
 ACCESS_ONCE)
Merging livepatching/for-next (dbed7ddab967 livepatch: fix uninitialized re=
turn value)
Merging akpm-current/current (bde4dd1b1afa samples-seccomp-improve-label-he=
lper-fix)
CONFLICT (content): Merge conflict in mm/swap.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in include/linux/mm.h
Applying: disable CONFIG_KASAN for now
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
Merging akpm/master (7b0800b7654c mm: add strictlimit knob)

--Sig_/l2yYTvZOIutM9SzVa21+vLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0dndAAoJEMDTa8Ir7ZwVI3UP/1aj1NQRs8p/ilExQRMUisBY
m3hO/gl1SpO+zBVvBhLz2w9kMtiUVySfDeKF4FhDwZ3tG3dRPcn6IS+E0jaTPvuX
CKj++RH472+JNPcyRVXDYMizFwMgSOgWKXCVEoCf3vWMOOQYEikxBx6M/wMNCRRa
lapkbrT/Jf8MIbsB11XRbBSKG3t93UodPr7ScdWv/QlqCCy59rJN+m3YGqIuzK9s
ZBWwlQyzY6Zc4JrMqMvJdTIXHV9Pw5Y6J4hfWqDg+zBkxygqy8nfEGDxqBcBdy/w
pyPqmMeZwBVnivtcVHRVbMwE1j8JBIpBPulSpyAm96GxxZo92UT1QMiv/XLNIT9r
QYT/OMcHXYepkp5nSq5c9hUn/MRuZJc17I2Ovb0UrHn3DZkirTL5JnLw7kwict68
O3hkBxQOwl47v9TMqj026HefiXRI4eHtRkVlBc22dEU+UTfMZYS6dlgbQX1AU+32
qM2xVvvT91xTKIZm18VEmZLa3jcHdb1C+aHA6UtKrMxPE0iUaM/z6/i6WJ5WoxSX
gpcJT+XuW43HsvpxaalNOIZ/wP0fKShA8oF+0e6cJMKwtS8ez9wQZCTfVDI3jP6X
YJ5RiqcYwDlIPAbEjOGIsch7TVOWtBk0HC0pqt+lfVm9LUYr88rjIFK36HJrFxP+
hsqRLKE4k3qbDcyIEh9e
=ylA+
-----END PGP SIGNATURE-----

--Sig_/l2yYTvZOIutM9SzVa21+vLY--
