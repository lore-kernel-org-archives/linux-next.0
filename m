From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 22
Date: Tue, 22 Nov 2016 21:30:32 +1100
Message-ID: <20161122213032.2a88af29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58571 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755202AbcKVKah (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 05:30:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

News: The powerpc allyesconfig build (with KALLSYMS_EXTRA_PASS=1) now
works for the first time in many years.

Changes since 20161117:

The rockchip tree gained a conflict against the arm-soc tree.

The arm64 tree gained a conflict against Linus' tree.

The net-next tree gained conflicts against the net tree.

The drm tree gained a conflict against the arm tree.

The block tree gained a conflict against the f2fs tree.

The lightnvm tree gained a conflict against Linus' tree.

The md tree gained conflicts against the block tree.

The audit tree gained a conflict against Linus' tree.

The tip tree gained conflicts against the pm tree.

The char-misc tree gained a conflict against the lightnvm tree.

The userns tree gained complex conflicts against Linus' tree, so I
used the version from next-20161117.

The clk tree gained complex conflicts against the arm-soc tree, so I
used the version from next-20161117.

The akpm-current tree gained build failures due to interactions with
the tip and vfio trees.  I applied merge fix patches.

Non-merge commits (relative to Linus' tree): 7272
 7466 files changed, 439808 insertions(+), 163788 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc and an allmodconfig (with
CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(with KALLSYMS_EXTRA_PASS=1) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 244 trees (counting Linus' and 34 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

-- 
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (9c763584b7c8 Linux 4.9-rc6)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c6a385539175 kbuild: Steal gcc's pie from the very beginning)
Merging arc-current/for-curr (a25f0944ba9b Linux 4.9-rc5)
Merging arm-current/fixes (575f6e7a97ab ARM: 8630/1: don't use assembler macro arguments with EXPORT_SYMBOL())
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (cac4a185405d powerpc/mm: Fix missing update of HID register on secondary CPUs)
Merging sparc/master (9dd35d6882a1 sparc: drop duplicate header scatterlist.h)
Merging net/master (7082c5c3f240 tcp: zero ca_priv area when switching cc algorithms)
Merging ipsec/master (330e832abda9 xfrm: unbreak xfrm_sk_policy_lookup)
Merging netfilter/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging ipvs/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging wireless-drivers/master (fcd2042e8d36 mwifiex: printk() overflow with 32-byte SSIDs)
Merging mac80211/master (51b9a31c42ed tipc: eliminate obsolete socket locking policy description)
Merging sound-current/for-linus (6ff1a25318eb ALSA: usb-audio: Fix use-after-free of usb_device at disconnect)
Merging pci-current/for-linus (9f46107b8ce4 PCI: designware-plat: Update author email)
Merging driver-core.current/driver-core-linus (a25f0944ba9b Linux 4.9-rc5)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (c0da038d7afe Merge tag 'usb-serial-4.9-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (05e78c6933d6 usb: gadget: f_fs: fix wrong parenthesis in ffs_func_req_match())
Merging usb-serial-fixes/usb-linus (2ab13292d7a3 USB: serial: cp210x: add ID for the Zone DPMX)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (a25f0944ba9b Linux 4.9-rc5)
Merging char-misc.current/char-misc-linus (a25f0944ba9b Linux 4.9-rc5)
Merging input-current/for-linus (e9fb7cc63801 Input: psmouse - disable automatic probing of BYD touchpads)
Merging crypto-current/master (5db0bf563afd vmalloced stacks and scatterwalk_map_and_copy())
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (722f191080de mfd: core: Fix device reference leak in mfd_clone_cell)
Merging drm-intel-fixes/for-linux-next-fixes (9c763584b7c8 Linux 4.9-rc6)
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (298c5d3a9211 ARC: rename Zebu platform support to HAPS)
Merging arm/for-next (1a04e922a997 Merge branch 'syscalls' into for-next)
Merging arm-perf/for-next/perf (f43365ee17f8 selftests: arm64: add test for unaligned/inexact watchpoint handling)
Merging arm-soc/for-next (74c8b908f58c ARM: SoC: Document merges)
Merging pinctrl/for-next (cc482ec6bcf2 Merge branch 'devel' into for-next)
Merging amlogic/for-next (6743126ab0cc Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ec09fdf764ee Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (242a001e48b7 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (4f6ba24f6b83 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (cf5b8e48ae82 Merge branch 'omap-for-v4.10/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (0c25fdf93ef1 dt-bindings: firmware: scm: Add MSM8996 DT bindings)
Merging renesas/next (9a71f2627d23 Merge branch 'soc-for-v4.10' into next)
Merging rockchip/for-next (7e02e53c6ecf Merge branch 'v4.10-clk/next' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (7ecabb674ba9 Merge branch 'next/dt64' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (82e0191a1aa1 arm64: Support systems without FP/ASIMD)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
Applying: arm64: merge fix for code movement to cpucaps.h
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (c78874f116be tty: serial: make crisv10 explicitly non-modular)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (25ba49085c4f m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (974cc521c0d5 m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (3f56647d2d68 Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (c8d2bc9bc39e Linux 4.8)
Merging powerpc/next (e9eb0278dad9 powerpc/64: Used named initialisers for ibm_pa_features)
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (a95aeb2ff4a9 s390/pci_dma: remove memset from dma_alloc)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (03eae3aca94c xtensa: fix screen_info, clean up unused declarations in setup.c)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (5d9011fcbf20 Merge branch 'for-next-next-4.9-20161121' into for-next-20161121)
Merging ceph/master (264048afab27 libceph: initialize last_linger_id with a large integer)
Merging cifs/for-next (faad81c4f581 CIFS: iterate over posix acl xattr entry correctly in ACL_to_cifs_posix())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (e952813e210b ext2: avoid bogus -Wmaybe-uninitialized warning)
Merging ext4/dev (19b29dca7eef ext4: avoid lockdep warning when inheriting encryption context)
Merging f2fs/dev (143968e81811 f2fs: fix incorrect free inode count in ->statfs)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (59c3b76cc61d fuse: fix fuse_write_end() if zero bytes were copied)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (14155cafeadd btrfs: assign error values to the correct bio structs)
Merging nfsd/nfsd-next (7ba630f54ca6 nfsd: constify reply_cache_stats_operations structure)
Merging orangefs/for-next (19ff7fcc76e6 orangefs: add .owner to debugfs file_operations)
Merging overlayfs/overlayfs-next (a0151afd9c51 ovl: allow setting max size of redirect)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a00052a296e5 ubifs: Fix regression in ubifs_readdir())
Merging xfs/for-next (0fc204e2eb64 Merge branch 'xfs-4.10-misc-fixes-1' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1a452ec24b3f Merge branch 'pci/host-vmd' into next)
Merging pstore/for-next/pstore (fc46d4e453f5 ramoops: add pdata NULL check to ramoops_probe)
Merging hid/for-next (1e5bea536e18 Merge branch 'for-4.10/intel-ish' into for-next)
Merging i2c/i2c/for-next (9634249ff737 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (97a575762b70 hwmon: (adt7411) update to new hwmon registration API)
Merging jc_docs/docs-next (9c240d757658 Change the document about iowait)
Merging v4l-dvb/master (36f94a5cf0f9 Merge tag 'v4.9-rc5' into patchwork)
Merging pm/linux-next (e369eccde63c Merge branch 'pm-sleep' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (6d54bcc0c910 Merge branch 'for-rc' into next)
Merging thermal-soc/next (6ee459f5f967 devfreq_cooling: pass a pointer to devfreq in the power model callbacks)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (e796f49d826a net: ieee802154: constify ieee802154_ops structures)
CONFLICT (content): Merge conflict in kernel/bpf/verifier.c
CONFLICT (content): Merge conflict in include/linux/bpf_verifier.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/cavium/thunder/nicvf_main.c
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (7d384846b998 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (97489c284d9f mwifiex: pcie: stop checking for NULL adapter->card)
Merging bluetooth/master (52069883235a Bluetooth: hci_qca: Use setup_timer Kernel API instead of init_timer)
Merging mac80211-next/master (8df5cf149cc3 nl80211: fix logic inversion in start_nan())
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (64ad46379fcf mtd: bcm47xxsflash: use uncached MMIO access for BCM53573)
Merging nand/nand/next (8fcfba072420 mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd)
Merging crypto/master (ed424bb3680b hwrng: Make explicit that max >= 32 always)
Merging drm/drm-next (b7c0e47d9824 Merge tag 'drm-vc4-next-2016-11-16' of https://github.com/anholt/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i2c/tda998x_drv.c
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (e9cbc4bd0140 drm/i915: Update DRIVER_DATE to 20161121)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/topic/drm-misc (8c0b55e22aff drm/atomic: cleanup debugfs entries on un-registering the driver.)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (d8b243fb20e3 Merge tags 'sunxi-clk-for-4.10' and 'sunxi-dt-late-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (68fdc678df46 MAINTAINERS: add GCC plugins Makefile)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (74e3368de87d Merge remote-tracking branches 'regmap/fix/header' and 'regmap/fix/macro' into regmap-linus)
Merging sound/for-next (2e57069c869f ALSA: bebob: compare whole string for model name so that readers are not confused)
Merging sound-asoc/for-next (e75804999365 Merge remote-tracking branch 'asoc/topic/wm9713' into asoc-next)
Merging input/next (dadbb0aa363b Input: gpio_keys - set input direction explicitly)
Merging block/for-next (e4a60d6676b6 Merge branch 'for-4.10/block' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
Merging lightnvm/for-next (039d17753cdd lightnvm: manage lun partitions internally in mm)
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
Merging device-mapper/for-next (50947d38881d dm crypt: add ability to use keys from the kernel key retention service)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (e2081b37d910 Merge branch 'fixes' into next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3bddb7f8f264 md/r5cache: handle FLUSH and FUA)
CONFLICT (content): Merge conflict in drivers/md/raid5-cache.c
Merging mfd/for-mfd-next (6ab531499fa5 mfd: intel_soc_pmic_bxtwc: Fix a typo in MODULE_DEVICE_TABLE())
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (44fccac4ff17 power: supply: lp8788: remove an unneeded NULL check)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (2a8c988fbf05 Merge remote-tracking branches 'regulator/topic/lp873x', 'regulator/topic/max77620', 'regulator/topic/pwm', 'regulator/topic/tps6507x' and 'regulator/topic/twl' into regulator-next)
Merging security/next (185c0f26c026 Merge commit 'v4.9-rc5' into next)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3322d0d64f4e selinux: keep SELinux in sync with new capability definitions)
Merging tpmdd/next (e5be0840857c tpm: vtpm_proxy: Do not access host's event log)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (7ff612ecad97 Merge branches 'arm/mediatek', 'x86/amd', 'core' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5ba6de98c78a vfio: fix vfio_info_cap_add/shift)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (0489410368df audit: add support for session ID user filter)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (3c263bc7b727 add bindings document for altera freeze bridge)
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (40303aca7a26 Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/spidev', 'spi/topic/sunxi' and 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (18a65804d12a manual merge of x86/urgent)
CONFLICT (content): Merge conflict in drivers/net/ethernet/amd/Kconfig
CONFLICT (modify/delete): drivers/idle/i7300_idle.c deleted in tip/auto-latest and modified in HEAD. Version HEAD of drivers/idle/i7300_idle.c left in tree.
CONFLICT (content): Merge conflict in drivers/idle/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
$ git rm -f drivers/idle/i7300_idle.c
Applying: net: busy-poll: fix up for cpu_relax_lowlatency() removal
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (27bda205ba93 EDAC, mpc85xx: Implement remove method for the platform driver)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
Merging rcu/rcu/next (f660d64912cc doc: Fix RCU requirements typos)
Merging kvm/linux-next (813ae37e6aed Merge branch 'x86/cpufeature' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into kvm/next)
Merging kvm-arm/next (fd5ebf99f814 arm/arm64: KVM: Clean up useless code in kvm_timer_enable)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (68b8b72bb221 KVM: PPC: Book3S HV: Drop duplicate header asm/iommu.h)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (30b6b22f4e6e MAINTAINERS: update XEN HYPERVISOR INTERFACE)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (401df5ace9d6 intel_pmc_core: Add KBL CPUID support)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (70ce59ec088c leds: ledtrig-heartbeat: Make top brightness adjustable)
Merging ipmi/for-next (426f07e89458 ipmi: Fix sequence number handling)
Merging driver-core/driver-core-next (dfea747d2aba drivers: base: cacheinfo: support DT overrides for cache properties)
Merging tty/tty-next (b81064547338 mxs-auart: count FIFO overrun errors)
CONFLICT (modify/delete): Documentation/VGA-softcursor.txt deleted in HEAD and modified in tty/tty-next. Version tty/tty-next of Documentation/VGA-softcursor.txt left in tree.
$ git rm -f Documentation/VGA-softcursor.txt
Merging usb/usb-next (1aba579f3cf5 cdc-acm: handle read pipe errors)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (009615ab7fd4 USB: serial: cp210x: use tcflag_t to fix incompatible pointer type)
Merging usb-chipidea-next/ci-for-usb-next (3be3251db088 usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (08711b876d3f Staging: rtl8712: rtl871x_*: Removed unnecessary else statements after a break or return)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
Merging char-misc/char-misc-next (7c7a6077f5c7 mei: bus: split RX and async notification callbacks)
CONFLICT (content): Merge conflict in drivers/lightnvm/core.c
Merging extcon/extcon-next (541332a13b1d extcon: usb-gpio: Add VBUS detection support)
Merging slave-dma/next (3b0df6417477 Merge branch 'fixes' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (1f9931e05609 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (a6854dff635d scsi: ufs: qcom: Properly clear hba priv on failure)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (8881d559aca6 Merge branch 'for-4.9-fixes' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
CONFLICT (content): Merge conflict in drivers/remoteproc/remoteproc_core.c
Merging rpmsg/for-next (10b0916beb03 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0c8a590f5080 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (f3e6f1e7a7e6 exec: Ensure mm->user_ns contains the execed files)
CONFLICT (content): Merge conflict in mm/nommu.c
CONFLICT (content): Merge conflict in mm/memory.c
CONFLICT (content): Merge conflict in kernel/ptrace.c
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in arch/powerpc/kernel/ptrace32.c
CONFLICT (content): Merge conflict in arch/mips/kernel/ptrace32.c
CONFLICT (content): Merge conflict in arch/ia64/kernel/ptrace.c
CONFLICT (content): Merge conflict in arch/cris/arch-v32/kernel/ptrace.c
CONFLICT (content): Merge conflict in arch/blackfin/kernel/ptrace.c
CONFLICT (content): Merge conflict in arch/alpha/kernel/ptrace.c
$ git merge --abort
Merging userns/for-next (2e41414828bb mm: Add a user_ns owner to mm_struct and fix ptrace permission checks)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (9baabf4341a8 Merge tag 'clk-renesas-for-v4.10-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-next)
CONFLICT (content): Merge conflict in drivers/soc/renesas/Makefile
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7796.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7795.dtsi
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-rcar-gen2.c
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7794.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7793.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7792.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7791.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7790.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7779.dtsi
$ git merge --abort
Merging clk/clk-next (9a881bc55d7b clk: Hi6220: enable stub clock driver for ARCH_HISI)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1001354ca341 Linux 4.9-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (7f73c6f7d72a coresight: Add support for ARM Coresight STM-500)
Merging rtc/rtc-next (72d3d79f8da9 rtc: fix typos in Kconfig)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (4cb19355ea19 device-dax: fail all private mapping attempts)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (c2cda3bbc654 ipc/shm.c: coding style fixes)
CONFLICT (content): Merge conflict in mm/memcontrol.c
Applying: ipc/sem: merge fix for WAKE_Q to DEFINE_WAKE_Q rename
Applying: vfio iommu type1: merge fix for get_user_pages_remote API change
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: kexec_file: allow arch-specific memory walking for kexec_add_buffer
Applying: kexec_file: change kexec_add_buffer to take kexec_buf as argument
Applying: kexec_file: factor out kexec_locate_mem_hole from kexec_add_buffer
Applying: powerpc: change places using CONFIG_KEXEC to use CONFIG_KEXEC_CORE instead
Applying: powerpc: factor out relocation code in module_64.c
Applying: powerpc: implement kexec_file_load
Applying: powerpc: add functions to read ELF files of any endianness
Applying: powerpc: add support for loading ELF kernels with kexec_file_load
Applying: powerpc: add purgatory for kexec_file_load implementation
Applying: powerpc: enable CONFIG_KEXEC_FILE in powerpc server defconfigs
Applying: powerpc: ima: get the kexec buffer passed by the previous kernel
Applying: ima: on soft reboot, restore the measurement list
Applying: ima: permit duplicate measurement list entries
Applying: ima: maintain memory size needed for serializing the measurement list
Applying: powerpc: ima: send the kexec buffer to the next kernel
Applying: ima: on soft reboot, save the measurement list
Applying: ima: store the builtin/custom template definitions in a list
Applying: ima: support restoring multiple template formats
Applying: ima: define a canonical binary_runtime_measurements list format
Applying: ima: platform-independent hash value
Applying: ktest.pl: fix english
Applying: kernel/watchdog.c: move shared definitions to nmi.h
Applying: kernel/watchdog.c: move hardlockup detector to separate file
Applying: sparc: implement watchdog_nmi_enable and watchdog_nmi_disable
Merging akpm/master (52de7ea3fe39 sparc: implement watchdog_nmi_enable and watchdog_nmi_disable)
