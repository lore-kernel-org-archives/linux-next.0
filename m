From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 26
Date: Tue, 26 Apr 2016 17:21:02 +1000
Message-ID: <20160426172102.30e49f4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42903 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751195AbcDZHVG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 03:21:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160422:

New tree: kbuild-pitre

The arm-soc tree gained a build failure so I used the version from
next-20160422.

The pci tree lost its build failure but gained another for which I
applied a merg fix patch.

The pm tree gained a conflict against the renesas tree.

The net-next tree gained conflicts against the net tree.

The sound-asoc tree lost its build failure.

The block tree gained a build failure for which I reverted a commit from
the kbuild-pitre tree.

The xen-tip tree gained a conflict against the arm64 tree.

The akpm-current tree lost its build failures.

Non-merge commits (relative to Linus' tree): 5694
 5220 files changed, 216537 insertions(+), 110283 deletions(-)

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

I am currently merging 235 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (bcc981e9ed84 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging fixes/master (9735a22799b9 Linux 4.6-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (da67e68c0e46 Documentation: dt: arc: fix spelling mistakes)
Merging arm-current/fixes (ac36a881b72a ARM: 8564/1: fix cpu feature extracting helper)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update defconfigs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (4705e02498d6 powerpc: Update TM user feature bits in scan_features())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (5ec712934ce1 sparc: Write up preadv2/pwritev2 syscalls.)
Merging net/master (3d6d30d60abb cxgbi: fix uninitialized flowi6)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (bcf493428840 netfilter: ebtables: Fix extension lookup with identical name)
Merging wireless-drivers/master (e2841ea91611 Merge tag 'iwlwifi-for-kalle-2016-04-12_2' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (8f815cdde3e5 nl80211: check netlink protocol in socket release notification)
Merging sound-current/for-linus (3194ed497939 ALSA: hda - Fix possible race on regmap bypass flip)
Merging pci-current/for-linus (67e658794ca1 cxgb4: Set VPD size so we can read both VPD structures)
Merging driver-core.current/driver-core-linus (c3b46c73264b Linux 4.6-rc4)
Merging tty.current/tty-linus (02da2d72174c Linux 4.6-rc5)
Merging usb.current/usb-linus (02da2d72174c Linux 4.6-rc5)
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use-after-free)
Merging usb-serial-fixes/usb-linus (613ac23a46e1 USB: serial: cp210x: add Straizona Focusers device ids)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (bf1620068911 Linux 4.6-rc3)
Merging char-misc.current/char-misc-linus (c3b46c73264b Linux 4.6-rc4)
Merging input-current/for-linus (eb43335c4095 Input: atmel_mxt_ts - use mxt_acquire_irq in mxt_soft_reset)
Merging crypto-current/master (340ff60ae93a crypto: talitos - fix AEAD tcrypt tests)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the seccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (02da2d72174c Linux 4.6-rc5)
Merging asm-generic/master (987aedb5d6f6 generic syscalls: wire up preadv2 and pwritev2 syscalls)
Merging arc/for-next (767cb9d8abfa ARC: Add eznps platform to Kconfig and Makefile)
Merging arm/for-next (c6433ebdc184 Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose CHAIN event in sysfs)
Merging arm-soc/for-next (9c2c8a8d347c arm-soc: describe merges)
$ git reset --hard HEAD^
Merging next-20160422 version of arm-soc
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
Merging omap/for-next (e07d8e39370c Merge branch 'omap-for-v4.7/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (100b83d52f51 ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (864683ba2f65 Merge branches 'heads/arm64-defconfig-for-v4.7', 'heads/arm64-dt-pm-domain-for-v4.7' and 'heads/pci-defconfig-for-v4.7' into next)
Merging rockchip/for-next (0c5549bbea98 Merge branch 'v4.7-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (3aac939e7523 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (f1e9b6675c26 Merge branches 'sunxi/clocks-for-4.7', 'sunxi/dt-for-4.7' and 'sunxi/fixes-for-4.6' into sunxi/for-next)
Merging tegra/for-next (85eafb4bbfec Merge branch for-4.7/gpio into for-next)
Merging arm64/for-next/core (44dbcc93ab67 arm64: Fix behavior of maxcpus=N)
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
Merging mips/mips-for-linux-next (7620fecf8342 Merge branch '4.6-fixes' into mips-for-linux-next)
Merging nios2/for-next (8fe889274c7a nios2: Replace fdt_translate_address with of_flat_dt_translate_address)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolution sched_clock() implementation)
Merging powerpc/next (4aec6ec0da9c cxl: Increase timeout for detection of AFU mmio hang)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" flash compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (7072276e6c0e s390/Kconfig: make z196 the default processor type)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f98983bbba0d tile/defconfigs: Remove CONFIG_IPV6_PRIVACY)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi variant)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (e93ed1818f75 Merge branch 'for-next-4.6-20160425' into for-next-20160425)
CONFLICT (content): Merge conflict in fs/btrfs/volumes.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (bdb7c4952bf3 rbd: report unsupported features to syslog)
Merging cifs/for-next (2b6c3239da3f cifs: remove any preceding delimiter from prefix_path)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (8f9e8f5fcc05 ocfs2: Fix Q_GETNEXTQUOTA for filesystem without quotas)
Merging ext4/dev (86cf0011caf3 ext4: allow readdir()'s of large empty directories to be interrupted)
Merging f2fs/dev (4da7bf5a4345 f2fs: remove redundant condition check)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (2c932d4c9165 fuse: Fix return value from fuse_get_user_pages())
Merging gfs2/for-next (9c7fe83530a3 GFS2: Add calls to gfs2_holder_uninit in two error handlers)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (02da2d72174c Linux 4.6-rc5)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variable)
Merging overlayfs/overlayfs-next (e3608e3f68f6 Btrfs: fix crash/invalid memory access on fsync when using overlayfs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (489eda8cd1a6 Merge branches 'work.acl', 'work.const-path' and 'work.misc' into for-next)
Merging pci/next (a8dd1a5cd502 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-mvebu' and 'pci/host-vmd' into next)
Applying: iommu/amd: fix up for aliases API change
Merging hid/for-next (e686a7d8e470 Merge branch 'for-4.6/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (408c91ad9d33 Merge branch 'i2c/for-4.7' into i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (71a9c23246fe hwmon: (it87) Add support for IT8628E)
Merging v4l-dvb/master (dcb7c0b9e2ad Merge branch 'patchwork' into to_next)
Merging libata/for-next (c5cf484d03f1 Merge branch 'for-4.6-fixes' into for-next)
Merging pm/linux-next (899566da44ee Merge branch 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/Makefile
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (81ad4276b505 Thermal: Ignore invalid trip points)
Merging thermal-soc/next (9fe6d7e1417e Merge branch 'work-fixes' into work-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (1338727bc468 Merge branch 'topic/bcm' into next)
Merging net-next/master (5a5f0792e98b Merge branch 'pskb_extract')
CONFLICT (content): Merge conflict in net/ipv6/addrconf.c
CONFLICT (content): Merge conflict in include/linux/ipv6.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (8fb04d9fc70a ipvs: don't alter conntrack in OPS mode)
Merging wireless-drivers-next/master (06d05463ee33 rtl8xxxu: hide unused tables)
Merging bluetooth/master (55441070ca1c Bluetooth: 6lowpan: Fix memory corruption of ipv6 destination address)
Merging mac80211-next/master (81948527fce5 cfg80211: Add option to report the bss entry in connect result)
Merging rdma/for-next (520a07bff6fb Merge branches 'i40iw', 'sriov' and 'hfi1' into k.o/for-4.6)
Merging rdma-leon/rdma-next (c3b46c73264b Linux 4.6-rc4)
Merging rdma-leon-test/testing/rdma-next (c3b46c73264b Linux 4.6-rc4)
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement in nand_scan)
Merging l2-mtd/master (08922f644878 mtd: devices: m25p80: add support for mmap read request)
Merging nand/nand/next (5c62c5614bd1 mtd: mtd: drop NAND_ECC_SOFT_BCH enum value)
Merging crypto/master (79152e8d085f crypto: s5p-sss - Fix missed interrupts when working with 8 kB blocks)
Merging drm/drm-next (027b3f8ba927 drm/modes: stop handling framebuffer special)
Merging drm-panel/drm/panel/for-next (1ac3bac7c733 drm/panel: simple: Add support for Innolux AT070TN92)
Merging drm-intel/for-linux-next (ff5ec22dad15 drm/i915: Simplify i915_gem_obj_ggtt_bound_view)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
Merging drm-tegra/drm/tegra/for-next (3a9b33c6048a drm/tegra: Don't set a gamma table size)
Merging drm-misc/topic/drm-misc (5ff18e42ddfd MAINTAINERS: Update the files list for the GMA500 DRM driver)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an error code)
Merging drm-vc4/drm-vc4-next (5883980313af drm/vc4: Fix NULL deref in HDMI init error path)
Merging kbuild/for-next (4bf284b27780 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kbuild-pitre/kbuild (089095b8eef9 kbuild: better abstract vmlinux sequential prerequisites)
Merging kconfig/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging regmap/for-next (8eabbbb9c0c9 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (8d84c1973b69 ALSA: doc: fix spelling mistakes)
Merging sound-asoc/for-next (304d8d26825f Merge remote-tracking branches 'asoc/topic/wm8960' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (13771c666003 module: Issue warnings when tainting kernel)
Merging input/next (9e4cc255e6e1 Input: twl6040-vibra - remove mutex)
Merging block/for-next (e518fbe9ab03 Merge branch 'for-4.7/drivers' into for-next)
Applying: Revert "kbuild: better abstract vmlinux sequential prerequisites"
Merging device-mapper/for-next (3ff6a535b994 dm mpath: eliminate use of spinlock in IO fast-paths)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (00c479a5ba11 mmc: block: Convert to IDA for partition device indexes)
Merging md/for-next (9c573de3283a MD: make bio mergeable)
Merging mfd/for-mfd-next (ba5776ab6f09 mfd: cros_ec: Allow building for ARM64)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when battery charging near dry)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (e9eedc5a932c Merge remote-tracking branches 'regulator/topic/s2mps11', 'regulator/topic/supply', 'regulator/topic/tps6524x' and 'regulator/topic/twl' into regulator-next)
Merging security/next (9b091556a073 LSM: LoadPin for kernel file loading restrictions)
Merging integrity/next (f5f8f020b2da ima: add support for creating files using the mknodat syscall)
Merging keys/keys-next (1ea6102bba5f Merge branch 'keys-trust' into keys-next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_parser.c
Merging selinux/next (1ac42476263e selinux: check ss_initialized before revalidating an inode label)
Merging tpmdd/next (0c61500a7f09 tpm/st33zp24: Remove unneeded tpm_reg in get_burstcount)
Merging watchdog/master (d1ed3ba4e3d7 watchdog: Ensure that wdd is not dereferenced if NULL)
Merging iommu/next (1229bc9a9973 Merge branches 'iommu/fixes', 'arm/io-pgtable', 'arm/rockchip', 'arm/omap', 'x86/vt-d', 'ppc/pamu' and 'x86/amd' into next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA caching)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (78f3873decad Documentation: HOWTO: update git home URL in translations)
Merging trivial/for-next (dc5a533f9130 serial: mctrl_gpio: Grammar s/lines GPIOs/line GPIOs/, /sets/set/)
Merging audit/next (7ffb8e317bae audit: we don't need to __set_current_state(TASK_RUNNING))
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (1c986e3643d2 of: document refcount incrementation of of_get_cpu_node())
Merging mailbox/mailbox-for-next (aca04ce5dbda Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging spi/for-next (dbf5c0531d71 Merge remote-tracking branches 'spi/topic/pic32-qspi', 'spi/topic/pxa2xx' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (388797294512 Merge branch 'WIP.futex')
CONFLICT (content): Merge conflict in drivers/cpufreq/longhaul.c
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c5fb04cc96c1 ARM: socfpga: Initialize Arria10 OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (d50c744ecde7 tracing: Fix unsigned comparison to zero in hist trigger code)
Merging rcu/rcu/next (b862e9441a9c documentation: ACQUIRE applies to loads, RELEASE applies to stores)
Merging kvm/linux-next (05b1159e641f Merge tag 'kvms390-20160420' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into next)
Merging kvm-arm/next (02e0b7600f83 arm64: kvm: Add support for 16K pages)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c87ff1433aca KVM: s390: add clear I/O irq operation for FLIC)
Merging xen-tip/linux-next (3a61cfdd47c4 xen/x86: don't lose event interrupts)
CONFLICT (content): Merge conflict in arch/arm64/kernel/setup.c
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (22aceb317678 workqueue: Fix comment for work_on_cpu())
Merging drivers-x86/for-next (19d46ee1aec0 asus-laptop: correct error handling in sysfs_acpi_set)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (f15c65afddbe leds: ss4200: add DMI data for FSC SCALEO Home Server)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (5614e7725856 Merge 4.6-rc4 into driver-core-next)
Merging tty/tty-next (02da2d72174c Linux 4.6-rc5)
Merging usb/usb-next (69b4269eff5f Merge 4.6-rc5 into usb-next)
Merging usb-gadget/next (a2eb431fbd5c usb: dwc3: ep0: sanity check test mode selector)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/debugfs.c
Merging usb-serial/usb-next (8c34d82e9dc6 USB: serial: use IS_ENABLED() instead of checking for FOO || FOO_MODULE)
Merging usb-chipidea-next/ci-for-usb-next (4e332df63487 usb: otg-fsm: support multiple instances)
Merging staging/staging-next (4145ba76b1f7 staging: unisys: visornic: prevent double-unlock of priv_lock)
Merging char-misc/char-misc-next (7553c7e68fd1 Merge 4.6-rc4 into char-misc-next)
Merging extcon/extcon-next (453fc627c7b5 extcon: usb-gpio: add support for ACPI gpio interface)
Merging cgroup/for-next (e0f00aff2dcc Merge branch 'for-4.6-fixes' into for-next)
Merging scsi/for-next (0237d1ea51f0 pm80xx: Remove bogus address masking in pm8001_ioremap())
Merging target-updates/for-next (5e47f1985d71 target: Fix target_release_cmd_kref shutdown comp leak)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging pinctrl/for-next (1f5d93d96b06 Merge branch 'devel' into for-next)
Merging vhost/linux-next (c00bbcf86289 virtio: add VIRTIO_CONFIG_S_NEEDS_RESET device status bit)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (9735a22799b9 Linux 4.6-rc2)
Merging gpio/for-next (9c088f21bb5d Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (58657d189a2f Merge branch 'clk-hw-register' (early part) into clk-next)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (4fe83e63352a Merge branch 'for-4.7/livepatching-ppc64' into for-next)
Merging coresight/next (b761fcde1231 coresight: etm4x: add tracer ID for A72 Maia processor.)
Merging rtc/rtc-next (820c5327d631 rtc: ds3232: fix call trace when rtc->ops_lock is used as NULL)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (a390180291dd libnvdimm, pfn: fix nvdimm_namespace_add_poison() vs section alignment)
Merging akpm-current/current (b45cf173932e ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Applying: mm-rename-_count-field-of-the-struct-page-to-_refcount-fix6
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (b1cf656a1fba drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
