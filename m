From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 24
Date: Fri, 24 Mar 2017 17:08:09 +1100
Message-ID: <20170324170809.0f7682a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [103.22.144.67] ([103.22.144.67]:41481 "EHLO ozlabs.org"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1751235AbdCXGI4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Mar 2017 02:08:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170323:

The audit tree gained a conflict against Linus' tree.

The leds tree gained a conflict against the drivers-x86 tree.

The char-misc tree changed its conflict against the tpmdd tree.

The akpm-current tree gained conflicts against the tip tree.

The akpm tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 4622
 5222 files changed, 380193 insertions(+), 88208 deletions(-)

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

I am currently merging 254 trees (counting Linus' and 37 trees of bug
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
Merging origin/master (d038e3dcfff6 Merge tag 'sound-4.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (b334e19ae938 Kbuild: use cc-disable-warning consistently for maybe-uninitialized)
Merging arc-current/for-curr (814a585038e3 ARCv2: make unimplemented vectors as no-ops rather than halt core)
Merging arm-current/fixes (a1016e94cce9 ARM: wire up statx syscall)
Merging m68k-current/for-linus (e3b1ebd67387 m68k: Wire up statx)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (cc638a488a52 gcc-plugins: update architecture list in documentation)
Merging sparc/master (f8e6859ea9d0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (d038e3dcfff6 Merge tag 'sound-4.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging ipsec/master (72ef9c4125c7 dccp: fix memory leak during tear-down of unsuccessful connection request)
Merging netfilter/master (f83bf8da1135 netfilter: nfnl_cthelper: Fix memory leak)
Merging ipvs/master (5371bbf4b295 net: bcmgenet: Do not suspend PHY if Wake-on-LAN is enabled)
Merging wireless-drivers/master (6be3b6cce1e2 ath10k: fix incorrect wlan_mac_base in qca6174_regs)
Merging mac80211/master (ea90e0dc8cec nl80211: fix dumpit error path RTNL deadlocks)
Merging sound-current/for-linus (3f307834e695 ALSA: hda - Adding a group of pin definition to fix headset problem)
Merging pci-current/for-linus (9abb27c7594a PCI: thunder-pem: Add legacy firmware support for Cavium ThunderX host controller)
Merging driver-core.current/driver-core-linus (966fa72a716c kernfs: Check KERNFS_HAS_RELEASE before calling kernfs_release_file())
Merging tty.current/tty-linus (a4a3e061149f tty: fix data race in tty_ldisc_ref_wait())
Merging usb.current/usb-linus (fd290e7096bd Merge tag 'usb-serial-4.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (25cd9721c2b1 usb: gadget: f_hid: fix: Don't access hidg->req without spinlock held)
Merging usb-serial-fixes/usb-linus (436ecf5519d8 USB: serial: qcserial: add Dell DW5811e)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (1a09b6a7c10e phy: qcom-usb-hs: Add depends on EXTCON)
Merging staging.current/staging-linus (43c49938bf72 Merge tag 'iio-fixes-for-4.11c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (5c1724c42dc1 Merge tag 'extcon-fixes-for-4.11-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-linus)
Merging input-current/for-linus (47e6fb4212d0 Input: ALPS - fix trackstick button handling on V8 devices)
Merging crypto-current/master (8c75704ebcac hwrng: geode - Revert managed API changes)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (65b1adebfe43 vfio: Rework group release notifier warning)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (590379aef2e3 drm/i915: make context status notifier head be per engine)
Merging drm-misc-fixes/for-linux-next-fixes (12ffed96d436 drm/fb-helper: Allow var->x/yres(_virtual) < fb->width/height again)
Merging kbuild/for-next (c42342902706 Merge branch 'misc' into for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (2bc6cdda1e32 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (a0dbe84dd5dd ARM: SoC: Document merges)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r7s72100.dtsi
Merging amlogic/for-next (c5fea9e57900 Merge branch 'v4.12/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (982b07d2b5f3 Merge tag 'at91-ab-4.11-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (7ea6e490ba7f Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e614bd772486 Merge branch 'zte/drivers' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (69cbc9086459 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (8c8c9d750fc0 Merge branch 'omap-for-v4.12/dt-v2' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (a844f941617c Merge tag 'qcom-arm64-for-4.11-2' into final-for-4.11)
Merging renesas/next (d6403e9aaf96 Merge branches 'arm64-dt-for-v4.12' and 'dt-for-v4.12' into next)
Merging rockchip/for-next (7beee4accce2 Merge branch 'v4.12-armsoc/dts64-symlinks' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (ece32e531453 Merge branch 'next/dt' into for-next)
Merging tegra/for-next (cc516494e180 Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (29d981217a5d arm64: drop unnecessary newlines in show_regs())
Merging clk/clk-next (f8ba2d68e54f clk: rockchip: Make uartpll a child of the gpll on rk3036)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (3dfe33020ca8 m68k/sun3: Remove dead code in paging_init())
Merging m68knommu/for-next (97da3854c526 Linux 4.11-rc3)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (0575bbdbce03 MIPS: math-emu: Fix BC1EQZ and BC1NEZ condition handling)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (c470abd4fde4 Linux 4.10)
Merging powerpc/next (c7e790c5f4c3 powerpc/64s: POWER8 add missing machine check definitions)
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (0b7bb6af1d73 s390/facilities: get rid of __ASSEMBLY__ in facility header file)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (ec59c4ad070d Merge branch 'xtensa-boot' into xtensa-for-next)
Merging fscrypt/master (94840e3c802d fscrypt: eliminate ->prepare_context() operation)
CONFLICT (content): Merge conflict in fs/crypto/keyinfo.c
Merging befs/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (e162345e07e1 Merge branch 'for-next-next-v4.12-20170314' into for-next-20170314)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
Merging ceph/master (633ee407b9d1 libceph: force GFP_NOIO for socket allocations)
Merging cifs/for-next (70c1da060b51 cifs: remove unused code)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (ab4949640d66 reiserfs: avoid a -Wmaybe-uninitialized warning)
Merging ext4/dev (14ae5f6a5dbe jbd2: don't leak memory if setting up journal fails)
Merging f2fs/dev (1f0207135830 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9a87ad3da905 fuse: release: private_data cannot be NULL)
Merging gfs2/for-next (cc963a11b67b GFS2: Temporarily zero i_no_addr when creating a dinode)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (97da3854c526 Linux 4.11-rc3)
Merging nfsd/nfsd-next (4544f5d6f165 uapi: fix linux/nfsd/cld.h userspace compilation errors)
Merging orangefs/for-next (e98bdb3059cb Merge tag 'v4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into for-next)
Merging overlayfs/overlayfs-next (b1eaa950f7e9 ovl: lockdep annotate of nested stacked overlayfs inode lock)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (8d242e932fb7 xfs: remove XFS_ALLOCTYPE_ANY_AG and XFS_ALLOCTYPE_START_AG)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (9e9c5ba8bd70 Merge branch 'work.statx' into for-next)
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in fs/proc/base.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (d9c23523ed98 printk: drop call_console_drivers() unused param)
Merging pci/next (d0ec4e67c924 Merge branch 'pci/switchtec' into next)
Merging pstore/for-next/pstore (eec50d76a6ee pstore: Drop needless inode lock during population)
Merging hid/for-next (aa4f835b1fa5 Revert "HID: Accutouch: Add driver for ELO Accutouch 2216 USB Touchscreens")
Merging i2c/i2c/for-next (346e400cfceb i2c: thunderx: ACPI support for clock settings)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (95e15d573eaa hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list)
Merging jc_docs/docs-next (3f816bac24f0 Documentation: device-mapper: cache.txt: Fix typos)
Merging v4l-dvb/master (8bc4793bd083 [media] soc-camera: fix rectangle adjustment in cropping)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (6f9655b1b81f drivers/video: Convert remaining uses of pr_warning to pr_warn)
Merging pm/linux-next (00fd799df64a Merge branches 'pm-cpufreq-fixes', 'pm-cpufreq-sched-fixes', 'intel_pstate-fixes' and 'pm-cpuidle-fixes' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (6fefe19f5836 Merge branches 'thermal-core', 'thermal-soc', 'thermal-intel' and 'ida-conversion' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (6f359f99b8c2 qedf: fix wrong le16 conversion)
CONFLICT (content): Merge conflict in kernel/bpf/hashtab.c
CONFLICT (content): Merge conflict in drivers/net/hyperv/netvsc.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/genet/bcmmii.c
Merging ipsec-next/master (62a9fa01add8 Merge branch 'bcmgenet-add-support-for-GENETv5')
Merging netfilter-next/master (592d42ac7fd3 Merge branch 'qed-IOV-cleanups')
Merging ipvs-next/master (3c679cba588a ipvs: Document sysctl pmtu_disc)
Merging wireless-drivers-next/master (41977e86c984 rt2x00: add support for MT7620)
Merging bluetooth/master (3c66d1c7ed41 Merge branch 'mlxsw-cosmetics')
Merging mac80211-next/master (335d534938d3 nl80211: Use signed function for a signed variable)
Merging rdma/for-next (9294000d6d89 IB/srp: Drain the send queue before destroying a QP)
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (4ca8c1d4979c mtd: nand: hynix: Fix an error code in init)
Merging spi-nor/next (9f3cd4537da0 drivers mtd: spi-nor: add Macronix MX25Ux033E and MX25Ux035 variants)
Merging crypto/master (28845b079b96 MAINTAINERS: Add maintianer entry for crypto/s5p-sss)
Merging drm/drm-next (65d1086c4479 BackMerge tag 'v4.11-rc3' into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_csr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_context.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/scheduler.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/cmd_parser.c
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (2e70b8c6bf00 drm/i915/execlists: Relax the locked clear_bit(IRQ_EXECLIST))
Merging drm-tegra/drm/tegra/for-next (0725ed651da1 drm/tegra: Add tiling FB modifiers)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/drm.c
Merging drm-misc/for-linux-next (e448054b5c63 drm/scdc: declare drm_scdc_get_scrambling_status)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (6247d63e365d drm/msm/hdmi: redefinitions of macros not required)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (751c5fae1940 drm: mali-dp: Fix smart layer not going to composition)
Merging sunxi/sunxi/for-next (b76f2725b9b6 Merge branches 'sunxi/dt-for-4.12' and 'sunxi/fixes-for-4.11' into sunxi/for-next)
Merging kspp/for-next/kspp (9b5e50a16f07 security/Kconfig: further restrict HARDENED_USERCOPY)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (a16fbb85c78a ALSA: hda/ca0132: Remove double parentheses)
Merging sound-asoc/for-next (702f4e84ff59 Merge remote-tracking branches 'asoc/topic/wm8903' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (5bd933fe4481 module: set .init_array alignment to 8)
Merging input/next (996b9eedd061 Input: synaptics - do not mix logical and bitwise operations)
Merging block/for-next (7a88fa191944 block: make nr_iovecs unsigned in bio_alloc_bioset())
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (bc48c6d5690c Merge branch 'dm-4.11' into dm-next)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (1af805093f92 mmc: sdio: improve mmc_io_rw_extended)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4ad23a976413 MD: use per-cpu counter for writes_pending)
Merging mfd/for-mfd-next (02fe7875ecf0 mfd: tc6393xb: Make use of raw_spinlock variants)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (5782dcb20370 power: supply: bq24190_charger: Don't spam the logs on charger plug / unplug)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (a6a01bd92b39 Merge remote-tracking branch 'regulator/topic/pfuze100' into regulator-next)
Merging security/next (ca97d939db11 security: mark LSM hooks as __ro_after_init)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (9c312e79d6af selinux: Delete an unnecessary variable initialisation in range_read())
Merging tpmdd/next (8c0fb8db7c48 tpm: make check_locality return bool)
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (41346dad4de0 Merge branches 'x86/vt-d', 'arm/core', 'core' and 'iommu/fixes' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d9d84780f17c vfio: fix a typo in comment of function vfio_pin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (36fe46d172e5 audit: normalize NETFILTER_PKT)
CONFLICT (content): Merge conflict in net/netfilter/xt_AUDIT.c
Merging devicetree/for-next (0634c2958927 of: Add function for generating a DT modalias with a newline)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (fff0ab49f2a4 Merge remote-tracking branches 'spi/topic/spidev', 'spi/topic/spidev-test', 'spi/topic/sunxi', 'spi/topic/test' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (8dd40ffe52a2 Merge branch 'x86/vdso')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (cd1be315ac97 EDAC, pnd2_edac: Fix !EDAC_DEBUG build)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (65a50c656276 ftrace/graph: Add ftrace_graph_max_depth kernel parameter)
Merging rcu/rcu/next (a4b037286900 srcu: Merge ->srcu_state into ->srcu_gp_seq)
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (97da3854c526 Linux 4.11-rc3)
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (bcd3bb63dbc8 KVM: PPC: Book3S HV: Disable HPT resizing on POWER9 for now)
Merging kvms390/next (4e0b1ab72b8a KVM: s390: gs support for kvm guests)
Merging xen-tip/linux-next (d825adb48cf9 xenbus: Remove duplicate inclusion of linux/init.h)
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (b68049014a82 platform/x86: silead_dmi: Add entry for Insyde 7W tablets)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (f4363d810767 leds: lp3952: Use 'if (ret)' pattern)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging ipmi/for-next (ea6200e84182 Merge branch 'core-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging driver-core/driver-core-next (7e040726850a eventpoll.h: add missing epoll event masks)
Merging usb/usb-next (5370860a1f0e USB: usblp: refactor endpoint retrieval)
CONFLICT (content): Merge conflict in drivers/usb/gadget/udc/pch_udc.c
Merging usb-gadget/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-serial/usb-next (2ac8fc51ddf1 USB: serial: whiteheat: simplify endpoint check)
Merging usb-chipidea-next/ci-for-usb-next (4f4555cfe704 usb: chipidea: udc: update gadget state after bus resume)
Merging phy-next/next (fe0134d07127 phy: phy-exynos-pcie: make it explicitly non-modular)
Merging tty/tty-next (acbdad8dd1ab serial: 8250_dw: simplify optional reset handling)
CONFLICT (content): Merge conflict in drivers/tty/tty_ldisc.c
Merging char-misc/char-misc-next (392910cf3f8a drivers, firewire: convert fw_node.ref_count from atomic_t to refcount_t)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Merging extcon/extcon-next (0ac6cbe27be3 extcon: palmas: Don't miss GPIO events during suspend/resume)
Merging staging/staging-next (b0fe8f7b9b5a staging: rtl8192e: Fix issues reported by checkpatch.pl)
Merging mux/for-next (9920ed1461bb mux: core: fix error handling in devm_mux_chip_alloc)
Merging slave-dma/next (4bc9bf4ef86e Merge branch 'topic/xilinx' into next)
Merging cgroup/for-next (b4eba5f81324 Merge branch 'for-4.11-fixes' into for-next)
Merging scsi/for-next (ebb5a94667b4 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (33bd712be7d2 scsi: esas2r: Remove redundant NULL check on buffer)
Merging target-updates/for-next (98fec7793703 iscsi-target: Propigate queue_data_in + queue_status errors)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (9332bd9ef480 Merge branch 'for-4.12' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (80363894995b virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (acac0e697c5e Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/input/misc/soc_button_array.c
Merging pinctrl/for-next (fec6696b0769 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (786b1f7c95d7 Merge branch 'pinctrl-next' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (38b0a526ec33 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (040757f738e1 ucount: Remove the atomicity from ucount->count)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (10517429b5ac livepatch: make klp_mutex proper part of API)
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.h
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
CONFLICT (content): Merge conflict in arch/s390/include/asm/thread_info.h
Merging coresight/next (6de8ad2f92ea coresight: Fixes coresight DT parse to get correct output port ID.)
Merging rtc/rtc-next (65e9e65cebbe rtc: cpcap: kfreeing devm allocated memory)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (52084f89b38c device-dax: fix debug output typo)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (20518a1747d5 initramfs: use vfs_stat/lstat directly)
CONFLICT (content): Merge conflict in arch/x86/include/asm/atomic64_64.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/atomic.h
Applying: linux-next-rejects
Applying: fix for bad merge fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm: introduce kv[mz]alloc helpers
Applying: mm: introduce kv[mz]alloc helpers - f2fs fix up
Applying: mm: support __GFP_REPEAT in kvmalloc_node for >32kB
Applying: lib/rhashtable.c: simplify a strange allocation pattern
Applying: net/ipv6/ila/ila_xlat.c: simplify a strange allocation pattern
Applying: fs/xattr.c: zero out memory copied to userspace in getxattr
Applying: treewide: use kv[mz]alloc* rather than opencoded variants
Applying: net: use kvmalloc with __GFP_REPEAT rather than open coded variant
Applying: drivers/md/dm-ioctl.c: use kvmalloc rather than opencoded variant
Applying: drivers/md/bcache/super.c: use kvmalloc
Applying: mm, vmalloc: use __GFP_HIGHMEM implicitly
Applying: scripts/spelling.txt: add "memory" pattern and fix typos
Applying: scripts/spelling.txt: Add regsiter -> register spelling mistake
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: treewide: move set_memory_* functions away from cacheflush.h
Applying: arm: use set_memory.h header
Applying: arm64: use set_memory.h header
Applying: s390: use set_memory.h header
Applying: x86: use set_memory.h header
Applying: agp: use set_memory.h header
Applying: drm: use set_memory.h header
Applying: drm-use-set_memoryh-header-fix
Applying: drivers/hwtracing/intel_th/msu.c: use set_memory.h header
Applying: drivers/watchdog/hpwdt.c: use set_memory.h header
Applying: include/linux/filter.h: use set_memory.h header
Applying: kernel/module.c: use set_memory.h header
Applying: kernel/power/snapshot.c: use set_memory.h header
Applying: alsa: use set_memory.h header
Applying: drivers/misc/sram-exec.c: use set_memory.h header
Applying: drivers/video/fbdev/vermilion/vermilion.c: use set_memory.h header
Applying: drivers/staging/media/atomisp/pci/atomisp2: use set_memory.h
Applying: treewide: decouple cacheflush.h and set_memory.h
Applying: x86/atomic: move __arch_atomic_add_unless out of line
CONFLICT (content): Merge conflict in arch/x86/include/asm/atomic.h
Applying: x86-atomic-move-__atomic_add_unless-out-of-line-fix
Applying: kernel/sched/fair.c: uninline __update_load_avg()
Applying: kref: remove WARN_ON for NULL release functions
Applying: drivers/scsi/megaraid: remove expensive inline from megasas_return_cmd
Applying: include/linux/uaccess.h: remove expensive WARN_ON in pagefault_disabled_dec
Applying: tracing: move trace_handle_return() out of line
Merging akpm/master (ff4eb5d0c322 tracing: move trace_handle_return() out of line)
