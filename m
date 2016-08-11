From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 11
Date: Thu, 11 Aug 2016 13:32:47 +1000
Message-ID: <20160811133247.767155ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58867 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932276AbcHKDcu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Aug 2016 23:32:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160809:

Non-merge commits (relative to Linus' tree): 1334
 1380 files changed, 35797 insertions(+), 12995 deletions(-)

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
Merging origin/master (9512c47ec2e4 Merge branch 'for-linus-4.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
Merging fixes/master (04c1926cb1e1 Disable the Soft RoCE driver)
Merging kbuild-current/rc-fixes (b36fad65d61f kbuild: Initialize exported variables)
Merging arc-current/for-curr (45c3b08a117e ARC: Elide redundant setup of DMA callbacks)
Merging arm-current/fixes (87eed3c74d7c ARM: fix address limit restoration for undefined instructions)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (c7a318ba868c powerpc/ptrace: Fix coredump since ptrace TM changes)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (7bb90c3715a4 bridge: Fix problems around fdb entries pointing to the bridge device)
Merging ipsec/master (6916fb3b10b3 xfrm: Ignore socket policies when rebuilding hash tables)
Merging netfilter/master (4da449ae1df9 netfilter: nft_exthdr: Add size check on u8 nft_exthdr attributes)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (4d0bd46a4d55 Revert "wext: Fix 32 bit iwpriv compatibility issue with 64 bit Kernel")
Merging sound-current/for-linus (a52ff34e5ec6 ALSA: hda - Manage power well properly for resume)
Merging pci-current/for-linus (8b078c603249 PCI: Update "pci=resource_alignment" documentation)
Merging driver-core.current/driver-core-linus (29b4817d4018 Linux 4.8-rc1)
Merging tty.current/tty-linus (29b4817d4018 Linux 4.8-rc1)
Merging usb.current/usb-linus (59b71f774fc2 usb: host: max3421-hcd: fix mask of IO control register)
Merging usb-gadget-fixes/fixes (4491ed5042f0 usb: dwc3: pci: add Intel Kabylake PCI ID)
Merging usb-serial-fixes/usb-linus (647024a7df36 USB: serial: fix memleak in driver-registration error path)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common: otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (29b4817d4018 Linux 4.8-rc1)
Merging char-misc.current/char-misc-linus (29b4817d4018 Linux 4.8-rc1)
Merging input-current/for-linus (22fe874f3803 Input: silead - remove some dead code)
Merging crypto-current/master (a0118c8b2be9 crypto: caam - fix non-hmac hashes)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (dfa299705565 drm/i915: Fix modeset handling during gpu reset, v5.)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (29b4817d4018 Linux 4.8-rc1)
Merging arm/for-next (87eed3c74d7c ARM: fix address limit restoration for undefined instructions)
Merging arm-perf/for-next/perf (1a695a905c18 Linux 4.7-rc1)
Merging arm-soc/for-next (1a89fec0732e Merge branch 'fixes' into for-next)
Merging amlogic/for-next (3a8eff5934f4 Merge branch 'v4.7/clk' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (cc960d657ead Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (38b7b9bdeb7a Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (370c3261ba8a Merge branch 'omap-for-v4.8/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (289f9fb05d0c ARM: dts: msm8916: Add smsm and smp2p nodes)
Merging renesas/next (1255e4546766 Merge branch 'arm64-dt-for-v4.9' into next)
Merging rockchip/for-next (3f18da23fe7c Merge branch 'v4.9-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (355059717bc0 Merge branch 'next/soc' into for-next)
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
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (673442e73a9f MIPS: Move identification of VP(E) into proc.c from smp-mt.c)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (29b4817d4018 Linux 4.8-rc1)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (e20d2b5e07bd s390: cio: remove redundant cio_cancel declaration)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_ZERO) pattern)
Merging uml/linux-next (8a545f185145 hostfs: Freeing an ERR_PTR in hostfs_fill_sb_common())
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (bdc110d0bcaf befs: fix typo in befs_sb_info)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (d84c090ad3e9 Fixup: fs_info/root cleanups and qgroups patches)
Merging ceph/master (4eacd4cb3a7c ceph: initialize pathbase in the !dentry case in encode_caps_cb())
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (f7a1c358e51c ext2: Check return value from ext2_get_group_desc())
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (81abf2525827 Merge tag 'lkdtm-v4.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (47a9a5279468 GFS2: use BIT() macro)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (8d480326c3d6 NFSv4: Cap the transport reconnection timer at 1/2 lease period)
Merging nfsd/nfsd-next (3e5ed3680a24 SUNRPC: change UDP socket space reservation)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (f200ea288c78 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (5d71afb00840 ubi: Use bitmaps in Fastmap self-check code)
Merging xfs/for-next (3481b6828523 xfs: move (and rename) the deferred bmap-free tracepoints)
Merging file-locks/linux-next (ca323f65d622 locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (29b4817d4018 Linux 4.8-rc1)
Merging pstore/for-next/pstore (e976e56423dc ramoops: use persistent_ram_free() instead of kfree() for freeing prz)
Merging hid/for-next (976ff66f778e Merge branch 'for-4.9/wacom' into for-next)
Merging i2c/i2c/for-next (29b4817d4018 Linux 4.8-rc1)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (90ed8dc9d1a3 hwmon: (ltc4151) Make shunt-resistor configurable)
Merging v4l-dvb/master (b6aa39228966 Merge tag 'v4.8-rc1' into patchwork)
Merging pm/linux-next (298a1b74a0ba Merge branch 'pm-sleep' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (1577ddfac75f Merge branches 'thermal-intel' and 'thermal-core' into next)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Applying: thermal: fix up for "fix race condition when updating cooling device"
Applying: thermal: fix up for bad merge of drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (935bce6a22cf Merge branch 'topic/imx' into next)
Merging net-next/master (b89b815c32f2 ravb: use proper names for suspend/resume functions)
Merging ipsec-next/master (0184165b2f42 ravb: add sleep PM suspend/resume support)
Merging netfilter-next/master (6a492b0f23d2 Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (cb6a11518850 wlcore: spi: fix build warning caused by redundant variable)
Merging bluetooth/master (a92bcaae230c mac802154: use rate limited warnings for malformed frames)
Merging mac80211-next/master (6cdaf03f8c23 RDS: add __printf format attribute to error reporting functions)
Merging rdma/for-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon/rdma-next (4c2e07c6a29e Linux 4.7-rc5)
Merging rdma-leon-test/testing/rdma-next (29b4817d4018 Linux 4.8-rc1)
Merging mtd/master (11e8a7f9aa94 Merge tag 'for-linus-20160801' into HEAD)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence QuadSPI on non-ARM)
Merging nand/nand/next (a0cba2179ea4 Revert "printk: create pr_<level> functions")
Merging crypto/master (47856204146b crypto: marvell - Don't hardcode block size in mv_cesa_ahash_cache_req)
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
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (a3adfca82ab5 Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (8355aaf6d3de Merge branch 'topic/hda-link-time' into for-next)
Merging sound-asoc/for-next (4069d480d00f Merge remote-tracking branches 'asoc/topic/rt5659', 'asoc/topic/samsung', 'asoc/topic/simple' and 'asoc/topic/topology' into asoc-next)
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
Merging battery/master (f3332532463f power/supply: unify DT documentation)
Merging omap_dss2/for-next (ab366b40b851 fbdev: Use IS_ENABLED() instead of checking for built-in or module)
Merging regulator/for-next (59f424a4a534 Merge remote-tracking branch 'regulator/topic/tps65218' into regulator-next)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (a518b0a5b0d7 selinux: Implement dentry_create_files_as() hook)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoton i2c driver (NPCT6xx family))
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (9733ba95a477 Merge branches 'iommu/fixes', 'x86/amd' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return code during release)
Merging jc_docs/docs-next (bdf107d87eb8 DocBook: use DOCBOOKS="" to ignore DocBooks instead of IGNORE_DOCBOOKS=1)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (523d939ef98f Linux 4.7)
Merging devicetree/for-next (255c0397bc40 ARM: imx6: mark GPC node as not populated after irq init to probe pm domain driver)
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and type mismatches in Broadcom PDC driver)
Merging spi/for-next (a29d536ed46d Merge remote-tracking branches 'spi/topic/jcore', 'spi/topic/pic32-sqi', 'spi/topic/rspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (2f6489d802d5 Merge branch 'sched/core')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (943849ed764b Merge branch 'edac-for-4.9' into for-next)
Merging irqchip/irqchip/for-next (77d50b17c990 Merge branch 'irqchip/misc' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (38919adfbb59 rcu: Avoid redundant quiescent-state chasing)
Merging kvm/linux-next (29b4817d4018 Linux 4.8-rc1)
Merging kvm-arm/next (29b4817d4018 Linux 4.8-rc1)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (93d17397e4e2 KVM: PPC: Book3S HV: Save/restore TM state in H_CEDE)
Merging kvms390/next (9acc317b183f KVM: s390: let ptff intercepts result in cc=3)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization of steal_clock op to xen_time_ops)
Merging percpu/for-next (33e465ce7cb3 percpu_ref: allow operation mode switching operations to be called concurrently)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (29b4817d4018 Linux 4.8-rc1)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (9c99e5e51988 HSI: omap_ssi: drop pm_runtime_irq_safe)
Merging leds/for-next (5706c01fcfb3 leds: is31fl32xx: define complete i2c_device_id table)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (29b4817d4018 Linux 4.8-rc1)
Merging tty/tty-next (29b4817d4018 Linux 4.8-rc1)
Merging usb/usb-next (0775a9cbc694 usbip: vhci extension: modifications to vhci driver)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (29b4817d4018 Linux 4.8-rc1)
Merging usb-chipidea-next/ci-for-usb-next (2b48f2ad3149 usb: chipidea: udc: Use direction flags consequently)
Merging staging/staging-next (29b4817d4018 Linux 4.8-rc1)
Merging char-misc/char-misc-next (29b4817d4018 Linux 4.8-rc1)
Merging extcon/extcon-next (7fe95fb889fa extcon: Add new EXTCON_CHG_WPT for Wireless Power Transfer device)
Merging cgroup/for-next (cdafbe010818 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (c8e18acccb9b ipr: Fix error return code in ipr_probe_ioa())
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (b55d2c847454 ARM: dts: STiH407-family: Add ports-implemented property in sata nodes)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (9573e7923007 pinctrl: fix pincontrol definition for marvell)
Merging vhost/linux-next (3b2fbb3f06ef virtio/s390: deprecate old transport)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (e937b335a738 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (fbc482ae78c6 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (29b4817d4018 Linux 4.8-rc1)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (523d939ef98f Linux 4.7)
Merging coresight/next (10156d120e4d coresight: fix handling of ETM trace register access via sysfs)
Merging rtc/rtc-next (251327f9216a rtc: pcf2123: Add missing error code assignment before test)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d8d378fa1a0c tools/testing/nvdimm: fix SIGTERM vs hotplug crash)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (ae2066ca0bd4 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: ipc/sem.c: fix complex_count vs. simple op race
Merging akpm/master (36c766d93aa6 ipc/sem.c: fix complex_count vs. simple op race)
