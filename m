From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 14
Date: Wed, 14 Dec 2016 15:22:18 +1100
Message-ID: <20161214152218.3a4fda3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753286AbcLNEWW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Dec 2016 23:22:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add any material for v4.11 to your linux-next included
branches until after v4.10-rc1 has been released.

Changes since 20161213:

The vfs-miklos tree gained a conflict against the ubifs tree.

The akpm-current tree gained a conflict against the jc_docs tree.

Non-merge commits (relative to Linus' tree): 4498
 4320 files changed, 189429 insertions(+), 94239 deletions(-)

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
(with KALLSYMS_EXTRA_PASS=1) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 245 trees (counting Linus' and 35 trees of bug
fix patches pending for the current merge release).

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
Merging origin/master (b92e09bb5bf4 Merge branch 'for-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (152b695d7437 builddeb: fix cross-building to arm64 producing host-arch debs)
Merging arc-current/for-curr (7badf6fefca8 ARC: axs10x: really enable ARC PGU)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (dadc4a1bb9f0 powerpc/64: Fix placement of .text to be immediately following .head.text)
Merging sparc/master (8fa3b6f9392b Merge tag 'cris-for-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris)
Merging net/master (3e1ed981b7a9 netlink: revert broken, broken "2-clause nla_ok()")
Merging ipsec/master (bc3913a5378c Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging netfilter/master (a220871be66f virtio-net: correctly enable multiqueue)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (fcd2042e8d36 mwifiex: printk() overflow with 32-byte SSIDs)
Merging mac80211/master (d8da0b5d64d5 mac80211: Ensure enough headroom when forwarding mesh pkt)
Merging sound-current/for-linus (995c6a7fd9b9 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change)
Merging pci-current/for-linus (e42010d8207f PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX))
Merging driver-core.current/driver-core-linus (a25f0944ba9b Linux 4.9-rc5)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (e5517c2a5a49 Linux 4.9-rc7)
Merging usb-gadget-fixes/fixes (05e78c6933d6 usb: gadget: f_fs: fix wrong parenthesis in ffs_func_req_match())
Merging usb-serial-fixes/usb-linus (46490c347df4 USB: serial: option: add dlink dwm-158)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (a25f0944ba9b Linux 4.9-rc5)
Merging char-misc.current/char-misc-linus (a25f0944ba9b Linux 4.9-rc5)
Merging input-current/for-linus (2425f1808123 Input: change KEY_DATA from 0x275 to 0x277)
Merging crypto-current/master (04b46fbdea5e crypto: testmgr - fix overlap in chunked tests again)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (69973b830859 Linux 4.9)
Merging drm-misc-fixes/for-linux-next-fixes (e94bd1736f1f drm: Don't call drm_for_each_crtc with a non-KMS driver)
Merging kbuild/for-next (106834d45bad Merge branch 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (b4871f457978 Merge branch 'syscalls' into for-next)
Merging arm-perf/for-next/perf (f43365ee17f8 selftests: arm64: add test for unaligned/inexact watchpoint handling)
Merging arm-soc/for-next (b15ec88e89d1 arm-soc: document merges)
CONFLICT (content): Merge conflict in drivers/soc/renesas/Makefile
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7796.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7795.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.dtsi
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-rcar-gen2.c
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7794.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7793.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7792.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7791.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7790.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7779.dtsi
Merging amlogic/for-next (b21a5fc2bb8a Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ec09fdf764ee Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (242a001e48b7 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (5cfcfe81e33b Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (4aecea63ed81 Merge branch 'omap-for-v4.10/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (bbf9c90768f9 Merge tag 'qcom-dts-for-4.10-2' into all-for-4.10-part2)
Merging renesas/next (411253aa4a68 Merge branch 'fixes-for-v4.10' into next)
CONFLICT (content): Merge conflict in drivers/soc/renesas/Makefile
Merging rockchip/for-next (7e02e53c6ecf Merge branch 'v4.10-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (4ed7dc2785f8 Merge branch 'next/dt64' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (75037120e62b arm64: Disable PAN on uaccess_enable())
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
Applying: arm64: merge fix for code movement to cpucaps.h
Merging clk/clk-next (2aab7a2055a1 clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate())
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (07c65a665b8d m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (57b47febc193 Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (7c7808ce107d openrisc: prevent VGA console, fix builds)
Merging parisc-hd/for-next (82cbd568bc5a parisc: perf: return -EFAULT on error)
Merging powerpc/next (ff45000fcb56 powerpc/boot: Request no dynamic linker for boot wrapper)
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/asm-prototypes.h
Merging fsl/next (baae856ebdee powerpc/fsl/dts: add FMan node for t1042d4rdb)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (c19805f870c1 s390/cpumf: Use configuration level indication for sampling data)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (03eae3aca94c xtensa: fix screen_info, clean up unused declarations in setup.c)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (986ee488b9fd Merge branch 'for-next-next-4.9-20161125' into for-next-20161125)
Merging ceph/master (dc24de82d61b ceph: properly set issue_seq for cap release)
Merging cifs/for-next (96a988ffeb90 CIFS: Fix a possible double locking of mutex during reconnect)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (5716863e0f82 fsnotify: Fix possible use-after-free in inode iteration on umount)
Merging ext4/dev (a551d7c8deef Merge branch 'fscrypt' into dev)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in fs/dax.c
Merging f2fs/dev (c0ed4405a99e f2fs: fix a missing size change in f2fs_setattr)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c01638f5d919 fuse: fix clearing suid, sgid for chown())
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (2549f307b599 Merge tag 'nfs-rdma-4.10-1' of git://git.linux-nfs.org/projects/anna/nfs-rdma)
Merging nfsd/nfsd-next (3eb15f282846 sunrpc: use DEFINE_SPINLOCK())
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (1fb52aea5039 ovl: fix return value of ovl_fill_super)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (ec9160dacdb0 ubifs: Use fscrypt ioctl() helpers)
Merging xfs/for-next (9807b773dad4 Merge branch 'xfs-4.10-misc-fixes-4' into for-next)
CONFLICT (content): Merge conflict in include/linux/iomap.h
Applying: iomap: fix up for blk_poll and WRITE_ODIRECT change
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (225c4443ef3b Merge branch 'work.autofs' into for-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_reflink.c
CONFLICT (content): Merge conflict in fs/overlayfs/dir.c
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
CONFLICT (modify/delete): fs/logfs/dev_bdev.c deleted in vfs/for-next and modified in HEAD. Version HEAD of fs/logfs/dev_bdev.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/statahead.c
$ git rm -f fs/logfs/dev_bdev.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (a2c55f286b95 Merge branch 'vfs-ovl' into next)
CONFLICT (content): Merge conflict in fs/ubifs/file.c
CONFLICT (content): Merge conflict in fs/read_write.c
Merging pci/next (b08d2e61a6f9 Merge branch 'pci/host-vmd' into next)
Merging pstore/for-next/pstore (fc46d4e453f5 ramoops: add pdata NULL check to ramoops_probe)
Merging hid/for-next (43768c4daf54 Merge branches 'for-4.10/upstream' and 'for-4.10/i2c-hid-nopower' into for-next)
Merging i2c/i2c/for-next (8641b29652af Merge branch 'i2c/for-4.10' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (27ec191a79ca firmware: dmi_scan: Always show system identification string)
Merging hwmon-staging/hwmon-next (4fccd4a1e894 hwmon: (g762) Fix overflows and crash seen when writing limit attributes)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
Merging jc_docs/docs-next (63d0977c0e85 lib/Kconfig.debug: correct documentation paths)
Merging v4l-dvb/master (bf0396ea4727 Merge branch 'patchwork' into to_next)
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg left in tree.
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg left in tree.
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg left in tree.
$ git rm -f Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg
Merging pm/linux-next (fb4ad1d7e562 Merge branches 'powercap' and 'pm-sleep' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (0faf7dd5a947 MAINTAINERS: Samsung: Update maintainer for PWM FAN and SAMSUNG THERMAL)
Merging thermal-soc/next (6ee459f5f967 devfreq_cooling: pass a pointer to devfreq in the power model callbacks)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (d29fa0cb7602 swiotlb: Minor fix-ups for DMA_ATTR_SKIP_CPU_SYNC support)
Merging net-next/master (8fa3b6f9392b Merge tag 'cris-for-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris)
Merging ipsec-next/master (d4aea20d889e tun: Use netif_receive_skb instead of netif_rx)
Merging netfilter-next/master (8fa3b6f9392b Merge tag 'cris-for-4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (d15697de60db adm80211: add checks for dma mapping errors)
Merging bluetooth/master (107bc0aa95ca Merge branch 'for-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next)
Merging mac80211-next/master (445cd452fe51 mac80211: Use appropriate name for functions and messages)
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (92363f1cfe75 Merge remote-tracking branch 'origin/topic/shared-for-4.10' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging nand/nand/next (8fcfba072420 mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd)
Merging crypto/master (04b46fbdea5e crypto: testmgr - fix overlap in chunked tests again)
Merging drm/drm-next (2cf026ae85c4 Merge branch 'linux-4.10' of git://github.com/skeggsb/linux into drm-next)
Merging drm-panel/drm/panel/for-next (8c31f6034b24 drm/panel: simple: Add support for AUO G185HAN01)
Merging drm-intel/for-linux-next (7a9e10253e9e drm/i915: Move priority bumping for flips earlier)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (6449b088dd51 drm: Add fake controlD* symlinks for backwards compat)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (63e8e44adfdc Merge branch 'sunxi/dt-late-for-4.10' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-h3.dtsi
Merging kspp/for-next/kspp (68fdc678df46 MAINTAINERS: add GCC plugins Makefile)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (5c55e10a1934 Merge remote-tracking branch 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (995c6a7fd9b9 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change)
Merging sound-asoc/for-next (a5de5b74a501 Merge remote-tracking branches 'asoc/topic/wm9712', 'asoc/topic/wm9713' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (4d217a5adccf module: fix DEBUG_SET_MODULE_RONX typo)
Merging input/next (34888602eb99 Input: drv260x - use generic device properties)
Merging block/for-next (348c1dced6b1 Merge branch 'for-4.10/block' into for-next)
Merging lightnvm/for-next (a5f78b7f7dd1 Merge branch 'for-4.10/block' into for-next)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (f397c8d80a5e mmc: block: Move files to core)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (2953079c692d md: separate flags for superblock changes)
CONFLICT (content): Merge conflict in drivers/md/raid5-cache.c
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging mfd/for-mfd-next (93559191e71b mfd: tps65217: Support an interrupt pin as the system wakeup)
CONFLICT (content): Merge conflict in drivers/mfd/wm8994-core.c
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (6480af4915d6 power_supply: wm97xx_battery: use power_supply_get_drvdata)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (d00b74613fb1 Merge remote-tracking branches 'regulator/topic/tps65086' and 'regulator/topic/twl' into regulator-next)
Merging security/next (50523a29d900 Yama: allow access for the current ptrace parent)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (4a49d45dd589 selinux: allow context mounts on tmpfs, ramfs, devpts within user namespaces)
Merging tpmdd/next (9430066a15d6 tpm: adjust return value of tpm_read_log)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (1465f481460c Merge branches 'arm/mediatek', 'arm/smmu', 'x86/amd', 's390', 'core' and 'arm/exynos' into next)
CONFLICT (content): Merge conflict in drivers/base/power/main.c
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (ea4b640c39d8 NTB: correct ntb_spad_count comment typo)
CONFLICT (content): Merge conflict in Documentation/admin-guide/reporting-bugs.rst
Merging audit/next (5b52b1d37a6f netns: avoid disabling irq for netns id)
CONFLICT (content): Merge conflict in net/core/net_namespace.c
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (61eb3a04f978 dt: pwm: bcm2835: fix typo in clocks property name)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging mailbox/mailbox-for-next (16ae16c6e561 Merge tag 'mmc-v4.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc)
Merging spi/for-next (62fadc72674e Merge remote-tracking branches 'spi/topic/spidev', 'spi/topic/sunxi', 'spi/topic/ti-qspi', 'spi/topic/topcliff-pch' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (6667e83fdc5d Merge branch 'x86/timers')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (a2e4c787f75b EDAC: Document HW_EVENT_ERR_DEFERRED type)
Merging edac-amd/for-next (0de2788447b6 EDAC, amd64: Fix improper return value)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (3dbb16b87b57 selftests: ftrace: Shift down default message verbosity)
Merging rcu/rcu/next (6190aaafd06c Merge branches 'doc.2016.11.14a', 'fixes.2016.11.14a', 'list.2016.10.31a' and 'torture.2016.11.14a' into HEAD)
Merging kvm/linux-next (36da91bdf568 KVM: x86: Handle the kthread worker using the new API)
CONFLICT (content): Merge conflict in arch/x86/kvm/cpuid.c
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (e1788bb995be KVM: s390: handle floating point registers in the run ioctl not in vcpu_put/load)
Merging xen-tip/linux-next (709613ad2b3c xen/balloon: Only mark a page as managed when it is released)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (1d161d4cd719 platform/x86: dell-laptop: Use brightness_set_blocking for kbd_led_level_set)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (44b3e31d540e leds: pca955x: Add ACPI support)
Merging ipmi/for-next (070cbd1d42aa ipmi: create hardware-independent softdep for ipmi_devintf)
Merging driver-core/driver-core-next (5d47ec02c37e firmware: Correct handling of fw_state_wait() return value)
Merging tty/tty-next (a9b01b5823f7 serial: 8250_mid fix calltrace when hotplug 8250 serial controller)
Merging usb/usb-next (d8a12b7117b4 USB: serial: option: add dlink dwm-158)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (3c3dd1e058cb USB: serial: kl5kusb105: abort on open exception path)
Merging usb-chipidea-next/ci-for-usb-next (223e92311583 usb: chipdata: Replace the extcon API)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (3e0f9b2ca8e4 staging: comedi: comedidev.h: Document usage of 'detach' handler)
Merging char-misc/char-misc-next (190cc65e912d uio-hv-generic: store physical addresses instead of virtual)
Merging extcon/extcon-next (669ae5dabe7a extcon: palmas: Check the parent instance to prevent the NULL)
Merging slave-dma/next (6fa8619369e3 Merge branch 'for-linus' into next)
Merging cgroup/for-next (89bb3eed858e cgroup: cgroup_sk_alloc() is allowed to increase reference on a dead cgroup)
Merging scsi/for-next (02cf5abb4d9e Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (ae2aae242198 scsi: aacraid: remove wildcard for series 9 controllers)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (7ddf6a387c68 Merge branch 'for-4.10' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging rpmsg/for-next (d85a9aa0a775 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (acf1fcf77247 Merge branch 'thread-irq-simpler' into devel)
Merging pinctrl/for-next (f82144450874 pinctrl: sx150x: use new nested IRQ infrastructure)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (fdd3ff4db177 Merge branch 'for-4.10/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (19339c251607 Revert "evm: Translate user/group ids relative to s_user_ns when computing HMAC")
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (22f6592b23ef selftest/gpio: add gpio test case)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (59024954a1e7 Documentation/livepatch: Fix stale link to gmame)
Merging coresight/next (e615a9a8e481 coresight: perf: Add a missing call to etm_free_aux)
Merging rtc/rtc-next (05d226088a6b rtc: mcp795: Fix whitespace and indentation.)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (abca2d5b305b Merge branch 'for-4.10/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (31201b24f555 ipc/shm.c: coding style fixes)
CONFLICT (content): Merge conflict in lib/Kconfig.debug
$ git checkout -b akpm remotes/origin/akpm/master
Applying: posix-timers: give lazy compilers some help optimizing code away
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: radix tree test suite: fix compilation
Applying: ktest.pl: fix english
Applying: kernel/watchdog.c: move shared definitions to nmi.h
Applying: kernel/watchdog.c: move hardlockup detector to separate file
Applying: sparc: implement watchdog_nmi_enable and watchdog_nmi_disable
Applying: ipc/sem: do not call wake_sem_queue_do() prematurely
Applying: ipc/sem: rework task wakeups
Applying: ipc/sem: merge fix for WAKE_Q to DEFINE_WAKE_Q rename
Applying: ipc-sem-rework-task-wakeups-checkpatch-fixes
Applying: ipc/sem: optimize perform_atomic_semop()
Applying: ipc/sem: ensure we left shift a ULL rather than a 32 bit integer
Applying: ipc-sem-optimize-perform_atomic_semop-checkpatch-fixes
Applying: ipc/sem: explicitly inline check_restart
Applying: ipc/sem: use proper list api for pending_list wakeups
Applying: ipc/sem: simplify wait-wake loop
Applying: ipc-sem-simplify-wait-wake-loop-checkpatch-fixes
Applying: ipc/sem: avoid idr tree lookup for interrupted semop
Applying: mm: add locked parameter to get_user_pages_remote()
Applying: vfio iommu type1: merge fix for get_user_pages_remote API change
Applying: mm: unexport __get_user_pages_unlocked()
Applying: mm-unexport-__get_user_pages_unlocked-checkpatch-fixes
Applying: mm: join struct fault_env and vm_fault
Applying: mm: use vmf->address instead of of vmf->virtual_address
Applying: mm: use pgoff in struct vm_fault instead of passing it separately
Applying: mm: use passed vm_fault structure in __do_fault()
Applying: mm: trim __do_fault() arguments
Applying: mm: use passed vm_fault structure for in wp_pfn_shared()
Applying: mm: add orig_pte field into vm_fault
Applying: mm: allow full handling of COW faults in ->fault handlers
Applying: mm: factor out functionality to finish page faults
Applying: mm: move handling of COW faults into DAX code
Applying: mm: factor out common parts of write fault handling
Applying: mm: pass vm_fault structure into do_page_mkwrite()
Applying: mm: use vmf->page during WP faults
Applying: mm: move part of wp_page_reuse() into the single call site
Applying: mm: provide helper for finishing mkwrite faults
Applying: mm: change return values of finish_mkwrite_fault()
Applying: mm: export follow_pte()
Applying: dax: make cache flushing protected by entry lock
Applying: dax: protect PTE modification on WP fault by radix tree entry lock
Applying: dax: clear dirty entry tags on cache flush
Applying: powerpc: ima: get the kexec buffer passed by the previous kernel
Applying: ima: on soft reboot, restore the measurement list
Applying: ima: permit duplicate measurement list entries
Applying: ima: maintain memory size needed for serializing the measurement list
Applying: powerpc: ima: send the kexec buffer to the next kernel
Applying: ima: on soft reboot, save the measurement list
Applying: ima: store the builtin/custom template definitions in a list
Applying: ima: support restoring multiple template formats
Applying: ima: define a canonical binary_runtime_measurements list format
Applying: ima: platform-independent hash value
Applying: tools: add WARN_ON_ONCE
Applying: radix tree test suite: allow GFP_ATOMIC allocations to fail
Applying: radix tree test suite: track preempt_count
Applying: radix tree test suite: free preallocated nodes
Applying: radix tree test suite: make runs more reproducible
Applying: radix tree test suite: iteration test misuses RCU
Applying: radix tree test suite: benchmark for iterator
Applying: radix tree test suite: use rcu_barrier
Applying: radix tree test suite: handle exceptional entries
Applying: radix tree test suite: record order in each item
Applying: tools: add more bitmap functions
Applying: radix tree test suite: use common find-bit code
Applying: radix-tree: fix typo
Applying: radix-tree: move rcu_head into a union with private_list
Applying: radix-tree: create node_tag_set()
Applying: radix-tree: make radix_tree_find_next_bit more useful
Applying: radix-tree: improve dump output
Applying: btrfs: fix race in btrfs_free_dummy_fs_info()
Applying: radix-tree: improve multiorder iterators
Applying: radix-tree: delete radix_tree_locate_item()
Applying: radix-tree: delete radix_tree_range_tag_if_tagged()
Applying: radix-tree: add radix_tree_join
Applying: radix-tree: add radix_tree_split
Applying: radix-tree: add radix_tree_split_preload()
Applying: radix-tree: fix replacement for multiorder entries
Applying: radix tree test suite: check multiorder iteration
Applying: idr: add ida_is_empty
Applying: tpm: use idr_find(), not idr_find_slowpath()
Applying: rxrpc: abstract away knowledge of IDR internals
Applying: idr: reduce the number of bits per level from 8 to 6
Applying: radix tree test suite: add some more functionality
Applying: reimplement IDR and IDA using the radix tree
Merging akpm/master (79e00abc68d9 reimplement IDR and IDA using the radix tree)
