From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 13
Date: Mon, 13 Apr 2015 22:12:11 +1000
Message-ID: <20150413221211.435d5c26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MDj5n5_20YLz/0wUeoDr12R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/MDj5n5_20YLz/0wUeoDr12R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v4.2 material to your linux-next included trees
until after v4.1-rc1 is released.

Changes since 20150410:

New tree: exec-domain

The arm-current tree lost its build failure.

The arm-soc tree still had its build failure for which I reverted
a commit.

The powerpc-mpe tree lost its build failure and gained conflicts against
the powerpc tree.

The vfs tree gained conflicts against the btrfs, ext4, f2fs and xfs trees.

The v4l-dvb tree's build failure was fixed with a merge fix patch to
the slave-dma tree.

The pm tree gained a build failure for which I applied a patch.

The block tree gained a conflict against Linus' tree.

The tip tree gained a conflict against the mips tree.

The rcu tree gained a build failure for which I reverted a commit.

The irqchip tree gained a build failure so I used the verison from
next-20150410.

The ftrace tree gained conflicts against the vfs and net-next trees.

The xen-tip tree gained a build failure so I used the version from
next-20150410.

The vhost tree gained a conflict against the pci tree.

The gpio tree lost its build failure.

The kselftest tree gained a conflict against the powerpc-mpe tree.

The akpm-current tree gained conflicts against the vfs tree and a build
failure for which I applied a merge fix patch.

Non-merge commits (relative to Linus' tree): 10291
 9203 files changed, 424383 insertions(+), 207669 deletions(-)

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
Merging origin/master (39a8804455fb Linux 4.0)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (6c5c2a01fcfd ARM: proc-arm94*.S: fix setup funct=
ion)
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
Merging sound-current/for-linus (eef0342cf326 ALSA: usb-audio: Don't attemp=
t to get Microsoft Lifecam Cinema sample rate)
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
Merging input-current/for-linus (92bac83dd79e Input: alps - non interleaved=
 V2 dualpoint has separate stick button bits)
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
Merging arm/for-next (16fa1c8e9522 Merge branch 'devel-stable' into for-nex=
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
Merging mips/mips-for-linux-next (fb55e5c3e23d Merge branch '4.0-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/bus/Makefile
Merging nios2/nios2-next (4a89c3088ff6 nios2: fix cache coherency issue whe=
n debug with gdb)
Merging parisc-hd/for-next (476840458128 parisc: Eliminate sg_virt_addr() a=
nd private scatterlist.h)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging powerpc-mpe/next (f7e9e3583625 powerpc: Fix missing L2 cache size i=
n /sys/devices/system/cpu)
CONFLICT (content): Merge conflict in arch/powerpc/platforms/powernv/pci-io=
da.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/machdep.h
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
Merging xtensa/for_next (834a316eeebc xtensa: Fix fix linker script transfo=
rmation for .text / .text.fixup)
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
Merging f2fs/dev (e03b07d9084d f2fs: do not recover wrong data index)
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
Merging net-next/master (5288ec157cf1 Merge branch 'master' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/d=
wmac-socfpga.c
Merging vfs/for-next (f1d36c2d7111 block: loop: switch to VFS ITER_BVEC)
CONFLICT (content): Merge conflict in net/9p/protocol.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_iops.c
CONFLICT (content): Merge conflict in fs/udf/file.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
CONFLICT (content): Merge conflict in fs/ext4/namei.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/xattr.c
Merging pci/next (5468d5a64bf1 Merge branch 'pci/misc' into next)
Merging hid/for-next (e7f236eb0af9 Merge branch 'for-4.1/sensor-hub' into f=
or-next)
Merging i2c/i2c/for-next (2bbd681ba2bf i2c: xlp9xx: Driver for Netlogic XLP=
9XX/5XX I2C controller)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (f354169e0f7d hwmon: (pwm-fan) Update the =
duty cycle inorder to control the pwm-fan)
Merging v4l-dvb/master (bfb4e26f2532 Merge branch 'patchwork' into to_next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.txt
Merging kbuild/for-next (79e4ae22ea92 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (dcb0d097cd00 Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (08fb40f3fbeb Merge branches 'powercap' and 'pm-tools=
')
Applying: intel_pstate: fix bad merge (MSR_NHM_TURBO_RATIO_LIMIT rename)
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
Merging slave-dma/next (b0820254ee69 Merge branch 'fixes' into next)
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-mackerel.c deleted i=
n HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/m=
ach-shmobile/board-mackerel.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-ape6evm.c deleted in=
 HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/ma=
ch-shmobile/board-ape6evm.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-mackerel.c arch/arm/mach-shmobile/=
board-ape6evm.c
Applying: v4l: xilinx: fix for include file movement
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (f56d9e23b78e ssb: add delay after PCI=
 reset to fix SoC reboots)
Merging bluetooth/master (7f50ad22c642 Bluetooth: bt3c: Delete some unusefu=
l comments)
Merging infiniband/for-next (8494057ab5e4 IB/uverbs: Prevent integer overfl=
ow in ib_umem_get address arithmetic)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (91c9ea71a0ba staging: mt29f_spinand: show parent dev=
ice in sysfs)
Merging crypto/master (e68410ebf626 crypto: x86/sha512_ssse3 - move SHA-384=
/512 SSSE3 implementation to base layer)
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (1d8ac08d498d Merge tag 'v4.0-rc7' into drm-next)
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (af8fcb9c58f1 drm/i915/chv: Remove DPIO fo=
rce latency causing interpair skew issue)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0578be680c66 drm: Use kref_put_mutex in dr=
m_gem_object_unreference_unlocked)
Merging drm-exynos/exynos-drm/for-next (377b8fc67dc3 drm/exynos: Enable DP =
clock to fix display on Exynos5250 and other)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (c30cf8cbe554 ALSA: control: Fix a typo of SNDRV_CTL=
_ELEM_ACCESS_TLV_* with SNDRV_CTL_TLV_OP_*)
Merging sound-asoc/for-next (7667428f8052 Merge remote-tracking branches 'a=
soc/topic/wm2200', 'asoc/topic/wm5100', 'asoc/topic/wm8731', 'asoc/topic/wm=
8804' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (cc9e605dc6cb module: do not print allocation-=
fail warning on bogus user buffer size)
Merging virtio/virtio-next (2f921b5bb051 lguest: suppress interrupts for si=
ngle insn, not range.)
Merging input/next (8b8a518ef16b Input: atkbd - document "no new force-rele=
ase quirks" policy)
Merging block/for-next (8e8b713f1961 Merge branch 'for-4.1/core' into for-n=
ext)
CONFLICT (content): Merge conflict in block/blk-mq.c
Merging device-mapper/for-next (223c1aa8360a dm crypt: fix deadlock when as=
ync crypto algorithm returns -EBUSY)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (69f0fb2a592f mmc: sdhci-st: Update ST SDHCI binding do=
cumentation.)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (14d18f75214b md/raid5: allow the stripe_cache to grow =
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
Merging regulator/for-next (4ec0853ac5d5 Merge remote-tracking branch 'regu=
lator/topic/wm8350' into regulator-next)
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
Merging jc_docs/docs-next (197175427a22 Documentation/memcg: update memcg/k=
mem status)
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
Merging spi/for-next (56afdb70ca91 Merge remote-tracking branches 'spi/topi=
c/spidev' and 'spi/topic/spidev-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (5bfbc76cb20a Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in tools/perf/config/Makefile
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in include/linux/bpf.h
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
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
Merging irqchip/irqchip/for-next (14878fc53c2d Merge branch 'irqchip/vybrid=
' into irqchip/for-next)
$ git reset --hard HEAD^
Merging next-20150410 version of irqchip
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (2ea825a9f1ad Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
CONFLICT (content): Merge conflict in kernel/trace/trace.c
CONFLICT (content): Merge conflict in drivers/net/wireless/iwlwifi/iwl-devt=
race.h
Applying: iwlwifi: mvm: fix up for tracing split
Merging rcu/rcu/next (c55f6e1f6f69 cpu: Defer smpboot kthread unparking unt=
il CPU known to scheduler)
Merging kvm/linux-next (ca3f0874723f KVM: use slowpath for cross page cache=
d accesses)
CONFLICT (content): Merge conflict in arch/mips/kernel/genex.S
Merging kvm-arm/next (d44758c0dfc5 KVM: arm/arm64: enable KVM_CAP_IOEVENTFD)
Merging kvm-ppc/kvm-ppc-next (35fd68a38d57 kvm: x86: fix x86 eflags fixed b=
it)
Merging kvms390/next (816c7667ea97 KVM: s390: migrate vcpu interrupt state)
Merging xen-tip/linux-next (b0c7fd5839ae xen/pciback: Remove is_busmaster=
=3D0 as pci_disable_device does it already)
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
$ git reset --hard HEAD^
Merging next-20150410 version of xen-tip
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
[master 2d13ceca5e83] next-20150410/xen-tip
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (6ba94429c8e7 workqueue: Reorder sysfs code)
Merging drivers-x86/for-next (cdbff6119408 MAINTAINERS: Add me on list of D=
ell laptop drivers)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (5e83a0463ac0 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (ccdc45075aea leds: Don't treat the LED name as a for=
mat string)
Merging ipmi/for-next (d0acf734d886 ipmi_ssif: Use interruptible completion=
 for waiting in the thread)
Merging driver-core/driver-core-next (c9e15f25f514 debugfs: allow bad paren=
t pointers to be passed in)
Merging tty/tty-next (b3e3bf2ef2c7 Merge 4.0-rc7 into tty-next)
CONFLICT (content): Merge conflict in drivers/dma/Kconfig
Merging usb/usb-next (00fe52deb45b drivers/usb/core: devio.c: Removed an un=
eeded space before tab)
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
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (f9f50f949739 Merge branch 'misc' into for-next)
Merging target-updates/for-next (b4dd93cb4409 target: simplify the target t=
emplate registration API)
CONFLICT (content): Merge conflict in drivers/xen/xen-scsiback.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (1dfe0d159dc7 pinctrl: sirf: move sgpio lock into =
state container)
Merging vhost/linux-next (dd29714ec856 tun, macvtap: higher order allocatio=
ns for skbs)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-pci.c
CONFLICT (content): Merge conflict in Documentation/PCI/pci.txt
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
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (e0c9c0afd2fc mnt: Update detach_mounts to leave mo=
unts connected)
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
CONFLICT (content): Merge conflict in tools/testing/selftests/powerpc/tm/Ma=
kefile
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
Merging exec-domain/exec_domain_rip_v2 (720d70716d13 sparc: Fix execution d=
omain removal)
[master 6bf3f986c081] Revert "cpu: Defer smpboot kthread unparking until CP=
U known to scheduler"
Merging akpm-current/current (5d77fd3b294b x86: switch to using asm-generic=
 for seccomp.h)
CONFLICT (content): Merge conflict in include/linux/kconfig.h
CONFLICT (content): Merge conflict in fs/hfsplus/xattr.h
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in fs/ext2/file.c
CONFLICT (content): Merge conflict in fs/befs/linuxvfs.c
CONFLICT (content): Merge conflict in fs/affs/amigaffs.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-mc13xxx.c
CONFLICT (content): Merge conflict in drivers/rtc/class.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
Applying: fs/hfsplus: merge fix for d_inode() annotation
Applying: powerpc: merge fix for watchdog_enable_hardlockup_detector API ch=
ange
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
Merging akpm/master (9868adc2bb81 mm: add strictlimit knob)

--Sig_/MDj5n5_20YLz/0wUeoDr12R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK7KiAAoJEMDTa8Ir7ZwVMw0P/RxvoX52H0PW7X3owsoWjcNe
gbi04qwzo/xMXVjxt40DPZhuVDfaHr8j0eR5IDIuPlCmAU6BmDV+VtrU4DlMnsMV
Ofx8UxZTo15azGE1u1D/Tjld/zbeK1jtjyp9HG4XsXXVwkiqbYkN3q2SDMJKaiqQ
Au5AtOZ/EmVkiEfmiCgSiCcJfPFH43iboGPz1KPsz58swoPlTIoAJvX0FYYCpZAC
avVh+z2C32vkj7Q2X19yB0lTgW+YF0ExfxWvLlf6TjyCR2mG9GcScdVdmQkDrIZz
HLEQP4tMRMWip7HvuF0GvCQq/LJe9PuqxNe88cWkfjkqvoAnaFlBVpd9BX65ELft
0aA8knDuQf578rbZW0xvBm4ctCYKLtPHLJi3yc6uvc05Gs9OUcxlNK3tGIc1BDyF
XExcr/ZHF9fcuWRS+AUepK44y+IW7y2xztZfekrSU2GhMKl/gM1nm52lSFgQBsgQ
B1LsMFvCB9QuW7QGeReCWnwCirFG1oofXmhRTgyBKxJ8xoOtM+0qF6whgJgzZ9Ux
3o1JdnEAaCoWsVdME3vq6B1QbAV+6yLNd0ysRiQMcHo6l6dJZgZ30Duzt8vuVMyl
PcQPG5u9buY6EpPWRqJPku0caRGJneAG9mH6Pt3aSAgDNsVifF1Q5Ib/QSuOLppn
noLUG1SBeFI6feryb9X7
=mZ89
-----END PGP SIGNATURE-----

--Sig_/MDj5n5_20YLz/0wUeoDr12R--
