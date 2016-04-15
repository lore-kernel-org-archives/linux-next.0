From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 15
Date: Fri, 15 Apr 2016 14:58:17 +1000
Message-ID: <20160415145817.4b139e5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45489 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbcDOE6V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Apr 2016 00:58:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160414:

The tip tree still had its build failure for which I reverted a commit.

The akpm-current tree still had its build failure for which I applied
a patch.

Non-merge commits (relative to Linus' tree): 3999
 3724 files changed, 148813 insertions(+), 87018 deletions(-)

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
Merging origin/master (90de6800c240 Merge tag 'sh-fixes-4.6-rc1' of git://git.libc.org/linux-sh)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (d01ebf06e305 ARCv2: Enable LOCKDEP)
Merging arm-current/fixes (208fae5c3b94 ARM: 8550/1: protect idiv patching against undefined gcc behavior)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update defconfigs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (71528d8bd7a8 powerpc: Correct used_vsr comment)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (5ec712934ce1 sparc: Write up preadv2/pwritev2 syscalls.)
Merging net/master (b4dfd8e92956 bgmac: reset & enable Ethernet core before using it)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (15da5d11040c Merge tag 'iwlwifi-for-kalle-2016-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (8f815cdde3e5 nl80211: check netlink protocol in socket release notification)
Merging sound-current/for-linus (c44da62b55bb ALSA: hda - Fix inconsistent monitor_present state until repoll)
Merging pci-current/for-linus (b2d7a9cd3ff8 Revert "PCI: imx6: Add support for active-low reset GPIO")
Merging driver-core.current/driver-core-linus (dea5c24a1404 lib: lz4: cleanup unaligned access efficiency detection)
Merging tty.current/tty-linus (bf1620068911 Linux 4.6-rc3)
Merging usb.current/usb-linus (e86103a75705 usb: hcd: out of bounds access in for_each_companion)
Merging usb-gadget-fixes/fixes (bf1620068911 Linux 4.6-rc3)
Merging usb-serial-fixes/usb-linus (bf1620068911 Linux 4.6-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (bf1620068911 Linux 4.6-rc3)
Merging char-misc.current/char-misc-linus (053f78d35995 Merge tag 'lkdtm-4.6-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into char-misc-linus)
Merging input-current/for-linus (7eb5ca09e48e Input: clarify we want BTN_TOOL_<name> on proximity)
Merging crypto-current/master (47cd30608f3f hwrng: bcm63xx - fix device tree compilation)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (42bf7b46a5de drm/i915: fix deadlock on lid open)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (e4863ecc1b9d ARC: RIP arc_{get|set}_core_freq() clk API)
Merging arm/for-next (2c94ffb62d6b Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f55532a0c0b8 Linux 4.6-rc1)
Merging arm-soc/for-next (7dde46570e4b ARM: SoC: Document merges)
Merging at91/at91-next (503057c24478 Merge branches 'at91-4.7-soc' and 'at91-4.7-dt' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (48c3b1441a77 dt/bindings: bcm2835: correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (8d1a8c92a8c0 ARM: bcm2835: Enable CONFIG_PM.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (7a3cdfe98cc6 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (02e15d234006 Merge branch 'for_4.7/kesytone' into next)
Merging mvebu/for-next (550cd80600c7 Merge branch 'mvebu/defconfig' into mvebu/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging omap/for-next (edc590ce8a30 Merge branch 'omap-for-v4.7/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (28c3334242a9 ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (6d5b4ac3dc09 Merge branch 'heads/fixes-for-v4.6' into next)
Merging rockchip/for-next (670939f6a0eb Merge branch 'v4.7-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (e51318a1aa52 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (93a96dc4ccc1 Merge branches 'sunxi/dt-for-4.7', 'sunxi/clocks-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-next)
Merging tegra/for-next (622c4dab4b80 Merge branch for-4.7/arm64 into for-next)
Merging arm64/for-next/core (f55532a0c0b8 Linux 4.6-rc1)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (efbec135f11d m68k: Fix misspellings in comments.)
Merging m68knommu/for-next (d2a2bc721cef m68k/gpio: remove arch specific sysfs bus device)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (732fd2445ed5 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8fe889274c7a nios2: Replace fdt_translate_address with of_flat_dt_translate_address)
Merging parisc-hd/for-next (b562e44f507e Linux 4.5)
Merging powerpc/next (1050e689a63b cxl: Delete an unnecessary check before the function call "kfree")
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
Merging btrfs-kdave/for-next (eca999f1db56 Merge branch 'for-next-4.6-20160411' into for-next-20160411)
CONFLICT (content): Merge conflict in fs/btrfs/volumes.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (2224d879c7c0 rbd: use GFP_NOIO consistently for request allocations)
Merging cifs/for-next (90de6800c240 Merge tag 'sh-fixes-4.6-rc1' of git://git.libc.org/linux-sh)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (8f9e8f5fcc05 ocfs2: Fix Q_GETNEXTQUOTA for filesystem without quotas)
Merging ext4/dev (c325a67c7290 ext4: ignore quota mount options if the quota feature is enabled)
Merging f2fs/dev (d9d060129c24 f2fs: remove redundant condition check)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (e97321fa095f GFS2: Don't dereference inode in gfs2_inode_lookup until it's valid)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (bf1620068911 Linux 4.6-rc3)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variable)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (9735a22799b9 Linux 4.6-rc2)
Merging hid/for-next (96ee96e16f9f Merge branch 'for-4.6/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (18eadc912cd4 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (5b3af0edd8db hwmon: (it87) Add support for IT8628E)
Merging v4l-dvb/master (405ddbfa6817 [media] Revert "[media] media: au0828 change to use Managed Media Controller API")
Merging libata/for-next (c5cf484d03f1 Merge branch 'for-4.6-fixes' into for-next)
Merging pm/linux-next (171912fdeb21 Merge branch 'pm-tools' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (c960fe12d002 thermal: hisilicon: fix IRQ imbalance enabling)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (2c783ce0adcf Merge branch 'for-linus' into next)
Merging net-next/master (da37845fdce2 packet: uses kfree_skb() for errors.)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (5a504528f28f ipvs: don't alter conntrack in OPS mode)
Merging wireless-drivers-next/master (84349698f05d mwifiex: fix the incorrect WARN_ON during suspend)
Merging bluetooth/master (edc73417d8f3 6lowpan: move mac802154 header)
Merging mac80211-next/master (81948527fce5 cfg80211: Add option to report the bss entry in connect result)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement in nand_scan)
Merging l2-mtd/master (08922f644878 mtd: devices: m25p80: add support for mmap read request)
Merging nand/nand/next (a3fd27e69422 Merge branch 'mtd-nand-trigger' of git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds into nand/next)
Merging crypto/master (043809d8d25e hwrng: exynos - Fix misspelled Samsung address)
Merging drm/drm-next (f9fd2adaacd8 Merge branch 'gma500-next' of git://github.com/patjak/drm-gma500 into drm-next)
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (3d7d0c85e41a drm/i915: Use fw_domains_put_with_fifo() on HSW)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (346fea63a8d2 include/drm: Reword debug categories comment.)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an error code)
Merging drm-vc4/drm-vc4-next (5883980313af drm/vc4: Fix NULL deref in HDMI init error path)
Merging kbuild/for-next (2468fc97cc45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging regmap/for-next (4cdd8b9b9fc9 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (3aa02cb664c5 ALSA: pcm : Call kill_fasync() in stream lock)
Merging sound-asoc/for-next (307f3cba8b6a Merge remote-tracking branches 'asoc/topic/tas571x', 'asoc/topic/topology', 'asoc/topic/wm8960' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (13771c666003 module: Issue warnings when tainting kernel)
Merging input/next (74813cebd678 Input: bcm_iproc_tsc - use syscon to access shared registers)
Merging block/for-next (06fde609f0bd Merge branch 'for-4.7/drivers' into for-next)
Merging device-mapper/for-next (17e9f75eef22 dm mpath: eliminate use of spinlock in IO fast-paths)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (c1c92cdb08c5 Merge branch 'fixes' into next)
Merging md/for-next (7dedd15dd252 md/raid0: fix uninitialized variable bug)
Merging mfd/for-mfd-next (a557a7a09b08 mfd: lp8788-irq: Uninitialized variable in irq handler)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when battery charging near dry)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (c122edda19cf Merge remote-tracking branches 'regulator/topic/pwm', 'regulator/topic/qcom-spmi', 'regulator/topic/s2mps11', 'regulator/topic/sysfs-init' and 'regulator/topic/twl' into regulator-next)
Merging security/next (3c9d6296b7ae security: drop the unused hook skb_owned_by)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (1ea6102bba5f Merge branch 'keys-trust' into keys-next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_parser.c
Merging selinux/next (0fd71a620be8 selinux: Change bool variable name to index.)
Merging tpmdd/next (0c61500a7f09 tpm/st33zp24: Remove unneeded tpm_reg in get_burstcount)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (ba72c4136584 Merge branches 'iommu/fixes', 'arm/io-pgtable', 'arm/rockchip', 'arm/omap', 'x86/vt-d', 'x86/amd' and 'ppc/pamu' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (4817ebb144ff serial: doc: Correct return type of mctrl_gpio_to_gpiod())
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (7ffb8e317bae audit: we don't need to __set_current_state(TASK_RUNNING))
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (bc553986a2f7 dtc: turn off dtc unit address warnings by default)
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (81232927a807 Merge remote-tracking branches 'spi/topic/pic32', 'spi/topic/pxa2xx' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (740232d4b551 Merge branch 'perf/core')
Applying: Revert "perf tools: Build syscall table .c header from kernel's syscall_64.tbl"
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (2364d423a7b3 ARM: socfpga: Enable Arria10 OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (7e6867bf831c tracing: Record and show NMI state)
Merging rcu/rcu/next (4530d62e04e3 documentation: State purpose of memory-barriers.txt)
Merging kvm/linux-next (316314cae15f KVM: x86: mask CPUID(0xD,0x1).EAX against host value)
Merging kvm-arm/next (06a71a24bae5 arm64: KVM: unregister notifiers in hyp mode teardown path)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c87ff1433aca KVM: s390: add clear I/O irq operation for FLIC)
Merging xen-tip/linux-next (85d1a29de8e4 Xen on ARM and ARM64: update MAINTAINERS info)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (fffcad87d4e7 hp-wmi: Remove GPS rfkill support via pre-2009 interface)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (4a91c45ea57c leds: tca6507: silence an uninitialized variable warning)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (c4a74f63dfd2 debugfs: unproxify files created through debugfs_create_u32_array())
Merging tty/tty-next (bf1620068911 Linux 4.6-rc3)
Merging usb/usb-next (bf1620068911 Linux 4.6-rc3)
Merging usb-gadget/next (7a0debee7db3 usb: dwc3: omap: get rid of dma_status)
Merging usb-serial/usb-next (bf1620068911 Linux 4.6-rc3)
Merging usb-chipidea-next/ci-for-usb-next (4e332df63487 usb: otg-fsm: support multiple instances)
Merging staging/staging-next (5f47992491ff Merge 4.6-rc3 into staging-next)
Merging char-misc/char-misc-next (423de92f56bd mei: bus: use scnprintf in *_show)
Merging extcon/extcon-next (af59836135bf extcon: usb-gpio: Don't miss event during suspend/resume)
Merging cgroup/for-next (08fb4e7f8d5f Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (1484a62bfc8d zfcp: Revert to original scanning behaviour)
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (ca1c8b640fe8 Merge branch 'devel' into for-next)
Merging vhost/linux-next (c00bbcf86289 virtio: add VIRTIO_CONFIG_S_NEEDS_RESET device status bit)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (9735a22799b9 Linux 4.6-rc2)
Merging gpio/for-next (9e72376659d9 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (d56f8994b6fb clk: Provide OF helper to mark clocks as CRITICAL)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (0ee930b57e0c Merge branch 'for-4.7/arch-independent-klp-relocations' into for-next)
Merging coresight/next (27268ed3d169 coresight: etm4x: modify q_support type)
Merging rtc/rtc-next (26ec9313b537 rtc: m41t80: handle oscillator failure bit)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a390180291dd libnvdimm, pfn: fix nvdimm_namespace_add_poison() vs section alignment)
Merging akpm-current/current (6c454fa77b78 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (cb06703f3581 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
