From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 15
Date: Fri, 15 Jul 2016 19:07:13 +1000
Message-ID: <20160715190713.4856787d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35522 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932363AbcGOJHR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 05:07:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160714:

The pm tree gained conflicts against the i2c tree.

The drm tree gained a build failure for which I applied a merge fix patch.

The block tree gained conflicts against the ext4 tree.

The devicetree tree gained a conflict against the arc tree.

The luto-misc tree gained a build failure for which I partially reverted
a commit from the tip tree.

The akpm tree gained conflicts against the arm tree and lost a patch
that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 9123
 8606 files changed, 476192 insertions(+), 165210 deletions(-)

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

I am currently merging 238 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (f97d10454e4d Merge branches 'perf-urgent-for-linus' and 'timers-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/master (5edb56491d48 Linux 4.7-rc3)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize exported variables)
Merging arc-current/for-curr (9bd54517ee86 arc: unwind: warn only once if DW2_UNWIND is disabled)
Merging arm-current/fixes (f6492164ecb1 ARM: 8577/1: Fix Cortex-A15 798181 errata initialization)
Merging m68k-current/for-linus (9a6462763b17 m68k/mvme16x: Include generic <linux/rtc.h>)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (eb584b3ee4d3 powerpc/tm: Fix stack pointer corruption in __tm_recheckpoint())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (6b15d6650c53 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging net/master (005db31d5f5f bonding: set carrier off for devices created through netlink)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging netfilter/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging ipvs/master (3777ed688fba ipvs: fix bind to link-local mcast IPv6 address in backup)
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (16a910a6722b cfg80211: handle failed skb allocation)
Merging sound-current/for-linus (d716fb03f764 ALSA: hda: add AMD Stoney PCI ID with proper driver caps)
Merging pci-current/for-linus (ef0dab4aae14 PCI: Fix unaligned accesses in VC code)
Merging driver-core.current/driver-core-linus (92d21ac74a9e Linux 4.7-rc7)
Merging tty.current/tty-linus (a99cde438de0 Linux 4.7-rc6)
Merging usb.current/usb-linus (a99cde438de0 Linux 4.7-rc6)
Merging usb-gadget-fixes/fixes (50c763f8c1ba usb: dwc3: Set the ClearPendIN bit on Clear Stall EP command)
Merging usb-serial-fixes/usb-linus (4c2e07c6a29e Linux 4.7-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common: otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (a99cde438de0 Linux 4.7-rc6)
Merging char-misc.current/char-misc-linus (33688abb2802 Linux 4.7-rc4)
Merging input-current/for-linus (caca925fca4f Input: xpad - validate USB endpoint count during probe)
Merging crypto-current/master (055ddaace035 crypto: user - re-add size check for CRYPTO_MSG_GETALG)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (ce7585f3c4d7 vfio/pci: Allow VPD short read)
Merging kselftest-fixes/fixes (f80eb4289491 selftests/exec: Makefile is a run-time dependency, add it to the install list)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (aeddda06c1a7 drm/i915: Ignore panel type from OpRegion on SKL)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (1ce0b5857f66 ARC: fix linux-next build breakage)
Merging arm/for-next (bf9cb4359182 Merge branches 'component', 'cpuidle', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (d7864dd9fea9 arm-soc: document merges)
Merging amlogic/for-next (4d9b3db03bd4 Merge remote-tracking branch 'clk/clk-s905' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (63a404a3f177 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (feaf6b0beba8 Merge branch 'mvebu/defconfig64' into mvebu/for-next)
Merging omap/for-next (01eab0a3b919 Merge tag 'omap-for-v4.8/defconfig-v2-signed' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (2083e2852282 firmware: qcom: scm: Change initcall to subsys)
Merging renesas/next (a48de99a74c6 Merge branches 'heads/arm64-defconfig-for-v4.8', 'heads/arm64-dt-for-v4.8', 'heads/defconfig-for-v4.8', 'heads/dt-for-v4.8' and 'heads/soc-for-v4.8' into next)
Merging rockchip/for-next (ebbfb5d5627d Merge branch 'v4.8-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (253256f64294 Merge branch 'next/soc' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (6083e0f837ac Merge branch for-4.8/arm64/defconfig into for-next)
Merging arm64/for-next/core (f8d9f924526a arm64: cpuinfo: Expose MIDR_EL1 and REVIDR_EL1 to sysfs)
CONFLICT (content): Merge conflict in arch/arm64/mm/fault.c
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (70f4f9352317 ia64: efi: use timespec64 for persistent clock)
Merging m68k/for-next (86a8280a7fe0 m68k: Assorted spelling fixes)
Merging m68knommu/for-next (33688abb2802 Linux 4.7-rc4)
Merging metag/for-next (592ddeeff8cb metag: Fix typos)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (d117d8edaf68 Merge branch '4.7-fixes' into mips-for-linux-next)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (5975b2c0c10a Merge branch 'parisc-4.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc/next (3b3dcd61fa4e cxl: Ignore CAPI adapters misplaced in switched slots)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (0f5d050ceaa3 s390/cio: allow to reset channel measurement block)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (893d66192c46 tile: support gcc 7 optimization to use __multi3)
Merging uml/linux-next (a78ff1112263 um: add extended processor state save/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (c315ef8d9db7 Merge branch 'for-chris-4.7' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.7)
Merging btrfs-kdave/for-next (91867f65141d Fixup: fs_info/root cleanups and qgroups patches)
Merging ceph/master (f6973c09490c ceph: use i_version to check validity of fscache)
Merging cifs/for-next (8d9535b6efd8 cifs: Check for existing directory when opening file with O_CREAT)
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (a7550b30ab70 ext4 crypto: migrate into vfs's crypto engine)
Merging f2fs/dev (b56ab837a06f f2fs: avoid mark_inode_dirty)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (7879c4e58b7c fuse: improve aio directIO write performance for size extending writes)
Merging gfs2/for-next (44f52122a220 GFS2: Check rs_free with rd_rsspin protection)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (107e08015c43 Merge branch 'writeback')
Merging nfsd/nfsd-next (851f8193ef05 xfs: abstract block export operations from nfsd layouts)
Merging orangefs/for-next (78fee0b6846f orangefs: fix namespace handling)
Merging overlayfs/overlayfs-next (0dd23bd8913f ovl: fix warning)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4ac1c17b2044 UBIFS: Implement ->migratepage())
Merging xfs/for-next (f477cedc4e79 Merge branch 'xfs-4.8-misc-fixes-2' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (b223f4e215b3 Merge branch 'd_real' of git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs into work.misc)
CONFLICT (content): Merge conflict in fs/nfs/dir.c
Merging pci/next (e0af5a975e77 Merge branch 'pci/resource' into next)
CONFLICT (content): Merge conflict in drivers/pci/host/pci-tegra.c
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging pstore/for-next/pstore (35da60941e44 pstore/ram: add Device Tree bindings)
Merging hid/for-next (de1bcd764ea0 Merge branch 'for-4.8/upstream' into for-next)
Merging i2c/i2c/for-next (47e4b843a12b Merge branch 'i2c/for-4.8' into i2c/for-next)
Merging jdelvare-hwmon/master (18c358ac5e32 Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (fa4119e40f2d hwmon: (jc42) Add support for generic JC-42.4 devicetree binding)
Merging v4l-dvb/master (eed2ba2edfbc Merge branch 'patchwork' into to_next)
Merging pm/linux-next (4dbbe08c28d0 Merge branches 'pnp' and 'acpica' into linux-next)
CONFLICT (content): Merge conflict in drivers/i2c/i2c-core.c
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (2c5ce98e1e83 thermal: sysfs: add comments describing locking strategy)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_sysfs.c
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_helpers.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (57494e833e22 Merge branch 'for-linus' into next)
Merging net-next/master (e6dab9021f13 net: ethernet: ll_temac: use phy_ethtool_{get|set}_link_ksettings)
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/fec.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2-svk.dts
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging netfilter-next/master (3101e0fc1f6e netfilter: conntrack: protect early_drop by rcu read lock)
Merging ipvs-next/master (be2cef49904b ipvs: count pre-established TCP states as active)
Merging wireless-drivers-next/master (25f700ef0653 iwlwifi: add missing type declaration)
Merging bluetooth/master (7adfafb251df Bluetooth: Fix l2cap_sock_setsockopt() with optname BT_RCVMTU)
Merging mac80211-next/master (7d27a0ba7adc cfg80211: Add mesh peer AID setting API)
Merging rdma/for-next (fb92d8fb1b9c Merge branches 'cxgb4-4.8', 'mlx5-4.8' and 'fw-version' into k.o/for-4.8)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (92d21ac74a9e Linux 4.7-rc7)
Merging mtd/master (7ce9ea7e6b35 mtd: nand: omap2: Add check for old elm binding)
Merging l2-mtd/master (7ddf7c1ea77d Documentation: atmel-quadspi: add binding file for Atmel QSPI driver)
Merging nand/nand/next (8490c03bd9d4 mtd: nand: jz4780: Update MODULE_AUTHOR email address)
Merging crypto/master (eb9bc8e7afaa crypto: sha-mb - Cleanup code to use || instead of |)
Merging drm/drm-next (5dd0775e502b Merge tag 'asoc-hdmi-codec-pdata' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into drm-next)
CONFLICT (content): Merge conflict in drivers/media/platform/omap/omap_voutdef.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
CONFLICT (content): Merge conflict in Documentation/index.rst
Applying: drm/i915/opregion: fix up for argument change
Merging drm-panel/drm/panel/for-next (9bb34c4c730d drm/panel: simple: Add support for Starry KR122EA0SRA panel)
Merging drm-intel/for-linux-next (b224c4dc70cd drm/i915: Unbreak interrupts on pre-gen6)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_fbc.c
Merging drm-tegra/drm/tegra/for-next (64ea25c3bc86 drm/tegra: sor: Reject HDMI 2.0 modes)
Merging drm-misc/topic/drm-misc (0dcac5008fcf Revert "drm: Resurrect atomic rmfb code")
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip_drm_drv.c
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (a0df8a816225 drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
Applying: drm: msm: fix up for "ASoC: hdmi-codec: callback function will be called with private data"
Merging hdlcd/for-upstream/hdlcd (f6c68b4bd4a9 drm: hdlcd: Add information about the underlying framebuffers in debugfs)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (25d6a931b3f3 Merge branches 'sunxi/clk-fixes-for-4.7', 'sunxi/defconfig-for-4.8', 'sunxi/drm-fixes-for-4.7' and 'sunxi/dt-for-4.8' into sunxi/for-next)
Merging kbuild/for-next (7e01dad0469b Merge branch 'kbuild/kbuild' into kbuild/for-next)
Applying: gcc-plugins: disable under COMPILE_TEST
Merging kspp/for-next/kspp (930e444f3a67 gcc-plugins: Add support for plugin subdirectories)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (4527b981f286 Merge remote-tracking branches 'regmap/topic/bulk', 'regmap/topic/i2c', 'regmap/topic/irq' and 'regmap/topic/maintainers' into regmap-next)
Merging sound/for-next (41e8a5788b5a ALSA: mixart: don't print an unintialized variable on error)
Merging sound-asoc/for-next (0ce380e965e1 Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/wm8985' into asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (946c8432aab0 Input: synaptics-rmi4 - support regulator supplies)
Merging block/for-next (e307caadad5a Merge branch 'for-4.8/drivers' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (modify/delete): fs/ext4/crypto.c deleted in HEAD and modified in block/for-next. Version block/for-next of fs/ext4/crypto.c left in tree.
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
CONFLICT (content): Merge conflict in drivers/block/xen-blkfront.c
CONFLICT (content): Merge conflict in block/blk-lib.c
$ git rm -f fs/ext4/crypto.c
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (013d4ea98948 dm raid: change logical functions to actually return bool)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (b971c091e0da mmc: block: fix free of uninitialized 'idata->buf')
Merging md/for-next (d787be4092e2 md: reduce the number of synchronize_rcu() calls when multiple devices fail.)
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/raid1.c
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (4fcd504edbf7 power: reset: add reboot mode driver)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instead of checking for built-in or module)
Merging regulator/for-next (e3acdc6f314a Merge remote-tracking branches 'regulator/topic/tps65218' and 'regulator/topic/twl' into regulator-next)
Merging security/next (d4d03f74a73f apparmor: fix arg_size computation for when setprocattr is null terminated)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging integrity/next (544e1cea03e6 ima: extend the measurement entry specific pcr)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3f09354ac84c netlabel: Implement CALIPSO config functions for SMACK.)
Merging tpmdd/next (f786b7520982 tpm_crb: fix address space of the return pointer in crb_map_res())
Merging watchdog/master (1a695a905c18 Linux 4.7-rc1)
Merging iommu/next (a9f890f46e6a Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/msm', 'arm/rockchip', 'arm/smmu' and 'core' into next)
CONFLICT (content): Merge conflict in drivers/iommu/mtk_iommu.c
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (05f0c03fbac1 vfio-pci: Allow to mmap sub-page MMIO BARs if the mmio page is exclusive)
Merging jc_docs/docs-next (547218864afb doc-rst: add an option to ignore DocBooks when generating docs)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (0b7a0fdb2971 audit: fix whitespace in CWD record)
CONFLICT (content): Merge conflict in arch/s390/kernel/ptrace.c
Merging devicetree/for-next (15cc2ed6dcf9 of/irq: Mark initialised interrupt controllers as populated)
CONFLICT (content): Merge conflict in arch/arm/mach-imx/mach-imx51.c
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/board_bcm21664.c
CONFLICT (content): Merge conflict in arch/arc/kernel/setup.c
Merging mailbox/mailbox-for-next (9ac3e85a5c5c mailbox: pl320: remove __raw IO)
Merging spi/for-next (ce150a5bbfde Merge remote-tracking branches 'spi/topic/topcliff-pch' and 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (7ea416b3dd83 Merge branch 'timers/nohz')
CONFLICT (content): Merge conflict in arch/x86/kernel/x86_init.c
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Applying: clocksource/drivers/clps_711x: fixup for "ARM: clps711x: Switch to MULTIPLATFORM"
Merging clockevents/clockevents/next (3d802c5c8cfa Merge branches 'clockevents/clksrc-of-ret' and 'clockevents/compile-test' into clockevents/next)
CONFLICT (content): Merge conflict in drivers/clocksource/time-armada-370-xp.c
CONFLICT (content): Merge conflict in drivers/clocksource/cadence_ttc_timer.c
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a67adb32d941 ARM: dts: Add Arria10 Ethernet EDAC devicetree entry)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/misc' into irqchip/for-next)
Merging ftrace/for-next (501c2375253c ftrace: Move toplevel init out of ftrace_init_tracefs())
Merging rcu/rcu/next (fc443a765f24 fixup! rcu: Provide rcusync.expedited kernel boot parameter)
Merging kvm/linux-next (af1bae5497b9 KVM: x86: bump KVM_MAX_VCPU_ID to 1023)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/s390/mm/gmap.c
CONFLICT (content): Merge conflict in arch/s390/hypfs/hypfs_diag.c
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/paca.h
Applying: s390: fix merge conflict in arch/s390/kvm/kvm-s390.c
Applying: s390: merge fix up for __diag204 move
Merging kvm-arm/next (40c4f8d27296 arm64: KVM: Clean up a condition)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fd7bacbca47a KVM: PPC: Book3S HV: Fix TB corruption in guest exit path on HMI interrupt)
Merging kvms390/next (5ffe466cd3a3 KVM: s390: inject PER i-fetch events on applicable icpts)
Merging xen-tip/linux-next (6ba286ad8457 xen: support runqueue steal time on xen)
CONFLICT (content): Merge conflict in drivers/acpi/scan.c
Merging percpu/for-next (6710e594f71c percpu: fix synchronization between synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (df2294fb6428 intel_pmc_core: Convert to DEFINE_DEBUGFS_ATTRIBUTE)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_safe)
Merging leds/for-next (e5598a0054cc leds: LED driver for TI LP3952 6-Channel Color LED)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (92d21ac74a9e Linux 4.7-rc7)
Merging tty/tty-next (67417f9c262e Merge 4.7-rc6 into tty-next)
Merging usb/usb-next (ca2b6faeb96d Merge tag 'phy-for-4.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-testing)
Applying: staging: emxx_udc: allow modular build
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (4c2e07c6a29e Linux 4.7-rc5)
Merging usb-chipidea-next/ci-for-usb-next (ebfad91c5da3 dt-bindings: ci-hdrc-usb2: s/gadget-itc-setting/itc-setting in example)
Merging staging/staging-next (6c71ee3b6157 Merge tag 'iio-for-4.8c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (modify/delete): drivers/staging/lustre/lustre/llite/lloop.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/lustre/lustre/llite/lloop.c left in tree.
CONFLICT (modify/delete): drivers/staging/android/sync.h deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/android/sync.h left in tree.
$ git rm -f drivers/staging/lustre/lustre/llite/lloop.c drivers/staging/android/sync.h
Applying: staging/android: merge fix up for sync.h renaming
Merging char-misc/char-misc-next (241903641111 dsp56k: prevent a harmless underflow)
Merging extcon/extcon-next (27210e4efd52 extcon: Move extcon_get_edev_by_phandle() errors to dbg level)
Merging cgroup/for-next (1f22cd881c59 Merge branch 'for-4.7-fixes' into for-next)
Merging scsi/for-next (be0763a62918 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (8f0dfb3d8b11 iscsi-target: Fix early sk_data_ready LOGIN_FLAGS_READY race)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (66ea2aa3fbd5 Merge branch 'for-4.8' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (25af8bfa9693 pinctrl: Add STM32F746 MCU support)
Merging vhost/linux-next (139ab4d4e68b tools/virtio: add noring tool)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (e937b335a738 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4287d2aea9bf MAINTAINERS: Add INTEL MERRIFIELD GPIO entry)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (9637e7e0403a Merge branch 'for-4.8/regulator' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (81754357770e fs: Update i_[ug]id_(read|write) to translate relative to s_user_ns)
CONFLICT (content): Merge conflict in fs/proc/root.c
CONFLICT (content): Merge conflict in fs/posix_acl.c
Applying: proc: fixup for "prevent stacking filesystems on top"
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (821f9946e07b clk: oxnas: Add hardware dependencies)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (cde07f453bed selftests: media_tests - Add media_device_open to .gitignore)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and min inode times)
Merging luto-misc/next (6436d4c1a83c x86/vdso: Fail the build if the vdso image has no dynamic section)
Applying: tools: partial revert of 2a00f026a15d "tools: Fix up BITS_PER_LONG setting"
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core' into for-next)
Merging coresight/next (0866b6c0964f coresight: Use local coresight_desc instances)
Merging rtc/rtc-next (6785b3b60be1 rtc: fix a typo and reduce three empty lines to one)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (57f6c2d8d4aa Merge branch 'for-4.8/libnvdimm' into libnvdimm-for-next)
CONFLICT (content): Merge conflict in drivers/nvdimm/pmem.c
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (83d30ebc20e0 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (modify/delete): arch/arm/configs/bcm_defconfig deleted in HEAD and modified in akpm-current/current. Version akpm-current/current of arch/arm/configs/bcm_defconfig left in tree.
$ git rm -f arch/arm/configs/bcm_defconfig
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
Applying: ipc/sem.c: Fix complex_count vs. simple op race
Applying: ipc-semc-fix-complex_count-vs-simple-op-race-update
Applying: ipc/sem.c: remove duplicated memory barriers
Applying: ipc/sem: sem_lock with hysteresis
Applying: media: mtk-vcodec: remove unused dma_attrs
Applying: dma-mapping: use unsigned long for dma_attrs
Applying: alpha: dma-mapping: use unsigned long for dma_attrs
Applying: arc: dma-mapping: use unsigned long for dma_attrs
Applying: ARM: dma-mapping: use unsigned long for dma_attrs
CONFLICT (content): Merge conflict in arch/arm/mm/dma-mapping.c
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
CONFLICT (content): Merge conflict in arch/arm/mm/dma-mapping.c
Applying: dma-mapping: document the DMA attributes next to the declaration
Merging akpm/master (45b6a5788679 dma-mapping: document the DMA attributes next to the declaration)
