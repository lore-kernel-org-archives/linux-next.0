From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 3
Date: Wed, 3 Feb 2016 16:18:11 +1100
Message-ID: <20160203161811.621b399a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48357 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750841AbcBCFSN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Feb 2016 00:18:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160202:

The btrfs-kdave lost its build failure.

The tip tree gained a conflict against Linus' tree.

The gpio tree still had its build failure so I used the version from
next-20160128.

The aio tree still had a build failure so I used the version from
next-20160111.

The akpm-current tree gained 2 build failures for which I applied patches.

Non-merge commits (relative to Linus' tree): 2118
 2062 files changed, 79203 insertions(+), 35125 deletions(-)

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

I am currently merging 239 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (34229b277480 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fixes/master (92e963f50fc7 Linux 4.5-rc1)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (03590cb56d5d ARM: wire up copy_file_range() syscall)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (19f97c983071 powerpc/book3s_32: Fix build error with checkpoint restart)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (ca0bb0798022 Add sun4v_wdt watchdog driver)
Merging net/master (34229b277480 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (b16c29191dc8 netfilter: nf_conntrack: use safer way to lock all buckets)
Merging wireless-drivers/master (f9ead9beef3f Merge tag 'iwlwifi-for-kalle-2016-01-26_2' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (212c5a5e6ba6 mac80211: minstrel: Change expected throughput unit back to Kbps)
Merging sound-current/for-linus (c985b6bea858 ALSA: timer: Sync timer deletion at closing the system timer)
Merging pci-current/for-linus (d251cba56086 Merge branch 'pci/host-synopsys' into for-linus)
Merging driver-core.current/driver-core-linus (36f90b0a2ddd Linux 4.5-rc2)
Merging tty.current/tty-linus (36f90b0a2ddd Linux 4.5-rc2)
Merging usb.current/usb-linus (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-gadget-fixes/fixes (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-serial-fixes/usb-linus (4152b387da81 USB: option: fix Cinterion AHxx enumeration)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (5982557ac6ee Merge tag 'iio-fixes-for-4.5b' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (92e963f50fc7 Linux 4.5-rc1)
Merging input-current/for-linus (d4f1b06d685d Input: vmmouse - fix absolute device registration)
Merging crypto-current/master (49a20454e0eb crypto: atmel-aes - remove calls of clk_prepare() from atomic contexts)
Merging ide/master (e04a2bd6d8c9 drivers/ide: make ide-scan-pci.c driver explicitly non-modular)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (16ab8a5cbea4 vfio/noiommu: Don't use iommu_present() to track fake groups)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (f2e305108fab drm/i915: refine qemu south bridge detection)
Merging asm-generic/master (040b323b5012 ARM: asm/div64.h: adjust to generic codde)
Merging arc/for-next (4d0cb15fccd1 ARCv2: Check for LL-SC livelock only if LLSC is enabled)
Merging arm/for-next (d202f6d5c8d4 Merge branches 'component', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (92e963f50fc7 Linux 4.5-rc1)
Merging arm-soc/for-next (b7a2500e7bcc ARM: SoC: Document merges)
Merging at91/at91-next (8129febb508f ARM: dts: at91: at91sam9n12ek: fix panel compatible string)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (92e963f50fc7 Linux 4.5-rc1)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (5a2565fb7d09 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (29254df58a17 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (d56817ce2533 Merge branch 'omap-for-v4.6/dt' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (2ccea21d797f ARM: qcom: Drop ARCH_MSM* configs)
Merging renesas/next (23598a7eb9c6 Merge branches 'heads/arm64-dt-for-v4.6', 'heads/cleanup-for-v4.6', 'heads/defconfig-for-v4.6' and 'heads/dt-for-v4.6' into next)
Merging rockchip/for-next (5065f2e47c97 Merge branch 'v4.6-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (d8df9caf3840 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (43d64d5e1bf5 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/core-for-4.6', 'sunxi/drivers-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (1f6aa48ccf7d Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (2a803c4db615 arm64: head.S: use memset to clear BSS)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (2f1b0077a960 h8300: System call entry enable interrupt.)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (a9c9d9aca4e7 zorro: Use kobj_to_dev())
Merging m68knommu/for-next (354b18b512ed m68knommu: fix FEC platform device registration when driver is modular)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (a13d2abd8e61 MIPS: highmem: Turn flush_cache_kmaps into a no-op.)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (92e963f50fc7 Linux 4.5-rc1)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (684c4c448637 s390/pci: remove pdev pointer from arch data)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f1c3418ed4e6 tile kgdb: fix bug in copy to gdb regs, and optimize memset)
Merging uml/linux-next (288b31a382d2 um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (988f1f576d4f Merge branch 'for-chris-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.5)
Merging btrfs-kdave/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging ceph/master (7e01726a6853 libceph: remove outdated comment)
Merging cifs/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (bb00c898ad1c udf: Check output buffer length when converting name to CS0)
Merging ext4/dev (68ce7bfcd995 fs: clean up the flags definition in uapi/linux/fs.h)
Merging f2fs/dev (a7d30dc25554 f2fs: use wait_for_stable_page to avoid contention)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (feb6c454e087 GFS2: Fix direct IO write rounding error)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (2370abdab530 NFS: Cleanup - rename NFS_LAYOUT_RETURN_BEFORE_CLOSE)
Merging nfsd/nfsd-next (ee2bf98bbe90 NFSv4: fix getacl ERANGE for some ACL buffer sizes)
Merging orangefs/for-next (115b93a8595c orangefs: clean up op_alloc())
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging file-locks/linux-next (b4d629a39e10 locks: rename __posix_lock_file to posix_lock_inode)
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (92e963f50fc7 Linux 4.5-rc1)
Merging hid/for-next (ff4497a591fe Merge branch 'for-4.6/upstream' into for-next)
Merging i2c/i2c/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (972d7d17b6bb hwmon: Add LTC2990 sensor driver)
Merging v4l-dvb/master (fa3bddf573fc Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (9a32a6fc5ed0 Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (8eee1d3ed5b6 libata: fix sff host state machine locking while polling)
Merging pm/linux-next (2c42c462e447 Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (98d94507e10c Merge branches 'thermal-intel', 'thermal-suspend-fix' and 'thermal-soc' into next)
Merging thermal-soc/next (ce0265dd6f8e thermal: trip_point_temp_store() calls thermal_zone_device_update())
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (ee9fe0d24161 Merge branch 'fixes' into next)
Merging net-next/master (b45efa30a626 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (6709d1f4ece5 netfilter: ipvs/SIP: handle ip_vs_fill_iph_skb_off failure)
Merging wireless-drivers-next/master (a92277bc3bfe mwifiex: use SYNC flag for canceling host sleep)
Merging bluetooth/master (9a6a1c77e1fc Bluetooth: Use managed version of led_trigger_register in LED trigger)
Merging mac80211-next/master (bb48506ee4a2 cfg80211: add support for non-linear skbs in ieee80211_amsdu_to_8023s)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
Merging rdma/for-next (34356f64ac0d IB/mlx5: Unify CQ create flags check)
Merging mtd/master (9146cbd52b11 mtd: jz4780_nand: replace if/else blocks with switch/case)
Merging l2-mtd/master (ed4eeba7338b driver/memory: Removal of deprecated NO_IRQ)
Merging crypto/master (2b8b28fd2322 crypto: keywrap - memzero the correct memory)
Merging drm/drm-next (1df59b8497f4 Merge tag 'drm-intel-next-fixes-2016-01-14' of git://anongit.freedesktop.org/drm-intel into drm-next)
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (e1ea07542352 drm/i915/bxt: Don't save/restore eDP panel power during suspend (v3))
Merging drm-tegra/drm/tegra/for-next (d50bbe33efb5 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (15b6b804b6e4 drm/vmwgfx: fix a NULL dereference)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (40eb4e27aa20 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (5645e785cea2 drm/vc4: fix an error code)
Merging sound/for-next (549ab4784bca ALSA: dummy: Implement timer backend switching more safely)
Merging sound-asoc/for-next (83d957b69fb9 Merge remote-tracking branches 'asoc/topic/rt5616', 'asoc/topic/rt5659', 'asoc/topic/samsung', 'asoc/topic/ssm4567' and 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging input/next (98ee37714493 Input: byd - add BYD PS/2 touchpad driver)
Merging block/for-next (bb1192dd3fad Merge branch 'for-4.5/drivers' into for-next)
Merging device-mapper/for-next (385277bfb57f dm snapshot: fix hung bios when copy error occurs)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (582716780cae mmc: tmio: disable clock before changing it)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (fc2561ec0afc md-cluster: delete useless code)
Merging mfd/for-mfd-next (5ae2c86a88fb mfd: lpss: Add PCI IDs for Intel Broxton B-Step platform)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (265b60497a57 power: bq27xxx_battery: Fix bq27541 AveragePower register address)
Merging omap_dss2/for-next (caf05780f6ed Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (2e9eb2deb30f Merge remote-tracking branches 'regulator/topic/act8945a', 'regulator/topic/fan53555' and 'regulator/topic/mt6397' into regulator-next)
Merging security/next (607259e17b37 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into ra-next)
Merging integrity/next (1d6d167c2efc KEYS: refcount bug fix)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (d42d6108711b watchdog: Fix dependencies for !HAS_IOMEM archs)
Merging iommu/next (fd6b6b40c17e Merge branches 'iommu/fixes' and 'arm/rockchip' into next)
Merging dwmw2-iommu/master (fda3bec12d09 iommu/vt-d: Fix 64-bit accesses to 32-bit DMAR_GSTS_REG)
Merging vfio/next (d4f50ee2f5b4 vfio/iommu_type1: make use of info.flags)
Merging jc_docs/docs-next (df8a0dde7306 Remove "arch" usage in Documentation/features/list-arch.sh)
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (935c9e7ff06a audit: log failed attempts to change audit_pid configuration)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (b8c15a91f1fe Merge branches 'dt/next' and 'dt/linus' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (d17df4419e13 Merge remote-tracking branch 'spi/topic/pxa2xx' into spi-next)
Merging tip/auto-latest (954d0d7f36ff Merge branch 'x86/mm')
CONFLICT (content): Merge conflict in kernel/memremap.c
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (f2b59ac66f98 EDAC, mpc85xx: Silence unused variable warning)
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (7fd13615992a tracing/dma-buf/fence: Fix timeline str value on fence_annotate_wait_on)
Merging rcu/rcu/next (0dd1befbc663 rcu: Remove expedited GP funnel-lock bypass)
Merging kvm/linux-next (03c21cb775a3 Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b4d7f161feb3 KVM: PPC: Fix ONE_REG AltiVec support)
Merging kvms390/next (9fc684e9cc59 KVM: s390: allow sync of fp registers via vregs)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (23d11a58a9a6 workqueue: skip flush dependency checks for legacy workqueues)
Merging drivers-x86/for-next (6b31de3e6985 ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi list)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (fb0c567663d0 Merge remote-tracking branch 'regmap/topic/doc' into regmap-next)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (54ee308e2b9b leds: lp3944: improve wording and formatting in a comment)
Merging ipmi/for-next (30f05309bde4 Merge tag 'pm+acpi-4.5-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging driver-core/driver-core-next (36f90b0a2ddd Linux 4.5-rc2)
Merging tty/tty-next (6e9131cc43a6 Merge 4.5-rc2 into tty-next)
Merging usb/usb-next (4f97f8f5f066 Merge 4.5-rc2 into usb-next)
Merging usb-gadget/next (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-serial/usb-next (92e963f50fc7 Linux 4.5-rc1)
Merging usb-chipidea-next/ci-for-usb-next (6b8bc9c6fb26 usb: chipidea: udc: remove unused value assignment)
Merging staging/staging-next (fec2f3335c63 Merge tag 'iio-for-4.6a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (modify/delete): drivers/staging/dgap/dgap.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/dgap/dgap.c left in tree.
$ git rm -f drivers/staging/dgap/dgap.c
Merging char-misc/char-misc-next (3e2fbc7feec4 Staging: goldfish: goldfish_nand: Add DMA Support using dmam_alloc_coherent)
Merging extcon/extcon-next (03bf1adbd68d extcon: arizona: Use DAPM mutex helper functions)
Merging cgroup/for-next (9a2ddda572a0 Documentation: cgroup: Fix 'cgroup-legacy' -> 'cgroup-v1')
Merging scsi/for-next (cb444fbd0141 Merge branch 'misc' into for-next)
Merging target-updates/for-next (fab683eb12e7 scsi: qla2xxxx: avoid type mismatch in comparison)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (f6af8e62cd21 Merge branch 'devel' into for-next)
Merging vhost/linux-next (481eaec37e91 tools/virtio: add ringtest utilities)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (1bc7222e5552 Merge branch 'devel' into for-next)
$ git reset --hard HEAD^
Merging next-20160128 version of gpio
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (ff01c944cfa9 pwm: Mark all devices as "might sleep")
Merging dma-buf/for-next (168309855a7d Linux 4.4-rc8)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (4106a3d9ebb9 clk: unlock for handling unregistered clock)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (fb2e69217129 aio: Fix compile error due to unexpected use of cmpxchg())
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (92e963f50fc7 Linux 4.5-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (03f726f415f5 Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging coresight/next (393ea4825578 coresight: etm4x: Check every parameter used by dma_xx_coherent.)
Merging rtc/rtc-next (3afab2047141 rtc: max77686: Cleanup and reduce dmesg output)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (dedbf43619d6 ipc/msg.c: use freezable blocking call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: lib/string_helpers: export string_units_{2,10} for others
Applying: lib/string_helpers: fix indentation in few places
Applying: x86/efi: print size and base in binary units in efi_print_memmap
Applying: x86/efi: use proper units in efi_find_mirror()
Merging akpm/master (d7530c8d7cb7 x86/efi: use proper units in efi_find_mirror())
Applying: mm: add support for PUD-sized transparent hugepages fix
Applying: Revert "x86-add-support-for-pud-sized-transparent-hugepages-fix"
Applying: mm: fix 2 for add support for PUD-sized transparent hugepages
