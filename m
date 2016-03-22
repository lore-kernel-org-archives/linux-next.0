From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 22
Date: Tue, 22 Mar 2016 14:25:17 +1100
Message-ID: <20160322142517.1bc3debe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50776 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751086AbcCVDZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Mar 2016 23:25:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add any v4.7 related material to your linux-next included
trees until after v4.6-rc1 is released.

Changes since 20160321:

The arm64 tree gained a conflict against Linus' tree.

The rdma tree gained conflicts against Linus' tree.

The drm tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1943
 1620 files changed, 111055 insertions(+), 31754 deletions(-)

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

I am currently merging 231 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (e531cdf50a8a Merge tag 'mmc-v4.6' of git://git.linaro.org/people/ulf.hansson/mmc)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (deaf7565eb61 ARCv2: ioremap: Support dynamic peripheral address space)
Merging arm-current/fixes (f474c8c857d9 ARM: 8544/1: set_memory_xx fixes)
Merging m68k-current/for-linus (efbec135f11d m68k: Fix misspellings in comments.)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (b562e44f507e Linux 4.5)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (9ef595d83aea sparc: Convert naked unsigned uses to unsigned int)
Merging net/master (6b0725232dd1 Merge branch 'bridge-gso-segs-and-size')
Merging ipsec/master (215276c0147e xfrm: Reset encapsulation field of the skb before transformation)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (10da848f67a7 ssb: host_soc depends on sprom)
Merging mac80211/master (ad8ec957f693 wext: unregister_pernet_subsys() on notifier registration failure)
Merging sound-current/for-linus (c64c1437afb1 ALSA: hda - Fix missing ELD update at unplugging)
Merging pci-current/for-linus (30b5b8808c12 PCI: Restore inclusion of pci/hotplug Kconfig)
Merging driver-core.current/driver-core-linus (18558cae0272 Linux 4.5-rc4)
Merging tty.current/tty-linus (18558cae0272 Linux 4.5-rc4)
Merging usb.current/usb-linus (6b5f04b6cf8e Merge branch 'for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging usb-gadget-fixes/fixes (3b2435192fe9 MAINTAINERS: drop OMAP USB and MUSB maintainership)
Merging usb-serial-fixes/usb-linus (f6cede5b49e8 Linux 4.5-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (1200b6809dfd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next)
Merging char-misc.current/char-misc-linus (5cd0911a9e0e Merge tag 'please-pull-pstore' of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging input-current/for-linus (4d2508a55990 ARM: pxa/raumfeld: use PROPERTY_ENTRY_INTEGER to define props)
Merging crypto-current/master (dfe97ad30e8c crypto: marvell/cesa - forward devm_ioremap_resource() error code)
Merging ide/master (0d7ef45cdeeb ide: palm_bk3710: test clock rate to avoid division by 0)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (b562e44f507e Linux 4.5)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (60d77f101c1f ARC: thp: unbork !CONFIG_TRANSPARENT_HUGEPAGE build)
Merging arm/for-next (1b3bf847977c Merge branches 'amba', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (fe638401a091 arm64: perf: Extend ARMV8_EVTYPE_MASK to include PMCR.LC)
Merging arm-soc/for-next (35fe688abfcf arm-soc: document merges)
Merging at91/at91-next (c40abde4b32e Merge branch 'at91-4.6-dt' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (1305141d1a72 ARM: bcm2835: add bcm2835-aux-uart support to DT)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (0a05d3b71ada ARM: multi_v7_defconfig: Enable BCM283x)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (9e26d5f485d7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8fdbbde4a16c Merge branch 'for_4.6/keystone_dts' into next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/Makefile
Merging mvebu/for-next (5be603bdf1a7 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (aec24f100558 Merge branch 'omap-for-v4.6/fixes-not-urgent' into for-next)
CONFLICT (content): Merge conflict in drivers/clk/Kconfig
CONFLICT (content): Merge conflict in arch/arm/boot/dts/logicpd-torpedo-som.dtsi
Merging omap-pending/for-next (8fe097a3d99e ARM: DRA7: hwmod: Add reset data for PCIe)
Merging qcom/for-next (f17d0d578214 ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (f094c5346231 Merge branch 'heads/sh-drivers-for-v4.6' into next)
Merging rockchip/for-next (545d1b355f3a Merge branch 'v4.6-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (466369e4e14b Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (73e5379b0442 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/config64-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (755f165105b1 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (f09f1bacfe2b arm64: Split pr_notice("Virtual kernel memory layout...") into multiple pr_cont())
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (7a93665a22d8 Merge remote-tracking branch 'origin' into h8300-next)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (efbec135f11d m68k: Fix misspellings in comments.)
Merging m68knommu/for-next (a3595962d824 m68knommu: remove obsolete 68360 support)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (a6cab95ec1ae Merge branch '4.5-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (6e669f085d59 powerpc: Fix unrecoverable SLB miss during restore_math())
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (19eedc6df7b6 s390: wire up preadv2/pwritev2 syscalls)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (35b90a2939a5 tile: Fix misspellings in comments.)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (cb96ddcd037b Merge branch 'for-next-4.6-20160321' into for-next-20160321)
Merging ceph/master (cd8140c673d9 libceph: don't spam dmesg with stray reply warnings)
Merging cifs/for-next (b562e44f507e Linux 4.5)
Merging configfs/for-next (1ae1602de028 configfs: switch ->default groups to a linked list)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (ab73ef46398e quota: Fix possible GPF due to uninitialised pointers)
Merging ext4/dev (ff2ea405b86c ext4: check if in-inode xattr is corrupted in ext4_expand_extra_isize_ea())
CONFLICT (content): Merge conflict in fs/overlayfs/super.c
Merging f2fs/dev (d407574e7948 Merge tag 'for-f2fs-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (9dffdb38d864 Merge tag 'staging-4.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (f35592a97460 nfs/blocklayout: make sure making a aligned read request)
Merging nfsd/nfsd-next (8287ea1c52bd nfsd: block and scsi layout drivers need to depend on CONFIG_BLOCK)
Merging orangefs/for-next (2f83ace37181 orangefs: put register_chrdev immediately before register_filesystem)
Merging overlayfs/overlayfs-next (1fd10315545a ovl: ignore permissions on underlying lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (2cdb958aba6a Merge branch 'xfs-misc-fixes-4.6-4' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (8b23a8ce1094 Merge branches 'work.lookups', 'work.misc' and 'work.preadv2' into for-next)
Merging pci/next (6e6f498b039a Merge branch 'pci/resource' into next)
Merging hid/for-next (c7bc3b24d539 Merge branch 'for-4.6/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (886f6f8337dd i2c: octeon: Support I2C_M_RECV_LEN)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (630300d5fcb6 hwmon: Create an NSA320 hardware monitoring driver)
Merging v4l-dvb/master (1752d448bb5e Merge branch 'v4l_for_linus' into to_next)
Merging libata/for-next (4b3ec0279397 Merge branch 'for-4.6' into for-next)
Merging pm/linux-next (6a9c8816542f Merge branches 'pm-cpufreq' and 'acpi-soc' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal/next (33cae63614e6 Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (44fa372da981 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (e38e5ce81c3e firewire: ABI documentation: libhinawa uses firewire-cdev)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (7ea5d41560d9 Merge branch 'for-linus' into next)
Merging net-next/master (de06dbfa7861 Merge branch 'for-linus' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (ccfe1e853220 rtl8xxxu: Temporarily disable 8192eu device init)
Merging bluetooth/master (de06dbfa7861 Merge branch 'for-linus' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
CONFLICT (content): Merge conflict in drivers/staging/rdma/hfi1/verbs.c
CONFLICT (content): Merge conflict in drivers/staging/rdma/hfi1/user_pages.c
CONFLICT (modify/delete): drivers/staging/rdma/hfi1/mr.c deleted in rdma/for-next and modified in HEAD. Version HEAD of drivers/staging/rdma/hfi1/mr.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/rdma/hfi1/mad.c
CONFLICT (modify/delete): drivers/staging/rdma/hfi1/keys.c deleted in rdma/for-next and modified in HEAD. Version HEAD of drivers/staging/rdma/hfi1/keys.c left in tree.
$ git rm -f drivers/staging/rdma/hfi1/keys.c drivers/staging/rdma/hfi1/mr.c
Merging mtd/master (9df4f913eb39 MAINTAINERS: add a maintainer for the NAND subsystem)
Merging l2-mtd/master (6871c1b96de8 mtd: nand: remove kerneldoc for removed function parameter)
Merging crypto/master (34074205bb9f crypto: qat - remove redundant arbiter configuration)
Merging drm/drm-next (568d7c764ae0 drm/amdgpu: release_pages requires linux/pagemap.h)
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (94669e6ba1ad drm/i915: Handle -EDEADLK in drm_atomic_commit from load-detect.)
Merging drm-tegra/drm/tegra/for-next (341917fe2b62 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (b47bcb93bbf2 dma-buf/fence: fix fence_is_later v2)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/juno-base.dtsi
Merging drm-vc4/drm-vc4-next (90d7116061f8 drm/vc4: Recognize a more specific compatible string for V3D.)
Merging kbuild/for-next (2468fc97cc45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging regmap/for-next (d105141b9b4b Merge remote-tracking branch 'regmap/fix/doc' into regmap-linus)
Merging sound/for-next (c64c1437afb1 ALSA: hda - Fix missing ELD update at unplugging)
Merging sound-asoc/for-next (0a63eacf2fab Merge remote-tracking branches 'asoc/fix/cs35l32', 'asoc/fix/rt5616' and 'asoc/fix/rt5640' into asoc-linus)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (82be788c96ed Input: synaptics - handle spurious release of trackstick buttons, again)
Merging block/for-next (8fe39574cfce Merge branch 'for-linus' into for-next)
Merging device-mapper/for-next (98dbc9c6c616 dm: fix rq_end_stats() NULL pointer in dm_requeue_original_request())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (64e5cd723120 mmc: sdhci-of-at91: fix wake-up issue when using runtime pm)
Merging md/for-next (de24075022dc md: fix a trivial typo in comments)
Merging mfd/for-mfd-next (0343b2f4e4a5 mfd: intel-lpss: Pass I2C configuration via properties on BXT)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (1d64efa04292 Merge remote-tracking branch 'regulator/fix/gpio' into regulator-linus)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging tpmdd/next (59f95b842ad0 Merge branch 'master' into next)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (70cf769c5ba2 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173.dtsi
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (abfa6cd8cda7 modsign: Fix documentation on module signing enforcement parameter.)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (5027e19db8ce of: Add vendor prefix for eGalax_eMPIA Technology Inc)
Merging mailbox/mailbox-for-next (aace66b170ce mailbox: Introduce TI message manager driver)
Merging spi/for-next (8a5a27213f7e Merge remote-tracking branch 'spi/fix/rockchip' into spi-linus)
Merging tip/auto-latest (e05968d2e5ab Merge branch 'sched/urgent')
CONFLICT (content): Merge conflict in kernel/sched/sched.h
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (741f3a69f101 tracing: Remove redundant reset per-CPU buff in irqsoff tracer)
Merging rcu/rcu/next (7220b7742659 locktorture: Fix nil pointer dereferencing for cleanup paths)
Merging kvm/linux-next (f958ee745f70 Merge tag 'kvm-s390-next-4.6-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (b40c4892d175 arm64: KVM: vgic-v3: Only wipe LRs on vcpu exit)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c54f0d6ae057 KVM: s390: allocate only one DMA page per VM)
Merging xen-tip/linux-next (e01dc539df3a drivers/xen: make platform-pci.c explicitly non-modular)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (5b4466b8f63b hp-wmi: Remove GPS rfkill support via pre-2009 interface)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (7296c33ed12e leds: triggers: simplify led_trigger_store)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a95fc9c8e576 serial: 8250: describe CONFIG_SERIAL_8250_RSA)
Merging usb/usb-next (6b5f04b6cf8e Merge branch 'for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging usb-gadget/next (0561f77e2db9 usb: gadget: f_acm: Fix configfs attr name)
Merging usb-serial/usb-next (7084fa868b50 USB: serial: cp210x: add new access functions for large registers)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (1200b6809dfd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next)
Merging char-misc/char-misc-next (5cd0911a9e0e Merge tag 'please-pull-pstore' of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging extcon/extcon-next (ae64e42cc2b3 extcon: palmas: Drop IRQF_EARLY_RESUME flag)
Merging cgroup/for-next (08fb4e7f8d5f Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (3d926c1d4d08 Merge branch 'misc' into for-next)
Merging target-updates/for-next (484dfe2e26f7 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (9a7dea4939c8 cxgb4: update Kconfig and Makefile)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
Merging pinctrl/for-next (3c177a166253 pinctrl: single: Use a separate lockdep class)
Merging vhost/linux-next (c67f5db82027 virtio_net: replace netdev_alloc_skb_ip_align() with napi_alloc_skb())
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (0f32cd8e8555 remoteproc: st: fix check of syscon_regmap_lookup_by_phandle() return value)
Merging gpio/for-next (3539699c03a6 gpio: mcp23s08: Fix clearing of interrupt.)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (77fe47fbb3b7 pwm: omap-dmtimer: Add debug message for effective period and duty cycle)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (4d3ac6662452 clk: bcm2835: fix check of error code returned by devm_ioremap_resource())
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-master.c
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-main.c
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (6accd8e9bf22 selftests: media_dcevice_test fix usage information)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (fda0b150a173 Merge branch 'for-4.6/notifier-cleanup' into for-next)
Merging coresight/next (f1e2c1b13dfa drivers/hwtracing: make coresight-etm-perf.c explicitly non-modular)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (be39f5e1a3a1 rv8803: workaround i2c HW issue)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (489011652a2d Merge branch 'for-4.6/pfn' into libnvdimm-for-next)
Merging akpm-current/current (1aa1f27e909b ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/Makefile
CONFLICT (content): Merge conflict in arch/x86/realmode/rm/Makefile
CONFLICT (content): Merge conflict in arch/x86/kernel/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/Makefile
CONFLICT (content): Merge conflict in arch/x86/boot/compressed/Makefile
CONFLICT (content): Merge conflict in arch/x86/boot/Makefile
CONFLICT (content): Merge conflict in arch/mips/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: staging/goldfish: use 6-arg get_user_pages()
Applying: mm/mprotect.c: don't imply PROT_EXEC on non-exec fs
Applying: kernel/signal.c: add compile-time check for __ARCH_SI_PREAMBLE_SIZE
Applying: memremap: don't modify flags
Applying: memremap: add MEMREMAP_WC flag
Applying: drivers: dma-coherent: use MEMREMAP_WC for DMA_MEMORY_MAP
Applying: drivers: dma-coherent: use memset_io for DMA_MEMORY_IO mappings
Applying: kernel/...: convert pr_warning to pr_warn
Applying: dma-rename-dma__writecombine-to-dma__wc-checkpatch-fixes
Applying: alpha/extable: use generic search and sort routines
Applying: s390/extable: use generic search and sort routines
Applying: x86/extable: use generic search and sort routines
Applying: ia64/extable: use generic search and sort routines
Merging akpm/master (f77751625f98 ia64/extable: use generic search and sort routines)
