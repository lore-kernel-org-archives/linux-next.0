From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 11
Date: Thu, 11 Feb 2016 16:45:40 +1100
Message-ID: <20160211164540.72beb320@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40173 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751075AbcBKFpm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2016 00:45:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160210:

The net-next tree gained a conflict against the net tree.

The drm-misc tree lost its build failure.

The trivial tree gained a build fix from the akpm tree.

The aio tree still had a build failure so I used the version from
next-20160111.

The akpm tree lost a patch to the trivial build tree fix.

Non-merge commits (relative to Linus' tree): 4057
 3564 files changed, 139812 insertions(+), 63361 deletions(-)

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
Merging origin/master (74c7b2af37ad Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (5070fb14a015 ARM: 8517/1: ICST: avoid arithmetic overflow in icst_hz())
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (0fe53e8d335b powerpc/powernv: Fix stale PE primary bus)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (ca0bb0798022 Add sun4v_wdt watchdog driver)
Merging net/master (a1b14d27ed09 bpf: fix branch offset adjustment on backjumps after patching ctx expansion)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (b16c29191dc8 netfilter: nf_conntrack: use safer way to lock all buckets)
Merging wireless-drivers/master (d76d65fd2695 rtlwifi: fix broken VHT support)
Merging mac80211/master (212c5a5e6ba6 mac80211: minstrel: Change expected throughput unit back to Kbps)
Merging sound-current/for-linus (397da2d0ab0d Merge branch 'topic/core-fixes' into for-linus)
Merging pci-current/for-linus (0cf1337e0b83 PCI: rcar: Add device tree support for r8a7793)
Merging driver-core.current/driver-core-linus (00cd29b799e3 klist: fix starting point removed bug in klist iterators)
Merging tty.current/tty-linus (c8053b587627 Revert "8250: uniphier: allow modular build with 8250 console")
Merging usb.current/usb-linus (89140fdaf11a xhci: harden xhci_find_next_ext_cap against device removal)
Merging usb-gadget-fixes/fixes (6a4290cc28be usb: dwc3: gadget: set the OTG flag in dwc3 gadget driver.)
Merging usb-serial-fixes/usb-linus (4152b387da81 USB: option: fix Cinterion AHxx enumeration)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (388f7b1d6e8c Linux 4.5-rc3)
Merging char-misc.current/char-misc-linus (3b2b9ead3214 nvmem: qfprom: Specify LE device endianness)
Merging input-current/for-linus (ff84dabe3c6e Input: colibri-vf50-ts - add missing #include <linux/of.h>)
Merging crypto-current/master (8a3978ad55fb crypto: marvell/cesa - fix test in mv_cesa_dev_dma_init())
Merging ide/master (e04a2bd6d8c9 drivers/ide: make ide-scan-pci.c driver explicitly non-modular)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (16ab8a5cbea4 vfio/noiommu: Don't use iommu_present() to track fake groups)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (ed3f9fd1e865 drm/i915: fix error path in intel_setup_gmbus())
Merging asm-generic/master (040b323b5012 ARM: asm/div64.h: adjust to generic codde)
Merging arc/for-next (dec2b2849cfc ARCv2: intc: Allow interruption by lowest priority interrupt)
Merging arm/for-next (f2c5e7deee7f Merge branches 'component', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (92e963f50fc7 Linux 4.5-rc1)
Merging arm-soc/for-next (ce4785b58783 ARM: SoC: document merges)
Merging at91/at91-next (8129febb508f ARM: dts: at91: at91sam9n12ek: fix panel compatible string)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (5ec6f2cd8ec4 ARM: bcm2835: Add the Raspberry Pi power domain driver to the DT.)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (92e963f50fc7 Linux 4.5-rc1)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (5a2565fb7d09 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8fdbbde4a16c Merge branch 'for_4.6/keystone_dts' into next)
Merging mvebu/for-next (84127e66ef4a Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (d56817ce2533 Merge branch 'omap-for-v4.6/dt' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (2ccea21d797f ARM: qcom: Drop ARCH_MSM* configs)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (74eb2716fe71 Merge branches 'heads/arm64-dt-for-v4.6', 'heads/defconfig-for-v4.6', 'heads/dt-for-v4.6' and 'heads/soc-for-v4.6' into next)
Merging rockchip/for-next (b24b8204ad7d Merge branch 'v4.6-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (3a9cb5f4a9a7 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (06902a8895d5 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/core-for-4.6', 'sunxi/drivers-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (025e08f78501 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (f4d92287583b arm64: Fix build with CONFIG_DEBUG_PAGEALLOC=n)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (11943fdd17d2 h8300: dts: Rename the serial port clock to fck)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (a9c9d9aca4e7 zorro: Use kobj_to_dev())
Merging m68knommu/for-next (9d4c9e5064d7 m68knommu: fix FEC platform device registration when driver is modular)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (a13d2abd8e61 MIPS: highmem: Turn flush_cache_kmaps into a no-op.)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (388f7b1d6e8c Linux 4.5-rc3)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (232f5dd78586 s390/oprofile: fix address range for asynchronous stack)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f1c3418ed4e6 tile kgdb: fix bug in copy to gdb regs, and optimize memset)
Merging uml/linux-next (288b31a382d2 um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (988f1f576d4f Merge branch 'for-chris-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.5)
Merging btrfs-kdave/for-next (4c9aeec066dd Merge branch 'for-next-4.6-20160203' into for-next-20160203)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging ceph/master (bbadd4529b09 libceph: MOSDOpReply v7 encoding)
Merging cifs/for-next (74c7b2af37ad Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (5a9530e498ed ocfs2: Implement get_next_id())
Merging ext4/dev (6df2762f3f76 ext4 crypto: move context consistency check to ext4_file_open())
Merging f2fs/dev (108daea1bd02 f2fs: increase i_size to avoid missing data)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (00bf5636b147 GFS2: Prevent delete work from occurring on glocks used for create)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (50ab8ec74a15 nfs: fix nfs_size_to_loff_t)
Merging nfsd/nfsd-next (ee2bf98bbe90 NFSv4: fix getacl ERANGE for some ACL buffer sizes)
Merging orangefs/for-next (6ebcc3fcdac1 Orangefs: added a couple of WARN_ONs, perhaps just temporarily.)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (63a1962bea7d Merge branch 'xfs-buf-macro-cleanup-4.6' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (a314966fad61 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-layerscape' and 'pci/host-rcar' into next)
Merging hid/for-next (bc1db4af59b2 Merge branches 'for-4.6/sony' and 'for-4.6/upstream' into for-next)
Merging i2c/i2c/for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (972d7d17b6bb hwmon: Add LTC2990 sensor driver)
Merging v4l-dvb/master (0d8f3357897d Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (f6f756ddd65f Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (3d3cafda9a56 Merge branch 'for-4.6' into for-next)
Merging pm/linux-next (45bb976de29f Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (98d94507e10c Merge branches 'thermal-intel', 'thermal-suspend-fix' and 'thermal-soc' into next)
Merging thermal-soc/next (26716ce124fc thermal: allow u8500-thermal driver to be a module)
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (64509b4ad81c Merge branch 'topic/pl330' into next)
Merging net-next/master (aaa5672052cb sxgbe: remove unused code)
CONFLICT (content): Merge conflict in drivers/net/vxlan.c
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (6709d1f4ece5 netfilter: ipvs/SIP: handle ip_vs_fill_iph_skb_off failure)
Merging wireless-drivers-next/master (11e70824e75f mwifiex: firmware dump support for w8997 chipset)
Merging bluetooth/master (9a6a1c77e1fc Bluetooth: Use managed version of led_trigger_register in LED trigger)
Merging mac80211-next/master (94106d26c380 mac80211: fix VHT MU-MIMO frame processing)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
Merging rdma/for-next (34356f64ac0d IB/mlx5: Unify CQ create flags check)
Merging mtd/master (9146cbd52b11 mtd: jz4780_nand: replace if/else blocks with switch/case)
Merging l2-mtd/master (ed4eeba7338b driver/memory: Removal of deprecated NO_IRQ)
Merging crypto/master (f75516a81548 crypto: keys - Revert "convert public key to akcipher api")
Merging drm/drm-next (5443ce86fa37 drm: virtio-gpu: set atomic flag)
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (2417c8c03f50 drm/i915: fix error path in intel_setup_gmbus())
Merging drm-tegra/drm/tegra/for-next (d50bbe33efb5 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (e24bfdd5052c apple-gmux: Fix build breakage if !CONFIG_ACPI)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (5645e785cea2 drm/vc4: fix an error code)
Merging sound/for-next (fa9a435debad Merge branch 'topic/hda-mst' into for-next)
Merging sound-asoc/for-next (00d2170519d9 Merge remote-tracking branch 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (1261d013daea Input: Allow compile test of Goodix and Colibri VF50 if !GPIOLIB)
Merging block/for-next (0124663be268 Merge branch 'for-4.6/drivers' into for-next)
Merging device-mapper/for-next (aa8c484be790 dm thin metadata: remove needless newline from subtree_dec() DMERR message)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (4e2918512024 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (fc2561ec0afc md-cluster: delete useless code)
Merging mfd/for-mfd-next (84a6c45ae136 mfd: syscon: Make syscon_regmap_config const)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (265b60497a57 power: bq27xxx_battery: Fix bq27541 AveragePower register address)
Merging omap_dss2/for-next (caf05780f6ed Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (18c4766e2e9f Merge remote-tracking branches 'regulator/topic/mt6397' and 'regulator/topic/qcom-saw' into regulator-next)
Merging security/next (388f7b1d6e8c Linux 4.5-rc3)
Merging integrity/next (1d6d167c2efc KEYS: refcount bug fix)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (388f7b1d6e8c Linux 4.5-rc3)
Merging iommu/next (fd6b6b40c17e Merge branches 'iommu/fixes' and 'arm/rockchip' into next)
Merging dwmw2-iommu/master (fda3bec12d09 iommu/vt-d: Fix 64-bit accesses to 32-bit DMAR_GSTS_REG)
Merging vfio/next (d4f50ee2f5b4 vfio/iommu_type1: make use of info.flags)
Merging jc_docs/docs-next (5645a717c6ee Documentation: HOWTO: remove obsolete info about regression postings)
Merging trivial/for-next (e9bf1d57f0a0 drivers/rtc: broken link fix)
Applying: kernel/memremap.c: add new arg to dev_WARN
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (b8c15a91f1fe Merge branches 'dt/next' and 'dt/linus' into for-next)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (e908e75fc383 Merge remote-tracking branch 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (f864fe9a9259 Merge branch 'x86/mm')
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (9bf4f0056720 EDAC: Use edac_debugfs_remove_recursive() in edac_debugfs_exit())
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (7fd13615992a tracing/dma-buf/fence: Fix timeline str value on fence_annotate_wait_on)
Merging rcu/rcu/next (0dd1befbc663 rcu: Remove expedited GP funnel-lock bypass)
Merging kvm/linux-next (bce87cce88c7 KVM: x86: consolidate different ways to test for in-kernel LAPIC)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b4d7f161feb3 KVM: PPC: Fix ONE_REG AltiVec support)
Merging kvms390/next (1763f8d09d52 KVM: s390: bail out early on fatal signal in dirty logging)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (d6e022f1d207 workqueue: handle NUMA_NO_NODE for unbound pool_workqueue lookup)
Merging drivers-x86/for-next (9df7fc9a9657 toshiba_acpi: Add a module parameter to disable hotkeys registration)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (02ce716f8000 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/irq' into regmap-next)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (ee2e1c2d18a4 leds: leds-gpio: Fix return value check in create_gpio_led())
Merging ipmi/for-next (7f8df84ecba8 ipmi_si: Avoid a wrong long timeout on transaction done)
Merging driver-core/driver-core-next (67d02a1bbb33 driver-core: platform: probe of-devices only using list of compatibles)
Merging tty/tty-next (54573c4a073f xen/hvc: constify hv_ops structures)
CONFLICT (content): Merge conflict in drivers/tty/tty_io.c
Merging usb/usb-next (a44007a42dfd drivers: usb: removed assignment of 0 to static variables)
Merging usb-gadget/next (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-serial/usb-next (92e963f50fc7 Linux 4.5-rc1)
Merging usb-chipidea-next/ci-for-usb-next (6b8bc9c6fb26 usb: chipidea: udc: remove unused value assignment)
Merging staging/staging-next (8c79c49c803d staging: iio: Remove parantheses around right hand side of assignment)
CONFLICT (modify/delete): drivers/staging/dgap/dgap.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/dgap/dgap.c left in tree.
$ git rm -f drivers/staging/dgap/dgap.c
Merging char-misc/char-misc-next (990162f03840 char: nwbutton: avoid unused variable warning)
Merging extcon/extcon-next (0331966df0a2 arm: boot: beaglex15: pass correct interrupt)
Merging cgroup/for-next (9a2ddda572a0 Documentation: cgroup: Fix 'cgroup-legacy' -> 'cgroup-v1')
Merging scsi/for-next (1440a6835981 Merge branch 'misc' into for-next)
Merging target-updates/for-next (fab683eb12e7 scsi: qla2xxxx: avoid type mismatch in comparison)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (45d1df700a55 Merge branch 'devel' into for-next)
Merging vhost/linux-next (481eaec37e91 tools/virtio: add ringtest utilities)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (8d68bb842800 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (ff01c944cfa9 pwm: Mark all devices as "might sleep")
Merging dma-buf/for-next (168309855a7d Linux 4.4-rc8)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (7e0810c9485c clk: lpc32xx: add HCLK PLL output configuration)
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
Merging coresight/next (37fe87dbde16 coresight: implementing 'cpu_id()' API)
Merging rtc/rtc-next (9d4be765c76d drivers: rtc: allow compilation of sun6i RTC for all sunxi SoCs)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (234d02a19863 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (2c1975dd89fc drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
