From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 22
Date: Tue, 22 Dec 2015 16:29:55 +1100
Message-ID: <20151222162955.3f366781@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51893 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753515AbbLVF36 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Dec 2015 00:29:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151221:

I added a patch to the orangefs tree for a post release discovered
build failure.

The i2c tree still had its build failure for which I applied a patch.

The drm tree gained a conflict against the imx-mxs tree.

The drm-intel tree gained a conflict against Linus' tree.

The pinctrl tree lost its build failure.

The gpio tree lost its build failure.

Non-merge commits (relative to Linus' tree): 7020
 7310 files changed, 290228 insertions(+), 117897 deletions(-)

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
Merging origin/master (4ef7675344d6 Linux 4.4-rc6)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (07fd7d4bbcb9 ARC: Fix linking errors with CONFIG_MODULE + CONFIG_CC_OPTIMIZE_FOR_SIZE)
Merging arm-current/fixes (34bfbae33ae8 ARM: 8475/1: SWP emulation: Restore original *data when failed)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (036592fbbe75 powerpc/opal-irqchip: Fix deadlock introduced by "Fix double endian conversion")
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73796d8bf273 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging net/master (987aaad93a4c Merge branch 'cdc_ncm-new-Dell-devices')
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (01d85b9b2b6b Merge tag 'iwlwifi-for-kalle-2015-12-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (cf1e05c63642 mac80211: handle width changes from opmode notification IE in beacon)
Merging sound-current/for-linus (3e6db33aaf1d ALSA: hda - Set SKL+ hda controller power at freeze() and thaw())
Merging pci-current/for-linus (1dbe162d53e1 PCI: hisi: Fix hisi_pcie_cfg_read() 32-bit reads)
Merging driver-core.current/driver-core-linus (4ef7675344d6 Linux 4.4-rc6)
Merging tty.current/tty-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb.current/usb-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb-gadget-fixes/fixes (7d32cdef5356 usb: musb: fail with error when no DMA controller set)
Merging usb-serial-fixes/usb-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging char-misc.current/char-misc-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging input-current/for-linus (478e5ed1c3f6 Input: elants_i2c - fix wake-on-touch)
Merging crypto-current/master (70d906bc1750 crypto: skcipher - Copy iv from desc even for 0-len walks)
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (4ef7675344d6 Linux 4.4-rc6)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (380cc68e0725 ARC: Fix linking errors with CONFIG_MODULE + CONFIG_CC_OPTIMIZE_FOR_SIZE)
Merging arm/for-next (952b96ba23e3 Merge branch 'misc-rc6' into for-next)
Merging arm-perf/for-next/perf (60792ad349f3 arm64: kernel: enforce pmuserenr_el0 initialization and restore)
Merging arm-soc/for-next (3ae1a2188c50 ARM: SoC: document merges)
Merging at91/at91-next (f2837af0c89d Merge branch 'at91-4.5-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (cb5b419bfc89 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (f4841e44e95c Merge branch 'mvebu/defconfig' into HEAD)
Merging omap/for-next (115e4e42fb8f Merge branch 'omap-for-v4.5/dt' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (47870b041290 Merge branch 'scm-wip' into qcom-next)
Merging renesas/next (c546828f1614 Merge branches 'heads/arm64-defconfig-for-v4.5', 'heads/arm64-dt-for-v4.5', 'heads/defconfig-for-v4.5', 'heads/dt-for-v4.5' and 'heads/gic-cleanup-for-v4.5' into next)
Merging rockchip/for-next (755651cf0f31 Merge tag 'v4.4-rc5' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/platsmp.c
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (945028c273a7 Merge branch 'next/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging sunxi/sunxi/for-next (211386c8c024 Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
Merging tegra/for-next (f4dc1ae37415 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/Kconfig
Merging arm64/for-next/core (c9cd0ed925c0 arm64: traps: address fallout from printk -> pr_* conversion)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (82271533321d irqchip: renesas-h8s: Replace ctrl_outw/ctrl_inw with writew/readw)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (ea8d65ad6958 m68k/defconfig: Update defconfigs for v4.4-rc1)
Merging m68knommu/for-next (9f9499ae8e64 Linux 4.4-rc5)
Merging metag/for-next (f23d0e2468bc MAINTAINERS: Change Meta arch port status to Odd Fixes)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (6eae2f5fb44a Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (71a71fb5374a parisc: Fix syscall restarts)
Merging powerpc/next (e9d764f80396 powerpc/pseries: Enable kernel CPU dlpar from sysfs)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (11b64c8acca0 s390/cio: Change I/O instructions from inline to normal functions)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (92e831e94761 tile: include the syscall number in the backtrace)
Merging uml/linux-next (887a9853092c um: fix returns without va_end)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (181a15048df3 [SMB3] Prepare for encryption support (first part). Add decryption and encryption key generation. Thanks to Metze for helping with this.)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (331221fac721 fs: make quota/dquot.c explicitly non-modular)
Merging ext4/dev (dde86e3169da ext4 crypto: add missing locking for keyring_key access)
Merging f2fs/dev (4cf185379b75 f2fs: add a tracepoint for sync_dirty_inodes)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (6cc4b6e801c7 GFS2: Don't do glock put on when inode creation fails)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (4ef7675344d6 Linux 4.4-rc6)
Merging nfsd/nfsd-next (bb68eecef23e lockd: Register callbacks on the inetaddr_chain and inet6addr_chain)
Merging orangefs/for-next (62441fa53bcc Orangefs: validate resp.listxattr.returned_count)
CONFLICT (content): Merge conflict in Makefile
Applying: orangefs: fix typo in ornagefs_inode_lock
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (6b238de189f6 mtd: ubi: don't leak e if schedule_erase() fails)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (9189922675ec fs: make locks.c explicitly non-modular)
Merging vfs/for-next (70561de575c3 Merge branches 'work.misc', 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in drivers/s390/char/zcore.c
Applying: orangfs: update for follow_link to get_link change
Merging pci/next (c6123e06042d Merge branches 'pci/host-generic', 'pci/host-imx6', 'pci/host-iproc' and 'pci/host-rcar' into next)
Merging hid/for-next (268b5aeadcd9 Merge branch 'for-4.5/core' into for-next)
Merging i2c/i2c/for-next (5e9b06f45e1d Merge branch 'i2c/for-4.5' into i2c/for-next)
Applying: ii2c: rename i2c_timings struct due to clash with generic version
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (072151bb0154 firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (c60fdf8587ae hwmon: (nct6683,nct6775) constify sensor_template_group structures)
Merging v4l-dvb/master (f9139b43c2ee Merge branch 'devel/media-controller-rc4' into to_next)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
Merging kbuild/for-next (45538834d1f5 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (b72e96c13577 Merge branch 'for-4.5' into for-next)
Merging pm/linux-next (a9fd8af97f48 Merge branch 'acpi-debug' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal-soc/next (ce0265dd6f8e thermal: trip_point_temp_store() calls thermal_zone_device_update())
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (f9166b3aaff0 Merge branch 'topic/univ_api' into next)
Merging net-next/master (076ef440708b ibmveth: consolidate kmalloc of array, memset 0 to kcalloc)
CONFLICT (content): Merge conflict in include/linux/pci_ids.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
Merging wireless-drivers-next/master (541c9a84cd85 ssb: pick SoC invariants code from MIPS BCM47xx arch)
Merging bluetooth/master (806f50c729c2 Bluetooth: hci_bcm: Add BCM2E65 ACPI ID)
Merging mac80211-next/master (c45932df5612 regulatory: fix world regulatory domain data)
Merging rdma/for-next (db7489e07669 IB/core, cma: Make __attribute_const__ declarations sparse-friendly)
Merging mtd/master (e488ca9f8d4f doc: dt: mtd: partitions: add compatible property to "partitions" node)
Merging l2-mtd/master (1873315fb156 mtd: sh_flctl: pass FIFO as physical address)
Applying: mtd: nand: fix for drop unnecessary partition parser data
Merging crypto/master (16f080aaadcb crypto: omap - Removed unused variable "err")
Merging drm/drm-next (aa72044a1d22 Merge branch 'drm-etnaviv-next' of git://git.pengutronix.de/git/lst/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (4601b933c9dc drm/i915: Remove obsolete code from intelfb_alloc())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_dp.c
Merging drm-tegra/drm/tegra/for-next (ad906599c191 drm/tegra: Advertise DRIVER_ATOMIC)
Merging drm-misc/topic/drm-misc (e112e593b215 drm: use dev_name as default unique name in drm_dev_alloc())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging sound/for-next (cb41f271d01b ALSA: fm801: restore TEA575x state on resume)
Merging sound-asoc/for-next (1d39ec99e004 Merge remote-tracking branches 'asoc/topic/wm8904', 'asoc/topic/wm8962', 'asoc/topic/wm8974' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (8dcb3c7628f1 Input: egalax_ts_serial - fix potential NULL dereference on error)
Merging block/for-next (4c93772e14f0 Merge branch 'for-4.5/nvme' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Merging device-mapper/for-next (18d03e8c25f1 dm thin: fix race condition when destroying thin pool workqueue)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (867b265352bb mmc: sdhci: restore behavior when setting VDD via external regulator)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (7466ef37e4eb raid5: allow r5l_io_unit allocations to fail)
Merging mfd/for-mfd-next (526c0ab13672 mfd: syscon: Add a DT property to set value width)
Merging backlight/for-backlight-next (ee65ad0e2a9e backlight: pwm_bl: Avoid backlight flicker when probed from DT)
Merging battery/master (f96576bd63e5 power: Fix unmet dependency on POWER_SUPPLY by POWER_RESET by uncoupling them)
Merging omap_dss2/for-next (dd7eb4672d0c Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (d1afafeb6254 Merge remote-tracking branches 'regulator/topic/tps65086', 'regulator/topic/tps65218' and 'regulator/topic/wm831x' into regulator-next)
Merging security/next (ebd68df3f24b Sync to Linus v4.4-rc2 for LSM developers.)
Merging integrity/next (92cc916638a4 security/integrity: make ima/ima_mok.c explicitly non-modular)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (f08879ede8d8 watchdog: add support for Sigma Designs SMP86xx/SMP87xx)
Merging iommu/next (097d7d34e53e Merge branches 's390', 'arm/renesas', 'arm/msm', 'arm/shmobile' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (222e684ca762 vfio/pci: make an array larger)
Merging jc_docs/docs-next (7acccdbc4d0b Doc: treewide: Fix grammar "a" to "an")
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (09eccd1da92b audit: always enable syscall auditing when supported and audit is enabled)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (fcd71d9cc6e3 of: fix declaration of of_io_request_and_map)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (2887bc7f3c10 Merge remote-tracking branches 'spi/topic/sun4i' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (f29c2e03f0b3 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (07cd6bf5f382 MAINTAINERS: Fix EDAC repo URLs format)
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (39daa7b9e895 ftrace: Show all tramps registered to a record on ftrace_bug())
Merging rcu/rcu/next (c95a15835639 sysrq: Fix warning in sysrq generated crash.)
Merging kvm/linux-next (da3f7ca3e856 Merge tag 'kvm-s390-next-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (696066f875bc KVM: PPC: Increase memslots to 512)
Merging kvms390/next (32e6b236d269 KVM: s390: consider system MHA for guest storage)
Merging xen-tip/linux-next (b9fcbcf55dc4 xen/time: use READ_ONCE)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (82607adcf9cd workqueue: implement lockup detector)
Merging drivers-x86/for-next (cd8d25841a65 intel-hid: new hid event driver for hotkeys)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (027617b52003 Merge remote-tracking branches 'regmap/topic/64bit', 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (376886d44f4c leds: bcm6358: remove unneeded busy status check)
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (4ef7675344d6 Linux 4.4-rc6)
Merging tty/tty-next (462a1196a578 Merge 4.4-rc6 into tty-next)
Merging usb/usb-next (bfccd95e7aba Merge 4.4-rc6 into usb-next)
Merging usb-gadget/next (be99c8430095 usb: of: fix build breakage on !OF)
Merging usb-serial/usb-next (365a0442f6de USB: mos7840: remove redundant condition)
Merging usb-chipidea-next/ci-for-usb-next (15af5aea51de usb: chipidea: removing of_find_property)
Merging staging/staging-next (e209f7cc205f staging: comedi: adv_pci1710: rename pci171x_ai_*())
Merging char-misc/char-misc-next (940b68e2c3e4 Drivers: hv: ring_buffer: eliminate hv_ringbuffer_peek())
Merging extcon/extcon-next (08a0a4f987a4 extcon: add Maxim MAX3355 driver)
Merging cgroup/for-next (2a06a115a95e Merge branch 'for-4.5' into for-next)
CONFLICT (content): Merge conflict in init/Kconfig
CONFLICT (content): Merge conflict in include/linux/cgroup_subsys.h
Merging scsi/for-next (ec51994e12da Merge branch 'misc' into for-next)
Merging target-updates/for-next (beccdd6ac780 qla2xxx: Check for online flag instead of active reset when transmitting responses)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (0202a111f8cc pinctrl: bcm/cygnys/iproc: fixup rebase issue)
Merging vhost/linux-next (40bc5b42543b virtio_ring: use smp_store_mb)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (8a3bcf67cc00 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (6604c6556db9 pwm: Add PWM driver for OMAP using dual-mode timers)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (41cabbc24d0a Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (4aaae2f2c74f scripts/kconfig/Makefile: add kselftest-mergeconfig)
Merging y2038/y2038 (8750343a6505 coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (d2b29c2f35a2 coresight: Fix a typo in Kconfig)
Merging rtc/rtc-next (1561c1098dee rtc: Add Epson RX8010SJ RTC driver)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (6b577c9d772c nfit: Adjust for different _FIT and NFIT headers)
Merging akpm-current/current (3e30826f353c ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_ipv4.c
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/memblock.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in drivers/staging/android/ion/ion_chunk_heap.c
CONFLICT (content): Merge conflict in drivers/iommu/intel-iommu.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_64.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/nohash/64/pgtable.h
CONFLICT (content): Merge conflict in arch/arm/mm/dma-mapping.c
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in Makefile
Applying: mm, dax, gpu: merge fix for convert vm_insert_mixed to pfn_t
Applying: mm, dax: convert vmf_insert_pfn_pmd() to pfn_t fix
Applying: fix up for bad merge of arch/powerpc/include/asm/pgtable-ppc64.h: add pmd_[dirty|mkclean] for THP
$ git checkout -b akpm remotes/origin/akpm/master
Applying: include/linux/property.h: fix build issues with gcc-4.4.4
Applying: include-linux-propertyh-fix-build-issues-with-gcc-444-fix
Applying: fs/overlayfs/super.c needs pagemap.h
Applying: fs/adfs/adfs.h: tidy up comments
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
Applying: mm: memcontrol: drop unused @css argument in memcg_init_kmem
Applying: mm: memcontrol: remove double kmem page_counter init
Applying: mm: memcontrol: give the kmem states more descriptive names
Applying: mm: memcontrol: group kmem init and exit functions together
Applying: mm: memcontrol: separate kmem code from legacy tcp accounting code
Applying: mm: memcontrol: move kmem accounting code to CONFIG_MEMCG
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-v2
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-fix
Applying: mm: memcontrol: account "kmem" consumers in cgroup2 memory controller
Applying: mm: memcontrol: allow to disable kmem accounting for cgroup2
Applying: mm: memcontrol: introduce CONFIG_MEMCG_LEGACY_KMEM
Applying: mm: memcontrol: only manage socket pressure for CONFIG_INET
Applying: net: drop tcp_memcontrol.c
Applying: mm: memcontrol: reign in the CONFIG space madness
Applying: mm: memcontrol: flatten struct cg_proto
Applying: mm: memcontrol: clean up alloc, online, offline, free functions
Applying: mm: memcontrol: clean up alloc, online, offline, free functions fix
Applying: mm: memcontrol: charge swap to cgroup2
Applying: mm: vmscan: pass memcg to get_scan_count()
Applying: mm: memcontrol: replace mem_cgroup_lruvec_online with mem_cgroup_online
Applying: swap.h: move memcg related stuff to the end of the file
Applying: mm: vmscan: do not scan anon pages if memcg swap limit is hit
Applying: mm: free swap cache aggressively if memcg swap is full
Applying: Documentation: cgroup: add memory.swap.{current,max} description
Merging akpm/master (ef0e3f6c2f83 Documentation: cgroup: add memory.swap.{current,max} description)
