From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 23
Date: Mon, 23 Nov 2015 15:47:09 +1100
Message-ID: <20151123154709.3918e1b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59251 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753099AbbKWErN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2015 23:47:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151120:

The sunxi tree gained a conflict against the samsung-krzk tree.

The sound-soc tree lost its build failures.

The clockevents tree gained a conflict against the samsung-krzk tree.

Non-merge commits (relative to Linus' tree): 2243
 2870 files changed, 89284 insertions(+), 34749 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After the
final fixups (if any), I do an x86_64 modules_install followed by builds
for powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(this fails its final link) and pseries_le_defconfig and i386, sparc,
sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 231 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (7f21739301bf Merge tag 'staging-4.4-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (049e6dde7e57 Linux 4.3-rc4)
Merging arm-current/fixes (28fa99b7645a ARM: wire up mlock2 syscall)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (1451ad03fac3 powerpc: Wire up sys_mlock2())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (2c302e7e4105 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging net/master (9a65083827da tipc: correct settings of broadcast link state)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (086f332167d6 netfilter: nf_tables: add clone interface to expression operations)
Merging wireless-drivers/master (eeec5d0ef7ee rtlwifi: rtl8821ae: Fix lockups on boot)
Merging mac80211/master (5ff3ca288894 mac80211: don't teardown sdata on sdata stop)
Merging sound-current/for-linus (196543d54574 ALSA: hda - Apply HP headphone fixups more generically)
Merging pci-current/for-linus (8005c49d9aea Linux 4.4-rc1)
Merging driver-core.current/driver-core-linus (8005c49d9aea Linux 4.4-rc1)
Merging tty.current/tty-linus (bd63acf9e9a6 serial: export fsl8250_handle_irq)
Merging usb.current/usb-linus (19cd80a21482 usblp: do not set TASK_INTERRUPTIBLE before lock)
Merging usb-gadget-fixes/fixes (f74875dc3613 usb: dwc2: fix kernel oops during driver probe)
Merging usb-serial-fixes/usb-linus (59536da34513 USB: qcserial: Fix support for HP lt4112 LTE/HSPA+ Gobi 4G Modem)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (b57f9f34e27b Revert "Staging: wilc1000: coreconfigurator: Drop unneeded wrapper functions")
Merging char-misc.current/char-misc-linus (8005c49d9aea Linux 4.4-rc1)
Merging input-current/for-linus (0c6da0733bff Input: parkbd - clear unused function pointers)
Merging crypto-current/master (79960943fdc1 crypto: talitos - Fix timing leak in ESP ICV verification)
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (a53f2afb7e3d drm/i915: Mark uneven memory banks on gen4 desktop as unknown swizzling)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (e81b75f7b206 ARC: remove SYNC from __switch_to())
Merging arm/for-next (fa6af083e893 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (8005c49d9aea Linux 4.4-rc1)
Merging arm-soc/for-next (851df3dc1113 scpi: hide get_scpi_ops in module from built-in code)
Merging at91/at91-next (f05d836b8770 Merge tag 'at91-fixes' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (56c56eceb815 Merge branches 'berlin/dt' and 'berlin/doc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (f843df81257a Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (5442f0eadf28 ARM: dts: Kirkwood: Fix QNAP TS219 power-off)
Merging omap/for-next (f2a148747f11 Merge branch 'omap-for-v4.3/fixes' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (c38ef6905153 ARM: defconfig: Update qcom_defconfig)
Merging renesas/next (0c9400fab882 Merge branch 'heads/dt-for-v4.5' into next)
Merging rockchip/for-next (78a6e39eae9b Merge branch 'v4.5-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (3835a574c9e7 Merge branch 'next/soc64' into for-next)
Merging sunxi/sunxi/for-next (20d6ac3b2fa0 Merge branches 'sunxi/clocks-for-4.5', 'sunxi/defconfig-for-4.5', 'sunxi/dt-for-4.5' and 'sunxi/fixes-for-4.4' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (c6a5e900a025 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging arm64/for-next/core (01b305a23494 arm64: suspend: make hw_breakpoint_restore static)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (2a9c83986221 h8300: zImage alignment fix)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (8005c49d9aea Linux 4.4-rc1)
Merging metag/for-next (f23d0e2468bc MAINTAINERS: Change Meta arch port status to Odd Fixes)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (7837dc2bb611 Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (bb3fc5ddef93 nios2: Remove unnecessary #ifdef guards)
Merging parisc-hd/for-next (6a13feb9c828 Linux 4.3)
Merging powerpc/next (8005c49d9aea Linux 4.4-rc1)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (dcd67b9abc55 s390: Delete unnecessary checks before the function call "debug_unregister")
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (09745f38a74e arch/tile: turn off timer tick for oneshot_stopped state)
Merging uml/linux-next (2eb5f31bc4ea um: Switch clocksource to hrtimers)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (ccf7202a3486 update signing code)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (be69e1c19f0e fs/ext4: remove unnecessary new_valid_dev check)
Merging f2fs/dev (8005c49d9aea Linux 4.4-rc1)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (3bf1c7de6916 GFS2: Reintroduce a timeout in function gfs2_gl_hash_clear)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (8005c49d9aea Linux 4.4-rc1)
Merging nfsd/nfsd-next (ee8e8bf3b78e nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (555fa0fa618b fs: out of bounds on stack in iov_iter_advance)
Merging overlayfs/overlayfs-next (257f87199347 ovl: move super block magic number to magic.h)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (8c1c5f263833 ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (8ace5dfb983e locks: use list_first_entry_or_null())
Merging vfs/for-next (1a487dec990b f2fs: xattr simplifications)
CONFLICT (content): Merge conflict in fs/xfs/xfs_xattr.c
Merging pci/next (8005c49d9aea Linux 4.4-rc1)
Merging hid/for-next (6b5838ea94de Merge branch 'for-4.5/core' into for-next)
Merging i2c/i2c/for-next (8005c49d9aea Linux 4.4-rc1)
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (18ed6787d9fd hwmon: (pmbus) Add client driver for LTC3815)
Merging v4l-dvb/master (ca79e72cf39c Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (d023d4d774f7 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (91df9bc6f966 Merge branch 'for-4.5' into for-next)
Merging pm/linux-next (4b39eefc2161 Merge branch 'pm-cpuidle' into linux-next)
Merging idle/next (6a13feb9c828 Linux 4.3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (84f0e490bee0 thermal: rcar_thermal: remove redundant operation)
Merging thermal-soc/next (f00b6e0caa71 Revert "thermal: qcom_spmi: allow compile test")
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (14d34dad30f6 Merge branch 'topic/rcar' into next)
Merging net-next/master (5e091e7ad0ba bnx2x: Utilize FW 7.13.1.0.)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (c5a37883f42b Merge branch 'akpm' (patches from Andrew))
Merging wireless-drivers-next/master (6d808eba602b mac80211_hwsim: move Kconfig entry for sorting alphabetically)
Merging bluetooth/master (40b25fe5dc57 Bluetooth: Add support for Get Advertising Size Information command)
Merging mac80211-next/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging rdma/for-next (db7489e07669 IB/core, cma: Make __attribute_const__ declarations sparse-friendly)
Merging mtd/master (1ddaa021b000 MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs)
Merging l2-mtd/master (3ce351b5354a mtd: mtk-nor: new Mediatek serial flash controller driver)
Merging crypto/master (4f9ea86604e3 crypto: sun4i-ss - add missing statesize)
Merging drm/drm-next (f20780f3e8fe Merge branch 'drm-sti-next-2015-11-03' of http://git.linaro.org/people/benjamin.gaignard/kernel into drm-next)
Merging drm-panel/drm/panel/for-next (f1811a8a6413 drm/bridge: ptn3460: Fix coccinelle warnings)
Merging drm-intel/for-linux-next (29bb94bb4dc1 drm/i915: take a power domain reference while checking the HDMI live status)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_runtime_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (2bcdcbfae289 drm/tegra: dc: Request/free syncpoint at init/exit)
Merging drm-misc/topic/drm-misc (58c8fb954494 drm/sysfs: Grab lock for edid/modes_show)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_atomic_helper.c
Merging drm-exynos/exynos-drm/for-next (1f1c7efcb8d8 drm/exynos: dsi: add runtime pm support)
Merging drm-msm/msm-next (a9ee34b70e07 drm/msm: Remove local fbdev emulation Kconfig option)
Merging sound/for-next (efdbe3c3edb6 ALSA: midi: constify snd_rawmidi_global_ops structures)
Merging sound-asoc/for-next (c03bf48bc2cb Merge remote-tracking branches 'asoc/topic/wm8962' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (d1189c63ea5e scripts: [modpost] add new sections to white list)
Merging input/next (5e0baca8b324 Input: parkbd - drop bogus __init from parkbd_allocate_serio())
Merging block/for-next (4ef4e4105a25 Merge branch 'for-4.4/io-poll' into for-next)
Merging device-mapper/for-next (949d51b23b38 dm thin metadata: speed up discard of partially mapped volumes)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (a1807b99f328 mmc: fix mmc_{un,}register_pm_notifier prototypes)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3ac6b716f787 md-cluster: Allow spare devices to be marked as faulty)
Merging mfd/for-mfd-next (271bb1773b1e bindings: mfd: s2mps11: Add documentation for s2mps15 PMIC)
Merging backlight/for-backlight-next (9d6c243502b7 backlight: pm8941-wled: Add default-brightness property)
Merging battery/master (0fe69b960ae2 power: bq27xxx_battery: Add I2C module check dependency in Kconfig)
Merging omap_dss2/for-next (08bfb453f045 radeonfb: Deinline large functions)
Merging regulator/for-next (04ee19818171 Merge remote-tracking branches 'regulator/topic/optional', 'regulator/topic/pv88060', 'regulator/topic/tps6105x' and 'regulator/topic/tps65086' into regulator-next)
Merging security/next (e42852bf8814 security/capability.h: cap_issubset/isclear can be boolean)
Merging integrity/next (72e1eed8abb1 integrity: prevent loading untrusted certificates on the IMA trusted keyring)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (7f21739301bf Merge tag 'staging-4.4-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging iommu/next (b67ad2f7c751 Merge branches 'x86/vt-d', 'arm/omap', 'arm/smmu', 's390', 'core' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (222e684ca762 vfio/pci: make an array larger)
Merging jc_docs/docs-next (04bed3278abf Merge branch 'doc/4.5' into docs-next)
CONFLICT (content): Merge conflict in Documentation/arm/Marvell/README
Merging trivial/for-next (75021d28594d Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging audit/next (4b5829e9edfa audit: Delete unnecessary checks before two function calls)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (b1d06b60e90c of: Provide static inline function for of_translate_address if needed)
Merging mailbox/mailbox-for-next (cb1ca0b3bb66 mailbox: mailbox-test: avoid reading iomem twice)
Merging spi/for-next (110710f27d3b Merge remote-tracking branch 'spi/topic/sun4i' into spi-next)
Merging tip/auto-latest (5a5b01e59771 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (2527dfeb1f64 clocksource/drivers/tango-xtal: Replace code by clocksource_mmio_init)
CONFLICT (content): Merge conflict in arch/h8300/include/asm/io.h
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (990995bad13c EDAC: Fix PAGES_TO_MiB macro misuse)
Merging irqchip/irqchip/for-next (8005c49d9aea Linux 4.4-rc1)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (e428abbbf616 tracing: #ifdef out uses of max trace when CONFIG_TRACER_MAX_TRACE is not set)
Merging rcu/rcu/next (31bf937d2dcb rcu: Print symbolic name for ->gp_state)
Merging kvm/linux-next (d792abacaf1a Merge tag 'kvm-s390-master-4.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-master)
Merging kvm-arm/next (26caea7693cb KVM: arm/arm64: Merge vgic_set_lr() and vgic_sync_lr_elrsr())
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (a3eaa8649e4c KVM: VMX: Fix commit which broke PML)
Merging kvms390/next (7c65c5a83dc2 KVM: use heuristic for fast VCPU lookup by id)
Merging xen-tip/linux-next (abed7d0710e8 xen: fix the check of e_pfn in xen_find_pfn_range)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (4fcfc3013144 Merge branch 'for-4.4' into for-next)
Merging drivers-x86/for-next (b82983401684 asus-wmi: fix error handling in store_sys_wmi())
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (660d61d7be7b Merge remote-tracking branches 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (20204a266a9a leds/pwm: fix driver description and make license match the header)
Merging ipmi/for-next (d503e2fbbfea char: ipmi: ipmi_ssif: Replace timeval with timespec64)
Merging driver-core/driver-core-next (8005c49d9aea Linux 4.4-rc1)
Merging tty/tty-next (8005c49d9aea Linux 4.4-rc1)
Merging usb/usb-next (8005c49d9aea Linux 4.4-rc1)
Merging usb-gadget/next (8005c49d9aea Linux 4.4-rc1)
Merging usb-serial/usb-next (d0bf1ff0ae32 USB: cp210x: work around cp2108 GET_LINE_CTL bug)
Merging usb-chipidea-next/ci-for-usb-next (15af5aea51de usb: chipidea: removing of_find_property)
Merging staging/staging-next (b26baffbc916 staging: rdma: ehca: Added a blank line)
Merging char-misc/char-misc-next (8005c49d9aea Linux 4.4-rc1)
Merging extcon/extcon-next (2ee649007bfb extcon: arizona: Update naming for second jack detection DT binding)
Merging cgroup/for-next (6c2920926b10 cgroup: replace unified-hierarchy.txt with a proper cgroup v2 documentation)
Merging scsi/for-next (0a5149ba02bd mpt3sas: fix inline markers on non inline function declarations)
Merging target-updates/for-next (517982229f78 configfs: remove old API)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (b21bcac08c20 Merge branch 'devel' into for-next)
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (b59d5fb7e9c7 gpio-tegra: Do not create the debugfs entry by default)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (5dcd7b42f1d0 pwm: sunxi: Fix whitespace issue)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (cf81a1cf711d clk: qcom: msm8916: Move xo and sleep clocks into DT)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (8005c49d9aea Linux 4.4-rc1)
Merging y2038/y2038 (8750343a6505 coredump: Use 64bit time for unix time of coredump)
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (2184037e40ce Merge branch 'for-4.4/upstream-fixes' into for-next)
Merging coresight/next (a0aede15d496 coresight: checking for NULL string in coresight_name_match())
Merging rtc/rtc-next (1e3929ef0e1c rtc: Add a driver for Micro Crystal RV8803)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (8de5dff8bae6 libnvdimm: documentation clarifications)
Merging akpm-current/current (c5257ff11a2f ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/slub.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: iio: core: introduce IIO configfs support
Applying: iio: core: introduce IIO software triggers
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: iio: trigger: introduce IIO hrtimer based trigger
Applying: iio: Documentation: add IIO configfs documentation
Merging akpm/master (5ccbdf2b7108 iio: Documentation: add IIO configfs documentation)
