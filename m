From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 31
Date: Tue, 31 Jan 2017 18:11:43 +1100
Message-ID: <20170131181143.72b8dd31@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750896AbdAaHM3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 02:12:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170130:

New tree: idr

Dropped tree: vfs-miklos (build failure and out of date)

The vfs-miklos tree gained a conflict against the overlayfs tree and a
build failure, so I just dropped it for today.

The v4l-dvb tree gained a build failure so I used the version from
next-20170130.

The pm tree gained a conflict against the mips tree.

The net-next tree gained conflicts against the net tree.

The block tree lost its build failure.

The pinctrl tree gained a conflict against the arm-soc tree.

Non-merge commits (relative to Linus' tree): 6025
 6756 files changed, 246406 insertions(+), 124169 deletions(-)

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

I am currently merging 254 trees (counting Linus' and 36 trees of bug
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
Merging origin/master (751321b3dd50 Merge tag 'rtc-4.10-2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (566cf877a1fc Linux 4.10-rc6)
Merging arm-current/fixes (228dbbfb5d77 ARM: 8643/3: arm/ptrace: Preserve previous registers for short regset write)
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (a0615a16f7d0 powerpc/mm: Use the correct pointer when setting a 2MB pte)
Merging sparc/master (5d0e7705774d sparc: Fixed typo in sstate.c. Replaced panicing with panicking)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (040587af3122 net/sched: cls_flower: Correct matching on ICMPv6 code)
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
Merging drm-intel-fixes/for-linux-next-fixes (566cf877a1fc Linux 4.10-rc6)
Merging drm-misc-fixes/for-linux-next-fixes (e6e7b48b295a drm: Don't race connector registration)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (1ba318e23204 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (1788019881e3 ARM: SoC: Document merges)
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
Merging amlogic/for-next (dca8057e0936 Merge v4.11/dt64)
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (e514f82c67c1 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (8d6e1b09237b Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (57aba12f97c2 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (115a6d23681c Merge branch 'mvebu/dt64' into mvebu/for-next)
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
Merging m68knommu/for-next (bc53b7e567ab m68k/defconfig: amcore board defconfig tuning)
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
Merging f2fs/dev (9b0d4b59b911 f2fs: declare missing static function)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (210675270caa fuse: fix time_to_jiffies nsec sanity check)
Merging gfs2/for-next (aacee72061a3 GFS2: Reduce contention on gfs2_log_lock)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (566cf877a1fc Linux 4.10-rc6)
Merging nfsd/nfsd-next (42e24662a806 nfsd: special case truncates some more)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (97e147358bea vfs: wrap write f_ops with file_{start,end}_write())
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
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
$ git reset --hard HEAD^
Merging printk/for-next (0e91b7706038 printk: drop call_console_drivers() unused param)
Merging pci/next (83a96ebd0efa Merge branch 'pci/host-thunder' into next)
Merging pstore/for-next/pstore (0c744ea4f77d Linux 4.10-rc2)
Merging hid/for-next (8ffbb1ee31d9 Merge branch 'for-4.10/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f4d9f6fbbf57 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (248c3398aae1 hwmon: Relax name attribute validation for new APIs)
Merging jc_docs/docs-next (2069889ff78c docs/zh_CN: Add coding-style into docs build system)
Merging v4l-dvb/master (61e0654cf079 Merge branch 'patchwork' into to_next)
$ git reset --hard HEAD^
Merging next-20170130 version of v4l-dvb
Merging fbdev/fbdev-for-next (561eb9d09a93 fbdev: omap/lcd: Make callbacks optional)
Merging pm/linux-next (688fb029a443 Merge branch 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in arch/mips/configs/lemote2f_defconfig
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (7b09ae6042cd Merge branches 'ida-conversion' and 'for-rc' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (f1225ee4c8fc swiotlb-xen: update dev_addr after swapping pages)
Merging net-next/master (63c190429020 Merge branch 'ESPRESSObin-ethernet')
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/cadence/macb.h
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (1995876a06bc xfrm: Add a dummy network device for napi.)
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
Merging nand/nand/next (07f76443ef81 mtd: nand: mediatek: remove redundant dev_err call in mtk_nfc_probe())
Merging spi-nor/next (8bb6059f038c Documentation: mtk-quadspi: update DT bindings)
Merging crypto/master (7dede913fc2a crypto: vmx - disable preemption to enable vsx in aes_ctr.c)
Merging drm/drm-next (a5b2b6ebf34b drm/sti: Fix compilation failure for drm_framebuffer.pixel_format)
CONFLICT (content): Merge conflict in include/drm/drm_connector.h
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_connector.c
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (8adabb8928bc drm/i915: Pevent copying uninitialised garbage into vma->ggtt_view)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (376e5f5449d1 MAINTAINERS: add dma-fence* files to Sync File maintainership)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (83d642ee6dbe drm: mali-dp: fix stride setting for multi-plane formats)
Merging sunxi/sunxi/for-next (e24f5ead1d61 Merge branch 'sunxi/dt64-for-4.11' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
Merging kspp/for-next/kspp (e9569a422c27 Merge branch 'for-next/gcc-plugin/structleak' into for-next/gcc-plugins)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (287215e9c466 Merge branch 'topic/intel-lpe-audio' into for-next)
Merging sound-asoc/for-next (3b9a1add8e1c Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (7598d167df99 livepatch/module: print notice of TAINT_LIVEPATCH)
Merging input/next (f719315b52b5 Input: constify device_type structures)
Merging block/for-next (2b2cda014e59 Merge branch 'for-4.11/rq-refactor' into for-next)
Merging lightnvm/for-next (350e28c7e510 lightnvm: allow targets to use sysfs)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (2fb4d2ecbaa8 mmc: core/mmci: restore pre/post_req behaviour)
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
Merging tpmdd/next (f6513b2fa319 tpm: add securityfs support for TPM 2.0 firmware event log)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (2e6f524c8cea Merge branches 'iommu/fixes', 'arm/exynos', 'arm/smmu', 'arm/core' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (62bc306e2083 audit: log 32-bit socketcalls)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (a51741ebe131 Documentation: usb: fix wrong documentation paths)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (8d58e8f66f84 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/slave' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (5bf728f02218 Merge branch 'x86/platform')
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
Merging kvm-arm/next (9d93dc1c96ec arm/arm64: KVM: Get rid of KVM_MEMSLOT_INCOHERENT)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (ad53fe0decb9 Merge remote-tracking branch 'remotes/powerpc/topic/ppc-kvm' into kvm-ppc-next)
Merging kvms390/next (a8c39dd77cb9 KVM: s390: Add debug logging to basic cpu model interface)
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
Merging slave-dma/next (69a875aef693 Merge branch 'for-linus' into next)
Merging cgroup/for-next (769a3d317959 Merge branch 'for-4.11' into for-next)
Merging scsi/for-next (2340d775b189 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (13c599069130 scsi: hisi_sas: decrease running_req in hisi_sas_slot_task_free())
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (300af14bdb28 qla2xxx: Disable out-of-order processing by default in firmware)
Merging libata/for-next (428d57c1683a Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ec4537a7d64f pci: drop link_reset)
Merging rpmsg/for-next (5956dd81ac18 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (f334eae9c4e9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/staging/greybus/gpio.c
Merging pinctrl/for-next (2039834c86f3 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (4651209c75d1 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (68eb94f16227 proc: Better ownership of files for non-dumpable tasks in user namespaces)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (c440408cf690 random: convert get_random_int/long into get_random_u32/u64)
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
Merging idr/idr-4.11 (39272ecab724 radix-tree: Store a pointer to the root in each node)
Merging akpm-current/current (f40364e40a57 ipc/sem: add hysteresis)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs: add i_blocksize()
Applying: truncate: use i_blocksize()
Applying: nilfs2: use nilfs_btree_node_size()
Applying: nilfs2: use i_blocksize()
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
Applying: scripts/spelling.txt: add some typo-words
Applying: lib/vsprintf.c: remove %Z support
Applying: checkpatch: warn when formats use %Z and suggest %z
Applying: checkpatchpl-warn-against-using-%z-fix
Applying: mm: add new mmgrab() helper
Applying: mm: add new mmget() helper
Applying: mm: use mmget_not_zero() helper
Applying: mm: clarify mm_struct.mm_{users,count} documentation
Merging akpm/master (d5cd4249c55f mm: clarify mm_struct.mm_{users,count} documentation)
