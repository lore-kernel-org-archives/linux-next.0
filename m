From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 1
Date: Fri, 1 Apr 2016 15:22:39 +1100
Message-ID: <20160401152239.59ecfc02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57789 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751231AbcDAEWn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Apr 2016 00:22:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160331:

My fixes tree contains:

  perf tools: Fix build break on powerpc

The qcom tree gained a build failure so I used the version from
next-20160331.

The pm tree gained a build failure so I used the verison from
next-20160331.

The gpio tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1899
 1637 files changed, 67661 insertions(+), 46594 deletions(-)

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
Merging origin/master (c05c2ec96bb8 Merge branch 'parisc-4.6-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging fixes/master (6c020251498e perf tools: Fix build break on powerpc)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (f86b8892a1b7 ARC: Don't source drivers/pci/pcie/Kconfig ourselves)
Merging arm-current/fixes (f474c8c857d9 ARM: 8544/1: set_memory_xx fixes)
Merging m68k-current/for-linus (efbec135f11d m68k: Fix misspellings in comments.)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (71528d8bd7a8 powerpc: Correct used_vsr comment)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (5ec712934ce1 sparc: Write up preadv2/pwritev2 syscalls.)
Merging net/master (79f4223257bf net: usb: cdc_ncm: adding Telit LE910 V2 mobile broadband card)
Merging ipsec/master (215276c0147e xfrm: Reset encapsulation field of the skb before transformation)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (2acd84648554 rtlwifi: fix gcc-6 indentation warning)
Merging mac80211/master (ad8ec957f693 wext: unregister_pernet_subsys() on notifier registration failure)
Merging sound-current/for-linus (836b34a935ab ALSA: usb-audio: Fix double-free in error paths after snd_usb_add_audio_stream() call)
Merging pci-current/for-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging driver-core.current/driver-core-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging tty.current/tty-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging usb.current/usb-linus (5a07975ad0a3 USB: digi_acceleport: do sanity checking for the number of ports)
Merging usb-gadget-fixes/fixes (7e8ac87a4474 usb: phy: qcom-8x16: fix regulator API abuse)
Merging usb-serial-fixes/usb-linus (f6cede5b49e8 Linux 4.5-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging char-misc.current/char-misc-linus (f55532a0c0b8 Linux 4.6-rc1)
Merging input-current/for-linus (162f98dea487 Input: gtco - fix crash on detecting device without endpoints)
Merging crypto-current/master (e54358915d0a PKCS#7: pkcs7_validate_trust(): initialize the _trusted output argument)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (f55532a0c0b8 Linux 4.6-rc1)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging arm/for-next (1b3bf847977c Merge branches 'amba', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (f55532a0c0b8 Linux 4.6-rc1)
Merging arm-soc/for-next (35fe688abfcf arm-soc: document merges)
Merging at91/at91-next (503057c24478 Merge branches 'at91-4.7-soc' and 'at91-4.7-dt' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (3428a63be5b9 ARM: bcm2835: Add VC4 to the device tree.)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (0a05d3b71ada ARM: multi_v7_defconfig: Enable BCM283x)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (00cb3ac4afaa Merge branch 'imx/dt64' into for-next)
Merging keystone/next (1bdd5a9b339c ARM: dts: k2*: Rename the k2* files to keystone-k2* files)
Merging mvebu/for-next (bf8bfe311ea0 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (6de37509e43d Merge branch 'omap-for-v4.6/fixes' into for-next)
Merging omap-pending/for-next (3ca4a238106d ARM: OMAP2+: hwmod: Fix updating of sysconfig register)
Merging qcom/for-next (423f5fed42fa Revert "dts: msm8974: Add blsp2_bam dma node")
$ git reset --hard HEAD^
Merging next-20160331 version of qcom
CONFLICT (content): Merge conflict in MAINTAINERS
[master a061fcb074bd] next-20160331/qcom
Merging renesas/next (301c9ed92b8f Merge branches 'heads/arm64-cleanup-for-v4.7', 'heads/arm64-dt-for-v4.7', 'heads/cleanup-for-v4.7', 'heads/defconfig-for-v4.7', 'heads/drivers-for-v4.7', 'heads/dt-for-v4.7' and 'heads/simple-pm-bus-for-v4.7' into next)
Merging rockchip/for-next (0b4b91b4c9b2 Merge branch 'v4.6-armsoc/dts64-fixes' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (6cd9769f6dbb Merge branch 'next/dt' into for-next)
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
Merging mips/mips-for-linux-next (fb4c90fb9f34 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8fe889274c7a nios2: Replace fdt_translate_address with of_flat_dt_translate_address)
Merging parisc-hd/for-next (b562e44f507e Linux 4.5)
Merging powerpc/next (6e669f085d59 powerpc: Fix unrecoverable SLB miss during restore_math())
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (4fe339bc21e0 s390: wire up preadv2/pwritev2 syscalls)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f98983bbba0d tile/defconfigs: Remove CONFIG_IPV6_PRIVACY)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (951d5190db54 Merge branch 'for-next-4.6-20160331' into for-next-20160331)
Merging ceph/master (7c886661dc31 libceph: use KMEM_CACHE macro)
Merging cifs/for-next (b562e44f507e Linux 4.5)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (8f9e8f5fcc05 ocfs2: Fix Q_GETNEXTQUOTA for filesystem without quotas)
Merging ext4/dev (1028b55bafb7 ext4: allow readdir()'s of large empty directories to be interrupted)
Merging f2fs/dev (f55532a0c0b8 Linux 4.6-rc1)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (3e11e5304150 GFS2: ignore unlock failures after withdraw)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (f55532a0c0b8 Linux 4.6-rc1)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (45996492e5c8 orangefs: fix orangefs_superblock locking)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (f55532a0c0b8 Linux 4.6-rc1)
Merging hid/for-next (b428a267271e Merge branches 'for-4.6/upstream-fixes' and 'for-4.7/hidraw' into for-next)
Merging i2c/i2c/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (c528f2aae571 hwmon: (max31722) Add support for MAX31722/MAX31723 temperature sensors)
Merging v4l-dvb/master (df92cda7a31a Merge branch 'v4l_for_linus' into to_next)
Merging libata/for-next (d991c872ac7f libata: Fixup awkward whitespace in warning by removing line continuation.)
Merging pm/linux-next (b681c8916bb8 Merge branch 'pm-cpufreq-sched' into linux-next)
$ git reset --hard HEAD^
Merging next-20160331 version of pm
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (a134b4143b65 thermal: tegra: add PM support)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (f55532a0c0b8 Linux 4.6-rc1)
Merging net-next/master (e46b4e2b46e1 Merge tag 'trace-v4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (e46b4e2b46e1 Merge tag 'trace-v4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging bluetooth/master (de06dbfa7861 Merge branch 'for-linus' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging mtd/master (f55532a0c0b8 Linux 4.6-rc1)
Merging l2-mtd/master (f55532a0c0b8 Linux 4.6-rc1)
Merging nand/nand/next (a5565e3737b8 mtd: nand: jz4780: fixup, device structure assigned at probe)
Merging crypto/master (34074205bb9f crypto: qat - remove redundant arbiter configuration)
Merging drm/drm-next (4604202ca8d2 Merge branch 'drm-next-4.6' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (72e96d6450c0 drm/i915: Refer to GGTT {,VM} consistently)
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (249c4f538b1a drm: Add new DCS commands in the enum list)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (879e40bea6f2 drm: ARM HDLCD - get rid of devm_clk_put())
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/juno-base.dtsi
Merging drm-vc4/drm-vc4-next (f55532a0c0b8 Linux 4.6-rc1)
Merging kbuild/for-next (2468fc97cc45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging regmap/for-next (1688fc1d5733 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (c7d1565ed254 ALSA: firewire-tascam: deleyed registration of sound card)
Merging sound-asoc/for-next (e478f58a0872 Merge remote-tracking branch 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (7d8d86252307 Input: gpio-keys - clean up device tree binding example)
Merging block/for-next (258b83ad9930 Merge branch 'for-linus' into for-next)
Merging device-mapper/for-next (ef6e0d57417a dm raid1: do not error successfully written bios during suspend)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (1dceb0415aa0 mmc: sdhci: Fix regression setting power on Trats2 board)
Merging md/for-next (ed3b98c71cd9 MD: add rdev reference for super write)
Merging mfd/for-mfd-next (a557a7a09b08 mfd: lp8788-irq: Uninitialized variable in irq handler)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (77f8e8e944cb Merge remote-tracking branches 'regulator/topic/maxim', 'regulator/topic/pwm', 'regulator/topic/qcom-spmi' and 'regulator/topic/twl' into regulator-next)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (759b31c1d429 selinux: simply inode label states to INVALID and INITIALIZED)
Merging tpmdd/next (59f95b842ad0 Merge branch 'master' into next)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (70cf769c5ba2 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (4817ebb144ff serial: doc: Correct return type of mctrl_gpio_to_gpiod())
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (b562e44f507e Linux 4.5)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (bc553986a2f7 dtc: turn off dtc unit address warnings by default)
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (dd282b27f0c1 Merge remote-tracking branches 'spi/topic/fsl-dspi', 'spi/topic/fsl-espi', 'spi/topic/octeon', 'spi/topic/pxa2xx' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (c2ee77af4b66 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (ff6fd1478c53 ARM: socfpga: Enable Arria10 L2 cache ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (7e6867bf831c tracing: Record and show NMI state)
Merging rcu/rcu/next (f74d79be23b4 Merge branches 'locktorture.2016.03.31d' and 'docmb.2016.03.31d' into HEAD)
Merging kvm/linux-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
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
Merging usb-serial/usb-next (7084fa868b50 USB: serial: cp210x: add new access functions for large registers)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (30889c72a9fe staging/lustre: lov_io_init() should return error code)
Merging char-misc/char-misc-next (f55532a0c0b8 Linux 4.6-rc1)
Merging extcon/extcon-next (f55532a0c0b8 Linux 4.6-rc1)
Merging cgroup/for-next (08fb4e7f8d5f Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (cf5277b893e5 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (44b03c105106 MAINTAINERS: pinctrl: samsung: Add two new maintainers)
Merging vhost/linux-next (c67f5db82027 virtio_net: replace netdev_alloc_skb_ip_align() with napi_alloc_skb())
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (d75868496ca0 MAINTAINERS: Add mailing list for remote processor subsystems)
Merging gpio/for-next (104ba2903315 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (2aac7ddf9a41 clk: qcom: ipq4019: add some fixed clocks for ddrppl and fepll)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (fda0b150a173 Merge branch 'for-4.6/notifier-cleanup' into for-next)
Merging coresight/next (93eb18df7af9 coresight: configuring ETF in FIFO mode when acting as link)
Merging rtc/rtc-next (d6dca1d76d10 rtc: at91sam9: remove duplicate assignment of variable mr)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (fc0c2028135c x86, pmem: use memcpy_mcsafe() for memcpy_from_pmem())
Merging akpm-current/current (2093093128be ipc/msg.c: use freezable blocking call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: staging/goldfish: use 6-arg get_user_pages()
Merging akpm/master (2f02cfdbcae8 staging/goldfish: use 6-arg get_user_pages())
