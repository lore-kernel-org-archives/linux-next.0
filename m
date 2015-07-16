From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 16
Date: Thu, 16 Jul 2015 16:28:20 +1000
Message-ID: <20150716162820.25f17fb9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41375 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751389AbbGPG2W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 02:28:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

For those that care:  I have stopped signing these messages because
vger's mailing list software destroys the signatures and then Google
(at least) assumes that they are spam.  I could clear sign them instead
(if anyone thinks that is worth while).

Changes since 20150715:

Removed tree: init (it has all been merged)

The tip tree lost its build failure.

The rcu tree gained a conflict against the tip tree and a build failure
for which I applied a merge fix patch.

The akpm-current tree gained a conflict against the arm tree and 2 build
failures for which I applied fix patches.

Non-merge commits (relative to Linus' tree): 2446
 2485 files changed, 100730 insertions(+), 34595 deletions(-)

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

I am currently merging 223 trees (counting Linus' and 33 trees of patches
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
Merging origin/master (97d6e2b636c6 Merge tag 'module-final-v4.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (ab525b473c96 ARM: invalidate L1 before enabling coherency)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-merge-benh/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (4a10a91756ef Merge branch 'upstream' of git://git.infradead.org/users/pcmoore/audit)
Merging net/master (bc8c20acaea1 bridge: multicast: treat igmpv3 report with INCLUDE and no sources as a leave)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once at start of day.)
Merging sound-current/for-linus (4d0e677523a9 ALSA: line6: Fix -EBUSY error during active monitoring)
Merging pci-current/for-linus (c9ddbac9c891 PCI: Restore PCI_MSIX_FLAGS_BIRMASK definition)
Merging wireless-drivers/master (7865598ec24a ath9k_hw: fix device ID check for AR956x)
Merging driver-core.current/driver-core-linus (bc0195aad0da Linux 4.2-rc2)
Merging tty.current/tty-linus (bc0195aad0da Linux 4.2-rc2)
Merging usb.current/usb-linus (51f007e1a1f1 Merge tag 'usb-serial-4.2-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (b2e2c94b878b usb: gadget: f_midi: fix error recovery path)
Merging usb-serial-fixes/usb-linus (d23f47d4927f USB: serial: Destroy serial_minors IDR on module exit)
Merging staging.current/staging-linus (d309509f8472 staging: vt6656: check ieee80211_bss_conf bssid not NULL)
Merging char-misc.current/char-misc-linus (bc0195aad0da Linux 4.2-rc2)
Merging input-current/for-linus (dbf3c370862d Revert "Input: synaptics - allocate 3 slots to keep stability in image sensors")
Merging crypto-current/master (030f4e968741 crypto: nx - Fix reentrancy bugs)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (758556bdc1c8 module: Fix load_module() error path)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible timeout)
Merging kselftest-fixes/fixes (d770e558e219 Linux 4.2-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging drm-intel-fixes/for-linux-next-fixes (ccfb8b2ed4d4 drm/i915: Do not call intel_crtc_disable if the crtc is already disabled.)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (624b71ee20ac ARCv2: support HS38 releases)
Merging arm/for-next (cc959bcc39ee Merge branches 'misc' and 'fixes' into for-next)
Merging arm-perf/for-next/perf (d770e558e219 Linux 4.2-rc1)
Merging arm-soc/for-next (182f170ac0b7 arm-soc: document merges)
Merging at91/at91-next (dd1f58f398fb Merge branch 'at91-4.2-dt' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' and 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (5228adb0e270 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (b66ba2c1292d Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (1b975bf61c52 Merge branch 'omap-for-v4.3/dt' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging renesas/next (81cedd027ea2 Merge branches 'heads/cleanup-for-v4.3', 'heads/defconfig-for-v4.3', 'heads/dt-for-v4.3', 'heads/soc-for-v4.3', 'heads/marzen-reference-board-removal-for-v4.3' and 'heads/fixes-for-v4.2' into next)
Merging samsung/for-next (bcddc3a84e49 arm64: dts: Add thermal-zones dt node for exynos5433)
Merging sunxi/sunxi/for-next (2676ca3b2993 Merge branch 'sunxi/dt-for-4.3' into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-next)
Merging arm64/for-next/core (f871d2680707 arm64: Fix show_unhandled_signal_ratelimited usage)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (25914cf22b72 clk: h8300: Remove "sh73a0-" part from compatible value)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (67592f699cb3 m68k: enable PCI support for m5475evb defconfig)
Merging metag/for-next (7ce0c22b0787 metag/irq: Use access helper irq_data_get_affinity_mask())
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary struct pci_dev declaration)
Merging mips/mips-for-linux-next (6dd7ea78f3c3 Merge branch '4.2-fixes' into mips-for-linux-next)
Merging nios2/nios2-next (a8955cc3a504 nios2: check number of timer instances)
Merging parisc-hd/for-next (1604f8719a2d Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging powerpc/next (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-benh/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (20a8f53065e2 s390/cio: Fix comma)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (d770e558e219 Linux 4.2-rc1)
Merging uml/linux-next (46acfb806813 um: Fix out-of-tree build)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (1203b34261e4 xtensa: fix threadptr reload on return to userspace)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_add_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the zero page)
Merging cifs/for-next (f482ca8c73ba Update cifs version number)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl commands through)
Merging ext3/for_next (70f19f5869c5 udf: Don't corrupt unalloc spacetable when writing it)
Merging ext4/dev (7444a072c387 ext4: replace open coded nofail allocation in ext4_free_blocks())
Merging f2fs/dev (f99fc27c7346 f2fs: shrink unreferenced extent_caches first)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (ea79f0ec7a38 GFS2: Make ht_parms static)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (faa4a54f0be1 pNFS: Don't throw out valid layout segments)
Merging nfsd/nfsd-next (49469fda4384 nfsd: don't hold i_mutex over userspace upcalls)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (669d3d123395 UBI: Remove unnecessary `\')
Merging xfs/for-next (bc0195aad0da Linux 4.2-rc2)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (0f1db7dee200 9p: cope with bogus responses from server in p9_client_{read,write})
Merging pci/next (bc0195aad0da Linux 4.2-rc2)
Merging hid/for-next (6aec14c62eae Merge branch 'for-4.3/cp2112' into for-next)
Merging i2c/i2c/for-next (19e0ff423382 i2c: omap: fix cleanup regression)
Merging jdelvare-hwmon/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (1840cf8ac8dc hwmon: (f71882fg) Add support for f81768d)
Merging v4l-dvb/master (5bab86243d94 [media] media/pci/cobalt: fix Kconfig and build when SND is not enabled)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (b953c0d234bc Linux 4.1)
Merging libata/for-next (cb35a2d4e1f3 Merge branch 'for-4.2-fixes' into for-next)
Merging pm/linux-next (233611c380c5 Merge branches 'pm-cpufreq-next', 'pm-sleep' and 'pm-domains' into linux-next)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (111b23cf895b Merge branches 'release' and 'thermal-soc' of .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (1ff9cd2016ac Merge branch 'fixes' into next)
Merging net-next/master (9061cb023567 Merge branch 'gianfar_rx_sg')
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (8fc2b61a36fe ath9k: DFS - add pulse chirp detection for FCC)
Merging bluetooth/master (435d1e517476 Bluetooth: hci_check_conn_params() check proper range)
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict)
Merging l2-mtd/master (906b1f536d5b Merge MTD 4.2-rc fixes into MTD -next)
Merging crypto/master (2d6f0600b2cd crypto: vmx - Adding enable_kernel_vsx() to access VSX instructions)
Merging drm/drm-next (c5fd936e992d drm/nouveau: Pause between setting gpu to D3hot and cutting the power)
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add bus format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (264954811af6 drm/i915: Invert fastboot check)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Registers are 32-bit)
Merging drm-misc/topic/drm-misc (ec081cb337a1 drm: Fix warning with make xmldocs caused by drm_irq.c)
Merging drm-exynos/exynos-drm/for-next (e0456717e483 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits after hang)
Merging sound/for-next (3ce095c16263 ALSA: aoa: Drop owner assignment from i2c_driver)
Merging sound-asoc/for-next (d38043114c32 Merge remote-tracking branches 'asoc/topic/wm5100', 'asoc/topic/wm5110', 'asoc/topic/wm8731', 'asoc/topic/wm8904' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_lock if CONFIG_MODULES)
Merging input/next (339d6b88e872 Input: wdt87xx_i2c - change the sleep time to 2500ms after the sw reset)
Merging block/for-next (81bf3582e7aa Merge branch 'for-4.2/drivers' into for-next)
CONFLICT (content): Merge conflict in block/blk-cgroup.c
Merging device-mapper/for-next (f46c158cd34f dm cache: display 'needs_check' in status if it is set)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEMPT=n)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (195c018eefad Fix read-balancing during node failure)
Merging mfd/for-mfd-next (46a0c045e80c mfd: wm8994-regmap: Constify reg_default tables)
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the return type of backlight_update_status() to int)
Merging battery/master (b1a55af2773d power_supply: Drop owner assignment from i2c_driver)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (02f983d9fd16 Merge remote-tracking branches 'regulator/topic/max8973', 'regulator/topic/owner', 'regulator/topic/pwm', 'regulator/topic/qcom-spmi' and 'regulator/topic/stub' into regulator-next)
Merging security/next (b3bddffd35a0 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging iommu/next (5e92946c39ca iommu/arm-smmu: Skip the execution of CMD_PREFETCH_CONFIG)
Merging dwmw2-iommu/master (c83b2f20fdde iommu/vt-d: Only enable extended context tables if PASID is supported)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentation)
Merging jc_docs/docs-next (f0ad2718cee6 Merge branch 'doc/4.3' into docs-next)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negative/)
Merging audit/next (0b08c5e59441 audit: Fix check of return value of strnlen_user())
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (0b34c1a489f6 Documentation: DT: Fix a typo in the filename "lantiq,<chip>-pinumx.txt")
Merging mailbox/mailbox-for-next (7d641938aa2a mailbox/bcm2835: Fix mailbox full detection.)
Merging spi/for-next (582df8cd8ff1 Merge remote-tracking branch 'spi/topic/xcomm' into spi-next)
Merging tip/auto-latest (a5c668d388a0 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (3a37ff02d338 clocksource: sh_cmt: Remove obsolete sh-cmt-48-gen2 platform_device_id entry)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (99e1dfb7d209 EDAC, mce_amd: Don't emit 'CE' for Deferred error)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring buffer benchmark immediately)
Merging rcu/rcu/next (e6659399e65b Merge branches 'doc.2015.07.15a' and 'torture.2015.07.15a' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kernel/traps.c
Applying: rcu: merge fix for Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()
Merging kvm/linux-next (a88464a8b0ff kvm: add hyper-v crash msrs values)
Merging kvm-arm/next (c62e631d4a8e KVM: arm/arm64: vgic: Remove useless arm-gic.h #include)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (83cb8557e8d2 percpu: update incorrect comment for this_cpu_*() operations)
Merging workqueues/for-next (badb7f5e8bdd workqueue: add myself as a dedicated reviwer)
Merging drivers-x86/for-next (d770e558e219 Linux 4.2-rc1)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (16a535f2dba9 Merge remote-tracking branch 'regmap/topic/force-update' into regmap-next)
Merging hsi/for-next (f451e76f8969 HSI: nokia-modem: use flags argument of devm_gpiod_get to set direction)
Merging leds/for-next (b67893206fc0 leds:lp55xx: fix firmware loading error)
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was only read)
Merging driver-core/driver-core-next (bc0195aad0da Linux 4.2-rc2)
Merging tty/tty-next (bc0195aad0da Linux 4.2-rc2)
Merging usb/usb-next (bc0195aad0da Linux 4.2-rc2)
Merging usb-gadget/next (d770e558e219 Linux 4.2-rc1)
Merging usb-serial/usb-next (d770e558e219 Linux 4.2-rc1)
Merging staging/staging-next (e913bfb60bee Merge tag 'iio-for-4.3a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging char-misc/char-misc-next (bc0195aad0da Linux 4.2-rc2)
Merging extcon/extcon-next (00f734019663 extcon: arizona: Simplify pdata symantics for micd_dbtime)
Merging kdbus/kdbus (cf23304185c5 kdbus: Fix typo in ipc/kdbus)
Merging cgroup/for-next (917d8e2d10f4 cgroup: add documentation for the PIDs controller)
Merging scsi/for-next (c8806b6c9e82 snic: driver for Cisco SCSI HBA)
Merging target-updates/for-next (f8d2b3fdf5fe tcm_loop: Send I_T_NEXUS_LOSS_OCCURRED UA)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (daecdc66968f pinctrl: rockchip: add support for the rk3368)
Merging vhost/linux-next (cdf764d59bc6 PCI/MSI: Make pci_msi_shutdown(), pci_msix_shutdown() static)
CONFLICT (content): Merge conflict in include/uapi/linux/pci_regs.h
CONFLICT (modify/delete): drivers/ntb/ntb_hw.c deleted in HEAD and modified in vhost/linux-next. Version vhost/linux-next of drivers/ntb/ntb_hw.c left in tree.
CONFLICT (content): Merge conflict in MAINTAINERS
$ git rm -f drivers/ntb/ntb_hw.c
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (38e003f4b5dc gpio: Fix checkpatch.pl issues)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (bc0195aad0da Linux 4.2-rc2)
Merging userns/for-next (75509fd88fbd nsfs: Add a show_path method to fix mountinfo)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (dfcfdcf0b982 Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (d770e558e219 Linux 4.2-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (5acce18cc966 coresight: replicator: Use builtin_platform_driver())
Merging rtc/rtc-next (4eee472d6c12 rtc: 88pm80x: add device tree support)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f0f2c072cf53 nfit: add support for NVDIMM "latch" flag)
Merging akpm-current/current (7352fdfbeb44 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/arch-v32/kernel/entry.S
CONFLICT (content): Merge conflict in arch/cris/arch-v10/kernel/entry.S
CONFLICT (content): Merge conflict in arch/arm/include/asm/Kbuild
Applying: mm: mlock: fix for add new mlock, munlock, and munlockall system calls
Applying: smpboot: fix for allow passing the cpumask on per-cpu thread registration
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
Applying: namei: fix warning while make xmldocs caused by namei.c
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (28395bc676de drivers/w1/w1_int.c: call put_device if device_register fails)
