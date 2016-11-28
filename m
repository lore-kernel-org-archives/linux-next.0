From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 28
Date: Mon, 28 Nov 2016 17:01:58 +1100
Message-ID: <20161128170158.453cf730@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752733AbcK1GCw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Nov 2016 01:02:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20161125:

New tree: modules

The mmc tree gained a conflict against the block tree.

The edac-amd tree gained a conflict agaainst the edac tree.

The kvm tree gained a conflict against the tip tree.

The akpm-current tree still had its build failure for which I added a
supplied patch.

Non-merge commits (relative to Linus' tree): 8268
 8247 files changed, 480978 insertions(+), 181864 deletions(-)

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

I am currently merging 244 trees (counting Linus' and 34 trees of bug
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
Merging origin/master (e5517c2a5a49 Linux 4.9-rc7)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (152b695d7437 builddeb: fix cross-building to arm64 producing host-arch debs)
Merging arc-current/for-curr (a25f0944ba9b Linux 4.9-rc5)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (984d7a1ec67c powerpc/mm: Fixup kernel read only mapping)
Merging sparc/master (9dd35d6882a1 sparc: drop duplicate header scatterlist.h)
Merging net/master (d8e435f3ab6f Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging ipsec/master (6b2264878155 flowcache: Increase threshold for refusing new allocations)
Merging netfilter/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging ipvs/master (9b6c14d51bd2 net: tcp response should set oif only if it is L3 master)
Merging wireless-drivers/master (fcd2042e8d36 mwifiex: printk() overflow with 32-byte SSIDs)
Merging mac80211/master (51b9a31c42ed tipc: eliminate obsolete socket locking policy description)
Merging sound-current/for-linus (b5337cfe067e ALSA: hda/ca0132 - Add quirk for Alienware 15 R2 2016)
Merging pci-current/for-linus (e42010d8207f PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX))
Merging driver-core.current/driver-core-linus (a25f0944ba9b Linux 4.9-rc5)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (16ae16c6e561 Merge tag 'mmc-v4.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc)
Merging usb-gadget-fixes/fixes (05e78c6933d6 usb: gadget: f_fs: fix wrong parenthesis in ffs_func_req_match())
Merging usb-serial-fixes/usb-linus (2ab13292d7a3 USB: serial: cp210x: add ID for the Zone DPMX)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (a25f0944ba9b Linux 4.9-rc5)
Merging char-misc.current/char-misc-linus (a25f0944ba9b Linux 4.9-rc5)
Merging input-current/for-linus (e9fb7cc63801 Input: psmouse - disable automatic probing of BYD touchpads)
Merging crypto-current/master (c8467f7a3620 crypto: scatterwalk - Remove unnecessary aliasing check in map_and_copy)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (9c763584b7c8 Linux 4.9-rc6)
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e93481952fe5 ARC: Don't use "+l" inline asm constraint)
Merging arm/for-next (fd18f798cfad Merge branch 'syscalls' into for-next)
Merging arm-perf/for-next/perf (f43365ee17f8 selftests: arm64: add test for unaligned/inexact watchpoint handling)
Merging pinctrl/for-next (ec61168bc0bc pinctrl: sx150x: support setting multiple pins at once)
Merging arm-soc/for-next (8edd641e179e arm-soc: document merges)
Merging amlogic/for-next (0ef8bcc8c1b3 Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ec09fdf764ee Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (242a001e48b7 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (7943083ec2a8 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (4aecea63ed81 Merge branch 'omap-for-v4.10/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (bbf9c90768f9 Merge tag 'qcom-dts-for-4.10-2' into all-for-4.10-part2)
Merging renesas/next (ba049962976b Merge branch 'soc-match-for-v4.10' into next)
Merging rockchip/for-next (7e02e53c6ecf Merge branch 'v4.10-clk/next' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (2d2a2b87438b Merge branch 'next/soc' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (ba42822af1c2 arm64: Enable CONFIG_ARM64_SW_TTBR0_PAN)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
Applying: arm64: merge fix for code movement to cpucaps.h
Merging clk/clk-next (96893e101eb2 clk: qcom: Put venus core0/1 gdscs to hw control mode)
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
Merging m68k/for-next (25ba49085c4f m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (974cc521c0d5 m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (d31d3a72d41b Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (a1cd0835d0d8 parisc: Enhance CPU detection code on PAT machines)
Merging powerpc/next (3b10d0095a1e powerpc/mm/radix: Prevent kernel execution of user space)
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/asm-prototypes.h
Merging fsl/next (18058822768f soc/qman: Handle endianness of h/w descriptors)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (cb9c638510ef MAINTAINERS: update for maintainer of s390/zcrypt)
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
Merging cifs/for-next (faad81c4f581 CIFS: iterate over posix acl xattr entry correctly in ACL_to_cifs_posix())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (e952813e210b ext2: avoid bogus -Wmaybe-uninitialized warning)
Merging ext4/dev (b72b1f3b125e ext4: Add select for CONFIG_FS_IOMAP)
Merging f2fs/dev (19c526515f6b f2fs: fix 32-bit build)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (59c3b76cc61d fuse: fix fuse_write_end() if zero bytes were copied)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (14155cafeadd btrfs: assign error values to the correct bio structs)
Merging nfsd/nfsd-next (7ba630f54ca6 nfsd: constify reply_cache_stats_operations structure)
Merging orangefs/for-next (19ff7fcc76e6 orangefs: add .owner to debugfs file_operations)
Merging overlayfs/overlayfs-next (7f4c584fb46b ovl: allow setting max size of redirect)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a00052a296e5 ubifs: Fix regression in ubifs_readdir())
Merging xfs/for-next (0fc204e2eb64 Merge branch 'xfs-4.10-misc-fixes-1' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1a452ec24b3f Merge branch 'pci/host-vmd' into next)
Merging pstore/for-next/pstore (fc46d4e453f5 ramoops: add pdata NULL check to ramoops_probe)
Merging hid/for-next (f7f1fecb51d5 Merge branch 'for-4.9/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (470f1b298ef2 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (98d7b5a40c3a hwmon: (core) Simplify sysfs attribute name allocation)
Merging jc_docs/docs-next (9c240d757658 Change the document about iowait)
Merging v4l-dvb/master (bf0396ea4727 Merge branch 'patchwork' into to_next)
Merging pm/linux-next (2462edc5f165 Merge branch 'powercap' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (3108f1338520 Merge branches 'thermal-core', 'thermal-intel', 'thermal-reorg' and 'thermal-soc-fixes' into next)
Merging thermal-soc/next (6ee459f5f967 devfreq_cooling: pass a pointer to devfreq in the power model callbacks)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (d29fa0cb7602 swiotlb: Minor fix-ups for DMA_ATTR_SKIP_CPU_SYNC support)
Merging net-next/master (5a717f4f8f28 netdevice: fix sparse warning for HARD_TX_LOCK)
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (7d384846b998 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (4c0bfeaae9f9 brcmsmac: fix array out-of-bounds access in qm_log10)
Merging bluetooth/master (1ae6d00ad057 Bluetooth: hci_qca: Use setup_timer Kernel API instead of init_timer)
Merging mac80211-next/master (bd0e6d8d5803 mac80211: Remove unused 'struct rate_control_ref' variable)
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (b2c4ba5cf712 mtd: mtdswap: fix spelling mistake "erassure" -> "erasure")
Merging nand/nand/next (8fcfba072420 mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd)
Merging crypto/master (ed424bb3680b hwrng: Make explicit that max >= 32 always)
Merging drm/drm-next (7625e05286cf Merge branch 'drm-tda998x-devel' of git://git.armlinux.org.uk/~rmk/linux-arm into drm-next)
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (e9cbc4bd0140 drm/i915: Update DRIVER_DATE to 20161121)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/topic/drm-misc (2761ba6c0925 drm: bridge: add DesignWare HDMI I2S audio support)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (1795a5821914 drm/msm: update generated headers)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (63e8e44adfdc Merge branch 'sunxi/dt-late-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (68fdc678df46 MAINTAINERS: add GCC plugins Makefile)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (d56ec48ebe5f Merge remote-tracking branch 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (2e57069c869f ALSA: bebob: compare whole string for model name so that readers are not confused)
Merging sound-asoc/for-next (48ccde861951 Merge remote-tracking branches 'asoc/topic/wm9705', 'asoc/topic/wm9712' and 'asoc/topic/wm9713' into asoc-next)
Merging input/next (3d5a9437a68a Input: soc_button_array - bail out earlier if gpiod_count is zero)
Merging block/for-next (121289240747 Merge branch 'for-4.10/block' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
Merging lightnvm/for-next (039d17753cdd lightnvm: manage lun partitions internally in mm)
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
Merging device-mapper/for-next (6ab0ee62c514 dm crypt: add ability to use keys from the kernel key retention service)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (8b0907ecef70 mmc: sh_mmcif: Document r8a73a4, r8a7778 and sh73a0 DT bindings)
CONFLICT (content): Merge conflict in drivers/mmc/card/block.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (034e33f5eda3 md: stop write should stop journal reclaim)
CONFLICT (content): Merge conflict in drivers/md/raid5-cache.c
CONFLICT (content): Merge conflict in drivers/md/md.c
Merging mfd/for-mfd-next (b56ded9282ab mfd: tps65217: Support an interrupt pin as the system wakeup)
CONFLICT (content): Merge conflict in drivers/mfd/wm8994-core.c
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (6480af4915d6 power_supply: wm97xx_battery: use power_supply_get_drvdata)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f769e08f0922 Merge remote-tracking branch 'regulator/topic/twl' into regulator-next)
Merging security/next (9430066a15d6 tpm: adjust return value of tpm_read_log)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (9287aed2ad1f selinux: Convert isec->lock into a spinlock)
Merging tpmdd/next (9430066a15d6 tpm: adjust return value of tpm_read_log)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (7ff612ecad97 Merge branches 'arm/mediatek', 'x86/amd', 'core' and 'arm/exynos' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5ba6de98c78a vfio: fix vfio_info_cap_add/shift)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (0489410368df audit: add support for session ID user filter)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (3c263bc7b727 add bindings document for altera freeze bridge)
Merging mailbox/mailbox-for-next (16ae16c6e561 Merge tag 'mmc-v4.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc)
Merging spi/for-next (15ce79c78c08 Merge remote-tracking branch 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (7de927a96863 Merge branch 'perf/core')
CONFLICT (content): Merge conflict in drivers/net/ethernet/amd/Kconfig
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Applying: net: busy-poll: fix up for cpu_relax_lowlatency() removal
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (32308b5f6ba9 edac.rst: move concepts dictionary from edac.h)
Merging edac-amd/for-next (27bda205ba93 EDAC, mpc85xx: Implement remove method for the platform driver)
CONFLICT (content): Merge conflict in drivers/edac/edac_mc.c
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (7d436400223b tracing: Add error checks to creation of event files)
Merging rcu/rcu/next (2d66cccd7343 mm: Prevent __alloc_pages_nodemask() RCU CPU stall warnings)
Merging kvm/linux-next (8370c3d08bd9 kvm: svm: Add kvm_fast_pio_in support)
CONFLICT (content): Merge conflict in arch/x86/kvm/cpuid.c
Merging kvm-arm/next (fd5ebf99f814 arm/arm64: KVM: Clean up useless code in kvm_timer_enable)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (6ccad8cea5bc KVM: Add halt polling documentation)
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/asm-prototypes.h
Merging kvms390/next (e1788bb995be KVM: s390: handle floating point registers in the run ioctl not in vcpu_put/load)
Merging xen-tip/linux-next (1eb08545c0a3 xen-scsifront: Add a missing call to kfree)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (401df5ace9d6 intel_pmc_core: Add KBL CPUID support)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (cee0122de3a8 leds: leds-cobalt-raq: use builtin_platform_driver)
Merging ipmi/for-next (a24b5dd5eda7 ipmi: Fix sequence number handling)
Merging driver-core/driver-core-next (dfea747d2aba drivers: base: cacheinfo: support DT overrides for cache properties)
Merging tty/tty-next (b81064547338 mxs-auart: count FIFO overrun errors)
CONFLICT (modify/delete): Documentation/VGA-softcursor.txt deleted in HEAD and modified in tty/tty-next. Version tty/tty-next of Documentation/VGA-softcursor.txt left in tree.
$ git rm -f Documentation/VGA-softcursor.txt
Merging usb/usb-next (eacae5d2b940 usb: ohci-da8xx: rename driver to ohci-da8xx)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (009615ab7fd4 USB: serial: cp210x: use tcflag_t to fix incompatible pointer type)
Merging usb-chipidea-next/ci-for-usb-next (3be3251db088 usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (469554a148e8 staging: speakup: speakup_soft.c Align parenthesis)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (content): Merge conflict in drivers/staging/unisys/include/iochannel.h
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
Merging char-misc/char-misc-next (7c7a6077f5c7 mei: bus: split RX and async notification callbacks)
CONFLICT (content): Merge conflict in drivers/lightnvm/core.c
Merging extcon/extcon-next (541332a13b1d extcon: usb-gpio: Add VBUS detection support)
Merging slave-dma/next (2b224de1b611 Merge branch 'for-linus' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (ee8a864ceaf4 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (99ff8b162a4a scsi: srp_transport: Move queuecommand() wait code to SCSI core)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (8881d559aca6 Merge branch 'for-4.9-fixes' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging rpmsg/for-next (10b0916beb03 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (468a90f893d8 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (f84df2a6f268 exec: Ensure mm->user_ns contains the execed files)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1001354ca341 Linux 4.9-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (7f73c6f7d72a coresight: Add support for ARM Coresight STM-500)
Merging rtc/rtc-next (72d3d79f8da9 rtc: fix typos in Kconfig)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (4cb19355ea19 device-dax: fail all private mapping attempts)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging modules/modules-next (39290b389ea2 module: extend 'rodata=off' boot cmdline parameter to module mappings)
Merging akpm-current/current (f121d1bb99a7 ipc/shm.c: coding style fixes)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in fs/dax.c
Applying: linux-next: build failure after merge of the akpm-current tree
$ git checkout -b akpm remotes/origin/akpm/master
Applying: kernel/time: fix build
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
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
Merging akpm/master (973374debc6f dax: clear dirty entry tags on cache flush)
