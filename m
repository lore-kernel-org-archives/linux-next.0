From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 5
Date: Mon, 5 Sep 2016 19:25:02 +1000
Message-ID: <20160905192502.24dd8d80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753859AbcIEJZF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 05:25:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160825:

The arm-soc tree gained a conflict against Linus' tree.

The samsung-krzk tree gained a conflict against the arm-soc tree.

The arm64 tree gained a conflict against Linus' tree.

The btrfs-kdave tree gained a conflict against Linus' tree.

The net-next tree gained conflicts against the net tree.

The drm tree gained conflicts against Linus' tree.

The kbuild tree still had its build warnings for PowerPC, for which I
reverted a commit.

The md tree gained a conflict against the s390 tree.

The tty tree gained a conflict against the slave-dma tree.

The char-misc tree gained a conflict against the net-next tree.

The gpio tree gained a conflict against the arm64 tree.

The y2038 tree gained a conflict against the net-next tree.

The akpm-current tree gained a build failure for which I disabled
KEXEC_FILE on PowerPC.

Non-merge commits (relative to Linus' tree): 5221
 5097 files changed, 235222 insertions(+), 95043 deletions(-)

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
Merging origin/master (c6935931c189 Linux 4.8-rc5)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (3eab887a5542 Linux 4.8-rc4)
Merging arm-current/fixes (da60626e7d02 ARM: sa1100: clear reset status prior to reboot)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (78a3e8889b4b powerpc: signals: Discard transaction state from signal frames)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (6e1ce3c34512 af_unix: split 'u->readlock' into two: 'iolock' and 'bindlock')
Merging ipsec/master (11d7a0bb95ea xfrm: Only add l3mdev oif to dst lookups)
Merging netfilter/master (c73c24849011 netfilter: nf_tables_netdev: remove redundant ip_hdr assignment)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (bb87f02b7e4c Merge ath-current from ath.git)
Merging mac80211/master (61aaa0e8c1c1 cfg80211: Add stub for cfg80211_get_station())
Merging sound-current/for-linus (6b1ca4bcadf9 ALSA: fireworks: accessing to user space outside spinlock)
Merging pci-current/for-linus (6af7e4f77259 PCI: Mark Haswell Power Control Unit as having non-compliant BARs)
Merging driver-core.current/driver-core-linus (17d0774f8068 sysfs: correctly handle read offset on PREALLOC attrs)
Merging tty.current/tty-linus (c8d192428f52 serial: 8250: added acces i/o products quad and octal serial cards)
Merging usb.current/usb-linus (2c5575401e34 usb: musb: Fix locking errors for host only mode)
Merging usb-gadget-fixes/fixes (6f8245b4e37c usb: dwc3: gadget: always decrement by 1)
Merging usb-serial-fixes/usb-linus (40d9c32525cb USB: serial: option: add WeTelecom 0x6802 and 0x6803 products)
Merging usb-chipidea-fixes/ci-for-usb-stable (c4e94174983a usb: chipidea: udc: don't touch DP when controller is in host mode)
Merging staging.current/staging-linus (eafe5cfe7189 Merge tag 'iio-fixes-for-4.8a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into work-linus)
Merging char-misc.current/char-misc-linus (ccdf3b888d87 thunderbolt: Don't declare Falcon Ridge unsupported)
Merging input-current/for-linus (e3a888a4bff0 Input: ads7846 - remove redundant regulator_disable call)
Merging crypto-current/master (8b18e2359aff crypto: caam - fix IV loading for authenc (giv)decryption)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (8a07fed44b12 drm/i915/dvo: Remove dangling call to drm_encoder_cleanup())
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat syscall from default list)
Merging arc/for-next (f88c04c0f9b3 ARCv2: Support dynamic peripheral address space in HS38 rel 3.0 cores)
Merging arm/for-next (51b9a5bba0d4 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (58118417d788 arm-soc: document merges)
CONFLICT (modify/delete): arch/arm/mach-realview/core.c deleted in arm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-realview/core.c left in tree.
$ git rm -f arch/arm/mach-realview/core.c
Merging amlogic/for-next (cbf216bf60bb Merge v4.8/mmc)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (9336be5db24d Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (aec3f02e6aa5 Merge branch 'imx/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (23e115d66f98 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (91dda79fa02c Merge branch 'omap-for-v4.9/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (4feeec0c6e6d Merge tag 'qcom-arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (2593eca070b7 Merge branches 'fixes-for-v4.8', 'arm64-defconfig-for-v4.9', 'arm64-dt-for-v4.9' and 'dt-for-v4.9' into next)
Merging rockchip/for-next (f6ac35a7b1cf Merge branch 'v4.9-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (9c2c94f84659 Merge branch 'next/dt' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/exynos/exynos7.dtsi
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (a9be2ee09385 arm64: head.S: document the use of callee saved registers)
CONFLICT (content): Merge conflict in arch/arm64/kernel/head.S
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (986d80466712 m68k/defconfig: Update defconfigs for v4.8-rc1)
Merging m68knommu/for-next (bab9058f2048 m68k: don't panic if no hardware FPU defined)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (82440d0d030d Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (65f836ae4de0 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (523d939ef98f Linux 4.7)
Merging powerpc/next (29b4817d4018 Linux 4.8-rc1)
Merging fsl/next (9f595fd8b548 powerpc/8xx: Force VIRT_IMMR_BASE to be a positive number)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (f5b55fa1f81d RAID/s390: provide raid6 recovery optimization)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (87d7993103fc tile/pci_gx: fix spelling mistake: "delievered" -> "delivered")
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing parameter to arch_vma_access_permitted)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (79354fc60318 Btrfs: fix lockdep warning on deadlock against an inode's log mutex)
CONFLICT (content): Merge conflict in fs/btrfs/send.c
CONFLICT (content): Merge conflict in fs/btrfs/relocation.c
Merging ceph/master (c0de9f5143b5 ceph: do not modify fi->frag in need_reset_readdir())
Merging cifs/for-next (8e1e83d23606 Move check for prefix path to within cifs_get_root())
Merging configfs/for-next (3dc3afadeb04 configfs: don't set buffer_needs_fill to zero if show() returns error)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (3cd0126dca82 quota: fill in Q_XGETQSTAT inode information for inactive quotas)
Merging ext4/dev (8913f343cdb5 mbcache: fix to detect failure of register_shrinker)
Merging f2fs/dev (908b1928d645 f2fs: add roll-forward recovery process for encrypted dentry)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (7244b9538994 f2fs: use filemap_check_errors())
Applying: btrfs: merge fix for "mm: export filemap_check_errors() to modules"
Merging gfs2/for-next (23e5671a79be gfs2: Fix extended attribute readahead optimization)
Merging jfs/jfs-next (7cfcd8b79ab2 jfs: jump to error_out when filemap_{fdatawait, write_and_wait} fails)
Merging nfs/linux-next (86a1679860ba Merge tag 'md/4.8-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/shli/md)
Merging nfsd/nfsd-next (e2ce4e03e317 nfsd: eliminate cb_minorversion field)
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (39345f37f131 Revert "ovl: get_write_access() in truncate")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (17ce1eb0b64e ubifs: Fix xattr generic handler usage)
Merging xfs/for-next (ea78d80866ce xfs: track log done items directly in the deferred pending work item)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs-miklos/next (d55af8a321be vfs: add note about i_op->rename changes to porting)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging pci/next (503104ad2dc4 Merge branches 'pci/host-aardvark', 'pci/host-hv', 'pci/host-keystone', 'pci/host-rcar' and 'pci/host-tegra' into next)
Merging pstore/for-next/pstore (e976e56423dc ramoops: use persistent_ram_free() instead of kfree() for freeing prz)
Merging hid/for-next (ec3727c27e6b Merge branch 'for-4.9/intel-ish' into for-next)
Merging i2c/i2c/for-next (d213a2198556 Merge branch 'i2c/for-4.9' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (88c00316e51f hwmon: (it87) Drop useless comments)
Merging v4l-dvb/master (b6aa39228966 Merge tag 'v4.8-rc1' into patchwork)
Merging pm/linux-next (05eb53caa024 Merge branches 'pm-cpufreq' and 'pm-cpufreq-sched' into linux-next)
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
Merging slave-dma/next (7b6dd59ab93f Merge branch 'topic/unmap_cleanup' into next)
Merging net-next/master (6f2a80276364 Merge branch 'netns-opt')
CONFLICT (content): Merge conflict in drivers/net/ethernet/mediatek/mtk_eth_soc.c
Merging ipsec-next/master (35db57bbc4b7 xfrm: state: remove per-netns gc task)
Merging netfilter-next/master (779994fa3636 netfilter: log: Check param to avoid overflow in nf_log_set)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (5856cd5b8dda rtlwifi/rtl8192de: Fix print format string)
Merging bluetooth/master (4e9a68b81aeb fakelb: fix schedule while atomic)
Merging mac80211-next/master (abc3750c3132 mac80211: refactor monitor representation in sdata)
Merging rdma/for-next (64278fe89b72 Merge branch 'hns-roce' into k.o/for-4.9)
Merging rdma-leon/rdma-next (29b4817d4018 Linux 4.8-rc1)
Merging rdma-leon-test/testing/rdma-next (694d0d0bb203 Linux 4.8-rc2)
Merging mtd/master (a93295a7e118 mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed)
Merging l2-mtd/master (a93295a7e118 mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed)
Merging nand/nand/next (13683057ec73 MAINTAINERS: Add maintainer entry for Ingenic JZ4780 NAND driver)
Merging crypto/master (10faa8c0d6c3 crypto: FIPS - allow tests to be disabled in FIPS mode)
Merging drm/drm-next (2b2fd56d7e92 Revert "drm: make DRI1 drivers depend on BROKEN")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
Merging drm-panel/drm/panel/for-next (a42f6e3f8f03 drm/panel: simple: Add delay timing for Sharp LQ123P1JX31)
Merging drm-intel/for-linux-next (4bb05040fd68 drm/i915: debugfs/i915_gem_interrupt_info does not need struct_mutex)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (75ac49532a3c drm/doc: Add a few words on validation with IGT)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (0a677125d0ff drm/msm: Delete an unnecessary check before drm_gem_object_unreference())
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (1ed343e25f10 Merge branches 'sunxi/clk-fixes-for-4.8', 'sunxi/drm-for-4.9' and 'sunxi/dt-for-4.9' into sunxi/for-next)
Merging kbuild/for-next (5c6f3225d00d kbuild: Regenerate genksyms lexer)
Applying: Revert "ppc: move exports to definitions"
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (faa52daec60c Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (8c91d7d09e3c ALSA: bt87x: constify snd_pcm_ops structures)
Merging sound-asoc/for-next (efb915056f6a Merge remote-tracking branches 'asoc/topic/tegra', 'asoc/topic/topology', 'asoc/topic/ux500' and 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (694641616448 Input: add generic input driver to read encoded GPIO lines)
Merging block/for-next (99e6b87ec210 mtip32xx: mark symbols static where possible)
Merging lightnvm/for-next (191d684c5d4f Merge branch 'for-4.8/drivers' into for-next)
Merging device-mapper/for-next (edd1ea2a8a25 dm bufio: remove use of deprecated create_singlethread_workqueue())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (521676f0c083 mmc: tegra: Mark 64-bit DMA broken on Tegra124)
Merging md/for-next (3fc30f2efaf9 lib/raid6: Add AVX512 optimized xor_syndrome functions)
CONFLICT (content): Merge conflict in include/linux/raid/pq.h
Merging mfd/for-mfd-next (c1b0a7e8a6a7 mfd: twl6040: The chip does not support bulk access)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/for-next (3b5dd3a49496 power: supply: sbs-battery: Use gpio_desc and sleeping calls for battery detect)
Merging omap_dss2/for-next (ee65e18206f5 fb: adv7393: off by one in probe function)
Merging regulator/for-next (1d3bdb9956ec Merge remote-tracking branches 'regulator/topic/tps65218' and 'regulator/topic/tps80031' into regulator-next)
Merging security/next (8ccc7d6bad84 seccomp: Remove 2-phase API documentation)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (7c686af071ad selinux: fix overflow and 0 length allocations)
Merging tpmdd/next (a307518add94 Merge tag 'tpmdd-next-20160902' into next)
Merging watchdog/master (29b4817d4018 Linux 4.8-rc1)
Merging iommu/next (35ee9598972e Merge branches 'iommu/fixes', 'x86/amd', 'arm/exynos' and 'arm/mediatek' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (8138dabbab26 vfio/pci: Fix typos in comments)
Merging jc_docs/docs-next (87171fb72995 Merge branch 'doc/4.9' into docs-next)
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (fa2bea2f5cca audit: consistently record PIDs with task_tgid_nr())
Merging devicetree/for-next (5839783247f4 Documentation: devicetree: Fix max77693 spelling errors)
Merging mailbox/mailbox-for-next (5e608a027082 Merge branch 'akpm' (patches from Andrew))
Merging spi/for-next (bf816ffec593 Merge remote-tracking branch 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (d6fac1a01007 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (c91d907596cc EDAC, I3000: Orphan driver)
Merging irqchip/irqchip/for-next (0d91b806499a Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (78aebca2c955 printk, tracing: Avoiding unneeded blank lines)
Merging rcu/rcu/next (f8e66fbaed01 rcu: Remove obsolete comment from __call_rcu())
Merging kvm/linux-next (694d0d0bb203 Linux 4.8-rc2)
Merging kvm-arm/next (29b4817d4018 Linux 4.8-rc1)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (4b3d173d0440 KVM: PPC: Always select KVM_VFIO, plus Makefile cleanup)
Merging kvms390/next (e845d24016c1 KVM: s390: allow 255 VCPUs when sca entries aren't used)
Merging xen-tip/linux-next (d34c30cc1fa8 xen: add static initialization of steal_clock op to xen_time_ops)
Merging percpu/for-next (a67823c1ed10 percpu-refcount: init ->confirm_switch member properly)
Merging workqueues/for-next (e4e98c460ad3 Merge tag 'hwmon-for-linus-v4.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
Merging drivers-x86/for-next (fa1bc2a09f5f platform/x86: toshiba_acpi: Fix typo in *_cooling_method_set function)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (1f70cb4045cb Documentation: move oneshot trigger attributes documentation to ABI)
Merging ipmi/for-next (92cad0931b08 ipmi: remove trydefaults parameter and default init)
Merging driver-core/driver-core-next (2c507e464f79 device core: Remove deprecated create_singlethread_workqueue)
Merging tty/tty-next (d2f5a7311bca dmaengine: hsu: refactor hsu_dma_do_irq() to return int)
CONFLICT (content): Merge conflict in drivers/dma/imx-sdma.c
Merging usb/usb-next (3112fdde68fa usb: gadget: use IS_ENABLED() instead of checking for built-in or module)
Merging usb-gadget/next (15e4292a2d21 usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable())
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (1d9aabecde29 usb: chipidea: udc: Use direction flags consequently)
Merging staging/staging-next (aa652b1ccbd0 staging: octeon: Use IS_ENABLED() instead of checking for built-in or module)
Merging char-misc/char-misc-next (02baff325462 nvmem: rockchip-efuse: add rk3399-efuse support)
CONFLICT (content): Merge conflict in include/linux/hyperv.h
Applying: Drivers: hv: ring_buffer: merge fix up for "hv_netvsc: make inline functions static"
Merging extcon/extcon-next (160a746f5205 extcon: Use the extcon_set_state_sync() instead of deprecated functions)
Merging cgroup/for-next (667430ec48e4 Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (5b7dc017ee31 Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (3e634d2984c4 Merge branch 'for-4.8-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging pinctrl/for-next (4bd0641c2d73 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/meson/pinctrl-meson-gxbb.c
Merging vhost/linux-next (a77ec83a5789 vhost/scsi: fix reuse of &vq->iov[out] in response)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (f6ed80141833 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0926ebf30f55 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (53de7c26ded7 Merge branch 'for-4.8/regulator' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (aeaa4a79ff6a fs: Call d_automount with the filesystems creds)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (e918a18d2eb3 Merge branch 'clk-meson-gxbb' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (29b4817d4018 Linux 4.8-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (67c52cac0c24 coresight: etm4x: adding configurable start/stop filtering)
Merging rtc/rtc-next (34c7b3ac4ccb rtc: constify rtc_class_ops structures)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d8d378fa1a0c tools/testing/nvdimm: fix SIGTERM vs hotplug crash)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (c9e6ea80baf2 ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Applying: kdump, vmcoreinfo: report memory sections virtual addresses
Applying: mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping
Applying: scripts/tags.sh: enable code completion in VIM
Merging akpm/master (f94dd2b6ac4f scripts/tags.sh: enable code completion in VIM)
Applying: disable KEXEC_FILE on powerpc for now
