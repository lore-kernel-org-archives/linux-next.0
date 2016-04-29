From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 29
Date: Fri, 29 Apr 2016 17:13:54 +1000
Message-ID: <20160429171354.3b98c8f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35138 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750714AbcD2HN5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 03:13:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160428:

The arm64 tree gained a conflict against Linus' tree.

The pm tree gained a conflict against the arm-soc tree.

The tpmdd tree still had its build failure for which I added a fix patch.

The tip tree gained a conflict against the arm64 tree.

The xen-tip tree gained a conflict against the tip tree.

The akpm-current tree gained conflicts against the tile and tip trees
and I reverted a commit that produced many new warnings.

Non-merge commits (relative to Linus' tree): 6770
 6109 files changed, 255051 insertions(+), 125899 deletions(-)

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

I am currently merging 234 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (b75a2bf899b6 Merge branch 'for-4.6-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (1b10cb21d888 ARC: add support for reserved memory defined by device tree)
Merging arm-current/fixes (ac36a881b72a ARM: 8564/1: fix cpu feature extracting helper)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update defconfigs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (d701cca6744f powerpc: wire up preadv2 and pwritev2 syscalls)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (49fa5230462f sparc64: Fix bootup regressions on some Kconfig combinations.)
Merging net/master (1dfcd832b1a9 Merge branch 'bpf-fixes')
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (bcf493428840 netfilter: ebtables: Fix extension lookup with identical name)
Merging wireless-drivers/master (e2841ea91611 Merge tag 'iwlwifi-for-kalle-2016-04-12_2' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (e6436be21e77 mac80211: fix statistics leak if dev_alloc_name() fails)
Merging sound-current/for-linus (af9cc93c0dee Merge tag 'asoc-fix-v4.6-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (67e658794ca1 cxgb4: Set VPD size so we can read both VPD structures)
Merging driver-core.current/driver-core-linus (c3b46c73264b Linux 4.6-rc4)
Merging tty.current/tty-linus (02da2d72174c Linux 4.6-rc5)
Merging usb.current/usb-linus (97b9b7dc7722 usb: musb: jz4740: fix error check of usb_get_phy())
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use-after-free)
Merging usb-serial-fixes/usb-linus (613ac23a46e1 USB: serial: cp210x: add Straizona Focusers device ids)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (431adc0aeca6 Merge tag 'iio-fixes-for-4.6c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (82dc4afd7e65 misc: mic: Fix for double fetch security bug in VOP driver)
Merging input-current/for-linus (eb43335c4095 Input: atmel_mxt_ts - use mxt_acquire_irq in mxt_soft_reset)
Merging crypto-current/master (9e209fcfb804 crypto: qat - fix invalid pf2vf_resp_wq logic)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (4ea3959018d0 drm/i915: Make RPS EI/thresholds multiple of 25 on SNB-BDW)
Merging asm-generic/master (987aedb5d6f6 generic syscalls: wire up preadv2 and pwritev2 syscalls)
Merging arc/for-next (767cb9d8abfa ARC: Add eznps platform to Kconfig and Makefile)
Merging arm/for-next (c6433ebdc184 Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose CHAIN event in sysfs)
Merging arm-soc/for-next (71085229c8e1 arm-soc: describe merges)
Merging at91/at91-next (1e12a77f8a5d Merge tags 'at91-soc' and 'at91-dt2' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (896ad420db8d dt/bindings: bcm2835: correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (3652bb35abf6 ARM: bcm2835: Enable NFS root support.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (ca2c44b4980c Merge branch 'imx/defconfig64' into for-next)
Merging keystone/next (02e15d234006 Merge branch 'for_4.7/kesytone' into next)
Merging mvebu/for-next (21263e08826d Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (5c62bda50efd Merge branch 'omap-for-v4.7/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (100b83d52f51 ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (e5c640c6f9cc Merge branches 'heads/arm64-defconfig-for-v4.7', 'heads/arm64-dt-pm-domain-for-v4.7', 'heads/dt-for-v4.7' and 'heads/pci-defconfig-for-v4.7' into next)
Merging rockchip/for-next (48f2a282081f Merge branch 'v4.7-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (be28390fe8f5 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (f1e9b6675c26 Merge branches 'sunxi/clocks-for-4.7', 'sunxi/dt-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-next)
Merging tegra/for-next (fe34d567f1f3 Merge branch for-4.7/gm20b into for-next)
Merging arm64/for-next/core (6f26b3671184 arm64: kaslr: increase randomization granularity)
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (efbec135f11d m68k: Fix misspellings in comments.)
Merging m68knommu/for-next (02da2d72174c Linux 4.6-rc5)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (7620fecf8342 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (a8950e49bd24 nios2: memset: use the right constraint modifier for the %4 output operand)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolution sched_clock() implementation)
Merging powerpc/next (5bcca743cb6e powerpc/perf: Replace raw event hex values with #defines)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (7072276e6c0e s390/Kconfig: make z196 the default processor type)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (4ef00aa30a3f tile: sort the "select" lines in the TILE/TILEGX configs)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (bd3fc9c6d3c0 Merge branch 'for-next-current-4.7-20160428' into for-next-20160428)
Merging ceph/master (d3767f0faeda rbd: report unsupported features to syslog)
Merging cifs/for-next (2b6c3239da3f cifs: remove any preceding delimiter from prefix_path)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (2a28900be206 udf: Export superblock magic to userspace)
Merging ext4/dev (8f4c50d70cc1 ext4: remove trailing \n from ext4_warning/ext4_error calls)
Merging f2fs/dev (aca9958e97b7 ext4 crypto: migrate into vfs's crypto engine)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (2c932d4c9165 fuse: Fix return value from fuse_get_user_pages())
Merging gfs2/for-next (9c7fe83530a3 GFS2: Add calls to gfs2_holder_uninit in two error handlers)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (02da2d72174c Linux 4.6-rc5)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variable)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
CONFLICT (content): Merge conflict in fs/ext4/file.c
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (a8dd1a5cd502 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-mvebu' and 'pci/host-vmd' into next)
Applying: iommu/amd: fix up for aliases API change
Merging hid/for-next (a299086f23d1 Merge branch 'for-4.7/upstream' into for-next)
Merging i2c/i2c/for-next (b3b859225348 Merge branch 'i2c/for-4.7' into i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (71a9c23246fe hwmon: (it87) Add support for IT8628E)
Merging v4l-dvb/master (dcb7c0b9e2ad Merge branch 'patchwork' into to_next)
Merging libata/for-next (c5cf484d03f1 Merge branch 'for-4.6-fixes' into for-next)
Merging pm/linux-next (1fc5f4aa1f65 Merge branch 'device-properties-fixes' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/Makefile
CONFLICT (content): Merge conflict in MAINTAINERS
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (ddc8fdc6e2f0 Merge branch 'work-fixes' into work-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (6ebe83cb5b65 Merge branch 'topic/pxa' into next)
Merging net-next/master (494e8489db50 ipvlan: Fix failure path in dev registration during link creation)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (8fb04d9fc70a ipvs: don't alter conntrack in OPS mode)
Merging wireless-drivers-next/master (9d3f65b0c2dd mwifiex: increase dwell time for active scan)
Merging bluetooth/master (50d5d2bd1d42 Merge branch 'sh_eth-next')
Merging mac80211-next/master (d686b920abb7 nl80211: use nla_put_u64_64bit() for the remaining u64 attributes)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging rdma-leon/rdma-next (c3b46c73264b Linux 4.6-rc4)
Merging rdma-leon-test/testing/rdma-next (c3b46c73264b Linux 4.6-rc4)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement in nand_scan)
Merging l2-mtd/master (abbbc60a0c69 mtd: pmc551: add __init attribute)
Merging nand/nand/next (4ab41e74ae5d mtd: brcmnand: respect ECC algorithm set by NAND subsystem)
Merging crypto/master (d1497977fecb crypto: s5p-sss - fix incorrect usage of scatterlists api)
Merging drm/drm-next (152ef5fa9e14 drm: Switch blobs to the new generic modeset obj refcounting)
Applying: drm/i915: fix up for edp_low_vswing change
Merging drm-panel/drm/panel/for-next (1ac3bac7c733 drm/panel: simple: Add support for Innolux AT070TN92)
Merging drm-intel/for-linux-next (5b4fd5b1111b drm/i915: Update DRIVER_DATE to 20160425)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (36230cb5668c drm/dp: Allow signals to interrupt drm_aux-dev reads/writes)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an error code)
Merging drm-vc4/drm-vc4-next (5883980313af drm/vc4: Fix NULL deref in HDMI init error path)
Merging kbuild/for-next (7eb09bb55394 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (8eabbbb9c0c9 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (a33d59599653 Merge branch 'for-linus' into for-next)
Merging sound-asoc/for-next (428a3bb0133e Merge remote-tracking branches 'asoc/topic/tlv320aic31xx', 'asoc/topic/tlv320aic32x4', 'asoc/topic/topology', 'asoc/topic/wm8960' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (9e4cc255e6e1 Input: twl6040-vibra - remove mutex)
Merging block/for-next (783f8d0af678 Merge branch 'for-4.7/drivers' into for-next)
Merging device-mapper/for-next (3ff6a535b994 dm mpath: eliminate use of spinlock in IO fast-paths)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (b941a0e9598e mmc: sdhci-of-arasan: fix set_clock when a phy is supported)
Merging md/for-next (9c573de3283a MD: make bio mergeable)
Merging mfd/for-mfd-next (ba5776ab6f09 mfd: cros_ec: Allow building for ARM64)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when battery charging near dry)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (aec879a0b98b Merge remote-tracking branches 'regulator/topic/tps6524x' and 'regulator/topic/twl' into regulator-next)
Merging security/next (da20dfe6b50e fs: fix over-zealous use of "const")
Merging integrity/next (f5f8f020b2da ima: add support for creating files using the mknodat syscall)
Merging keys/keys-next (1ea6102bba5f Merge branch 'keys-trust' into keys-next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_parser.c
Merging selinux/next (c2316dbf1242 selinux: apply execstack check on thread stacks)
Merging tpmdd/next (c5f074b23a79 tpm: Fix IRQ unwind ordering in TIS)
Applying: tpm: fix for typo in tpm/tpm_ibmvtpm.c
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (1229bc9a9973 Merge branches 'iommu/fixes', 'arm/io-pgtable', 'arm/rockchip', 'arm/omap', 'x86/vt-d', 'ppc/pamu' and 'x86/amd' into next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA caching)
Merging vfio/next (5ed4aba1265f vfio_iommu_spapr_tce: Remove unneeded iommu_group_get_iommudata)
Merging jc_docs/docs-next (2fd872bd84b3 Doc: correct the location of sysrq.c)
Merging trivial/for-next (52bbe141f37f gitignore: fix wording)
Merging audit/next (188e3c5cd2b6 tty: provide tty_name() even without CONFIG_TTY)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (1c986e3643d2 of: document refcount incrementation of of_get_cpu_node())
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
Merging mailbox/mailbox-for-next (dd28216528cf mailbox/omap: kill omap_mbox_{save/restore}_ctx() functions)
Merging spi/for-next (7136be37c1e4 Merge remote-tracking branches 'spi/topic/pic32-qspi', 'spi/topic/pxa2xx' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (fbd03a56586d Merge branch 'sched/core')
CONFLICT (content): Merge conflict in drivers/firmware/efi/arm-init.c
CONFLICT (content): Merge conflict in drivers/cpufreq/longhaul.c
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c5fb04cc96c1 ARM: socfpga: Initialize Arria10 OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (4afe6495e5cb tracing: Don't use the address of the buffer array name in copy_from_user)
Merging rcu/rcu/next (ebcd2861ae27 arm: Whack an expected event-trace-from-idle mole)
Merging kvm/linux-next (05b1159e641f Merge tag 'kvms390-20160420' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into next)
Merging kvm-arm/next (02e0b7600f83 arm64: kvm: Add support for 16K pages)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c87ff1433aca KVM: s390: add clear I/O irq operation for FLIC)
Merging xen-tip/linux-next (3a61cfdd47c4 xen/x86: don't lose event interrupts)
CONFLICT (content): Merge conflict in drivers/firmware/efi/arm-runtime.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/setup.c
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (e55c35cf41c9 Merge branch 'for-4.6-fixes' into for-next)
Merging drivers-x86/for-next (19d46ee1aec0 asus-laptop: correct error handling in sysfs_acpi_set)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (f15c65afddbe leds: ss4200: add DMI data for FSC SCALEO Home Server)
Merging ipmi/for-next (a1b4e31bfabb IPMI: reserve memio regions separately)
Merging driver-core/driver-core-next (5614e7725856 Merge 4.6-rc4 into driver-core-next)
Merging tty/tty-next (5be605ac9af9 tty/serial: atmel: fix hardware handshake selection)
Merging usb/usb-next (ce15bda10121 Merge tag 'usb-for-v4.7' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next)
Merging usb-gadget/next (2a58f9c12bb3 usb: dwc3: gadget: disable automatic calculation of ACK TP NUMP)
Merging usb-serial/usb-next (8c34d82e9dc6 USB: serial: use IS_ENABLED() instead of checking for FOO || FOO_MODULE)
Merging usb-chipidea-next/ci-for-usb-next (4e332df63487 usb: otg-fsm: support multiple instances)
Merging staging/staging-next (610cc3a49fdc Staging: lustre: Make lustre_profile_list static)
CONFLICT (content): Merge conflict in drivers/iio/magnetometer/ak8975.c
Merging char-misc/char-misc-next (9bf292bfca94 misc: mic: Fix for double fetch security bug in VOP driver)
Merging extcon/extcon-next (453fc627c7b5 extcon: usb-gpio: add support for ACPI gpio interface)
Merging cgroup/for-next (e0f00aff2dcc Merge branch 'for-4.6-fixes' into for-next)
Merging scsi/for-next (71d397581d52 MAINTAINERS: Update the file list for the NCR 5380 entry)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (1f5d93d96b06 Merge branch 'devel' into for-next)
Merging vhost/linux-next (c00bbcf86289 virtio: add VIRTIO_CONFIG_S_NEEDS_RESET device status bit)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (9735a22799b9 Linux 4.6-rc2)
Merging gpio/for-next (fd4faea75ac3 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (58657d189a2f Merge branch 'clk-hw-register' (early part) into clk-next)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and min inode times)
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (157fe3c875a3 Merge branch 'for-4.7/livepatching-doc' into for-next)
Merging coresight/next (620a7feb9b3c coresight: etb10: adjust read pointer only when needed)
Merging rtc/rtc-next (820c5327d631 rtc: ds3232: fix call trace when rtc->ops_lock is used as NULL)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a390180291dd libnvdimm, pfn: fix nvdimm_namespace_add_poison() vs section alignment)
Merging akpm-current/current (305dd3d200a6 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in include/linux/efi.h
CONFLICT (content): Merge conflict in arch/tile/Kconfig
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
CONFLICT (content): Merge conflict in arch/mips/Kconfig
CONFLICT (content): Merge conflict in arch/cris/Kconfig
Applying: mm-rename-_count-field-of-the-struct-page-to-_refcount-fix6
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: mm: make mmap_sem for write waits killable for mm syscalls
Applying: mm: make vm_mmap killable
Applying: mm: make vm_munmap killable
Applying: mm, aout: handle vm_brk failures
Applying: mm, elf: handle vm_brk error
Applying: mm: make vm_brk killable
Applying: mm, proc: make clear_refs killable
Applying: mm, fork: make dup_mmap wait for mmap_sem for write killable
Applying: ipc, shm: make shmem attach/detach wait for mmap_sem killable
Applying: vdso: make arch_setup_additional_pages wait for mmap_sem for write killable
Applying: coredump: make coredump_wait wait for mmap_sem for write killable
Applying: aio: make aio_setup_ring killable
Applying: exec: make exec path waiting for mmap_sem killable
Applying: prctl: make PR_SET_THP_DISABLE wait for mmap_sem killable
Applying: uprobes: wait for mmap_sem for write killable
Applying: drm/i915: make i915_gem_mmap_ioctl wait for mmap_sem killable
Applying: drm/radeon: make radeon_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: make amdgpu_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: use ERR_PTR() to return from amdgpu_mn_get
Merging akpm/master (87a40221eb27 drm/amdgpu: use ERR_PTR() to return from amdgpu_mn_get)
Applying: Revert "byteswap: try to avoid __builtin_constant_p gcc bug"
