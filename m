From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 24
Date: Sat, 24 Dec 2016 14:53:25 +1100
Message-ID: <20161224145325.3956e16d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753518AbcLXDxa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Dec 2016 22:53:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add any material for v4.11 to your linux-next included
branches until after v4.10-rc1 has been released.

There will be no linux-next releases from me between Dec 25 and Jan 2
inclusive (unless I get really bored with my new toys :-)).

Changes since 20161223:

Non-merge commits (relative to Linus' tree): 729
 1201 files changed, 17538 insertions(+), 10332 deletions(-)

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

I am currently merging 246 trees (counting Linus' and 35 trees of bug
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
Merging origin/master (50b17cfb1917 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (152b695d7437 builddeb: fix cross-building to arm64 producing host-arch debs)
Merging arc-current/for-curr (08fe007968b2 ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (69973b830859 Linux 4.9)
Merging sparc/master (ba6d973f78eb Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging net/master (1636098c46ac sctp: fix recovering from 0 win with small data chunks)
Merging ipsec/master (bc3913a5378c Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging netfilter/master (6c5d5cfbe3c5 netfilter: ipt_CLUSTERIP: check duplicate config when initializing)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (22b68b93ae25 rtlwifi: Fix kernel oops introduced with commit e49656147359)
Merging mac80211/master (a17d93ff3a95 mac80211: fix legacy and invalid rx-rate report)
Merging sound-current/for-linus (995c6a7fd9b9 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change)
Merging pci-current/for-linus (e42010d8207f PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX))
Merging driver-core.current/driver-core-linus (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging tty.current/tty-linus (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging usb.current/usb-linus (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging usb-gadget-fixes/fixes (05e78c6933d6 usb: gadget: f_fs: fix wrong parenthesis in ffs_func_req_match())
Merging usb-serial-fixes/usb-linus (46490c347df4 USB: serial: option: add dlink dwm-158)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging char-misc.current/char-misc-linus (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging input-current/for-linus (67626c932302 Input: synaptics_i2c - change msleep to usleep_range for small msecs)
Merging crypto-current/master (8759fec4af22 crypto: marvell - Copy IVDIG before launching partial DMA ahash requests)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (69973b830859 Linux 4.9)
Merging drm-misc-fixes/for-linux-next-fixes (298360af3dab drivers/gpu/drm/ast: Fix infinite loop if read fails)
Merging kbuild/for-next (a6d1da25b333 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (49b05da80546 Merge branch 'drm-armada-devel' into for-next)
Merging arm-perf/for-next/perf (f43365ee17f8 selftests: arm64: add test for unaligned/inexact watchpoint handling)
Merging arm-soc/for-next (991688bfc635 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
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
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (12a733bf9158 MIPS: ralink: Fix incorrect assignment on ralink_soc)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (7c7808ce107d openrisc: prevent VGA console, fix builds)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (c6f6634721c8 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging fsl/next (baae856ebdee powerpc/fsl/dts: add FMan node for t1042d4rdb)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (f2522d2d8611 s390/zcore: remove unneeded linux/miscdevice.h include)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (30b507051dd1 xtensa: update DMA-related Documentation/features entries)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (2939e1a86f75 btrfs: limit async_work allocation and worker func duration)
Merging ceph/master (45ee2c1d6618 libceph: remove now unused finish_request() wrapper)
Merging cifs/for-next (374402a2a1df cifs_get_root shouldn't use path with tree name)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (2700e6067c72 quota: Fix bogus warning in dquot_disable())
Merging ext4/dev (a551d7c8deef Merge branch 'fscrypt' into dev)
Merging f2fs/dev (852d21ae1fcd docs: add back 'Documentation/Changes' file (as symlink))
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c01638f5d919 fuse: fix clearing suid, sgid for chown())
Merging gfs2/for-next (23754c081d1b GFS2: Limit number of transaction blocks requested for truncates)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (8ac2b42238f5 NFSv4: Retry the DELEGRETURN if the embedded GETATTR is rejected with EACCES)
Merging nfsd/nfsd-next (47057abde515 nfsd: add support for the umask attribute)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (c3c869966480 ovl: fix reStructuredText syntax errors in documentation)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (ba75d570b60c ubifs: Initialize fstr_real_len)
Merging xfs/for-next (9807b773dad4 Merge branch 'xfs-4.10-misc-fixes-4' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (bb6b5000084e Merge branch 'work.splice' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (b12826c5188e Merge branch 'vfs-ovl' into next)
CONFLICT (content): Merge conflict in fs/read_write.c
CONFLICT (content): Merge conflict in fs/overlayfs/dir.c
Merging pci/next (b08d2e61a6f9 Merge branch 'pci/host-vmd' into next)
Merging pstore/for-next/pstore (fc46d4e453f5 ramoops: add pdata NULL check to ramoops_probe)
Merging hid/for-next (43768c4daf54 Merge branches 'for-4.10/upstream' and 'for-4.10/i2c-hid-nopower' into for-next)
Merging i2c/i2c/for-next (649ac63a9ae5 i2c: mux: mlxcpld: fix i2c mux selection caching)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (27ec191a79ca firmware: dmi_scan: Always show system identification string)
Merging hwmon-staging/hwmon-next (506f231aca4d hwmon: (tmp401) use permission-specific DEVICE_ATTR variants)
Merging jc_docs/docs-next (217e2bfab22e docs: sphinx-extensions: make rstFlatTable work with docutils 0.13)
Merging v4l-dvb/master (65390ea01ce6 Merge branch 'patchwork' into v4l_for_linus)
Merging pm/linux-next (39a87cc1a966 Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (0faf7dd5a947 MAINTAINERS: Samsung: Update maintainer for PWM FAN and SAMSUNG THERMAL)
Merging thermal-soc/next (18591add41ec thermal: rockchip: handle set_trips without the trip points)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (d29fa0cb7602 swiotlb: Minor fix-ups for DMA_ATTR_SKIP_CPU_SYNC support)
Merging net-next/master (ba6d973f78eb Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec-next/master (d4aea20d889e tun: Use netif_receive_skb instead of netif_rx)
Merging netfilter-next/master (ba6d973f78eb Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (d15697de60db adm80211: add checks for dma mapping errors)
Merging bluetooth/master (107bc0aa95ca Merge branch 'for-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next)
Merging mac80211-next/master (7b854982b273 Revert "rfkill: Add rfkill-any LED trigger")
Merging rdma/for-next (6f94ba20799b Merge branch 'vmw_pvrdma' into merge-test)
Merging rdma-leon/rdma-next (ba6d973f78eb Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging l2-mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging nand/nand/next (8fcfba072420 mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd)
Merging crypto/master (04b46fbdea5e crypto: testmgr - fix overlap in chunked tests again)
Merging drm/drm-next (2cf026ae85c4 Merge branch 'linux-4.10' of git://github.com/skeggsb/linux into drm-next)
Merging drm-panel/drm/panel/for-next (8c31f6034b24 drm/panel: simple: Add support for AUO G185HAN01)
Merging drm-intel/for-linux-next (6ba0566cf2af drm/i915: skip the first 4k of stolen memory on everything >= gen8)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (f79f26921ee1 drm/i915: Add a cursor hack to allow converting legacy page flip to atomic, v3.)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (63e8e44adfdc Merge branch 'sunxi/dt-late-for-4.10' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-h3.dtsi
Merging kspp/for-next/kspp (3545d3c27c43 gcc-plugins: update gcc-common.h for gcc-7)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (a5cb009162e6 Merge tag 'regmap-v4.10' into regmap-linus)
Merging sound/for-next (995c6a7fd9b9 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change)
Merging sound-asoc/for-next (e48ebfe726e4 Merge remote-tracking branches 'asoc/fix/arizona', 'asoc/fix/dwc', 'asoc/fix/hdmi-codec' and 'asoc/fix/topology' into asoc-linus)
Merging modules/modules-next (4d217a5adccf module: fix DEBUG_SET_MODULE_RONX typo)
Merging input/next (1a9027770f3d Input: i8042 - force synchronous probing of PNP drivers)
Merging block/for-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging lightnvm/for-next (a5f78b7f7dd1 Merge branch 'for-4.10/block' into for-next)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (e85baa8868b0 mmc: sd: Meet alignment requirements for raw_ssr DMA)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3ea77e712089 md/r5cache: assign conf->log before r5l_load_log())
Merging mfd/for-mfd-next (93559191e71b mfd: tps65217: Support an interrupt pin as the system wakeup)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (6480af4915d6 power_supply: wm97xx_battery: use power_supply_get_drvdata)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (d00b74613fb1 Merge remote-tracking branches 'regulator/topic/tps65086' and 'regulator/topic/twl' into regulator-next)
Merging security/next (50523a29d900 Yama: allow access for the current ptrace parent)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (36872bf3f5e3 selinux: default to security isid in sel_make_bools() if no sid is found)
Merging tpmdd/next (1548c540d863 tpm/vtpm: fix kdoc warnings)
Merging watchdog/master (6b6e26231ac8 Merge branch 'watchdog-next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
Merging iommu/next (1465f481460c Merge branches 'arm/mediatek', 'arm/smmu', 'x86/amd', 's390', 'core' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (89670affa2a6 audit: Make AUDIT_ANOM_ABEND event normalized)
Merging devicetree/for-next (c21d1fcd61bc Docs: dt: Be explicit and consistent in reference to IOMMU specifiers)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (b6bdcd05b510 Merge remote-tracking branches 'spi/fix/armada', 'spi/fix/fsl-dspi' and 'spi/fix/sh-msiof' into spi-linus)
Merging tip/auto-latest (804a855a571d Merge branch 'WIP.hotplug')
Applying: scsi: disable the QEDI driver for now
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (0de2788447b6 EDAC, amd64: Fix improper return value)
Merging irqchip/irqchip/for-next (69973b830859 Linux 4.9)
Merging ftrace/for-next (3dbb16b87b57 selftests: ftrace: Shift down default message verbosity)
Merging rcu/rcu/next (6190aaafd06c Merge branches 'doc.2016.11.14a', 'fixes.2016.11.14a', 'list.2016.10.31a' and 'torture.2016.11.14a' into HEAD)
Merging kvm/linux-next (ef85b6738543 kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF))
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (252747dd7c67 KVM: s390: Get rid of ar_t)
Merging xen-tip/linux-next (61033e089cde xen: remove stale xs_input_avail() from header)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (83da6b59919a platform/x86: surface3-wmi: Balance locking on error path)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (305335b90794 MAINTAINERS: Update Jacek Anaszewski's email address)
Merging ipmi/for-next (070cbd1d42aa ipmi: create hardware-independent softdep for ipmi_devintf)
Merging driver-core/driver-core-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging tty/tty-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging usb/usb-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (3c3dd1e058cb USB: serial: kl5kusb105: abort on open exception path)
Merging usb-chipidea-next/ci-for-usb-next (223e92311583 usb: chipdata: Replace the extcon API)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging char-misc/char-misc-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging extcon/extcon-next (3c204252e935 extcon: int3496: Add Intel INT3496 ACPI device extcon driver)
Merging slave-dma/next (e66937868db0 Merge branch 'for-linus' into next)
Merging cgroup/for-next (89bb3eed858e cgroup: cgroup_sk_alloc() is allowed to increase reference on a dead cgroup)
Merging scsi/for-next (b4153e05a699 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (f1e65d125678 scsi: dpt_i2o: double free if adpt_i2o_online_hba() fails)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (83337e544323 iscsi-target: Return error if unable to add network portal)
Merging libata/for-next (7ddf6a387c68 Merge branch 'for-4.10' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (6bdf1e0efb04 Makefile: drop -D__CHECK_ENDIAN__ from cflags)
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
Merging rtc/rtc-next (d3e5925902dc rtc: mcp795: Fix whitespace and indentation.)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (c44ef859ceff Merge branch 'for-4.10/libnvdimm' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (e1f8c36b6eb3 ipc/sem: add hysteresis)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs: add i_blocksize()
Applying: Reimplement IDR and IDA using the radix tree
Applying: idr: support storing NULL in the IDR
Applying: reimplement-idr-and-ida-using-the-radix-tree-support-storing-null-in-the-idr-checkpatch-fixes
Applying: scripts/spelling.txt: add "swith" pattern and fix typo instances
Applying: scripts/spelling.txt: add "swithc" pattern and fix typo instances
Applying: scripts/spelling.txt: add "an user" pattern and fix typo instances
Applying: scripts/spelling.txt: add "an union" pattern and fix typo instances
Applying: scripts/spelling.txt: add "an one" pattern and fix typo instances
Applying: scripts/spelling.txt: add "partiton" pattern and fix typo instances
Applying: scripts/spelling.txt: add "aligment" pattern and fix typo instances
Applying: scripts/spelling.txt: add "algined" pattern and fix typo instances
Applying: scripts/spelling.txt: add "efective" pattern and fix typo instances
Applying: scripts/spelling.txt: add "varible" pattern and fix typo instances
Applying: scripts/spelling.txt: add "embeded" pattern and fix typo instances
Applying: scripts/spelling.txt: add "againt" pattern and fix typo instances
Applying: scripts/spelling.txt: add "neded" pattern and fix typo instances
Applying: scripts/spelling.txt: add "unneded" pattern and fix typo instances
Applying: scripts/spelling.txt: add "intialization" pattern and fix typo instances
Applying: scripts/spelling.txt: add "initialiazation" pattern and fix typo instances
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "comsume(r)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "disble(d)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "overide" pattern and fix typo instances
Applying: scripts/spelling.txt: add "overrided" pattern and fix typo instances
Applying: scripts/spelling.txt: add "configuartion" pattern and fix typo instances
Applying: scripts/spelling.txt: add "applys" pattern and fix typo instances
Applying: scripts/spelling.txt: add "explictely" pattern and fix typo instances
Applying: scripts/spelling.txt: add "omited" pattern and fix typo instances
Applying: scripts/spelling.txt: add "disassocation" pattern and fix typo instances
Applying: scripts/spelling.txt: add "deintialize(d)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "overwritting" pattern and fix typo instances
Applying: scripts/spelling.txt: add "overwriten" pattern and fix typo instances
Applying: scripts/spelling.txt: add "therfore" pattern and fix typo instances
Applying: scripts/spelling.txt: add "followings" pattern and fix typo instances
Merging akpm/master (1971011670b7 scripts/spelling.txt: add "followings" pattern and fix typo instances)
