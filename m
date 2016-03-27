From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 27
Date: Sun, 27 Mar 2016 21:28:43 +1100
Message-ID: <20160327212843.49036671@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49378 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750976AbcC0K2r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Mar 2016 06:28:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160324:

Undropped tree: overlayfs

The overlayfs lost its conflicts against the ext4 tree.

The nvdimm tree gained a build failure so I used the version from
next-20160324.

Non-merge commits (relative to Linus' tree): 520
 452 files changed, 10923 insertions(+), 3613 deletions(-)

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
Merging origin/master (f55532a0c0b8 Linux 4.6-rc1)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Applying: perf tools: we stil need header.h for various things
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (deaf7565eb61 ARCv2: ioremap: Support dynamic peripheral address space)
Merging arm-current/fixes (f474c8c857d9 ARM: 8544/1: set_memory_xx fixes)
Merging m68k-current/for-linus (efbec135f11d m68k: Fix misspellings in comments.)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (b562e44f507e Linux 4.5)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (9ef595d83aea sparc: Convert naked unsigned uses to unsigned int)
Merging net/master (322cea2f41ad bpf: add missing map_flags to bpf_map_show_fdinfo)
Merging ipsec/master (215276c0147e xfrm: Reset encapsulation field of the skb before transformation)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (2acd84648554 rtlwifi: fix gcc-6 indentation warning)
Merging mac80211/master (ad8ec957f693 wext: unregister_pernet_subsys() on notifier registration failure)
Merging sound-current/for-linus (91d2178e26fd ALSA: timer: fix gparams ioctl compatibility for different architectures)
Merging pci-current/for-linus (9188269a2e8e Revert "PCI: dra7xx: Mark driver as broken")
Merging driver-core.current/driver-core-linus (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging tty.current/tty-linus (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging usb.current/usb-linus (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging usb-gadget-fixes/fixes (3b2435192fe9 MAINTAINERS: drop OMAP USB and MUSB maintainership)
Merging usb-serial-fixes/usb-linus (f6cede5b49e8 Linux 4.5-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging char-misc.current/char-misc-linus (5cd0911a9e0e Merge tag 'please-pull-pstore' of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging input-current/for-linus (d314e9e80c5e Input: sur40 - fix DMA on stack)
Merging crypto-current/master (e54358915d0a PKCS#7: pkcs7_validate_trust(): initialize the _trusted output argument)
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
Merging at91/at91-next (772c75951fa9 Merge tag 'at91-fixes' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (1305141d1a72 ARM: bcm2835: add bcm2835-aux-uart support to DT)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (0a05d3b71ada ARM: multi_v7_defconfig: Enable BCM283x)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (9e26d5f485d7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (1bdd5a9b339c ARM: dts: k2*: Rename the k2* files to keystone-k2* files)
Merging mvebu/for-next (5be603bdf1a7 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (aec24f100558 Merge branch 'omap-for-v4.6/fixes-not-urgent' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/logicpd-torpedo-som.dtsi
Merging omap-pending/for-next (8fe097a3d99e ARM: DRA7: hwmod: Add reset data for PCIe)
Merging qcom/for-next (f17d0d578214 ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (f094c5346231 Merge branch 'heads/sh-drivers-for-v4.6' into next)
Merging rockchip/for-next (1ee969dbc199 Merge branch 'v4.6-armsoc/dts64-fixes' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (079017960a68 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (73e5379b0442 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/config64-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (755f165105b1 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (691b1e2ebf72 arm64: mm: allow preemption in copy_to_user_page)
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
Merging mips/mips-for-linux-next (8628008513d7 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (119a0a3c13ef parisc: Wire up preadv2 and pwritev2 syscalls)
Merging powerpc/next (6e669f085d59 powerpc: Fix unrecoverable SLB miss during restore_math())
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (37da5234dfa8 s390: wire up preadv2/pwritev2 syscalls)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (35b90a2939a5 tile: Fix misspellings in comments.)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (2f06df5ab100 Merge branch 'for-next-4.6-20160324' into for-next-20160324)
Merging ceph/master (7c886661dc31 libceph: use KMEM_CACHE macro)
Merging cifs/for-next (b562e44f507e Linux 4.5)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (ab73ef46398e quota: Fix possible GPF due to uninitialised pointers)
Merging ext4/dev (3d43bcfef5f0 ext4 crypto: use dget_parent() in ext4_d_revalidate())
Merging f2fs/dev (d407574e7948 Merge tag 'for-f2fs-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (3e11e5304150 GFS2: ignore unlock failures after withdraw)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (606c61a05796 Merge branch 'akpm' (patches from Andrew))
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (45996492e5c8 orangefs: fix orangefs_superblock locking)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
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
Merging v4l-dvb/master (0dcdd3ba27cb sound/usb: fix to release stream resources from media_snd_device_delete())
Merging libata/for-next (4b3ec0279397 Merge branch 'for-4.6' into for-next)
Merging pm/linux-next (15dbc136dff6 Merge tag 'pm+acpi-4.6-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (44fa372da981 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (7ea5d41560d9 Merge branch 'for-linus' into next)
Merging net-next/master (e46b4e2b46e1 Merge tag 'trace-v4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (ccfe1e853220 rtl8xxxu: Temporarily disable 8192eu device init)
Merging bluetooth/master (de06dbfa7861 Merge branch 'for-linus' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging mtd/master (a2d4fa1acbb9 Merge MTD 4.6 development into 4.5 fixes)
Merging l2-mtd/master (a2d4fa1acbb9 Merge MTD 4.6 development into 4.5 fixes)
Merging crypto/master (34074205bb9f crypto: qat - remove redundant arbiter configuration)
Merging drm/drm-next (4604202ca8d2 Merge branch 'drm-next-4.6' of git://people.freedesktop.org/~agd5f/linux into drm-next)
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
Merging regmap/for-next (46a1026cc1a0 Merge remote-tracking branches 'regmap/fix/be' and 'regmap/fix/doc' into regmap-linus)
Merging sound/for-next (91d2178e26fd ALSA: timer: fix gparams ioctl compatibility for different architectures)
Merging sound-asoc/for-next (0a63eacf2fab Merge remote-tracking branches 'asoc/fix/cs35l32', 'asoc/fix/rt5616' and 'asoc/fix/rt5640' into asoc-linus)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (d314e9e80c5e Input: sur40 - fix DMA on stack)
Merging block/for-next (258b83ad9930 Merge branch 'for-linus' into for-next)
Merging device-mapper/for-next (ef6e0d57417a dm raid1: do not error successfully written bios during suspend)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (64e5cd723120 mmc: sdhci-of-at91: fix wake-up issue when using runtime pm)
Merging md/for-next (de24075022dc md: fix a trivial typo in comments)
Merging mfd/for-mfd-next (dd3506a611d9 mfd: lp8788-irq: Uninitialized variable in irq handler)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (e3eeaf3d7f21 Merge remote-tracking branches 'regulator/fix/constrain' and 'regulator/fix/gpio' into regulator-linus)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging tpmdd/next (59f95b842ad0 Merge branch 'master' into next)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (70cf769c5ba2 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (abfa6cd8cda7 modsign: Fix documentation on module signing enforcement parameter.)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (5027e19db8ce of: Add vendor prefix for eGalax_eMPIA Technology Inc)
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (78b5a17c35bd Merge remote-tracking branches 'spi/fix/omap2' and 'spi/fix/rockchip' into spi-linus)
Merging tip/auto-latest (e05968d2e5ab Merge branch 'sched/urgent')
CONFLICT (content): Merge conflict in arch/x86/Kconfig
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (7e6867bf831c tracing: Record and show NMI state)
Merging rcu/rcu/next (7220b7742659 locktorture: Fix nil pointer dereferencing for cleanup paths)
Merging kvm/linux-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging kvm-arm/next (b40c4892d175 arm64: KVM: vgic-v3: Only wipe LRs on vcpu exit)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c54f0d6ae057 KVM: s390: allocate only one DMA page per VM)
Merging xen-tip/linux-next (e01dc539df3a drivers/xen: make platform-pci.c explicitly non-modular)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (fffcad87d4e7 hp-wmi: Remove GPS rfkill support via pre-2009 interface)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (7296c33ed12e leds: triggers: simplify led_trigger_store)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging tty/tty-next (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging usb/usb-next (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging usb-gadget/next (0561f77e2db9 usb: gadget: f_acm: Fix configfs attr name)
Merging usb-serial/usb-next (7084fa868b50 USB: serial: cp210x: add new access functions for large registers)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (1d02369dba2c Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging char-misc/char-misc-next (5cd0911a9e0e Merge tag 'please-pull-pstore' of git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging extcon/extcon-next (ae64e42cc2b3 extcon: palmas: Drop IRQF_EARLY_RESUME flag)
Merging cgroup/for-next (08fb4e7f8d5f Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (fd30a352d56b Merge branch 'misc' into for-next)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (3c177a166253 pinctrl: single: Use a separate lockdep class)
Merging vhost/linux-next (c67f5db82027 virtio_net: replace netdev_alloc_skb_ip_align() with napi_alloc_skb())
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (0f32cd8e8555 remoteproc: st: fix check of syscon_regmap_lookup_by_phandle() return value)
Merging gpio/for-next (968f3e374faf Merge branch 'for-linus-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (77fe47fbb3b7 pwm: omap-dmtimer: Add debug message for effective period and duty cycle)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (4d3ac6662452 clk: bcm2835: fix check of error code returned by devm_ioremap_resource())
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (6accd8e9bf22 selftests: media_dcevice_test fix usage information)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (fda0b150a173 Merge branch 'for-4.6/notifier-cleanup' into for-next)
Merging coresight/next (f1e2c1b13dfa drivers/hwtracing: make coresight-etm-perf.c explicitly non-modular)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (ee087744247c rtc: abx80x: handle the oscillator failure bit)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a2b056ea291d x86, pmem: use memcpy_mcsafe() for memcpy_from_pmem())
$ git reset --hard HEAD^
Merging next-20160324 version of nvdimm
Merging akpm-current/current (c0b923091eea ipc/msg.c: use freezable blocking call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: staging/goldfish: use 6-arg get_user_pages()
Merging akpm/master (5c6227b4cce4 staging/goldfish: use 6-arg get_user_pages())
