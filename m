From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 5
Date: Thu, 5 Jan 2017 15:25:18 +1100
Message-ID: <20170105152518.3da2ea48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752836AbdAEEZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Jan 2017 23:25:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170104:

New trees: fscrypt-current, fscrypt

Undropped tree: rdma-leon

The swiotlb tree lost its build failure.

The rdma-leon tree lost its build failure.

The drm-misc tree gained a build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 2043
 2520 files changed, 71447 insertions(+), 32767 deletions(-)

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

I am currently merging 248 trees (counting Linus' and 36 trees of bug
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
Merging origin/master (62f8c4059217 Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (152b695d7437 builddeb: fix cross-building to arm64 producing host-arch debs)
Merging arc-current/for-curr (7ce7d89f4883 Linux 4.10-rc1)
Merging arm-current/fixes (8478132a8784 Revert "arm: move exports to definitions")
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (69973b830859 Linux 4.9)
Merging sparc/master (4bbc84ffd137 sparc: use symbolic names for tsb indexing)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (71eae1ca77fd sh_eth: enable RX descriptor word 0 shift on SH7734)
Merging ipsec/master (4e5da369df64 Documentation/networking: fix typo in mpls-sysctl)
Merging netfilter/master (6c5d5cfbe3c5 netfilter: ipt_CLUSTERIP: check duplicate config when initializing)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (60f59ce02785 rtlwifi: rtl_usb: Fix missing entry in USB driver's private data)
Merging mac80211/master (35f432a03e41 mac80211: initialize fast-xmit 'info' later)
Merging sound-current/for-linus (c7efff9284df ALSA: hda - Apply asus-mode8 fixup to ASUS X71SL)
Merging pci-current/for-linus (4931a6781f83 x86/PCI: Ignore _CRS on Supermicro X8DTH-i/6/iF/6F)
Merging driver-core.current/driver-core-linus (0c744ea4f77d Linux 4.10-rc2)
Merging tty.current/tty-linus (0c744ea4f77d Linux 4.10-rc2)
Merging usb.current/usb-linus (29fc1aa454d0 usb: host: xhci: handle COMP_STOP from SETUP phase too)
Merging usb-gadget-fixes/fixes (43aef5c2ca90 usb: gadget: Fix copy/pasted error message)
Merging usb-serial-fixes/usb-linus (ef079936d3cd USB: serial: ti_usb_3410_5052: fix NULL-deref at open)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (e7c9a3d9e432 staging: octeon: Call SET_NETDEV_DEV())
Merging char-misc.current/char-misc-linus (b577fafc4366 nvmem: fix nvmem_cell_read() return type doc)
Merging input-current/for-linus (01427fe7c4b9 Input: adxl34x - make it enumerable in ACPI environment)
Merging crypto-current/master (07825f0acd85 crypto: aesni - Fix failure when built-in with modular pcbc)
Merging ide/master (b2ae75052a8c ide: Fix interface autodetection in legacy IDE driver (trial #2))
Merging vfio-fixes/for-linus (45e869714489 vfio-pci: use 32-bit comparisons for register address for gcc-4.5)
Merging kselftest-fixes/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging drm-intel-fixes/for-linux-next-fixes (2471eb5fb6e1 drm/i915: Prevent timeline updates whilst performing reset)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/kvmgt.c
Applying: vfio-mdev: fixup for "Make mdev_device private and abstract interfaces"
Merging drm-misc-fixes/for-linux-next-fixes (aebe55c2d4b9 drm: Clean up planes in atomic commit helper failure path)
Merging kbuild/for-next (a6d1da25b333 Merge branch 'kbuild/kbuild' into kbuild/for-next)
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
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (3536988747b6 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (35ef8633bd14 Merge branch 'omap-for-v4.11/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (bbf9c90768f9 Merge tag 'qcom-dts-for-4.10-2' into all-for-4.10-part2)
Merging renesas/next (0a704567b658 Merge branches 'fixes-for-v4.10', 'arm64-dt-for-v4.11', 'defconfig-for-v4.11', 'dt-for-v4.11' and 'soc-for-v4.11' into next)
Merging rockchip/for-next (7efd9733e204 Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (8ae2065bd399 Merge branch 'next/dt64' into for-next)
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
Merging m68knommu/for-next (7ce7d89f4883 Linux 4.10-rc1)
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
Merging fscrypt/master (58ae74683ae2 fscrypt: factor out bio specific functions)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (003501108e6b fixup! Btrfs: fix btrfs_ordered_update_i_size to update disk_i_size properly)
Merging ceph/master (45ee2c1d6618 libceph: remove now unused finish_request() wrapper)
Merging cifs/for-next (7c0f6ba682b9 Replace <asm/uaccess.h> with <linux/uaccess.h> globally)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (a17f0cb5b9ea fs/udf: make #ifdef UDF_PREALLOCATE unconditional)
Merging ext4/dev (a551d7c8deef Merge branch 'fscrypt' into dev)
Merging f2fs/dev (0f64df301240 Merge branch 'parisc-4.10-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c01638f5d919 fuse: fix clearing suid, sgid for chown())
Merging gfs2/for-next (23754c081d1b GFS2: Limit number of transaction blocks requested for truncates)
Merging jfs/jfs-next (362ad5d58e9a fs: jfs: Replace CURRENT_TIME_SEC by current_time())
Merging nfs/linux-next (8ac2b42238f5 NFSv4: Retry the DELEGRETURN if the embedded GETATTR is rejected with EACCES)
Merging nfsd/nfsd-next (60db988b6132 svcauth_gss: remove context sooner after PROC_DESTROY)
Merging orangefs/for-next (04102c76a779 orangefs: Axe some dead code)
Merging overlayfs/overlayfs-next (c3c869966480 ovl: fix reStructuredText syntax errors in documentation)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (ba75d570b60c ubifs: Initialize fstr_real_len)
Merging xfs/for-next (9807b773dad4 Merge branch 'xfs-4.10-misc-fixes-4' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (59479ae85e43 Merge branches 'work.sendmsg' and 'work.splice-net' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (b12826c5188e Merge branch 'vfs-ovl' into next)
CONFLICT (content): Merge conflict in fs/read_write.c
CONFLICT (content): Merge conflict in fs/overlayfs/dir.c
Merging pci/next (7ce7d89f4883 Linux 4.10-rc1)
Merging pstore/for-next/pstore (0c744ea4f77d Linux 4.10-rc2)
Merging hid/for-next (d0dbfbe26b0c Merge branch 'for-4.10/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (649ac63a9ae5 i2c: mux: mlxcpld: fix i2c mux selection caching)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (53e678d75e7c hwmon: (sht21) Add Electronic Identification Code retrieval)
Merging jc_docs/docs-next (df31175bb4d3 kernel-doc: make highlights more homogenous for the various backends)
Merging v4l-dvb/master (5dd2470bfddb Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (66c8d3a3b69b Merge branch 'pm-docs' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (7cb1a7ff392d Merge branches 'thermal-core' and 'ida-conversion' into next)
Merging thermal-soc/next (18591add41ec thermal: rockchip: handle set_trips without the trip points)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (8ee7e3952663 swiotlb: Fix missing 'static inline' on swiotlb_max_segment)
Merging net-next/master (5952758101fb dsa: mv88e6xxx: Optimise atu_get)
Merging ipsec-next/master (1365e547c6bb xfrm: trivial typos)
Merging netfilter-next/master (949a358418aa netfilter: nft_ct: add average bytes per packet support)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (0a0a8d6b0e88 net: fealnx: use new api ethtool_{get|set}_link_ksettings)
Merging bluetooth/master (107bc0aa95ca Merge branch 'for-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next)
Merging mac80211-next/master (5ec71dd7f1b6 cfg80211: sysfs: use wiphy_name())
Merging rdma/for-next (6f94ba20799b Merge branch 'vmw_pvrdma' into merge-test)
Merging rdma-leon/rdma-next (110a951cdcf4 Merge branch 'topic/cma-misc-for-4.11' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging l2-mtd/master (445caaa20c4d mtd: Allocate bdi objects dynamically)
Merging nand/nand/next (2eaa03de5645 mtd: nand: lpc32xx: fix invalid error handling of a requested irq)
Merging crypto/master (c821f6ab2e47 crypto: skcipher - introduce walksize attribute for SIMD algos)
Merging drm/drm-next (2cf026ae85c4 Merge branch 'linux-4.10' of git://github.com/skeggsb/linux into drm-next)
Merging drm-panel/drm/panel/for-next (8c31f6034b24 drm/panel: simple: Add support for AUO G185HAN01)
Merging drm-intel/for-linux-next (b1ed35d9179b drm/i915: Revoke fenced GTT mmapings across GPU reset)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_overlay.c
Merging drm-tegra/drm/tegra/for-next (585ee0f27ef7 drm/tegra: Set sgt pointer in BO pin)
Merging drm-misc/for-linux-next (76fede2fa79d drm/atomic: Fix outdated comment.)
Applying: Revert "drm: nouveau: fix build when LEDS_CLASS=m"
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (2401a0084614 drm/msm: gpu: Add support for the GPMU)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (8e3eb71c80ad drm/arm/malidp: Fix possible dereference of NULL)
Merging sunxi/sunxi/for-next (63e8e44adfdc Merge branch 'sunxi/dt-late-for-4.10' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-h3.dtsi
Merging kspp/for-next/kspp (3545d3c27c43 gcc-plugins: update gcc-common.h for gcc-7)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (a5cb009162e6 Merge tag 'regmap-v4.10' into regmap-linus)
Merging sound/for-next (ed3c177d960b ALSA: vx: Don't try to update capture stream before running)
Merging sound-asoc/for-next (e1c203b78560 Merge remote-tracking branches 'asoc/fix/tlv320aic3x' and 'asoc/fix/topology' into asoc-linus)
Merging modules/modules-next (ea6351698b6c taint/module: Fix problems when out-of-kernel driver defines true or false)
Merging input/next (39acdeca63a5 Input: xpad - don't depend on endpoint order)
Merging block/for-next (cdb98c2698b4 Revert "nvme: add support for the Write Zeroes command")
Merging lightnvm/for-next (a5f78b7f7dd1 Merge branch 'for-4.10/block' into for-next)
Merging device-mapper/for-next (ef548c551e72 dm flakey: introduce "error_writes" feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (9bd22fc27d92 mmc: block: Replace "goto retry" by a proper do / while loop)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (e68e0bb82beb md/r5cache: assign conf->log before r5l_load_log())
Merging mfd/for-mfd-next (5d8c57f42e2e mfd: axp20x: Drop wrong AXP288_PMIC_ADC_EN define)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (fb9a33ae6ba7 power: supply: gpio_charger: switch to using GPIO descriptors)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (d00b74613fb1 Merge remote-tracking branches 'regulator/topic/tps65086' and 'regulator/topic/twl' into regulator-next)
Merging security/next (50523a29d900 Yama: allow access for the current ptrace parent)
Merging integrity/next (b4bfec7f4a86 security/integrity: Harden against malformed xattrs)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (36872bf3f5e3 selinux: default to security isid in sel_make_bools() if no sid is found)
Merging tpmdd/next (1548c540d863 tpm/vtpm: fix kdoc warnings)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (fce794089d60 Merge branches 'iommu/fixes' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (2b8bb1d771f7 vfio iommu type1: Fix size argument to vfio_find_dma() in pin_pages/unpin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (89670affa2a6 audit: Make AUDIT_ANOM_ABEND event normalized)
Merging devicetree/for-next (63c343d384d1 dt-bindings: qman: Remove pool channel node)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (e3cd632d6f15 Merge remote-tracking branches 'spi/fix/armada', 'spi/fix/dw', 'spi/fix/fsl-dspi', 'spi/fix/pxa2xx' and 'spi/fix/sh-msiof' into spi-linus)
Merging tip/auto-latest (92f2ab52e19a Merge branch 'x86/cache')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (0de2788447b6 EDAC, amd64: Fix improper return value)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (3dbb16b87b57 selftests: ftrace: Shift down default message verbosity)
Merging rcu/rcu/next (7acd02c9e62f squash! rcu: Check cond_resched_rcu_qs() state less often to reduce GP overhead)
Merging kvm/linux-next (ef85b6738543 kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF))
Merging kvm-arm/next (21cbe3cc8a48 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (e34af7849014 KVM: PPC: Book3S: Move prototypes for KVM functions into kvm_ppc.h)
Merging kvms390/next (252747dd7c67 KVM: s390: Get rid of ar_t)
Merging xen-tip/linux-next (0b47a6bd1150 Xen: ARM: Zero reserved fields of xatp before making hypervisor call)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (b6a64704c25e platform/x86: mlx-platform: mlxcpld-hotplug driver style fixes)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (aec71e2fb6f7 DT: leds: Improve examples by adding some context)
Merging ipmi/for-next (070cbd1d42aa ipmi: create hardware-independent softdep for ipmi_devintf)
Merging driver-core/driver-core-next (0c744ea4f77d Linux 4.10-rc2)
Merging tty/tty-next (0c744ea4f77d Linux 4.10-rc2)
Merging usb/usb-next (0c744ea4f77d Linux 4.10-rc2)
Merging usb-gadget/next (d5c024f3761d usb: gadget: serial: fix possible Oops caused by calling kthread_stop(NULL))
Merging usb-serial/usb-next (0c744ea4f77d Linux 4.10-rc2)
Merging usb-chipidea-next/ci-for-usb-next (223e92311583 usb: chipdata: Replace the extcon API)
Merging phy-next/next (5e253dfbdbea phy: rockchip-inno-usb2: select USB_COMMON)
Merging staging/staging-next (6b8b810f2c9a staging: rtl8188eu: remove unused members from struct recv_priv)
Merging char-misc/char-misc-next (0c744ea4f77d Linux 4.10-rc2)
Merging extcon/extcon-next (3bd62888574a extcon: Move defintion of struct extcon_dev to driver/extcon directory)
Merging slave-dma/next (69ec10a5c97c Merge branch 'topic/stm32-dma' into next)
Merging cgroup/for-next (7b4632f04841 cgroup: fix a comment typo)
Merging scsi/for-next (cadb39085066 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (f1e65d125678 scsi: dpt_i2o: double free if adpt_i2o_online_hba() fails)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (83337e544323 iscsi-target: Return error if unable to add network portal)
Merging libata/for-next (7ddf6a387c68 Merge branch 'for-4.10' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (6bdf1e0efb04 Makefile: drop -D__CHECK_ENDIAN__ from cflags)
Merging rpmsg/for-next (a9cff670138e Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4fe4d09cfd11 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (9eb63a89ffd1 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (fdd3ff4db177 Merge branch 'for-4.10/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (19339c251607 Revert "evm: Translate user/group ids relative to s_user_ns when computing HMAC")
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (7ce7d89f4883 Linux 4.10-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (b766922e6535 powerpc/livepatch: Remove klp_write_module_reloc() stub)
Merging coresight/next (9d8067efa456 coresight: etm4x: Fix timestamp configuration when working from perf)
Merging rtc/rtc-next (7ce7d89f4883 Linux 4.10-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (1db175428ee3 ext4: Simplify DAX fault path)
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
Merging akpm/master (4453f4fde106 scripts/spelling.txt: add "followings" pattern and fix typo instances)
