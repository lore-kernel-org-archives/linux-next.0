From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 30
Date: Mon, 30 Jan 2017 17:49:01 +1100
Message-ID: <20170130174901.6c7e88bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751454AbdA3G70 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Jan 2017 01:59:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

There will be no linux-next release until Monday (next-20170130).

Changes since 20170125:

New tree: spi-nor

The drm tree lost its build failure.

The block tree gained a build failure so I used the version from
next-20170125.

The tip tree gained a conflict against the drm-misc-fixes tree.

The rcu tree gained a conflict against the powerpc-fixes tree.

The staging tree gained a conflict against the staging.current tree.

The gpio tree gained a conflict against the staging tree.

Non-merge commits (relative to Linus' tree): 5603
 6347 files changed, 228529 insertions(+), 117188 deletions(-)

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
and pseries_le_defconfig and i386, sparc and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 253 trees (counting Linus' and 36 trees of bug
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
Merging origin/master (2c5d9555d6d9 Merge branch 'parisc-4.10-3' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (9aed02feae57 ARC: [arcompact] handle unaligned access delay slot corner case)
Merging arm-current/fixes (90f92c631b21 ARM: 8613/1: Fix the uaccess crash on PB11MPCore)
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (b5fa0f7f88ed powerpc: Fix build failure with clang due to BUILD_BUG_ON())
Merging sparc/master (5d0e7705774d sparc: Fixed typo in sstate.c. Replaced panicing with panicking)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (1b1bc42c1692 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (4e5da369df64 Documentation/networking: fix typo in mpls-sysctl)
Merging netfilter/master (a47b70ea86bd ravb: unmap descriptors when freeing rings)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (2b1d530cb315 MAINTAINERS: ath9k-devel is closed)
Merging mac80211/master (115865fa0826 mac80211: don't try to sleep in rate_control_rate_init())
Merging sound-current/for-linus (6cf4569ce356 Merge tag 'asoc-fix-v4.10-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (672980c62c68 PCI/ASPM: Handle PCI-to-PCIe bridges as roots of PCIe hierarchies)
Merging driver-core.current/driver-core-linus (49def1853334 Linux 4.10-rc4)
Merging tty.current/tty-linus (49def1853334 Linux 4.10-rc4)
Merging usb.current/usb-linus (a3683e0c1410 Merge tag 'usb-serial-4.10-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (efe357f4633a usb: dwc2: host: fix Wmaybe-uninitialized warning)
Merging usb-serial-fixes/usb-linus (5d03a2fd2292 USB: serial: option: add device ID for HP lt2523 (Novatel E371))
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (b17c1bba9cec staging: greybus: timesync: validate platform state callback)
Merging char-misc.current/char-misc-linus (191e885a2e13 firmware: fix NULL pointer dereference in __fw_load_abort())
Merging input-current/for-linus (3f5c34c6d468 Input: wm97xx - make missing platform data non-fatal)
Merging crypto-current/master (11e3b725cfc2 crypto: arm64/aes-blk - honour iv_out requirement in CBC and CTR modes)
Merging ide/master (da095587e6be Revert "ide: Fix interface autodetection in legacy IDE driver (trial #2)")
Merging vfio-fixes/for-linus (bd00fdf198e2 vfio/spapr: fail tce_iommu_attach_group() when iommu_data is null)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (45d9f43911a9 Merge tag 'gvt-fixes-2017-01-25' of https://github.com/01org/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (7c6d639d465e drm/ttm: Make sure BOs being swapped out are cacheable)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (01c4a81b2c85 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (8729616aee44 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
Merging amlogic/for-next (61e787270fde Merge v4.11/dt64)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (e514f82c67c1 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (8d6e1b09237b Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (57aba12f97c2 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (9e6baf6c9d61 Merge branch 'mvebu/98DX' into mvebu/for-next)
Merging omap/for-next (36dbd2631399 Merge branch 'omap-for-v4.11/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (52091edac563 arm64: dts: qcom: Add msm8916 CoreSight components)
Merging renesas/next (59fd3e06b3d7 Merge branches 'arm64-dt-for-v4.11', 'dt-for-v4.11' and 'soc-for-v4.11' into next)
Merging rockchip/for-next (0aab64671deb Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (95648b747071 Merge branch 'next/soc' into for-next)
Merging tegra/for-next (6ef2dbf97439 Merge branch for-4.11/i2c into for-next)
Merging arm64/for-next/core (49f6cba617fe arm64: handle sys and undef traps consistently)
Merging clk/clk-next (eaff16bc4988 clk: qcom: SDHCI enablement on Nexus 5X / 6P)
CONFLICT (add/add): Merge conflict in include/dt-bindings/clock/stm32fx-clock.h
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (d25c164fc0be m68k/defconfig: amcore board defconfig tuning)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (bf0505dfeac3 MIPS: Fix special case in 64 bit IP checksumming.)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (5de769bbfdfc arch/openrisc/lib/memcpy.c: use correct OR1200 option)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (10528b9c45cf powerpc/bpf: Flush the entire JIT buffer)
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (9437964885f8 s390/bpf: remove redundant check for non-null image)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (30b507051dd1 xtensa: update DMA-related Documentation/features entries)
Merging fscrypt/master (a5d431eff2e0 fscrypt: make fscrypt_operations.key_prefix a string)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (514f7d5f893f Merge branch 'for-next-next-v4.11-20170126' into for-next-20170126)
Merging ceph/master (6df8c9d80a27 ceph: fix bad endianness handling in parse_reply_info_extra)
Merging cifs/for-next (81ddd8c0c5e1 cifs: initialize file_info_lock)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (70f16cef06b5 udf: allow implicit blocksize specification during mount)
Merging ext4/dev (2b3864b32403 ext4: do not polute the extents cache while shifting extents)
Merging f2fs/dev (888a724d144e f2fs: check in-memory sit version bitmap)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (210675270caa fuse: fix time_to_jiffies nsec sanity check)
Merging gfs2/for-next (192738b711d3 GFS2: Inline function meta_lo_add)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (d56a5ca366e7 Merge tag 'nfs-for-4.10-4' of git://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging nfsd/nfsd-next (42e24662a806 nfsd: special case truncates some more)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (4c7d0c9cb713 ovl: fix possible use after free on redirect dir lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (e0d76fa4475e xfs: prevent quotacheck from overloading inode lru)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (59479ae85e43 Merge branches 'work.sendmsg' and 'work.splice-net' into for-next)
CONFLICT (content): Merge conflict in drivers/block/nbd.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (b12826c5188e Merge branch 'vfs-ovl' into next)
CONFLICT (content): Merge conflict in fs/read_write.c
CONFLICT (content): Merge conflict in fs/overlayfs/dir.c
Merging printk/for-next (0e91b7706038 printk: drop call_console_drivers() unused param)
Merging pci/next (83a96ebd0efa Merge branch 'pci/host-thunder' into next)
Merging pstore/for-next/pstore (0c744ea4f77d Linux 4.10-rc2)
Merging hid/for-next (8ffbb1ee31d9 Merge branch 'for-4.10/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f4d9f6fbbf57 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (248c3398aae1 hwmon: Relax name attribute validation for new APIs)
Merging jc_docs/docs-next (2069889ff78c docs/zh_CN: Add coding-style into docs build system)
Merging v4l-dvb/master (5dd2470bfddb Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (a0a74270efaa video: fbdev: wm8505fb use permission-specific DEVICE_ATTR variants)
Merging pm/linux-next (7a72b8775225 Merge branch 'pm-opp' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (7b09ae6042cd Merge branches 'ida-conversion' and 'for-rc' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (f1225ee4c8fc swiotlb-xen: update dev_addr after swapping pages)
Merging net-next/master (5b8784aaf29b openvswitch: Simplify do_execute_actions().)
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (eb758c8864d4 esp: Introduce a helper to setup the trailer)
Merging netfilter-next/master (1a28ad74ebd8 netfilter: nf_tables: eliminate useless condition checks)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (575ddce05077 rtlwifi: rtl_usb: Fix for URB leaking when doing ifconfig up/down)
Merging bluetooth/master (264e6777f958 Merge branch 'netvsc-enhancements')
Merging mac80211-next/master (228c8c6b1f43 wireless: define cipher/AKM suites using a macro)
Merging rdma/for-next (24dc831b77ec IB/core: Add inline function to validate port)
Merging rdma-leon/rdma-next (b4dfe5135f87 Merge branch 'topic/cma-tos' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging nand/nand/next (9018bf842d4e mtd: nand: fsmc: remove stale non-DT probe path)
Merging spi-nor/next (841510ccbbbe mtd: fsl-quadspi: Rename SEQID_QUAD_READ to SEQID_READ)
Merging crypto/master (7dede913fc2a crypto: vmx - disable preemption to enable vsx in aes_ctr.c)
Merging drm/drm-next (a5b2b6ebf34b drm/sti: Fix compilation failure for drm_framebuffer.pixel_format)
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (8adabb8928bc drm/i915: Pevent copying uninitialised garbage into vma->ggtt_view)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (8c96c678011e dma/fence: Export enable-signaling tracepoint for emission by drivers)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (83d642ee6dbe drm: mali-dp: fix stride setting for multi-plane formats)
Merging sunxi/sunxi/for-next (c94f7962e97c Merge branch 'sunxi/dt-for-4.11' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
Merging kspp/for-next/kspp (e9569a422c27 Merge branch 'for-next/gcc-plugin/structleak' into for-next/gcc-plugins)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (287215e9c466 Merge branch 'topic/intel-lpe-audio' into for-next)
Merging sound-asoc/for-next (3b9a1add8e1c Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (2fc42a1bbbc4 livepatch/module: print notice of TAINT_LIVEPATCH)
Merging input/next (f719315b52b5 Input: constify device_type structures)
Merging block/for-next (9053ec7625de Merge branch 'for-4.11/rq-refactor' into for-next)
$ git reset --hard HEAD^
Merging next-20170125 version of block
Merging lightnvm/for-next (c3679c6eac5d lightnvm: use end_io callback instead of instance)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (486bbbfcb7c6 mmc: core: Extend mmc_of_parse() to check for mmc-ddr-3_3v)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (161d1e707a7b md/r5cache: enable chunk_aligned_read with write back cache)
Merging mfd/for-mfd-next (3d66c8abc13e mfd: cpcap: Add minimal support)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (b09dc5185241 Merge remote-tracking branches 'regulator/topic/anatop', 'regulator/topic/arizona', 'regulator/topic/qcom-smd', 'regulator/topic/supplies' and 'regulator/topic/tps65217' into regulator-next)
Merging security/next (710584b9daef Merge branch 'smack-for-4.11' of git://github.com/cschaufler/smack-next into next)
Merging integrity/next (07a77aadc4e8 ima: fix ima_d_path() possible race with rename)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3a2f5a59a695 security,selinux,smack: kill security_task_wait hook)
Applying: selinux: merge fix for "smc: establish new socket family"
Merging tpmdd/next (526a9f2ddb60 tpm: fix RC value check in tpm2_seal_trusted)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (fce794089d60 Merge branches 'iommu/fixes' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (62bc306e2083 audit: log 32-bit socketcalls)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (a51741ebe131 Documentation: usb: fix wrong documentation paths)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (8d58e8f66f84 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/slave' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (f38c1a474296 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in security/apparmor/include/apparmor.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
Applying: locking/atomic, kref: merge fixup for code movement
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (1bd9900b8301 EDAC, amd64: Add x86cpuid sanity check during init)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (b9b0c831bed2 ftrace: Convert graph filter to use hash tables)
Merging rcu/rcu/next (19e4d983cda1 rcu: Place guard on rcu_all_qs() and rcu_note_context_switch() actions)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Applying: smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (0b4c208d443b Revert "KVM: nested VMX: disable perf cpuid reporting")
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (fcd4f3c6d150 KVM: PPC: Book3S PR: Refactor program interrupt related code into separate function)
Merging kvms390/next (f95a72b9824a KVM: s390: guestdbg: filter PER i-fetch on EXECUTE properly)
Merging xen-tip/linux-next (cc272163ea55 x86/xen: Fix APIC id mismatch warning on Intel)
Merging percpu/for-next (966d2b04e070 percpu-refcount: fix reference leak during percpu-atomic transition)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (9eeda3897a85 platform/x86: add support for devices with Silead touchscreens)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel_mid_powerbtn.c
CONFLICT (content): Merge conflict in drivers/platform/x86/fujitsu-laptop.c
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (8bb1de680dac tools/leds: Add led_hw_brightness_mon program)
Merging ipmi/for-next (c5afee1b0dfc acpi:ipmi: Make IPMI user handler const)
Merging driver-core/driver-core-next (64e90a8acb85 Introduce STATIC_USERMODEHELPER to mediate call_usermodehelper())
Merging tty/tty-next (aa42db44f670 8250: of: remove remnants of generic of_serial driver)
Merging usb/usb-next (4ddecf76b5ae USB: cdc-acm: fix TIOCGSERIAL flags)
Merging usb-gadget/next (e42a5dbb8a3d usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions)
Merging usb-serial/usb-next (ea534e0b4047 USB: serial: add uPD78F0730 USB to Serial Adaptor Driver)
Merging usb-chipidea-next/ci-for-usb-next (30a9566a4f60 usb: chipidea: usb2: delete the redundant setting default DMA mask code)
Merging phy-next/next (0b10f64dbe60 phy: qcom-ufs: Fix misplaced jump label)
Merging staging/staging-next (63d8d50ce356 staging: lustre: lnet: Fix coding style errors)
CONFLICT (modify/delete): drivers/staging/greybus/timesync_platform.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/greybus/timesync_platform.c left in tree.
$ git rm -f drivers/staging/greybus/timesync_platform.c
Merging char-misc/char-misc-next (f2d697604cc8 eeprom: idt_89hpesx: Drop kfree for memory allocated with devm_kzalloc)
Merging extcon/extcon-next (8ea227886002 extcon: arizona: Wait for any running HPDETs to complete on jack removal)
Merging slave-dma/next (91f141dbc9f0 Merge branch 'topic/zx' into next)
Merging cgroup/for-next (b4788e87f687 Merge branch 'for-4.11' into for-next)
Merging scsi/for-next (2340d775b189 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (13c599069130 scsi: hisi_sas: decrease running_req in hisi_sas_slot_task_free())
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (300af14bdb28 qla2xxx: Disable out-of-order processing by default in firmware)
Merging libata/for-next (428d57c1683a Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ec4537a7d64f pci: drop link_reset)
Merging rpmsg/for-next (5956dd81ac18 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (1d9bc2778fe9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/staging/greybus/gpio.c
Merging pinctrl/for-next (2a15343f1e82 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (e52d5f1c5221 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (68eb94f16227 proc: Better ownership of files for non-dumpable tasks in user namespaces)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1e4c2830c369 selftest: cpufreq: Add special tests)
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/Makefile
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (372e2db7210d livepatch: doc: remove the limitation for schedule() patching)
Merging coresight/next (7f12a0d4a674 coresight: STM: Balance enable/disable)
Merging rtc/rtc-next (21da8ba5b665 rtc: sun6i: Switch to devm_rtc_device_register)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (1f19b983a887 libnvdimm, namespace: fix pmem namespace leak, delete when size set to zero)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging extable/extable (24bf9bdef929 module.h: remove extable.h include now users have migrated)
Merging akpm-current/current (f40364e40a57 ipc/sem: add hysteresis)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs: add i_blocksize()
Applying: truncate: use i_blocksize()
Applying: nilfs2: use nilfs_btree_node_size()
Applying: nilfs2: use i_blocksize()
Applying: Reimplement IDR and IDA using the radix tree
Applying: idr: support storing NULL in the IDR
Applying: reimplement-idr-and-ida-using-the-radix-tree-support-storing-null-in-the-idr-checkpatch-fixes
Applying: mm: merge fixup for "fix use-after-free in shadow node shrinker"
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_probe_helper.c
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
Applying: scripts/spelling.txt: add some typo-words
Applying: lib/vsprintf.c: remove %Z support
Applying: checkpatch: warn when formats use %Z and suggest %z
Applying: checkpatchpl-warn-against-using-%z-fix
Applying: mm: add new mmgrab() helper
Applying: mm: add new mmget() helper
Applying: mm: use mmget_not_zero() helper
Applying: mm: clarify mm_struct.mm_{users,count} documentation
Merging akpm/master (c35aea4a9cca mm: clarify mm_struct.mm_{users,count} documentation)
