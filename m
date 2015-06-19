From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: Tree for Jun 19
Date: Fri, 19 Jun 2015 15:16:02 +1000
Message-ID: <1434690962.23771.11.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57677 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbbFSFQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Jun 2015 01:16:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20150618:

The v4l-dvb tree gained a build failure.

The kvm tree gained a conflict against the tip tree.

The drivers-x86 tree gained some conflicts against the pm tree.

Non-merge commits (relative to Linus' tree): 11423
 9716 files changed, 1038136 insertions(+), 242673 deletions(-)

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
Merging origin/master (17fda38f1595 Merge tag 'trace-fix-filter-4.1-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
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
Merging net/master (2dab80a8b486 bridge: fix br_stp_set_bridge_priority race conditions)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once at start of day.)
Merging sound-current/for-linus (145c0e914d2c ALSA: hda - Fix unused label skip_i915)
Merging pci-current/for-linus (552bc94ebeeb PCI: Preserve resource size during alignment reordering)
Merging wireless-drivers/master (38fe44e61a89 Merge tag 'iwlwifi-for-kalle-2015-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging tty.current/tty-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb.current/usb-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect __init/__exit annotations)
Merging usb-serial-fixes/usb-linus (0f57d86787d8 Linux 4.1-rc8)
Merging staging.current/staging-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (469d7d22cea1 Input: pixcir_i2c_ts - fix receive error)
Merging crypto-current/master (412c98c1bef6 crypto: caam - fix RNG buffer cache alignment)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (f36963c9d3f6 cpumask_set_cpu_local_first => cpumask_local_spread, lament)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (245ec9d85696 Revert "drm/i915: Don't skip request retirement if the active list is empty")
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (9907203dd026 ARC: intc: split into ARCompact ISA specific, common bits)
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
Merging mvebu/for-next (efeda1519ed0 Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (8e638875387f Merge tag 'omap-for-v4.2/wakeirq-drivers-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into next)
Merging samsung/for-next (7585f44e561e Merge branch 'v4.2-next/dt64-samsung' into for-next)
Merging sunxi/sunxi/for-next (11f9fb71e172 Merge branch 'sunxi/dt-for-4.2' into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-next)
Merging arm64/for-next/core (4e2ee96a63d4 arm64: compat: print compat_sp instead of sp)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symbol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
Merging h8300/h8300-next (1c948ec63ab3 Merge branch 'h8300-next' of git.sourceforge.jp:/gitroot/uclinux-h8/linux into h8300-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (73cb9dc0cd8d m68k: Use vsprintf %pM extension)
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
Merging powerpc-mpe/next (b5926430dfa0 powerpc/iommu/ioda2: Enable compile with IOV=on and IOMMU_API=off)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (7fc611ff3ff1 s390/pci: improve handling of hotplug event 0x301)
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
Merging ext4/dev (8b6d8f1be835 jbd2: get rid of open coded allocation retry loop)
Merging f2fs/dev (3c4541452748 f2fs: do not trim preallocated blocks when truncating after i_size)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (e7ccaf5fe159 GFS2: Don't add all glocks to the lru)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (dfad7000f32e nfs: Fix comment for nfs_pageio_init() and nfs_pageio_complete_mirror())
Merging nfsd/nfsd-next (185406191af5 nfsd: Allows user un-mounting filesystem where nfsd exports base on)
Merging overlayfs/overlayfs-next (3ed6b3b4255d ovl: allow distributed fs as lower layer)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushes)
Merging xfs/for-next (4ea79766168b Merge branch 'xfs-commit-cleanup' into for-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (4ef51e8b7aaa Merge branch 'for-linus' into for-next)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in HEAD and modified in vfs/for-next. Version vfs/for-next of fs/hppfs/hppfs.c left in tree.
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
$ git rm -f fs/hppfs/hppfs.c
Applying: f2fs: merge fix for follow_link changes
Merging pci/next (7a3e9b247e80 Merge branches 'pci/host-xgene' and 'pci/hotplug' into next)
Merging hid/for-next (c0f37da04b5b Merge branch 'for-4.2/upstream' into for-next)
Merging i2c/i2c/for-next (36f909cdafdc Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addresses can be probed)
Merging dmi/master (bec755ee1080 firmware: dmi: struct dmi_header should be packed)
Merging hwmon-staging/hwmon-next (f6725ae2f1ae hwmon: (ntc_thermistor) Improve precision of resistance calculation)
Merging v4l-dvb/master (fdf11845cbc1 bdisp-debug: don't try to divide by s64)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (fad6f9d58c07 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (782e4c3c06e0 Merge branches 'pnp' and 'pm-tools')
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (111b23cf895b Merge branches 'release' and 'thermal-soc' of .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (abea4d0a025b Merge branch 'topic/xdmac' into next)
Merging net-next/master (b67ea97fcd4e Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx4/main.c
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (40b503c76481 brcmfmac: make brcmf_p2p_detach() call conditional)
Merging bluetooth/master (952497b15946 Bluetooth: Fix warning of potentially uninitialized adv_instance variable)
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/verbs.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/sge.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx4/mad.c
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (0eb8618bd075 mtd: docg3: Fix kasprintf() usage)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging crypto/master (596103cf8fb0 crypto: drivers - Fix Kconfig selects)
CONFLICT (content): Merge conflict in net/ipv6/esp6.c
CONFLICT (content): Merge conflict in net/ipv4/esp4.c
Merging drm/drm-next (0dc499aff57f Merge branch 'virtio-gpu-drm-next' of git://git.kraxel.org/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
Applying: drm/amdgpu: fix the build on big endian
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add bus format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (4ed9fb371ccd drm/i915: Don't set enabled value of all CRTCs when restoring the mode)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Registers are 32-bit)
Merging drm-misc/topic/drm-misc (30616e4fe017 drm: Avoid the double clflush on the last cache line in drm_clflush_virt_range())
Merging drm-exynos/exynos-drm/for-next (fb6ba97a9015 drm/exynos: fimd: fix page fault issue with iommu)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits after hang)
Merging sound/for-next (d39513f85163 ALSA: HDAC: move SND_HDA_PREALLOC_SIZE to core)
Merging sound-asoc/for-next (ba0875610d5f Merge remote-tracking branches 'asoc/topic/wm8741' and 'asoc/topic/wm8995' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs for sig_enforce declaration)
Merging input/next (84c88ef9affb MAINTAINERS: remove non existent input mt git tree)
Merging block/for-next (940ce5604f91 Merge branch 'for-4.2/writeback' into for-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/backing-dev.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
CONFLICT (content): Merge conflict in MAINTAINERS
Merging device-mapper/for-next (e262f3474152 dm stats: add support for request-based DM devices)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEMPT=n)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (53f1d5b6f311 md: clear Blocked flag on failed devices when array is read-only.)
Merging mfd/for-mfd-next (00479c6fe51f mfd: lpc_ich: Assign subdevice ids automatically)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simplify usage of devm_gpiod_get_optional)
Merging battery/master (85a5965e1dc5 wm831x_power: Fix off-by-one at free_irq())
Merging omap_dss2/for-next (a8998202c1d8 Merge omapdss componentization work)
Merging regulator/for-next (af937c032fc6 Merge remote-tracking branches 'regulator/topic/of', 'regulator/topic/pwm', 'regulator/topic/qcom' and 'regulator/topic/soft-start' into regulator-next)
Merging security/next (b3bddffd35a0 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next and modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (e72cb910fd8d watchdog: da9062: DA9062 watchdog driver)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (49d25d04b661 Merge branches 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'default-domains' and 'core' into next)
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
Merging spi/for-next (fda052b0a522 Merge remote-tracking branches 'spi/topic/sirf', 'spi/topic/spidev' and 'spi/topic/zynq' into spi-next)
Merging tip/auto-latest (9028a5f33a9f Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
CONFLICT (content): Merge conflict in drivers/iommu/intel_irq_remapping.c
CONFLICT (content): Merge conflict in drivers/iommu/dmar.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/ghash.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/aes_cbc.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/aes.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE_ONCE()
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevents/4.2' into clockevents/next)
CONFLICT (add/add): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (f75be5d2efa9 EDAC, mce_amd_inj: Make it depend on AMD_NB)
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
CONFLICT (content): Merge conflict in arch/x86/kvm/lapic.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Applying: kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
Merging kvm-arm/next (c62e631d4a8e KVM: arm/arm64: vgic: Remove useless arm-gic.h #include)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_dying())
Merging workqueues/for-next (402dd89d6cdb workqueue: fix typos in comments)
Merging drivers-x86/for-next (5ee7041e5bc0 MAINTAINERS: Orphan x86 driver msi-wmi)
CONFLICT (content): Merge conflict in drivers/platform/x86/samsung-laptop.c
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
CONFLICT (content): Merge conflict in drivers/platform/x86/asus-wmi.c
CONFLICT (content): Merge conflict in drivers/platform/x86/apple-gmux.c
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (970284e6d6f5 Merge remote-tracking branches 'regmap/topic/defaults', 'regmap/topic/irq' and 'regmap/topic/reg-params' into regmap-next)
Merging hsi/for-next (1269594a93bb HSI: nokia-modem: use flags argument of devm_gpiod_get to set direction)
Merging leds/for-next (e0dd268a2c98 leds: aat1290: pass flags parameter to devm_gpiod_get)
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was only read)
Merging driver-core/driver-core-next (0e6c861f73ec Revert "base/platform: Only insert MEM and IO resources")
Merging tty/tty-next (48a6092fb41f serial: stm32-usart: Add STM32 USART Driver)
Merging usb/usb-next (50641056d833 usb: dwc3: Use ASCII space in Kconfig)
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUSY too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_timer)
Merging staging/staging-next (8efba0e0d013 staging: sm7xxfb: fix camelcase)
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
Merging cgroup/for-next (8a0792ef8e01 cgroup: add delegation section to unified hierarchy documentation)
Merging scsi/for-next (24136f2c0b3b snic: driver for Cisco SCSI HBA)
CONFLICT (content): Merge conflict in drivers/target/target_core_user.c
Merging target-updates/for-next (7517784592fc target/user: Fix inconsistent kmap_atomic/kunmap_atomic)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (323de9efdf3e pinctrl: make pinctrl_register() return proper error code)
Merging vhost/linux-next (fa5f6add30c7 tun, macvtap: higher order allocations for skbs)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (f35bbf61ab77 gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (c97648cb2f34 mnt: Update fs_fully_visible to test for permanently empty directories)
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variable)
Merging clk/clk-next (a85fa007b772 MAINTAINERS: update email for Michael Turquette)
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (c99ee51a9d97 selftests: add seccomp suite)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (507a76d5f701 Merge branch 'for-4.1/upstream-fixes' into for-next)
Merging coresight/next (486ea46dfc88 coresight-etm3x: Add Qualcomm PTM v1.1 peripheral ID)
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight-replicator-qcom.c
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight-etm4x.c
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (5dc75a07f884 rtc: pfc8563: fix uninitialized variable warning)
Merging init/init-v4.1-rc6 (bc3e452003d0 module: relocate module_init from init.h to module.h)
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Applying: drivers/hwtracing: fix coresight-replicator-qcom implicit <module.h> usage
Applying: drivers/hwtracing: fix coresight-etm4x implicit <module.h> usage
Merging akpm-current/current (d74235fc3a7f scsi-resolve-sg-buffer-const-ness-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykiller.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/nvme-core.c: fix build with gcc-4.4.4
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
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
Applying: mm: provide new get_vaddr_frames() helper
Applying: mm-provide-new-get_vaddr_frames-helper-fix
Applying: media: omap_vout: convert omap_vout_uservirt_to_phys() to use get_vaddr_pfns()
Applying: vb2: provide helpers for mapping virtual addresses
Applying: media: vb2: convert vb2_dma_sg_get_userptr() to use frame vector
Applying: media: vb2: Convert vb2_vmalloc_get_userptr() to use frame vector
Applying: media: vb2: convert vb2_dc_get_userptr() to use frame vector
Applying: media: vb2: remove unused functions
Applying: drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_frames()
Applying: mm: move get_vaddr_frames() behind a config option
Applying: mm-move-get_vaddr_frames-behind-a-config-option-fix
Applying: genalloc: rename dev_get_gen_pool() to gen_pool_get()
Applying: genalloc: rename of_get_named_gen_pool() to of_gen_pool_get()
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (95bc0492c9be drivers/w1/w1_int.c: call put_device if device_register fails)
