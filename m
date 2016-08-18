From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 18
Date: Thu, 18 Aug 2016 14:41:02 +1000
Message-ID: <20160818144102.55a2d5ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43676 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750720AbcHREmA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Aug 2016 00:42:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160817:

New tree: vfs-miklos

Removed trees: powerpc-merge-mpe, powerpc-mpe (no longer used)

The netfilter-next tree gained a build failure so I used the version
from next-20160817.

The kbuild tree still had its build warnings for PowerPC, for which I
reverted a commit.

Non-merge commits (relative to Linus' tree): 2513
 2682 files changed, 111802 insertions(+), 41622 deletions(-)

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

I am currently merging 240 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (5ff132c07aa1 Merge tag 'for-v4.8-rc' of git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (b854f5e83bb2 ARC: Support syscall ABI v4)
Merging arm-current/fixes (87eed3c74d7c ARM: fix address limit restoration for undefined instructions)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (ca49e64f0cb1 selftests/powerpc: Specify we expect to build with std=gnu99)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (b96c22c071eb Merge branch 'tc_action-fixes')
Merging ipsec/master (1625f4529957 net/xfrm_input: fix possible NULL deref of tunnel.ip6->parms.i_key)
Merging netfilter/master (dcbe35909c84 netfilter: tproxy: properly refcount tcp listeners)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (034fdd4a17ff Merge ath-current from ath.git)
Merging mac80211/master (4d0bd46a4d55 Revert "wext: Fix 32 bit iwpriv compatibility issue with 64 bit Kernel")
Merging sound-current/for-linus (a52ff34e5ec6 ALSA: hda - Manage power well properly for resume)
Merging pci-current/for-linus (a855d4d8e71f PCI: Call pci_intx() when using legacy interrupts in pci_alloc_irq_vectors())
Merging driver-core.current/driver-core-linus (694d0d0bb203 Linux 4.8-rc2)
Merging tty.current/tty-linus (29b4817d4018 Linux 4.8-rc1)
Merging usb.current/usb-linus (f1f6d9a8b540 xhci: don't dereference a xhci member after removing xhci)
Merging usb-gadget-fixes/fixes (a0ad85ae866f usb: dwc3: gadget: stop processing on HWO set)
Merging usb-serial-fixes/usb-linus (3b7c7e52efda USB: serial: mos7840: fix non-atomic allocation in write path)
Merging usb-chipidea-fixes/ci-for-usb-stable (ea1d39a31d3b usb: common: otg-fsm: add license to usb-otg-fsm)
Merging staging.current/staging-linus (99f1c013194e staging/lustre/llite: Close atomic_open race with several openers)
Merging char-misc.current/char-misc-linus (83cf8df2d4fa drivers/iio/light/Kconfig: SENSORS_BH1780 cleanup)
Merging input-current/for-linus (22fe874f3803 Input: silead - remove some dead code)
Merging crypto-current/master (e67479b13ede crypto: sha512-mb - fix ctx pointer)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (dfa299705565 drm/i915: Fix modeset handling during gpu reset, v5.)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (e6aeb2fbb85f ARC: Support syscall ABI v4)
Merging arm/for-next (d0a0f0bafaf4 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (756c52412437 Merge branch 'fixes' into for-next)
Merging amlogic/for-next (217abb3a112f Merge branch 'v4.8/mmc' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (aa5c0a1e15c2 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (2c6bb730dd4e Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (38b7b9bdeb7a Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (3853bd4d48a1 Merge branch 'omap-for-v4.9/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (289f9fb05d0c ARM: dts: msm8916: Add smsm and smp2p nodes)
Merging renesas/next (8b558916a819 Merge branches 'dt-for-v4.9' and 'soc-for-v4.9' into next)
Merging rockchip/for-next (bdd086f66e9b Merge branch 'v4.9-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (f5d201403635 Merge branch 'next/defconfig' into for-next)
Merging tegra/for-next (f56fa77c0ef9 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (747a70e60b72 arm64: Fix copy-on-write referencing in HugeTLB)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging m68knommu/for-next (694d0d0bb203 Linux 4.8-rc2)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (82440d0d030d Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (29b4817d4018 Linux 4.8-rc1)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (3baca64293f8 s390/pci: add zpci_report_error interface)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_ZERO) pattern)
Merging uml/linux-next (8a545f185145 hostfs: Freeing an ERR_PTR in hostfs_fill_sb_common())
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (80ff5cc06cf8 Fixup: fs_info/root cleanups and qgroups patches)
Merging ceph/master (4eacd4cb3a7c ceph: initialize pathbase in the !dentry case in encode_caps_cb())
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (3cd0126dca82 quota: fill in Q_XGETQSTAT inode information for inactive quotas)
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (81abf2525827 Merge tag 'lkdtm-v4.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (47a9a5279468 GFS2: use BIT() macro)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (15d03055cf39 pNFS/flexfiles: Set reasonable default retrans values for the data channel)
Merging nfsd/nfsd-next (e2ce4e03e317 nfsd: eliminate cb_minorversion field)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (f200ea288c78 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (5d71afb00840 ubi: Use bitmaps in Fastmap self-check code)
Merging xfs/for-next (32438cf9d54b Merge branch 'iomap-fixes-4.8-rc3' into for-next)
Merging file-locks/linux-next (7c38ab019cde fcntl: add new F_OFD_*32 constants and handle them appropriately)
Merging vfs-miklos/next (d55af8a321be vfs: add note about i_op->rename changes to porting)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (29b4817d4018 Linux 4.8-rc1)
Merging pstore/for-next/pstore (e976e56423dc ramoops: use persistent_ram_free() instead of kfree() for freeing prz)
Merging hid/for-next (dc1de1f4bebd Merge branch 'for-4.8/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (0268263f0cf2 i2c: meson: Use complete() instead of complete_all())
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (64217d82c433 hwmon: Add xgene hwmon driver)
Merging v4l-dvb/master (b6aa39228966 Merge tag 'v4.8-rc1' into patchwork)
Merging pm/linux-next (eb77c6034cb4 Merge branches 'pm-cpufreq' and 'pm-cpufreq-sched' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (694d0d0bb203 Linux 4.8-rc2)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Applying: thermal: fix up for "fix race condition when updating cooling device"
Applying: thermal: fix up for bad merge of drivers/thermal/thermal_core.c
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (935bce6a22cf Merge branch 'topic/imx' into next)
Merging net-next/master (484334198f8c Merge branch 'strparser')
CONFLICT (content): Merge conflict in kernel/bpf/verifier.c
CONFLICT (content): Merge conflict in drivers/net/dsa/mv88e6xxx/chip.c
Merging ipsec-next/master (d737a5805581 xfrm: state: don't use lock anymore unless acquire operation is needed)
Merging netfilter-next/master (92e47ba8839b netfilter: conntrack: simplify the code by using nf_conntrack_get_ht)
$ git reset --hard HEAD^
Merging next-20160817 version of netfilter-next
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (cb6a11518850 wlcore: spi: fix build warning caused by redundant variable)
Merging bluetooth/master (0f3cce5ec5b6 Bluetooth: btusb: Add support for 0cf3:e009)
Merging mac80211-next/master (90ff0fbbd663 nl80211: Allow GET_INTERFACE dumps to be filtered)
Merging rdma/for-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon/rdma-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon-test/testing/rdma-next (fde671eac883 Merge branch 'topic/merge-branch' into testing/rdma-next)
Merging mtd/master (11e8a7f9aa94 Merge tag 'for-linus-20160801' into HEAD)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence QuadSPI on non-ARM)
Merging nand/nand/next (e5c88bb4ce0a mtd: nand_bbt: scan for next free bbt block if writing bbt fails)
Merging crypto/master (d89a67134fcc crypto: drbg - do not call drbg_instantiate in healt test)
Merging drm/drm-next (fc93ff608b15 Merge tag 'drm-intel-next-2016-08-08' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
Merging drm-panel/drm/panel/for-next (9bb34c4c730d drm/panel: simple: Add support for Starry KR122EA0SRA panel)
Merging drm-intel/for-linux-next (c45eb4fed12d drm/i915/fbdev: Check for the framebuffer before use)
Merging drm-tegra/drm/tegra/for-next (64ea25c3bc86 drm/tegra: sor: Reject HDMI 2.0 modes)
Merging drm-misc/topic/drm-misc (9cd2e854d61c Revert "drm/hisilicon: Don't set drm_device->platformdev")
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (1ec0088a7a09 Merge branches 'sunxi/clk-fixes-for-4.8', 'sunxi/dt-for-4.9' and 'sunxi/clk-for-4.9' into sunxi/for-next)
Merging kbuild/for-next (e007c53397ac ia64: move exports to definitions)
Applying: Revert "ppc: move exports to definitions"
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (a3adfca82ab5 Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (289ef679086c ALSA: usb: caiaq: audio: don't print error when allocating urb fails)
Merging sound-asoc/for-next (4e4abe1b3942 Merge remote-tracking branches 'asoc/topic/simple', 'asoc/topic/sunxi', 'asoc/topic/tegra' and 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (a485cb037fe6 Input: add driver for SiS 9200 family I2C touchscreen controllers)
Merging block/for-next (b013517951a1 Merge branch 'for-4.8/core' into for-next)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (9e7d9367e6a2 dm raid: support raid0 with missing metadata devices)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (6ea625794518 mmc: rtsx_pci: Remove deprecated create_singlethread_workqueue)
Merging md/for-next (a0667a61d4bf md-cluster: make resync lock also could be interruptted)
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (1c4593edbd4a power: supply: Change Krzysztof Kozlowski's email to kernel.org)
Merging omap_dss2/for-next (e0299908d606 video: fbdev: pxafb: potential NULL dereference on error)
Merging regulator/for-next (bd66923cab2f Merge remote-tracking branches 'regulator/topic/bulk', 'regulator/topic/ltc3676', 'regulator/topic/rk808' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (a518b0a5b0d7 selinux: Implement dentry_create_files_as() hook)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoton i2c driver (NPCT6xx family))
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (9733ba95a477 Merge branches 'iommu/fixes', 'x86/amd' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return code during release)
Merging jc_docs/docs-next (cc935bb5969a Merge branch 'doc/4.9' into docs-next)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (523d939ef98f Linux 4.7)
Merging devicetree/for-next (34276bb062b8 of: fix reference counting in of_graph_get_endpoint_by_regs)
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and type mismatches in Broadcom PDC driver)
Merging spi/for-next (43f680417eb5 Merge remote-tracking branches 'spi/topic/spidev-test', 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (0d7bce60a19f Merge branch 'x86/mm')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7bb8b777794b EDAC, wq: Remove deprecated create_singlethread_workqueue())
Merging irqchip/irqchip/for-next (0a92afaa0a00 Merge branch 'irqchip/mvebu64' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (2431d3eb7be7 cpu/hotplug: Get rid of CPU_STARTING reference)
Merging kvm/linux-next (694d0d0bb203 Linux 4.8-rc2)
Merging kvm-arm/next (29b4817d4018 Linux 4.8-rc1)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (93d17397e4e2 KVM: PPC: Book3S HV: Save/restore TM state in H_CEDE)
Merging kvms390/next (1dbbcbf3f553 KVM: s390: lazy enable RI)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization of steal_clock op to xen_time_ops)
Merging percpu/for-next (a67823c1ed10 percpu-refcount: init ->confirm_switch member properly)
Merging workqueues/for-next (d945b5e9f0e3 workqueue: Fix setting affinity of unbound worker threads)
Merging drivers-x86/for-next (29b4817d4018 Linux 4.8-rc1)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (29b4817d4018 Linux 4.8-rc1)
Merging leds/for-next (7f866986e705 leds: add PM8058 LEDs driver)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (694d0d0bb203 Linux 4.8-rc2)
Merging tty/tty-next (29b4817d4018 Linux 4.8-rc1)
Merging usb/usb-next (73577d61799e ehci-platform: add the max clock number to 4)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (29b4817d4018 Linux 4.8-rc1)
Merging usb-chipidea-next/ci-for-usb-next (2b48f2ad3149 usb: chipidea: udc: Use direction flags consequently)
Merging staging/staging-next (8dfb8fdbd2d1 staging: unisys: visorinput: make lock_visor_dev a mutex)
Merging char-misc/char-misc-next (694d0d0bb203 Linux 4.8-rc2)
Merging extcon/extcon-next (160a746f5205 extcon: Use the extcon_set_state_sync() instead of deprecated functions)
Merging cgroup/for-next (667430ec48e4 Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (c8854259489b Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (6650248f46d7 Merge branch 'for-4.8-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (0a0e12c85650 Merge branch 'devel' into for-next)
Merging vhost/linux-next (6be3ffaa0e15 tools/virtio: add dma stubs)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (aa516c9cb11f Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (1bc099971c8d Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (7e6a3a1d79fe clk: qcom: Sort Makefile alphabetically)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (523d939ef98f Linux 4.7)
Merging coresight/next (10156d120e4d coresight: fix handling of ETM trace register access via sysfs)
Merging rtc/rtc-next (6c6aba9e8985 rtc: rx6110: remove owner assignment)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d8d378fa1a0c tools/testing/nvdimm: fix SIGTERM vs hotplug crash)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (ac4f893ec33a ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Merging akpm/master (16edfbe64ae4 include/linux/mlx5/device.h: kill BUILD_BUG_ON()s)
