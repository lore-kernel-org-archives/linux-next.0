From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 7
Date: Wed, 7 Oct 2015 17:08:25 +1100
Message-ID: <20151007170825.15b81476@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40411 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751586AbbJGGI1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 02:08:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151006:

I used the h8300 tree from next-20150828 since the current tree has been
rebased onto linux-next again :-(

The net-next tree lost its build failure.

The battery tree still had its build failure so I used the version from
next-20150925.

The xen-tip tree gained a conflict against Linus' tree.

The target-updates tree gained a build failure for which I reverted
a commit.

The akpm tree lost its build failure, gained conflicts against the usb and
driver-core trees and lost a couple of patches that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 5470
 4409 files changed, 224081 insertions(+), 94212 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64,
a multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), it is also built with powerpc allnoconfig
(32 and 64 bit), ppc44x_defconfig, allyesconfig (this fails its final
link) and pseries_le_defconfig and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 228 trees (counting Linus' and 34 trees of patches
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
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (f6702681a0af Merge tag 'for-linus-4.3b-rc4-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (868e87ccda24 ARM: make RiscPC depend on MMU)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (5f81b95fe2a2 cxl: fix leak of ctx->mapping when releasing kernel API contexts)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (855591d2f7d1 amd-xgbe: Check for successful buffer allocation before use)
Merging ipsec/master (4e077237cfb6 xfrm: Fix state threshold configuration from userspace)
Merging ipvs/master (6ece90f9a13e netfilter: fix Kconfig dependencies for nf_dup_ipv{4,6})
Merging sound-current/for-linus (225db5762dc1 ALSA: synth: Fix conflicting OSS device registration on AWE32)
Merging pci-current/for-linus (de24c18c0fac PCI: rcar: Add R8A7794 support)
Merging wireless-drivers/master (54328e64047a rtlwifi: rtl8821ae: Fix system lockups on boot)
Merging driver-core.current/driver-core-linus (9ffecb102835 Linux 4.3-rc3)
Merging tty.current/tty-linus (0c5562716787 drivers/tty: require read access for controlling terminal)
Merging usb.current/usb-linus (72194739f546 usb: Add device quirk for Logitech PTZ cameras)
Merging usb-gadget-fixes/fixes (f5f6afa85aa8 usb: renesas_usbhs: Add support for R-Car H3)
Merging usb-serial-fixes/usb-linus (19ab6bc5674a USB: option: add ZTE PIDs)
Merging staging.current/staging-linus (b1d562acc78f staging: speakup: fix speakup-r regression)
Merging char-misc.current/char-misc-linus (41ada9df7f34 mcb: Fix error handling in mcb_pci_probe())
Merging input-current/for-linus (62d784614471 Revert "Input: synaptics - fix handling of disabling gesture mode")
Merging crypto-current/master (09185e2756a8 hwrng: xgene - fix handling platform_get_irq)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (049e6dde7e57 Linux 4.3-rc4)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging arm/for-next (d12fad0e3b19 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (3eedf0e8b201 arm-soc: document merges)
Merging at91/at91-next (5ccea17e1ab3 Merge branch 'at91-4.4-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (99c5d7234cf2 Merge branch 'berlin64/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e82731e47607 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (afef8d3343d1 Merge branch 'for_4.4/dts' into next)
Merging mvebu/for-next (790f485f2afa Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (9a5e3f27d1b8 ARM: dts: fix omap2+ address translation for pbias)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (0eac5ea05ecd Merge branch 'dts-for-4.3-rc2' into base-4.3-rc1)
Merging renesas/next (1f8d69d53275 Merge branch 'heads/dt-for-v4.4' into next)
Merging rockchip/for-next (6ba6d4146d13 Merge branch 'v4.4-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (acf92fee9a9b Merge branch 'v4.4-next/dt-samsung' into for-next)
Merging samsung-krzk/for-next (52265cb1da16 Merge branch 'defconfig-for-next' into for-next)
Merging sunxi/sunxi/for-next (a3dbb527644b Merge branch 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (84529095fefd Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (6ff33f3902c3 Linux 4.3-rc1)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (d81a922cf21f CRIS: Drop code related to obsolete or unused kconfigs)
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (a509af1245d8 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (bdb232890472 Merge branch '4.3-fixes' into mips-for-linux-next)
Merging nios2/for-next (8840da98bfec nios2: Switch to generic __xchg())
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (2adc48a69186 powerpc: Add ppc64le_defconfig)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (2130eeefadb5 s390/sclp: avoid merged message output)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (dfd51f97823e tile/jump_label: add jump label support for TILE-Gx)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (616a5399b8f1 [CIFS] Update cifs version number)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (36086d43f657 ext4 crypto: fix bugs in ext4_encrypted_zeroout())
Merging f2fs/dev (464c2b76e1a2 f2fs: introduce a periodic checkpoint flow)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (491e94f79098 gfs2: Add missing else in trans_add_meta/data)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (8dbb09570d16 Merge tag 'nfs-rdma-for-4.3-2' of git://git.linux-nfs.org/projects/anna/nfs-rdma)
Merging nfsd/nfsd-next (a948dbb08404 nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (548049495cb4 Orangefs: fix some checkpatch.pl complaints that had creeped in.)
Merging overlayfs/overlayfs-next (d9aa4e0bfb63 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (1cb8f9776c7d ubi: fastmap: Implement produce_free_peb())
Merging xfs/for-next (1f93e4a96c91 Linux 4.3-rc2)
Merging file-locks/linux-next (128a37852234 fs: fix data races on inode->i_flctx)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (ebfc4df6bfc8 Merge branches 'pci/host-designware', 'pci/host-generic', 'pci/host-imx6', 'pci/host-rcar' and 'pci/host-tegra' into next)
Merging hid/for-next (369032a61d65 Merge branch 'for-4.3/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f5956abbe430 Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (91cec9604f54 hwmon: (abx500) drop the use of IRQF_NO_SUSPEND)
Merging v4l-dvb/master (41a8f406dacd Merge branch 'missed' into to_next)
CONFLICT (content): Merge conflict in mm/Makefile
Merging kbuild/for-next (a8503631df45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (75458f95afed Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (b45f7304c0b3 Merge branch 'pm-sleep' into linux-next)
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (97584d1838b7 thermal: power_allocator: exit early if there are no cooling devices)
Merging thermal-soc/next (b840b6e65cbe thermal: ti-soc-thermal: add OMAP36xx support)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (e1ec9fcc7fa5 Merge branches 'topic/dw', 'topic/idma', 'topic/ioatdma' and 'topic/of' into next)
Merging net-next/master (21c4c073f145 Revert "regmap: Allow installing custom reg_update_bits function")
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
CONFLICT (content): Merge conflict in net/ipv4/inet_connection_sock.c
CONFLICT (content): Merge conflict in drivers/net/usb/asix_common.c
Merging ipsec-next/master (c386578f1cdb xfrm: Let the flowcache handle its size by default.)
Merging ipvs-next/master (b59f2e31b8ab ipvs: Don't protect ip_vs_addr_is_unicast with CONFIG_SYSCTL)
Merging wireless-drivers-next/master (f79683ded69a Merge ath-next from ath.git)
Merging bluetooth/master (8af9da1ab784 Bluetooth: btbcm: Read the local name in setup stage)
Merging rdma/for-next (070b39972320 IB/mlx4: Report checksum offload cap for RAW QP when query device)
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (eb042ec35956 jffs2: fix a memleak in read_direntry())
Merging crypto/master (9196d9676fe7 crypto: qat - remove unneeded variable)
Merging drm/drm-next (d4070ff71363 Merge tag 'drm-intel-next-2015-09-11' of git://anongit.freedesktop.org/drm-intel into drm-next)
Applying: drm/fb-helper: merge fix for "Use -errno return in restore_mode_unlocked"
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (dcf07a2b492b drm/i915: shrinker_control->nr_to_scan is now unsigned long)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
Merging drm-tegra/drm/tegra/for-next (3fe2c7d4c85b gpu: host1x: Fix MLOCK's debug info)
Merging drm-misc/topic/drm-misc (88e72717c2de drm/irq: Use unsigned int pipe in public API)
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (a04267fd87b6 ALSA: hdac: Fix to check if stream not in use in release)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_audio.c
Merging sound-asoc/for-next (31d3483d81c2 Merge remote-tracking branches 'asoc/topic/sunxi' and 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (c7efd123500b Input: add support for ROHM BU21023/24 touchscreen)
Merging block/for-next (f7e7868b4743 cdrom: Random writing support for BD-RE media)
CONFLICT (content): Merge conflict in drivers/block/loop.c
Applying: blk-mq: merge fix for "fix racy updates of rq->errors"
Merging device-mapper/for-next (30c2a1faaeb3 dm ioctl: use kvfree() in free_params())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (9e3120f6a43d mmc: sirf: fix the capbility to support DDR50)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (6f5ac9a5bc8a md-cluster: send BITMAP_NEEDS_SYNC when node is leaving cluster)
Merging mfd/for-mfd-next (006d2c2a7105 mfd: atmel-flexcom: Add a driver for Atmel Flexible Serial Communication Unit)
Merging backlight/for-backlight-next (7111c6c672fc backlight: adp8870: Remove unnecessary MODULE_ALIAS())
Merging battery/master (6169588f69f8 Documentation: power: bq24257: Document exported sysfs entries)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (6a5e3bd0c8bc tridentfb: Add DDC support)
Merging regulator/for-next (494fa9126950 Merge remote-tracking branches 'regulator/topic/qcom-smd', 'regulator/topic/supply', 'regulator/topic/tps6105x' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (049e6dde7e57 Linux 4.3-rc4)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (db73b9d316b6 selinux: ioctl_has_perm should be static)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (55f1dfb398d9 watchdog: iTCO: Fix dependencies on I2C)
Merging iommu/next (eea87ff7bd44 Merge branches 'iommu/fixes', 'x86/amd' and 'x86/vt-d' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (b479bfd00e46 DocBook: Use a fixed encoding for output)
Merging trivial/for-next (0c6cac7ab444 hwmon: applesmc: fix comment typos)
Merging audit/next (fdccf5752869 audit: audit_tree_match can be boolean)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (a13f18f59d26 Documentation: arm: Fix typo in the idle-states bindings examples)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (5e8701432370 Merge remote-tracking branch 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (c7fb3fd8c115 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/arm64/kernel/acpi.c
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (df77345c5394 Merge branch 'edac-for-4.4' into for-next)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (37aea98b84c0 tracing: Add trace options for tracer options to instances)
Merging rcu/rcu/next (7afa512b9fb6 rcutorture: Default grace period to three minutes, allow override)
Merging kvm/linux-next (b7d2063177a5 iommu/vt-d: Add a command line parameter for VT-d posted-interrupts)
Merging kvm-arm/next (1f93e4a96c91 Linux 4.3-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (3eb4ee682542 KVM: PPC: Book3S: Take the kvm->srcu lock in kvmppc_h_logical_ci_load/store())
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (5edf7648b4d0 xen/swiotlb: Add support for 64KB page granularity)
CONFLICT (content): Merge conflict in arch/x86/xen/p2m.c
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (874bbfe600a6 workqueue: make sure delayed work run in local cpu)
Merging drivers-x86/for-next (8a1513b49321 hp-wmi: limit hotkey enable)
Merging chrome-platform/for-next (1d95e6f10fd8 platform/chrome: cros_ec: Fix possible leak in led_rgb_store())
Merging regmap/for-next (370f4455d3bb Merge remote-tracking branches 'regmap/topic/atomic', 'regmap/topic/debugfs', 'regmap/topic/irq', 'regmap/topic/irq-hdr' and 'regmap/topic/update-offload' into regmap-next)
Merging hsi/for-next (d9cb7d74c479 hsi: fix double kfree)
Merging leds/for-next (18ce230f96e1 LED/MIPS: Move SEAD3 LED driver to where it belongs.)
Merging ipmi/for-next (f22b7d0682d3 char: ipmi: Move MODULE_DEVICE_TABLE() to follow struct)
Merging driver-core/driver-core-next (dbe2256ddd8e driver-core: platform: Provide helpers for multi-driver modules)
Merging tty/tty-next (1a76eb5b0406 Documentation: improve line discipline method descriptions)
Merging usb/usb-next (d5f9e73309b7 USB: u132-hcd: Fix seperate word in printk message)
Merging usb-gadget/next (ec1f9d9f0138 usb: dwc2: gadget: parity fix in isochronous mode)
Merging usb-serial/usb-next (6ff33f3902c3 Linux 4.3-rc1)
Merging staging/staging-next (d3337eb1e113 vme: tsi148: silence uninitialized variable warning)
Merging char-misc/char-misc-next (c39b7eef7d92 Merge 4.3-rc4 into char-misc-next)
Merging extcon/extcon-next (de992acb93df extcon: gpio: Use descriptor-based GPIO interface instead of legacy gpio_* API)
Merging kdbus/kdbus (fc87a0ace7e3 kdbus: create /sys/fs/kdbus with sysfs_create_mount_point())
Merging cgroup/for-next (a3e72739b7a7 cgroup: fix too early usage of static_branch_disable())
Applying: vmscan build fix
Merging scsi/for-next (1378889c563a scsi_dh: Use the correct module name when loading device handler)
Merging target-updates/for-next (f71933438300 configfs: remove old API)
CONFLICT (content): Merge conflict in samples/Makefile
Applying: Revert "configfs: remove old API"
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (0254cb138f0e Merge branch 'devel' into for-next)
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (2db8aba860c7 gpio: pca953x: Add TI TCA9539 support)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (7e3b7dc76c41 pwm: Add MediaTek display PWM driver support)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (e9edd2cd421f Add driver for the si514 clock generator chip)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (e2343596c9d6 selftests/pstore: add pstore test scripts going with reboot)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (ce9478fdb6e0 coresight: etm3x: making error message unambiguous)
Merging rtc/rtc-next (0c155bd0c179 rtc: stmp3xxx: unify register access macros)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (ae4f97696889 mm: fix type cast in __pfn_to_phys())
Merging akpm-current/current (c3a0c7301db7 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/failslab.c
CONFLICT (content): Merge conflict in drivers/usb/host/u132-hcd.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
Applying: mips: add entry for new mlock2 syscall
Applying: sparc/sparc64: allocate sys_membarrier system call number
Applying: kernel.h: make abs() work with 64-bit types
Applying: Remove abs64()
Applying: remove-abs64-fix
Applying: remove-abs64-fix-fix
Applying: Documentation/sysctl/vm.txt: fix misleading code reference of overcommit_memory
Applying: pcnet32: use pci_set_dma_mask insted of pci_dma_supported
Applying: tw68-core: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7164: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7134: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx88: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx25821: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx23885: use pci_set_dma_mask insted of pci_dma_supported
Applying: netup_unidvb: use pci_set_dma_mask insted of pci_dma_supported
Applying: nouveau: don't call pci_dma_supported
Applying: sfc: don't call dma_supported
Applying: kaweth: remove ifdefed out call to dma_supported
Applying: usbnet: remove ifdefed out call to dma_supported
Applying: pci: remove pci_dma_supported
Applying: dma: remove external references to dma_supported
Applying: modpost: add flag -E for making section mismatches fatal
Applying: drivers/scsi/cxgbi: fix build with EXTRA_CFLAGS
Merging akpm/master (8e3ee384efc2 drivers/scsi/cxgbi: fix build with EXTRA_CFLAGS)
