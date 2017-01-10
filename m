From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 10
Date: Tue, 10 Jan 2017 14:58:31 +1100
Message-ID: <20170110145831.1b809ed7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932667AbdAJD6e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Jan 2017 22:58:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170109:

New tree: printk

The net-next tree gained a build failure for which I applied a merge
fix patch.

The selinux tree gained a build failure for which I applied a merge
fix patch.

The y2038 tree gained a conflict against the net-next tree.

Non-merge commits (relative to Linus' tree): 2345
 3043 files changed, 93416 insertions(+), 53455 deletions(-)

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

I am currently merging 250 trees (counting Linus' and 36 trees of bug
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
Merging origin/master (bd5d7428f5e5 Merge tag 'drm-fixes-for-v4.10-rc4' of git://people.freedesktop.org/~airlied/linux)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (e51d5d02f688 ARCv2: IRQ: Call entry/exit functions for chained handlers in MCIP)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (69973b830859 Linux 4.9)
Merging sparc/master (4bbc84ffd137 sparc: use symbolic names for tsb indexing)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (6bb629db5e7d tcp: do not export tcp_peer_is_proven())
Merging ipsec/master (4e5da369df64 Documentation/networking: fix typo in mpls-sysctl)
Merging netfilter/master (d896b3120b33 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (60f59ce02785 rtlwifi: rtl_usb: Fix missing entry in USB driver's private data)
Merging mac80211/master (eeb0d56fab4c mac80211: implement multicast forwarding on fast-RX path)
Merging sound-current/for-linus (e4f34cf6d591 Revert "ALSA: firewire-lib: change structure member with proper type")
Merging pci-current/for-linus (4931a6781f83 x86/PCI: Ignore _CRS on Supermicro X8DTH-i/6/iF/6F)
Merging driver-core.current/driver-core-linus (a121103c9228 Linux 4.10-rc3)
Merging tty.current/tty-linus (a121103c9228 Linux 4.10-rc3)
Merging usb.current/usb-linus (a121103c9228 Linux 4.10-rc3)
Merging usb-gadget-fixes/fixes (43aef5c2ca90 usb: gadget: Fix copy/pasted error message)
Merging usb-serial-fixes/usb-linus (55fa15b5987d USB: serial: ch341: fix baud rate and line-control handling)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (a121103c9228 Linux 4.10-rc3)
Merging char-misc.current/char-misc-linus (a121103c9228 Linux 4.10-rc3)
Merging input-current/for-linus (1c3415a06b10 Input: elants_i2c - avoid divide by 0 errors on bad touchscreen data)
Merging crypto-current/master (07825f0acd85 crypto: aesni - Fix failure when built-in with modular pcbc)
Merging ide/master (da095587e6be Revert "ide: Fix interface autodetection in legacy IDE driver (trial #2)")
Merging vfio-fixes/for-linus (c6ef7fd40edd vfio-mdev: fix non-standard ioctl return val causing i386 build fail)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (a121103c9228 Linux 4.10-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (f0a8b49c03d2 drm/bridge: analogix dp: Fix runtime PM state on driver bind)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (e5517c2a5a49 Linux 4.9-rc7)
Merging arm/for-next (49b05da80546 Merge branch 'drm-armada-devel' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (1b9ec8125882 Merge tag 'davinci-fixes-for-v4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci into fixes)
Merging amlogic/for-next (b21a5fc2bb8a Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (ec09fdf764ee Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (814ff7844e57 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (45f49b8d26ee Merge branch 'for_4.11/keystone_config' into next)
Merging mvebu/for-next (cc519d4df95e Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (5cf0d6f02b66 Merge branch 'omap-for-v4.11/omap1' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (bbf9c90768f9 Merge tag 'qcom-dts-for-4.10-2' into all-for-4.10-part2)
Merging renesas/next (0a704567b658 Merge branches 'fixes-for-v4.10', 'arm64-dt-for-v4.11', 'defconfig-for-v4.11', 'dt-for-v4.11' and 'soc-for-v4.11' into next)
Merging rockchip/for-next (a495d1894ed7 Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (d1f4cc403526 Merge branch 'next/dt64' into for-next)
Merging tegra/for-next (e8d16d40e269 Merge branch for-4.10/i2c into for-next)
Merging arm64/for-next/core (75037120e62b arm64: Disable PAN on uaccess_enable())
Merging clk/clk-next (cac53644aa06 clk: qcom: Add GCC_MSS_RESET support)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (a121103c9228 Linux 4.10-rc3)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (95eb33ae0ea2 MIPS: Fix printk continuations in cpu-bugs64.c)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (7c7808ce107d openrisc: prevent VGA console, fix builds)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (c6f6634721c8 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging fsl/next (baae856ebdee powerpc/fsl/dts: add FMan node for t1042d4rdb)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (a664736c4958 s390/topology: make "topology=off" parameter work)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (30b507051dd1 xtensa: update DMA-related Documentation/features entries)
Merging fscrypt/master (a5d431eff2e0 fscrypt: make fscrypt_operations.key_prefix a string)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (1041772e5c03 Merge branch 'for-next-next-4.10-20170106' into for-next-20170106)
Merging ceph/master (45ee2c1d6618 libceph: remove now unused finish_request() wrapper)
Merging cifs/for-next (7c0f6ba682b9 Replace <asm/uaccess.h> with <linux/uaccess.h> globally)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (ad4d05329df5 udf: Make stat on symlink report symlink length as st_size)
Merging ext4/dev (2b3864b32403 ext4: do not polute the extents cache while shifting extents)
Merging f2fs/dev (93ceca2f8e00 f2fs: fix wrong tracepoints for op and op_flags)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c01638f5d919 fuse: fix clearing suid, sgid for chown())
Merging gfs2/for-next (b63f5e84826b GFS2: Wake up io waiters whenever a flush is done)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (a121103c9228 Linux 4.10-rc3)
Merging nfsd/nfsd-next (3946d512e9e3 sunrpc: don't call sleeping functions from the notifier block callbacks)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (c3c869966480 ovl: fix reStructuredText syntax errors in documentation)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (ba75d570b60c ubifs: Initialize fstr_real_len)
Merging xfs/for-next (7e910b61a042 xfs: don't rely on ->total in xfs_alloc_space_available)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (59479ae85e43 Merge branches 'work.sendmsg' and 'work.splice-net' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (b12826c5188e Merge branch 'vfs-ovl' into next)
CONFLICT (content): Merge conflict in fs/read_write.c
CONFLICT (content): Merge conflict in fs/overlayfs/dir.c
Merging printk/for-next (0e91b7706038 printk: drop call_console_drivers() unused param)
Merging pci/next (7ce7d89f4883 Linux 4.10-rc1)
Merging pstore/for-next/pstore (0c744ea4f77d Linux 4.10-rc2)
Merging hid/for-next (d7f6872e5ef6 Merge branch 'for-4.10/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (649ac63a9ae5 i2c: mux: mlxcpld: fix i2c mux selection caching)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (53e678d75e7c hwmon: (sht21) Add Electronic Identification Code retrieval)
Merging jc_docs/docs-next (df31175bb4d3 kernel-doc: make highlights more homogenous for the various backends)
Merging v4l-dvb/master (5dd2470bfddb Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (2f7590b2677b Merge tag 'fbdev-v4.10-rc2' of git://github.com/bzolnier/linux into fbdev-for-next)
Merging pm/linux-next (919c53ad1885 Merge branch 'acpi-tables' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cad8f6c4f660 Merge branches 'ida-conversion' and 'thermal-core' into next)
Merging thermal-soc/next (18591add41ec thermal: rockchip: handle set_trips without the trip points)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (7453c549f5f6 swiotlb: Export swiotlb_max_segment to users)
Merging net-next/master (3a89eaa65db6 net: dsa: select NET_SWITCHDEV)
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (b3b73b8e6df6 xfrm: state: do not acquire lock in get_mtu helpers)
Merging netfilter-next/master (4cc4b72c136a netfilter: xt_connlimit: use rb_entry())
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (0a0a8d6b0e88 net: fealnx: use new api ethtool_{get|set}_link_ksettings)
Merging bluetooth/master (4289e60cb056 Merge branch 'tc-skb-diet')
Merging mac80211-next/master (bd2522b16884 cfg80211: NL80211_ATTR_SOCKET_OWNER support for CMD_CONNECT)
Merging rdma/for-next (6f94ba20799b Merge branch 'vmw_pvrdma' into merge-test)
Merging rdma-leon/rdma-next (03ae16e3a916 Merge branch 'topic/cma-misc-for-4.11' into rdma-next)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/eq.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (5bdee5496978 Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux)
Merging nand/nand/next (9018bf842d4e mtd: nand: fsmc: remove stale non-DT probe path)
Merging crypto/master (c821f6ab2e47 crypto: skcipher - introduce walksize attribute for SIMD algos)
Merging drm/drm-next (282d0a35c8c4 Merge tag 'drm-misc-next-2017-01-09' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
Merging drm-panel/drm/panel/for-next (327bc443416d drm/panel: Constify device node argument to of_drm_find_panel())
Merging drm-intel/for-linux-next (9e65a3787217 drm/i915: don't open code the pdpe/pml4e clearing)
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (a009e975da5c dma-fence: Introduce drm_fence_set_error() helper)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (575e2de15c0d Merge branches 'sunxi/clk-for-4.11', 'sunxi/core-for-4.11', 'sunxi/defconfig-for-4.11', 'sunxi/drm-for-4.11', 'sunxi/dt-for-4.11', 'sunxi/dt64-for-4.11' and 'sunxi/fixes-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (3545d3c27c43 gcc-plugins: update gcc-common.h for gcc-7)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (a5cb009162e6 Merge tag 'regmap-v4.10' into regmap-linus)
Merging sound/for-next (921282360b9c ALSA: firewire-tascam: enclose identifiers referred by single function)
Merging sound-asoc/for-next (4b71c3583c2b Merge remote-tracking branches 'asoc/fix/nau8825', 'asoc/fix/rt5645', 'asoc/fix/tlv320aic3x' and 'asoc/fix/topology' into asoc-linus)
Merging modules/modules-next (ea6351698b6c taint/module: Fix problems when out-of-kernel driver defines true or false)
Merging input/next (aa142ed77099 Input: intel-mid-touch - remove driver)
Merging block/for-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging lightnvm/for-next (a5f78b7f7dd1 Merge branch 'for-4.10/block' into for-next)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (9bd22fc27d92 mmc: block: Replace "goto retry" by a proper do / while loop)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (fb1ec6088552 raid5: only dispatch IO from raid5d for harddisk raid)
Merging mfd/for-mfd-next (6f96d7eab40f mfd: axp20x: Fix AXP806 access errors on cold boot)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (af5179a405c0 power: supply: remove Intel Moorestown battery support)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (d00b74613fb1 Merge remote-tracking branches 'regulator/topic/tps65086' and 'regulator/topic/twl' into regulator-next)
Merging security/next (916cafdc9584 samples/seccomp: fix 64-bit comparison macros)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (900fde06cb9d selinux: default to security isid in sel_make_bools() if no sid is found)
Applying: selinux: merge fix for "smc: establish new socket family"
Merging tpmdd/next (8e25809f17af tpm: Do not print an error message when doing TPM auto startup)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (fce794089d60 Merge branches 'iommu/fixes' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (89670affa2a6 audit: Make AUDIT_ANOM_ABEND event normalized)
Merging devicetree/for-next (2956b338b729 bus:qcom : Fix typo in qcom,ebi2.txt)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (89581550a126 Merge remote-tracking branches 'spi/fix/armada', 'spi/fix/axi', 'spi/fix/dw', 'spi/fix/fsl-dspi', 'spi/fix/pxa2xx' and 'spi/fix/sh-msiof' into spi-linus)
Merging tip/auto-latest (841c031e2ff4 Merge branch 'linus')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (eca90a3b3226 EDAC: Fix typos in enum mem_type comments)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (3dbb16b87b57 selftests: ftrace: Shift down default message verbosity)
Merging rcu/rcu/next (37a1bc421e20 rcu: Add lockdep checks to synchronous expedited primitives)
Merging kvm/linux-next (0f89b207b04a kvm: svm: Use the hardware provided GPA instead of page walk)
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (252747dd7c67 KVM: s390: Get rid of ar_t)
Merging xen-tip/linux-next (0b47a6bd1150 Xen: ARM: Zero reserved fields of xatp before making hypervisor call)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (8149a5258a30 platform/x86: intel_pmc_ipc: Remove unused iTCO_version variable)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (4e552c8cb5bc leds: add LED_ON brightness as boolean value)
Merging ipmi/for-next (c5afee1b0dfc acpi:ipmi: Make IPMI user handler const)
Merging driver-core/driver-core-next (a121103c9228 Linux 4.10-rc3)
Merging tty/tty-next (a121103c9228 Linux 4.10-rc3)
Merging usb/usb-next (a121103c9228 Linux 4.10-rc3)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (a121103c9228 Linux 4.10-rc3)
Merging usb-chipidea-next/ci-for-usb-next (223e92311583 usb: chipdata: Replace the extcon API)
Merging phy-next/next (7ce7d89f4883 Linux 4.10-rc1)
Merging staging/staging-next (6c40045a5b47 Merge 4.10-rc3 into staging-next)
Merging char-misc/char-misc-next (a121103c9228 Linux 4.10-rc3)
Merging extcon/extcon-next (86d6cda68f37 extcon: Modify the name of EXTCON_USB_HOST connector)
Merging slave-dma/next (69ec10a5c97c Merge branch 'topic/stm32-dma' into next)
Merging cgroup/for-next (7b4632f04841 cgroup: fix a comment typo)
Merging scsi/for-next (7075ada5c123 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (352e5fd10598 scsi: lpfc: Reinstate lpfc_soft_wwn parameter)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (0420744fa2a6 ibmvscsis: Fix srp_transfer_data fail return code)
Merging libata/for-next (b173cbc0e364 Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (6bdf1e0efb04 Makefile: drop -D__CHECK_ENDIAN__ from cflags)
Merging rpmsg/for-next (a9cff670138e Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4fe4d09cfd11 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (9eb63a89ffd1 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (0caf7752a2d0 Merge branch 'for-4.11/core' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (93362fa47fe9 sysctl: Drop reference added by grab_header in proc_sys_readdir)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (a8ba798bc8ec selftests: enable O and KBUILD_OUTPUT)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (b766922e6535 powerpc/livepatch: Remove klp_write_module_reloc() stub)
Merging coresight/next (9d8067efa456 coresight: etm4x: Fix timestamp configuration when working from perf)
Merging rtc/rtc-next (45125f5cdd4f rtc: mcp795: add alarm support.)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (1db175428ee3 ext4: Simplify DAX fault path)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (a63a9bb7abd2 ipc/sem: add hysteresis)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs: add i_blocksize()
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
Merging akpm/master (e4e10ec286b5 scripts/spelling.txt: add "followings" pattern and fix typo instances)
