From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 21
Date: Thu, 21 Apr 2016 16:20:43 +1000
Message-ID: <20160421162043.41edbcb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52306 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbcDUGUq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2016 02:20:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160420:

The tip tree lost its build failures.

The akpm-current tree lost its build failure but gained another for
which I reverted a commit.

Non-merge commits (relative to Linus' tree): 4838
 4450 files changed, 182629 insertions(+), 97309 deletions(-)

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
Merging origin/master (55f058e7574c Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (421e31e58c2a ARCv2: Enable LOCKDEP)
Merging arm-current/fixes (ac36a881b72a ARM: 8564/1: fix cpu feature extracting helper)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update defconfigs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (4705e02498d6 powerpc: Update TM user feature bits in scan_features())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (5ec712934ce1 sparc: Write up preadv2/pwritev2 syscalls.)
Merging net/master (df637193906a Revert "Prevent NUll pointer dereference with two PHYs on cpsw")
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (bcf493428840 netfilter: ebtables: Fix extension lookup with identical name)
Merging wireless-drivers/master (de478a61389c ath9k: ar5008_hw_cmn_spur_mitigate: add missing mask_m & mask_p initialisation)
Merging mac80211/master (8f815cdde3e5 nl80211: check netlink protocol in socket release notification)
Merging sound-current/for-linus (9859a971ca22 ALSA: hda - add PCI ID for Intel Broxton-T)
Merging pci-current/for-linus (67e658794ca1 cxgb4: Set VPD size so we can read both VPD structures)
Merging driver-core.current/driver-core-linus (c3b46c73264b Linux 4.6-rc4)
Merging tty.current/tty-linus (f077b7368291 Revert "serial: 8250: Add hardware dependency to RT288X option")
Merging usb.current/usb-linus (c3b46c73264b Linux 4.6-rc4)
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use-after-free)
Merging usb-serial-fixes/usb-linus (bf1620068911 Linux 4.6-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (bf1620068911 Linux 4.6-rc3)
Merging char-misc.current/char-misc-linus (c3b46c73264b Linux 4.6-rc4)
Merging input-current/for-linus (dcc7597116c6 Input: twl4030-vibra - do not reparent to grandparent)
Merging crypto-current/master (340ff60ae93a crypto: talitos - fix AEAD tcrypt tests)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (31318a922395 drm/i915: Use fw_domains_put_with_fifo() on HSW)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (e4863ecc1b9d ARC: RIP arc_{get|set}_core_freq() clk API)
Merging arm/for-next (c6433ebdc184 Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (f55532a0c0b8 Linux 4.6-rc1)
Merging arm-soc/for-next (7dde46570e4b ARM: SoC: Document merges)
Merging at91/at91-next (503057c24478 Merge branches 'at91-4.7-soc' and 'at91-4.7-dt' into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (896ad420db8d dt/bindings: bcm2835: correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (3652bb35abf6 ARM: bcm2835: Enable NFS root support.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (6ffbe53bca8f Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (02e15d234006 Merge branch 'for_4.7/kesytone' into next)
Merging mvebu/for-next (550cd80600c7 Merge branch 'mvebu/defconfig' into mvebu/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging omap/for-next (8dd34710d963 Merge branch 'omap-for-v4.6/fixes' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (bdc8fcfae81b ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (584a420d4f46 Merge branches 'heads/arm64-dt-for-v4.7', 'heads/dt-for-v4.7', 'heads/soc-for-v4.7' and 'heads/rcar-sysc-for-v4.7' into next)
Merging rockchip/for-next (670939f6a0eb Merge branch 'v4.7-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (f1171050e94b Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (93a96dc4ccc1 Merge branches 'sunxi/dt-for-4.7', 'sunxi/clocks-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-next)
Merging tegra/for-next (bee573cd1dec Merge branch for-4.7/arm64 into for-next)
Merging arm64/for-next/core (643d703d2d2d arm64: compat: Check for AArch32 state)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (efbec135f11d m68k: Fix misspellings in comments.)
Merging m68knommu/for-next (c3b46c73264b Linux 4.6-rc4)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (3f315fa1f5d6 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8fe889274c7a nios2: Replace fdt_translate_address with of_flat_dt_translate_address)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolution sched_clock() implementation)
Merging powerpc/next (8404410b2960 Merge branch 'topic/livepatch' into next)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (c7d4d259b747 s390/crypto: cleanup and move the header with the cpacf definitions)
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
Merging ext4/dev (86cf0011caf3 ext4: allow readdir()'s of large empty directories to be interrupted)
Merging f2fs/dev (4da7bf5a4345 f2fs: remove redundant condition check)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (742f992708df fuse: return patrial success from fuse_direct_io())
Merging gfs2/for-next (9c7fe83530a3 GFS2: Add calls to gfs2_holder_uninit in two error handlers)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (c3b46c73264b Linux 4.6-rc4)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variable)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (9735a22799b9 Linux 4.6-rc2)
Merging hid/for-next (1cdd4e9759b4 Merge branch 'for-4.7/thingm' into for-next)
Merging i2c/i2c/for-next (cd5d37e83267 Merge branch 'i2c/for-4.7' into i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (71a9c23246fe hwmon: (it87) Add support for IT8628E)
Merging v4l-dvb/master (405ddbfa6817 [media] Revert "[media] media: au0828 change to use Managed Media Controller API")
Merging libata/for-next (c5cf484d03f1 Merge branch 'for-4.6-fixes' into for-next)
Merging pm/linux-next (f10503242155 Merge branch 'acpi-tables' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (4f8a3b208740 Merge branch 'work-fixes' into work-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (1338727bc468 Merge branch 'topic/bcm' into next)
Merging net-next/master (10c9ead9f3c6 rtnetlink: add new RTM_GETSTATS message to dump link stats)
CONFLICT (content): Merge conflict in net/ipv4/udp.c
CONFLICT (content): Merge conflict in drivers/net/dsa/mv88e6xxx.c
Applying: Revert "soreuseport: fix ordering for mixed v4/v6 sockets"
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (8fb04d9fc70a ipvs: don't alter conntrack in OPS mode)
Merging wireless-drivers-next/master (171a900c4eb7 rtl8xxxu: MAINTAINERS: Update to point to the active devel branch)
Merging bluetooth/master (151c37bc29bc ieee802154: atusb: update my copyright years for this driver)
Merging mac80211-next/master (81948527fce5 cfg80211: Add option to report the bss entry in connect result)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement in nand_scan)
Merging l2-mtd/master (08922f644878 mtd: devices: m25p80: add support for mmap read request)
Merging nand/nand/next (36cb22c3aa3f mtd: nand: omap2: fix compare_const_fl.cocci warnings)
Merging crypto/master (21ec757d2dd8 crypto: marvell/cesa - Improving code readability)
Merging drm/drm-next (f9fd2adaacd8 Merge branch 'gma500-next' of git://github.com/patjak/drm-gma500 into drm-next)
Merging drm-panel/drm/panel/for-next (1ac3bac7c733 drm/panel: simple: Add support for Innolux AT070TN92)
Merging drm-intel/for-linux-next (00983519214b drm/i915: Fix eDP low vswing for Broadwell)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (ba34d58c5e86 drm: probe_helper: Hide ugly ifdef)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an error code)
Merging drm-vc4/drm-vc4-next (5883980313af drm/vc4: Fix NULL deref in HDMI init error path)
Merging kbuild/for-next (4bf284b27780 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging regmap/for-next (8eabbbb9c0c9 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (d23f0517357e ALSA: ens1371: Fix "Line In->Rear Out Switch" control)
Merging sound-asoc/for-next (1ad306724e0e Merge remote-tracking branches 'asoc/topic/tlv320aic32x4', 'asoc/topic/topology', 'asoc/topic/wm8960' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (13771c666003 module: Issue warnings when tainting kernel)
Merging input/next (2d077d9f4e98 Input: bcm_iproc_tsc - DT spelling s/clock-name/clock-names/)
Merging block/for-next (06fde609f0bd Merge branch 'for-4.7/drivers' into for-next)
Merging device-mapper/for-next (3ff6a535b994 dm mpath: eliminate use of spinlock in IO fast-paths)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (7af73d0b0f28 Merge branch 'fixes' into next)
Merging md/for-next (7dedd15dd252 md/raid0: fix uninitialized variable bug)
Merging mfd/for-mfd-next (ba5776ab6f09 mfd: cros_ec: Allow building for ARM64)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when battery charging near dry)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (adb29b8a5539 Merge remote-tracking branches 'regulator/topic/pwm', 'regulator/topic/qcom-spmi', 'regulator/topic/s2mps11', 'regulator/topic/sysfs-init' and 'regulator/topic/twl' into regulator-next)
Merging security/next (9b091556a073 LSM: LoadPin for kernel file loading restrictions)
Merging integrity/next (f5f8f020b2da ima: add support for creating files using the mknodat syscall)
Merging keys/keys-next (1ea6102bba5f Merge branch 'keys-trust' into keys-next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_parser.c
Merging selinux/next (1ac42476263e selinux: check ss_initialized before revalidating an inode label)
Merging tpmdd/next (0c61500a7f09 tpm/st33zp24: Remove unneeded tpm_reg in get_burstcount)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (ba72c4136584 Merge branches 'iommu/fixes', 'arm/io-pgtable', 'arm/rockchip', 'arm/omap', 'x86/vt-d', 'x86/amd' and 'ppc/pamu' into next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA caching)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (78f3873decad Documentation: HOWTO: update git home URL in translations)
Merging trivial/for-next (dc5a533f9130 serial: mctrl_gpio: Grammar s/lines GPIOs/line GPIOs/, /sets/set/)
Merging audit/next (7ffb8e317bae audit: we don't need to __set_current_state(TASK_RUNNING))
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (ea9b269fa561 devicetree: bindings: designware-pcie: Fix unit address)
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (73218bcf0beb Merge remote-tracking branch 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (f135996c423a Merge branch 'locking/urgent')
CONFLICT (content): Merge conflict in drivers/cpufreq/longhaul.c
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (2364d423a7b3 ARM: socfpga: Enable Arria10 OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (d50c744ecde7 tracing: Fix unsigned comparison to zero in hist trigger code)
Merging rcu/rcu/next (dbfdcc6735f9 torture:  Break online and offline functions out of torture_onoff())
Merging kvm/linux-next (05b1159e641f Merge tag 'kvms390-20160420' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into next)
Merging kvm-arm/next (06a71a24bae5 arm64: KVM: unregister notifiers in hyp mode teardown path)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c87ff1433aca KVM: s390: add clear I/O irq operation for FLIC)
Merging xen-tip/linux-next (85d1a29de8e4 Xen on ARM and ARM64: update MAINTAINERS info)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (4f62568c1fcf fujitsu-laptop: Support radio LED)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (f15c65afddbe leds: ss4200: add DMI data for FSC SCALEO Home Server)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (5614e7725856 Merge 4.6-rc4 into driver-core-next)
Merging tty/tty-next (c3b46c73264b Linux 4.6-rc4)
Merging usb/usb-next (7ce04cff59d5 usb: wusbcore: remove unreachable code)
Merging usb-gadget/next (818ec3aba883 usb: dwc3: debugfs: dump out endpoint details)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/debugfs.c
Merging usb-serial/usb-next (bf1620068911 Linux 4.6-rc3)
Merging usb-chipidea-next/ci-for-usb-next (4e332df63487 usb: otg-fsm: support multiple instances)
Merging staging/staging-next (4145ba76b1f7 staging: unisys: visornic: prevent double-unlock of priv_lock)
Merging char-misc/char-misc-next (7553c7e68fd1 Merge 4.6-rc4 into char-misc-next)
Merging extcon/extcon-next (b5dbb9f57842 extcon: usb-gpio: Don't miss event during suspend/resume)
Merging cgroup/for-next (1a5fa50bb048 Merge branch 'for-4.6-ns' into for-next)
Merging scsi/for-next (0237d1ea51f0 pm80xx: Remove bogus address masking in pm8001_ioremap())
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (ca1c8b640fe8 Merge branch 'devel' into for-next)
Merging vhost/linux-next (c00bbcf86289 virtio: add VIRTIO_CONFIG_S_NEEDS_RESET device status bit)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (9735a22799b9 Linux 4.6-rc2)
Merging gpio/for-next (9c088f21bb5d Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (bb4399b8a5d7 Merge tag 'clk-renesas-for-v4.7-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-next)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (4fe83e63352a Merge branch 'for-4.7/livepatching-ppc64' into for-next)
Merging coresight/next (acb722ae5bf5 coresight: etb10: fixing the right amount of words to read)
Merging rtc/rtc-next (b93d68f0ebd5 rtc: sa1100: DT spelling s/interrupt-name/interrupt-names/)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a390180291dd libnvdimm, pfn: fix nvdimm_namespace_add_poison() vs section alignment)
Merging akpm-current/current (747220c26dd0 huge tmpfs: add shmem_pmd_fault())
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
Applying: Revert "huge tmpfs: add shmem_pmd_fault()"
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (761ff9422d77 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
