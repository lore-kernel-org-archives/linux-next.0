From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 26
Date: Thu, 26 Nov 2015 16:16:55 +1100
Message-ID: <20151126161655.281096bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32956 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751500AbbKZFQ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2015 00:16:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Reminder: there will be no linux-next release next week (Nov 30 - Dec 4).

Changes since 20151124:

The net-next tree gained a conflict against the net tree.

The drm-panel tree lost its build failure.

Non-merge commits (relative to Linus' tree): 2829
 3498 files changed, 107354 insertions(+), 41285 deletions(-)

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
Merging origin/master (9b81d512a4a8 Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (049e6dde7e57 Linux 4.3-rc4)
Merging arm-current/fixes (28fa99b7645a ARM: wire up mlock2 syscall)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (7f821fc9c77a powerpc/tm: Check for already reclaimed tasks)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (2c302e7e4105 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging net/master (c9da161c6517 bpf: fix clearing on persistent program array maps)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (086f332167d6 netfilter: nf_tables: add clone interface to expression operations)
Merging wireless-drivers/master (eeec5d0ef7ee rtlwifi: rtl8821ae: Fix lockups on boot)
Merging mac80211/master (5ff3ca288894 mac80211: don't teardown sdata on sdata stop)
Merging sound-current/for-linus (0c25ad80408e ALSA: hda - Fix noise on Gigabyte Z170X mobo)
Merging pci-current/for-linus (7c7a0e945349 ARM/PCI: Move align_resource function pointer to pci_host_bridge structure)
Merging driver-core.current/driver-core-linus (8005c49d9aea Linux 4.4-rc1)
Merging tty.current/tty-linus (1ec218373b8e Linux 4.4-rc2)
Merging usb.current/usb-linus (1ec218373b8e Linux 4.4-rc2)
Merging usb-gadget-fixes/fixes (f74875dc3613 usb: dwc2: fix kernel oops during driver probe)
Merging usb-serial-fixes/usb-linus (a0e80fbd56b4 USB: serial: Another Infineon flash loader USB ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (1ec218373b8e Linux 4.4-rc2)
Merging char-misc.current/char-misc-linus (e8c77bda05e5 fpga manager: Fix firmware resource leak on error)
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
Merging drm-intel-fixes/for-linux-next-fixes (0b466dc238cb drm/i915: Mark uneven memory banks on gen4 desktop as unknown swizzling)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (2e22502c080f ARC: dw2 unwind: Remove falllback linear search thru FDE entries)
Merging arm/for-next (fa6af083e893 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (8005c49d9aea Linux 4.4-rc1)
Merging arm-soc/for-next (627b655336fb soc: Mediatek: Enable SCPSYS power domain driver by default)
Merging at91/at91-next (f05d836b8770 Merge tag 'at91-fixes' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (56c56eceb815 Merge branches 'berlin/dt' and 'berlin/doc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (922ef3e263f7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (4d2ec7e206ae ARM: orion5x: Fix legacy get_irqnr_and_base)
Merging omap/for-next (f2a148747f11 Merge branch 'omap-for-v4.3/fixes' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (c38ef6905153 ARM: defconfig: Update qcom_defconfig)
Merging renesas/next (78f2daa382dc Merge branch 'heads/dt-for-v4.5' into next)
Merging rockchip/for-next (1e8425faa54b Merge branch 'v4.5-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (4013eaa7e492 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (20d6ac3b2fa0 Merge branches 'sunxi/clocks-for-4.5', 'sunxi/defconfig-for-4.5', 'sunxi/dt-for-4.5' and 'sunxi/fixes-for-4.4' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (3ba3a74b6545 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging arm64/for-next/core (01b305a23494 arm64: suspend: make hw_breakpoint_restore static)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (5aef14e91de2 clk: h8300: Remove "sh73a0-" part from compatible value)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (70bc53b47343 m68k/mac: Kill psc_present)
Merging m68knommu/for-next (1ec218373b8e Linux 4.4-rc2)
Merging metag/for-next (f23d0e2468bc MAINTAINERS: Change Meta arch port status to Odd Fixes)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (38c24e332ad6 MIPS: ath79: Remove some unused code from setup.c)
Merging nios2/for-next (bb3fc5ddef93 nios2: Remove unnecessary #ifdef guards)
Merging parisc-hd/for-next (6a13feb9c828 Linux 4.3)
Merging powerpc/next (1ec218373b8e Linux 4.4-rc2)
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
Merging ext4/dev (857ab1d3e3da jbd2: Fix unreclaimed pages after truncate in data=journal mode)
Merging f2fs/dev (8005c49d9aea Linux 4.4-rc1)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (5f63e3c3599d GFS2: Reintroduce a timeout in function gfs2_gl_hash_clear)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (4f2e9dce0c63 nfs4: resend LAYOUTGET when there is a race that changes the seqid)
Merging nfsd/nfsd-next (da3575258c7b nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (555fa0fa618b fs: out of bounds on stack in iov_iter_advance)
Merging overlayfs/overlayfs-next (257f87199347 ovl: move super block magic number to magic.h)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (8c1c5f263833 ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (8ace5dfb983e locks: use list_first_entry_or_null())
Merging vfs/for-next (e7c709094130 coredump: Use 64bit time for unix time of coredump)
Merging pci/next (1ec218373b8e Linux 4.4-rc2)
Merging hid/for-next (e53fb58ca6d8 Merge branch 'for-4.5/core' into for-next)
Merging i2c/i2c/for-next (1ec218373b8e Linux 4.4-rc2)
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (9a2adf56a412 hwmon: (pmbus) Add client driver for LTC3815)
Merging v4l-dvb/master (ca79e72cf39c Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (1a19737d74d4 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (921203a859c3 Merge branch 'for-4.5' into for-next)
Merging pm/linux-next (d2f236be22a8 Merge branch 'pm-opp' into linux-next)
Merging idle/next (6a13feb9c828 Linux 4.3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (84f0e490bee0 thermal: rcar_thermal: remove redundant operation)
Merging thermal-soc/next (269fe70d7361 Merge branch 'work-fixes' into work-next)
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (14d34dad30f6 Merge branch 'topic/rcar' into next)
Merging net-next/master (00cc3679187a Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in net/ipv4/ipmr.c
CONFLICT (content): Merge conflict in kernel/bpf/syscall.c
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (c5a37883f42b Merge branch 'akpm' (patches from Andrew))
Merging wireless-drivers-next/master (6d808eba602b mac80211_hwsim: move Kconfig entry for sorting alphabetically)
Merging bluetooth/master (816ae3150e1f Bluetooth: Perform HCI update for power on synchronously)
Merging mac80211-next/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging rdma/for-next (db7489e07669 IB/core, cma: Make __attribute_const__ declarations sparse-friendly)
Merging mtd/master (1ddaa021b000 MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs)
Merging l2-mtd/master (3ce351b5354a mtd: mtk-nor: new Mediatek serial flash controller driver)
Merging crypto/master (d62112f27e4b crypto: nx - use of_property_read_u32())
Merging drm/drm-next (f20780f3e8fe Merge branch 'drm-sti-next-2015-11-03' of http://git.linaro.org/people/benjamin.gaignard/kernel into drm-next)
Merging drm-panel/drm/panel/for-next (caa602e71609 drm/bridge: Remove gratuitous blank line)
Merging drm-intel/for-linux-next (2e35c8833bc7 drm/i915: remove duplicate definition of for_each_power_domain)
Merging drm-tegra/drm/tegra/for-next (2093588d9b43 drm/tegra: Use drm_gem_object_unreference_unlocked())
Merging drm-misc/topic/drm-misc (87069f4493b2 drm/mm: use list_next_entry)
Merging drm-exynos/exynos-drm/for-next (1f1c7efcb8d8 drm/exynos: dsi: add runtime pm support)
Merging drm-msm/msm-next (a9ee34b70e07 drm/msm: Remove local fbdev emulation Kconfig option)
Merging sound/for-next (efdbe3c3edb6 ALSA: midi: constify snd_rawmidi_global_ops structures)
Merging sound-asoc/for-next (c010136a3323 Merge remote-tracking branches 'asoc/topic/topology', 'asoc/topic/wm8904', 'asoc/topic/wm8962' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (d1189c63ea5e scripts: [modpost] add new sections to white list)
Merging input/next (5e0baca8b324 Input: parkbd - drop bogus __init from parkbd_allocate_serio())
Merging block/for-next (3f3a8a218c2f Merge branch 'for-4.5/core' into for-next)
Merging device-mapper/for-next (2cd0ff3536f6 dm thin metadata: speed up discard of partially mapped volumes)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (df81074fb0db mmc: core: Introduce MMC_CAP2_NO_SDIO cap)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3ac6b716f787 md-cluster: Allow spare devices to be marked as faulty)
Merging mfd/for-mfd-next (cc509d5ba2b7 mfd: wm8994: Ensure that the whole MFD is built into a single module)
Merging backlight/for-backlight-next (6be3a5a9cd91 backlight: adp88x0: Fix uninitialized variable use)
Merging battery/master (0fe69b960ae2 power: bq27xxx_battery: Add I2C module check dependency in Kconfig)
Merging omap_dss2/for-next (d890dccfae78 video: omapdss: delete unneeded of_node_put)
Merging regulator/for-next (87cfda7e6c3c Merge remote-tracking branches 'regulator/topic/optional', 'regulator/topic/pv88060', 'regulator/topic/tps6105x', 'regulator/topic/tps65086' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next (ebd68df3f24b Sync to Linus v4.4-rc2 for LSM developers.)
Merging integrity/next (7ee2f155f474 evm: reset EVM status when file attributes changes)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (5da2bf1ac8fb watchdog: mtk_wdt: Use MODE_KEY when stopping the watchdog)
Merging iommu/next (b67ad2f7c751 Merge branches 'x86/vt-d', 'arm/omap', 'arm/smmu', 's390', 'core' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (222e684ca762 vfio/pci: make an array larger)
Merging jc_docs/docs-next (04bed3278abf Merge branch 'doc/4.5' into docs-next)
CONFLICT (content): Merge conflict in Documentation/arm/Marvell/README
Merging trivial/for-next (75021d28594d Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging audit/next (08b9fd158f1d audit: force seccomp event logging to honor the audit_enabled flag)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (b1d06b60e90c of: Provide static inline function for of_translate_address if needed)
Merging mailbox/mailbox-for-next (cb1ca0b3bb66 mailbox: mailbox-test: avoid reading iomem twice)
Merging spi/for-next (a98051c79479 Merge remote-tracking branches 'spi/topic/spidev' and 'spi/topic/sun4i' into spi-next)
Merging tip/auto-latest (10430d18e25a Merge branch 'x86/mm')
Merging clockevents/clockevents/next (2527dfeb1f64 clocksource/drivers/tango-xtal: Replace code by clocksource_mmio_init)
CONFLICT (content): Merge conflict in arch/h8300/include/asm/io.h
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (e8f937da744f EDAC, pci: Remove old disabled code)
Merging irqchip/irqchip/for-next (86e57ca735a7 irqchip/renesas-intc-irqpin: Improve clock error handling and reporting)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (70004986ffdf ring-buffer: Remove redundant update of page timestamp)
Merging rcu/rcu/next (27cddb87da60 rcu: Print symbolic name for ->gp_state)
Merging kvm/linux-next (aba2f06c070f KVM: x86: correctly print #AC in traces)
Merging kvm-arm/next (26caea7693cb KVM: arm/arm64: Merge vgic_set_lr() and vgic_sync_lr_elrsr())
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (a3eaa8649e4c KVM: VMX: Fix commit which broke PML)
Merging kvms390/next (c921bf81ba6d KVM: s390: don't load kvm without virtualization support)
Merging xen-tip/linux-next (8025943c32f5 xen/x86: convert remaining timespec to timespec64 in xen_pvclock_gtod_notify)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (4fcfc3013144 Merge branch 'for-4.4' into for-next)
Merging drivers-x86/for-next (0ab19793ecc0 apple-gmux: Assign apple_gmux_data before registering)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (660d61d7be7b Merge remote-tracking branches 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (9559f375dba2 leds: powernv: Implement brightness_set_blocking op)
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (8005c49d9aea Linux 4.4-rc1)
Merging tty/tty-next (1ec218373b8e Linux 4.4-rc2)
Merging usb/usb-next (1ec218373b8e Linux 4.4-rc2)
Merging usb-gadget/next (8005c49d9aea Linux 4.4-rc1)
Merging usb-serial/usb-next (d0bf1ff0ae32 USB: cp210x: work around cp2108 GET_LINE_CTL bug)
Merging usb-chipidea-next/ci-for-usb-next (15af5aea51de usb: chipidea: removing of_find_property)
Merging staging/staging-next (6e23ec4a1118 drivers: staging: vme: Deleted casting to (void *))
Merging char-misc/char-misc-next (1ec218373b8e Linux 4.4-rc2)
Merging extcon/extcon-next (7a7ef0f2a4b3 extcon: arizona: Update naming for micd-timeout DT to include units)
Merging cgroup/for-next (d2b436580906 cpuset: Replace all instances of time_t with time64_t)
Merging scsi/for-next (59ae1adaafff Merge branch 'misc' into for-next)
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
Merging kselftest/next (4aaae2f2c74f scripts/kconfig/Makefile: add kselftest-mergeconfig)
Merging y2038/y2038 (8750343a6505 coredump: Use 64bit time for unix time of coredump)
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (2184037e40ce Merge branch 'for-4.4/upstream-fixes' into for-next)
Merging coresight/next (a0aede15d496 coresight: checking for NULL string in coresight_name_match())
Merging rtc/rtc-next (68534c1881f3 rtc: ds1307: fix kernel splat due to wakeup irq handling)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (8de5dff8bae6 libnvdimm: documentation clarifications)
Merging akpm-current/current (f19da962fa79 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in fs/adfs/adfs.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: iio: core: introduce IIO configfs support
Applying: iio: core: introduce IIO software triggers
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: iio: trigger: introduce IIO hrtimer based trigger
Applying: iio: Documentation: add IIO configfs documentation
Applying: dma-mapping: make the generic coherent dma mmap implementation optional
Applying: arc: convert to dma_map_ops
Applying: arc: dma mapping fixes
Applying: avr32: convert to dma_map_ops
Applying: blackfin: convert to dma_map_ops
Applying: c6x: convert to dma_map_ops
Applying: C6X: fix build breakage
Applying: c6x: dma mapping fixes
Applying: cris: convert to dma_map_ops
Applying: nios2: convert to dma_map_ops
Applying: nios2: dma mapping fixes
Applying: frv: convert to dma_map_ops
Applying: parisc: convert to dma_map_ops
Applying: mn10300: convert to dma_map_ops
Applying: m68k: convert to dma_map_ops
Applying: metag: convert to dma_map_ops
Applying: sparc: use generic dma_set_mask
Applying: tile: uninline dma_set_mask
Applying: dma-mapping: always provide the dma_map_ops based implementation
Applying: HAVE_DMA_ATTRS: remove leftovers in Kconfig
Applying: dma-mapping: remove <asm-generic/dma-coherent.h>
Applying: dma-mapping: use offset_in_page macro
Applying: memstick: use sector_div instead of do_div
Merging akpm/master (0e0b619056b8 memstick: use sector_div instead of do_div)
