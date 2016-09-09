From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 9
Date: Fri, 9 Sep 2016 15:47:23 +1000
Message-ID: <20160909154723.074a1ec1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750831AbcIIFr0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Sep 2016 01:47:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160908:

New tree: kvm-mips

The btrfs-kdave tree still had its build failure so I used the version
from next-20160906.

The kbuild tree still had its build warnings for PowerPC, for which I
reverted a commit.

The devicetree tree gained a conflict against the imx-mxs tree.

The gpio tree gained a build failure, so I used the version from
next-20160908.

Non-merge commits (relative to Linus' tree): 5850
 5573 files changed, 273152 insertions(+), 103813 deletions(-)

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

I am currently merging 241 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (711bef65e91d Merge tag 'ceph-for-4.8-rc6' of git://github.com/ceph/ceph-client)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (3eab887a5542 Linux 4.8-rc4)
Merging arm-current/fixes (da60626e7d02 ARM: sa1100: clear reset status prior to reboot)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (f077aaf0754b powerpc/mm: Don't alias user region to other regions below PAGE_OFFSET)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (81d1a366ff81 Merge branch 'mlx5-fixes')
Merging ipsec/master (11d7a0bb95ea xfrm: Only add l3mdev oif to dst lookups)
Merging netfilter/master (d1a6cba576fc netfilter: nft_chain_route: re-route before skb is queued to userspace)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (a0714125d11b Merge ath-current from ath.git)
Merging mac80211/master (61aaa0e8c1c1 cfg80211: Add stub for cfg80211_get_station())
Merging sound-current/for-linus (816f318b2364 ALSA: rawmidi: Fix possible deadlock with virmidi registration)
Merging pci-current/for-linus (6af7e4f77259 PCI: Mark Haswell Power Control Unit as having non-compliant BARs)
Merging driver-core.current/driver-core-linus (c6935931c189 Linux 4.8-rc5)
Merging tty.current/tty-linus (c6935931c189 Linux 4.8-rc5)
Merging usb.current/usb-linus (bcf42aa60c28 xhci: fix null pointer dereference in stop command timeout function)
Merging usb-gadget-fixes/fixes (696118c016dd usb: dwc3: pci: fix build warning on !PM_SLEEP)
Merging usb-serial-fixes/usb-linus (40d9c32525cb USB: serial: option: add WeTelecom 0x6802 and 0x6803 products)
Merging usb-chipidea-fixes/ci-for-usb-stable (c4e94174983a usb: chipidea: udc: don't touch DP when controller is in host mode)
Merging staging.current/staging-linus (c6935931c189 Linux 4.8-rc5)
Merging char-misc.current/char-misc-linus (c6935931c189 Linux 4.8-rc5)
Merging input-current/for-linus (e3a888a4bff0 Input: ads7846 - remove redundant regulator_disable call)
Merging crypto-current/master (0bd2223594a4 crypto: cryptd - initialize child shash_desc on import)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (fc2780b66b15 drm/i915: Add GEN7_PCODE_MIN_FREQ_TABLE_GT_RATIO_OUT_OF_RANGE to SNB)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (cce9ba105a8c ARCv2: Support dynamic peripheral address space in HS38 rel 3.0 cores)
Merging arm/for-next (4dbab2b2cf1e Merge branches 'fixes', 'fixes-pcmcia' and 'misc' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (3b35430919d4 Merge branch 'fixes' into for-next)
CONFLICT (modify/delete): arch/arm/mach-realview/core.c deleted in arm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-realview/core.c left in tree.
$ git rm -f arch/arm/mach-realview/core.c
Merging amlogic/for-next (cbf216bf60bb Merge v4.8/mmc)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (9336be5db24d Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (76bc3b591df5 Merge branch 'imx/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (6c7707b7629c Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (91dda79fa02c Merge branch 'omap-for-v4.9/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (4feeec0c6e6d Merge tag 'qcom-arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (a64ca8158b21 Merge branches 'fixes-for-v4.8', 'arm64-defconfig-for-v4.9', 'arm64-dt-for-v4.9', 'defconfig-for-v4.9', 'dt-for-v4.9' and 'soc-for-v4.9' into next)
Merging rockchip/for-next (f684bddf2bb2 Merge branch 'v4.9-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (9c2c94f84659 Merge branch 'next/dt' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/exynos/exynos7.dtsi
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (98ab10e9770e arm64: ftrace: add save_stack_trace_regs())
CONFLICT (content): Merge conflict in arch/arm64/kernel/head.S
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (986d80466712 m68k/defconfig: Update defconfigs for v4.8-rc1)
Merging m68knommu/for-next (d657ba0e9140 m68k: don't panic if no hardware FPU defined)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (82440d0d030d Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (65f836ae4de0 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (c6935931c189 Linux 4.8-rc5)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (c783b91ebdba s390: add assembler include path for vx-insn.h)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (5cb0837912ed tile: remove #pragma unroll from finv_buffer_remote())
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (dad162e56429 Merge branch 'for-next-next-4.9-20160906' into for-next-20160906)
$ git reset --hard HEAD^
Merging next-20160906 version of btrfs-kdave
CONFLICT (content): Merge conflict in fs/btrfs/send.c
CONFLICT (content): Merge conflict in fs/btrfs/relocation.c
[master def3b9bd45d4] next-20160906/btrfs-kdave
Merging ceph/master (0276dca6c1ec rbd: add force close option)
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (f27792f5b7e0 udf: Remove useless check in udf_adinicb_write_begin())
Merging ext4/dev (8913f343cdb5 mbcache: fix to detect failure of register_shrinker)
Merging f2fs/dev (908b1928d645 f2fs: add roll-forward recovery process for encrypted dentry)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (23e5671a79be gfs2: Fix extended attribute readahead optimization)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (05c974669ece xprtrdma: Fix receive buffer accounting)
Merging nfsd/nfsd-next (e2ce4e03e317 nfsd: eliminate cb_minorversion field)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (f654a0253c96 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (17ce1eb0b64e ubifs: Fix xattr generic handler usage)
Merging xfs/for-next (ea78d80866ce xfs: track log done items directly in the deferred pending work item)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs-miklos/next (d55af8a321be vfs: add note about i_op->rename changes to porting)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (503104ad2dc4 Merge branches 'pci/host-aardvark', 'pci/host-hv', 'pci/host-keystone', 'pci/host-rcar' and 'pci/host-tegra' into next)
Merging pstore/for-next/pstore (f88baf68ebe5 ramoops: move spin_lock_init after kmalloc error checking)
Merging hid/for-next (ec3727c27e6b Merge branch 'for-4.9/intel-ish' into for-next)
Merging i2c/i2c/for-next (fd0f514448a9 Merge branch 'i2c/for-4.9' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (88c00316e51f hwmon: (it87) Drop useless comments)
Merging v4l-dvb/master (012800356b59 [media] cec: fix ioctl return code when not registered)
Merging pm/linux-next (375923fd0fa6 Merge branch 'pm-cpufreq-fixes' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (1876b0a39af2 Merge branches 'release' and 'for-rc' into next)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (0241a3bc1dbf Merge branch 'topic/cppi' into next)
Merging net-next/master (2d2be8cab26e bpf: fix range propagation on direct packet access)
CONFLICT (content): Merge conflict in drivers/net/ethernet/qlogic/qed/qed_dcbx.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mediatek/mtk_eth_soc.c
Merging ipsec-next/master (35db57bbc4b7 xfrm: state: remove per-netns gc task)
Merging netfilter-next/master (1bcabc81ee94 netfilter: nf_ct_sip: allow tab character in SIP headers)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (5856cd5b8dda rtlwifi/rtl8192de: Fix print format string)
Merging bluetooth/master (f0899f1eb865 Bluetooth: Fix reason code used for rejecting SCO connections)
Merging mac80211-next/master (abc3750c3132 mac80211: refactor monitor representation in sdata)
Merging rdma/for-next (64278fe89b72 Merge branch 'hns-roce' into k.o/for-4.9)
Merging rdma-leon/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging rdma-leon-test/testing/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging mtd/master (a93295a7e118 mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed)
Merging l2-mtd/master (a93295a7e118 mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed)
Merging nand/nand/next (ae77057af25c mtd: nand: remove unnecessary 'extern' from function declarations)
Merging crypto/master (71f89917ff96 crypto: arm/ghash - change internal cra_name to "__ghash")
Merging drm/drm-next (2b2fd56d7e92 Revert "drm: make DRI1 drivers depend on BROKEN")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
Merging drm-panel/drm/panel/for-next (a42f6e3f8f03 drm/panel: simple: Add delay timing for Sharp LQ123P1JX31)
Merging drm-intel/for-linux-next (3d810fbedec4 drm/i915: Move HAS_GUC definition to platform definition)
CONFLICT (content): Merge conflict in include/drm/drmP.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (dec90ea1456b drm: Fix error path in drm_mode_page_flip_ioctl())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (7b4442c3c606 Merge branch 'sunxi/core-for-4.9' into sunxi/for-next)
Merging kbuild/for-next (5c6f3225d00d kbuild: Regenerate genksyms lexer)
Applying: Revert "ppc: move exports to definitions"
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (faa52daec60c Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (44cc4a017e2d ALSA: squash lines for simple wrapper functions)
Merging sound-asoc/for-next (0d954da1d57f Merge remote-tracking branches 'asoc/topic/tegra', 'asoc/topic/topology', 'asoc/topic/ux500' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (db808498ae2c Input: focaltech - mark focaltech_set_resolution() static)
Merging block/for-next (3fabab1cec36 nbd: add multi-connection support)
Merging lightnvm/for-next (e9c12e6b8e7c lightnvm: NVM should depend on HAS_DMA)
Merging device-mapper/for-next (edd1ea2a8a25 dm bufio: remove use of deprecated create_singlethread_workqueue())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (521676f0c083 mmc: tegra: Mark 64-bit DMA broken on Tegra124)
Merging md/for-next (025f48e90106 raid5: allow arbitrary max_hw_sectors)
CONFLICT (content): Merge conflict in include/linux/raid/pq.h
Merging mfd/for-mfd-next (42265a10088f mfd: ucb1x00: Remove NO_IRQ check)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/for-next (9edeaada19a2 power: supply: sbs-battery: simplify DT parsing)
Merging omap_dss2/for-next (ee65e18206f5 fb: adv7393: off by one in probe function)
Merging regulator/for-next (b8ec4737c4a4 Merge remote-tracking branches 'regulator/topic/tps65218' and 'regulator/topic/tps80031' into regulator-next)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (7c686af071ad selinux: fix overflow and 0 length allocations)
Merging tpmdd/next (a307518add94 Merge tag 'tpmdd-next-20160902' into next)
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (b13a5606c4b2 Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek' and 'arm/renesas' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (8138dabbab26 vfio/pci: Fix typos in comments)
Merging jc_docs/docs-next (eb69548f5b9b Merge branch 'doc/4.9' into docs-next)
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (fa2bea2f5cca audit: consistently record PIDs with task_tgid_nr())
Merging devicetree/for-next (5839783247f4 Documentation: devicetree: Fix max77693 spelling errors)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (eb28f2f6cdcf Merge remote-tracking branches 'spi/topic/txx9' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (36cb898c1c61 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in arch/x86/lib/memcpy_64.S
CONFLICT (modify/delete): arch/x86/kernel/x8664_ksyms_64.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/x86/kernel/x8664_ksyms_64.c left in tree.
$ git rm -f arch/x86/kernel/x8664_ksyms_64.c
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c91d907596cc EDAC, I3000: Orphan driver)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (7b2c86250122 tracing: Add NMI tracing in hwlat detector)
CONFLICT (content): Merge conflict in kernel/trace/trace_functions_graph.c
CONFLICT (content): Merge conflict in include/linux/ftrace.h
Merging rcu/rcu/next (f8e66fbaed01 rcu: Remove obsolete comment from __call_rcu())
Merging kvm/linux-next (6f90f1d1d2d8 Merge tag 'kvm-s390-next-4.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (5d947a1447f9 KVM: ARM: cleanup kvm_timer_hyp_init)
Merging kvm-mips/next (d5888477d31c KVM: MIPS: Emulate MMIO via TLB miss for EVA)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (2a27f514a47d KVM: PPC: Implement existing and add new halt polling vcpu stats)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (b489c14e922f arm/xen: fix SMP guests boot)
Merging percpu/for-next (a67823c1ed10 percpu-refcount: init ->confirm_switch member properly)
Merging workqueues/for-next (278930ada88c workqueue: dump workqueue state on sanity check failures in destroy_workqueue())
Merging drivers-x86/for-next (fa1bc2a09f5f platform/x86: toshiba_acpi: Fix typo in *_cooling_method_set function)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (990dcec2df24 leds: add driver for Mellanox systems LEDs)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (2f5bb02ff224 Merge 4.8-rc5 into driver-core-next)
Merging tty/tty-next (b53761e36a50 Merge 4.8-rc5 into tty-next)
CONFLICT (content): Merge conflict in drivers/dma/imx-sdma.c
Merging usb/usb-next (9b0dd49e3565 Merge 4.8-rc5 into usb-testing)
Merging usb-gadget/next (9d6173e125d9 usb: dwc3: Fix dr_mode validation)
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (1d9aabecde29 usb: chipidea: udc: Use direction flags consequently)
Merging staging/staging-next (9c2edd8b5bcb Merge 4.8-rc5 into staging-next)
Merging char-misc/char-misc-next (8e1d260738ca Drivers: hv: utils: Support TimeSync version 4.0 protocol samples.)
Merging extcon/extcon-next (160a746f5205 extcon: Use the extcon_set_state_sync() instead of deprecated functions)
Merging cgroup/for-next (667430ec48e4 Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (237870b3374e Merge branch 'fixes' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (79ed140b1232 Merge branch 'for-4.9' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (234f4eab7372 Merge branch 'devel' into for-next)
Merging vhost/linux-next (a77ec83a5789 vhost/scsi: fix reuse of &vq->iov[out] in response)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (873a24e696b9 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (a18ce172f261 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
$ git reset --hard HEAD^
Merging next-20160908 version of gpio
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
[master 8960345141b1] next-20160908/gpio
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (a063c1e12062 Merge branch 'clk-fixes' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (a559985c4a80 coresight: tmc: mark symbols static where possible)
Merging rtc/rtc-next (de75ccdd4118 rtc: asm9260: rework locking)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (010666b8edc3 Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (cdaa6aa1e90c kexec_file fixup)
CONFLICT (content): Merge conflict in kernel/relay.c
Applying: crypto: engine: fix linux-next merge conflict
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Applying: kdump, vmcoreinfo: report memory sections virtual addresses
Applying: mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping
Applying: scripts/tags.sh: enable code completion in VIM
Merging akpm/master (7d3a1bf60c71 scripts/tags.sh: enable code completion in VIM)
