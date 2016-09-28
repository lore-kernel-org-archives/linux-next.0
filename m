From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 28
Date: Wed, 28 Sep 2016 16:56:18 +1000
Message-ID: <20160928165618.56208c39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52955 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751003AbcI1G4X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 02:56:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160927:

The rdma tree still had its build failure so I disabled the staging
driver affected.

The drm tree gained a conflict agains Linus' tree.

The drm-misc tree gained conflicts against the drm tree.

The staging tree gained cnflicts against the vfs-miklos tree.

Non-merge commits (relative to Linus' tree): 12771
 9543 files changed, 529888 insertions(+), 289312 deletions(-)

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

I am currently merging 243 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (08895a8b6b06 Linux 4.8-rc8)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (3eab887a5542 Linux 4.8-rc4)
Merging arm-current/fixes (1a57c286d8ce ARM: pxa/lubbock: add pcmcia clock)
Merging m68k-current/for-linus (6bd80f372371 m68k/defconfig: Update defconfigs for v4.7-rc2)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (b79331a5eb9f powerpc/powernv/pci: Fix m64 checks for SR-IOV and window alignment)
Merging sparc/master (4620a06e4b3c shmem: Fix link error if huge pages support is disabled)
Merging net/master (7b8147aae741 Merge branch 'act_ife-fixes')
Merging ipsec/master (b1f2beb87bb0 Merge tag 'media/v4.8-7' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging netfilter/master (440f895aa97f drivers: net: phy: xgene: Fix 'remove' function)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (db64c5fa590b Merge tag 'iwlwifi-for-kalle-2016-09-15' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (7ac327318e09 Merge tag 'mac80211-for-davem-2016-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging sound-current/for-linus (0eec880966e7 ALSA: hda - Add the top speaker pin config for HP Spectre x360)
Merging pci-current/for-linus (035ee288ae7a PCI: Fix bridge_d3 update on device removal)
Merging driver-core.current/driver-core-linus (c6935931c189 Linux 4.8-rc5)
Merging tty.current/tty-linus (c6935931c189 Linux 4.8-rc5)
Merging usb.current/usb-linus (3be7988674ab Linux 4.8-rc7)
Merging usb-gadget-fixes/fixes (d8a4100ddc75 usb: gadget: udc: atmel: fix endpoint name)
Merging usb-serial-fixes/usb-linus (f190fd92458d USB: serial: simple: add support for another Infineon flashloader)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f3c4fb6d05e usb: chipidea: udc: fix NULL ptr dereference in isr_setup_status_phase)
Merging staging.current/staging-linus (9395452b4aab Linux 4.8-rc6)
Merging char-misc.current/char-misc-linus (c6935931c189 Linux 4.8-rc5)
Merging input-current/for-linus (9fb6de1b0bf4 Input: joydev - recognize devices with Z axis as joysticks)
Merging crypto-current/master (0cf43f509f72 crypto: rsa-pkcs1pad - Handle leading zero for decryption)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (08895a8b6b06 Linux 4.8-rc8)
Merging kbuild/for-next (f29ca38b6dd4 ppc: there is no clear_pages to export)
CONFLICT (content): Merge conflict in arch/Kconfig
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
Merging arc/for-next (bdb783677531 ARC: CONFIG_NODES_SHIFT fix default values)
Merging arm/for-next (cebdc42a4a9d Merge branch 'sa1111' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (d54dae3d6ebd Merge branch 'next/dt' into for-next)
Merging pinctrl/for-next (8d0a0ac0abcd Merge branch 'fixes' into devel)
Merging amlogic/for-next (8148ca0d95ec Merge branch 'v4.8/dt64-2' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (9336be5db24d Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (d433580f3b4e Merge branches 'berlin64/dt' and 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (70da51e698c7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (a9c51ff3121f Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (624018387bcf Merge branch 'omap-for-v4.9/dt-v2' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (4feeec0c6e6d Merge tag 'qcom-arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (a64ca8158b21 Merge branches 'fixes-for-v4.8', 'arm64-defconfig-for-v4.9', 'arm64-dt-for-v4.9', 'defconfig-for-v4.9', 'dt-for-v4.9' and 'soc-for-v4.9' into next)
Merging rockchip/for-next (e80be333a38f Merge branch 'v4.9-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (ea24fc2674ef Merge branch 'next/dt' into for-next)
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (0c2a6cce1776 arm64: Kconfig: select OF/ACPI_NUMA under NUMA config)
CONFLICT (content): Merge conflict in drivers/perf/arm_pmu.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/head.S
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (2dc024e94578 cris: return of class_create should be considered)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (f5e14739ed35 CREDITS: Update fingerprint for Geert Uytterhoeven)
Merging m68knommu/for-next (742859adc721 m68k: let clk_disable() return immediately if clk is NULL)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (5ffdafc8cb09 Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (65f836ae4de0 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (92420bd0d01f parisc: Fix self-detected CPU stall warnings on Mako machines)
Merging powerpc/next (f1a55ce05442 powerpc: Clean up tm_abort duplication in hash_utils_64.c)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/misc_64.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/misc_32.S
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (fdcebf6f18ee s390/config: Enable config options for Docker)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/for_next (9e8511ff7e3f Merge tag 'xtensa-for-next-20160731' of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (819d18cf0d4a Merge branch 'for-next-next-4.9-20160927' into for-next-20160927)
Merging ceph/master (0276dca6c1ec rbd: add force close option)
Merging cifs/for-next (659f6f19d311 SMB3:  Add mount parameter to allow user to override max credits)
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (225c5161b118 ext2: Unmap metadata when zeroing blocks)
Merging ext4/dev (e36767750532 blockgroup_lock.h: simplify definition of NR_BG_LOCKS)
Merging f2fs/dev (33aace659965 f2fs: handle errors during recover_orphan_inodes)
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (8d75c710a416 fuse: don't use fuse_ioctl_copy_user() helper)
Merging gfs2/for-next (332f51d7db13 gfs2: Initialize atime of I_NEW inodes)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (4d2899d73c47 Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging nfsd/nfsd-next (81e6ed5c87c7 nfs: fix false positives in nfs40_walk_client_list())
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (6a45b3628ce4 ovl: Fix info leak in ovl_lookup_temp())
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (17ce1eb0b64e ubifs: Fix xattr generic handler usage)
Merging xfs/for-next (2e405cda91ca Merge branch 'xfs-4.9-log-recovery-fixes' into for-next)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (3baf32898e1c parisc: use %pD)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
CONFLICT (content): Merge conflict in fs/fuse/dir.c
Merging vfs-miklos/next (afdf410d53e0 Merge branch 'pipeops' into next)
Merging pci/next (c4315f4b5ddc Merge branch 'pci/msi' into next)
Merging pstore/for-next/pstore (f88baf68ebe5 ramoops: move spin_lock_init after kmalloc error checking)
Merging hid/for-next (6d6df1778cd5 Merge branch 'for-4.9/alps' into for-next)
Merging i2c/i2c/for-next (7cbca2b38734 Merge branch 'i2c/for-4.9' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (7ce4190c4ca4 hwmon: (nct6775) Add support for multiple virtual temperature sources)
Merging jc_docs/docs-next (17e9217d41e1 Merge branch 'doc/4.9' into docs-next)
Merging v4l-dvb/master (02a628e5c024 Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (7e5d1fd5639f Merge branch 'pnp' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (1876b0a39af2 Merge branches 'release' and 'for-rc' into next)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (e96e0eded133 bnx2x: free the mac filter group list before freeing the cmd)
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/genet/bcmgenet.c
Merging ipsec-next/master (c2f672fc9464 xfrm: state lookup can be lockless)
Merging netfilter-next/master (f20fbc0717f9 Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next)
Applying: netfilter: merge fixup for "nf_tables_netdev: remove redundant ip_hdr assignment"
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (7f00ee2bbc63 brcmfmac: use correct skb freeing helper when deleting flowring)
Merging bluetooth/master (be92e538c272 Merge branch 'bnx2x-fix-page-allocation-failure')
Merging mac80211-next/master (8564e38206de cfg80211: add checks for beacon rate, extend to mesh)
Merging rdma/for-next (5603910b1074 Merge branches 'workqueue', '4.9-ioctl' and '4.9-rkey-v2' into k.o/for-4.9)
Applying: starging/lustre: disable LNET infiniband support
Merging rdma-leon/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging rdma-leon-test/testing/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging mtd/master (f6d7c1b5598b mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl)
Merging l2-mtd/master (f6d7c1b5598b mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl)
Merging nand/nand/next (d44154f969a4 mtd: nand: Provide nand_cleanup() function to free NAND related resources)
Merging crypto/master (5ecf8ef9103c crypto: caam - fix sg dump)
Merging drm/drm-next (9f4ef05bcdcf Merge branch 'drm-next-4.9' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_gem_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/imx-drm-core.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_audio.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_execbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (a04139c4cf28 drm/i915/bxt: Fix HDMI DPLL configuration)
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (bd233af436ba drm/sti: mark symbols static where possible)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_mixer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_hqvdp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/sti/sti_dvo.c
Merging drm-exynos/exynos-drm/for-next (3a87f9383457 drm/exynos: fix pending update handling)
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_drv.c
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (d035f1204017 Merge branches 'sunxi/core-for-4.9', 'sunxi/drm-for-4.9', 'sunxi/dt-for-4.9' and 'sunxi/config64-for-4.9', tags 'sunxi-clk-fixes-for-4.8' and 'sunxi-fixes-for-4.8' into sunxi/for-next)
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (ca4c3b36769f Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (8da08ca03b73 ALSA: usb-line6: use the same declaration as definition in header for MIDI manufacturer ID)
Merging sound-asoc/for-next (54077b8082f9 Merge remote-tracking branches 'asoc/topic/topology', 'asoc/topic/tpa6130a2', 'asoc/topic/ux500', 'asoc/topic/wm8962' and 'asoc/topic/wm8991' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (d095c500fd79 Input: snvs_pwrkey - drop input_free_device call if input_register_device fails)
Merging block/for-next (69a83f9cc81e Merge branch 'for-4.9/block' into for-next)
Merging lightnvm/for-next (b67347d7dc28 lightnvm: propagate device_add() error code)
CONFLICT (content): Merge conflict in drivers/nvme/host/core.c
Merging device-mapper/for-next (7cd326747f46 dm bufio: remove dm_bufio_cond_resched())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (0f75c404503c mmc: dw_mmc: remove the deprecated "supports-highspeed" property)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (099b548c4292 raid6/test/test.c: bug fix: Specify aligned(alignment) attributes to the char arrays)
CONFLICT (content): Merge conflict in include/linux/raid/pq.h
Merging mfd/for-mfd-next (bd982237e0d6 mfd: arizona: Handle probe deferral for reset GPIO)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/for-next (bb1e41ba324f power: reset: st: Remove obsolete platforms from dt doc)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (b2de85634be3 Merge remote-tracking branch 'regulator/topic/tps80031' into regulator-next)
Merging security/next (1306d8e1c09f Merge tag 'tpmdd-next-20160927' of git://git.infradead.org/users/jjs/linux-tpmdd into ra-next)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (9b6a9ecc2d88 selinux: fix error return code in policydb_read())
Merging tpmdd/next (324152502b0e Revert "tpm/tpm_crb: implement tpm crb idle state")
Merging watchdog/master (7dd2ce7c91bd watchdog: st_wdt: Remove support for obsolete platforms)
Merging iommu/next (13a08259187c Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/renesas' and 'arm/smmu' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (c93a97ee0583 vfio-pci: Disable INTx after MSI/X teardown)
Merging trivial/for-next (34df117414d7 fat: fix error message for bogus number of directory entries)
Merging audit/next (fa2bea2f5cca audit: consistently record PIDs with task_tgid_nr())
Merging devicetree/for-next (f94277af03ea of/platform: Initialise dev->fwnode appropriately)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (eef5cb3e2a40 Merge remote-tracking branches 'spi/topic/ti-qspi', 'spi/topic/tools', 'spi/topic/txx9' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (56c1bc3e0562 Merge branch 'x86/apic' into auto-latest)
CONFLICT (content): Merge conflict in include/linux/jump_label.h
CONFLICT (content): Merge conflict in arch/x86/lib/memcpy_64.S
CONFLICT (modify/delete): arch/x86/kernel/x8664_ksyms_64.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/x86/kernel/x8664_ksyms_64.c left in tree.
$ git rm -f arch/x86/kernel/x8664_ksyms_64.c
Applying: cpufreq: merge fix for type of cpufreq_offline changing
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a29d64a45eed EDAC, altera: Add IRQ Flags to disable IRQ while handling)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
CONFLICT (content): Merge conflict in kernel/trace/trace_functions_graph.c
CONFLICT (content): Merge conflict in include/linux/ftrace.h
Merging rcu/rcu/next (52e6bc6d43a4 bug: Avoid Kconfig warning for BUG_ON_DATA_CORRUPTION)
Merging kvm/linux-next (adad0d02a7d3 kvm: svm: fix unsigned compare less than zero comparison)
Merging kvm-arm/next (0099b7701f52 KVM: arm/arm64: vgic: Don't flush/sync without a working vgic)
CONFLICT (content): Merge conflict in arch/arm/include/asm/arch_gicv3.h
Merging kvm-mips/next (397fc7ecb8e1 KVM: MIPS: Drop dubious EntryHi optimisation)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (4f0fbdf22e73 xen/grant-table: Use kmalloc_array() in arch_gnttab_valloc())
Merging percpu/for-next (799bc3c51b2b percpu: eliminate two sparse warnings)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging workqueues/for-next (863b710b664b workqueue: remove keventd_up())
Merging drivers-x86/for-next (28e476d7438e platform/x86: toshiba_bluetooth: Decouple an error checking status code)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (6f3bad967072 leds: triggers: Check return value of kobject_uevent_env())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ipmi/for-next (37090ee7e76e ipmi/bt-bmc: add a dependency on ARCH_ASPEED)
Merging driver-core/driver-core-next (6ee6d1cb391c carl9170: fix debugfs crashes)
Merging tty/tty-next (e98d41370392 devpts: Change the owner of /dev/pts/ptmx to the mounter of /dev/pts)
Merging usb/usb-next (984f3be5910c usb: musb: da8xx: fix error handling message in probe)
Merging usb-gadget/next (e6be244a8321 usb: gadget: uvc: add V4L2 dependency)
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (e74e83724808 usb: chipidea: udc: Use the preferred form for passing a size of a struct)
Merging staging/staging-next (0ae952e3bd1c staging: wlan-ng: fix block comments style errors)
CONFLICT (content): Merge conflict in drivers/staging/octeon/ethernet-mdio.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/file.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging char-misc/char-misc-next (6eb1c9496b81 clk: probe common clock drivers earlier)
Merging extcon/extcon-next (38085c987f52 extcon: Add support for qcom SPMI PMIC USB id detection hardware)
Merging slave-dma/next (34debaa38852 Merge branch 'topic/compile_test' into next)
Merging cgroup/for-next (353b02cb7084 Merge branch 'for-4.8-fixes' into for-next)
Merging scsi/for-next (ce50b74722ef Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (6568bba8c0e3 Merge branch 'for-4.9' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (789ffaecf80b virtio_pci: Limit DMA mask to 44 bits for legacy virtio devices)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (c2da060a2d88 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e3296f19c862 gpio: Added zynq specific check for special pins on bank zero)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-pca953x.c
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mxc.c
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
CONFLICT (modify/delete): arch/arm/mach-omap2/board-rx51-peripherals.c deleted in HEAD and modified in gpio/for-next. Version gpio/for-next of arch/arm/mach-omap2/board-rx51-peripherals.c left in tree.
$ git rm -f arch/arm/mach-omap2/board-rx51-peripherals.c
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (2ed6afdee798 netns: move {inc,dec}_net_namespaces into #ifdef)
CONFLICT (content): Merge conflict in include/linux/sysctl.h
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (b4626a7f4892 CLK: Add Loongson1C clock support)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (a67cd5482f37 tools: move pcmcia crc32hash tool from Documentation)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (6015bb25e7b3 coresight: stm: return error code instead of zero in .packet())
Merging rtc/rtc-next (00f7f90c51df rtc: cmos: avoid unused function warning)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (371a2fbecadd Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (5f50d812363e ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
CONFLICT (content): Merge conflict in include/linux/relay.h
CONFLICT (content): Merge conflict in arch/powerpc/kernel/Makefile
CONFLICT (content): Merge conflict in arch/parisc/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
Applying: powerpc: merge fix for CONFIG_WORD_SIZE -> BITS rename
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: include/linux/mlx5/device.h: kill BUILD_BUG_ON()s
Applying: kdump, vmcoreinfo: report memory sections virtual addresses
Applying: mm: kmemleak: avoid using __va() on addresses that don't have a lowmem mapping
Applying: scripts/tags.sh: enable code completion in VIM
Applying: kthread: add kerneldoc for kthread_create()
Applying: hung_task: allow hung_task_panic when hung_task_warnings is 0
Applying: hung_task-allow-hung_task_panic-when-hung_task_warnings-is-0-fix
Applying: treewide: remove redundant #include <linux/kconfig.h>
Merging akpm/master (0a02a3cd9d95 treewide: remove redundant #include <linux/kconfig.h>)
