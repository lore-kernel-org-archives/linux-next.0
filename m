From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 15
Date: Tue, 15 Nov 2016 15:13:41 +1100
Message-ID: <20161115151341.56279581@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20161114:

Removed trees: rr-fixes (done with)
	modules (moving to a new maintainer)

The sound-asoc tree lost its build failure.

The akpm tree gained a conflict against the powerpc tree.

Non-merge commits (relative to Linus' tree): 5448
 5717 files changed, 349662 insertions(+), 117950 deletions(-)

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
(this fails its final link) and pseries_le_defconfig and i386, sparc
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
Merging origin/master (ee2bd216e1fa ASoC: lpass-platform: fix uninitialized variable)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (cc6acc11cad1 kbuild: be more careful about matching preprocessed asm ___EXPORT_SYMBOL)
Merging arc-current/for-curr (a25f0944ba9b Linux 4.9-rc5)
Merging arm-current/fixes (6127d124ee4e ARM: wire up new pkey syscalls)
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (2ffd04dee0da powerpc/oops: Fix missing pr_cont()s in instruction dump)
Merging sparc/master (87a349f9cc09 sparc64: fix compile warning section mismatch in find_node())
Merging net/master (ac571de999e1 mlxsw: spectrum_router: Flush FIB tables during fini)
Merging ipsec/master (7f92083eb58f vti6: flush x-netns xfrm cache when vti interface is removed)
Merging netfilter/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging ipvs/master (b73b8a1ba598 netfilter: nft_dup: do not use sreg_dev if the user doesn't specify it)
Merging wireless-drivers/master (d3532ea6ce4e brcmfmac: avoid maybe-uninitialized warning in brcmf_cfg80211_start_ap)
Merging mac80211/master (269ebce4531b xen-netfront: cast grant table reference first to type int)
Merging sound-current/for-linus (6ff1a25318eb ALSA: usb-audio: Fix use-after-free of usb_device at disconnect)
Merging pci-current/for-linus (bc79c9851a76 PCI: VMD: Update filename to reflect move)
Merging driver-core.current/driver-core-linus (a25f0944ba9b Linux 4.9-rc5)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (a25f0944ba9b Linux 4.9-rc5)
Merging usb-gadget-fixes/fixes (fd9afd3cbe40 usb: gadget: u_ether: remove interrupt throttling)
Merging usb-serial-fixes/usb-linus (9bfef729a3d1 USB: serial: ftdi_sio: add support for TI CC3200 LaunchPad)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (a25f0944ba9b Linux 4.9-rc5)
Merging char-misc.current/char-misc-linus (a25f0944ba9b Linux 4.9-rc5)
Merging input-current/for-linus (324ae0958cab Input: psmouse - cleanup Focaltech code)
Merging crypto-current/master (83d2c9a9c17b crypto: caam - do not register AES-XTS mode on LP units)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (51717929d835 mfd: intel_soc_pmic_bxtwc: Fix usbc interrupt)
Merging drm-intel-fixes/for-linux-next-fixes (fc22b787890f drm/i915: Refresh that status of MST capable connectors in ->detect())
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (5083ce2bc728 clocksource: import ARC timer driver)
Merging arm/for-next (f167e1f561ae Merge branches 'fixes', 'misc', 'sa1100-base' and 'syscalls' into for-next)
Merging arm-perf/for-next/perf (1001354ca341 Linux 4.9-rc1)
Merging arm-soc/for-next (1e1ce567d3a6 ARM: SoC: Document merges)
Merging pinctrl/for-next (477494dc5379 Merge branch 'devel' into for-next)
Merging amlogic/for-next (5753584390e4 Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ec09fdf764ee Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e6e1aa531aa6 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (219c43db9c6e Merge branch 'mvebu/dt64-fix' into mvebu/for-next)
Merging omap/for-next (16be064c79c2 Merge branch 'omap-for-v4.10/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (22240bf2e1b8 Merge tag 'qcom-arm64-for-4.10' into all-for-4.10)
Merging renesas/next (379df2fa4090 Merge branch 'dt-for-v4.10' into next)
Merging rockchip/for-next (6aa00f77028f Merge branch 'v4.10-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (1acb537b2fd1 Merge branch 'next/dt' into for-next)
Merging tegra/for-next (817d74019bab Merge branch for-4.10/arm/defconfig into for-next)
Merging arm64/for-next/core (c02433dd6de3 arm64: split thread_info from task stack)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (c78874f116be tty: serial: make crisv10 explicitly non-modular)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (25ba49085c4f m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (8284a776890f m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (3f56647d2d68 Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (c8d2bc9bc39e Linux 4.8)
Merging powerpc/next (0e27d27e0d6d selftests/powerpc: Return false instead of -1 in require_paranoia_below())
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (1914608db9e8 s390: move sys_call_table and last_break from thread_info to thread_struct)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (709fb1f961ea xtensa: wire up new pkey_{mprotect,alloc,free} syscalls)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (2a782f537899 Merge branch 'for-next-next-4.9-20161108' into for-next-20161108)
Merging ceph/master (264048afab27 libceph: initialize last_linger_id with a large integer)
Merging cifs/for-next (faad81c4f581 CIFS: iterate over posix acl xattr entry correctly in ACL_to_cifs_posix())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (e952813e210b ext2: avoid bogus -Wmaybe-uninitialized warning)
Merging ext4/dev (0144aa8670ac ext4: don't lock buffer in ext4_commit_super if holding spinlock)
Merging f2fs/dev (751e1d334e73 f2fs: return directly if block has been removed from the victim)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0ce267ff95a0 fuse: fix root dentry initialization)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (14155cafeadd btrfs: assign error values to the correct bio structs)
Merging nfsd/nfsd-next (7ba630f54ca6 nfsd: constify reply_cache_stats_operations structure)
Merging orangefs/for-next (dc0336214eb0 orangefs: clean up debugfs)
Merging overlayfs/overlayfs-next (76c50adf1853 ovl: check namelen)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a00052a296e5 ubifs: Fix regression in ubifs_readdir())
Merging xfs/for-next (0fc204e2eb64 Merge branch 'xfs-4.10-misc-fixes-1' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1001354ca341 Linux 4.9-rc1)
Merging pstore/for-next/pstore (07d9a380680d Linux 4.9-rc2)
Merging hid/for-next (297dc03fe248 Merge branch 'for-4.10/i2c-hid' into for-next)
Merging i2c/i2c/for-next (481f190c52ba Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (c2d95c252f65 hwmon: (adm1275) Enable adm1278 VOUT sampling)
Merging jc_docs/docs-next (f5ff9b63d494 MAINTAINERS: The Chinese documentation moved)
Merging v4l-dvb/master (b2c44886f34e [media] gp8psk: Fix DVB frontend attach)
Merging pm/linux-next (e1eddf25f1d8 Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (3105f234e0ab thermal/powerclamp: correct cpu support check)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (eb2ca35f1814 mdio: Demote print from info to debug in mdio_driver_register)
CONFLICT (content): Merge conflict in net/netlink/genetlink.c
CONFLICT (content): Merge conflict in net/netfilter/ipvs/ip_vs_ctl.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (7d384846b998 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (75a608d8d3b2 ipvs: Decrement ttl)
Merging wireless-drivers-next/master (9afdd6128c39 cw1200: Don't leak memory if krealloc failes)
Merging bluetooth/master (52069883235a Bluetooth: hci_qca: Use setup_timer Kernel API instead of init_timer)
Merging mac80211-next/master (17197236d62c enic: set skb->hash type properly)
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging rdma-leon-test/testing/rdma-next (33b4f7c41bae Merge branch 'testing/queue-next' into testing/rdma-next)
CONFLICT (content): Merge conflict in drivers/infiniband/core/roce_gid_mgmt.c
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (64ad46379fcf mtd: bcm47xxsflash: use uncached MMIO access for BCM53573)
Merging nand/nand/next (83f48f80de8a mtd: nand: socrates: use nand_scan() for nand_scan_ident/tail() combo)
Merging crypto/master (9a1a1c08dc28 crypto: caam - merge identical ahash_final/finup shared desc)
Merging drm/drm-next (d8c1abd968f1 Merge tag 'zxdrm-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into drm-next)
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (6b5e90f58c56 drm/i915/scheduler: Boost priorities for flips)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/topic/drm-misc (3da6c2f3b730 drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (2b4f9ae797bc Merge branches 'sunxi/clk-fixes-for-4.9', 'sunxi/drm-fixes-for-4.9' and 'sunxi/dt-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (68fdc678df46 MAINTAINERS: add GCC plugins Makefile)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (74e3368de87d Merge remote-tracking branches 'regmap/fix/header' and 'regmap/fix/macro' into regmap-linus)
Merging sound/for-next (b2fac0730347 ALSA: pci: don't opencode IS_REACHABLE())
CONFLICT (modify/delete): Documentation/sound/alsa/alsa-parameters.txt deleted in sound/for-next and modified in HEAD. Version HEAD of Documentation/sound/alsa/alsa-parameters.txt left in tree.
CONFLICT (content): Merge conflict in Documentation/index.rst
$ git rm -f Documentation/sound/alsa/alsa-parameters.txt
Merging sound-asoc/for-next (9322c2a67821 Merge remote-tracking branches 'asoc/topic/wm8753', 'asoc/topic/wm8978', 'asoc/topic/wm9705', 'asoc/topic/wm9712' and 'asoc/topic/wm9713' into asoc-next)
Merging input/next (406d5a2de071 Input: da9062 - update bindings docs to account for da9061)
Merging block/for-next (800363edd086 Merge branch 'for-4.10/block' into for-next)
Merging lightnvm/for-next (b759d3ddb52f lightnvm: rrpc: split bios of size > 256kb)
Merging device-mapper/for-next (5c5eb3db2893 dm cache metadata: DM_CACHE_FEATURE_INCOMPAT_SEP_DIRTY_BITS)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (a56e2edf8bab mmc: sdhci-iproc: support standard byte register accesses)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (6119e6792bca md: remove md_super_wait() call after bitmap_flush())
Merging mfd/for-mfd-next (77f298a18ff8 mfd: sun4i-gpadc: Fix 'cast from pointer to integer of different size' warning)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (44fccac4ff17 power: supply: lp8788: remove an unneeded NULL check)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (82c306c4fd84 Merge remote-tracking branches 'regulator/topic/gpio', 'regulator/topic/lp873x' and 'regulator/topic/tps6507x' into regulator-next)
Merging security/next (185c0f26c026 Merge commit 'v4.9-rc5' into next)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (8931c3bdb3bf SELinux: Use GFP_KERNEL for selinux_parse_opts_str().)
Merging tpmdd/next (17c1e8f29c5a tpm: cleanup of printk error messages)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (bea64033dd7b iommu/vt-d: Fix dead-locks in disable_dmar_iommu() path)
Merging dwmw2-iommu/master (5b3c5c539eac iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (61771468e0a5 vfio_pci: use pci_alloc_irq_vectors)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (8443075eacb5 audit: tame initialization warning len_abuf in audit_log_execve_info)
Merging devicetree/for-next (13f0cab7a28f of/platform: clarify of_find_device_by_node refcounting)
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (9f90dca6c982 Merge remote-tracking branch 'spi/topic/sunxi' into spi-next)
Merging tip/auto-latest (b460115ab8a5 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c73e8833bec5 EDAC, mc: Fix locking around mc_devices list)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
Merging rcu/rcu/next (5677ddfb887c locktorture: Fix potential memory leak with rw lock test)
Merging kvm/linux-next (6314a17fec5c Merge tag 'tags/for-kvmgt' into HEAD)
Merging kvm-arm/next (2988509dd8a0 ARM: KVM: Support vGICv3 ITS)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (0f06ac3b6616 xen-netback: fix error handling output)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (401df5ace9d6 intel_pmc_core: Add KBL CPUID support)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (64c25ba78c25 leds: ledtrig-heartbeat: Make top brightness adjustable)
Merging ipmi/for-next (426f07e89458 ipmi: Fix sequence number handling)
Merging driver-core/driver-core-next (dfea747d2aba drivers: base: cacheinfo: support DT overrides for cache properties)
CONFLICT (content): Merge conflict in drivers/base/power/main.c
Merging tty/tty-next (26ba68d2f81b tty: typo in comments in drivers/tty/vt/keyboard.c)
CONFLICT (modify/delete): Documentation/VGA-softcursor.txt deleted in HEAD and modified in tty/tty-next. Version tty/tty-next of Documentation/VGA-softcursor.txt left in tree.
$ git rm -f Documentation/VGA-softcursor.txt
Merging usb/usb-next (c95a9f83711b usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL)
Merging usb-gadget/next (1214b9567086 USB: phy: am335x-control: fix device and of_node leaks)
Merging usb-serial/usb-next (2fbd69c4e333 USB: serial: fix invalid user-pointer checks)
Merging usb-chipidea-next/ci-for-usb-next (3be3251db088 usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (7809cd2ce6ab phy: meson: add USB2 PHY support for Meson8b and GXBB)
Merging staging/staging-next (0ffaa9c8eb2f staging: lustre: hsm: Use file lease to implement migration)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
Merging char-misc/char-misc-next (b7d91c915290 Merge 4.9-rc5 into char-misc-next)
Merging extcon/extcon-next (56182a830cbf extcon: usb-gpio: Add VBUS detection support)
Merging slave-dma/next (3456e80bcd5e Merge branch 'fixes' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (8db0ce476654 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (7dc62d935459 scsi: hpsa: free irq on q indexed by h->intr_mode and not i)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (c05b7b88dd3c Merge branch 'for-4.10' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
CONFLICT (content): Merge conflict in drivers/remoteproc/remoteproc_core.c
Merging rpmsg/for-next (6d901d19ad8a Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
CONFLICT (content): Merge conflict in drivers/remoteproc/Kconfig
Merging gpio/for-next (b38b2dfcf2a3 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging userns/for-next (2e41414828bb mm: Add a user_ns owner to mm_struct and fix ptrace permission checks)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (c60df0a42b3a Merge branch 'clk-hisi' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1001354ca341 Linux 4.9-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (dcc37f904443 processor.h: remove cpu_relax_lowlatency)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (7f73c6f7d72a coresight: Add support for ARM Coresight STM-500)
Merging rtc/rtc-next (72d3d79f8da9 rtc: fix typos in Kconfig)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (52e73eb2872c device-dax: fix percpu_ref_exit ordering)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (c2cda3bbc654 ipc/shm.c: coding style fixes)
CONFLICT (content): Merge conflict in mm/memcontrol.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: kexec_file: allow arch-specific memory walking for kexec_add_buffer
Applying: kexec_file: change kexec_add_buffer to take kexec_buf as argument
Applying: kexec_file: factor out kexec_locate_mem_hole from kexec_add_buffer
Applying: powerpc: change places using CONFIG_KEXEC to use CONFIG_KEXEC_CORE instead
Applying: powerpc: factor out relocation code in module_64.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/module_64.c
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
Merging akpm/master (52bbeb7362ab sparc: implement watchdog_nmi_enable and watchdog_nmi_disable)
