From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 7
Date: Tue, 7 Mar 2017 14:36:25 +1100
Message-ID: <20170307143625.06a00a91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754350AbdCGEQa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Mar 2017 23:16:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170303:

New tree: mux

The drm-misc tree gained conflicts against the drm-intel tree.

The sunxi tree gained a conflict against the drm-misc tree and a build
failure for which I added a merge fix patch.

The staging tree gained build failures, so I used the version from
next-20170306.

The akpm tree gained build failures for which I removed several patches.

Non-merge commits (relative to Linus' tree): 1281
 1198 files changed, 45664 insertions(+), 19034 deletions(-)

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
Merging origin/master (c1ae3cfa0e89 Linux 4.11-rc1)
Merging fixes/master (c470abd4fde4 Linux 4.10)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (8ba605b607b7 ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant)
Merging arm-current/fixes (9e3440481845 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user())
Merging m68k-current/for-linus (b5bb8f3120a7 m68k/bitops: Correct signature of test_bit())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (6ba422c75fac powerpc/64: Avoid panic during boot due to divide by zero in init_cache_info())
Merging sparc/master (f8e6859ea9d0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (0878fff1f42c net: phy: Do not perform software reset for Generic PHY)
Merging ipsec/master (e3dc847a5f85 vti6: Don't report path MTU below IPV6_MIN_MTU.)
Merging netfilter/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (52f5631a4c05 rtlwifi: rtl8192ce: Fix loading of incorrect firmware)
Merging mac80211/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging sound-current/for-linus (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging pci-current/for-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging driver-core.current/driver-core-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging tty.current/tty-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb.current/usb-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-gadget-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-serial-fixes/usb-linus (2e46565cf622 USB: serial: digi_acceleport: fix OOB-event processing)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging char-misc.current/char-misc-linus (c1ae3cfa0e89 Linux 4.11-rc1)
Merging input-current/for-linus (6e11617fcff3 Merge branch 'next' into for-linus)
Merging crypto-current/master (5839f555fa57 crypto: vmx - Use skcipher for xts fallback)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (930a42ded3fe vfio/spapr_tce: Set window when adding additional groups to container)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (5df62771c556 [media] rc: protocol is not set on register for raw IR devices)
Merging drm-intel-fixes/for-linux-next-fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (36fc579761b5 drm/edid: Add EDID_QUIRK_FORCE_8BPC quirk for Rotel RSX-1058)
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
Merging mvebu/for-next (e8ba6e4b2558 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (6260ea543d4b Merge branch 'omap-for-v4.12/dt-droid4' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (a844f941617c Merge tag 'qcom-arm64-for-4.11-2' into final-for-4.11)
Merging renesas/next (3286f01bfa82 Merge branches 'arm64-defconfig-for-v4.12', 'arm64-dt-for-v4.12' and 'dt-for-v4.12' into next)
Merging rockchip/for-next (7d23379e3d44 Merge branch 'v4.12-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (9689628ec120 Merge branch 'for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends' into for-next)
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
Merging btrfs-kdave/for-next (439a0b8730e2 Merge branch 'for-next-current-v4.10-20170228' into for-next-20170228)
Merging ceph/master (54ea0046b6fe libceph, rbd, ceph: WRITE | ONDISK -> WRITE)
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
Merging overlayfs/overlayfs-next (51f8f3c4e225 ovl: drop CAP_SYS_RESOURCE from saved mounter's credentials)
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
Merging hwmon-staging/hwmon-next (b9c0ac30c1e8 dt: Add vendor prefix for Sensirion)
Merging jc_docs/docs-next (fd5d666932d5 Documentation/sphinx: fix primary_domain configuration)
Merging v4l-dvb/master (700ea5e0e0dd Merge tag 'v4.11-rc1' into patchwork)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (42f82367df2c video: fbdev: fsl-diu-fb: fix spelling mistake "palette")
Merging pm/linux-next (d0c92db75694 Merge branch 'pm-cpufreq-sched' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (6fefe19f5836 Merge branches 'thermal-core', 'thermal-soc', 'thermal-intel' and 'ida-conversion' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (8d70eeb84ab2 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
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
Merging spi-nor/next (7fa2c7038cc0 mtd: spi-nor: cqspi: remove redundant dead code on error return check)
Merging crypto/master (12cb3a1c4184 crypto: xts - Add ECB dependency)
Merging drm/drm-next (a44ddbcbbd72 Merge tag 'drm-misc-next-fixes-2017-02-27' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (181df2d458f3 drm/i915: Take rpm wakelock for releasing the fence on unbind)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (6cca3869c598 drm/rockchip: Fix link error when CONFIG_DRM_ANALOGIX_DP undefined)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_debugfs.c
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (57edb4bc581d drm/msm: move submit fence wait out of struct_mutex)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (751c5fae1940 drm: mali-dp: Fix smart layer not going to composition)
Merging sunxi/sunxi/for-next (d1bee31b9da7 Merge branches 'sunxi/clk-for-4.12', 'sunxi/core-for-4.12', 'sunxi/defconfig-for-4.12', 'sunxi/drm-for-4.12' and 'sunxi/dt-for-4.12' into sunxi/for-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sun4i/sun4i_drv.c
Applying: drm: sun4i: fixup for struct sun4i_crtc changes
Merging kspp/for-next/kspp (4b020bbc236f Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging sound-asoc/for-next (11471db21211 Merge remote-tracking branches 'asoc/topic/tlv320aic23', 'asoc/topic/ux500' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (0d4ec7849f5a MAINTAINERS: add tree for modules)
Merging input/next (4f95963558d4 Input: ad7879 - do not manipulate capability bits directly)
Merging block/for-next (d111d2a90084 Merge branch 'for-linus' into for-next)
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (2664f3c94abc dm raid: bump the target version)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (874f93fcf501 md-cluster: add the support for resize)
Merging mfd/for-mfd-next (e93c10211d03 mfd: lpc_ich: Enable watchdog on Intel Apollo Lake PCH)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (5208c1551fc5 Merge remote-tracking branches 'regulator/topic/ltc3589' and 'regulator/topic/ltc3676' into regulator-next)
Merging security/next (ca97d939db11 security: mark LSM hooks as __ro_after_init)
Merging integrity/next (20f482ab9e0f ima: allow to check MAY_APPEND)
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
Merging spi/for-next (bfb06be86e93 Merge remote-tracking branches 'spi/topic/bcm63xx', 'spi/topic/devprop', 'spi/topic/fsl-dspi', 'spi/topic/lantiq' and 'spi/topic/sc18is602' into spi-next)
Merging tip/auto-latest (b1460aed6ca3 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (4bd035eae255 EDAC, xgene: Fix wrongly spelled "procesing")
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (65a50c656276 ftrace/graph: Add ftrace_graph_max_depth kernel parameter)
Merging rcu/rcu/next (31945aa9f140 Merge branches 'doc.2017.01.15b', 'dyntick.2017.01.23a', 'fixes.2017.01.23a', 'srcu.2017.01.25a' and 'torture.2017.01.15b' into HEAD)
Merging kvm/linux-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (bcd3bb63dbc8 KVM: PPC: Book3S HV: Disable HPT resizing on POWER9 for now)
Merging kvms390/next (b2d8fdd12a40 KVM: s390: log runtime instrumentation enablement)
Merging xen-tip/linux-next (4610d240d691 xen/privcmd: add IOCTL_PRIVCMD_RESTRICT)
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (6dddfebdc1d7 platform/x86: asus-wmi: Remove quirk_no_rfkill)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (3f1318e01bb4 leds: core: use deferred probing if default trigger isn't available yet)
Merging ipmi/for-next (eb994594bc22 ipmi: bt-bmc: Use a regmap for register access)
Merging driver-core/driver-core-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb/usb-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-gadget/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-serial/usb-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging usb-chipidea-next/ci-for-usb-next (753dfd23612d usb: chipidea: msm: Fix return value check in ci_hdrc_msm_probe())
Merging phy-next/next (0b10f64dbe60 phy: qcom-ufs: Fix misplaced jump label)
Merging tty/tty-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging char-misc/char-misc-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging extcon/extcon-next (579ae3bb1369 extcon: int3496: Add dependency on X86 as it's Intel specific)
Merging staging/staging-next (34ff6c2fe366 Merge tag 'iio-for-4.12a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
$ git reset --hard HEAD^
Merging next-20170306 version of staging
Merging mux/for-next (a6606da0682c mux: adg792a: add mux controller driver for ADG792A/G)
Merging slave-dma/next (916444a10f96 Merge branch 'for-linus' into next)
Merging cgroup/for-next (697286206e6d Merge branch 'for-4.11-fixes' into for-next)
Merging scsi/for-next (42a70abddd90 scsi: qedi: Fix memory leak in tmf response processing.)
Merging scsi-mkp/for-next (8893cf6cb1cf scsi: mpt3sas: Avoid sleeping in interrupt context)
Merging target-updates/for-next (c87ba9c49c1f target: Add counters for ABORT_TASK success + failure)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (70683a7fd4a5 Merge branch 'for-4.12' into for-next)
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
Merging idr/idr-4.11 (ff0b5e9fcffe radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (ceff95e16be3 initramfs: provide a way to ignore image provided by bootloader)
Applying: linux-next-rejects
$ git checkout -b akpm remotes/origin/akpm/master
Applying: treewide: move set_memory_* functions away from cacheflush.h
Applying: treewide-move-set_memory_-functions-away-from-cacheflushh-fix
Applying: arm: use set_memory.h header
Applying: arm64: use set_memory.h header
Applying: arm64-use-set_memoryh-header-fix
Applying: s390: use set_memory.h header
Applying: x86: use set_memory.h header
Applying: agp: use set_memory.h header
Applying: drm: use set_memory.h header
Applying: intel_th: use set_memory.h header
Applying: drivers/watchdog/hpwdt.c: use set_memory.h header
Applying: include/linux/filter.h: use set_memory.h header
Applying: module: use set_memory.h header
Applying: kernel/power/snapshot.c: use set_memory.h header
Applying: sound/pci/hda/hda_intel.c: use set_memory.h header
Applying: treewide: decouple cacheflush.h and set_memory.h
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix-fix
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix-fix-fix
Applying: treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix-fix-fix-fix
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
Merging akpm/master (0f2d4cdf8ad2 scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances)
$ git reset --hard HEAD^
Merging akpm/master (0f2d4cdf8ad2 scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances)
