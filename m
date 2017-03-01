From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 1
Date: Wed, 1 Mar 2017 13:03:23 +1100
Message-ID: <20170301130323.62c09ba3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751557AbdCACDe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Feb 2017 21:03:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Please do not add any material intended for v4.12 to your linux-next
included branches until after v4.11-rc1 has been released.

Changes since 20170228:

The vfs tree still had its build failure for which I added a fix patch.

Non-merge commits (relative to Linus' tree): 827
 865 files changed, 52096 insertions(+), 18896 deletions(-)

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
Merging origin/master (d4f4cf77b37e Merge branch 'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm)
Merging fixes/master (c470abd4fde4 Linux 4.10)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (8ba605b607b7 ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant)
Merging arm-current/fixes (9e3440481845 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user())
Merging m68k-current/for-linus (3dfe33020ca8 m68k/sun3: Remove dead code in paging_init())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (c470abd4fde4 Linux 4.10)
Merging sparc/master (f8e6859ea9d0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (2f44f75257d5 Merge branch 'qed-fixes')
Merging ipsec/master (e3dc847a5f85 vti6: Don't report path MTU below IPV6_MIN_MTU.)
Merging netfilter/master (29e09229d9f2 netfilter: use skb_to_full_sk in ip_route_me_harder)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (52f5631a4c05 rtlwifi: rtl8192ce: Fix loading of incorrect firmware)
Merging mac80211/master (19d19e960598 mac80211: use driver-indicated transmitter STA only for data frames)
Merging sound-current/for-linus (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging pci-current/for-linus (c0464062bfea PCI: dwc: Fix crashes seen due to missing assignments)
Merging driver-core.current/driver-core-linus (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging tty.current/tty-linus (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging usb.current/usb-linus (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging usb-gadget-fixes/fixes (efe357f4633a usb: dwc2: host: fix Wmaybe-uninitialized warning)
Merging usb-serial-fixes/usb-linus (d07830db1bdb USB: serial: pl2303: add ATEN device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (6cf1bf636a06 staging: vchiq_2835_arm: Make cache-line-size a required DT property)
Merging char-misc.current/char-misc-linus (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging input-current/for-linus (6e11617fcff3 Merge branch 'next' into for-linus)
Merging crypto-current/master (3b30460c5b0e crypto: ccm - move cbcmac input off the stack)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (930a42ded3fe vfio/spapr_tce: Set window when adding additional groups to container)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (9eeb0ed0f309 [media] mtk-vcodec: fix build warnings without DEBUG)
Merging drm-intel-fixes/for-linux-next-fixes (c470abd4fde4 Linux 4.10)
Merging drm-misc-fixes/for-linux-next-fixes (bb08c04dc867 drm/dp/mst: fix kernel oops when turning off secondary monitor)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (17a870bea3b8 Merge branches 'fixes' and 'misc'; commit 'kuser^{/add CPU_THUMB_CAPABLE to indicate}' into for-linus)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (93f0a7522a39 arm-soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
Merging amlogic/for-next (2452b94d227c Merge v4.11/dt64)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (f5fde64706f0 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (8d6e1b09237b Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (57aba12f97c2 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (e8ba6e4b2558 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (2b6a9eabd44e Merge branch 'omap-for-v4.10/fixes' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (a844f941617c Merge tag 'qcom-arm64-for-4.11-2' into final-for-4.11)
Merging renesas/next (59fd3e06b3d7 Merge branches 'arm64-dt-for-v4.11', 'dt-for-v4.11' and 'soc-for-v4.11' into next)
Merging rockchip/for-next (0aab64671deb Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (9689628ec120 Merge branch 'for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends' into for-next)
Merging tegra/for-next (10e459de8497 Merge branch for-4.11/i2c into for-next)
Merging arm64/for-next/core (ffe7afd17135 arm64/kprobes: consistently handle MRS/MSR with XZR)
Merging clk/clk-next (f59de563358e clk: renesas: mstp: ensure register writes complete)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
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
Merging parisc-hd/for-next (d85daeae23d4 parisc: Enhance detection if cr16 clocksources are synchronous)
Merging powerpc/next (9f3768e02335 powerpc: Remove leftover cputime_to_nsecs call causing build error)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/asm-offsets.c
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (fb94a687d96c s390: TASK_SIZE for kernel threads)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6e72293ab0e9 xtensa: fix noMMU build on cores with MMU)
Merging fscrypt/master (6f69f0ed6136 fscrypt: constify struct fscrypt_operations)
Merging befs/for-next (7ce7d89f4883 Linux 4.10-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (439a0b8730e2 Merge branch 'for-next-current-v4.10-20170228' into for-next-20170228)
Merging ceph/master (54ea0046b6fe libceph, rbd, ceph: WRITE | ONDISK -> WRITE)
Merging cifs/for-next (f1ef09fde17f Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (6c71100db53e fanotify: simplify the code of fanotify_merge)
Merging ext4/dev (cab7076a185e Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging f2fs/dev (900f736251c8 f2fs: avoid to flush nat journal entries)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9a87ad3da905 fuse: release: private_data cannot be NULL)
Merging gfs2/for-next (5bcbe22ca47d Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (c470abd4fde4 Linux 4.10)
Merging nfsd/nfsd-next (ff7d11797e72 nfsd: Fix display of the version string)
Merging orangefs/for-next (e98bdb3059cb Merge tag 'v4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into for-next)
Merging overlayfs/overlayfs-next (51f8f3c4e225 ovl: drop CAP_SYS_RESOURCE from saved mounter's credentials)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (8d242e932fb7 xfs: remove XFS_ALLOCTYPE_ANY_AG and XFS_ALLOCTYPE_START_AG)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (9e9c5ba8bd70 Merge branch 'work.statx' into for-next)
CONFLICT (content): Merge conflict in fs/proc/base.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Applying: statx: disable the sample code for now
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (d9c23523ed98 printk: drop call_console_drivers() unused param)
Merging pci/next (c4d052ce970e Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (fc1b326efd27 MAINTAINERS: Adjust pstore git repo URI, add files)
Merging hid/for-next (b03fa3ca9c90 Merge branch 'for-4.11/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (ce3496c8d5ff Merge branch 'i2c/for-4.11' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (2f1736ff0664 hwmon: (sht15) Add device tree support)
Merging jc_docs/docs-next (bd8562626c8e docs / driver-api: Fix structure references in device_link.rst)
Merging v4l-dvb/master (e6b377dbbb94 Merge tag 'v4.10' into patchwork)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (42f82367df2c video: fbdev: fsl-diu-fb: fix spelling mistake "palette")
Merging pm/linux-next (3410e937bb6f Merge branch 'acpi-apei' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (6fefe19f5836 Merge branches 'thermal-core', 'thermal-soc', 'thermal-intel' and 'ida-conversion' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (f1ef09fde17f Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging ipsec-next/master (7785bba299a8 esp: Add a software GRO codepath)
Merging netfilter-next/master (f1ef09fde17f Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (4e33e3462510 tcp: use page_ref_inc() in tcp_sendmsg())
Merging bluetooth/master (8f91566f99fa btmrvl: fix spelling mistake: "actived" -> "activated")
Merging mac80211-next/master (090874bbcbd2 mac80211_hwsim: Make sure NEW_RADIO contains final name)
Merging rdma/for-next (9294000d6d89 IB/srp: Drain the send queue before destroying a QP)
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (a4077ce58713 mtd: nand: Add Winbond manufacturer id)
Merging spi-nor/next (7fa2c7038cc0 mtd: spi-nor: cqspi: remove redundant dead code on error return check)
Merging crypto/master (12cb3a1c4184 crypto: xts - Add ECB dependency)
Merging drm/drm-next (a44ddbcbbd72 Merge tag 'drm-misc-next-fixes-2017-02-27' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (998d75730b40 drm/i915: Fix not finding the VBT when it overlaps with OPREGION_ASLE_EXT)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (888022c0473d dma-buf: add support for compat ioctl)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (21c42da18ef1 drm/msm: return -EFAULT if copy_from_user() fails)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (83d642ee6dbe drm: mali-dp: fix stride setting for multi-plane formats)
Merging sunxi/sunxi/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging kspp/for-next/kspp (4b020bbc236f Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (f3ac9f737603 ALSA: seq: Fix link corruption by event error handling)
Merging sound-asoc/for-next (141dee78c40a Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (0d4ec7849f5a MAINTAINERS: add tree for modules)
Merging input/next (6afb6b6ed866 Input: ad7846 - move bindings to touchscreen subdirectory)
Merging block/for-next (3695539290d7 Merge branch 'for-4.11/block' into for-next)
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (2664f3c94abc dm raid: bump the target version)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (86292b33d4b7 Merge branch 'akpm' (patches from Andrew))
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (41aecb6f9d3b md/raid1/10: fix potential deadlock)
Merging mfd/for-mfd-next (e93c10211d03 mfd: lpc_ich: Enable watchdog on Intel Apollo Lake PCH)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (877fe823a0ad Merge remote-tracking branches 'regulator/topic/s2mpa01', 'regulator/topic/supplies' and 'regulator/topic/tps65217' into regulator-next)
Merging security/next (61841be6358c tpm: declare tpm2_get_pcr_allocation() as static)
Merging integrity/next (20f482ab9e0f ima: allow to check MAY_APPEND)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (b2a607a8f39c selinux: constify nlmsg permission tables)
Merging tpmdd/next (61841be6358c tpm: declare tpm2_get_pcr_allocation() as static)
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (8d2932dd0634 Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/smmu', 'arm/mediatek', 'arm/core', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d9d84780f17c vfio: fix a typo in comment of function vfio_pin_pages)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (fe8e52b9b910 audit: remove unnecessary curly braces from switch/case statements)
Merging devicetree/for-next (4e29ccdb240e DT: add Faraday Tec. as vendor)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (827498a19804 Merge remote-tracking branches 'spi/topic/ti-qspi' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (571caca4ae9c Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (add/add): Merge conflict in drivers/edac/edac_mc.h
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (add/add): Merge conflict in Documentation/admin-guide/ras.rst
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (75bf2f6478ca EDAC, mce_amd: Print IPID and Syndrome on a separate line)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (7ce2040796fd Merge branch 'for-next/ftrace/core-2' into temp)
Merging rcu/rcu/next (31945aa9f140 Merge branches 'doc.2017.01.15b', 'dyntick.2017.01.23a', 'fixes.2017.01.23a', 'srcu.2017.01.25a' and 'torture.2017.01.15b' into HEAD)
Merging kvm/linux-next (fd7e9a883484 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (bcd3bb63dbc8 KVM: PPC: Book3S HV: Disable HPT resizing on POWER9 for now)
Merging kvms390/next (b2d8fdd12a40 KVM: s390: log runtime instrumentation enablement)
Merging xen-tip/linux-next (4610d240d691 xen/privcmd: add IOCTL_PRIVCMD_RESTRICT)
Merging percpu/for-next (966d2b04e070 percpu-refcount: fix reference leak during percpu-atomic transition)
Merging workqueues/for-next (a45463cbf3f9 workqueue: avoid clang warning)
Merging drivers-x86/for-next (af050abb5c2e platform/x86: intel_turbo_max_3: make it explicitly non-modular)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (fb3d769173d2 leds: ledtrig-heartbeat: Make top brightness adjustable)
Merging ipmi/for-next (eb994594bc22 ipmi: bt-bmc: Use a regmap for register access)
Merging driver-core/driver-core-next (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging usb/usb-next (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging usb-gadget/next (e42a5dbb8a3d usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions)
Merging usb-serial/usb-next (beabdc3cd3e3 USB: serial: keyspan: drop header file)
Merging usb-chipidea-next/ci-for-usb-next (753dfd23612d usb: chipidea: msm: Fix return value check in ci_hdrc_msm_probe())
Merging phy-next/next (0b10f64dbe60 phy: qcom-ufs: Fix misplaced jump label)
Merging tty/tty-next (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging char-misc/char-misc-next (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging extcon/extcon-next (2f80adb138db extcon: int3496: Add GPIO ACPI mapping table)
Merging staging/staging-next (bc49a7831b11 Merge branch 'akpm' (patches from Andrew))
Merging slave-dma/next (235840692925 Merge branch 'fixes' into next)
Merging cgroup/for-next (f83f3c515654 kernfs: fix locking around kernfs_ops->release() callback)
Merging scsi/for-next (2559a1ef688f scsi: mac_scsi: Fix MAC_SCSI=m option when SCSI=m)
Merging scsi-mkp/for-next (42a70abddd90 scsi: qedi: Fix memory leak in tmf response processing.)
Merging target-updates/for-next (c87ba9c49c1f target: Add counters for ABORT_TASK success + failure)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (428d57c1683a Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (80363894995b virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (349709ba5bea Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (3498d8694d41 gpio: reintroduce devm_get_gpiod_from_child())
Merging pinctrl/for-next (baafacab092e pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data())
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (38b0a526ec33 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (ace0c791e6c3 proc/sysctl: Don't grab i_lock under sysctl_lock.)
Merging ktest/for-next (5739438b725c ktest: Add variable run_command_status to save status of commands executed)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (68bd42d97c30 selftests/powerpc: Fix remaining fallout from recent changes)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (372e2db7210d livepatch: doc: remove the limitation for schedule() patching)
Merging coresight/next (dc83e0549ea1 coresight: Fixes coresight DT parse to get correct output port ID.)
Merging rtc/rtc-next (d4f6c6f15a1f rtc: ds3232: Call device_init_wakeup before device_register)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bfb34527a32a libnvdimm, pfn: fix memmap reservation size versus 4K alignment)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (c6ce3e2fe3da radix tree test suite: Add config option for map shift)
Merging akpm-current/current (c2118ec0a377 scripts/gdb: add lx-fdtdump command)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "disble(d)" pattern and fix typo instances
Applying: scripts/spelling.txt: add "overide" pattern and fix typo instances
Merging akpm/master (4368f3e7a5af scripts/spelling.txt: add "overide" pattern and fix typo instances)
