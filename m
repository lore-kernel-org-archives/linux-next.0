From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 25
Date: Thu, 25 Aug 2016 14:54:59 +1000
Message-ID: <20160825145459.6b252d0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48782 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756448AbcHYE5d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Aug 2016 00:57:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160824:

The kbuild tree still had its build warnings for PowerPC, for which I
reverted a commit.

Non-merge commits (relative to Linus' tree): 3682
 3689 files changed, 170524 insertions(+), 63738 deletions(-)

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
Merging origin/master (4935e04ef431 Merge branch 'for-linus-4.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (c57653dc94d0 ARC: export __udivdi3 for modules)
Merging arm-current/fixes (87eed3c74d7c ARM: fix address limit restoration for undefined instructions)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (ca49e64f0cb1 selftests/powerpc: Specify we expect to build with std=gnu99)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (51af96b53469 mlxsw: router: Enable neighbors to be created on stacked devices)
Merging ipsec/master (11d7a0bb95ea xfrm: Only add l3mdev oif to dst lookups)
Merging netfilter/master (b75911b66ad5 netfilter: cttimeout: fix use after free error when delete netns)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (b64abcb7dae6 brcmfmac: Change vif_event_lock to spinlock)
Merging mac80211/master (4d0bd46a4d55 Revert "wext: Fix 32 bit iwpriv compatibility issue with 64 bit Kernel")
Merging sound-current/for-linus (abaa2274811d ALSA: hda/realtek - fix headset mic detection for MSI MS-B120)
Merging pci-current/for-linus (21c80c9fefc3 x86/PCI: VMD: Fix infinite loop executing irq's)
Merging driver-core.current/driver-core-linus (694d0d0bb203 Linux 4.8-rc2)
Merging tty.current/tty-linus (87a713c8ffca 8250/fintek: rename IRQ_MODE macro)
Merging usb.current/usb-linus (53e5f36fbd24 USB: avoid left shift by -1)
Merging usb-gadget-fixes/fixes (a0ad85ae866f usb: dwc3: gadget: stop processing on HWO set)
Merging usb-serial-fixes/usb-linus (40d9c32525cb USB: serial: option: add WeTelecom 0x6802 and 0x6803 products)
Merging usb-chipidea-fixes/ci-for-usb-stable (c4e94174983a usb: chipidea: udc: don't touch DP when controller is in host mode)
Merging staging.current/staging-linus (eafe5cfe7189 Merge tag 'iio-fixes-for-4.8a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into work-linus)
Merging char-misc.current/char-misc-linus (51c70261b257 Revert "android: binder: fix dangling pointer comparison")
Merging input-current/for-linus (e3a888a4bff0 Input: ads7846 - remove redundant regulator_disable call)
Merging crypto-current/master (901d3d4fee83 crypto: vmx - fix null dereference in p8_aes_xts_crypt)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (c9d2d3ac4ed0 drm/i915/dvo: Remove dangling call to drm_encoder_cleanup())
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (e6aeb2fbb85f ARC: Support syscall ABI v4)
Merging arm/for-next (d0a0f0bafaf4 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (756c52412437 Merge branch 'fixes' into for-next)
Merging amlogic/for-next (57d06053f68b Merge v4.8/mmc)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ab4e0d3745d6 Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (2c6bb730dd4e Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (eef6bb9fc17a Merge branch 'for_4.8/keystone' into next)
Merging mvebu/for-next (38b7b9bdeb7a Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (3853bd4d48a1 Merge branch 'omap-for-v4.9/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (54ba896ebf5e Merge branch 'arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (903456504371 Merge branch 'soc-for-v4.9' into next)
Merging rockchip/for-next (80fd8abc3200 Merge branch 'v4.8-clk/fixes' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (7a169f838a67 Merge branch 'next/dt' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (747a70e60b72 arm64: Fix copy-on-write referencing in HugeTLB)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging m68knommu/for-next (fa8410b35525 Linux 4.8-rc3)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (82440d0d030d Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (9fa78f63a892 nios2: Add order-only DTC dependency to %.dtb target)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (29b4817d4018 Linux 4.8-rc1)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (2ccb5bf0e2f1 s390/tape: Use memdup_user() rather than duplicating its implementation)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (74050a3188c8 tile-srom: avoid krealloc(... __GFP_ZERO) pattern)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (79354fc60318 Btrfs: fix lockdep warning on deadlock against an inode's log mutex)
Merging ceph/master (0276dca6c1ec rbd: add force close option)
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (3cd0126dca82 quota: fill in Q_XGETQSTAT inode information for inactive quotas)
Merging ext4/dev (7bc949164511 ext4: verify extent header depth)
Merging f2fs/dev (cad9d20784e9 Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (23e5671a79be gfs2: Fix extended attribute readahead optimization)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (41963c10c47a pnfs/blocklayout: update last_write_offset atomically with extents)
Merging nfsd/nfsd-next (e2ce4e03e317 nfsd: eliminate cb_minorversion field)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (f200ea288c78 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (17ce1eb0b64e ubifs: Fix xattr generic handler usage)
Merging xfs/for-next (32438cf9d54b Merge branch 'iomap-fixes-4.8-rc3' into for-next)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs-miklos/next (d55af8a321be vfs: add note about i_op->rename changes to porting)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (29b4817d4018 Linux 4.8-rc1)
Merging pstore/for-next/pstore (e976e56423dc ramoops: use persistent_ram_free() instead of kfree() for freeing prz)
Merging hid/for-next (dc1de1f4bebd Merge branch 'for-4.8/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (00f0ea70d2b8 eeprom: at24: check if the chip is functional in probe())
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (0cf56b7b9c31 hwmon: (ucd9000) Add support for UCD90160 Power Supply Sequencer)
Merging v4l-dvb/master (b6aa39228966 Merge tag 'v4.8-rc1' into patchwork)
Merging pm/linux-next (ed8a91cce541 Merge branches 'acpi-sysfs', 'acpi-ec' and 'acpi-soc' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (33f27e0f4801 Merge branches 'for-rc' and 'release' into next)
Merging thermal-soc/next (9a1d2bd3e7fd Merge branch 'work-fixes' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
CONFLICT (content): Merge conflict in drivers/thermal/rockchip_thermal.c
CONFLICT (add/add): Merge conflict in drivers/thermal/qcom/tsens.c
CONFLICT (add/add): Merge conflict in drivers/thermal/qcom/tsens-common.c
Applying: thermal: fix up for "fix race condition when updating cooling device"
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (9b8b266033eb Merge branch 'topic/tegra' into next)
Merging net-next/master (6546c78ea671 Merge tag 'rxrpc-rewrite-20160824-2' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
Merging ipsec-next/master (9d0380df6217 xfrm: policy: convert policy_lock to spinlock)
Merging netfilter-next/master (b43f95695124 netfilter: nf_tables: typo in trace attribute definition)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (60747ef4d173 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging bluetooth/master (78abbac5a2ba Bluetooth: bcm203x: don't print error when allocating urb fails)
Merging mac80211-next/master (2d75da13fbb9 nl80211: Allow GET_INTERFACE dumps to be filtered)
Merging rdma/for-next (204f69ba6412 IB/hns: Fix return value check in hns_roce_get_cfg())
Merging rdma-leon/rdma-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon-test/testing/rdma-next (4dd75e30effb Merge branch 'topic/merge-branch' into testing/rdma-next)
Merging mtd/master (11e8a7f9aa94 Merge tag 'for-linus-20160801' into HEAD)
Merging l2-mtd/master (1dcff2e4ae72 mtd: spi-nor: don't build Cadence QuadSPI on non-ARM)
Merging nand/nand/next (e5c88bb4ce0a mtd: nand_bbt: scan for next free bbt block if writing bbt fails)
Merging crypto/master (16d56963e832 crypto: rockchip - use devm_add_action_or_reset())
Merging drm/drm-next (0d42204f3743 drm/doc: Document uapi requirements in DRM)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
Merging drm-panel/drm/panel/for-next (a42f6e3f8f03 drm/panel: simple: Add delay timing for Sharp LQ123P1JX31)
Merging drm-intel/for-linux-next (abc80abde5bd drm/i915: Force RC6 restore after system resume and reset)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (20353335099b drm/doc: Fix vga_switcheroo xref)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (d5a7764dc3e7 Merge branches 'sunxi/clk-for-4.9', 'sunxi/core-for-4.9', 'sunxi/drm-for-4.9', 'sunxi/dt-for-4.9' and 'sunxi/fixes-for-4.8' into sunxi/for-next)
Merging kbuild/for-next (dee81e988674 fixdep: faster CONFIG_ search)
Applying: Revert "ppc: move exports to definitions"
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (db420765b793 Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (e15c282eff54 ALSA: bebob: unify configurations for some models produced by Yamaha/Terratec)
Merging sound-asoc/for-next (f739c978d6f3 Merge remote-tracking branch 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (99ff4d3af80c Input: jornada720_kbd - switch to using dev_dbg)
Merging block/for-next (b013517951a1 Merge branch 'for-4.8/core' into for-next)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (9c5a559d9495 dm log: fix unitialized bio operation flags)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (5c4f4e441abb mmc: sunxi-mmc: change idma descriptor to __le32)
Merging md/for-next (fc8eb78e230a lib/raid6: Add AVX512 optimized xor_syndrome functions)
Merging mfd/for-mfd-next (f37be01e6dc6 mfd: qcom_rpm: Parametrize also ack selector size)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/master (1c4593edbd4a power: supply: Change Krzysztof Kozlowski's email to kernel.org)
Merging omap_dss2/for-next (e0299908d606 video: fbdev: pxafb: potential NULL dereference on error)
Merging regulator/for-next (53df648ee341 Merge remote-tracking branch 'regulator/topic/tps80031' into regulator-next)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (05638c9bc586 Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (348a0db9e69e selinux: drop SECURITY_SELINUX_POLICYDB_VERSION_MAX)
Merging tpmdd/next (82cc1a49b635 tpm: Add TPM 2.0 support to the Nuvoton i2c driver (NPCT6xx family))
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (35ee9598972e Merge branches 'iommu/fixes', 'x86/amd', 'arm/exynos' and 'arm/mediatek' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (0991bbdbf5b8 vfio: platform: check reset call return code during release)
Merging jc_docs/docs-next (8d8f60c5e0cd Merge branch 'doc/4.9' into docs-next)
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (523d939ef98f Linux 4.7)
Merging devicetree/for-next (34276bb062b8 of: fix reference counting in of_graph_get_endpoint_by_regs)
Merging mailbox/mailbox-for-next (a68b216676e8 mailbox: Fix format and type mismatches in Broadcom PDC driver)
Merging spi/for-next (f985fc19c155 Merge remote-tracking branches 'spi/topic/txx9' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (2e461fd03f4b Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (6fa06b0d9e95 EDAC, mpc85xx: Fix PCIe error capture)
Merging irqchip/irqchip/for-next (e9abd777ebe8 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (89d39c83d193 rcu: Tighted up __call_rcu() rcu_head alignment check)
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
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (1d1a77ddc8ac leds: centralize definition of "default-state" property)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (694d0d0bb203 Linux 4.8-rc2)
Merging tty/tty-next (694d0d0bb203 Linux 4.8-rc2)
Merging usb/usb-next (1aaaa9acaea1 Merge 4.8-rc3 into usb-next)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (1d9aabecde29 usb: chipidea: udc: Use direction flags consequently)
Merging staging/staging-next (d5bd1eba1923 Merge tag 'iio-for-4.9a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into work-testing)
Merging char-misc/char-misc-next (4c73c0882b34 checkkconfigsymbols.py: add --no-color option, don't print color to non-TTY)
Merging extcon/extcon-next (160a746f5205 extcon: Use the extcon_set_state_sync() instead of deprecated functions)
Merging cgroup/for-next (667430ec48e4 Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (dc43bf39f505 Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (6650248f46d7 Merge branch 'for-4.8-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (4bd0641c2d73 Merge branch 'devel' into for-next)
Merging vhost/linux-next (a77ec83a5789 vhost/scsi: fix reuse of &vq->iov[out] in response)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (f6ed80141833 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0926ebf30f55 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (a196d9ee289a Merge branch 'clk-fixes' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (5ad75fcdd712 Documentation: livepatch: add section about arch-specific code)
Merging coresight/next (67c52cac0c24 coresight: etm4x: adding configurable start/stop filtering)
Merging rtc/rtc-next (6c6aba9e8985 rtc: rx6110: remove owner assignment)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d8d378fa1a0c tools/testing/nvdimm: fix SIGTERM vs hotplug crash)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (7a944a8456be ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Applying: kdump, vmcoreinfo: report memory sections virtual addresses
Applying: mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping
Merging akpm/master (152869a2980e mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping)
