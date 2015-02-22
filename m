From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 22
Date: Sun, 22 Feb 2015 17:32:57 +1100
Message-ID: <20150222173257.61c9db7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zmq=qpzn2asdqifjYo/Cl4N"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35291 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751255AbbBVGdI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Feb 2015 01:33:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/zmq=qpzn2asdqifjYo/Cl4N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any material destined for v3.21 to your linux-next
included trees until after v3.20-rc1 has been released.

Changes since 20150220:

The mips tree gained conflist against Linus' tree.

The s390 tree gained a conflict against Linus' tree.

The vfs tree gained conflicts against Linus' tree.

The ftrace tree gained a conflict against the vfs tree.

Non-merge commits (relative to Linus' tree): 1029
 874 files changed, 17413 insertions(+), 12391 deletions(-)

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
Merging origin/master (93aaa830fc17 Merge tag 'xfs-pnfs-for-linus-3.20-rc1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (a16c5f99a28c kbuild: Fix removal of the de=
bian/ directory)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (8e6480667246 ARM: 8299/1: mm: ensure local activ=
e ASID is marked as allocated on rollover)
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (ffe6902b66aa asm-generic: remove _STK_LIM_MAX)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (31345e1a071e powerpc/pci: Remove unused force_=
32bit_msi quirk)
Merging powerpc-merge-mpe/fixes (c59c961ca511 Merge branch 'drm-fixes' of g=
it://people.freedesktop.org/~airlied/linux)
Merging sparc/master (66d0f7ec9f10 sparc32: destroy_context() and switch_mm=
() needs to disable interrupts.)
Merging net/master (ddede6d536d7 net: dsa: bcm_sf2: fix 64-bits register re=
ads)
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (3cd1ce0420ce ALSA: usb: Fix support for De=
non DA-300USB DAC (ID 154e:1003))
Merging pci-current/for-linus (feb28979c137 of/pci: Remove duplicate kfree =
in of_pci_get_host_bridge_resources())
Merging wireless-drivers/master (aeb2d2a4c0ae rtlwifi: Remove logging state=
ment that is no longer needed)
Merging driver-core.current/driver-core-linus (26bc420b59a3 Linux 3.19-rc6)
Merging tty.current/tty-linus (ec6f34e5b552 Linux 3.19-rc5)
Merging usb.current/usb-linus (e36f014edff7 Linux 3.19-rc7)
Merging usb-gadget-fixes/fixes (f5af19d10d15 Merge git://git.kernel.org/pub=
/scm/linux/kernel/git/davem/net)
Merging usb-serial-fixes/usb-linus (a6f0331236fa USB: cp210x: add ID for RU=
GGEDCOM USB Serial Console)
Merging staging.current/staging-linus (3d883483dc0a Merge branch 'fixes' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal)
Merging char-misc.current/char-misc-linus (e36f014edff7 Linux 3.19-rc7)
Merging input-current/for-linus (4c971aa78314 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (96692a7305c4 crypto: tcrypt - do not allocat=
e iv on stack for aead speed tests)
Merging ide/master (f96fe225677b Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging devicetree-current/devicetree/merge (6b1271de3723 of/unittest: Over=
lays with sub-devices tests)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (7c2e211f3c95 vfio-pci: Fix the check on pci d=
evice type in vfio_pci_probe())
Merging kselftest-fixes/fixes (f5db310d77ef selftests/vm: fix link error fo=
r transhuge-stress test)
Merging drm-intel-fixes/for-linux-next-fixes (bfa76d495765 Linux 3.19)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (06f34e1c28f3 ARC: fix page address calculation if PAG=
E_OFFSET !=3D LINUX_LINK_BASE)
Merging arm/for-next (df9ab9771c64 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (d88d6cfc912e ARM: mm: Remove Kconfig symbol CACHE=
_PL310)
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
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
Merging c6x/for-linux-next (ae72758f1dd9 c6x: fix build failure caused by c=
ache.h)
Merging cris/for-next (9987c19ed9a7 CRIS: Whitespace cleanup)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (a6b8978c54b7 pstore: Fix sprintf format specifier in pst=
ore_dump())
Merging m68k/for-next (4436820a98cd m68k/defconfig: Enable Ethernet bridgin=
g)
Merging m68knommu/for-next (21b30ca5da14 arch: m68k: 68360: config: Remove =
unused function)
Merging metag/for-next (f93125ae17d1 metag: cachepart: Fix failure check)
Merging microblaze/next (a01d37d914f9 microblaze: Remove *.dtb files in mak=
e clean)
Merging mips/mips-for-linux-next (64b139f97c01 MIPS: OCTEON: irq: add CIB a=
nd other fixes)
CONFLICT (content): Merge conflict in arch/mips/pci/pcie-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-octeon.c
CONFLICT (content): Merge conflict in arch/mips/pci/pci-bcm1480.c
CONFLICT (content): Merge conflict in arch/mips/mm/tlb-r4k.c
CONFLICT (content): Merge conflict in arch/mips/kernel/elf.c
CONFLICT (content): Merge conflict in arch/mips/include/asm/pgtable-bits.h
Merging nios2/nios2-next (d16d2be111a6 nios2: add kgdb support)
Merging parisc-hd/for-next (bfa76d495765 Linux 3.19)
Merging powerpc/next (d557b09800da powerpc/mm/thp: Use tlbiel if possible)
Merging powerpc-mpe/next (a6130ed253a9 cxl: Add missing return statement af=
ter handling AFU errror)
Merging fsl/next (0dc294f717d4 powerpc/mm: bail out early when flushing TLB=
 page)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (42d19952a90d s390/traps: panic() instead of die() on=
 translation exception)
CONFLICT (content): Merge conflict in arch/s390/kernel/early.c
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
Merging cifs/for-next (0a545e3a7494 [SMB3] Update negotiate protocol for SM=
B3.1 dialect)
Merging ecryptfs/next (e7a823be2adc Merge tag 'linux-kselftest-3.19-rc-5' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging ext3/for_next (6981498d7956 udf: remove bool assignment to 0/1)
Merging ext4/dev (6f30b7e37a82 ext4: fix indirect punch hole corruption)
Merging f2fs/dev (db3ecdee1cf0 Merge branch 'for-next' of git://git.kernel.=
org/pub/scm/linux/kernel/git/cooloney/linux-leds)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (9759bd518994 fuse: add memory barrier to INIT)
Merging gfs2/master (278702074ff7 GFS2: Fix crash during ACL deletion in ac=
l max entry check in gfs2_set_acl())
Merging jfs/jfs-next (648695c74811 jfs: Deletion of an unnecessary check be=
fore the function call "unload_nls")
Merging nfs/linux-next (71a097c6de9a NFSv4.1: Clean up bind_conn_to_session)
Merging nfsd/nfsd-next (a1d1e9be5a1d svcrpc: fix memory leak in gssp_accept=
_sec_context_upcall)
Merging overlayfs/overlayfs-next (4330397e4e8a ovl: discard independent cur=
sor in readdir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (8168b9bba6a8 UBI: block: Fix checking for NULL in=
stead of IS_ERR())
Merging xfs/for-next (781355c6e5ae xfs: recall pNFS layouts on conflicting =
access)
Merging file-locks/linux-next (b2b89ebfc0f0 Merge tag 'locks-v3.20-2' of gi=
t://git.samba.org/jlayton/linux)
Merging vfs/for-next (a3959d2909f8 trylock_super(): replacement for grab_su=
per_passive())
CONFLICT (content): Merge conflict in fs/nfs/write.c
CONFLICT (content): Merge conflict in fs/nfs/flexfilelayout/flexfilelayout.c
CONFLICT (content): Merge conflict in fs/nfs/filelayout/filelayout.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/qib/qib_fs.c
Merging pci/next (cb8e92d8e4d9 Merge branch 'pci/misc' into next)
Merging hid/for-next (870fd0f5df4e Merge branch 'for-linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging i2c/i2c/for-next (bf6d5cb39e9d Merge branch 'i2c/for-3.20' into i2c=
/for-next)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (dd378b1bcaa0 hwmon: (tmp102) add hibernat=
ion callbacks)
Merging v4l-dvb/master (48b777c0833b Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (8d18d1d514d1 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (d85aa1624b05 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging pm/linux-next (62b2412da1cc Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging idle/next (210109f4a19a Merge branches 'turbostat', 'sfi' and 'cpui=
dle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (4531fa1684bb thermal: exynos: fix: Check if data->tmu=
_read callback is present before read)
Merging thermal-soc/next (6c247393cfdd thermal: exynos: Add TMU support for=
 Exynos7 SoC)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (9ad1a1b57012 Merge branch 'for-linus' into next)
Merging net-next/master (bb39b7433d1c sunvnet: failed trigger should not ca=
use BUG_ON())
Merging ipsec-next/master (ff660f75be36 Merge branch 'stmmac-pci')
Merging wireless-drivers-next/master (d53071143aa5 Merge ath-next from ath.=
git)
Merging bluetooth/master (03f310efd4b1 Bluetooth: Remove unnecessary queue_=
monitor_skb() function)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (eb928d40a93f Merge JFFS2 updates from David Woodhouse)
Merging l2-mtd/master (eb928d40a93f Merge JFFS2 updates from David Woodhous=
e)
Merging crypto/master (db71f29a1c32 crypto: testmgr - mark rfc4106(gcm(aes)=
) as fips_allowed)
Merging drm/drm-next (45ee2dbc65cb Merge branch 'drm-next-3.20' of git://pe=
ople.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (96abd10ecc2e Merge branch 'drm-next-3.20'=
 of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-tegra/drm/tegra/for-next (07d05cbf60ed drm/tegra: dc: Move more=
 code into ->init())
Merging drm-misc/topic/core-stuff (eb2ed66fe56f drm/irq: Don't disable vbla=
nk interrupts when already disabled)
Merging sound/for-next (3cd1ce0420ce ALSA: usb: Fix support for Denon DA-30=
0USB DAC (ID 154e:1003))
Merging sound-asoc/for-next (9c208ed74c76 Merge remote-tracking branches 'a=
soc/fix/rsnd', 'asoc/fix/rt5670' and 'asoc/fix/samsung' into asoc-linus)
Merging modules/modules-next (9cc019b8c94f module: Replace over-engineered =
nested sleep)
Merging virtio/virtio-next (5b40a7daf518 virtio: don't set VIRTIO_CONFIG_S_=
DRIVER_OK twice.)
Merging input/next (290b799c390d Input: psmouse - use IS_ENABLED instead of=
 homegrown code)
Merging block/for-next (434c26478166 Merge branch 'for-3.20/core' into for-=
next)
Merging device-mapper/for-next (3712600cfae0 dm cache policy mq: try not to=
 writeback data that changed in the last second)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (802ea9d8645d Merge tag 'dm-3.20-changes' of git://git.=
kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging kgdb/kgdb-next (dd8f30cc0550 kgdb, docs: Fix <para> pdfdocs build e=
rrors)
Merging md/for-next (26ac107378c4 md/raid5: Fix livelock when array is both=
 resyncing and degraded.)
Merging mfd/for-mfd-next (0a65fbf64dad mfd: intel_soc_pmic: Add missing err=
or check for devm_kzalloc)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (9e23e22cd61a power: ltc2941-battery-gauge: Fix typo=
 in conversion formula (58 instead of 85))
Merging omap_dss2/for-next (d6c2152b3efd Merge branches '3.20/fbdev' and '3=
.20/omapdss' into for-next)
Merging regulator/for-next (264d8de777a4 Merge remote-tracking branches 're=
gulator/fix/da9210' and 'regulator/fix/rk808' into regulator-linus)
Merging security/next (04f81f0154e4 cipso: don't use IPCB() to locate the C=
IPSO IP option)
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (6eb4e2b41b26 SELinux: fix error code in policydb_init=
())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (b08c144e3a10 watchdog: bcm47xx_wdt.c: allow enabli=
ng on BCM5301X arch)
CONFLICT (content): Merge conflict in drivers/watchdog/Makefile
Merging iommu/next (a20cc76b9efa Merge branches 'arm/renesas', 'arm/smmu', =
'arm/omap', 'ppc/pamu', 'x86/amd' and 'core' into next)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (6140a8f56238 vfio-pci: Add device request interface)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (52e68924dfa8 Documentation: Fix the wrong comman=
d `echo -1 > set_ftrace_pid` for cleaning the filter.)
Merging trivial/for-next (edb0ec0725bb kexec, Kconfig: spell "architecture"=
 properly)
Merging audit/next (2fded7f44b8f audit: remove vestiges of vers_ops)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (3c3c8e3618b0 Merge remote-tracking branch 'grant/de=
vicetree/next' into for-next)
Merging mailbox/mailbox-for-next (9f3e3cacb2ff dt: mailbox: add generic bin=
dings)
Merging spi/for-next (4f16c3cd0b66 Merge remote-tracking branch 'spi/fix/ti=
-qspi' into spi-linus)
Merging tip/auto-latest (3cf6be48c376 Merge branch 'timers/core')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (30263b4052c6 EDAC, mv64x60_edac: Fix an error co=
de in probe())
Merging irqchip/irqchip/for-next (91d117921216 irqchip: atmel-aic-common: P=
revent clobbering of priority when changing IRQ type)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c19565fc83e6 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
CONFLICT (content): Merge conflict in kernel/trace/trace.c
CONFLICT (content): Merge conflict in fs/debugfs/inode.c
Merging rcu/rcu/next (c0135d07b013 rcu: Clear need_qs flag to prevent splat)
Merging kvm/linux-next (6557bada461a KVM: ia64: drop kvm.h from installed u=
ser headers)
Merging kvm-arm/next (4b990589952f KVM: Remove unused config symbol)
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (de8e5d744051 KVM: Disable compat ioctl for s390)
Merging xen-tip/linux-next (a2e75bc2ee20 xenbus: Add proper handling of XS_=
ERROR from Xenbus for transactions.)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (b5b3ab523e31 Merge branch 'for-3.19-fixes' int=
o for-next)
Merging drivers-x86/for-next (c57c0fa4bc9c toshiba_acpi: Cleanup GPL header)
Merging chrome-platform/for-next (5502486a2077 platform/chrome: chromeos_la=
ptop - Add a limit for deferred retries)
Merging regmap/for-next (48bbdbb173fa Merge remote-tracking branch 'regmap/=
fix/irq' into regmap-linus)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (ffe2428614d2 leds: flash: remove stray include direc=
tive)
Merging ipmi/for-next (43475c9dc47a ipmi: Use is_visible callback for condi=
tional sysfs entries)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_si_intf.c
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
Merging driver-core/driver-core-next (adf305f77878 sysfs: fix warning when =
creating a sysfs group without attributes)
Merging tty/tty-next (c09babfab7ae serial: 8250: Fix UART_BUG_TXEN workarou=
nd)
Merging usb/usb-next (4d4bac4499e9 Merge tag 'usb-for-v3.20' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next)
Merging usb-gadget/next (f5af19d10d15 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/net)
Merging usb-serial/usb-next (3e264ffc831e USB: mos7840: remove unused code)
Merging staging/staging-next (3d883483dc0a Merge branch 'fixes' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal)
Merging char-misc/char-misc-next (5fb31cd839c2 coresight: fix function etm_=
writel_cp14() parameter order)
Merging cgroup/for-next (8abba61bcfd4 Merge branch 'for-3.19-fixes' into fo=
r-next)
Merging scsi/for-next (cad8000836ef Merge branch 'misc' into for-next)
Merging target-updates/for-next (aa04dae454d0 target: Set LBPWS10 bit in Lo=
gical Block Provisioning EVPD)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (f724e05baaf0 sh-pfc: emev2 - Fix mangled author n=
ame)
Merging vhost/linux-next (ac26e40d1c8a vhost/net: fix up num_buffers endian=
-ness)
CONFLICT (content): Merge conflict in drivers/vhost/net.c
Merging remoteproc/for-next (9a3c4145af32 Linux 3.16-rc6)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (d2bee67fadb6 gpiolib: of: allow of_gpiochip_find_and=
_xlate to find more than one chip per node)
Merging dma-mapping/dma-mapping-next (dda02fd6278d mm, cma: make parameters=
 order consistent in func declaration and definition)
Merging pwm/for-next (b65af27ad89d pwm: tegra: Use NSEC_PER_SEC)
Merging dma-buf/for-next (817bd7253291 dma-buf: cleanup dma_buf_export() to=
 make it easily extensible)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (ec02ace8ca0a clk: Only recalculate the rate if needed)
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
Merging livepatching/for-next (0937e3b025f7 livepatch: simplify disable err=
or path)
Merging akpm-current/current (d07b956c650a scripts/gdb: Add infrastructure)
CONFLICT (content): Merge conflict in scripts/module-common.lds
CONFLICT (add/add): Merge conflict in scripts/Makefile.kasan
CONFLICT (content): Merge conflict in mm/vmscan.c
CONFLICT (content): Merge conflict in mm/swap.c
CONFLICT (content): Merge conflict in mm/slub.c
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (modify/delete): mm/filemap_xip.c deleted in HEAD and modified in =
akpm-current/current. Version akpm-current/current of mm/filemap_xip.c left=
 in tree.
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in init/Kconfig
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in fs/proc/generic.c
CONFLICT (content): Merge conflict in fs/notify/fanotify/fanotify.c
CONFLICT (content): Merge conflict in fs/affs/namei.c
CONFLICT (content): Merge conflict in drivers/rtc/Makefile
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/kernel/time.c
CONFLICT (content): Merge conflict in arch/mips/include/asm/pgtable-bits.h
CONFLICT (add/add): Merge conflict in Documentation/kasan.txt
$ git rm -f mm/filemap_xip.c
Applying: fix bad merge in akpm-current
Applying: fix another bad merge in akpm-current
$ git checkout -b akpm remotes/origin/akpm/master
Applying: ocfs2: use 64bit variables to track heartbeat time
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (9388210a3e8b mm: add strictlimit knob)

--Sig_/zmq=qpzn2asdqifjYo/Cl4N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6XggAAoJEMDTa8Ir7ZwVVFwP/14wm1hYDpXnc204Vukbzmab
6KfgzlOnb2QIyS6B/jfL5UMzhVLz5eaCtAPor3TMi+7nDLCNYk8Zp3lLB3XbygdP
RpW2h4e5B9zX03ACfa1SfmrTCOi1/SY6FjZm3N4sG6tSYFOyUyGlvgnpFYetitH7
GaRDaq/XkIvMfa+P17qxFlGUuHdjDnJ76bJEzgW5hdYgP/cL1vQmsvVed4xI9hFd
r+Y/YsqQtbN3acWQnqbq7KdgudaLpRA6eBqpAVLk+rGrPo2tXgOVcG9umzOdvTVm
5NU7sDZmDfDlCDynavjJPHAUw0yJ7BkeNuu2E2ZI//FJcNLA1tX2qeobytL5zros
cLQP3BK+2vCsOaBY67oTWz16VERb6z/3d32CxEK7Wmx8sguPiGz6HsbwMJGlNhop
7MyJhM1rmSH+Lq+VnsW/q26CmZ/gZUUA4nafJp7mXZOo7clg+1e3YEc5VV9eG5qo
ZxDpjibGbAftQ/0q7E3TqRnKmAukhmertymIxsUI9perjJ1dICqtboNyspqIguJy
gVdo6Ye8xb1j8KrBNelVESwNQsxsG9zIiRA7TABEihsw75oMUoounVDGkXTHW8xJ
PBUTl53agPov4lHFz8M3MVYWVCnf9GwRPYpzsmMDefLe4cWvsO+clZs+np6slqEn
IvFSWErXutCjtktMpLpe
=VV4k
-----END PGP SIGNATURE-----

--Sig_/zmq=qpzn2asdqifjYo/Cl4N--
