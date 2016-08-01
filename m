From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 1
Date: Mon, 1 Aug 2016 14:02:25 +1000
Message-ID: <20160801140225.539db451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41335 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750731AbcHAEJc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Aug 2016 00:09:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add material destined for v4.9 to your linux-next included
branches until after v4.8-rc1 has been released.

Changes since 20160729:

New Tree: befs

Non-merge commits (relative to Linus' tree): 4300
 3495 files changed, 145910 insertions(+), 65285 deletions(-)

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

I am currently merging 241 trees (counting Linus' and 35 trees of patches
pending for Linus' tree).

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
Merging origin/master (c9b95e5961c0 Merge tag 'sound-4.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/master (3fc9d690936f Merge branch 'for-4.8/drivers' of git://git.kernel.dk/linux-block)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize exported variables)
Merging arc-current/for-curr (9bd54517ee86 arc: unwind: warn only once if DW2_UNWIND is disabled)
Merging arm-current/fixes (f6492164ecb1 ARM: 8577/1: Fix Cortex-A15 798181 errata initialization)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (bfa37087aa04 powerpc: Initialise pci_io_base as early as possible)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging net/master (bb9c0fa3aa29 net: dsa: bcm_sf2: Unwind errors in correct order)
Merging ipsec/master (6916fb3b10b3 xfrm: Ignore socket policies when rebuilding hash tables)
Merging netfilter/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (16a910a6722b cfg80211: handle failed skb allocation)
Merging sound-current/for-linus (0984d159c8ad sound: oss: Use kernel_read_file_from_path() for mod_firmware_load())
Merging pci-current/for-linus (ef0dab4aae14 PCI: Fix unaligned accesses in VC code)
Merging driver-core.current/driver-core-linus (523d939ef98f Linux 4.7)
Merging tty.current/tty-linus (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging usb.current/usb-linus (e65805251f2d Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging usb-gadget-fixes/fixes (50c763f8c1ba usb: dwc3: Set the ClearPendIN bit on Clear Stall EP command)
Merging usb-serial-fixes/usb-linus (4c2e07c6a29e Linux 4.7-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common: otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging char-misc.current/char-misc-linus (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging input-current/for-linus (080888286377 Merge branch 'next' into for-linus)
Merging crypto-current/master (8cf740ae85df crypto: marvell - Don't copy IV vectors from the _process op for ciphers)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (ce7585f3c4d7 vfio/pci: Allow VPD short read)
Merging kselftest-fixes/fixes (f80eb4289491 selftests/exec: Makefile is a run-time dependency, add it to the install list)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (ed2eebbd61af drm/i915: add missing condition for committing planes on crtc)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (3925a16ae980 ARC: mm: don't loose PTE_SPECIAL in pte_modify())
Merging arm/for-next (bf9cb4359182 Merge branches 'component', 'cpuidle', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (9914c2a60844 arm-soc: document merge)
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/fec.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2-svk.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-imx/mach-imx51.c
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/board_bcm21664.c
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Applying: clocksource/drivers/clps_711x: fixup for "ARM: clps711x: Switch to MULTIPLATFORM"
Merging amlogic/for-next (4d9b3db03bd4 Merge remote-tracking branch 'clk/clk-s905' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (63a404a3f177 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (feaf6b0beba8 Merge branch 'mvebu/defconfig64' into mvebu/for-next)
Merging omap/for-next (370c3261ba8a Merge branch 'omap-for-v4.8/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (289f9fb05d0c ARM: dts: msm8916: Add smsm and smp2p nodes)
Merging renesas/next (314a0bb0dd88 Merge branch 'heads/soc-fixes-for-v4.8' into next)
Merging rockchip/for-next (ebbfb5d5627d Merge branch 'v4.8-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (253256f64294 Merge branch 'next/soc' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (b551165a4593 Merge branch for-4.8/arm64/defconfig into for-next)
Merging arm64/for-next/core (fd6380b75065 arm64: arm: Fix-up the removal of the arm64 regs_query_register_name() prototype)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging m68knommu/for-next (33688abb2802 Linux 4.7-rc4)
Merging metag/for-next (fb2bb461e2d8 metag: Remove duplicate KERN_<LEVEL> prefix)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (c94ff0653c94 Merge branch '4.7-fixes' into mips-for-linux-next)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (5975b2c0c10a Merge branch 'parisc-4.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc/next (719dbb2df78f Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (e64a5470dcd2 s390/ftrace/jprobes: Fix conflict between jprobes and function graph tracing)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (0748d718ba7e sh: Delete unnecessary checks before the function call "mempool_destroy")
CONFLICT (content): Merge conflict in arch/sh/include/asm/spinlock.h
Applying: locking/spinlock, arch: merge fix for "sh: add J2 atomics using the cas.l instruction"
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_ZERO) pattern)
Merging uml/linux-next (a78ff1112263 um: add extended processor state save/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging befs/for-next (20af61a9f5b7 MAINTAINERS: befs: add new maintainers)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (d84c090ad3e9 Fixup: fs_info/root cleanups and qgroups patches)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
Merging ceph/master (a0f2b6527541 ceph: fix symbol versioning for ceph_monc_do_statfs)
Merging cifs/for-next (27ae0c41ed2e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse)
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (194dc870a589 Add braces to avoid "ambiguous ‘else’" compiler warnings)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (e1cb6be9e142 GFS2: Fix gfs2_replay_incr_blk for multiple journal sizes)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (944171cbf499 pNFS: Actively set attributes as invalid if LAYOUTCOMMIT is outstanding)
Merging nfsd/nfsd-next (4b954bf8b629 nfsd: check that S_IFDIR implies d_can_lookup)
Merging orangefs/for-next (78fee0b6846f orangefs: fix namespace handling)
Merging overlayfs/overlayfs-next (b92a89750dba Revert "vfs: add lookup_hash() helper")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (5d71afb00840 ubi: Use bitmaps in Fastmap self-check code)
Merging xfs/for-next (f2bdfda9a1c6 Merge branch 'xfs-4.8-misc-fixes-4' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (38a8a5e62f9a Merge branch 'work.const-qstr' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Applying: qstr: unconstify fuse_reverse_inval_entry parameter
Merging pci/next (e667f341ff20 Merge branch 'pci/host-artpec' into next)
Merging pstore/for-next/pstore (35da60941e44 pstore/ram: add Device Tree bindings)
Merging hid/for-next (de1bcd764ea0 Merge branch 'for-4.8/upstream' into for-next)
Merging i2c/i2c/for-next (c35d490516e6 Merge branch 'i2c/for-4.8' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (1d3dd4ce210f Documentation: dtb: xgene: Add hwmon dts binding documentation)
Merging v4l-dvb/master (bcbadf9d8331 Merge branch 'topic/docs-next' into to_next)
Merging pm/linux-next (6a0b69070529 Merge branch 'pnp' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (2c5ce98e1e83 thermal: sysfs: add comments describing locking strategy)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_sysfs.c
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_helpers.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (61fa0c294347 Merge branch 'for-linus' into next)
Merging net-next/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging netfilter-next/master (4b512e1c1f8d netfilter: nft_compat: fix crash when related match/target module is removed)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (cb6a11518850 wlcore: spi: fix build warning caused by redundant variable)
Merging bluetooth/master (4f6781836206 mac802154: use rate limited warnings for malformed frames)
Merging mac80211-next/master (7d27a0ba7adc cfg80211: Add mesh peer AID setting API)
Merging rdma/for-next (fb92d8fb1b9c Merge branches 'cxgb4-4.8', 'mlx5-4.8' and 'fw-version' into k.o/for-4.8)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (92d21ac74a9e Linux 4.7-rc7)
Merging mtd/master (7ce9ea7e6b35 mtd: nand: omap2: Add check for old elm binding)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence QuadSPI on non-ARM)
CONFLICT (content): Merge conflict in drivers/mtd/devices/Kconfig
Merging nand/nand/next (8490c03bd9d4 mtd: nand: jz4780: Update MODULE_AUTHOR email address)
Merging crypto/master (0f95e2ffc58f Merge git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging drm/drm-next (1cf915d305b6 Merge tag 'imx-drm-fixes-2016-07-27' of git://git.pengutronix.de/git/pza/linux into drm-next)
CONFLICT (modify/delete): drivers/staging/android/sync.h deleted in HEAD and modified in drm/drm-next. Version drm/drm-next of drivers/staging/android/sync.h left in tree.
CONFLICT (content): Merge conflict in drivers/media/platform/omap/omap_voutdef.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip_drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_debugfs.c
CONFLICT (content): Merge conflict in Documentation/index.rst
$ git rm -f drivers/staging/android/sync.h
Applying: staging/android: merge fix up for sync.h renaming
Merging drm-panel/drm/panel/for-next (9bb34c4c730d drm/panel: simple: Add support for Starry KR122EA0SRA panel)
Merging drm-intel/for-linux-next (a7b4667a0002 drm/i915: Never fully mask the the EI up rps interrupt on SNB/IVB)
Merging drm-tegra/drm/tegra/for-next (64ea25c3bc86 drm/tegra: sor: Reject HDMI 2.0 modes)
Merging drm-misc/topic/drm-misc (12ae57aab438 drm/arm: mali-dp: Fix error return code in malidp_bind())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (25d6a931b3f3 Merge branches 'sunxi/clk-fixes-for-4.7', 'sunxi/defconfig-for-4.8', 'sunxi/drm-fixes-for-4.7' and 'sunxi/dt-for-4.8' into sunxi/for-next)
Merging kbuild/for-next (f6830d5346c9 Merge branch 'kbuild/misc' into kbuild/for-next)
CONFLICT (content): Merge conflict in Makefile
Merging kspp/for-next/kspp (6fbe16013e52 Merge branch 'for-next/ro_after_init' into for-next/kspp)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in drivers/char/random.c
CONFLICT (content): Merge conflict in arch/x86/kernel/x86_init.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/uaccess.h
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (efeb1a3ab91d Merge remote-tracking branches 'regmap/topic/bulk', 'regmap/topic/i2c', 'regmap/topic/iopoll', 'regmap/topic/irq' and 'regmap/topic/maintainers' into regmap-next)
Merging sound/for-next (0984d159c8ad sound: oss: Use kernel_read_file_from_path() for mod_firmware_load())
Merging sound-asoc/for-next (e70a386d6f07 Merge remote-tracking branch 'asoc/fix/rcar' into asoc-linus)
Merging modules/modules-next (8acc0026b0f3 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (192bd2be1a75 Input: add driver for Silead touchscreens)
Merging block/for-next (b013517951a1 Merge branch 'for-4.8/core' into for-next)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (b5ab4a9ba557 dm: allow bio-based table to be upgraded to bio-based with DAX support)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (6ea625794518 mmc: rtsx_pci: Remove deprecated create_singlethread_workqueue)
Merging md/for-next (4fe0a741cdde raid5: fix incorrectly counter of conf->empty_inactive_list_nr)
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (4fcd504edbf7 power: reset: add reboot mode driver)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instead of checking for built-in or module)
Merging regulator/for-next (a485f5fc8c8e Merge remote-tracking branches 'regulator/topic/qcom-spmi', 'regulator/topic/rn5t618', 'regulator/topic/tps65218' and 'regulator/topic/twl' into regulator-next)
Merging security/next (7616ac70d1bb apparmor: fix SECURITY_APPARMOR_HASH_DEFAULT parameter handling)
Merging integrity/next (544e1cea03e6 ima: extend the measurement entry specific pcr)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3f09354ac84c netlabel: Implement CALIPSO config functions for SMACK.)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoton i2c driver (NPCT6xx family))
Merging watchdog/master (1ac06563434e watchdog: gpio_wdt: Fix missing platform_set_drvdata() in gpio_wdt_probe())
Merging iommu/next (f360d3241f55 Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/msm', 'arm/rockchip', 'arm/smmu' and 'core' into next)
CONFLICT (content): Merge conflict in drivers/iommu/mtk_iommu.c
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return code during release)
Merging jc_docs/docs-next (a88b1672d4dd doc-rst: kernel-doc: fix handling of address_space tags)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (43761473c254 audit: fix a double fetch in audit_log_single_execve_arg())
Merging devicetree/for-next (e973f4ec130a xtensa: Partially Revert "xtensa: Remove unnecessary of_platform_populate with default match table")
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and type mismatches in Broadcom PDC driver)
Merging spi/for-next (2932c287108e spi: img-spfi: Remove spi_master_put in img_spfi_remove())
Merging tip/auto-latest (0bd99d3b2034 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a67adb32d941 ARM: dts: Add Arria10 Ethernet EDAC devicetree entry)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/misc' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (5bc94664884a rcu: Avoid redundant quiescent-state chasing)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (912902ce78b0 Merge tag 'kvm-arm-for-4.8' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into next)
CONFLICT (content): Merge conflict in virt/kvm/kvm_main.c
CONFLICT (modify/delete): virt/kvm/arm/vgic.c deleted in kvm/linux-next and modified in HEAD. Version HEAD of virt/kvm/arm/vgic.c left in tree.
CONFLICT (content): Merge conflict in include/linux/irqchip/arm-gic-v3.h
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/s390/mm/gmap.c
CONFLICT (content): Merge conflict in arch/s390/hypfs/hypfs_diag.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/idle_book3s.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/exceptions-64s.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/Makefile
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/paca.h
$ git rm -f virt/kvm/arm/vgic.c
Applying: s390: fix merge conflict in arch/s390/kvm/kvm-s390.c
Applying: s390: merge fix up for __diag204 move
Merging kvm-arm/next (3f312db6b65b KVM: arm: vgic-irqfd: Workaround changing kvm_set_routing_entry prototype)
CONFLICT (content): Merge conflict in virt/kvm/irqchip.c
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (93d17397e4e2 KVM: PPC: Book3S HV: Save/restore TM state in H_CEDE)
Merging kvms390/next (9acc317b183f KVM: s390: let ptff intercepts result in cc=3)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization of steal_clock op to xen_time_ops)
Merging percpu/for-next (6710e594f71c percpu: fix synchronization between synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (c37636b450ae dell-wmi: Ignore WMI event 0xe00e)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_safe)
Merging leds/for-next (5706c01fcfb3 leds: is31fl32xx: define complete i2c_device_id table)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (523d939ef98f Linux 4.7)
Merging tty/tty-next (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging usb/usb-next (0bf048abebb6 staging: emxx_udc: allow modular build)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (3161da970d38 USB: serial: use variable for status)
Merging usb-chipidea-next/ci-for-usb-next (229d43daf8ed usb: chipidea: imx: set over current polarity per dts setting)
Merging staging/staging-next (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging char-misc/char-misc-next (0e06f5c0deee Merge branch 'akpm' (patches from Andrew))
Merging extcon/extcon-next (c2692f2dad4f extcon: Block the bit masking operation for cable state except for extcon core)
Merging cgroup/for-next (1cab4a96cab6 Merge branch 'for-4.8' into for-next)
Merging scsi/for-next (d242e6680e81 fcoe: Use default VLAN for FIP VLAN discovery)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (737bee9308c4 libata-scsi: better style in ata_msense_*())
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (9573e7923007 pinctrl: fix pincontrol definition for marvell)
Merging vhost/linux-next (139ab4d4e68b tools/virtio: add noring tool)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (e937b335a738 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (152b09f20130 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (d22527fed2f0 Merge branch 'clk-fixes' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (d78388dbec25 selftests: media_tests add a new video device test)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core' into for-next)
Merging coresight/next (27ee11458de3 coresight: tmc: Delete an unnecessary check before the function call "kfree")
Merging rtc/rtc-next (144d2fe0ad37 rtc: asm9260: remove .owner field for driver)
CONFLICT (content): Merge conflict in arch/x86/platform/efi/efi_64.c
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (0606263f24f3 Merge branch 'for-4.8/libnvdimm' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (1042ef17ceff ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in include/linux/thread_info.h
CONFLICT (content): Merge conflict in fs/befs/linuxvfs.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: drivers/fpga/Kconfig: fix build failure
Applying: tree-wide: replace config_enabled() with IS_ENABLED()
Applying: include/linux/bitmap.h: cleanup
Applying: powerpc: add explicit #include <asm/asm-compat.h> for jump label
Applying: sparc: support static_key usage in non-module __exit sections
Applying: tile: support static_key usage in non-module __exit sections
Applying: arm: jump label may reference text in __exit
Applying: jump_label: remove bug.h, atomic.h dependencies for HAVE_JUMP_LABEL
Applying: dynamic_debug: add jump label support
Applying: ipc/sem.c: fix complex_count vs. simple op race
Applying: media: mtk-vcodec: remove unused dma_attrs
Applying: dma-mapping: use unsigned long for dma_attrs
Applying: alpha: dma-mapping: use unsigned long for dma_attrs
Applying: arc: dma-mapping: use unsigned long for dma_attrs
Applying: ARM: dma-mapping: use unsigned long for dma_attrs
Applying: arm64: dma-mapping: use unsigned long for dma_attrs
Applying: avr32: dma-mapping: use unsigned long for dma_attrs
Applying: blackfin: dma-mapping: use unsigned long for dma_attrs
Applying: c6x: dma-mapping: use unsigned long for dma_attrs
Applying: cris: dma-mapping: use unsigned long for dma_attrs
Applying: frv: dma-mapping: use unsigned long for dma_attrs
Applying: drm/exynos: dma-mapping: use unsigned long for dma_attrs
Applying: drm/mediatek: dma-mapping: use unsigned long for dma_attrs
Applying: drm/msm: dma-mapping: use unsigned long for dma_attrs
Applying: drm/nouveau: dma-mapping: use unsigned long for dma_attrs
Applying: drm/rockship: dma-mapping: use unsigned long for dma_attrs
Applying: infiniband: dma-mapping: use unsigned long for dma_attrs
Applying: iommu: dma-mapping: use unsigned long for dma_attrs
Applying: media: dma-mapping: use unsigned long for dma_attrs
Applying: xen: dma-mapping: use unsigned long for dma_attrs
Applying: swiotlb: dma-mapping: use unsigned long for dma_attrs
Applying: powerpc: dma-mapping: use unsigned long for dma_attrs
Applying: video: dma-mapping: use unsigned long for dma_attrs
Applying: x86: dma-mapping: use unsigned long for dma_attrs
Applying: iommu: intel: dma-mapping: use unsigned long for dma_attrs
Applying: h8300: dma-mapping: use unsigned long for dma_attrs
Applying: hexagon: dma-mapping: use unsigned long for dma_attrs
Applying: ia64: dma-mapping: use unsigned long for dma_attrs
Applying: m68k: dma-mapping: use unsigned long for dma_attrs
Applying: metag: dma-mapping: use unsigned long for dma_attrs
Applying: microblaze: dma-mapping: use unsigned long for dma_attrs
Applying: mips: dma-mapping: use unsigned long for dma_attrs
Applying: mn10300: dma-mapping: use unsigned long for dma_attrs
Applying: nios2: dma-mapping: use unsigned long for dma_attrs
Applying: openrisc: dma-mapping: use unsigned long for dma_attrs
Applying: parisc: dma-mapping: use unsigned long for dma_attrs
Applying: misc: mic: dma-mapping: use unsigned long for dma_attrs
Applying: s390: dma-mapping: use unsigned long for dma_attrs
Applying: sh: dma-mapping: use unsigned long for dma_attrs
Applying: sparc: dma-mapping: use unsigned long for dma_attrs
Applying: tile: dma-mapping: use unsigned long for dma_attrs
Applying: unicore32: dma-mapping: use unsigned long for dma_attrs
Applying: xtensa: dma-mapping: use unsigned long for dma_attrs
Applying: remoteproc: qcom: use unsigned long for dma_attrs
Applying: dma-mapping: remove dma_get_attr
Applying: dma-mapping: document the DMA attributes next to the declaration
Applying: samples/kprobe: convert the printk to pr_info/pr_err
Applying: samples/jprobe: convert the printk to pr_info/pr_err
Applying: samples/kretprobe: convert the printk to pr_info/pr_err
Applying: samples/kretprobe: fix the wrong type
Merging akpm/master (5bdda9f163b7 samples/kretprobe: fix the wrong type)
