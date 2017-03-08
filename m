From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 8
Date: Wed, 8 Mar 2017 13:44:08 +1100
Message-ID: <20170308134408.7adef8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752181AbdCHC40 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Mar 2017 21:56:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170307:

The sunxi tree lost its build failure.

The rcu tree gained conflicts against Linus', the powerpc-fixes and
drm-intel trees.

The staging tree lost its build failures.

Non-merge commits (relative to Linus' tree): 1850
 2729 files changed, 270120 insertions(+), 28772 deletions(-)

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

I am currently merging 253 trees (counting Linus' and 37 trees of bug
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
Merging origin/master (9e91c144e689 Merge branch 'idr-4.11' of git://git.infradead.org/users/willy/linux-dax)
Merging fixes/master (c470abd4fde4 Linux 4.10)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (8ba605b607b7 ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant)
Merging arm-current/fixes (9e3440481845 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user())
Merging m68k-current/for-linus (b5bb8f3120a7 m68k/bitops: Correct signature of test_bit())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (a7d2475af7ae powerpc: Sort the selects under CONFIG_PPC)
Merging sparc/master (f8e6859ea9d0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (068d9f90a697 ibmvnic: Allocate number of rx/tx buffers agreed on by firmware)
Merging ipsec/master (e3dc847a5f85 vti6: Don't report path MTU below IPV6_MIN_MTU.)
Merging netfilter/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (52f5631a4c05 rtlwifi: rtl8192ce: Fix loading of incorrect firmware)
Merging mac80211/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging sound-current/for-linus (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging pci-current/for-linus (3bd7db63a841 PCI/ASPM: Always set link->downstream to avoid NULL dereference on remove)
Merging driver-core.current/driver-core-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging tty.current/tty-linus (f98c7bce570b serial: samsung: Continue to work if DMA request fails)
Merging usb.current/usb-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-gadget-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-serial-fixes/usb-linus (2e46565cf622 USB: serial: digi_acceleport: fix OOB-event processing)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging staging.current/staging-linus (b3bd0f2849f4 staging/vc04_services: add CONFIG_OF dependency)
Merging char-misc.current/char-misc-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging input-current/for-linus (45838660e34d Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000)
Merging crypto-current/master (5839f555fa57 crypto: vmx - Use skcipher for xts fallback)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (930a42ded3fe vfio/spapr_tce: Set window when adding additional groups to container)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (8c71fff434e5 [media] v4l: vsp1: Adapt vsp1_du_setup_lif() interface to use a structure)
Merging drm-intel-fixes/for-linux-next-fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (864558ec58ab drm/msm: Fix compilation error when CONFIG_DEBUG_FS undefined)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (17a870bea3b8 Merge branches 'fixes' and 'misc'; commit 'kuser^{/add CPU_THUMB_CAPABLE to indicate}' into for-linus)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (ca2dea434d10 Merge tag 'juno-fixes-4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into next/late)
Merging amlogic/for-next (d58ee0087d37 Merge branch 'v4.12/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (f5fde64706f0 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e9cb0791a7e3 Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (57aba12f97c2 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (8b01a3fc75c3 Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (ef9c75b58b47 Merge branch 'omap-for-v4.12/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (a844f941617c Merge tag 'qcom-arm64-for-4.11-2' into final-for-4.11)
Merging renesas/next (99ff2069bd14 Merge branches 'arm64-defconfig-for-v4.12', 'arm64-dt-for-v4.12' and 'dt-for-v4.12' into next)
Merging rockchip/for-next (7d23379e3d44 Merge branch 'v4.12-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (a0c839e2c374 Merge branch 'next/defconfig' into for-next)
Merging tegra/for-next (10e459de8497 Merge branch for-4.11/i2c into for-next)
Merging arm64/for-next/core (ffe7afd17135 arm64/kprobes: consistently handle MRS/MSR with XZR)
Merging clk/clk-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (3dfe33020ca8 m68k/sun3: Remove dead code in paging_init())
Merging m68knommu/for-next (73ec49463f89 m68k/defconfig: amcore board defconfig tuning)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (5bb089f45847 MIPS: ralink: Fix typos in rt3883 pinctrl)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (c470abd4fde4 Linux 4.10)
Merging powerpc/next (9f3768e02335 powerpc: Remove leftover cputime_to_nsecs call causing build error)
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (d03bd0454b10 s390/timex: micro optimization for tod_to_ns)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (ec59c4ad070d Merge branch 'xtensa-boot' into xtensa-for-next)
Merging fscrypt/master (6f69f0ed6136 fscrypt: constify struct fscrypt_operations)
Merging befs/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (4f84e3206d8b Merge branch 'for-next-next-v4.12-20170307' into for-next-20170307)
Merging ceph/master (7cc5e38f2f0b libceph: osd_request_timeout option)
Merging cifs/for-next (ec1a4dc5ea28 Handle mismatched open calls)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (6c71100db53e fanotify: simplify the code of fanotify_merge)
Merging ext4/dev (cab7076a185e Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging f2fs/dev (4977ab6e92e2 Merge branch 'core-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9a87ad3da905 fuse: release: private_data cannot be NULL)
Merging gfs2/for-next (415730e5de23 gfs2: Avoid alignment hole in struct lm_lockname)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging nfsd/nfsd-next (ff7d11797e72 nfsd: Fix display of the version string)
Merging orangefs/for-next (e98bdb3059cb Merge tag 'v4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into for-next)
Merging overlayfs/overlayfs-next (a41471e8eff8 ovl: lockdep annotate of nested stacked overlayfs inode lock)
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
Merging pci/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging pstore/for-next/pstore (fc1b326efd27 MAINTAINERS: Adjust pstore git repo URI, add files)
Merging hid/for-next (93afcfed4ab5 Merge branches 'for-4.11/upstream-fixes', 'for-4.12/asus', 'for-4.12/i2c-hid', 'for-4.12/innomedia', 'for-4.12/multitouch', 'for-4.12/nti', 'for-4.12/sony', 'for-4.12/upstream' and 'for-4.12/wacom' into for-next)
Merging i2c/i2c/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (794cbede7336 hwmon: Constify str parameter of hwmon_ops->read_string)
Merging jc_docs/docs-next (fd5d666932d5 Documentation/sphinx: fix primary_domain configuration)
Merging v4l-dvb/master (700ea5e0e0dd Merge tag 'v4.11-rc1' into patchwork)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging pm/linux-next (f6e94575c0ee Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (6fefe19f5836 Merge branches 'thermal-core', 'thermal-soc', 'thermal-intel' and 'ida-conversion' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (9c28286b1b4b decnet: Use TCP nagle macro instead of literal number in decnet)
Merging ipsec-next/master (7785bba299a8 esp: Add a software GRO codepath)
Merging netfilter-next/master (f1ef09fde17f Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (4e33e3462510 tcp: use page_ref_inc() in tcp_sendmsg())
Merging bluetooth/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging mac80211-next/master (037651950d58 mac80211_hwsim: fix command documentation indentation)
Merging rdma/for-next (9294000d6d89 IB/srp: Drain the send queue before destroying a QP)
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (a4077ce58713 mtd: nand: Add Winbond manufacturer id)
Merging spi-nor/next (ca1fa1a8a6da mtd: spi-nor: Add support for ESMT F25L32QA and F25L64QA)
Merging crypto/master (12cb3a1c4184 crypto: xts - Add ECB dependency)
Merging drm/drm-next (a44ddbcbbd72 Merge tag 'drm-misc-next-fixes-2017-02-27' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (7c55e2c5772d drm/i915: Use pagecache write to prepopulate shmemfs from pwrite-ioctl)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (0621ce1db336 drm/dp: Add missing description to parameter)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_debugfs.c
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (57edb4bc581d drm/msm: move submit fence wait out of struct_mutex)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (751c5fae1940 drm: mali-dp: Fix smart layer not going to composition)
Merging sunxi/sunxi/for-next (681cc0445e24 Merge branches 'sunxi/clk-for-4.12', 'sunxi/core-for-4.12', 'sunxi/defconfig-for-4.12', 'sunxi/drm-for-4.12' and 'sunxi/dt-for-4.12' into sunxi/for-next)
Merging kspp/for-next/kspp (4b020bbc236f Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging sound-asoc/for-next (66db55a683ee Merge remote-tracking branches 'asoc/topic/ux500' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (0d4ec7849f5a MAINTAINERS: add tree for modules)
Merging input/next (fad358a06c51 Input: pwm-beeper - support customized freq for SND_BELL)
Merging block/for-next (d111d2a90084 Merge branch 'for-linus' into for-next)
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (858516b7881e dm crypt: add cryptographic data integrity protection (authenticated encryption))
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (874f93fcf501 md-cluster: add the support for resize)
Merging mfd/for-mfd-next (e93c10211d03 mfd: lpc_ich: Enable watchdog on Intel Apollo Lake PCH)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (513203999356 Merge remote-tracking branches 'regulator/topic/lm363x', 'regulator/topic/ltc3589' and 'regulator/topic/ltc3676' into regulator-next)
Merging security/next (ca97d939db11 security: mark LSM hooks as __ro_after_init)
Merging integrity/next (1ac202e978e1 ima: accept previously set IMA_NEW_FILE)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (579fc0dc0911 selinux: constify nlmsg permission tables)
Merging tpmdd/next (1a6fafcd1034 tpm_tis_spi: Add small delay after last transfer)
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (8d2932dd0634 Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/smmu', 'arm/mediatek', 'arm/core', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d9d84780f17c vfio: fix a typo in comment of function vfio_pin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (fe8e52b9b910 audit: remove unnecessary curly braces from switch/case statements)
Merging devicetree/for-next (4e29ccdb240e DT: add Faraday Tec. as vendor)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (54298845f891 Merge remote-tracking branches 'spi/topic/sc18is602' and 'spi/topic/sunxi' into spi-next)
Merging tip/auto-latest (d38aff61d949 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (4bd035eae255 EDAC, xgene: Fix wrongly spelled "procesing")
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (65a50c656276 ftrace/graph: Add ftrace_graph_max_depth kernel parameter)
Merging rcu/rcu/next (778d145f1336 doc: Update rcu_assign_pointer() definition in whatisRCU.txt)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_core.c
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Applying: smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (bcd3bb63dbc8 KVM: PPC: Book3S HV: Disable HPT resizing on POWER9 for now)
Merging kvms390/next (b2d8fdd12a40 KVM: s390: log runtime instrumentation enablement)
Merging xen-tip/linux-next (d825adb48cf9 xenbus: Remove duplicate inclusion of linux/init.h)
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (6dddfebdc1d7 platform/x86: asus-wmi: Remove quirk_no_rfkill)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (9f1715667226 leds: gpio: use OF variant of LED registering function)
Merging ipmi/for-next (eb994594bc22 ipmi: bt-bmc: Use a regmap for register access)
Merging driver-core/driver-core-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb/usb-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-gadget/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-serial/usb-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-chipidea-next/ci-for-usb-next (753dfd23612d usb: chipidea: msm: Fix return value check in ci_hdrc_msm_probe())
Merging phy-next/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging tty/tty-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging char-misc/char-misc-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging extcon/extcon-next (579ae3bb1369 extcon: int3496: Add dependency on X86 as it's Intel specific)
Merging staging/staging-next (25016567be26 staging: atomisp: fix include Makefile mess)
Merging mux/for-next (a6606da0682c mux: adg792a: add mux controller driver for ADG792A/G)
Merging slave-dma/next (916444a10f96 Merge branch 'for-linus' into next)
Merging cgroup/for-next (697286206e6d Merge branch 'for-4.11-fixes' into for-next)
Merging scsi/for-next (e2a3a67302fb Merge remote-tracking branch 'mkp-scsi/fixes' into fixes)
Merging scsi-mkp/for-next (eeb810849a20 scsi: lpfc: revise version number to 11.2.0.10)
Merging target-updates/for-next (c87ba9c49c1f target: Add counters for ABORT_TASK success + failure)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (c35a6f56716e Merge branch 'for-4.12' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (80363894995b virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (349709ba5bea Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (f0b2310fac26 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (b6de9435612a Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (38b0a526ec33 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (040757f738e1 ucount: Remove the atomicity from ucount->count)
Merging ktest/for-next (5739438b725c ktest: Add variable run_command_status to save status of commands executed)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (372e2db7210d livepatch: doc: remove the limitation for schedule() patching)
Merging coresight/next (dc83e0549ea1 coresight: Fixes coresight DT parse to get correct output port ID.)
Merging rtc/rtc-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bfb34527a32a libnvdimm, pfn: fix memmap reservation size versus 4K alignment)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (ceff95e16be3 initramfs: provide a way to ignore image provided by bootloader)
Applying: linux-next-rejects
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm: introduce kv[mz]alloc helpers
Applying: mm: support __GFP_REPEAT in kvmalloc_node for >32kB
Applying: lib/rhashtable.c: simplify a strange allocation pattern
Applying: net/ipv6/ila/ila_xlat.c: simplify a strange allocation pattern
Applying: fs/xattr.c: zero out memory copied to userspace in getxattr
Applying: treewide: use kv[mz]alloc* rather than opencoded variants
Applying: net: use kvmalloc with __GFP_REPEAT rather than open coded variant
Applying: drivers/md/dm-ioctl.c: use kvmalloc rather than opencoded variant
Applying: drivers/md/bcache/super.c: use kvmalloc
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Merging akpm/master (97b598203fe9 scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances)
