From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 10
Date: Fri, 10 Apr 2015 21:18:06 +1000
Message-ID: <20150410211806.574ae8f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x2V__EjlE0JVjvoP2rwjg7h"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53285 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754295AbbDJLSS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 07:18:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/x2V__EjlE0JVjvoP2rwjg7h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150409:

New tree: drm-msm

The arm-current tree gained a build failure for which I reverted a commit.

The arm-soc tree still had its build failure for which I reverted
a commit.

The powerpc-mpe tree gained a build failure for which I reverted a commit.

The net-next tree gained a conflict against the net tree.

The v4l-dvb tree gained a conflict against Linus' tree and a build
failure for which I reverted 3 commits.

The target-updates tree gained a conflict against the xen-tip tree.

The gpio tree gained a build failure for which I reverted a commit.

The akpm-current tree gained a conflict against the v4l-dvb tree.

Non-merge commits (relative to Linus' tree): 9874
 8677 files changed, 405088 insertions(+), 199154 deletions(-)

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

I am currently merging 214 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (3cfb2f7976a2 Merge tag 'pci-v4.0-fixes-3' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (9854a280a446 ARM: proc-arm94*.S: fix setup funct=
ion)
$ git am -3 ../patches/0001-Revert-ARM-proc-v7-avoid-errata-430973-workarou=
nd-fo.patch
Applying: Revert "ARM: proc-v7: avoid errata 430973 workaround for non-Cort=
ex A8 CPUs"
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-merge-mpe/fixes (1cced5015b17 Merge branch 'for-linus' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sparc/master (f22e6e847115 Linux 4.0-rc7)
Merging net/master (b50edd781285 tcp: tcp_make_synack() should clear skb->t=
stamp)
Merging ipsec/master (092a29a40bab vti6: fix uninit when using x-netns)
Merging sound-current/for-linus (3dc8523fa741 ALSA: usb - Creative USB X-Fi=
 Pro SB1095 volume knob support)
Merging pci-current/for-linus (71f83b8e5c7f Revert "sparc/PCI: Clip bridge =
windows to fit in upstream windows")
Merging wireless-drivers/master (69628cd0652a Merge tag 'iwlwifi-for-kalle-=
2015-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (bc465aa9d045 Linux 4.0-rc5)
Merging tty.current/tty-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb.current/usb-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb-gadget-fixes/fixes (65582a7f4ce5 usb: isp1760: fix spin unlock =
in the error path of isp1760_udc_start)
Merging usb-serial-fixes/usb-linus (f22e6e847115 Linux 4.0-rc7)
Merging staging.current/staging-linus (f22e6e847115 Linux 4.0-rc7)
Merging char-misc.current/char-misc-linus (bc465aa9d045 Linux 4.0-rc5)
Merging input-current/for-linus (bd884149aca6 Input: elantech - fix absolut=
e mode setting on some ASUS laptops)
Merging crypto-current/master (ccfe8c3f7e52 crypto: aesni - fix memory usag=
e in GCM decryption)
Merging ide/master (b314acaccd7e Merge branch 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/dtor/input)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (ec76f4007079 vfio-pci: Add missing break to e=
nable VFIO_PCI_ERR_IRQ_INDEX)
Merging kselftest-fixes/fixes (67d8712dcc70 selftests: Fix build failures w=
hen invoked from kselftest target)
Merging drm-intel-fixes/for-linux-next-fixes (5df0582bf036 drm/i915/vlv: re=
move wait for previous GFX clk disable request)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (18e1d1b115f7 arc: copy_thread(): rename 'arg' argumen=
t to 'kthread_arg')
Merging arm/for-next (70e73cfbcb18 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (874c571414d5 arm-cci: Fix CCI PMU event val=
idation)
Merging arm-soc/for-next (f12318bc515f ARM: SoC: document merges)
$ git am -3 ../patches/0001-Revert-ARM-dts-mt8135-Add-pinctrl-GPIO-EINT-nod=
e-for.patch
Applying: Revert "ARM: dts: mt8135: Add pinctrl/GPIO/EINT node for mt8135."
Merging at91/at91-next (d8a291a11778 Merge tag 'at91-dt2' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (33e156f34c26 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (dd9feff9079c Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (23aa6c6f4bed Merge branch 'omap-for-v4.0/fixes' into=
 for-next)
Applying: ARM: dts: omap3: fixup for merge conflict around omap3_scm_general
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
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging arm64-acpi/for-next/acpi (7676fa70feb2 ARM64 / ACPI: make acpi_map_=
gic_cpu_interface() as void function)
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
Merging mips/mips-for-linux-next (3bb621412207 Merge branch '4.0-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/bus/Makefile
Merging nios2/nios2-next (6347e2a10f70 nios2: mm: do not invoke OOM killer =
on kernel fault OOM)
Merging parisc-hd/for-next (476840458128 parisc: Eliminate sg_virt_addr() a=
nd private scatterlist.h)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging powerpc-mpe/next (041e4ca33eb0 powerpc: Drop return value of smp_op=
s->probe())
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (1a327ffd3d6a s390/syscalls: simplify syscall_get_arc=
h())
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (28d86a60ebad tile: nohz: warn if nohz_full uses hyperv=
isor shared cores)
Merging uml/linux-next (b98b91029cf8 hostfs: No need to box and later unbox=
 the file mode)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (0372c1abdd0d Merge tag 'xtensa-for-next-20150304' =
of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging btrfs/next (4a3d1caf8a2c fs: btrfs: Add missing include file)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/ceph_common.c
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in include/linux/ceph/libceph.h
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
CONFLICT (content): Merge conflict in fs/ceph/inode.c
Merging cifs/for-next (be4a8e38d68f Update negotiate protocol for SMB3.1 di=
alect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (3adc12e96482 udf: Update ctime and mtime when direct=
ory is modified)
Merging ext4/dev (efe5aad5ae4f ext4 crypto: enable encryption feature flag)
Merging f2fs/dev (eec7aa403b37 f2fs: do not recover wrong data index)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (30133177957d gfs2: fix quota refresh race in do_gloc=
k())
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (1ec8c0c47f63 nfsd: Remove duplicate macro define fo=
r max sec label length)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f569d3ef8254 net/9p: add a privport option for RDMA =
transport.)
Merging ubifs/linux-next (180a53577b80 UBI: Fastmap: Fall back to scanning =
mode after ECC error)
Merging xfs/for-next (a448f8f1b744 Merge branch 'fallocate-insert-range' in=
to for-next)
Merging file-locks/linux-next (0429c2b5c1c4 locks: use cmpxchg to assign i_=
flctx pointer)
Merging net-next/master (c3d0dac6935e Merge branch 'for-upstream' of git://=
git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next)
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/d=
wmac-socfpga.c
Merging vfs/for-next (d987f083c43b ntfs: move iov_iter_truncate() closer to=
 generic_write_checks())
CONFLICT (content): Merge conflict in net/9p/protocol.c
CONFLICT (content): Merge conflict in fs/udf/file.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
Merging pci/next (8e795840e4d8 Merge branches 'pci/enumeration' and 'pci/vi=
rtualization' into next)
Merging hid/for-next (9e17aa316bdd Merge branch 'for-4.1/upstream' into for=
-next)
Merging i2c/i2c/for-next (3b10db23c041 i2c: dln2: set the device tree node =
of the adapter)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (8416915c16d4 hwmon: (ibmpowernv) Fix buil=
d error seen for some configurations)
Merging v4l-dvb/master (bfb4e26f2532 Merge branch 'patchwork' into to_next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.txt
Merging kbuild/for-next (d8d26a8d103a Merge branch 'kbuild/kbuild' into kbu=
ild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (dcb0d097cd00 Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (09d26e637a56 Merge branches 'pm-cpufreq-next' and 'p=
m-cpuidle-next' into linux-next)
Merging idle/next (ec9b792ef33e Merge branches 'cpuidle' and 'turbostat' in=
to release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (c0d6da701ae3 Merge branches 'thermal-fix' and 'therma=
l-intel' of .git into next)
Merging thermal-soc/next (62d0817a0aca Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (733dbbd78164 Merge branch 'for-linus' into next)
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-mackerel.c deleted i=
n HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/m=
ach-shmobile/board-mackerel.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-ape6evm.c deleted in=
 HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/ma=
ch-shmobile/board-ape6evm.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-mackerel.c arch/arm/mach-shmobile/=
board-ape6evm.c
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (f56d9e23b78e ssb: add delay after PCI=
 reset to fix SoC reboots)
Merging bluetooth/master (23310f6f3a8f mac802154: fix transmission power da=
tatype)
Merging infiniband/for-next (8494057ab5e4 IB/uverbs: Prevent integer overfl=
ow in ib_umem_get address arithmetic)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (81a1209c9091 mtd: spi-nor: Add support for Macronix =
mx25u6435f serial flash)
Merging crypto/master (1711045fb11b crypto: sahara - fix AES descriptor cre=
ate)
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (1d8ac08d498d Merge tag 'v4.0-rc7' into drm-next)
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (6e0aa8018f9c Merge tag 'v4.0-rc6' into dr=
m-intel-next)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0578be680c66 drm: Use kref_put_mutex in dr=
m_gem_object_unreference_unlocked)
Merging drm-exynos/exynos-drm/for-next (377b8fc67dc3 drm/exynos: Enable DP =
clock to fix display on Exynos5250 and other)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (cfd3113e7cc3 ALSA: hda/via - Add missing stream_pm =
ops setup)
Merging sound-asoc/for-next (c47177d2985e Merge remote-tracking branches 'a=
soc/topic/wm2200', 'asoc/topic/wm5100', 'asoc/topic/wm8731', 'asoc/topic/wm=
8804' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (cc9e605dc6cb module: do not print allocation-=
fail warning on bogus user buffer size)
Merging virtio/virtio-next (2f921b5bb051 lguest: suppress interrupts for si=
ngle insn, not range.)
Merging input/next (8d289842c8ab Input: ALPS - V7 devices can report 5-fing=
er taps)
Merging block/for-next (8e8b713f1961 Merge branch 'for-4.1/core' into for-n=
ext)
Merging device-mapper/for-next (a9da1e30fce5 dm crypt: fix deadlock when al=
go returns -EBUSY)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (8d86e4fcccf6 mmc: sdhci-esdhc-imx: Call mmc_of_parse())
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (8447cb7738d8 md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (e554a99ee8d0 mfd: sec: Fix RTC alarm interrupt nu=
mber on S2MPS11)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (5939d9dfe440 power: twl4030_madc_battery: Add missi=
ng MODULE_ALIAS)
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/wacom.h
Applying: HID: wacom: merge fix for "Change ownership from driver to core"
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (f3890c0545d8 Merge remote-tracking branches 're=
gulator/topic/stw481x' and 'regulator/topic/wm8350' into regulator-next)
Applying: drm/msm: fixes for regulator_set_optimum_mode name change
Merging security/next (4f9a60f5c7e7 Merge branch 'smack-for-4.1' of git://g=
ithub.com/cschaufler/smack-next into next)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
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
Merging jc_docs/docs-next (c8a329c777f5 doc: Add guest_nice column to examp=
le output of `cat /proc/stat')
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (724e7bfcc566 audit: Remove condition which always evalu=
ates to false)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
CONFLICT (rename/delete): Documentation/devicetree/bindings/mips/brcm/brcm,=
cm-dsl.txt deleted in HEAD and renamed in devicetree/devicetree/next. Versi=
on devicetree/devicetree/next of Documentation/devicetree/bindings/mips/brc=
m/brcm,cm-dsl.txt left in tree.
CONFLICT (rename/delete): Documentation/devicetree/bindings/mips/brcm/brcm,=
bcm3384-intc.txt deleted in HEAD and renamed in devicetree/devicetree/next.=
 Version devicetree/devicetree/next of Documentation/devicetree/bindings/mi=
ps/brcm/brcm,bcm3384-intc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/mips/brcm/brcm,bcm3384-intc.t=
xt Documentation/devicetree/bindings/mips/brcm/brcm,cm-dsl.txt
Merging dt-rh/for-next (01218bf14ee6 of: Explicitly include linux/types.h i=
n of_graph.h)
Merging mailbox/mailbox-for-next (ee23d66af921 mailbox: arm_mhu: add driver=
 for ARM MHU controller)
Merging spi/for-next (4ea3d0519080 Merge remote-tracking branches 'spi/topi=
c/spidev' and 'spi/topic/spidev-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (6947cce16cb1 Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in include/linux/bpf.h
Applying: ARM: VDSO: rename tkr to tkr_mono
Applying: bpf: semantic merge conflict fix in kernel/events/core.c
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (7ecc79901e08 Merge branch 'irqchip/stacke=
d-irq_set_wake' into irqchip/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (e65e0516fb5f Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (265f40690e3a locktorture: Change longdelay_us to long=
delay_ms)
Merging kvm/linux-next (35fd68a38d57 kvm: x86: fix x86 eflags fixed bit)
CONFLICT (content): Merge conflict in arch/mips/kernel/genex.S
Merging kvm-arm/next (d44758c0dfc5 KVM: arm/arm64: enable KVM_CAP_IOEVENTFD)
Merging kvm-ppc/kvm-ppc-next (35fd68a38d57 kvm: x86: fix x86 eflags fixed b=
it)
Merging kvms390/next (816c7667ea97 KVM: s390: migrate vcpu interrupt state)
Merging xen-tip/linux-next (278edfc07875 xen-pciback: also support disablin=
g of bus-mastering and memory-write-invalidate)
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (6ba94429c8e7 workqueue: Reorder sysfs code)
Merging drivers-x86/for-next (5d3fc1d54e5a toshiba_bluetooth: Fix enabling/=
disabling loop on recent devices)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (5e83a0463ac0 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (ccdc45075aea leds: Don't treat the LED name as a for=
mat string)
Merging ipmi/for-next (6a83ac6c005c ipmi:ssif: Ignore spaces when comparing=
 I2C adapter names)
Merging driver-core/driver-core-next (c9e15f25f514 debugfs: allow bad paren=
t pointers to be passed in)
Merging tty/tty-next (b3e3bf2ef2c7 Merge 4.0-rc7 into tty-next)
CONFLICT (content): Merge conflict in drivers/dma/Kconfig
Merging usb/usb-next (b7a4abb67416 Merge 4.0-rc7 into usb-next)
Merging usb-gadget/next (bbc78c07a51f usb: core: hub: use new USB_RESUME_TI=
MEOUT)
Merging usb-serial/usb-next (65dd82ae453f USB: f81232: fix some minor style=
 issues)
Merging staging/staging-next (c610f7f772aa Merge 4.0-rc7 into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/media/mn88473/mn88473=
.c
Merging char-misc/char-misc-next (1ac4e6fee41d DTS: ARM: OMAP3-N900: Add li=
s3lv02d support)
Merging extcon/extcon-next (f9471ff9a895 extcon: usb-gpio: register extcon =
device before IRQ registration)
Merging kdbus/kdbus (98ecc663f3f9 selftest/kdbus: enable cross compilation)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (d916fe918770 Merge branch 'misc' into for-next)
Merging target-updates/for-next (b4dd93cb4409 target: simplify the target t=
emplate registration API)
CONFLICT (content): Merge conflict in drivers/xen/xen-scsiback.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (1dfe0d159dc7 pinctrl: sirf: move sgpio lock into =
state container)
Merging vhost/linux-next (dd29714ec856 tun, macvtap: higher order allocatio=
ns for skbs)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-pci.c
Merging remoteproc/for-next (315491e5d6ee remoteproc: add IOMMU hardware ca=
pability flag)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (549c5dc19ee3 gpio: dwapb: remove dependencies)
$ git am -3 ../patches/0001-Revert-gpio-sch-use-uapi-linux-pci_ids.h-direct=
ly.patch
Applying: Revert "gpio: sch: use uapi/linux/pci_ids.h directly"
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (71d54bfabb28 drivers/pwm: Remove __init initializer f=
or pwm_add_table)
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (e52786ac3ca7 clk: versatile: test returned value)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (2bfd4d1f8c2b ftracetest: Do not use usleep directly)
CONFLICT (content): Merge conflict in tools/testing/selftests/powerpc/Makef=
ile
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (075b759be1bb Merge branch 'for-4.1/core-s390=
' into for-next)
CONFLICT (content): Merge conflict in arch/s390/Kconfig
[master 22405f387ecb] Revert "powerpc: Make STRICT_MM_TYPECHECKS a config o=
ption"
$ git am -3 ../patches/0001-Revert-media-v4l-xilinx-Add-Test-Pattern-Genera=
tor-d.patch
Applying: Revert "[media] v4l: xilinx: Add Test Pattern Generator driver"
$ git am -3 ../patches/0002-Revert-media-v4l-xilinx-Add-Video-Timing-Contro=
ller-.patch
Applying: Revert "[media] v4l: xilinx: Add Video Timing Controller driver"
$ git am -3 ../patches/0003-Revert-media-v4l-xilinx-Add-Xilinx-Video-IP-cor=
e.patch
Applying: Revert "[media] v4l: xilinx: Add Xilinx Video IP core"
Merging akpm-current/current (5d77fd3b294b x86: switch to using asm-generic=
 for seccomp.h)
CONFLICT (content): Merge conflict in include/linux/kconfig.h
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in fs/ext2/file.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-mc13xxx.c
CONFLICT (content): Merge conflict in drivers/rtc/class.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: mips: ip32: add platform data hooks to use DS1685 driver
Applying: oprofile: reduce mmap_sem hold for mm->exe_file
Applying: powerpc/oprofile: reduce mmap_sem hold for exe_file
Applying: oprofile-reduce-mmap_sem-hold-for-mm-exe_file-fix
Applying: tomoyo: reduce mmap_sem hold for mm->exe_file
Applying: tomoyo-reduce-mmap_sem-hold-for-mm-exe_file-checkpatch-fixes
Applying: prctl: avoid using mmap_sem for exe_file serialization
Applying: MAINTAINERS: add Mediatek SoC mailing list
Applying: .gitignore: ignore *.tar
Applying: drivers/rtc/rtc-s5m.c: allow usage on device type different than =
main MFD type
Applying: rtc-s5m-allow-usage-on-device-type-different-than-main-mfd-type-v2
Applying: Documentation/spi/spidev_test.c: fix warning
Applying: drivers/rtc/rtc-at91rm9200.c: make IO endian agnostic
Applying: mm, x86: document return values of mapping funcs
Applying: mtrr, x86: fix MTRR lookup to handle inclusive entry
Applying: mtrr, x86: remove a wrong address check in __mtrr_type_lookup()
Applying: mtrr, x86: fix MTRR state checks in mtrr_type_lookup()
Applying: mtrr, x86: define MTRR_TYPE_INVALID for mtrr_type_lookup()
Applying: mtrr, x86: clean up mtrr_type_lookup()
Applying: mtrr, mm, x86: enhance MTRR checks for KVA huge page mapping
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (836ea414d24b mm: add strictlimit knob)

--Sig_/x2V__EjlE0JVjvoP2rwjg7h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ7F1AAoJEMDTa8Ir7ZwVyGkP/3VXppyi1y/skFCndgo8+Qvl
kz3Pv9X/bUgRJ3VGvypvog7XCFFciPuutEkzPupf8k9br5UzSHUfw+mAJr7W5JE6
nq0R5UeylVHmnpJCbkngDrYX7IhPViDzJ48MCBJ6HlTODEfXKWjH3YHfm9IuUy7A
kyXuW5bEdR5vaNgtzBgrcnaUkHx271alKN3ZWexJ7b+Z7NzCUNltFCEoRb87o2yc
sdoubBgwbErlj4ruy2ybXgOEUpKonJy16L5IDlJSQNLl6IHN1Cg40uTJHv5j7gyx
pnM04XhwLIuh+YF9FRDzrv17s5D3cwn9NNhHAFg2kMa3xyy/t7y/jds5qNdQtUhi
TaEUpkBEA72/3QLWGtu8fDPQGOW0ni7VmPYvkweQV1nTe2/gGPKbvAkDeGmtb0sO
8Jz8OjZ7/5jMiD4sZLntzBw5dQBH0ZTZx0NgCPTcSNlaVnXHiYoc5hyrcrqLOPL1
GGvfz/TNUxgEXaF3Uw+kHp2aJ0wYkxkrmyA15G/ip8WSq/B7Sk/gdARPJ/I1XXbk
EVTDLdLFe2gsN323a0oZrHOWAgAOECYII4C0V3Du78saeVMCpwdvRDulM5onDUbP
7XOXFxFAOKoofDDGlePMpg8qMhf4/cVbsm22H63WTFetnMCsq8Rr2xT7og6VtKLy
Fo+4RI9FMNMOxdoJRyP5
=32N8
-----END PGP SIGNATURE-----

--Sig_/x2V__EjlE0JVjvoP2rwjg7h--
