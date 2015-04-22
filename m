From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 22
Date: Wed, 22 Apr 2015 14:29:18 +1000
Message-ID: <20150422142918.05cb5d17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jTbzzu+VVuAdja1A_cct8mD"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37985 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751686AbbDVE3b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2015 00:29:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/jTbzzu+VVuAdja1A_cct8mD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v4.2 material to your linux-next included trees
until after v4.1-rc1 is released.

Changes since 20150421:

*crickets*

Non-merge commits (relative to Linus' tree): 2194
 2085 files changed, 109693 insertions(+), 55971 deletions(-)

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
Merging origin/master (b8ce8d7222b5 Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (6c5c2a01fcfd ARM: proc-arm94*.S: fix setup funct=
ion)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (a7e73e711e48 powerpc/kvm: Fix ppc64_defcon=
fig + PPC_POWERNV=3Dn build error)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (0edfad5959df sparc: Use GFP_ATOMIC in ldc_alloc_exp_d=
ring() as it can be called in softirq context)
Merging net/master (fab9adfb71fc net/mlx4_core: Fix reading HCA max message=
 size in mlx4_QUERY_DEV_CAP)
Merging ipsec/master (092a29a40bab vti6: fix uninit when using x-netns)
Merging sound-current/for-linus (7d1b6e293274 ALSA: hda - fix "num_steps =
=3D 0" error on ALC256)
Merging pci-current/for-linus (9fbbda5c8e0a ia64/PCI: Treat all host bridge=
 Address Space Descriptors (even consumers) as windows)
Merging wireless-drivers/master (69628cd0652a Merge tag 'iwlwifi-for-kalle-=
2015-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (bc465aa9d045 Linux 4.0-rc5)
Merging tty.current/tty-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb.current/usb-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb-gadget-fixes/fixes (65582a7f4ce5 usb: isp1760: fix spin unlock =
in the error path of isp1760_udc_start)
Merging usb-serial-fixes/usb-linus (39a8804455fb Linux 4.0)
Merging staging.current/staging-linus (f22e6e847115 Linux 4.0-rc7)
Merging char-misc.current/char-misc-linus (bc465aa9d045 Linux 4.0-rc5)
Merging input-current/for-linus (48853389f206 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (3abafaf2192b crypto: arm - workaround for bu=
ilding with old binutils)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (ec76f4007079 vfio-pci: Add missing break to e=
nable VFIO_PCI_ERR_IRQ_INDEX)
Merging kselftest-fixes/fixes (67d8712dcc70 selftests: Fix build failures w=
hen invoked from kselftest target)
Merging drm-intel-fixes/for-linux-next-fixes (39a8804455fb Linux 4.0)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (d8f6ad85cbb7 ARC: perf: don't add code for impossible=
 case)
Merging arm/for-next (4b2f8838479e Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (39a8804455fb Linux 4.0)
Merging arm-soc/for-next (0f0175702e2e arm-soc: document merges)
Merging at91/at91-next (d8a291a11778 Merge tag 'at91-dt2' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (33e156f34c26 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (02577ca1b7e4 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (23aa6c6f4bed Merge branch 'omap-for-v4.0/fixes' into=
 for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (53a6e5250291 Merge branch 'heads/soc-cleanup-for-v4.1=
' into next)
Merging samsung/for-next (5d5443b9c3ba Merge branch 'v4.1-next/mach-samsung=
' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/platsmp.c
Merging sunxi/sunxi/for-next (5a04c6a64b01 Merge branches 'sunxi/clocks-for=
-4.1', 'sunxi/dt-for-4.1', 'sunxi/core-for-4.1' and 'sunxi/drivers-for-4.1'=
, tag 'sunxi-defconfig-for-4.1' into sunxi/for-next)
Merging tegra/for-next (47ee17a644f4 Merge branch for-4.1/dt into for-next)
Merging arm64/for-next/core (6d1966dfd6e0 arm64: fix midr range for Cortex-=
A57 erratum 832075)
Merging arm64-acpi/for-next/acpi (7676fa70feb2 ARM64 / ACPI: make acpi_map_=
gic_cpu_interface() as void function)
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (d939b52abe0c cris: fix integer overflow in ELF_ET_DY=
N_BASE)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (62f269ef8191 pstore: Fix the ramoops module parameters u=
pdate)
Merging m68k/for-next (b24f670b7f5b m68k/mac: Fix out-of-bounds array index=
 in OSS IRQ source initialization)
Merging m68knommu/for-next (6e4206136faa m68knommu: fix fec setup warning f=
or ColdFire 5271 builds)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (3e20a26b02bd Merge branch '4.0-fixes' int=
o mips-for-linux-next)
Merging nios2/nios2-next (4a89c3088ff6 nios2: fix cache coherency issue whe=
n debug with gdb)
Merging parisc-hd/for-next (c19edb6946d2 parisc: Replace PT_NLEVELS with CO=
NFIG_PGTABLE_LEVELS)
Merging powerpc-mpe/next (2fe0753d4940 powerpc/powermac: Fix build error se=
en with powermac smp builds)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (80ed156a3d12 s390/pci: add locking for fmb access)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (128f3cb9398b tile: nohz: warn if nohz_full uses hyperv=
isor shared cores)
Merging uml/linux-next (fe205bdd1321 um: Print minimum physical memory requ=
irement)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (2ba9268dd603 Merge tag 'xtensa-for-next-20150413' =
of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (be4a8e38d68f Update negotiate protocol for SMB3.1 di=
alect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (3adc12e96482 udf: Update ctime and mtime when direct=
ory is modified)
Merging ext4/dev (6ddb2447846a ext4 crypto: enable encryption feature flag)
Merging f2fs/dev (10027551ccf5 f2fs: pass checkpoint reason on roll-forward=
 recovery)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (a31a0529efad GFS2: Use average srttb value in conges=
tion calculations)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (bff175238a24 uapi: Remove kernel internal declarati=
on)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f569d3ef8254 net/9p: add a privport option for RDMA =
transport.)
Merging ubifs/linux-next (502690674281 UBI: power cut emulation for testing)
Merging xfs/for-next (542c311813d5 Merge branch 'xfs-dio-extend-fix' into f=
or-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_file.c
Applying: xfs: fix up for direct_IO API change
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging net-next/master (04b7fe6a4a23 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/ide)
Merging vfs/for-next (6d3b3d3367cb direct-io: only inc/dec inode->i_dio_cou=
nt for file systems)
CONFLICT (content): Merge conflict in kernel/trace/trace.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_iops.c
CONFLICT (content): Merge conflict in fs/hfsplus/xattr.h
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
CONFLICT (content): Merge conflict in fs/ext4/namei.c
CONFLICT (content): Merge conflict in fs/btrfs/xattr.c
CONFLICT (content): Merge conflict in fs/befs/linuxvfs.c
CONFLICT (content): Merge conflict in fs/affs/amigaffs.c
Applying: fs/hfsplus: merge fix for d_inode() annotation
Merging pci/next (5468d5a64bf1 Merge branch 'pci/misc' into next)
Merging hid/for-next (e7f236eb0af9 Merge branch 'for-4.1/sensor-hub' into f=
or-next)
Merging i2c/i2c/for-next (64fb1d0e975e Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/davem/sparc)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (f354169e0f7d hwmon: (pwm-fan) Update the =
duty cycle inorder to control the pwm-fan)
Merging v4l-dvb/master (bfb4e26f2532 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (1be735fc0329 Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (e0e2674b9205 ata: ahci_st: fixup layering violatio=
ns / drvdata errors)
Merging pm/linux-next (ec8382996d13 Merge branches 'acpi-scan' and 'acpi-do=
ck')
Merging idle/next (9d72137b1930 Merge branch 'cpu-online-next' into next)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (75229df63655 Merge branches 'thermal-fix', 'thermal-i=
ntel' and 'thermal-soc' of .git into next)
Merging thermal-soc/next (62d0817a0aca Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (7ac544cc1c4f Merge branch 'for-linus' into next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in HEAD =
and modified in slave-dma/next. Version slave-dma/next of drivers/dma/intel=
_mid_dma_regs.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in HEAD and m=
odified in slave-dma/next. Version slave-dma/next of drivers/dma/intel_mid_=
dma.c left in tree.
CONFLICT (content): Merge conflict in drivers/dma/Kconfig
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-mackerel.c deleted i=
n HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/m=
ach-shmobile/board-mackerel.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-ape6evm.c deleted in=
 HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/ma=
ch-shmobile/board-ape6evm.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-mackerel.c arch/arm/mach-shmobile/=
board-ape6evm.c
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Applying: v4l: xilinx: fix for include file movement
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (f56d9e23b78e ssb: add delay after PCI=
 reset to fix SoC reboots)
Merging bluetooth/master (35ef6e90d198 Bluetooth: btusb: off by one in rtl8=
723b_parse_firmware())
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (81a1209c9091 mtd: spi-nor: Add support for Macronix =
mx25u6435f serial flash)
Merging crypto/master (ff030b099a21 crypto: rng - Introduce crypto_rng_gene=
rate)
Merging drm/drm-next (cec32a470106 media-bus: Fixup RGB444_1X12, RGB565_1X1=
6, and YUV8_1X24 media bus format)
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (37ef01ab5d24 drm/i915: Dont enable CS_PAR=
SER_ERROR interrupts at all)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (a3c6d686443e DRM: Don't re-poll connector =
for disconnect)
Merging drm-exynos/exynos-drm/for-next (3cf711584d3e drm/exynos: Fix FIMD b=
uffer size calculation)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (7d1b6e293274 ALSA: hda - fix "num_steps =3D 0" erro=
r on ALC256)
Merging sound-asoc/for-next (5d6cb688890a Merge remote-tracking branches 'a=
soc/fix/fsl-ssi', 'asoc/fix/pm', 'asoc/fix/qcom', 'asoc/fix/rcar', 'asoc/fi=
x/samsung' and 'asoc/fix/tfa9879' into asoc-linus)
Merging modules/modules-next (55e1d5c7ad94 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging virtio/virtio-next (9abbfb486f5c virtio: drop virtio_device_is_lega=
cy_only)
Merging input/next (c9eeb5084b27 Input: lm8333 - fix broken email address)
Merging block/for-next (889fa31f00b2 blk-mq: reduce unnecessary software qu=
eue looping)
Merging device-mapper/for-next (44c144f9c8e8 dm crypt: fix missing error co=
de return from crypt_ctr error path)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (96541bac0b4e Revert "mmc: core: Convert mmc_driver to =
device_driver")
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (9ffc8f7cb964 md/raid5: don't do chunk aligned read on =
degraded array.)
Merging mfd/for-mfd-next (e554a99ee8d0 mfd: sec: Fix RTC alarm interrupt nu=
mber on S2MPS11)
Merging backlight/for-backlight-next (b1f85c0fec20 backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (5939d9dfe440 power: twl4030_madc_battery: Add missi=
ng MODULE_ALIAS)
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (fc902dfc3e64 Merge remote-tracking branches 're=
gulator/fix/doc' and 'regulator/fix/max77686' into regulator-linus)
Merging security/next (5deeb5cece3f lsm: copy comm before calling audit_log=
 to avoid race in string printing)
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (cf7b6c0205f1 selinux: increase avtab max buckets)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (7f65ef01e131 Merge branches 'iommu/fixes', 'x86/vt-d', =
'x86/amd', 'arm/smmu', 'arm/tegra' and 'core' into next)
Merging dwmw2-iommu/master (03ecc32c5274 iommu/vt-d: support extended root =
and context entries)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (197175427a22 Documentation/memcg: update memcg/k=
mem status)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (724e7bfcc566 audit: Remove condition which always evalu=
ates to false)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (648082735792 of: base: improve of_get_next_child() =
kernel-doc)
Merging mailbox/mailbox-for-next (ee23d66af921 mailbox: arm_mhu: add driver=
 for ARM MHU controller)
Merging spi/for-next (9331bf51ea99 Merge remote-tracking branches 'spi/fix/=
bcm2835', 'spi/fix/bcm2835-code' and 'spi/fix/bitbang' into spi-linus)
Merging tip/auto-latest (88256d924879 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c4b00d27e405 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (8d7dc9283f39 rcu: Control grace-period delays directl=
y from value)
Merging kvm/linux-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvm-arm/next (d44758c0dfc5 KVM: arm/arm64: enable KVM_CAP_IOEVENTFD)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (816c7667ea97 KVM: s390: migrate vcpu interrupt state)
Merging xen-tip/linux-next (0b97b03d88b4 xen/pci: Try harder to get PXM inf=
ormation for Xen)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (6ba94429c8e7 workqueue: Reorder sysfs code)
Merging drivers-x86/for-next (cdbff6119408 MAINTAINERS: Add me on list of D=
ell laptop drivers)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (04b7fe6a4a23 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/ide)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (1fbaf327b79c leds: gpio: Fix error handling for led =
name null pointer case)
Merging ipmi/for-next (d0acf734d886 ipmi_ssif: Use interruptible completion=
 for waiting in the thread)
Merging driver-core/driver-core-next (c9e15f25f514 debugfs: allow bad paren=
t pointers to be passed in)
Merging tty/tty-next (5dbc32a88f1e n_gsm: Drop unneeded cast on netdev_priv)
Merging usb/usb-next (00fe52deb45b drivers/usb/core: devio.c: Removed an un=
eeded space before tab)
Merging usb-gadget/next (bbc78c07a51f usb: core: hub: use new USB_RESUME_TI=
MEOUT)
Merging usb-serial/usb-next (65dd82ae453f USB: f81232: fix some minor style=
 issues)
Merging staging/staging-next (c610f7f772aa Merge 4.0-rc7 into staging-next)
Merging char-misc/char-misc-next (ea5505fabd3b mei: trace: remove unused TR=
ACE_SYSTEM_STRING)
Merging extcon/extcon-next (66bee35f2968 extcon: Fix missing locking when [=
un]registering notifiers)
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (694600bc1e55 Merge branch 'misc' into for-next)
Merging target-updates/for-next (68d4cef3bab3 target: Put TCMU under a new =
config option)
CONFLICT (content): Merge conflict in drivers/xen/xen-scsiback.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/srpt/ib_srpt.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (b99e6fb86541 pinctrl: fix allmodconfig noise)
Merging vhost/linux-next (f4aaa799cf9a tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (315491e5d6ee remoteproc: add IOMMU hardware ca=
pability flag)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (03daa6f82f2b Revert "gpio: sch: use uapi/linux/pci_i=
ds.h directly")
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (71d54bfabb28 drivers/pwm: Remove __init initializer f=
or pwm_add_table)
Merging dma-buf/for-next (72449cb47b01 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (e0c9c0afd2fc mnt: Update detach_mounts to leave mo=
unts connected)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (03bc10ab5b0f clk: check ->determine/round_rate() retu=
rn value in clk_calc_new_rates)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (2bfd4d1f8c2b ftracetest: Do not use usleep directly)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (075b759be1bb Merge branch 'for-4.1/core-s390=
' into for-next)
Merging exec-domain/exec_domain_rip_v2 (97b2f0dc3314 arm64: Removed unused =
variable)
Merging akpm-current/current (5d77fd3b294b x86: switch to using asm-generic=
 for seccomp.h)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/swap.c
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/mempool.c
CONFLICT (add/add): Merge conflict in mm/cma_debug.c
CONFLICT (content): Merge conflict in lib/vsprintf.c
CONFLICT (content): Merge conflict in kernel/watchdog.c
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in include/linux/swap.h
CONFLICT (content): Merge conflict in include/linux/page-flags.h
CONFLICT (content): Merge conflict in include/linux/kconfig.h
CONFLICT (content): Merge conflict in fs/proc/array.c
CONFLICT (content): Merge conflict in fs/ocfs2/super.c
CONFLICT (content): Merge conflict in fs/ocfs2/localalloc.c
CONFLICT (content): Merge conflict in fs/hfsplus/xattr.c
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in fs/binfmt_elf.c
CONFLICT (content): Merge conflict in fs/befs/linuxvfs.c
CONFLICT (content): Merge conflict in fs/affs/amigaffs.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-omap.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-mc13xxx.c
CONFLICT (content): Merge conflict in drivers/rtc/class.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.c
CONFLICT (content): Merge conflict in arch/s390/pci/pci_debug.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
CONFLICT (content): Merge conflict in Documentation/blockdev/zram.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: mm, x86: document return values of mapping funcs
Applying: mtrr, x86: fix MTRR lookup to handle inclusive entry
Applying: mtrr, x86: remove a wrong address check in __mtrr_type_lookup()
Applying: mtrr, x86: fix MTRR state checks in mtrr_type_lookup()
Applying: mtrr, x86: define MTRR_TYPE_INVALID for mtrr_type_lookup()
Applying: mtrr, x86: clean up mtrr_type_lookup()
Applying: mtrr, mm, x86: enhance MTRR checks for KVA huge page mapping
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (cc08b3ae885b mm: add strictlimit knob)

--Sig_/jTbzzu+VVuAdja1A_cct8mD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNyOnAAoJEMDTa8Ir7ZwVSPQP/2wvgT9v4m+1NAOt+e55ZBMw
lT9jPv6M5H3r5TdAHKCBkMGBk4nj7JJU4nnm5W9aNWHwKZv1DRQj2+fHh1srA/zX
HdJ/PW5YJZ14iZTJe9T+GZlPLDu/llulGpaBwwbslhvp4Q/fN0Ty1RhlWrtxNehm
YK+LUonVB8zBwzbaSb7zLrvAORYGBKVEGYg1zWn9d96hyZttkHElce5L539E5hnV
m+IlS2c2a+t6Ve7d4819eq5Mari+Vfip8V7k9jcQqaL/1Vs/zkSgQ34H0x7SkEFu
0btPPayC6kSBDCbHwuBBit7LZ5V5bwh9UCS/KLuYdXJRtVuiP9IBw7oC0xJBVZrb
44b4WPvay2VfD0CZID3jYXHpCb4IWr86616kX6dyTfPZDwSyWc/OJ/39uWwcTDA3
5c6M6ctJkLsgk1vasvpNQHrjepxRTdkGR7H6BLzsjkVfVfOLzlZpqsJaT4YaRgtO
+x2cUXe+76yj7ZV4Gjn1S9lz6BxAUehcyYmHhwbzGcVehwjUHs3s2fNHPTd8yNFI
2Fmj2jN+uHuupJ1zDmthI+a/P8VJEVPzrOEQyYHps7OCSOssNFuKciaV/YqsnJ+J
nDxh1bERzz04xMgdtHNEyee2pT1ICj4RwtPwAWuu6zDO9WcVf9yCyROR7FN5KSc/
ZtcMB+azcl/dNBeKdhfW
=pIbR
-----END PGP SIGNATURE-----

--Sig_/jTbzzu+VVuAdja1A_cct8mD--
