From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 5
Date: Tue, 5 Apr 2016 14:50:34 +1000
Message-ID: <20160405145034.795d664a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55912 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750897AbcDEEuh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Apr 2016 00:50:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160404:

The btrfs-kdave tree gained conflicts Linus' tree.

The ceph tree gained conflicts Linus' tree.

The staging tree gained conflicts against the staging.current and Linus'
trees.

Non-merge commits (relative to Linus' tree): 2132
 2023 files changed, 82827 insertions(+), 53245 deletions(-)

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

I am currently merging 232 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (e865f4965ff6 Merge branch 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (f86b8892a1b7 ARC: Don't source drivers/pci/pcie/Kconfig ourselves)
Merging arm-current/fixes (0fc03d4c8761 ARM: SMP enable of cache maintanence broadcast)
Merging m68k-current/for-linus (efbec135f11d m68k: Fix misspellings in comments.)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (71528d8bd7a8 powerpc: Correct used_vsr comment)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (5ec712934ce1 sparc: Write up preadv2/pwritev2 syscalls.)
Merging net/master (c862cc9b7052 bridge: Fix incorrect variable assignment on error path in br_sysfs_addbr)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (15da5d11040c Merge tag 'iwlwifi-for-kalle-2016-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (ad8ec957f693 wext: unregister_pernet_subsys() on notifier registration failure)
Merging sound-current/for-linus (f03b24a851d3 ALSA: usb-audio: Add a sample rate quirk for Phoenix Audio TMX320)
Merging pci-current/for-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging driver-core.current/driver-core-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging tty.current/tty-linus (5e00bbfbc5ec tty: Fix merge of "tty: Refactor tty_open()")
Merging usb.current/usb-linus (5a07975ad0a3 USB: digi_acceleport: do sanity checking for the number of ports)
Merging usb-gadget-fixes/fixes (7e8ac87a4474 usb: phy: qcom-8x16: fix regulator API abuse)
Merging usb-serial-fixes/usb-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (53c43c5ca133 Revert "Staging: olpc_dcon: Remove obsolete driver")
Merging char-misc.current/char-misc-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging input-current/for-linus (162f98dea487 Input: gtco - fix crash on detecting device without endpoints)
Merging crypto-current/master (ef609c238a8e sunrpc: Fix skcipher/shash conversion)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (9735a22799b9 Linux 4.6-rc2)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging arm/for-next (7150fbc6a7ec Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f55532a0c0b8 Linux 4.6-rc1)
Merging arm-soc/for-next (35fe688abfcf arm-soc: document merges)
Merging at91/at91-next (503057c24478 Merge branches 'at91-4.7-soc' and 'at91-4.7-dt' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (48c3b1441a77 dt/bindings: bcm2835: correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (8d1a8c92a8c0 ARM: bcm2835: Enable CONFIG_PM.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (00cb3ac4afaa Merge branch 'imx/dt64' into for-next)
Merging keystone/next (1bdd5a9b339c ARM: dts: k2*: Rename the k2* files to keystone-k2* files)
Merging mvebu/for-next (550cd80600c7 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (6de37509e43d Merge branch 'omap-for-v4.6/fixes' into for-next)
Merging omap-pending/for-next (3ca4a238106d ARM: OMAP2+: hwmod: Fix updating of sysconfig register)
Merging qcom/for-next (faaa41613dc8 ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (301c9ed92b8f Merge branches 'heads/arm64-cleanup-for-v4.7', 'heads/arm64-dt-for-v4.7', 'heads/cleanup-for-v4.7', 'heads/defconfig-for-v4.7', 'heads/drivers-for-v4.7', 'heads/dt-for-v4.7' and 'heads/simple-pm-bus-for-v4.7' into next)
Merging rockchip/for-next (0b4b91b4c9b2 Merge branch 'v4.6-armsoc/dts64-fixes' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (dc66b800f7ef Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (93a96dc4ccc1 Merge branches 'sunxi/dt-for-4.7', 'sunxi/clocks-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-next)
Merging tegra/for-next (755f165105b1 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (f55532a0c0b8 Linux 4.6-rc1)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (efbec135f11d m68k: Fix misspellings in comments.)
Merging m68knommu/for-next (a3595962d824 m68knommu: remove obsolete 68360 support)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (24fead1eb323 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8fe889274c7a nios2: Replace fdt_translate_address with of_flat_dt_translate_address)
Merging parisc-hd/for-next (b562e44f507e Linux 4.5)
Merging powerpc/next (6e669f085d59 powerpc: Fix unrecoverable SLB miss during restore_math())
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (05f13c49f4b8 s390: Clarify pagefault interrupt)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f98983bbba0d tile/defconfigs: Remove CONFIG_IPV6_PRIVACY)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (eb2b7a82d42e Merge branch 'for-next-4.6-20160404' into for-next-20160404)
CONFLICT (content): Merge conflict in fs/btrfs/volumes.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (7c886661dc31 libceph: use KMEM_CACHE macro)
CONFLICT (content): Merge conflict in fs/ceph/inode.c
CONFLICT (content): Merge conflict in fs/ceph/addr.c
Merging cifs/for-next (b562e44f507e Linux 4.5)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (8f9e8f5fcc05 ocfs2: Fix Q_GETNEXTQUOTA for filesystem without quotas)
Merging ext4/dev (dd018b1f64c1 ext4: ignore quota mount options if the quota feature is enabled)
Merging f2fs/dev (0bc3d0fd7525 f2fs: add BUG_ON to avoid unnecessary flow)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (3e11e5304150 GFS2: ignore unlock failures after withdraw)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (9735a22799b9 Linux 4.6-rc2)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (45996492e5c8 orangefs: fix orangefs_superblock locking)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (f55532a0c0b8 Linux 4.6-rc1)
Merging hid/for-next (b7c33d5dcfe2 Merge branch 'for-4.6/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (8dcf32175b4e i2c: prevent endless uevent loop with CONFIG_I2C_DEBUG_CORE)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (c528f2aae571 hwmon: (max31722) Add support for MAX31722/MAX31723 temperature sensors)
Merging v4l-dvb/master (405ddbfa6817 [media] Revert "[media] media: au0828 change to use Managed Media Controller API")
Merging libata/for-next (f8193efa5cdc Merge branch 'for-4.7' into for-next)
Merging pm/linux-next (ea58c523eefd Merge branch 'pm-cpufreq-sched' into linux-next)
Merging idle/next (b318c60f942c intel_idle: Clean up all registered devices on exit.)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (c960fe12d002 thermal: hisilicon: fix IRQ imbalance enabling)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (f55532a0c0b8 Linux 4.6-rc1)
Merging net-next/master (9ef280c6c28f irda: sh_irda: remove driver)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (e46b4e2b46e1 Merge tag 'trace-v4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging bluetooth/master (9ef280c6c28f irda: sh_irda: remove driver)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement in nand_scan)
Merging l2-mtd/master (5651d6aaf489 mtd: bcm47xxsflash: use ioremap_cache() instead of KSEG0ADDR())
Merging nand/nand/next (be17c419f889 mtd: brcmnand: Add support for v6.2 controllers)
Merging crypto/master (34074205bb9f crypto: qat - remove redundant arbiter configuration)
Merging drm/drm-next (4604202ca8d2 Merge branch 'drm-next-4.6' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (27af5eea54d1 drm/i915: Move execlists irq handler to a bottom half)
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (249c4f538b1a drm: Add new DCS commands in the enum list)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an error code)
Merging drm-vc4/drm-vc4-next (4abfa518f0a0 drm/vc4: Add DPI driver)
Merging kbuild/for-next (2468fc97cc45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging regmap/for-next (1688fc1d5733 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (44fde3b89ba1 ALSA: hda - Update chmap tlv to report sink's capability)
Merging sound-asoc/for-next (c6da59a2ef1d Merge remote-tracking branches 'asoc/topic/wm8960' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (7d8d86252307 Input: gpio-keys - clean up device tree binding example)
Merging block/for-next (258b83ad9930 Merge branch 'for-linus' into for-next)
Merging device-mapper/for-next (ef6e0d57417a dm raid1: do not error successfully written bios during suspend)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (1dceb0415aa0 mmc: sdhci: Fix regression setting power on Trats2 board)
Merging md/for-next (f9a67b1182e5 md/bitmap: clear bitmap if bitmap_create failed)
Merging mfd/for-mfd-next (a557a7a09b08 mfd: lp8788-irq: Uninitialized variable in irq handler)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (77f8e8e944cb Merge remote-tracking branches 'regulator/topic/maxim', 'regulator/topic/pwm', 'regulator/topic/qcom-spmi' and 'regulator/topic/twl' into regulator-next)
Merging security/next (9735a22799b9 Linux 4.6-rc2)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (e8203d2af614 selinux: consolidate the ptrace parent lookup code)
Merging tpmdd/next (59f95b842ad0 Merge branch 'master' into next)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (70cf769c5ba2 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (4817ebb144ff serial: doc: Correct return type of mctrl_gpio_to_gpiod())
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (0bf676d1fd51 audit: cleanup prune_tree_thread)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (bc553986a2f7 dtc: turn off dtc unit address warnings by default)
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (80bed53f77e4 Merge remote-tracking branch 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (c6ddb3131c7f Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (ff6fd1478c53 ARM: socfpga: Enable Arria10 L2 cache ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (7e6867bf831c tracing: Record and show NMI state)
Merging rcu/rcu/next (f74d79be23b4 Merge branches 'locktorture.2016.03.31d' and 'docmb.2016.03.31d' into HEAD)
Merging kvm/linux-next (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging kvm-arm/next (b40c4892d175 arm64: KVM: vgic-v3: Only wipe LRs on vcpu exit)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c54f0d6ae057 KVM: s390: allocate only one DMA page per VM)
Merging xen-tip/linux-next (85d1a29de8e4 Xen on ARM and ARM64: update MAINTAINERS info)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (fffcad87d4e7 hp-wmi: Remove GPS rfkill support via pre-2009 interface)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (916fe619951f leds: trigger: Introduce a kernel panic LED trigger)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (3a3a5fece6f2 fs: kernfs: Replace CURRENT_TIME by current_fs_time())
Merging tty/tty-next (f55532a0c0b8 Linux 4.6-rc1)
Merging usb/usb-next (f55532a0c0b8 Linux 4.6-rc1)
Merging usb-gadget/next (0561f77e2db9 usb: gadget: f_acm: Fix configfs attr name)
Merging usb-serial/usb-next (f55532a0c0b8 Linux 4.6-rc1)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (eb7bfed901b9 Merge tag 'iio-for-4.7a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/osc/osc_request.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/osc/osc_page.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/osc/osc_cache.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/osc/lproc_osc.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/obdecho/echo_client.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/obdclass/class_obd.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/vvp_page.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/vvp_io.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/rw26.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/rw.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/llite_mmap.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/llite_lib.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/llite_internal.h
CONFLICT (modify/delete): drivers/staging/lustre/lustre/lclient/lcommon_cl.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/lustre/lustre/lclient/lcommon_cl.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/include/lu_object.h
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/selftest/brw_test.c
CONFLICT (modify/delete): drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h left in tree.
CONFLICT (content): Merge conflict in drivers/iio/gyro/bmg160_core.c
$ git rm -f drivers/staging/lustre/lustre/lclient/lcommon_cl.c drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h
Applying: lustre: fix ups for PAGE_CACHE_... removal
Merging char-misc/char-misc-next (f55532a0c0b8 Linux 4.6-rc1)
Merging extcon/extcon-next (f55532a0c0b8 Linux 4.6-rc1)
Merging cgroup/for-next (08fb4e7f8d5f Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (cf5277b893e5 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (ca1c8b640fe8 Merge branch 'devel' into for-next)
Merging vhost/linux-next (c67f5db82027 virtio_net: replace netdev_alloc_skb_ip_align() with napi_alloc_skb())
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (d75868496ca0 MAINTAINERS: Add mailing list for remote processor subsystems)
Merging gpio/for-next (8db9fce084e5 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (c0553d04f8d3 dt-bindings: arm: add DT binding for Marvell AP806 system controller)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (222d586ca829 Merge branch 'for-4.7/arch-independent-klp-relocations' into for-next)
Merging coresight/next (a587ddafe387 coresight: removing gratuitous boot time log messages)
Merging rtc/rtc-next (26ec9313b537 rtc: m41t80: handle oscillator failure bit)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (fc0c2028135c x86, pmem: use memcpy_mcsafe() for memcpy_from_pmem())
Merging akpm-current/current (7a55317f3165 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (a005321fd803 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
