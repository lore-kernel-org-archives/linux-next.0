From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 9
Date: Tue, 9 Aug 2016 13:52:51 +1000
Message-ID: <20160809135251.0dc9633e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34665 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752265AbcHIDwy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Aug 2016 23:52:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160808:

Linus' tree lost the build failure (this was actually an rdma tree
problem).

The sound-asoc tree lost its build failure.

Non-merge commits (relative to Linus' tree): 978
 965 files changed, 27099 insertions(+), 7759 deletions(-)

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

I am currently merging 241 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (574673c231a5 printk: Remove unnecessary #ifdef CONFIG_PRINTK)
Merging fixes/master (04c1926cb1e1 Disable the Soft RoCE driver)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize exported variables)
Merging arc-current/for-curr (bc921f821d60 ARC: Call trace_hardirqs_on() before enabling irqs)
Merging arm-current/fixes (f6492164ecb1 ARM: 8577/1: Fix Cortex-A15 798181 errata initialization)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (bad60e6f259a Merge tag 'powerpc-4.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (1fe323aa1b23 sctp: use event->chunk when it's valid)
Merging ipsec/master (6916fb3b10b3 xfrm: Ignore socket policies when rebuilding hash tables)
Merging netfilter/master (43dcff349f09 net: qlcnic: avoid superfluous assignement)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (4d0bd46a4d55 Revert "wext: Fix 32 bit iwpriv compatibility issue with 64 bit Kernel")
Merging sound-current/for-linus (59ec4b57bcae ALSA: hda - Fix headset mic detection problem for two dell machines)
Merging pci-current/for-linus (29b4817d4018 Linux 4.8-rc1)
Merging driver-core.current/driver-core-linus (29b4817d4018 Linux 4.8-rc1)
Merging tty.current/tty-linus (29b4817d4018 Linux 4.8-rc1)
Merging usb.current/usb-linus (29b4817d4018 Linux 4.8-rc1)
Merging usb-gadget-fixes/fixes (50c763f8c1ba usb: dwc3: Set the ClearPendIN bit on Clear Stall EP command)
Merging usb-serial-fixes/usb-linus (647024a7df36 USB: serial: fix memleak in driver-registration error path)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common: otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (29b4817d4018 Linux 4.8-rc1)
Merging char-misc.current/char-misc-linus (29b4817d4018 Linux 4.8-rc1)
Merging input-current/for-linus (22fe874f3803 Input: silead - remove some dead code)
Merging crypto-current/master (2fdea258fde0 crypto: caam - defer aead_set_sh_desc in case of zero authsize)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (f80eb4289491 selftests/exec: Makefile is a run-time dependency, add it to the install list)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (29b4817d4018 Linux 4.8-rc1)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (29b4817d4018 Linux 4.8-rc1)
Merging arm/for-next (bf9cb4359182 Merge branches 'component', 'cpuidle', 'fixes' and 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/iommu/mtk_iommu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip_drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.c
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (eae5b27ade3d arm-soc: document merges)
Merging amlogic/for-next (3a8eff5934f4 Merge branch 'v4.7/clk' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (63a404a3f177 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (38b7b9bdeb7a Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (370c3261ba8a Merge branch 'omap-for-v4.8/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (289f9fb05d0c ARM: dts: msm8916: Add smsm and smp2p nodes)
Merging renesas/next (abda75bfcb2f Merge branches 'arm64-dt-for-v4.9' and 'dt-for-v4.9' into next)
Merging rockchip/for-next (ebbfb5d5627d Merge branch 'v4.8-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (253256f64294 Merge branch 'next/soc' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5420.dtsi
Merging tegra/for-next (b551165a4593 Merge branch for-4.8/arm64/defconfig into for-next)
Merging arm64/for-next/core (747a70e60b72 arm64: Fix copy-on-write referencing in HugeTLB)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging m68knommu/for-next (10c18b1af25f m68knommu: fix user a5 register being overwritten)
Merging metag/for-next (b4d9fa500652 metag: Drop show_mem() from mem_init())
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (c38d8f514a86 MIPS: Fix MSA asm warnings in control reg accessors)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (eea8148c69f3 powerpc/mm: Move register_process_table() out of ppc_md)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (9bce8b2cbebf s390/qdio: avoid reschedule of outbound tasklet once killed)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_ZERO) pattern)
Merging uml/linux-next (8a545f185145 hostfs: Freeing an ERR_PTR in hostfs_fill_sb_common())
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (3e35c149e220 fs: befs: remove ret variable)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (d84c090ad3e9 Fixup: fs_info/root cleanups and qgroups patches)
Merging ceph/master (96c7a05e0196 rbd: nuke the 32-bit pool id check)
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (e008bb6134a6 quota: use time64_t internally)
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (c1ece7671920 Merge tag 'media/v4.8-5' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (47a9a5279468 GFS2: use BIT() macro)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (8d480326c3d6 NFSv4: Cap the transport reconnection timer at 1/2 lease period)
Merging nfsd/nfsd-next (3e5ed3680a24 SUNRPC: change UDP socket space reservation)
Merging orangefs/for-next (78fee0b6846f orangefs: fix namespace handling)
Merging overlayfs/overlayfs-next (f200ea288c78 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (5d71afb00840 ubi: Use bitmaps in Fastmap self-check code)
Merging xfs/for-next (3481b6828523 xfs: move (and rename) the deferred bmap-free tracepoints)
Merging file-locks/linux-next (ca323f65d622 locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (29b4817d4018 Linux 4.8-rc1)
Merging pstore/for-next/pstore (e976e56423dc ramoops: use persistent_ram_free() instead of kfree() for freeing prz)
Merging hid/for-next (de1bcd764ea0 Merge branch 'for-4.8/upstream' into for-next)
Merging i2c/i2c/for-next (29b4817d4018 Linux 4.8-rc1)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (90ed8dc9d1a3 hwmon: (ltc4151) Make shunt-resistor configurable)
Merging v4l-dvb/master (b6aa39228966 Merge tag 'v4.8-rc1' into patchwork)
Merging pm/linux-next (397cbb5e9031 Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (1577ddfac75f Merge branches 'thermal-intel' and 'thermal-core' into next)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Applying: thermal: fix up for "fix race condition when updating cooling device"
Applying: thermal: fix up for bad merge of drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (521301170601 Merge branch 'topic/ioatdma' into next)
Merging net-next/master (6cdaf03f8c23 RDS: add __printf format attribute to error reporting functions)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging netfilter-next/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (cb6a11518850 wlcore: spi: fix build warning caused by redundant variable)
Merging bluetooth/master (a92bcaae230c mac802154: use rate limited warnings for malformed frames)
Merging mac80211-next/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging rdma/for-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (92d21ac74a9e Linux 4.7-rc7)
Merging mtd/master (11e8a7f9aa94 Merge tag 'for-linus-20160801' into HEAD)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence QuadSPI on non-ARM)
Merging nand/nand/next (8490c03bd9d4 mtd: nand: jz4780: Update MODULE_AUTHOR email address)
Merging crypto/master (0f95e2ffc58f Merge git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging drm/drm-next (5c6c201ccbaf drm: Paper over locking inversion after registration rework)
Merging drm-panel/drm/panel/for-next (9bb34c4c730d drm/panel: simple: Add support for Starry KR122EA0SRA panel)
Merging drm-intel/for-linux-next (c45eb4fed12d drm/i915/fbdev: Check for the framebuffer before use)
Merging drm-tegra/drm/tegra/for-next (64ea25c3bc86 drm/tegra: sor: Reject HDMI 2.0 modes)
Merging drm-misc/topic/drm-misc (cfc5adea1955 drm: Make sure drm_vblank_no_hw_counter isn't abused)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (1ec0088a7a09 Merge branches 'sunxi/clk-fixes-for-4.8', 'sunxi/dt-for-4.9' and 'sunxi/clk-for-4.9' into sunxi/for-next)
Merging kbuild/for-next (f6830d5346c9 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kspp/for-next/kspp (6fbe16013e52 Merge branch 'for-next/ro_after_init' into for-next/kspp)
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in include/linux/thread_info.h
CONFLICT (content): Merge conflict in drivers/char/random.c
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/x86/kernel/x86_init.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/uaccess.h
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (22ad85abfabb Merge remote-tracking branch 'regmap/fix/rbtree' into regmap-linus)
Merging sound/for-next (59ec4b57bcae ALSA: hda - Fix headset mic detection problem for two dell machines)
Merging sound-asoc/for-next (7def6d917c26 Merge remote-tracking branches 'asoc/topic/simple' and 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (a485cb037fe6 Input: add driver for SiS 9200 family I2C touchscreen controllers)
Merging block/for-next (b013517951a1 Merge branch 'for-4.8/core' into for-next)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (7b94c1f0e520 dm crypt: increase mempool reserve to better support swapping)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (6ea625794518 mmc: rtsx_pci: Remove deprecated create_singlethread_workqueue)
Merging md/for-next (11367799f3d1 md: Prevent IO hold during accessing to faulty raid5 array)
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (4fcd504edbf7 power: reset: add reboot mode driver)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instead of checking for built-in or module)
Merging regulator/for-next (de944e0f03c7 Merge remote-tracking branch 'regulator/fix/qcom-smd' into regulator-linus)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (c8941881e506 selinux: Implement dentry_create_files_as() hook)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoton i2c driver (NPCT6xx family))
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (f360d3241f55 Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/msm', 'arm/rockchip', 'arm/smmu' and 'core' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return code during release)
Merging jc_docs/docs-next (bdf107d87eb8 DocBook: use DOCBOOKS="" to ignore DocBooks instead of IGNORE_DOCBOOKS=1)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (523d939ef98f Linux 4.7)
Merging devicetree/for-next (e973f4ec130a xtensa: Partially Revert "xtensa: Remove unnecessary of_platform_populate with default match table")
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and type mismatches in Broadcom PDC driver)
Merging spi/for-next (d99d6903e341 Merge remote-tracking branches 'spi/topic/jcore', 'spi/topic/pic32-sqi' and 'spi/topic/rspi' into spi-next)
Merging tip/auto-latest (a064fd509d4b Merge branch 'x86/asm')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a08d6288915c Merge branch 'edac-fixes-for-4.8' into for-next)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/misc' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (5bc94664884a rcu: Avoid redundant quiescent-state chasing)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (29b4817d4018 Linux 4.8-rc1)
Merging kvm-arm/next (89581f06b2bc arm64: KVM: Set cpsr before spsr on fault injection)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (93d17397e4e2 KVM: PPC: Book3S HV: Save/restore TM state in H_CEDE)
Merging kvms390/next (9acc317b183f KVM: s390: let ptff intercepts result in cc=3)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization of steal_clock op to xen_time_ops)
Merging percpu/for-next (6710e594f71c percpu: fix synchronization between synchronous map extension and chunk destruction)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (29b4817d4018 Linux 4.8-rc1)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_safe)
Merging leds/for-next (5706c01fcfb3 leds: is31fl32xx: define complete i2c_device_id table)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (29b4817d4018 Linux 4.8-rc1)
Merging tty/tty-next (29b4817d4018 Linux 4.8-rc1)
Merging usb/usb-next (29b4817d4018 Linux 4.8-rc1)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (29b4817d4018 Linux 4.8-rc1)
Merging usb-chipidea-next/ci-for-usb-next (229d43daf8ed usb: chipidea: imx: set over current polarity per dts setting)
Merging staging/staging-next (29b4817d4018 Linux 4.8-rc1)
Merging char-misc/char-misc-next (29b4817d4018 Linux 4.8-rc1)
Merging extcon/extcon-next (7fe95fb889fa extcon: Add new EXTCON_CHG_WPT for Wireless Power Transfer device)
Merging cgroup/for-next (1cab4a96cab6 Merge branch 'for-4.8' into for-next)
Merging scsi/for-next (c8e18acccb9b ipr: Fix error return code in ipr_probe_ioa())
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (737bee9308c4 libata-scsi: better style in ata_msense_*())
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (9573e7923007 pinctrl: fix pincontrol definition for marvell)
Merging vhost/linux-next (b226acab2f6a VSOCK: Use kvfree())
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (e937b335a738 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (fbc482ae78c6 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (d22527fed2f0 Merge branch 'clk-fixes' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (d78388dbec25 selftests: media_tests add a new video device test)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (523d939ef98f Linux 4.7)
Merging coresight/next (10156d120e4d coresight: fix handling of ETM trace register access via sysfs)
Merging rtc/rtc-next (29b4817d4018 Linux 4.8-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (0606263f24f3 Merge branch 'for-4.8/libnvdimm' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (ae2066ca0bd4 ipc/msg.c: use freezable blocking call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: ipc/sem.c: fix complex_count vs. simple op race
Merging akpm/master (bbaf266b8bf8 ipc/sem.c: fix complex_count vs. simple op race)
