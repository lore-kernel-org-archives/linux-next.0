From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 7
Date: Thu, 7 Jul 2016 16:29:18 +1000
Message-ID: <20160707162918.450c66c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59328 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbcGGG3W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 02:29:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160706:

The mac80211-next tree gained a conflict against the wireless-drivers-next
tree.

The clockevents tree gained a conflict against the arm-soc tree.

Non-merge commits (relative to Linus' tree): 7149
 6726 files changed, 338614 insertions(+), 141091 deletions(-)

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

I am currently merging 236 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (bc86765181aa Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fixes/master (5edb56491d48 Linux 4.7-rc3)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize exported variables)
Merging arc-current/for-curr (9bd54517ee86 arc: unwind: warn only once if DW2_UNWIND is disabled)
Merging arm-current/fixes (56530f5d2ddc ARM: 8579/1: mm: Fix definition of pmd_mknotpresent)
Merging m68k-current/for-linus (9a6462763b17 m68k/mvme16x: Include generic <linux/rtc.h>)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (eb584b3ee4d3 powerpc/tm: Fix stack pointer corruption in __tm_recheckpoint())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (6b15d6650c53 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging net/master (bc86765181aa Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (370a8107e788 ipvs: fix bind to link-local mcast IPv6 address in backup)
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (16a910a6722b cfg80211: handle failed skb allocation)
Merging sound-current/for-linus (9cd25743765c ALSA: hda/realtek: Add Lenovo L460 to docking unit fixup)
Merging pci-current/for-linus (ef0dab4aae14 PCI: Fix unaligned accesses in VC code)
Merging driver-core.current/driver-core-linus (33688abb2802 Linux 4.7-rc4)
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
Merging drm-intel-fixes/for-linux-next-fixes (cab103274352 drm/i915: Fix missing unlock on error in i915_ppgtt_info())
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (9bd54517ee86 arc: unwind: warn only once if DW2_UNWIND is disabled)
Merging arm/for-next (e69089ce7984 Merge branches 'component', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (0477eff1bea3 arm-soc: document merges)
Merging amlogic/for-next (4d9b3db03bd4 Merge remote-tracking branch 'clk/clk-s905' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (7bb6ae228c48 Merge branches 'berlin/dt' and 'berlin64/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (63a404a3f177 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (26b5a342ead6 Merge branch 'mvebu/defconfig64' into mvebu/for-next)
Merging omap/for-next (312cd3b1ce54 Merge branch 'omap-for-v4.8/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (2083e2852282 firmware: qcom: scm: Change initcall to subsys)
Merging renesas/next (b0b8da2c8b14 Merge branch 'heads/dt-for-v4.8' into next)
Merging rockchip/for-next (a37b05423406 Merge branch 'v4.8-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (d11d19d93a01 Merge branch 'next/defconfig64' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (34db2df13ab7 Merge branch for-4.8/arm64 into for-next)
Merging arm64/for-next/core (40f87d3114b8 arm64: mm: fold init_pgd() into __create_pgd_mapping())
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
Merging powerpc/next (656ad58ef19e powerpc/boot: Add OPAL console to epapr wrappers)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (1eef33bec12d powerpc/86xx: Fix PCI interrupt map definition)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (d08de8e2d867 s390/mm: add support for 2GB hugepages)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (893d66192c46 tile: support gcc 7 optimization to use __multi3)
Merging uml/linux-next (a78ff1112263 um: add extended processor state save/restore support)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (c315ef8d9db7 Merge branch 'for-chris-4.7' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.7)
Merging btrfs-kdave/for-next (b9f3ff76d4d3 Merge branch 'for-next-next-4.8-20160704' into for-next-20160704)
Merging ceph/master (f6973c09490c ceph: use i_version to check validity of fscache)
Merging cifs/for-next (fbe601f7a34b Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (f8608985f851 configfs: Remove ppos increment in configfs_write_bin_file)
Merging ecryptfs/next (40f0fd372a62 ecryptfs: fix spelling mistakes)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (ff0031d848a0 ext2: fix filesystem deadlock while reading corrupted xattr block)
Merging f2fs/dev (ac6f199984a6 f2fs: avoid latency-critical readahead of node pages)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (7879c4e58b7c fuse: improve aio directIO write performance for size extending writes)
Merging gfs2/for-next (fd4c5748b8d3 gfs2: writeout truncated pages)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (8dcac3c2c8ec Merge branch 'writeback')
Merging nfsd/nfsd-next (dac75afd6c72 SUNRPC: Remove unused callback xpo_adjust_wspace())
Merging orangefs/for-next (78fee0b6846f orangefs: fix namespace handling)
Merging overlayfs/overlayfs-next (ee7d77e509f7 ovl: fix sgid on directory)
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
Merging hid/for-next (5f00f0b8d58b Merge branch 'for-4.7/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (4d3a55e1a1d5 Merge branch 'i2c/for-4.8' into i2c/for-next)
Merging jdelvare-hwmon/master (18c358ac5e32 Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (eacc48ce3acc hwmon: (jc42) Add I2C_CLASS_HWMON to detection class)
Merging v4l-dvb/master (ed5883b778c8 Merge branch 'patchwork' into to_next)
Merging pm/linux-next (cd7d0a2dd42b Merge branches 'acpica', 'acpi-bus' and 'pnp' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (2c5ce98e1e83 thermal: sysfs: add comments describing locking strategy)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_sysfs.c
CONFLICT (add/add): Merge conflict in drivers/thermal/thermal_helpers.c
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (8a60368bd4fc Merge branch 'topic/bam' into next)
Merging net-next/master (30d0844bdcea Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/fec.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2-svk.dts
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (625b44fc15f8 ipvs: count pre-established TCP states as active)
Merging wireless-drivers-next/master (300c32ca84f5 rtlwifi: rtl8821ae: Fix potential race condition)
Merging bluetooth/master (9420b64e39f2 Bluetooth: btusb: add support for device 0489:e092)
Merging mac80211-next/master (7d27a0ba7adc cfg80211: Add mesh peer AID setting API)
CONFLICT (content): Merge conflict in drivers/net/wireless/marvell/mwifiex/cmdevt.c
Applying: mwifiex: fixup for "nl80211: support beacon report scanning"
Merging rdma/for-next (fb92d8fb1b9c Merge branches 'cxgb4-4.8', 'mlx5-4.8' and 'fw-version' into k.o/for-4.8)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (37db4c9066f1 Merge branch 'topic/mc_join_only' into testing/rdma-next)
Merging mtd/master (becc7ae544c6 MAINTAINERS: Add file patterns for mtd device tree bindings)
Merging l2-mtd/master (95193796256c mtd: m25p80: read in spi_max_transfer_size chunks)
Merging nand/nand/next (fff358dd9d7a mtd: nand: jz4780: Update MODULE_AUTHOR email address)
Merging crypto/master (879f77e9071f crypto: qat - Add RSA CRT mode)
Merging drm/drm-next (5dd0775e502b Merge tag 'asoc-hdmi-codec-pdata' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
Merging drm-panel/drm/panel/for-next (f103b93d90c2 drm/dsi: Add uevent callback)
Merging drm-intel/for-linux-next (ab0e455bd0ab drm/i915: avoid wait_for_atomic() in non-atomic host2guc_action())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_fbc.c
Merging drm-tegra/drm/tegra/for-next (44fe78354d70 drm/tegra: sor: Prepare for generic PM domain support)
Merging drm-misc/topic/drm-misc (2ae995887830 drm: Fix a typo in drm_ioctl.c)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2b669875332f drm/msm: Drop load/unload drm_driver ops)
Merging hdlcd/for-upstream/hdlcd (f6c68b4bd4a9 drm: hdlcd: Add information about the underlying framebuffers in debugfs)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (25d6a931b3f3 Merge branches 'sunxi/clk-fixes-for-4.7', 'sunxi/defconfig-for-4.8', 'sunxi/drm-fixes-for-4.7' and 'sunxi/dt-for-4.8' into sunxi/for-next)
Merging kbuild/for-next (7e01dad0469b Merge branch 'kbuild/kbuild' into kbuild/for-next)
Applying: gcc-plugins: disable under COMPILE_TEST
Merging kspp/for-next/kspp (930e444f3a67 gcc-plugins: Add support for plugin subdirectories)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (0bb2cf262087 Merge remote-tracking branches 'regmap/topic/bulk', 'regmap/topic/i2c', 'regmap/topic/irq' and 'regmap/topic/maintainers' into regmap-next)
Merging sound/for-next (b268c34e5ee9 ALSA: ppc/awacs: shut up maybe-uninitialized warning)
Merging sound-asoc/for-next (2b76ada6c7c8 Merge remote-tracking branch 'asoc/topic/wm8985' into asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (fcd6eb50eadd Input: add powerkey driver for HISI 65xx SoC)
Merging block/for-next (b5cc2b16b802 Merge branch 'for-4.8/drivers' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
CONFLICT (content): Merge conflict in block/blk-lib.c
Merging lightnvm/for-next (e5a7e383ab50 lightnvm: make __nvm_submit_ppa static)
Merging device-mapper/for-next (7193a9defcab dm rq: check kthread_run return for .request_fn request-based DM)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (4e01b578ade9 mmc: core: Extend sysfs with OCR register)
Merging md/for-next (d787be4092e2 md: reduce the number of synchronize_rcu() calls when multiple devices fail.)
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/raid1.c
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (4fcd504edbf7 power: reset: add reboot mode driver)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instead of checking for built-in or module)
Merging regulator/for-next (342d341b1eec Merge remote-tracking branch 'regulator/topic/twl' into regulator-next)
Merging security/next (d011a4d861ce Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/selinux into next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging integrity/next (544e1cea03e6 ima: extend the measurement entry specific pcr)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3f09354ac84c netlabel: Implement CALIPSO config functions for SMACK.)
Merging tpmdd/next (f786b7520982 tpm_crb: fix address space of the return pointer in crb_map_res())
Merging watchdog/master (1a695a905c18 Linux 4.7-rc1)
Merging iommu/next (8a3a457a5c69 Merge branches 'iommu/fixes', 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/msm' and 'arm/rockchip' into next)
CONFLICT (content): Merge conflict in drivers/iommu/mtk_iommu.c
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (9698cbf0bea6 vfio: platform: support No-IOMMU mode)
Merging jc_docs/docs-next (a039ba34a349 Doc: ocfs: Fix typo in filesystems/ocfs2-online-filecheck.txt)
CONFLICT (content): Merge conflict in Documentation/index.rst
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (86b2efbe3a39 audit: add fields to exclude filter by reusing user filter)
CONFLICT (content): Merge conflict in arch/s390/kernel/ptrace.c
Merging devicetree/for-next (15cc2ed6dcf9 of/irq: Mark initialised interrupt controllers as populated)
CONFLICT (content): Merge conflict in arch/arm/mach-imx/mach-imx51.c
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/board_bcm21664.c
Merging mailbox/mailbox-for-next (9ac3e85a5c5c mailbox: pl320: remove __raw IO)
Merging spi/for-next (e744bd394596 Merge remote-tracking branches 'spi/topic/sunxi', 'spi/topic/ti-qspi' and 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (907012b1ab02 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (3d802c5c8cfa Merge branches 'clockevents/clksrc-of-ret' and 'clockevents/compile-test' into clockevents/next)
CONFLICT (content): Merge conflict in arch/arm/mach-mxs/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Applying: clocksource/drivers/clps_711x: fixup for "ARM: clps711x: Switch to MULTIPLATFORM"
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a67adb32d941 ARM: dts: Add Arria10 Ethernet EDAC devicetree entry)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/misc' into irqchip/for-next)
Merging ftrace/for-next (501c2375253c ftrace: Move toplevel init out of ftrace_init_tracefs())
Merging rcu/rcu/next (490fa388d969 rcu: Suppress sparse warnings for rcu_dereference_raw())
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Applying: rcu: merge fix for kernel/rcu/tree_exp.h
Merging kvm/linux-next (8426097258c8 MIPS: KVM: Emulate generic QEMU machine on r6 T&E)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/s390/hypfs/hypfs_diag.c
Applying: s390: fix merge conflict in arch/s390/kvm/kvm-s390.c
Applying: s390: merge fix up for __diag204 move
Merging kvm-arm/next (6c41a413fd44 arm/arm64: Get rid of KERN_TO_HYP)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fd7bacbca47a KVM: PPC: Book3S HV: Fix TB corruption in guest exit path on HMI interrupt)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/traps.c
Merging kvms390/next (5ffe466cd3a3 KVM: s390: inject PER i-fetch events on applicable icpts)
Merging xen-tip/linux-next (bdadcaf2a7c1 xen: remove incorrect forward declaration)
Merging percpu/for-next (6710e594f71c percpu: fix synchronization between synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (df2294fb6428 intel_pmc_core: Convert to DEFINE_DEBUGFS_ATTRIBUTE)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_safe)
Merging leds/for-next (a3eac76cdf72 leds: triggers: return error if invalid trigger name is provided via sysfs)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (33688abb2802 Linux 4.7-rc4)
Merging tty/tty-next (67417f9c262e Merge 4.7-rc6 into tty-next)
Merging usb/usb-next (c318a821b982 Merge 4.7-rc6 into usb-next)
Applying: staging: emxx_udc: allow modular build
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (4c2e07c6a29e Linux 4.7-rc5)
Merging usb-chipidea-next/ci-for-usb-next (ebfad91c5da3 dt-bindings: ci-hdrc-usb2: s/gadget-itc-setting/itc-setting in example)
Merging staging/staging-next (7813029a509c Merge 4.7-rc6 into staging-next)
CONFLICT (modify/delete): drivers/staging/lustre/lustre/llite/lloop.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/lustre/lustre/llite/lloop.c left in tree.
CONFLICT (modify/delete): drivers/staging/android/sync.h deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/android/sync.h left in tree.
$ git rm -f drivers/staging/lustre/lustre/llite/lloop.c drivers/staging/android/sync.h
Applying: staging/android: merge fix up for sync.h renaming
Merging char-misc/char-misc-next (e2402b1d214e nvmem: imx-ocotp: Fix assignment warning.)
Merging extcon/extcon-next (27210e4efd52 extcon: Move extcon_get_edev_by_phandle() errors to dbg level)
Merging cgroup/for-next (1f22cd881c59 Merge branch 'for-4.7-fixes' into for-next)
Merging scsi/for-next (be0763a62918 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (8f0dfb3d8b11 iscsi-target: Fix early sk_data_ready LOGIN_FLAGS_READY race)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (77d88263971e Merge branch 'for-4.8' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (8229bcf887b5 pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro)
Merging vhost/linux-next (139ab4d4e68b tools/virtio: add noring tool)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b2250f65c884 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e0877571c3de Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (8910a6a600ee pwm: lpss: pci: Enable PWM module on Intel Edison)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
Merging userns/for-next (aad82892af26 selinux: Add support for unprivileged mounts from user namespaces)
CONFLICT (content): Merge conflict in fs/proc/root.c
Applying: proc: fixup for "prevent stacking filesystems on top"
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (b24faef9a322 Merge branch 'clk-lpc32xx' into clk-next)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (cde07f453bed selftests: media_tests - Add media_device_open to .gitignore)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and min inode times)
Merging luto-misc/next (6436d4c1a83c x86/vdso: Fail the build if the vdso image has no dynamic section)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core' into for-next)
Merging coresight/next (a56b0d416cbe hwtracing: coresight: of_coresight: add missing of_node_put after calling of_parse_phandle)
Merging rtc/rtc-next (803bb30145df rtc: m48t86: move m48t86.h to platform_data)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a461529a9887 Merge branch 'for-4.8/mm' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (36ac8116836c ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in ipc/sem.c
CONFLICT (content): Merge conflict in fs/ext4/fsync.c
CONFLICT (content): Merge conflict in arch/arm64/mm/dma-mapping.c
CONFLICT (modify/delete): arch/arm/configs/bcm_defconfig deleted in HEAD and modified in akpm-current/current. Version akpm-current/current of arch/arm/configs/bcm_defconfig left in tree.
$ git rm -f arch/arm/configs/bcm_defconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: drivers/fpga/Kconfig: fix build failure
Applying: tree-wide: replace config_enabled() with IS_ENABLED()
Applying: include/linux/bitmap.h: cleanup
Merging akpm/master (80bf930d5326 include/linux/bitmap.h: cleanup)
