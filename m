From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 4
Date: Tue, 4 Oct 2016 14:56:49 +1100
Message-ID: <20161004145649.093c379f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47237 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751032AbcJDD4z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Oct 2016 23:56:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

There will be no linux-next release on Friday.

Changes since 20161003:

Non-merge commits (relative to Linus' tree): 12964
 9515 files changed, 516789 insertions(+), 294462 deletions(-)

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
Merging origin/master (af79ad2b1f33 Merge branch 'sched-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/master (d3396e1e4ec4 Merge tag 'fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (3eab887a5542 Linux 4.8-rc4)
Merging arm-current/fixes (117e5e9c4cfc ARM: 8618/1: decompressor: reset ttbcr fields to use TTBR0 on ARMv7)
Merging m68k-current/for-linus (6736e65effc3 m68k: Migrate exception table users off module.h and onto extable.h)
Merging metag-fixes/fixes (97b1d23f7bcb metag: Drop show_mem() from mem_init())
Merging powerpc-fixes/fixes (b79331a5eb9f powerpc/powernv/pci: Fix m64 checks for SR-IOV and window alignment)
Merging sparc/master (c8d2bc9bc39e Linux 4.8)
Merging net/master (c8d2bc9bc39e Linux 4.8)
Merging ipsec/master (b1f2beb87bb0 Merge tag 'media/v4.8-7' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging netfilter/master (440f895aa97f drivers: net: phy: xgene: Fix 'remove' function)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (db64c5fa590b Merge tag 'iwlwifi-for-kalle-2016-09-15' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (7ac327318e09 Merge tag 'mac80211-for-davem-2016-09-16' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging sound-current/for-linus (eeea8b40cd28 Merge tag 'asoc-v4.9' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
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
Merging crypto-current/master (80da44c29d99 crypto: vmx - Fix memory corruption caused by p8_ghash)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (08895a8b6b06 Linux 4.8-rc8)
Merging kbuild/for-next (b12a295d66bb Merge branch 'kbuild/misc' into kbuild/for-next)
CONFLICT (content): Merge conflict in arch/x86/lib/memcpy_64.S
CONFLICT (modify/delete): arch/x86/kernel/x8664_ksyms_64.c deleted in kbuild/for-next and modified in HEAD. Version HEAD of arch/x86/kernel/x8664_ksyms_64.c left in tree.
CONFLICT (content): Merge conflict in arch/Kconfig
$ git rm -f arch/x86/kernel/x8664_ksyms_64.c
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
Merging arc/for-next (ef25bacbb019 ARC: [plat*] enables MODULE*)
Merging arm/for-next (70fe0fd28524 Merge branch 'fixes' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (bcaf9dcf55fd ARM: SoC: Document merges)
Merging pinctrl/for-next (8d0a0ac0abcd Merge branch 'fixes' into devel)
Merging amlogic/for-next (8148ca0d95ec Merge branch 'v4.8/dt64-2' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (9336be5db24d Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
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
Merging arm64/for-next/core (db68f3e7594a arm64: tlbflush.h: add __tlbi() macro)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (2dc024e94578 cris: return of class_create should be considered)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6736e65effc3 m68k: Migrate exception table users off module.h and onto extable.h)
Merging m68knommu/for-next (742859adc721 m68k: let clk_disable() return immediately if clk is NULL)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (2b7731edf0ee Merge branch '4.8-fixes' into mips-for-linux-next)
Merging nios2/for-next (65f836ae4de0 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (92420bd0d01f parisc: Fix self-detected CPU stall warnings on Mako machines)
Merging powerpc/next (5045ea37377c powerpc/vdso64: Use double word compare on pointers)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/misc_64.S
CONFLICT (content): Merge conflict in arch/powerpc/kernel/misc_32.S
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (6cd997db911f s390/con3270: fix insufficient space padding)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (a4c6be5ad1d0 xtensa: disable MMU initialization option on MMUv2 cores)
CONFLICT (content): Merge conflict in arch/xtensa/kernel/setup.c
Merging befs/for-next (58d08821eaa7 befs: befs: fix style issues in datastream.c)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (819d18cf0d4a Merge branch 'for-next-next-4.9-20160927' into for-next-20160927)
Merging ceph/master (464691bd52b4 libceph: ceph_build_auth() doesn't need ceph_auth_build_hello())
Merging cifs/for-next (edb0cfa3e6ae [CIFS] Expose cifs module parameters in sysfs)
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (2bdcdbea80bd ecryptfs: don't allow mmap when the lower fs doesn't support it)
Merging ext3/for_next (225c5161b118 ext2: Unmap metadata when zeroing blocks)
Merging ext4/dev (752f253563a3 ext4: remove unused variable)
Merging f2fs/dev (e4c5d8489a41 f2fs: introduce update_ckpt_flags to clean up)
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (63401ccdb2ca fuse: limit xattr returned size)
Merging gfs2/for-next (332f51d7db13 gfs2: Initialize atime of I_NEW inodes)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (4d2899d73c47 Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging nfsd/nfsd-next (81e6ed5c87c7 nfs: fix false positives in nfs40_walk_client_list())
Merging orangefs/for-next (a21aae3bb15a Merge tag 'for-hubcap-v4.9-readahead' of git://github.com/martinbrandenburg/linux)
Merging overlayfs/overlayfs-next (019d6c3d1269 ovl: make directory ino/dev numbers stable)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (17ce1eb0b64e ubifs: Fix xattr generic handler usage)
Merging xfs/for-next (155cd433b516 Merge branch 'xfs-4.9-log-recovery-fixes' into for-next)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (6731cb0ff068 Merge vfs-jk into for-next)
CONFLICT (content): Merge conflict in fs/fuse/dir.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (afdf410d53e0 Merge branch 'pipeops' into next)
Merging pci/next (1da64c77b71f Merge branches 'pci/host-aardvark', 'pci/host-altera', 'pci/host-artpec', 'pci/host-designware', 'pci/host-hv', 'pci/host-keystone', 'pci/host-rcar', 'pci/host-rockchip', 'pci/host-tegra', 'pci/host-vmd' and 'pci/host-xilinx' into next)
Merging pstore/for-next/pstore (f88baf68ebe5 ramoops: move spin_lock_init after kmalloc error checking)
Merging hid/for-next (419c103f0833 Merge branch 'for-4.9/upstream' into for-next)
Merging i2c/i2c/for-next (7cbca2b38734 Merge branch 'i2c/for-4.9' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0deb6b2c087a dmi-id: don't free dev structure after calling device_register)
Merging hwmon-staging/hwmon-next (7ce4190c4ca4 hwmon: (nct6775) Add support for multiple virtual temperature sources)
Merging jc_docs/docs-next (02e69d5b97f0 Merge branch 'doc/4.9' into docs-next)
Merging v4l-dvb/master (02a628e5c024 Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (c55f070e3d33 Merge branch 'acpi' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (43720df96023 thermal: int3403: Process trip change notification)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval with timespec64)
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (f814bfd76521 net: mvmdio: do not clk_disable_unprepare() NULL clock)
Applying: netfilter: merge fixup for "nf_tables_netdev: remove redundant ip_hdr assignment"
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (1f827f513829 netfilter: xt_hashlimit: Fix link error in 32bit arch because of 64bit division)
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (15b95a159502 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (1514d858b946 Bluetooth: btusb: add entry for Marvell 8997 chipset)
Merging mac80211-next/master (bb42f2d13ffc mac80211: Move reorder-sensitive TX handlers to after TXQ dequeue)
CONFLICT (content): Merge conflict in net/mac80211/tx.c
CONFLICT (content): Merge conflict in net/mac80211/sta_info.c
Merging rdma/for-next (61347fa60878 IB/rdmavt: Trivial function comment corrected.)
Applying: starging/lustre: disable LNET infiniband support
Merging rdma-leon/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging rdma-leon-test/testing/rdma-next (c6935931c189 Linux 4.8-rc5)
Merging mtd/master (f6d7c1b5598b mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl)
Merging l2-mtd/master (f5b88de28493 mtd: nand: fix trivial spelling error)
Merging nand/nand/next (d44154f969a4 mtd: nand: Provide nand_cleanup() function to free NAND related resources)
Merging crypto/master (f97581cfa6e7 crypto: caam - treat SGT address pointer as u64)
Merging drm/drm-next (28a396545a2a Merge branch 'drm-next-4.9' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in Documentation/gpu/index.rst
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (348b9b119214 drm/i915: Use correct index for backtracking HUNG semaphores)
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (262f75a62883 drm: Undo damage to page_flip_ioctl)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (d035f1204017 Merge branches 'sunxi/core-for-4.9', 'sunxi/drm-for-4.9', 'sunxi/dt-for-4.9' and 'sunxi/config64-for-4.9', tags 'sunxi-clk-fixes-for-4.8' and 'sunxi-fixes-for-4.8' into sunxi/for-next)
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (ca4c3b36769f Merge remote-tracking branch 'regmap/topic/debugfs' into regmap-next)
Merging sound/for-next (eeea8b40cd28 Merge tag 'asoc-v4.9' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
Merging sound-asoc/for-next (513e43efafe3 Merge remote-tracking branches 'asoc/topic/tpa6130a2', 'asoc/topic/ux500', 'asoc/topic/wm8960', 'asoc/topic/wm8962' and 'asoc/topic/wm8991' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (265d426d7470 Input: elan_i2c - fix return tests of i2c_smbus_read_block_data())
Merging block/for-next (69a83f9cc81e Merge branch 'for-4.9/block' into for-next)
Merging lightnvm/for-next (1a6fe74dfd1b nvme: Pass pointers, not dma addresses, to nvme_get/set_features())
Merging device-mapper/for-next (8ff232c1a819 dm mpath: always return reservation conflict without failing over)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (0f75c404503c mmc: dw_mmc: remove the deprecated "supports-highspeed" property)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (bb086a89a406 md: set rotational bit)
CONFLICT (content): Merge conflict in include/linux/raid/pq.h
Merging mfd/for-mfd-next (bd982237e0d6 mfd: arizona: Handle probe deferral for reset GPIO)
Merging backlight/for-backlight-next (602553073892 backlight: lp855x: Add enable regulator)
Merging battery/for-next (1d72706f0485 power: supply: bq27xxx_battery: allow kernel poll_interval parameter runtime update)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (b2de85634be3 Merge remote-tracking branch 'regulator/topic/tps80031' into regulator-next)
Merging security/next (1306d8e1c09f Merge tag 'tpmdd-next-20160927' of git://git.infradead.org/users/jjs/linux-tpmdd into ra-next)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (1306d8e1c09f Merge tag 'tpmdd-next-20160927' of git://git.infradead.org/users/jjs/linux-tpmdd into ra-next)
Merging tpmdd/next (b6402edc378f tpm: don't destroy chip device prematurely)
Merging watchdog/master (fc113d54e9d7 watchdog: hpwdt: add support for iLO5)
Merging iommu/next (13a08259187c Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/renesas' and 'arm/smmu' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (61771468e0a5 vfio_pci: use pci_alloc_irq_vectors)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (7ff89ac608d9 audit: add exclude filter extension to feature bitmap)
Merging devicetree/for-next (eb67e53541cf of: Add vendor prefix for Engicam s.r.l company)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (66edf4ed8b58 Merge remote-tracking branches 'spi/topic/ti-qspi', 'spi/topic/tools', 'spi/topic/txx9' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (67223e218177 Merge branch 'linus')
CONFLICT (content): Merge conflict in arch/x86/mm/fault.c
Applying: cpufreq: merge fix for type of cpufreq_offline changing
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a29d64a45eed EDAC, altera: Add IRQ Flags to disable IRQ while handling)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
CONFLICT (content): Merge conflict in kernel/trace/trace_functions_graph.c
CONFLICT (content): Merge conflict in include/linux/ftrace.h
Merging rcu/rcu/next (bf9b45a60458 torture: Prevent jitter from delaying build-only runs)
Merging kvm/linux-next (d9ab710b8531 Merge tag 'kvm_mips_4.9_1' of git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/kvm-mips into next)
CONFLICT (content): Merge conflict in arch/arm/include/asm/arch_gicv3.h
Merging kvm-arm/next (0099b7701f52 KVM: arm/arm64: vgic: Don't flush/sync without a working vgic)
Merging kvm-mips/next (bf18db4e7bd9 KVM: MIPS: Drop dubious EntryHi optimisation)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (b057878b2aad xen/pciback: support driver_override)
CONFLICT (content): Merge conflict in include/linux/cpuhotplug.h
Merging percpu/for-next (799bc3c51b2b percpu: eliminate two sparse warnings)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging workqueues/for-next (863b710b664b workqueue: remove keventd_up())
Merging drivers-x86/for-next (b5643539b825 platform/x86: asus-wmi: Filter buggy scan codes on ASUS Q500A)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (6f3bad967072 leds: triggers: Check return value of kobject_uevent_env())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ipmi/for-next (bd85f4b37ddf ipmi: fix crash on reading version from proc after unregisted bmc)
Merging driver-core/driver-core-next (dd01c75f1df3 drivers: dma-coherent: Move spinlock in dma_alloc_from_coherent())
Merging tty/tty-next (08bf21590041 Revert "serial: pl011: add console matching function")
CONFLICT (content): Merge conflict in include/linux/acpi.h
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging usb/usb-next (ab21b63e8aed Revert "usbtmc: convert to devm_kzalloc")
Merging usb-gadget/next (e6be244a8321 usb: gadget: uvc: add V4L2 dependency)
Merging usb-serial/usb-next (61fc51366b39 USB: serial: ti_usb_3410_5052: remove unused variables)
Merging usb-chipidea-next/ci-for-usb-next (e74e83724808 usb: chipidea: udc: Use the preferred form for passing a size of a struct)
Merging staging/staging-next (fc1e2c8ea85e Staging: fbtft: Fix bug in fbtft-core)
CONFLICT (content): Merge conflict in drivers/staging/octeon/ethernet-mdio.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/file.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging char-misc/char-misc-next (c9fef1cc3dd3 drivers/misc/hpilo: Changes to support new security states in iLO5 FW)
Merging extcon/extcon-next (38085c987f52 extcon: Add support for qcom SPMI PMIC USB id detection hardware)
Merging slave-dma/next (fea1ba61efc5 Merge tag 'tty-for-dma' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (ce50b74722ef Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (df073d9e6a7d Merge branch 'for-4.9' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (789ffaecf80b virtio_pci: Limit DMA mask to 44 bits for legacy virtio devices)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (2fdd6c32d6a5 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (c23b1a26cbc3 gpio: stmpe: use BIT() macro)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-pca953x.c
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mxc.c
CONFLICT (content): Merge conflict in arch/arm64/Kconfig.platforms
CONFLICT (modify/delete): arch/arm/mach-omap2/board-rx51-peripherals.c deleted in HEAD and modified in gpio/for-next. Version gpio/for-next of arch/arm/mach-omap2/board-rx51-peripherals.c left in tree.
$ git rm -f arch/arm/mach-omap2/board-rx51-peripherals.c
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (d29216842a85 mnt: Add a per mount namespace limit on the number of mounts)
CONFLICT (content): Merge conflict in include/linux/sysctl.h
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (b4626a7f4892 CLK: Add Loongson1C clock support)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (94c630ee73a4 Doc: update 00-INDEX files to reflect the runnable code move)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (45808987495f coresight: stm: return error code instead of zero in .packet())
Merging rtc/rtc-next (00f7f90c51df rtc: cmos: avoid unused function warning)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (371a2fbecadd Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (dadfbe61b4d5 ipc-msg-avoid-waking-sender-upon-full-queue-checkpatch-fixes)
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
Applying: fs: use mapping_set_error instead of opencoded set_bit
Applying: fs-use-mapping_set_error-instead-of-opencoded-set_bit-fix
Applying: mm: split gfp_mask and mapping flags into separate fields
Merging akpm/master (0dbdf6f7e35d mm: split gfp_mask and mapping flags into separate fields)
