From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 19
Date: Mon, 19 Sep 2016 17:02:08 +1000
Message-ID: <20160919170208.4e20e7f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42250 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752725AbcISHCM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Sep 2016 03:02:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160916:

The kbuild tree still had its build failure and warnings for PowerPC,
for which I applied a couple of patches

The f2fs tree gained a conflict against the ext4 tree.

The block tree lost its build failure but gained another for which I
applied a fix patch

The slave-dma tree still has its build failure so I used the version from
next-20160915.

Non-merge commits (relative to Linus' tree): 7929
 7633 files changed, 362282 insertions(+), 221580 deletions(-)

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

I am currently merging 242 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (b01cf676835b Merge tag 'usb-4.8-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (3eab887a5542 Linux 4.8-rc4)
Merging arm-current/fixes (1a57c286d8ce ARM: pxa/lubbock: add pcmcia clock)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (ed7d9a1d7da6 powerpc/powernv/pci: Fix missed TCE invalidations that should fallback to OPAL)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (37dd348270c1 bna: fix crash in bnad_get_strings())
Merging ipsec/master (1fb81e09d487 vti: use right inner_mode for inbound inter address family policy checks)
Merging netfilter/master (440f895aa97f drivers: net: phy: xgene: Fix 'remove' function)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (db64c5fa590b Merge tag 'iwlwifi-for-kalle-2016-09-15' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (85d5313ed717 mac80211: reject TSPEC TIDs (TSIDs) for aggregation)
Merging sound-current/for-linus (3f640970a414 ALSA: hda - Fix headset mic detection problem for several Dell laptops)
Merging pci-current/for-linus (035ee288ae7a PCI: Fix bridge_d3 update on device removal)
Merging driver-core.current/driver-core-linus (c6935931c189 Linux 4.8-rc5)
Merging tty.current/tty-linus (c6935931c189 Linux 4.8-rc5)
Merging usb.current/usb-linus (e06226e66bea Merge tag 'usb-serial-4.8-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (696118c016dd usb: dwc3: pci: fix build warning on !PM_SLEEP)
Merging usb-serial-fixes/usb-linus (f190fd92458d USB: serial: simple: add support for another Infineon flashloader)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f3c4fb6d05e usb: chipidea: udc: fix NULL ptr dereference in isr_setup_status_phase)
Merging staging.current/staging-linus (9395452b4aab Linux 4.8-rc6)
Merging char-misc.current/char-misc-linus (c6935931c189 Linux 4.8-rc5)
Merging input-current/for-linus (4af2ff91ec3f Input: silead_gsl1680 - use "silead/" prefix for firmware loading)
Merging crypto-current/master (2db34e78f126 crypto: arm64/aes-ctr - fix NULL dereference in tail processing)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (ea54ff400889 drm/i915: Ignore OpRegion panel type except on select machines)
Merging kbuild/for-next (fbe6e37dab97 kbuild: add arch specific post-link Makefile)
CONFLICT (content): Merge conflict in arch/Kconfig
Applying: ppc: there is no clear_pages to export
Applying: powerpc/64: whitelist unresolved modversions CRCs
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (0df8b1dde416 arc: perf: Enable generic "cache-references" and "cache-misses" events)
Merging arm/for-next (32cb4b0bce85 Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (1214c1a235c9 Merge branch 'fixes' into for-next)
Merging pinctrl/for-next (d6d8a9f007dc Merge branch 'devel' into for-next)
Merging amlogic/for-next (6b8356243e10 Merge branch 'v4.9/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (9336be5db24d Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (70da51e698c7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (070cb549ff1e Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (90f712748d7d Merge branch 'omap-for-v4.9/dt-v2' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (4feeec0c6e6d Merge tag 'qcom-arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (a64ca8158b21 Merge branches 'fixes-for-v4.8', 'arm64-defconfig-for-v4.9', 'arm64-dt-for-v4.9', 'defconfig-for-v4.9', 'dt-for-v4.9' and 'soc-for-v4.9' into next)
Merging rockchip/for-next (e80be333a38f Merge branch 'v4.9-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (ea24fc2674ef Merge branch 'next/dt' into for-next)
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (85023b2e1325 arm64: pmu: Hoist pmu platform device name)
CONFLICT (content): Merge conflict in drivers/perf/arm_pmu.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/head.S
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (986d80466712 m68k/defconfig: Update defconfigs for v4.8-rc1)
Merging m68knommu/for-next (15bbcf4ac65a m68knommu: convert printk(KERN_INFO) to pr_info())
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (82440d0d030d Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (65f836ae4de0 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (e1c0d66fcb17 powerpc: Set used_(vsr|vr|spe) in sigreturn path when MSR bits are active)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (c783b91ebdba s390: add assembler include path for vx-insn.h)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (ecc8bebe29f5 tile: remove #pragma unroll from finv_buffer_remote())
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (56b508b018fd Merge branch 'for-next-next-4.9-20160909' into for-next-20160909)
Merging ceph/master (0276dca6c1ec rbd: add force close option)
Merging cifs/for-next (348c1bfa84df Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (420902c9d086 reiserfs: Unlock superblock before calling reiserfs_quota_on_mount())
Merging ext4/dev (e36767750532 blockgroup_lock.h: simplify definition of NR_BG_LOCKS)
Merging f2fs/dev (5905f9afa272 f2fs: handle error in recover_orphan_inode)
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (663ed4a5e67c fuse: update attributes before splice read)
Merging gfs2/for-next (23e5671a79be gfs2: Fix extended attribute readahead optimization)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (b519d408ea32 NFSv4.1: Fix the CREATE_SESSION slot number accounting)
Merging nfsd/nfsd-next (06826fca0a6c nfsd: randomize SETCLIENTID reply to help distinguish servers)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (54249cd03956 ovl: during copy up, switch to mounter's creds early)
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
Merging hwmon-staging/hwmon-next (7ce4190c4ca4 hwmon: (nct6775) Add support for multiple virtual temperature sources)
Merging v4l-dvb/master (431bffd2bd89 Merge branch 'patchwork' into to_next)
Merging pm/linux-next (29296e983dfa Merge branch 'pm-core-fixes' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (1876b0a39af2 Merge branches 'release' and 'for-rc' into next)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (fd9527f404d5 Merge branch 'ip_tunnel-collect_md')
Merging ipsec-next/master (34a3d4b2d1f1 xfrm: fix header file comment reference to struct xfrm_replay_state_esn)
Merging netfilter-next/master (14e2dee0996f netfilter: nft_hash: fix hash overflow validation)
CONFLICT (content): Merge conflict in net/netfilter/nf_tables_netdev.c
Applying: netfilter: merge fixup for "nf_tables_netdev: remove redundant ip_hdr assignment"
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (80ba4f1d365a mwifiex: fix null pointer deference when adapter is null)
Merging bluetooth/master (7b4ecaab00f1 Bluetooth: btrtl: Add RTL8822BE Bluetooth device)
Merging mac80211-next/master (fbd05e4a6e82 cfg80211: add helper to find an IE that matches a byte-array)
Merging rdma/for-next (64278fe89b72 Merge branch 'hns-roce' into k.o/for-4.9)
Merging rdma-leon/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging rdma-leon-test/testing/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging mtd/master (f6d7c1b5598b mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl)
Merging l2-mtd/master (f6d7c1b5598b mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl)
Merging nand/nand/next (147054c1ccbd mtd: nand: Fix nand_command_lp() for 8bits opcodes)
Merging crypto/master (36e09e1f874b crypto: squash lines for simple wrapper functions)
Merging drm/drm-next (8506912b969b Merge branch 'drm-tda998x-devel' of git://git.armlinux.org.uk/~rmk/linux-arm into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (3442d9eee459 drm: Fix DisplayPort branch device ID kernel-doc)
CONFLICT (content): Merge conflict in include/drm/drmP.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (a988588b1806 drm: Only use compat ioctl for addfb2 on X86/IA64)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (3459ab314ce7 drm/msm: bump kernel api version for explicit fencing)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_gem_submit.c
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (d035f1204017 Merge branches 'sunxi/core-for-4.9', 'sunxi/drm-for-4.9', 'sunxi/dt-for-4.9' and 'sunxi/config64-for-4.9', tags 'sunxi-clk-fixes-for-4.8' and 'sunxi-fixes-for-4.8' into sunxi/for-next)
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (aaaae4bcfeee Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (c5a905d3122a ALSA: compress: fix some missing and misplaced \n in messages)
Merging sound-asoc/for-next (7de467e35998 Merge remote-tracking branches 'asoc/topic/tlv320dac33', 'asoc/topic/topology', 'asoc/topic/ux500' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (722dc54628ca Input: tps65218-pwrbutton - add support for tps65217 variant)
Merging block/for-next (487e80f02757 Merge branch 'for-4.9/block' into for-next)
Merging lightnvm/for-next (b67347d7dc28 lightnvm: propagate device_add() error code)
Merging device-mapper/for-next (3075292fe80f dm cache policy smq: distribute entries to random levels when switching to smq)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (9fb26b1c72da Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (a1cba8e581f9 arm64: kgdb: fix single stepping)
Merging md/for-next (fcd4a4cc1359 raid5: allow arbitrary max_hw_sectors)
CONFLICT (content): Merge conflict in include/linux/raid/pq.h
Merging mfd/for-mfd-next (fcb63d9f5c3a mfd: tps65217: Fix nonstandard declaration)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/for-next (9edeaada19a2 power: supply: sbs-battery: simplify DT parsing)
Merging omap_dss2/for-next (ee65e18206f5 fb: adv7393: off by one in probe function)
Merging regulator/for-next (49503a990264 Merge remote-tracking branches 'regulator/topic/set-voltage', 'regulator/topic/tps65218' and 'regulator/topic/tps80031' into regulator-next)
Merging security/next (de2f4b3453d2 Merge branch 'stable-4.9' of git://git.infradead.org/users/pcmoore/selinux into next)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (9b6a9ecc2d88 selinux: fix error return code in policydb_read())
Merging tpmdd/next (ebfd7532e985 tpm: add check for minimum buffer size in tpm_transmit())
Merging watchdog/master (e8988e0550b0 Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux)
Merging iommu/next (b13a5606c4b2 Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek' and 'arm/renesas' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (2e06285655b5 vfio: platform: mark symbols static where possible)
Merging jc_docs/docs-next (2cfd100bf2f7 Merge branch 'doc/4.9' into docs-next)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (fa2bea2f5cca audit: consistently record PIDs with task_tgid_nr())
Merging devicetree/for-next (f94277af03ea of/platform: Initialise dev->fwnode appropriately)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (b25589c028f8 Merge remote-tracking branches 'spi/topic/ti-qspi', 'spi/topic/tools', 'spi/topic/txx9' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (3bc641ee176e Merge branch 'linus')
CONFLICT (content): Merge conflict in include/linux/jump_label.h
CONFLICT (content): Merge conflict in arch/x86/lib/memcpy_64.S
CONFLICT (modify/delete): arch/x86/kernel/x8664_ksyms_64.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/x86/kernel/x8664_ksyms_64.c left in tree.
$ git rm -f arch/x86/kernel/x8664_ksyms_64.c
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c7c35407cd86 EDAC, sb_edac: Remove NULL pointer check on array pci_tad)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
CONFLICT (content): Merge conflict in kernel/trace/trace_functions_graph.c
CONFLICT (content): Merge conflict in include/linux/ftrace.h
Merging rcu/rcu/next (52e6bc6d43a4 bug: Avoid Kconfig warning for BUG_ON_DATA_CORRUPTION)
Merging kvm/linux-next (ad53e35ae529 Merge branch 'kvm-ppc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (5d947a1447f9 KVM: ARM: cleanup kvm_timer_hyp_init)
Merging kvm-mips/next (d5888477d31c KVM: MIPS: Emulate MMIO via TLB miss for EVA)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (aad9e5ba2433 KVM: PPC: e500: Rename jump labels in kvmppc_e500_tlb_init())
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (4f0fbdf22e73 xen/grant-table: Use kmalloc_array() in arch_gnttab_valloc())
Merging percpu/for-next (a67823c1ed10 percpu-refcount: init ->confirm_switch member properly)
Merging workqueues/for-next (863b710b664b workqueue: remove keventd_up())
Merging drivers-x86/for-next (fa1bc2a09f5f platform/x86: toshiba_acpi: Fix typo in *_cooling_method_set function)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (f3f624941be0 leds: Only remove trigger if one is actually configured.)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (2f5bb02ff224 Merge 4.8-rc5 into driver-core-next)
Merging tty/tty-next (d2ec3f77de8e pty: make ptmx file ops read-only after init)
Merging usb/usb-next (eddde2889579 Merge tag 'usb-serial-4.9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging usb-gadget/next (e6be244a8321 usb: gadget: uvc: add V4L2 dependency)
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (e74e83724808 usb: chipidea: udc: Use the preferred form for passing a size of a struct)
Merging staging/staging-next (b125a1b2b9d4 Revert "staging: olpc_dcon: Replace a bit shift by a use of BIT.")
Merging char-misc/char-misc-next (4b7b948b1fcd vme: fake: fix build for 64-bit dma_addr_t)
Merging extcon/extcon-next (38085c987f52 extcon: Add support for qcom SPMI PMIC USB id detection hardware)
Merging slave-dma/next (287ce749eb30 Merge branch 'topic/hsu' into next)
$ git reset --hard HEAD^
Merging next-20160915 version of slave-dma
Merging cgroup/for-next (65a3de66d4ef Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (fb8be2382689 Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (4bf4f57f34b0 Merge branch 'for-4.9' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (5e59d9a1aed2 virtio_console: Stop doing DMA on the stack)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (a4a68bf90f34 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0203a5ff55d7 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mxc.c
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (7f4d3b52b6b6 clk: uniphier: add clock data for UniPhier SoCs)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (6015bb25e7b3 coresight: stm: return error code instead of zero in .packet())
Merging rtc/rtc-next (de75ccdd4118 rtc: asm9260: rework locking)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (33b69bc53b00 Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Applying: blk_mq: linux/blk-mq.h does not include all the headers it depends on
Merging akpm-current/current (a69892f0ba57 ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
CONFLICT (content): Merge conflict in include/linux/relay.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Applying: kdump, vmcoreinfo: report memory sections virtual addresses
Applying: mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping
Applying: scripts/tags.sh: enable code completion in VIM
Applying: kthread: rename probe_kthread_data() to kthread_probe_data()
Applying: kthread: kthread worker API cleanup
Applying: crypto: engine: fix linux-next merge conflict
Applying: kthread/smpboot: do not park in kthread_create_on_cpu()
Applying: kthread: allow to call __kthread_create_on_node() with va_list args
Applying: kthread: add kthread_create_worker*()
Applying: kthread: add kthread_destroy_worker()
Applying: kthread: detect when a kthread work is used by more workers
Applying: kthread: initial support for delayed kthread work
Applying: kthread: allow to cancel kthread work
Applying: kthread: allow to modify delayed kthread work
Applying: kthread: better support freezable kthread workers
Applying: kthread: add kerneldoc for kthread_create()
Applying: hung_task: allow hung_task_panic when hung_task_warnings is 0
Applying: hung_task-allow-hung_task_panic-when-hung_task_warnings-is-0-fix
Applying: treewide: remove redundant #include <linux/kconfig.h>
Merging akpm/master (b9838e1748e6 treewide: remove redundant #include <linux/kconfig.h>)
