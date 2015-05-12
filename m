From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 12
Date: Tue, 12 May 2015 16:20:55 +1000
Message-ID: <20150512162055.40d711ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3aHe5f.HfjUmwps8qlBbDJB"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39636 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752541AbbELGVD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2015 02:21:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/3aHe5f.HfjUmwps8qlBbDJB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150511:

The net-next tree gained conflicts against the net tree.

The spi tree gained a build failure so I used the version from
next-20150511.

The target-updates tree gained a build failure so I used the version
from next-20150511.

Non-merge commits (relative to Linus' tree): 3542
 3304 files changed, 154680 insertions(+), 68152 deletions(-)

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

I am currently merging 215 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (4cfceaf0c087 Merge branch 'for-4.1' of git://linux-n=
fs.org/~bfields/linux)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (3b8786ff7a1b ARM: 8352/1: perf: Fix the pmu node=
 name in warning message)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (0aab3747091d powerpc/powernv: Restore non-=
volatile CRs after nap)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (acc455cffa75 sparc64: Setup sysfs to mark LDOM socket=
s, cores and threads correctly)
Merging net/master (145a42b3a964 net_sched: gred: use correct backlog value=
 in WRED mode)
Merging ipsec/master (bdddbf6996c0 xfrm: fix a race in xfrm_state_lookup_by=
spi)
Merging sound-current/for-linus (2c674fac5b16 ALSA: hda/realtek - Add ALC29=
8 alias name for Dell)
Merging pci-current/for-linus (5ebe6afaf005 Linux 4.1-rc2)
Merging wireless-drivers/master (f67382186489 ath9k: fix per-packet tx powe=
r configuration)
Merging driver-core.current/driver-core-linus (030bbdbf4c83 Linux 4.1-rc3)
Merging tty.current/tty-linus (1a48632ffed6 pty: Fix input race when closin=
g)
Merging usb.current/usb-linus (172115090f5e usb-storage: Add NO_WP_DETECT q=
uirk for Lacie 059f:0651 devices)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (82ee3aeb9295 USB: visor: Match I330 pho=
ne more precisely)
Merging staging.current/staging-linus (892c89d5d7ff staging: gdm724x: Corre=
ction of variable usage after applying ALIGN())
Merging char-misc.current/char-misc-linus (0f5b6ec67404 Merge tag 'extcon-f=
ixes-for-4.1-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/=
extcon into char-misc-linus)
Merging input-current/for-linus (48853389f206 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (ec59a65d694e crypto: arm64/sha2-ce - prevent=
 asm code finalization in final() path)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (b787f68c36d4 Linux 4.1-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (364aece01a2d drm/i915: Avoid =
GPU hang when coming out of s3 or s4)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging arm/for-next (b9254b93592a Merge branch 'bsym' into for-next)
Merging arm-perf/for-next/perf (b787f68c36d4 Linux 4.1-rc1)
Merging arm-soc/for-next (dc0e3db4ec7c ARM: multi_v7_defconfig: Select more=
 FSL SoCs)
Merging at91/at91-next (3c6a00e39213 Merge branch 'at91-4.2-dt' into at91-n=
ext)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (31fd7fe00b0d ARM: bcm2835: Drop the init_irq() ho=
ok)
Merging berlin/berlin/for-next (4412971984ea Merge branches 'berlin/soc', '=
berlin/driver' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (6aa6ad8384fb Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (689bc92a6492 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (8be7646999c7 Merge tag 'omap-for-v4.1/fixes-rc2' int=
o for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (6566c61b01eb Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (77b0ffdc4bbd Merge branch 'v4.2-next/dt-samsung' =
into for-next)
Merging sunxi/sunxi/for-next (a426b3379698 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
Merging tegra/for-next (4fd17a726126 Merge branch for-4.2/defconfig into fo=
r-next)
Merging arm64/for-next/core (6d1966dfd6e0 arm64: fix midr range for Cortex-=
A57 erratum 832075)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (f5691735f6cd cris: arch-v32: gpio: Use kzalloc inste=
ad of kmalloc/memset)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (62f269ef8191 pstore: Fix the ramoops module parameters u=
pdate)
Merging m68k/for-next (2b8520f1f256 m68k: Use for_each_sg())
Merging m68knommu/for-next (030bbdbf4c83 Linux 4.1-rc3)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (3e20a26b02bd Merge branch '4.0-fixes' int=
o mips-for-linux-next)
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (5fec97d0e3d9 parisc: copy_thread(): rename 'arg=
' argument to 'kthread_arg')
Merging powerpc-mpe/next (b787f68c36d4 Linux 4.1-rc1)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (6f469dae3aac zcrypt: fixed ap poll timer behavior)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (47ad7b9bbeaa tile: improve stack backtrace)
Merging uml/linux-next (fe205bdd1321 um: Print minimum physical memory requ=
irement)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (06a631433460 xtensa: Provide dummy dma_alloc_attrs=
() and dma_free_attrs())
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (bc8ebdc4f54c Fix that several functions handle incor=
rect value of mapchars)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (3adc12e96482 udf: Update ctime and mtime when direct=
ory is modified)
Merging ext4/dev (fd64e6fd4575 ext4 crypto: reorganize how we store keys in=
 the inode)
Merging f2fs/dev (e592bac1339b f2fs crypto: remove checking key context dur=
ing lookup)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (1272574bf948 gfs2: kerneldoc warning fixes)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (b787f68c36d4 Linux 4.1-rc1)
Merging nfsd/nfsd-next (d57a97bbdb5f nfsd: Pin to vfsmnt instead of mntget)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushe=
s)
Merging xfs/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (0ad7e33ea980 don't pass nameidata to ->follow_link())
CONFLICT (content): Merge conflict in fs/f2fs/namei.c
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
Applying: f2fs: merge fix for follow_link and put_link changes
Merging pci/next (9b08ae0dde00 Merge branch 'pci/msi' into next)
Merging hid/for-next (09f6f31e82f1 Merge branch 'for-4.2/logitech' into for=
-next)
Merging i2c/i2c/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
Merging hwmon-staging/hwmon-next (0f8b11419e2f hwmon: Allow compile test of=
 GPIO consumers if !GPIOLIB)
Merging v4l-dvb/master (e7f8fd8aa7f2 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (d1809fd6c20c Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (beb856eebad6 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (3ab54c8c46ed Merge branch 'powercap' into linux-next)
Merging idle/next (64887b6882de Merge branch 'for-linus-4.1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (699f417cbf8f Merge branches 'for-rc' and 'release' of=
 .git into next)
Merging thermal-soc/next (bcacb3e5fd10 Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (23e257a2049f Merge branch 'topic/omap' into next)
Merging net-next/master (b396cca6fafc net: sched: deprecate enqueue_root())
CONFLICT (content): Merge conflict in net/core/sock.c
CONFLICT (content): Merge conflict in include/net/codel.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/qualcomm/qca_spi=
.c
Merging ipsec-next/master (de2ad486cb6c xfrm: move the checking for old xfr=
m_policy hold_queue to beginning)
Merging wireless-drivers-next/master (6e65104504fe brcmfmac: check result o=
f USB firmware request)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/mac.c
Merging bluetooth/master (1add15646672 ieee802154: trace: fix endian conver=
tion)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging mtd/master (b787f68c36d4 Linux 4.1-rc1)
Merging l2-mtd/master (5844feeaa415 mtd: nand: add common DT init code)
Merging crypto/master (6499e8cfaa8f crypto: arm/aes - streamline AES-192 co=
de path)
Merging drm/drm-next (e1dee1973c74 Merge tag 'drm-intel-next-2015-04-23-fix=
ed' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_irq.c
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (c0c7e68899d7 drm/i915: Fix race on unrefe=
rencing the wrong mmio-flip-request)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (9a6e1b1181b4 drm/prime: Allow internal imp=
orts without import_sg_table)
Merging drm-exynos/exynos-drm/for-next (477bb8da58e4 drm/exynos: 'win' is a=
lways unsigned)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (3b90f4072730 ALSA: hda/tegra - Fix oops)
Merging sound-asoc/for-next (34d220d6f387 Merge remote-tracking branches 'a=
soc/topic/simple', 'asoc/topic/ssm2518', 'asoc/topic/ssm2602', 'asoc/topic/=
ssm4567' and 'asoc/topic/tas571x' into asoc-next)
Merging modules/modules-next (4a3893d069b7 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging input/next (4d10da13467e Input: add TI drv2665 haptics driver)
Merging block/for-next (a66bcf6fe8e5 Merge branch 'for-4.2/core' into for-n=
ext)
Merging device-mapper/for-next (cb31ef485dd4 init: fix regression by suppor=
ting devices with major:minor:offset format)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (d689a660983c mmc: cast unsigned int to typeof(sector_t=
) to avoid unexpected error)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (bb27051f9fd7 md/raid5: fix handling of degraded stripe=
s in batches.)
Merging mfd/for-mfd-next (74c24e06460e MAINTAINERS: Extend Samsung MFD driv=
ers entry and add Krzysztof Kozlowski)
Merging backlight/for-backlight-next (d57184f49f13 backlight: Allow compile=
 test of GPIO consumers if !GPIOLIB)
Merging battery/master (8ebb7e9c1a50 power: bq27x00_battery: Add missing MO=
DULE_ALIAS)
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (6e8d612d6f2f Merge remote-tracking branches 're=
gulator/topic/max14577', 'regulator/topic/max77693', 'regulator/topic/max77=
843' and 'regulator/topic/max8973' into regulator-next)
Merging security/next (b787f68c36d4 Linux 4.1-rc1)
Merging integrity/next (0ce8300ef0d4 KEYS: fix "ca_keys=3D" partial key mat=
ching)
Merging selinux/next (6a878464e21a signals: don't abuse __flush_signals() i=
n selinux_bprm_committed_creds())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (60dcc6f0bcf4 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/exynos' and 'core' into next)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (eac6d7a9431f Documentation: tracing: fix grammar)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (39a8804455fb Linux 4.0)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (4760597116e3 scripts/dtc: Update to upstream versio=
n 9d3649bd3be245c9)
Merging mailbox/mailbox-for-next (030bbdbf4c83 Linux 4.1-rc3)
Merging spi/for-next (76217c85ac82 Merge remote-tracking branches 'spi/topi=
c/sirf' and 'spi/topic/spidev' into spi-next)
$ git reset --hard HEAD^
Merging next-20150511 version of spi
Merging tip/auto-latest (9f897631aba5 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (add/add): Merge conflict in drivers/clocksource/asm9260_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (30c7469ba6f5 MAINTAINERS: Change Johannes Thumsh=
irn's email address)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c4b00d27e405 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (ac002d807597 rcu: Change function declaration to bool)
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in include/linux/rcutree.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Merging kvm/linux-next (cba3d2765e9f Merge tag 'kvm-s390-next-20150508' of =
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (06b36753a646 KVM: s390: drop handling of interception=
 code 12)
Merging xen-tip/linux-next (0b97b03d88b4 xen/pci: Try harder to get PXM inf=
ormation for Xen)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (30186c6fdc9a workqueue: function name in the c=
omment differs from the real function name)
Merging drivers-x86/for-next (fe88e379e89b Documentation/ABI: Add file desc=
ribing the sysfs entries for toshiba_haps)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (637733e01bd4 Merge remote-tracking branches 'regma=
p/topic/defaults' and 'regmap/topic/irq' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (a221e5c87ae2 Documentation: leds: Add description of=
 v4l2-flash sub-device)
Merging ipmi/for-next (c32e9840e96a ipmi: Add a comment in how messages are=
 delivered from the lower layer)
Merging driver-core/driver-core-next (030bbdbf4c83 Linux 4.1-rc3)
Merging tty/tty-next (c1c325d703d3 tty: serial: 8250_mtk: Add support for b=
us clock)
Applying: serial/amba-pl011: fix mismerge
Merging usb/usb-next (0efd937e27d5 USB: ehci-tegra: fix inefficient copy of=
 unaligned buffers)
Merging usb-gadget/next (b787f68c36d4 Linux 4.1-rc1)
Merging usb-serial/usb-next (b787f68c36d4 Linux 4.1-rc1)
Merging staging/staging-next (35bb871663dd staging: comedi: ni_stc.h: final=
 cleanup)
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Merging char-misc/char-misc-next (5ebe6afaf005 Linux 4.1-rc2)
Merging extcon/extcon-next (1ebabdaaf64a extcon: Remove the optional name o=
f extcon device)
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (d0f702e648dc cgroup: fix some comment typos)
Merging scsi/for-next (8b2564ec7410 lpfc: Fix breakage on big endian kernel=
s)
Merging target-updates/for-next (b1c8c41c1b80 target: Convert se_tpg->acl_n=
ode_lock to ->acl_node_mutex)
$ git reset --hard HEAD^
Merging next-20150511 version of target-updates
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (5e2742959a1c Merge branch 'devel' into for-next)
Merging vhost/linux-next (f4aaa799cf9a tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (10fc7f870b72 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (efb0de55b6a2 pwm: Add support to remove registered co=
nsumer lookup tables)
Merging dma-buf/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging userns/for-next (7e96c1b0e0f4 mnt: Fix fs_fully_visible to verify t=
he root directory is visible)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (81573560150d Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (5c6c3e612ef5 selftests/exec: do not install subdir =
as it is already created)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (4098cabe3262 Merge branch 'for-4.2/upstream'=
 into for-next)
Merging coresight/next (48582dcacc6b coresight: fix typo in of_coresight.c)
Merging rtc/rtc-next (529a4c385f04 rtc: mc13xxx: fix obfuscated and wrong f=
ormat string)
Merging akpm-current/current (a3980f9598c6 lib/scatterlist: mark input buff=
er parameters as 'const')
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/mtrr/generic.c
CONFLICT (add/add): Merge conflict in Documentation/devicetree/bindings/rtc=
/abracon,abx80x.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (07f0773a3422 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/3aHe5f.HfjUmwps8qlBbDJB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUZvMAAoJEMDTa8Ir7ZwVYCYP/ApK5V4gCgvBUw+Vx3STBrsB
YiGrqVR1+mNlaJv8zBGlFGj8JSP1ss5KGA7JG/Q0EqvpLzWZN2FLkqM0AckjilFj
A6nElOzBgKO/p2ctPY2vZS7NUEJWD7m62ibCaLQSl2nMSI0QSIo4z8Qn1I1nkRJD
GfMTndxlW/TOOu+P98jZjVlutdrQO+YCtahr9LdKJ9DP4kOQDuh2XOIODQKKPwb9
LzzXL3J+NjdD1ryhlYFCzJGhGqz89WnLWGoXZewAplJE7XogrDvT5DBK9pyL9cD3
B/yn1laOzuZTJ6nEqjn8bHkt6C494cnTPWBMICFGduaH+nXU3mNMEjk6FUtlzvjm
Lmh49HFnQS2XG49HJsEfcxeDe9I0pt4p+76Eejnuksl15xepPkeDLp7K9tUft87B
TcL4zBznahycjY4mSEy+6gDCZjKLEpGfZfnh0r/r0sFrvEB7rYFI+XzqrT5/Wp6U
wFhFc2AsQKvCRlh9Txdx5NW2daKQB7DT6hAlTMpSJQZQewZa7RC7E0zDNfX/fKsX
CpNxDxMbdULcDerHQEqtlsni69sp/O7lIUZftP/Og4YxBaYyNa42KB4SM+OOUSVq
0UdEngavicTXjBJB02sipAmKLz+RJlsADKUdj+F74BphnplqA30HT3Tik2Hl5Yz+
BByWvl0RjM6hY+t/SGcC
=Sj30
-----END PGP SIGNATURE-----

--Sig_/3aHe5f.HfjUmwps8qlBbDJB--
