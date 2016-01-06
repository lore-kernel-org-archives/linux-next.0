From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 6
Date: Wed, 6 Jan 2016 19:01:19 +1100
Message-ID: <20160106190119.3fb848fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20160105:

Dropped tree: rdma (complex conflicts)

The i2c tree lost its build failure.

The pm tree gained a conflict against the i2c tree.

The rdma tree still had its hard conflicts against the net-next tree so
I dropped the rdma tree again for today.

The drm tree still had its build failure for which I added a fix patch.

The spi tree gained a build failure so I used the version from
next-20160105.

The tip tree gained a conflict against the h8300 tree.

The rcu tree still had its build failure for which I reverted 2 commits.

The akpm-current tree gained a conflict against the kbuild tree.

The akpm tree still had its build failure that I just left broken for now.

Non-merge commits (relative to Linus' tree): 9057
 8752 files changed, 422452 insertions(+), 159922 deletions(-)

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

I am currently merging 238 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (ee9a7d2cb0cf Merge tag 'trace-v4.4-rc4-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (34bfbae33ae8 ARM: 8475/1: SWP emulation: Restore original *data when failed)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (036592fbbe75 powerpc/opal-irqchip: Fix deadlock introduced by "Fix double endian conversion")
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (9c982e86dbdb Merge tag 'pci-v4.4-fixes-3' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging net/master (ff62198553e4 bridge: Only call /sbin/bridge-stp for the initial network namespace)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (01d85b9b2b6b Merge tag 'iwlwifi-for-kalle-2015-12-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (cf1e05c63642 mac80211: handle width changes from opmode notification IE in beacon)
Merging sound-current/for-linus (c7b60a89516b ALSA: hda - Add keycode map for alc input device)
Merging pci-current/for-linus (1dbe162d53e1 PCI: hisi: Fix hisi_pcie_cfg_read() 32-bit reads)
Merging driver-core.current/driver-core-linus (4ef7675344d6 Linux 4.4-rc6)
Merging tty.current/tty-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb.current/usb-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb-gadget-fixes/fixes (7d32cdef5356 usb: musb: fail with error when no DMA controller set)
Merging usb-serial-fixes/usb-linus (f7d7f59ab124 USB: cp210x: add ID for ELV Marble Sound Board 1)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (f744c423cacf Merge tag 'iio-fixes-for-4.4c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging input-current/for-linus (dd0d0d4de582 Input: i8042 - add Fujitsu Lifebook U745 to the nomux list)
Merging crypto-current/master (9f47e11b9e31 crypto: algif_skcipher - Require setkey before accept(2))
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (168309855a7d Linux 4.4-rc8)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm/for-next (4ba1a28869c7 Merge branch 'amba-pl011' into for-next)
Merging arm-perf/for-next/perf (5d7ee87708d4 arm64: perf: add support for Cortex-A72)
Merging arm-soc/for-next (4909c459092b Merge branches 'next/drivers' and 'next/multiplatform' into for-next)
Merging at91/at91-next (f2837af0c89d Merge branch 'at91-4.5-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (53b6084357a4 ARM: bcm2835: Add the auxiliary clocks to the device tree.)
Merging bcm2835-soc/bcm2835-soc-next (5234c34e4cd7 ARM: bcm2835: Add Kconfig support for bcm2836)
Merging bcm2835-drivers/bcm2835-drivers-next (a09cd356586d ARM: bcm2835: add rpi power domain driver)
Merging bcm2835-defconfig/bcm2835-defconfig-next (b63074fccbeb ARM: bcm2835: enable auxiliary spi driver in defconfig)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (c6abe665c94f Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (12bd4032ea2f Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (06cdbbe9902d Merge tag 'omap-for-v4.5/81xx-fix-signed' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (e654927c5ff7 ARM: qcom: Drop ARCH_MSM* configs)
Merging renesas/next (fdb8ed9f727f Merge branch 'heads/dt-fixes-for-v4.5' into next)
Merging rockchip/for-next (755651cf0f31 Merge tag 'v4.4-rc5' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (94c286811b3b Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (97dd53d76893 Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
Merging tegra/for-next (92b100361a4e Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/Kconfig
Merging arm64/for-next/core (c9cd0ed925c0 arm64: traps: address fallout from printk -> pr_* conversion)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (5e7d4e401029 Merge remote-tracking branch 'origin/master' into h8300-next)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (ea8d65ad6958 m68k/defconfig: Update defconfigs for v4.4-rc1)
Merging m68knommu/for-next (4693c2493a9b m68k: coldfire/gpio: Be sure to clamp return value)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (9f84a5f9ae3a Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (6a13feb9c828 Linux 4.3)
Merging powerpc/next (e9d764f80396 powerpc/pseries: Enable kernel CPU dlpar from sysfs)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (9236b4dd6bfa s390: get rid of CONFIG_SCHED_MC and CONFIG_SCHED_BOOK)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (544f7d5a408e numa: remove stale node_has_online_mem() define)
Merging uml/linux-next (887a9853092c um: fix returns without va_end)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (511711af91f2 btrfs: don't run delayed references while we are creating the free space tree)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (181a15048df3 [SMB3] Prepare for encryption support (first part). Add decryption and encryption key generation. Thanks to Metze for helping with this.)
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (bb00c898ad1c udf: Check output buffer length when converting name to CS0)
Merging ext4/dev (880cec3449e0 fs: clean up the flags definition in uapi/linux/fs.h)
Merging f2fs/dev (90d43c31be5a f2fs: read isize while holding i_mutex in fiemap)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a93a99838248 gfs2: fix flock panic issue)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (614bdee254f8 Merge branch 'bugfixes')
Merging nfsd/nfsd-next (9f5c08db7d68 lockd: constify nlmsvc_binding structure)
Merging orangefs/for-next (4f20854bf736 Orangefs: don't change EXTRAVERSION)
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (6b238de189f6 mtd: ubi: don't leak e if schedule_erase() fails)
Merging xfs/for-next (4922be51ef1a Merge branch 'xfs-dax-fixes-for-4.5' into for-next)
Merging file-locks/linux-next (9189922675ec fs: make locks.c explicitly non-modular)
Merging vfs/for-next (e3d994cc0636 Merge branches 'work.misc', 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in drivers/s390/char/zcore.c
Applying: orangfs: update for follow_link to get_link change
Merging pci/next (c6123e06042d Merge branches 'pci/host-generic', 'pci/host-imx6', 'pci/host-iproc' and 'pci/host-rcar' into next)
Merging hid/for-next (817b1df9945e Merge branch 'for-4.4/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (d9794cfe8c46 Merge branch 'i2c/for-4.5' into i2c/for-next)
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (072151bb0154 firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (449278d92442 hwmon: (ibmaem) constify aem_rw_sensor_template and aem_ro_sensor_template structures)
Merging v4l-dvb/master (e27bc2ab8e77 Merge ../mc_dvb into to_next)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
Merging kbuild/for-next (e03445d23fdc Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (101f6dbe1444 Merge branch 'for-4.5' into for-next)
Merging pm/linux-next (b18bafa5491a Merge branch 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-platdrv.c
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (1d296eb7260a Merge branches 'thermal-core' and 'thermal-intel' of .git into next)
Merging thermal-soc/next (ce0265dd6f8e thermal: trip_point_temp_store() calls thermal_zone_device_update())
Applying: thermal: fix for thermal_zone_device_update() API change
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (f9166b3aaff0 Merge branch 'topic/univ_api' into next)
Merging net-next/master (2fbf575867e5 include/uapi/linux/sockios.h: mark SIOCRTMSG unused)
CONFLICT (content): Merge conflict in include/linux/pci_ids.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
Merging wireless-drivers-next/master (49f2a47d9131 prism54: fix checks for dma mapping errors)
Merging bluetooth/master (78b781ca0d35 Bluetooth: Add support for Start Limited Discovery command)
Merging mac80211-next/master (c45932df5612 regulatory: fix world regulatory domain data)
Merging rdma/for-next (59caaed7a72a IB/iser: Support the remote invalidation exception)
CONFLICT (content): Merge conflict in include/linux/mlx5/vport.h
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
CONFLICT (content): Merge conflict in include/linux/mlx5/device.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/vport.c
$ git merge --abort
Merging mtd/master (472b444eef93 mtd: fix cmdlinepart parser, early naming for auto-filled MTD)
Merging l2-mtd/master (1873315fb156 mtd: sh_flctl: pass FIFO as physical address)
CONFLICT (content): Merge conflict in drivers/mtd/mtdcore.c
Applying: mtd: nand: fix for drop unnecessary partition parser data
Merging crypto/master (48d627648141 crypto: hifn_795x, picoxcell - use ablkcipher_request_cast)
Merging drm/drm-next (c11b89896351 Merge tag 'omapdrm-4.5-resolved' of git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux into drm-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Applying: drm/amdgpu/powerplay: include asm/div64.h for do_div()
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (d5f384de5bf1 drm/i915: Move Braswell stop_machine GGTT insertion workaround)
Merging drm-tegra/drm/tegra/for-next (ad906599c191 drm/tegra: Advertise DRIVER_ATOMIC)
Merging drm-misc/topic/drm-misc (8815b23aa093 drm: Remove opencoded drm_gem_object_release_handle())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (2651f437261f MAINTAINERS: Add Liviu Dudau as maintainer for ARM HDLCD driver.)
Merging drm-vc4/drm-vc4-next (5645e785cea2 drm/vc4: fix an error code)
Merging sound/for-next (d8c5ed752e5b ALSA: dummy: constify dummy_timer_ops structures)
Merging sound-asoc/for-next (fef94ea8055a Merge remote-tracking branch 'asoc/topic/wm8960' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (fa68e2777cbc Input: pcap_ts - use to_delayed_work)
Merging block/for-next (d49ed8e45ac0 Merge branch 'for-4.5/drivers' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Applying: nvme: merge fix up for ns code movement
Merging device-mapper/for-next (ead3db62bf10 dm ioctl: do not directly deference user memory in check_version())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (01a999e48995 mmc: dw_mmc: remove the unused quirks)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4734eb989638 async_tx: use GFP_NOWAIT rather than GFP_IO)
Merging mfd/for-mfd-next (526c0ab13672 mfd: syscon: Add a DT property to set value width)
Merging backlight/for-backlight-next (ee65ad0e2a9e backlight: pwm_bl: Avoid backlight flicker when probed from DT)
Merging battery/master (f96576bd63e5 power: Fix unmet dependency on POWER_SUPPLY by POWER_RESET by uncoupling them)
Merging omap_dss2/for-next (caf05780f6ed Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (88fc5e6c99c2 Merge remote-tracking branch 'regulator/topic/wm831x' into regulator-next)
Merging security/next (aa98b942cbf3 Merge branch 'smack-for-4.5' of https://github.com/cschaufler/smack-next into next)
Merging integrity/next (6427e6c71c8b ima: ima_write_policy() limit locking)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (3b8d058cfe6a hwmon: (sch56xx) Drop watchdog driver data reference count callbacks)
Merging iommu/next (d5ffaf1db92c Merge branches 'iommu/fixes', 's390', 'arm/renesas', 'arm/msm', 'arm/shmobile', 'arm/smmu' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (d4f50ee2f5b4 vfio/iommu_type1: make use of info.flags)
Merging jc_docs/docs-next (9daacf51b428 Documentation/kernel-parameters: update KMG units)
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (09eccd1da92b audit: always enable syscall auditing when supported and audit is enabled)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (fcd71d9cc6e3 of: fix declaration of of_io_request_and_map)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (52868430cf41 Merge remote-tracking branches 'spi/topic/sun4i', 'spi/topic/topcliff-pch' and 'spi/topic/zynq' into spi-next)
$ git reset --hard HEAD^
Merging next-20160105 version of spi
Merging tip/auto-latest (f29c2e03f0b3 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (1cac5503fbf7 EDAC, i5100: Use to_delayed_work())
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (05a724bd44a6 tracing: Fix comment to use tracing_on over tracing_enable)
Merging rcu/rcu/next (6d1951645253 irq: Privatize irq_common_data::state_use_accessors)
Applying: Revert "Merge with 97702524eb17 (rcutorture: Add RCU grace-period performance tests)"
Applying: Revert "rcutorture: Add RCU grace-period performance tests"
Merging kvm/linux-next (da3f7ca3e856 Merge tag 'kvm-s390-next-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (696066f875bc KVM: PPC: Increase memslots to 512)
Merging kvms390/next (32e6b236d269 KVM: s390: consider system MHA for guest storage)
Merging xen-tip/linux-next (b9fcbcf55dc4 xen/time: use READ_ONCE)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (82607adcf9cd workqueue: implement lockup detector)
Merging drivers-x86/for-next (c9abbe63aa08 asus-wmi: drop to_platform_driver macro)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (6cb07abcc318 Merge remote-tracking branches 'regmap/topic/mmio', 'regmap/topic/rbtree' and 'regmap/topic/seq' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (522f17e1214c leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358)
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (4ef7675344d6 Linux 4.4-rc6)
Merging tty/tty-next (462a1196a578 Merge 4.4-rc6 into tty-next)
Merging usb/usb-next (48346892ff2a Merge tag 'usb-serial-4.4-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging usb-gadget/next (5072cfc40a80 usb: dwc3: of-simple: fix build warning on !PM)
Merging usb-serial/usb-next (6ff9d2761b86 USB: mxu11x0: drop redundant function name from error messages)
Merging usb-chipidea-next/ci-for-usb-next (d0c40d9fda12 usb: chipidea: debug: use list_for_each_entry)
Merging staging/staging-next (02c34ccc1d2d Merge tag 'iio-for-4.5c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/symlink.c
Merging char-misc/char-misc-next (d7a26beb6fe6 Merge tag 'extcon-next-for-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-next)
Merging extcon/extcon-next (f78bf950aec3 extcon: arizona: Use DAPM mutex helper functions)
Merging cgroup/for-next (75e6107a60a2 Merge branch 'for-4.5' into for-next)
CONFLICT (content): Merge conflict in init/Kconfig
CONFLICT (content): Merge conflict in include/linux/cgroup_subsys.h
Merging scsi/for-next (3196a8641050 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (beccdd6ac780 qla2xxx: Check for online flag instead of active reset when transmitting responses)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (c9f294ff6584 pinctrl: lantiq: 2 pins have the wrong mux list)
Merging vhost/linux-next (675358982eae checkpatch: add virt barriers)
CONFLICT (content): Merge conflict in include/asm-generic/barrier.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/ia64/include/asm/barrier.h
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (446f59acb70b Revert "pinctrl: lantiq: Implement gpio_chip.to_irq")
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (074726402b82 pwm: omap-dmtimer: Potential NULL dereference on error)
Merging dma-buf/for-next (168309855a7d Linux 4.4-rc8)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (b360ada3f153 Merge tag 'tegra-for-4.5-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (ed2d26d7cbcc tools, testing, add test for intel_pstate driver)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (8735f8e16a70 selftests/x86: Add tests for UC_SIGCONTEXT_SS and UC_STRICT_RESTORE_SS)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (d2b29c2f35a2 coresight: Fix a typo in Kconfig)
Merging rtc/rtc-next (cab572b82c4b rtc: fix overflow and incorrect calculation in rtc_time64_to_tm)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d23a0e707dd6 Merge branch 'for-4.5/pfn' into for-4.5/libnvdimm)
Merging akpm-current/current (055bd02ec563 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in scripts/tags.sh
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_ipv4.c
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/memblock.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/omapdrm/omap_gem.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_64.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/nohash/64/pgtable.h
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in Makefile
Applying: mm, dax, gpu: merge fix for convert vm_insert_mixed to pfn_t
Applying: mm, dax: convert vmf_insert_pfn_pmd() to pfn_t fix
Applying: fix up for bad merge of arch/powerpc/include/asm/pgtable-ppc64.h: add pmd_[dirty|mkclean] for THP
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs/overlayfs/super.c needs pagemap.h
Applying: fs/adfs/adfs.h: tidy up comments
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: dma-mapping: make the generic coherent dma mmap implementation optional
Applying: arc: convert to dma_map_ops
Applying: arc: dma mapping fixes
Applying: ARC: dma mapping fixes #2
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
Applying: net-drop-tcp_memcontrolc-fix
Applying: mm: memcontrol: rein in the CONFIG space madness
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix-fix
Applying: mm: memcontrol: flatten struct cg_proto
Applying: mm: memcontrol: clean up alloc, online, offline, free functions
Applying: mm: memcontrol: clean up alloc, online, offline, free functions fix
Applying: memcg: fix SLOB build regression
Applying: mm: memcontrol: charge swap to cgroup2
Applying: mm: vmscan: pass memcg to get_scan_count()
Applying: mm: memcontrol: replace mem_cgroup_lruvec_online with mem_cgroup_online
Applying: swap.h: move memcg related stuff to the end of the file
Applying: mm: vmscan: do not scan anon pages if memcg swap limit is hit
Applying: mm: free swap cache aggressively if memcg swap is full
Applying: Documentation: cgroup: add memory.swap.{current,max} description
Applying: MAINTAINERS: add git URL for APM driver
Applying: MAINTAINERS: add git URL for at91
Applying: MAINTAINERS: add git URL for Rockchip
Applying: MAINTAINERS: add git URL for ARM64
Applying: MAINTAINERS: update git URL for ath6kl
Applying: MAINTAINERS: add git URL for backlight
Applying: MAINTAINERS: add git URL for chrome
Applying: MAINTAINERS: add git URL for cris
Applying: MAINTAINERS: add git URL for cryptodev
Applying: MAINTAINERS: add git URL for devfreq
Applying: MAINTAINERS: update git URL for DLM
Applying: MAINTAINERS: add git URL for eCryptfs
Applying: MAINTAINERS: add git URL for ext4
Applying: MAINTAINERS: add git URL for hwspinlock
Applying: MAINTAINERS: add git URL for integrity
Applying: MAINTAINERS: add git URL for IPVS
Applying: MAINTAINERS: add git URL for nfsd
Applying: MAINTAINERS: add git URL for KVM/s390
Applying: MAINTAINERS: add git URL for kgdb
Applying: MAINTAINERS: add git URL for nvdimm
Applying: MAINTAINERS: add git URL for metag
Applying: MAINTAINERS: add git URL for wireless drivers
Applying: MAINTAINERS: add git URL for devicetree
Applying: MAINTAINERS: update git URL for PCMCIA
Applying: MAINTAINERS: update git URL for pstore
Applying: MAINTAINERS: update git URL for ath10k
Applying: MAINTAINERS: add git URL for hexagon
Applying: MAINTAINERS: add git URL for reset
Applying: MAINTAINERS: add git URL for s390
Applying: MAINTAINERS: fix tree format for SAMSUNG thermal
Applying: MAINTAINERS: add git URL for md
Applying: MAINTAINERS: add git URL for squashfs
Applying: MAINTAINERS: add git URL for swiotlb
Applying: MAINTAINERS: add git URL for xtensa
Applying: MAINTAINERS: fix tree format for TPM
Applying: MAINTAINERS: add git URL for UML
Applying: MAINTAINERS: add git URL for VFIO
Applying: MAINTAINERS: add git URL for vhost
Applying: MAINTAINERS: update git URL for XFS
Applying: pmem: add wb_cache_pmem() to the PMEM API
Applying: pmem-add-wb_cache_pmem-to-the-pmem-api-v6
Applying: dax: support dirty DAX entries in radix tree
Applying: dax-support-dirty-dax-entries-in-radix-tree-v6
Applying: mm: add find_get_entries_tag()
Applying: dax: add support for fsync/sync
Applying: dax-add-support-for-fsync-sync-v6
Applying: dax: fix dax_pmd_dbg build warning
Applying: ext2: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: ext4: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: xfs: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: sched: check tgid in is_global_init
Merging akpm/master (7cdc6a8f918b sched: check tgid in is_global_init)
