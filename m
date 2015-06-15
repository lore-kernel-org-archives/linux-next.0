From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: Tree for Jun 15
Date: Mon, 15 Jun 2015 19:05:28 +1000
Message-ID: <1434359128.19706.9.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38100 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755846AbbFOJFa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2015 05:05:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20150612:

The arm-soc tree lost its build failure.

The rdma tree gained two conflicts against the net-next tree.

The tip tree lost its build failure.

The staging tree gained a conflict against the rdma tree.

Non-merge commits (relative to Linus' tree): 10544
 9271 files changed, 997810 insertions(+), 222890 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log files
in the Next directory.  Between each merge, the tree was built with
a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
multi_v7_defconfig for arm. After the final fixups (if any), it is also
built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
allyesconfig (this fails its final link) and i386, sparc, sparc64 and arm
defconfig.

Below is a summary of the state of the merge.

I am currently merging 219 trees (counting Linus' and 31 trees of patches
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.


cheers


$ git checkout master
$ git reset --hard stable
Merging origin/master (c8d17b451aa1 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (0bbe6b5a73c0 ARM: 8388/1: tcm: Don't crash when TCM banks are protected by TrustZone)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds array index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (c65b99f04684 Linux 4.1-rc6)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging net/master (2d45a02d0166 sctp: fix ASCONF list handling)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once at start of day.)
Merging sound-current/for-linus (535115b5ff51 ALSA: hda - Abort the probe without i915 binding for HSW/BDW)
Merging pci-current/for-linus (552bc94ebeeb PCI: Preserve resource size during alignment reordering)
Merging wireless-drivers/master (38fe44e61a89 Merge tag 'iwlwifi-for-kalle-2015-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging tty.current/tty-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb.current/usb-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect __init/__exit annotations)
Merging usb-serial-fixes/usb-linus (df72d588c54d USB: cp210x: add ID for HubZ dual ZigBee and Z-Wave dongle)
Merging staging.current/staging-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (7f2ca8b55aef Input: synaptics - add min/max quirk for Lenovo S540)
Merging crypto-current/master (f858c7bcca8c crypto: algif_aead - Disable AEAD user-space for now)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (f36963c9d3f6 cpumask_set_cpu_local_first => cpumask_local_spread, lament)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (2a8b35837c51 drm/i915: Always reset vma->ggtt_view.pages cache on unbinding)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (3596ba60b383 ARC: [axs101] Add missing __init annotations)
Merging arm/for-next (9ce93bdda7b7 ARM: fix new BSYM() usage introduced via for-arm-soc branch)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_cpu}.c)
Merging arm-soc/for-next (1f697b6bbd68 Merge branch 'next/dt' into for-next)
Merging at91/at91-next (dd1f58f398fb Merge branch 'at91-4.2-dt' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' and 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (7f8ad9c26be9 Merge branch 'berlin/simple-mfd' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (5bfaa924477b Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (96a9fef8a7fa Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (8e638875387f Merge tag 'omap-for-v4.2/wakeirq-drivers-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into next)
Merging samsung/for-next (7585f44e561e Merge branch 'v4.2-next/dt64-samsung' into for-next)
Merging sunxi/sunxi/for-next (11f9fb71e172 Merge branch 'sunxi/dt-for-4.2' into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-next)
Merging arm64/for-next/core (c7d6b573fe55 arm64: mm: remove reference to tlb.S from comment block)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symbol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (7a7c68de60cf CRISv10: delete unused lib/dmacopy.c)
Merging h8300/h8300-next (2ced81d35808 h8300: fix typo.)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (d46ff69b3f18 Merge branch 'paravirt' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (ba155e2d21f6 Linux 4.1-rc5)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' argument to 'kthread_arg')
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary struct pci_dev declaration)
Merging mips/mips-for-linux-next (939bc40371c1 Merge branch '4.1-fixes' into mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Makefile
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Kconfig
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (238abecde8ad powerpc: Don't use gcc specific options on clang)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (7c53fcb39fdd s390/dasd: Enable automatic loading of dasd_diag_mod)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (5316a64ce518 tile: avoid a "label not used" warning in do_page_fault())
Merging uml/linux-next (6c684465587a um: Fix warning in setup_signal_stack_si())
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgroup relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buckets)
Merging cifs/for-next (843b06f1f0cb client MUST ignore EncryptionKeyLength if CAP_EXTENDED_SECURITY is set)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (660947160c07 ext4 crypto: fail the mount if blocksize != pagesize)
Merging f2fs/dev (3c4541452748 f2fs: do not trim preallocated blocks when truncating after i_size)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (86066914edff gfs2: Don't support fallocate on jdata	files)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (6f02dc88be1d nfs: deny backchannel RPCs with an incorrect authflavor instead of dropping them)
Merging nfsd/nfsd-next (185406191af5 nfsd: Allows user un-mounting filesystem where nfsd exports base on)
Merging overlayfs/overlayfs-next (3ed6b3b4255d ovl: allow distributed fs as lower layer)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushes)
Merging xfs/for-next (4ea79766168b Merge branch 'xfs-commit-cleanup' into for-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (8f827ea23701 Merge branch 'for-linus' into for-next)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in HEAD and modified in vfs/for-next. Version vfs/for-next of fs/hppfs/hppfs.c left in tree.
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
$ git rm -f fs/hppfs/hppfs.c
Applying: f2fs: merge fix for follow_link changes
Merging pci/next (4d5da4d918f7 Merge branches 'pci/host-designware-common' and 'pci/host-xgene' into next)
Merging hid/for-next (9c5cb4288373 Merge branch 'for-4.2/plantronics' into for-next)
Merging i2c/i2c/for-next (c3413f46e575 Merge branch 'i2c/for-4.2' into i2c/for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addresses can be probed)
Merging dmi/master (bec755ee1080 firmware: dmi: struct dmi_header should be packed)
Merging hwmon-staging/hwmon-next (f6725ae2f1ae hwmon: (ntc_thermistor) Improve precision of resistance calculation)
Merging v4l-dvb/master (52d0f6e95987 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (2a04432609a7 Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (72edb9faf1d5 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (45423299db3a Merge branches 'pnp' and 'pm-tools')
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (e27f74ae45b3 Merge branches 'for-rc' and 'release' of .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (abea4d0a025b Merge branch 'topic/xdmac' into next)
Merging net-next/master (758f0d4b16e0 tcp: cdg: use div_u64())
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (49280625eb82 bcma: lower dependency of BCMA_DRIVER_PCI_HOSTMODE)
Merging bluetooth/master (789a99ecb9cb fakelb: add xmit_async after stop testcase)
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/sge.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (e5babdf928e5 mtd: dc21285: use raw spinlock functions for nw_gpio_lock)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging crypto/master (81781e681551 crypto: picoxcell - Clamp AEAD SG list by input length)
CONFLICT (content): Merge conflict in net/ipv6/esp6.c
CONFLICT (content): Merge conflict in net/ipv4/esp4.c
Merging drm/drm-next (5c70c464787f Merge tag 'drm-intel-next-fixes-2015-06-11' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
Applying: drm/amdgpu: fix the build on big endian
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add bus format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (bf546f8158e2 drm/i915/skl: Fix DMC API version in firmware file name)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Registers are 32-bit)
Merging drm-misc/topic/drm-misc (0f5c41dbe96a Documentation/drm: Update rotation property)
Merging drm-exynos/exynos-drm/for-next (06f11fcd3f83 drm/exynos: ipp: validate a GEM handle with multiple planes)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits after hang)
Merging sound/for-next (70a3887a8d84 ALSA: hda-beep: Update authors dead email address)
Merging sound-asoc/for-next (f70d26bdf495 Merge remote-tracking branches 'asoc/topic/wm8523' and 'asoc/topic/wm8741' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs for sig_enforce declaration)
Merging input/next (e70b03071c5d Input: goodix - export id and version read from device)
Merging block/for-next (0eb6d79bdf9a Merge branch 'for-4.2/sg' into for-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/backing-dev.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
CONFLICT (content): Merge conflict in MAINTAINERS
Merging device-mapper/for-next (3fbf39cc36c0 dm stats: add support for request-based DM devices)
Merging pcmcia/master (d19319affb6c pcmcia: Fix resource leaks in yenta_probe() and _close())
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (048fd7e665ce mmc: dw_mmc: insmod followed by rmmod will hung for eMMC)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3bfd86ccbf1f md/raid5: ignore released_stripes check)
Merging mfd/for-mfd-next (bdb2ad5f4b95 mfd: si476x-i2c: Pass the IRQF_ONESHOT flag)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simplify usage of devm_gpiod_get_optional)
Merging battery/master (3d7f1800af0e power_supply: rt9455_charger: Fix error reported by static analysis tool)
Merging omap_dss2/for-next (99e62ef2edcc video: fbdev: mxsfb: Constify platform_device_id)
Merging regulator/for-next (39de46112cbb Merge remote-tracking branches 'regulator/topic/of' and 'regulator/topic/pwm' into regulator-next)
Merging security/next (d6f7aa27f41d Merge branch 'smack-for-4.2-stacked' of https://github.com/cschaufler/smack-next into next)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next and modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (3664ac9f2cff ima: update builtin policies)
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (e72cb910fd8d watchdog: da9062: DA9062 watchdog driver)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (05eb388bbe39 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'default-domains' and 'core' into next)
Merging dwmw2-iommu/master (c83b2f20fdde iommu/vt-d: Only enable extended context tables if PASID is supported)
Merging vfio/next (20f300175a1e vfio/pci: Fix racy vfio_device_get_from_dev() call)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentation)
Merging jc_docs/docs-next (f8785d94fc4e Merge branch 'doc/4.2' into docs-next)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negative/)
Merging audit/next (0b08c5e59441 audit: Fix check of return value of strnlen_user())
CONFLICT (content): Merge conflict in security/lsm_audit.c
Merging devicetree/devicetree/next (ce32f859646b of/fdt: fix argument name and add comments of unflatten_dt_node())
Merging dt-rh/for-next (63a4aea55670 of: clean-up unnecessary libfdt include paths)
Merging mailbox/mailbox-for-next (07a7dba17132 dt: mailbox: Remove 'mbox-names property is discouraged' message from binding)
Merging spi/for-next (f999ef9a3e43 Merge remote-tracking branches 'spi/topic/spidev' and 'spi/topic/zynq' into spi-next)
Merging tip/auto-latest (0033cf235e79 Merge branch 'x86/mm')
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
CONFLICT (content): Merge conflict in include/linux/intel-iommu.h
CONFLICT (content): Merge conflict in drivers/iommu/intel_irq_remapping.c
CONFLICT (content): Merge conflict in drivers/iommu/dmar.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE_ONCE()
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevents/4.2' into clockevents/next)
CONFLICT (add/add): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (31fec261002e EDAC, altera: Do not allow suspend when EDAC is enabled)
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/tile/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/apm/apm-storm.dtsi
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (33d657d13810 ring-buffer-benchmark: Fix the wrong type)
Merging rcu/rcu/next (66709041ffca cpu: Wait for RCU grace periods concurrently)
Merging kvm/linux-next (e80a4a9426ad KVM: x86: mark legacy PCI device assignment as deprecated)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Applying: kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
Merging kvm-arm/next (3520469d65f2 KVM: export __gfn_to_pfn_memslot, drop gfn_to_pfn_async)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_dying())
Merging workqueues/for-next (402dd89d6cdb workqueue: fix typos in comments)
Merging drivers-x86/for-next (9330dcdd918a samsung-laptop: Use acpi_video_unregister_backlight instead of acpi_video_unregister)
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (385faaeab062 Merge remote-tracking branches 'regmap/topic/defaults', 'regmap/topic/irq' and 'regmap/topic/reg-params' into regmap-next)
Merging hsi/for-next (1269594a93bb HSI: nokia-modem: use flags argument of devm_gpiod_get to set direction)
Merging leds/for-next (589fca16c14a leds: add BCM6358 LED driver)
Merging ipmi/for-next (10120805c041 ipmi: Convert the IPMI SI ACPI handling to a platform device)
Merging driver-core/driver-core-next (0e6c861f73ec Revert "base/platform: Only insert MEM and IO resources")
Merging tty/tty-next (48a6092fb41f serial: stm32-usart: Add STM32 USART Driver)
Merging usb/usb-next (50641056d833 usb: dwc3: Use ASCII space in Kconfig)
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUSY too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_timer)
Merging staging/staging-next (5c10439849f7 vme: tsi148: depend on HAS_DMA for Kconfig)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API change
Applying: staging: disable the WILC1000 driver
Merging char-misc/char-misc-next (5069288bd477 MAINTAINERS: mei: add mei_cl_bus.h to maintained file list)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
CONFLICT (content): Merge conflict in include/dt-bindings/mfd/arizona.h
Applying: power: axp288_charger: fix for API change
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name() function pointer of extcon_dev)
Merging kdbus/kdbus (cf15adc8b481 kdbus: use FIELD_SIZEOF in kdbus_member_set_user macro)
Merging cgroup/for-next (4a705c5c786d cgroup: fix uninitialised iterator in for_each_subsys_which)
Merging scsi/for-next (24136f2c0b3b snic: driver for Cisco SCSI HBA)
CONFLICT (content): Merge conflict in drivers/target/target_core_user.c
Merging target-updates/for-next (a6fd1b94e964 target: Drop duplicate + unused se_dev_check_wce)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (323de9efdf3e pinctrl: make pinctrl_register() return proper error code)
Merging vhost/linux-next (fa5f6add30c7 tun, macvtap: higher order allocations for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatch warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (f35bbf61ab77 gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (c97648cb2f34 mnt: Update fs_fully_visible to test for permanently empty directories)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variable)
Merging clk/clk-next (46965688acd0 clk: meson: add some error handling in meson_clk_register_cpu())
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (390db010c960 selftest, x86: fix incorrect comment)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (507a76d5f701 Merge branch 'for-4.1/upstream-fixes' into for-next)
Merging coresight/next (486ea46dfc88 coresight-etm3x: Add Qualcomm PTM v1.1 peripheral ID)
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight-replicator-qcom.c
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight-etm4x.c
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (bfaee8adc12c rtc: hym8563: make the irq optional)
Merging init/init-v4.1-rc6 (74bac48fa571 module: relocate module_init from init.h to module.h)
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Applying: drivers/hwtracing: fix coresight-replicator-qcom implicit <module.h> usage
Applying: drivers/hwtracing: fix coresight-etm4x implicit <module.h> usage
Merging akpm-current/current (4ace53bb3d31 scsi-resolve-sg-buffer-const-ness-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykiller.c
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/nvme-core.c: fix build with gcc-4.4.4
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: kernel/relay.c: use kvfree() in relay_free_page_array()
Applying: cxgb3: use kvfree() in cxgb_free_mem()
Applying: cxgb4: use kvfree() in t4_free_mem()
Applying: drm: use kvfree() in drm_free_large()
Applying: drm/nouveau/gem: use kvfree() in u_free()
Applying: IB/ehca: use kvfree() in ipz_queue_{cd}tor()
Applying: target: use kvfree() in session alloc and free
Applying: libcxgbi: use kvfree() in cxgbi_free_big_mem()
Applying: bcache: use kvfree() in various places
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void
Applying: MAINTAINERS: update Emulex ocrdma email addresses
Applying: MAINTAINERS: remove website for paride
Applying: MAINTAINERS: update sound soc intel patterns
Applying: MAINTAINERS: update brcm dts pattern
Applying: MAINTAINERS: update brcm gpio filename pattern
Applying: MAINTAINERS: remove unused nbd.h pattern
Applying: MAINTAINERS: move Jens Osterkamp to CREDITS
Applying: MAINTAINERS: BCACHE: Kent Overstreet has changed email address
Applying: MAINTAINERS: add zpool
Applying: x86: opt into HAVE_COPY_THREAD_TLS, for both 32-bit and 64-bit
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (56faf172fea2 drivers/w1/w1_int.c: call put_device if device_register fails)
