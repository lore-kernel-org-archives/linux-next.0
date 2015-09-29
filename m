From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 29
Date: Tue, 29 Sep 2015 15:27:06 +1000
Message-ID: <20150929152706.6cf59626@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56802 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752657AbbI2F1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Sep 2015 01:27:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150925:

The berlin tree lost its build failure.

I used the h8300 tree from next-20150828 since the current tree has been
rebased onto linux-next again :-(

The drm-intel tree gained conflicts against Linus' tree.

The drm-misc tree gained conflicts against the drm-intel tree.

The battery tree gained a build failure so I used the version from
next-20150925.

The pinctrl tree still had its build failure so I used the version from
next-20150924.

Non-merge commits (relative to Linus' tree): 2849
 2403 files changed, 129877 insertions(+), 38041 deletions(-)

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
(32 and 64 bit), ppc44x_defconfig and allyesconfig (this fails its final
link) and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 226 trees (counting Linus' and 33 trees of patches
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
Merging origin/master (3225031fbeb1 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (274e91b81ed2 ARM: alignment: fix alignment handling for uaccess changes)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (d6eb71a6d2ed cxl: Fix lockdep warning while creating afu_err_buff attribute)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (72521ea07c0a r8169: fix handling rtl_readphy result)
Merging ipsec/master (04a6b8bfee06 xfrm6: Fix ICMPv6 and MH header checks in _decode_session6)
Merging sound-current/for-linus (7f57d803ee03 ALSA: hda - Disable power_save_node for Thinkpads)
Merging pci-current/for-linus (de24c18c0fac PCI: rcar: Add R8A7794 support)
Merging wireless-drivers/master (76d164f58215 ath10k: fix DMA related firmware crashes on multiple devices)
Merging driver-core.current/driver-core-linus (2110d70c5e58 cpu/cacheinfo: Fix teardown path)
Merging tty.current/tty-linus (f7a7651fcd40 tty: serial: Add missing module license for 8250_base.ko)
Merging usb.current/usb-linus (b4731977243c MAINTAINERS: remove amd5536udc USB gadget driver maintainer)
Merging usb-gadget-fixes/fixes (9ffecb102835 Linux 4.3-rc3)
Merging usb-serial-fixes/usb-linus (19ab6bc5674a USB: option: add ZTE PIDs)
Merging staging.current/staging-linus (74c600e36455 MAINTAINERS: Update email address for Martyn Welch)
Merging char-misc.current/char-misc-linus (9ffecb102835 Linux 4.3-rc3)
Merging input-current/for-linus (d79bdc7f0044 Input: omap4-keypad - fix memory leak)
Merging crypto-current/master (09185e2756a8 hwrng: xgene - fix handling platform_get_irq)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (fb9caeedafe6 mfd: Remove MFD_CROS_EC_SPI depends on OF)
Merging drm-intel-fixes/for-linux-next-fixes (bc5f2ab11ca6 drm/i915/skl: Don't call intel_prepare_ddi when encoder list isn't yet initialized.)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging arm/for-next (22b7c00506d1 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (25c6651aa40f Merge branch 'fixes' into for-next)
Merging at91/at91-next (5ccea17e1ab3 Merge branch 'at91-4.4-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (db614c0f0e33 Merge branch 'berlin64/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (6f5c63262020 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (6fc43b806999 Merge branch 'for_4.4/config' into next)
Merging mvebu/for-next (adfc8c76d84a Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (9a5e3f27d1b8 ARM: dts: fix omap2+ address translation for pbias)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (0eac5ea05ecd Merge branch 'dts-for-4.3-rc2' into base-4.3-rc1)
Merging renesas/next (ab3ecbc2626a Merge branches 'heads/sh-drivers-for-v4.3', 'heads/defconfig-for-v4.4', 'heads/dt-for-v4.4' and 'heads/soc-for-v4.4' into next)
Merging rockchip/for-next (6ba6d4146d13 Merge branch 'v4.4-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (6d205db6e706 Merge branch 'v4.4-next/cpufreq-samsung' into for-next)
Merging samsung-krzk/for-next (b58ebcbed86d Merge branch 'defconfig-for-next' into for-next)
Merging sunxi/sunxi/for-next (1ca27e079283 Merge branches 'sunxi/clocks-for-4.4', 'sunxi/core-for-4.4', 'sunxi/defconfig-for-4.4' and 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (d27eb50227d8 Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (6ff33f3902c3 Linux 4.3-rc1)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (254a0f413548 CRISv10: delete unused lib/dmacopy.c)
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (a509af1245d8 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (c2659c5e37f9 Merge branch '4.3-fixes' into mips-for-linux-next)
CONFLICT (content): Merge conflict in arch/mips/mm/init.c
CONFLICT (content): Merge conflict in arch/mips/include/asm/mips-cm.h
Merging nios2/for-next (08441d462ebd nios2: add Max10 defconfig)
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (1f93e4a96c91 Linux 4.3-rc2)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (ec2934ec55e9 s390/diag: add tracepoint for diagnose calls)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (6ff33f3902c3 Linux 4.3-rc1)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (ff9f84b7d79d [SMB3] Missing null tcon check)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (9181f8bf5abf udf: Don't modify filesystem for read-only mounts)
Merging ext4/dev (bdfe0cbd746a Revert "ext4: remove block_device_ejected")
Merging f2fs/dev (45c3aaea8057 f2fs: should get a victim from retrials)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (6de20eb0dee4 GFS2: Set s_mode before parsing mount options)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (e3be4266d348 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging nfsd/nfsd-next (a909e9f9d73a nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (d9aa4e0bfb63 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (a4e2d5a00ede UBI: Validate data_size)
Merging xfs/for-next (1f93e4a96c91 Linux 4.3-rc2)
Merging file-locks/linux-next (128a37852234 fs: fix data races on inode->i_flctx)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (ebfc4df6bfc8 Merge branches 'pci/host-designware', 'pci/host-generic', 'pci/host-imx6', 'pci/host-rcar' and 'pci/host-tegra' into next)
Merging hid/for-next (7db4c819041a Merge branch 'for-4.4/wacom' into for-next)
Merging i2c/i2c/for-next (f5956abbe430 Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (91cec9604f54 hwmon: (abx500) drop the use of IRQF_NO_SUSPEND)
Merging v4l-dvb/master (41a8f406dacd Merge branch 'missed' into to_next)
CONFLICT (content): Merge conflict in mm/Makefile
Merging kbuild/for-next (a8503631df45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (0c0aa14964df Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (5d95ac8b1761 Merge branch 'pm-tools' into linux-next)
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (97584d1838b7 thermal: power_allocator: exit early if there are no cooling devices)
Merging thermal-soc/next (0b547eff7460 thermal: power_allocator: exit early if there are no cooling devices)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (80b7525c3713 Merge branch 'topic/ioatdma' into next)
Merging net-next/master (34c2d9fb0498 bridge: Allow forward delay to be cfgd when STP enabled)
Merging ipsec-next/master (e69948a0a530 net: Document xfrm4_gc_thresh and xfrm6_gc_thresh)
Merging wireless-drivers-next/master (8f6c5b079cb3 Merge tag 'iwlwifi-next-for-kalle-2015-09-21' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (a913718812d5 Bluetooth: hci_qca: Changed unsigned long to bool)
Merging rdma/for-next (64291f7db5bd Linux 4.2)
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (1bc81eeeba99 jffs2: remove unnecessary new_valid_dev check)
Merging crypto/master (97bce7e0b58d crypto: crc32c-pclmul - use .rodata instead of .rotata)
Merging drm/drm-next (73bf1b7be7aa Merge branch 'drm-next-4.3' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (590d5b04c315 drm/i915/gen8: Move WaHdcDisableFetchWhenMasked to common init fn)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_audio.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
Merging drm-tegra/drm/tegra/for-next (459cc2c6800b drm/tegra: sor: Add HDMI support)
Merging drm-misc/topic/drm-misc (cf6483050e9b drm/irq: Add drm_crtc_vblank_count_and_time())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_audio.c
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (0b2c8c12f929 Merge tag 'asoc-v4.3-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
Merging sound-asoc/for-next (a4bbc568cb2b Merge remote-tracking branch 'asoc/topic/rl6347a' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (2260c419b52b Input: db9 - use parallel port device model)
Merging block/for-next (f7e7868b4743 cdrom: Random writing support for BD-RE media)
Merging device-mapper/for-next (586b286b110e dm crypt: constrain crypt device's max_segment_size to PAGE_SIZE)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (b809d56d4962 mmc: sunxi: Add card busy detection)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4c34b5a1b2fd md/raid1: Avoid raid1 resync getting stuck)
Merging mfd/for-mfd-next (760212e1ca76 mfd: lpc_ich: Separate device cells for clarity)
Merging backlight/for-backlight-next (13d20b3b618a backlight: tosa: Export I2C module alias information)
Merging battery/master (9b1cf1e44d91 power: bq24257: Streamline input current limit setup)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (7b554088d56e video: fbdev: pxa168fb: Use devm_clk_get)
Merging regulator/for-next (8f81f50a9c8b Merge remote-tracking branches 'regulator/topic/pwm', 'regulator/topic/qcom-smd' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (07f081fb5057 PKCS#7: Add OIDs for sha224, sha284 and sha512 hash algos and use them)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (b21800f30439 selinux: do not check open perm on ftruncate call)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (55f1dfb398d9 watchdog: iTCO: Fix dependencies on I2C)
Merging iommu/next (4ad79562577a Merge branches 'arm/omap', 'arm/msm', 'arm/smmu', 'arm/tegra', 'x86/vt-d', 'x86/amd', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (b479bfd00e46 DocBook: Use a fixed encoding for output)
Merging trivial/for-next (e5f6450c3f40 MAINTAINERS: update my e-mail address)
Merging audit/next (e7d9764a515e audit: try harder to send to auditd upon netlink failure)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (a13f18f59d26 Documentation: arm: Fix typo in the idle-states bindings examples)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (3d75415c550b Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/stats' and 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (4da60d8fd6ff Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (4bd57fad4c2b Merge branch 'ras-for-4.4' into for-next)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b7dc42fd7939 ring-buffer: Revert "ring-buffer: Get timestamp after event is allocated")
Merging rcu/rcu/next (19a5ecde086a rcu: Suppress lockdep false positive for rcp->exp_funnel_mutex)
Merging kvm/linux-next (9bac175d8ed0 Revert "KVM: x86: zero kvmclock_offset when vcpu0 initializes kvmclock system MSR")
Merging kvm-arm/next (1f93e4a96c91 Linux 4.3-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (3eb4ee682542 KVM: PPC: Book3S: Take the kvm->srcu lock in kvmppc_h_logical_ci_load/store())
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (3e64472c1c74 xen: switch extra memory accounting to use pfns)
CONFLICT (content): Merge conflict in arch/x86/include/asm/xen/page.h
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (355c06633e23 workqueue: fix some docbook warnings)
Merging drivers-x86/for-next (8a1513b49321 hp-wmi: limit hotkey enable)
Merging chrome-platform/for-next (1d95e6f10fd8 platform/chrome: cros_ec: Fix possible leak in led_rgb_store())
Merging regmap/for-next (ee3d36ab7b94 Merge remote-tracking branches 'regmap/topic/atomic', 'regmap/topic/debugfs', 'regmap/topic/irq' and 'regmap/topic/irq-hdr' into regmap-next)
Merging hsi/for-next (c616ac28a5b3 HSI: Fix a typo)
Merging leds/for-next (18ce230f96e1 LED/MIPS: Move SEAD3 LED driver to where it belongs.)
Merging ipmi/for-next (f22b7d0682d3 char: ipmi: Move MODULE_DEVICE_TABLE() to follow struct)
Merging driver-core/driver-core-next (6ff33f3902c3 Linux 4.3-rc1)
Merging tty/tty-next (1f93e4a96c91 Linux 4.3-rc2)
Merging usb/usb-next (1f93e4a96c91 Linux 4.3-rc2)
Merging usb-gadget/next (9ffecb102835 Linux 4.3-rc3)
Merging usb-serial/usb-next (6ff33f3902c3 Linux 4.3-rc1)
Merging staging/staging-next (60d6a21b1ec2 Staging: rts5208: Coding style warnings fix for block comments)
Merging char-misc/char-misc-next (c566f365434e Merge 4.3-rc3 into char-misc-next)
Merging extcon/extcon-next (c02423f18c76 extcon: sm5502: fix handling regmap_irq_get_virq result)
Merging kdbus/kdbus (a36324913ff2 kdbus: selftests: add more name registry tests)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
Merging cgroup/for-next (a3e72739b7a7 cgroup: fix too early usage of static_branch_disable())
Applying: vmscan build fix
Merging scsi/for-next (294ab783ad98 scsi_dh: fix randconfig build error)
Merging target-updates/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (f6c804b08ca5 ARM: at91/dt: sama5d2: add pio controller node)
$ git reset --hard HEAD^
Merging next-20150924 version of pinctrl
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (46d4f7c25e1b gpio: omap: Fix GPIO numbering for deferred probe)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (a83a6a82250f pwm: atmel-hlcdc: Fix module autoload for OF platform driver)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (6f83d30a3708 Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (6ff33f3902c3 Linux 4.3-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (ce9478fdb6e0 coresight: etm3x: making error message unambiguous)
Merging rtc/rtc-next (ec7fe80d5f9e rtc: pcf2127: make module license match the file header)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (ae4f97696889 mm: fix type cast in __pfn_to_phys())
Merging akpm-current/current (a9614b88e7d0 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/vmscan.c
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
Applying: kernel.h: make abs() work with 64-bit types
Applying: Remove abs64()
Applying: remove-abs64-fix
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (79fb77307846 drivers/w1/w1_int.c: call put_device if device_register fails)
