From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 24
Date: Tue, 24 Jan 2017 16:46:11 +1100
Message-ID: <20170124164611.779759c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34989 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbdAXFqO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Jan 2017 00:46:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170123:

The net-next tree gained a conflict against the net tree.

The drm tree gained a build failure so I used the version from
next-20170123.

The mfd tree gained a conflict against the arm-soc tree.

The kselftest tree gained a conflict against the net-next tree.

Non-merge commits (relative to Linus' tree): 4775
 5453 files changed, 177814 insertions(+), 102513 deletions(-)

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

I am currently merging 251 trees (counting Linus' and 36 trees of bug
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
Merging origin/master (a4685d2f58e2 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (7a308bb3016f Linux 4.10-rc5)
Merging arm-current/fixes (90f92c631b21 ARM: 8613/1: Fix the uaccess crash on PB11MPCore)
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (178f358208ce powerpc: Ignore reserved field in DCSR and PVR reads and writes)
Merging sparc/master (5d0e7705774d sparc: Fixed typo in sstate.c. Replaced panicing with panicking)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (4078b76cac68 net: dsa: Check return value of phy_connect_direct())
Merging ipsec/master (4e5da369df64 Documentation/networking: fix typo in mpls-sysctl)
Merging netfilter/master (e5072053b096 netfilter: conntrack: refine gc worker heuristics, redux)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (92549cdc288f iwlwifi: fix kernel crash when unregistering thermal zone)
Merging mac80211/master (e42be643096e mac80211: don't try to sleep in rate_control_rate_init())
Merging sound-current/for-linus (6cf4569ce356 Merge tag 'asoc-fix-v4.10-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (ea2a7fb12093 Revert "PCI: Add runtime PM support for PCIe ports")
Merging driver-core.current/driver-core-linus (49def1853334 Linux 4.10-rc4)
Merging tty.current/tty-linus (49def1853334 Linux 4.10-rc4)
Merging usb.current/usb-linus (488dc164914f xhci: remove WARN_ON if dma mask is not set for platform devices)
Merging usb-gadget-fixes/fixes (efe357f4633a usb: dwc2: host: fix Wmaybe-uninitialized warning)
Merging usb-serial-fixes/usb-linus (24d615a694d6 USB: serial: qcserial: add Dell DW5570 QDL)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (9579c4dc2129 Merge tag 'iio-fixes-for-4.10b' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (49def1853334 Linux 4.10-rc4)
Merging input-current/for-linus (1c3415a06b10 Input: elants_i2c - avoid divide by 0 errors on bad touchscreen data)
Merging crypto-current/master (11e3b725cfc2 crypto: arm64/aes-blk - honour iv_out requirement in CBC and CTR modes)
Merging ide/master (da095587e6be Revert "ide: Fix interface autodetection in legacy IDE driver (trial #2)")
Merging vfio-fixes/for-linus (94a6fa899d2c vfio/type1: Remove pid_namespace.h include)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (3bfdfdcbce27 drm/i915: Ignore bogus plane coordinates on SKL when the plane is not visible)
Merging drm-misc-fixes/for-linux-next-fixes (7e9081c5aac7 drm/fence: fix memory overwrite when setting out_fence fd)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (01c4a81b2c85 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (73f9e92ed3d0 ARM: SoC: Document merges)
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
Merging amlogic/for-next (61e787270fde Merge v4.11/dt64)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (3d928ca85412 Merge branch 'at91-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (8d6e1b09237b Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (1393f73bb898 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (cdc8c5c16f57 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (3a476348dbee Merge branch 'omap-for-v4.11/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (ad240de8a360 Merge branch 'dts-for-4.11' into all-for-4.11)
Merging renesas/next (41239dca16e6 Merge branches 'arm64-dt-for-v4.11' and 'dt-for-v4.11' into next)
Merging rockchip/for-next (0aab64671deb Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (7e7428702993 Merge branch 'next/dt64' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (829d2bd13392 arm64: entry-ftrace.S: avoid open-coded {adr,ldr}_l)
Merging clk/clk-next (8076e04441f2 clk: stm32f7: Introduce stm32f7 clocks for STM32F746 boards)
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
Merging mips/mips-for-linux-next (82e014238f8a MIPS: Avoid old-style declaration)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (5de769bbfdfc arch/openrisc/lib/memcpy.c: use correct OR1200 option)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (7ce7d89f4883 Linux 4.10-rc1)
Merging fsl/next (baae856ebdee powerpc/fsl/dts: add FMan node for t1042d4rdb)
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
Merging btrfs-kdave/for-next (640764eb528b Merge branch 'for-next-next-v4.11-20170120' into for-next-20170120)
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
Merging gfs2/for-next (b63f5e84826b GFS2: Wake up io waiters whenever a flush is done)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (5cf7a0f3442b Merge tag 'nfs-for-4.10-3' of git://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging nfsd/nfsd-next (799322e05df0 nfsd: opt in to labeled nfs per export)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (4c7d0c9cb713 ovl: fix possible use after free on redirect dir lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (fd29f7af75b7 xfs: fix xfs_mode_to_ftype() prototype)
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
Merging hid/for-next (8098418ae7c3 Merge branch 'for-4.11/wacom' into for-next)
Merging i2c/i2c/for-next (701dc207bf55 i2c: piix4: Avoid race conditions with IMC)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (68f0c8c92395 hwmon: (lm70) Add support for TI TMP122/124)
Merging jc_docs/docs-next (43d8808b0820 Documentation: cpuset: Fix 'cpuset.tasks' -> 'tasks')
Merging v4l-dvb/master (5dd2470bfddb Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (a0a74270efaa video: fbdev: wm8505fb use permission-specific DEVICE_ATTR variants)
Merging pm/linux-next (10e335ed42b3 Merge branches 'acpica', 'pm-cpufreq' and 'pm-sleep' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (e4004621061f Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (49394f8886af Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (f1225ee4c8fc swiotlb-xen: update dev_addr after swapping pages)
Merging net-next/master (2acc76cbb7b7 Merge branch 'bpf-lpm')
CONFLICT (content): Merge conflict in net/mpls/af_mpls.c
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (eb758c8864d4 esp: Introduce a helper to setup the trailer)
Merging netfilter-next/master (1a28ad74ebd8 netfilter: nf_tables: eliminate useless condition checks)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (106e0deca1ac rtlwifi: rtl8192cu: Convert driver to use common macros)
Merging bluetooth/master (0e40f4c9593b tcp: accept RST for rcv_nxt - 1 after receiving a FIN)
Merging mac80211-next/master (c88215d7050f cfg80211: Fix documentation for connect result)
Merging rdma/for-next (102c5ce082f5 RDMA/cma: use cached port state when bind loopback)
Merging rdma-leon/rdma-next (455f909d8a49 Merge branch 'topic/rxe-fixes-for-4.11' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging nand/nand/next (9018bf842d4e mtd: nand: fsmc: remove stale non-DT probe path)
Merging crypto/master (7dede913fc2a crypto: vmx - disable preemption to enable vsx in aes_ctr.c)
Merging drm/drm-next (f0493e653f96 drm/mgag200: Added support for the new device G200eH3)
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
$ git reset --hard HEAD^
Merging next-20170123 version of drm
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
[master dad1d40b940b] next-20170123/drm
Merging drm-panel/drm/panel/for-next (327bc443416d drm/panel: Constify device node argument to of_drm_find_panel())
Merging drm-intel/for-linux-next (b403c8feaf48 drm/i915: Remove BXT TDL state w/a)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (c7afee63d1c9 drm/exynos: Remove Kconfig deps for FIMD and DECON7)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (95cc3a9501ff drm: mali-dp: Rename malidp_input_format to malidp_pixel_format)
Merging sunxi/sunxi/for-next (9181f40cede2 Merge branch 'sunxi/clk-for-4.11' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
Merging kspp/for-next/kspp (e9569a422c27 Merge branch 'for-next/gcc-plugin/structleak' into for-next/gcc-plugins)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (9eb5d0e635eb ALSA: hda/realtek - Add support headphone Mic for ALC221 of HP platform)
Merging sound-asoc/for-next (64240ade1b71 Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (2fc42a1bbbc4 livepatch/module: print notice of TAINT_LIVEPATCH)
Merging input/next (cefb26d4b37c Input: touchscreen - drop unnecessary calls to input_set_drvdata)
Merging block/for-next (79f6d4b71580 Merge branch 'for-4.11/block' into for-next)
Merging lightnvm/for-next (fa3742367ee5 lightnvm: add ioctls for vector I/Os)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (c9e4df8750e4 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4bc698b9fe55 md/raid5: move comment of fetch_block to right location)
Merging mfd/for-mfd-next (666114db60a6 mfd: mt6397: Add MT6323 LED support into MT6397 driver)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stm32f429.dtsi
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (a1b94355ea3f power: supply: bq2415x: check for NULL acpi_id to avoid null pointer dereference)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (1f57ef5dc717 Merge remote-tracking branches 'regulator/topic/arizona', 'regulator/topic/qcom-smd' and 'regulator/topic/supplies' into regulator-next)
Merging security/next (c659af78eb7b tpm: Check size of response before accessing data)
Merging integrity/next (07a77aadc4e8 ima: fix ima_d_path() possible race with rename)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (3a2f5a59a695 security,selinux,smack: kill security_task_wait hook)
Applying: selinux: merge fix for "smc: establish new socket family"
Merging tpmdd/next (c659af78eb7b tpm: Check size of response before accessing data)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (fce794089d60 Merge branches 'iommu/fixes' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (62bc306e2083 audit: log 32-bit socketcalls)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (a51741ebe131 Documentation: usb: fix wrong documentation paths)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (e38103cebb33 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/slave' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (0874170baf55 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in security/apparmor/include/apparmor.h
Applying: locking/atomic, kref: merge fixup for code movement
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (127c1225bf89 EDAC, sb_edac: Get rid of ->show_interleave_mode())
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (b9b0c831bed2 ftrace: Convert graph filter to use hash tables)
Merging rcu/rcu/next (e729e8799ebb rcu: Semicolon inside RCU_TRACE() for tree.c)
Applying: smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (a17f32270af1 kvm: x86: Expose Intel VPOPCNTDQ feature to guest)
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (8321055a897d Merge tag 'kvm-s390-master-4.10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kernelorgnext)
Merging xen-tip/linux-next (da72ff5bfcb0 partially revert "xen: Remove event channel notification through Xen PCI platform device")
Merging percpu/for-next (aaf0f2fa6828 percpu_counter: percpu_counter_hotcpu_callback() cleanup)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (7b81271210d8 platform/x86: thinkpad_acpi: Add support for status LED)
CONFLICT (content): Merge conflict in drivers/platform/x86/fujitsu-laptop.c
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (4e552c8cb5bc leds: add LED_ON brightness as boolean value)
Merging ipmi/for-next (c5afee1b0dfc acpi:ipmi: Make IPMI user handler const)
Merging driver-core/driver-core-next (64e90a8acb85 Introduce STATIC_USERMODEHELPER to mediate call_usermodehelper())
Merging tty/tty-next (aa75941ca1de serial: 8250_omap: Remove rx_dma_broken flag)
Merging usb/usb-next (afa197e3cb24 dt-bindings: mt8173-mtu3: add reference clock)
Merging usb-gadget/next (591c8004dd43 usb: gadget: f_fs: Accept up to 30 endpoints.)
Merging usb-serial/usb-next (2eee05020a0e USB: serial: opticon: fix CTS retrieval at open)
Merging usb-chipidea-next/ci-for-usb-next (30a9566a4f60 usb: chipidea: usb2: delete the redundant setting default DMA mask code)
Merging phy-next/next (a8df2768c2ed drivers: phy: constify phy_ops structures)
Merging staging/staging-next (1c5fa1c7dbff staging: media: lirc: use new parport device model)
Merging char-misc/char-misc-next (8e27a236312c Drivers: hv: vmbus: Cleanup hyperv_vmbus.h)
Merging extcon/extcon-next (86d6cda68f37 extcon: Modify the name of EXTCON_USB_HOST connector)
Merging slave-dma/next (7919f00e4fdf Merge branch 'topic/zx' into next)
Merging cgroup/for-next (e055b0e58d99 Merge branch 'for-4.11' into for-next)
Merging scsi/for-next (b32d9f752e17 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (13c599069130 scsi: hisi_sas: decrease running_req in hisi_sas_slot_task_free())
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (300af14bdb28 qla2xxx: Disable out-of-order processing by default in firmware)
Merging libata/for-next (731a5a04270f Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c06599d4b855 virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (5956dd81ac18 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (ffd6ce2f3b20 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (2a15343f1e82 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (e52d5f1c5221 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (880a38547ff0 userns: Make ucounts lock irq-safe)
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
Merging rtc/rtc-next (1d70ba3bfb30 rtc: stm32: fix comparison warnings)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (1f19b983a887 libnvdimm, namespace: fix pmem namespace leak, delete when size set to zero)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (d56e4def96c2 ipc/sem: add hysteresis)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs: add i_blocksize()
Applying: truncate: use i_blocksize()
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
Merging akpm/master (7637ce9e8800 mm: clarify mm_struct.mm_{users,count} documentation)
