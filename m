From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 7
Date: Wed, 7 Dec 2016 17:24:32 +1100
Message-ID: <20161207172432.184970d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751068AbcLGGZO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Dec 2016 01:25:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20161206:

The powerpc allyesconfig build fails for this release.

The pinctrl tree still had its build failure so I used the version from
next-20161202.

The sound-asoc tree lost its build failure.

The tip tree gained a perf build failure that went away when the build
was repeated.

The staging tree gained a conflict against the net-next tree.

Non-merge commits (relative to Linus' tree): 10030
 9322 files changed, 645214 insertions(+), 217700 deletions(-)

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
Merging origin/master (bc3913a5378c Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (152b695d7437 builddeb: fix cross-building to arm64 producing host-arch debs)
Merging arc-current/for-curr (7badf6fefca8 ARC: axs10x: really enable ARC PGU)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (dadc4a1bb9f0 powerpc/64: Fix placement of .text to be immediately following .head.text)
Merging sparc/master (163117e8d4fd dbri: move dereference after check for NULL)
Merging net/master (32f16e142d7a Merge branch 'mlx5-fixes')
Merging ipsec/master (a55e23864d38 esp6: Fix integrity verification when ESN are used)
Merging netfilter/master (7bbf91ce27dd Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec)
Merging ipvs/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging wireless-drivers/master (fcd2042e8d36 mwifiex: printk() overflow with 32-byte SSIDs)
Merging mac80211/master (9590112241ba tipc: fix link statistics counter errors)
Merging sound-current/for-linus (f73cd43ac3b4 ALSA: hda - Gate the mic jack on HP Z1 Gen3 AiO)
Merging pci-current/for-linus (e42010d8207f PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX))
Merging driver-core.current/driver-core-linus (a25f0944ba9b Linux 4.9-rc5)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (e5517c2a5a49 Linux 4.9-rc7)
Merging usb-gadget-fixes/fixes (05e78c6933d6 usb: gadget: f_fs: fix wrong parenthesis in ffs_func_req_match())
Merging usb-serial-fixes/usb-linus (7c5b89020900 USB: serial: option: add support for Telit LE922A PIDs 0x1040, 0x1041)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (a25f0944ba9b Linux 4.9-rc5)
Merging char-misc.current/char-misc-linus (a25f0944ba9b Linux 4.9-rc5)
Merging input-current/for-linus (2425f1808123 Input: change KEY_DATA from 0x275 to 0x277)
Merging crypto-current/master (57891633eeef crypto: rsa - Add Makefile dependencies to fix parallel builds)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (3e5de27e940d Linux 4.9-rc8)
Merging drm-misc-fixes/for-linux-next-fixes (e94bd1736f1f drm: Don't call drm_for_each_crtc with a non-KMS driver)
Merging kbuild/for-next (8549430410ed Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (b4871f457978 Merge branch 'syscalls' into for-next)
Merging arm-perf/for-next/perf (f43365ee17f8 selftests: arm64: add test for unaligned/inexact watchpoint handling)
Merging pinctrl/for-next (3a037cf0767f pinctrl: sx150x: handle missing 'advanced' reg in sx1504 and sx1505)
$ git reset --hard HEAD^
Merging next-20161202 version of pinctrl
Merging arm-soc/for-next (bc82521fd067 arm-soc: document merges)
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
Merging renesas/next (ba049962976b Merge branch 'soc-match-for-v4.10' into next)
Merging rockchip/for-next (7e02e53c6ecf Merge branch 'v4.10-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (2d2a2b87438b Merge branch 'next/soc' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (cd9e1927a525 arm64: Work around broken .inst when defective gas is detected)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
Applying: arm64: merge fix for code movement to cpucaps.h
Merging clk/clk-next (6bbabe5fc53f Merge tag 'v4.10-rockchip-clk2' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-next)
CONFLICT (content): Merge conflict in drivers/soc/renesas/Makefile
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7796.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/renesas/r8a7795.dtsi
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-rcar-gen2.c
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7794.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7793.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7792.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7791.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7790.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7779.dtsi
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (c78874f116be tty: serial: make crisv10 explicitly non-modular)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (73367dc57468 m68k/defconfig: Update defconfigs for v4.9-rc1)
Merging m68knommu/for-next (07c65a665b8d m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (ecf41b56e967 Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging openrisc/for-next (56cb5749b239 openrisc: prevent VGA console, fix builds)
Merging parisc-hd/for-next (033b41e56bf2 parisc: Try to fix TLB problems)
Merging powerpc/next (ff45000fcb56 powerpc/boot: Request no dynamic linker for boot wrapper)
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/asm-prototypes.h
Merging fsl/next (d7544424169e soc/fsl/bman: Use resource_size instead of computation)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (db7ad63624b3 s390/setup: fix memblock usage)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (03eae3aca94c xtensa: fix screen_info, clean up unused declarations in setup.c)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (986ee488b9fd Merge branch 'for-next-next-4.9-20161125' into for-next-20161125)
Merging ceph/master (264048afab27 libceph: initialize last_linger_id with a large integer)
Merging cifs/for-next (96a988ffeb90 CIFS: Fix a possible double locking of mutex during reconnect)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (c3b004460d77 quota: Remove dqonoff_mutex)
Merging ext4/dev (d15e27c443d4 ext4: remove another test in ext4_alloc_file_blocks())
Merging f2fs/dev (0002b61bdaac f2fs: return AOP_WRITEPAGE_ACTIVATE for writepage)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c01638f5d919 fuse: fix clearing suid, sgid for chown())
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (1cd9cb05f96e NFS: Only look at the change attribute cache state in nfs_check_verifier)
Merging nfsd/nfsd-next (3eb15f282846 sunrpc: use DEFINE_SPINLOCK())
Merging orangefs/for-next (19ff7fcc76e6 orangefs: add .owner to debugfs file_operations)
Merging overlayfs/overlayfs-next (0e7e8fd1c78d ovl: fix return value of ovl_fill_super)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a00052a296e5 ubifs: Fix regression in ubifs_readdir())
Merging xfs/for-next (5f1c6d28cfcd Merge branch 'iomap-4.10-directio' into for-next)
CONFLICT (content): Merge conflict in include/linux/iomap.h
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (dbe004a1d986 Merge branch 'pci/ecam' into next)
Merging pstore/for-next/pstore (fc46d4e453f5 ramoops: add pdata NULL check to ramoops_probe)
Merging hid/for-next (9700925ff92d Merge branch 'for-4.10/intel-ish' into for-next)
Merging i2c/i2c/for-next (7448c4ee18e5 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (69c18f16560d hwmon: (gl520sm) Fix overflows seen when writing into limit attributes)
Merging jc_docs/docs-next (9e22ff439fa2 Update Documentation/00-INDEX)
Merging v4l-dvb/master (bf0396ea4727 Merge branch 'patchwork' into to_next)
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg left in tree.
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg left in tree.
CONFLICT (modify/delete): Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg deleted in HEAD and modified in v4l-dvb/master. Version v4l-dvb/master of Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg left in tree.
$ git rm -f Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg
Merging pm/linux-next (7c06fdb341e3 Merge branch 'pm-opp' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (9245ac20d829 Merge branches 'thermal-core', 'thermal-intel', 'thermal-soc-fixes' and 'thermal-reorg' into next)
Merging thermal-soc/next (6ee459f5f967 devfreq_cooling: pass a pointer to devfreq in the power model callbacks)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (d29fa0cb7602 swiotlb: Minor fix-ups for DMA_ATTR_SKIP_CPU_SYNC support)
Merging net-next/master (862b3d2090ae net: hns: Fix to conditionally convey RX checksum flag to stack)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/broadcom/ns2.dtsi
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (34d360415a92 netfilter: nf_tables: support for set flushing)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (d15697de60db adm80211: add checks for dma mapping errors)
Merging bluetooth/master (6bf0d84d13e9 docs: ieee802154: update main documentation file)
Merging mac80211-next/master (b1363291202c mac80211: Suppress NEW_PEER_CANDIDATE event if no room)
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (b66df7cc9ee7 Merge branch 'topic/shared-for-4.10' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging nand/nand/next (8fcfba072420 mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd)
Merging crypto/master (5937d81a9613 crypto: algif_aead - fix AIO handling of zero buffer)
Merging drm/drm-next (197aa6ed522c Merge branch 'exynos-drm-next' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next)
Merging drm-panel/drm/panel/for-next (8c31f6034b24 drm/panel: simple: Add support for AUO G185HAN01)
Merging drm-intel/for-linux-next (7a9e10253e9e drm/i915: Move priority bumping for flips earlier)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (db444e1344dd drm/atomic: doc: remove old comment about nonblocking commits)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (63e8e44adfdc Merge branch 'sunxi/dt-late-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (68fdc678df46 MAINTAINERS: add GCC plugins Makefile)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (5c55e10a1934 Merge remote-tracking branch 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (fd1a5059610c ALSA: usb-audio: more tolerant packetsize)
Merging sound-asoc/for-next (c79590c349ce Merge remote-tracking branches 'asoc/topic/wm9712' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (4d217a5adccf module: fix DEBUG_SET_MODULE_RONX typo)
Merging input/next (accbcea3465b Input: imx6ul_tsc - convert int to u32)
Merging block/for-next (621356f1bc77 Merge branch 'for-4.10/block' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
Applying: iomap: fix up for blk_poll and WRITE_ODIRECT change
Merging lightnvm/for-next (a5f78b7f7dd1 Merge branch 'for-4.10/block' into for-next)
Merging device-mapper/for-next (ec07c7101928 dm crypt: reject key strings containing whitespace chars)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (6b11e70bb72c mmc: sdhci: Tidy tuning loop)
CONFLICT (content): Merge conflict in drivers/mmc/card/block.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (e2342ca83272 md: fix refcount problem on mddev when stopping array.)
CONFLICT (content): Merge conflict in drivers/md/raid5-cache.c
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging mfd/for-mfd-next (93559191e71b mfd: tps65217: Support an interrupt pin as the system wakeup)
CONFLICT (content): Merge conflict in drivers/mfd/wm8994-core.c
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (6480af4915d6 power_supply: wm97xx_battery: use power_supply_get_drvdata)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (99b9bc312cb5 Merge remote-tracking branches 'regulator/topic/tps65086' and 'regulator/topic/twl' into regulator-next)
Merging security/next (50523a29d900 Yama: allow access for the current ptrace parent)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (9287aed2ad1f selinux: Convert isec->lock into a spinlock)
Merging tpmdd/next (9430066a15d6 tpm: adjust return value of tpm_read_log)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (1465f481460c Merge branches 'arm/mediatek', 'arm/smmu', 'x86/amd', 's390', 'core' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (5b52b1d37a6f netns: avoid disabling irq for netns id)
CONFLICT (content): Merge conflict in net/core/net_namespace.c
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (3c263bc7b727 add bindings document for altera freeze bridge)
Merging mailbox/mailbox-for-next (16ae16c6e561 Merge tag 'mmc-v4.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc)
Merging spi/for-next (b4c2d5a2a28d Merge remote-tracking branches 'spi/topic/ti-qspi', 'spi/topic/topcliff-pch' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (eef4ed91a34f Merge branch 'locking/core')
CONFLICT (content): Merge conflict in drivers/net/ethernet/amd/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Applying: net: busy-poll: fix up for cpu_relax_lowlatency() removal
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (a2e4c787f75b EDAC: Document HW_EVENT_ERR_DEFERRED type)
Merging edac-amd/for-next (0de2788447b6 EDAC, amd64: Fix improper return value)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (38e11df13429 ring-buffer: Force rb_end_commit() and rb_set_commit_to_write() inline)
Merging rcu/rcu/next (278c19fe5bc7 rcu: Adjust FQS offline checks for exact online-CPU detection)
Merging kvm/linux-next (57d1da871b85 Merge branch 'kvm-ppc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc)
CONFLICT (content): Merge conflict in arch/x86/kvm/cpuid.c
Merging kvm-arm/next (fd5ebf99f814 arm/arm64: KVM: Clean up useless code in kvm_timer_enable)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (e1788bb995be KVM: s390: handle floating point registers in the run ioctl not in vcpu_put/load)
Merging xen-tip/linux-next (b36585a0a3c1 xen/events: use xen_vcpu_id mapping for EVTCHNOP_status)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (401df5ace9d6 intel_pmc_core: Add KBL CPUID support)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (44b3e31d540e leds: pca955x: Add ACPI support)
Merging ipmi/for-next (f0cee6244aa1 ipmi_ssif: create hardware-independent softdep for ipmi_devintf)
Merging driver-core/driver-core-next (64df1148876e driver core: Silence device links sphinx warning)
Merging tty/tty-next (a9b01b5823f7 serial: 8250_mid fix calltrace when hotplug 8250 serial controller)
CONFLICT (modify/delete): Documentation/VGA-softcursor.txt deleted in HEAD and modified in tty/tty-next. Version tty/tty-next of Documentation/VGA-softcursor.txt left in tree.
$ git rm -f Documentation/VGA-softcursor.txt
Merging usb/usb-next (918b8ac55b6c usbip: fix warning in vhci_hcd_probe/lockdep_init_map)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (3c3dd1e058cb USB: serial: kl5kusb105: abort on open exception path)
Merging usb-chipidea-next/ci-for-usb-next (3be3251db088 usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (0af72df267f2 staging: slicoss: remove the staging driver)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (content): Merge conflict in drivers/staging/unisys/include/iochannel.h
CONFLICT (modify/delete): drivers/staging/slicoss/slicoss.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/slicoss/slicoss.c left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
$ git rm -f drivers/staging/slicoss/slicoss.c
Merging char-misc/char-misc-next (2eb72d4b790c Tools: hv: kvp: configurable external scripts path)
CONFLICT (content): Merge conflict in drivers/lightnvm/core.c
Merging extcon/extcon-next (5bb65b24bfcd extcon: return error code on failure)
Merging slave-dma/next (db692574ff2f Merge branch 'for-linus' into next)
Merging cgroup/for-next (7c0dce2f2c43 cpuset: Remove unused 'struct cpuset*' variable)
Merging scsi/for-next (ee8a864ceaf4 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (84a261ff7654 scsi: be2iscsi: set errno on error path)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (1e71615731f8 Merge branch 'for-4.10' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging rpmsg/for-next (442d24006d9e Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e470295a5e5a gpio: merrifield: Implement gpio_get_direction callback)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (fdd3ff4db177 Merge branch 'for-4.10/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (19339c251607 Revert "evm: Translate user/group ids relative to s_user_ns when computing HMAC")
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (499a1d11f265 selftest: sync: stress test for merges)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (e615a9a8e481 coresight: perf: Add a missing call to etm_free_aux)
Merging rtc/rtc-next (1c02cbfec5c7 rtc: twl: make driver DT only)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (4cb19355ea19 device-dax: fail all private mapping attempts)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (144098aacb0b ipc/shm.c: coding style fixes)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in fs/dax.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: posix-timers: give lazy compilers some help optimizing code away
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: drivers/clk/uniphier/clk-uniphier.h: fix build with old gcc
Applying: drivers/clk/uniphier/clk-uniphier-mio.c: fix build for older gcc
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
Applying: vfs: change d_manage() to take a struct path
Applying: vfs: add path_is_mountpoint() helper
Applying: vfs: fix boolreturn.cocci warnings
Applying: vfs: add path_has_submounts()
Applying: autofs: change autofs4_expire_wait() to take struct path
Applying: autofs: change autofs4_wait() to take struct path
Applying: autofs: use path_is_mountpoint() to fix unreliable d_mountpoint() checks
Applying: autofs: use path_has_submounts() to fix unreliable have_submount() checks
Applying: vfs: remove unused have_submounts() function
Applying: vfs: merge path_is_mountpoint() and path_is_mountpoint_rcu()
Applying: autofs: make struct path const in autofs4_dir_open()
Applying: autofs: change struct path to const in autofs4_expire_wait() and autofs4_wait()
Applying: vfs: change struct path to const in d_manage()
Applying: vfs: constify path parameter of path_has_submounts()
Applying: autofs: don't hold spinlock over direct mount expire
Applying: vfs: make may_umount_tree() mount propagation aware
Applying: vfs-make-may_umount_tree-mount-propogation-aware-checkpatch-fixes
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
Merging akpm/master (755edccbffa1 reimplement IDR and IDA using the radix tree)
