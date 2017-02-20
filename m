From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 20
Date: Mon, 20 Feb 2017 15:57:12 +1100
Message-ID: <20170220155712.12679438@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751875AbdBTE5Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Feb 2017 23:57:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20170217:

The pci tree gained a conflict (probably) against Linus' tree.

The kspp tree gained a conflict against the net-next tree.

The tip tree gained a conflict against the net-next tree.

The target-bva tree gained conflicts against the target-updates tree.

Non-merge commits (relative to Linus' tree): 9790
 10485 files changed, 445345 insertions(+), 205077 deletions(-)

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
Merging origin/master (137d01df511b Fix missing sanity check in /dev/sg)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (8ba605b607b7 ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant)
Merging arm-current/fixes (9e3440481845 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user())
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (3f91a89d424a powerpc/64: Disable use of radix under a hypervisor)
Merging sparc/master (f9a42e0d58cf Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging ipsec/master (e3dc847a5f85 vti6: Don't report path MTU below IPV6_MIN_MTU.)
Merging netfilter/master (f95d7a46bc57 netfilter: ctnetlink: Fix regression in CTA_HELP processing)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (52f5631a4c05 rtlwifi: rtl8192ce: Fix loading of incorrect firmware)
Merging mac80211/master (0c8ef291d976 Merge branch 'rhashtable-allocation-failure-during-insertion')
Merging sound-current/for-linus (af677166cf63 ALSA: hda - adding a new NV HDMI/DP codec ID in the driver)
Merging pci-current/for-linus (afe3e4d11bdf PCI/PME: Restore pcie_pme_driver.remove)
Merging driver-core.current/driver-core-linus (49def1853334 Linux 4.10-rc4)
Merging tty.current/tty-linus (49def1853334 Linux 4.10-rc4)
Merging usb.current/usb-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging usb-gadget-fixes/fixes (efe357f4633a usb: dwc2: host: fix Wmaybe-uninitialized warning)
Merging usb-serial-fixes/usb-linus (d07830db1bdb USB: serial: pl2303: add ATEN device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging char-misc.current/char-misc-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging input-current/for-linus (722c5ac708b4 Input: elan_i2c - add ELAN0605 to the ACPI table)
Merging crypto-current/master (7c2cf1c4615c crypto: chcr - Fix key length for RFC4106)
Merging ide/master (da095587e6be Revert "ide: Fix interface autodetection in legacy IDE driver (trial #2)")
Merging vfio-fixes/for-linus (930a42ded3fe vfio/spapr_tce: Set window when adding additional groups to container)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (f9c85ee67164 [media] siano: make it work again with CONFIG_VMAP_STACK)
Merging drm-intel-fixes/for-linux-next-fixes (7089db84e356 Linux 4.10-rc8)
Merging drm-misc-fixes/for-linux-next-fixes (bb08c04dc867 drm/dp/mst: fix kernel oops when turning off secondary monitor)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (cb62c51ca166 Merge branches 'fixes', 'kuser', 'misc' and 'sa1100-base' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (93f0a7522a39 arm-soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
Merging amlogic/for-next (2452b94d227c Merge v4.11/dt64)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (e514f82c67c1 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
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
Merging tegra/for-next (6ef2dbf97439 Merge branch for-4.11/i2c into for-next)
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
Merging mips/mips-for-linux-next (cfd75c2db17e MIPS: VDSO: Explicitly use -fno-asynchronous-unwind-tables)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (07d7c4560b7a openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (6c8f9ad566dd Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/asm-offsets.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (1228f7befbf3 s390: add missing "do {} while (0)" loop constructs to multiline macros)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6e72293ab0e9 xtensa: fix noMMU build on cores with MMU)
Merging fscrypt/master (b14c8e6afd87 fscrypt: properly declare on-stack completion)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (816d15aff46f Merge branch 'for-next-current-v4.10-20170216' into for-next-20170216)
Merging ceph/master (6df8c9d80a27 ceph: fix bad endianness handling in parse_reply_info_extra)
Merging cifs/for-next (ae6f8dd4d0c8 CIFS: Allow to switch on encryption with seal mount option)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (6c71100db53e fanotify: simplify the code of fanotify_merge)
Merging ext4/dev (2ba3e6e8afc9 ext4: fix fencepost in s_first_meta_bg validation)
Merging f2fs/dev (aacf533a90a7 f2fs: super: constify fscrypt_operations structure)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (84588a93d097 fuse: fix uninitialized flags in pipe_buffer)
Merging gfs2/for-next (c548a1c17560 gfs2: Make gfs2_write_full_page static)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging nfsd/nfsd-next (7323f0d2881b NFSD: Reserve adequate space for LOCKT operation)
Merging orangefs/for-next (eb68d0324dc4 orangefs: fix buffer size mis-match between kernel space and user space.)
Merging overlayfs/overlayfs-next (51f8f3c4e225 ovl: drop CAP_SYS_RESOURCE from saved mounter's credentials)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (8d242e932fb7 xfs: remove XFS_ALLOCTYPE_ANY_AG and XFS_ALLOCTYPE_START_AG)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (59479ae85e43 Merge branches 'work.sendmsg' and 'work.splice-net' into for-next)
CONFLICT (content): Merge conflict in drivers/block/nbd.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (bfe219d373ca vfs: wrap write f_ops with file_{start,end}_write())
Merging printk/for-next (d9c23523ed98 printk: drop call_console_drivers() unused param)
Merging pci/next (60ab114c68d0 Merge branch 'pci/host-exynos' into next)
CONFLICT (content): Merge conflict in drivers/pci/dwc/pcie-designware-host.c
Merging pstore/for-next/pstore (fc1b326efd27 MAINTAINERS: Adjust pstore git repo URI, add files)
Merging hid/for-next (aaffe2b03d64 Merge branch 'for-4.11/intel-ish' into for-next)
Merging i2c/i2c/for-next (ef886d769611 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (2f1736ff0664 hwmon: (sht15) Add device tree support)
Merging jc_docs/docs-next (62924fd789c6 Add a target to check broken external links in the Documentation)
Merging v4l-dvb/master (9eeb0ed0f309 [media] mtk-vcodec: fix build warnings without DEBUG)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (0704916a4b24 video: fbdev: fsl-diu-fb: remove impossible condition)
Merging pm/linux-next (14a05f0baaf1 Merge branch 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in arch/mips/configs/lemote2f_defconfig
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (761bb99d2d44 Merge branches 'thermal-core', 'thermal-intel', 'thermal-soc' and 'ida-conversion' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (f787d1debf63 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (7785bba299a8 esp: Add a software GRO codepath)
Merging netfilter-next/master (8f9000a565d0 net:ethernet:aquantia: Add 2500/5000 mbit link modes support.)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (4e33e3462510 tcp: use page_ref_inc() in tcp_sendmsg())
Merging bluetooth/master (8f91566f99fa btmrvl: fix spelling mistake: "actived" -> "activated")
Merging mac80211-next/master (272019c74d8c wireless: Set NL80211_EXT_FEATURE_CQM_RSSI_LIST in multiple drivers)
Merging rdma/for-next (9294000d6d89 IB/srp: Drain the send queue before destroying a QP)
Applying: RDMA/bnxt_re: fix for "bnxt_en: Update to firmware interface spec 1.7.0."
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (a4077ce58713 mtd: nand: Add Winbond manufacturer id)
Merging spi-nor/next (7fa2c7038cc0 mtd: spi-nor: cqspi: remove redundant dead code on error return check)
Merging crypto/master (dcd36c436c9c crypto: brcm - Avoid double free in ahash_finup())
Merging drm/drm-next (9ca70356a926 Revert "drm: Resurrect atomic rmfb code, v3")
CONFLICT (content): Merge conflict in lib/Kconfig
CONFLICT (content): Merge conflict in include/drm/drm_connector.h
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_sprite.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_fbc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_connector.c
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (998d75730b40 drm/i915: Fix not finding the VBT when it overlaps with OPREGION_ASLE_EXT)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (2220fc1ab363 uapi: add missing install of dma-buf.h)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (21c42da18ef1 drm/msm: return -EFAULT if copy_from_user() fails)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (83d642ee6dbe drm: mali-dp: fix stride setting for multi-plane formats)
Merging sunxi/sunxi/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging kspp/for-next/kspp (0135ba02e1be Merge branch 'for-next/usercopy' into for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/filter.h
CONFLICT (content): Merge conflict in arch/s390/Kconfig.debug
CONFLICT (content): Merge conflict in arch/arm/configs/aspeed_g5_defconfig
CONFLICT (content): Merge conflict in arch/Kconfig
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (3bb9eca91302 ALSA: emu10k1: constify snd_emux_operators structure)
Merging sound-asoc/for-next (141dee78c40a Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (91168dd66096 module: fix memory leak on early load_module() failures)
Merging input/next (b0c9d043d4ae Merge tag 'ib-mfd-input-v4.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into next)
CONFLICT (content): Merge conflict in drivers/input/rmi4/Kconfig
Merging block/for-next (3695539290d7 Merge branch 'for-4.11/block' into for-next)
CONFLICT (content): Merge conflict in drivers/block/nbd.c
Applying: scsi: mpt3sas: fix up for "block: fold cmd_type into the REQ_OP_ space"
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (d67a5f4b5947 dm: flush queued bios when process blocks to avoid deadlock)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (8c7cdbf9272c mmc: core: add mmc prefix for blk_fixups)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (776b98b4bef4 RAID1: avoid unnecessary spin locks in I/O barrier code)
Merging mfd/for-mfd-next (e93c10211d03 mfd: lpc_ich: Enable watchdog on Intel Apollo Lake PCH)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (877fe823a0ad Merge remote-tracking branches 'regulator/topic/s2mpa01', 'regulator/topic/supplies' and 'regulator/topic/tps65217' into regulator-next)
Merging security/next (52176603795c KEYS: Use memzero_explicit() for secret data)
Applying: selinux: merge fix for "smc: establish new socket family"
Merging integrity/next (20f482ab9e0f ima: allow to check MAY_APPEND)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (1ea0ce40690d selinux: allow changing labels for cgroupfs)
Merging tpmdd/next (51b0be640cf6 tpm: Fix expected number of response bytes of TPM1.2 PCR Extend)
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (8d2932dd0634 Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/smmu', 'arm/mediatek', 'arm/core', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (0ca582fd0463 vfio: Replace module request with softdep)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (fe8e52b9b910 audit: remove unnecessary curly braces from switch/case statements)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (bd0096d7467f of: Add missing space at end of pr_fmt().)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (827498a19804 Merge remote-tracking branches 'spi/topic/ti-qspi' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (1098ea741fc4 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in security/apparmor/include/apparmor.h
CONFLICT (content): Merge conflict in kernel/extable.c
CONFLICT (content): Merge conflict in include/linux/kref.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig.debug
CONFLICT (content): Merge conflict in arch/powerpc/kernel/asm-offsets.c
CONFLICT (content): Merge conflict in arch/openrisc/include/asm/Kbuild
Applying: locking/atomic, kref: merge fixup for code movement
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (75bf2f6478ca EDAC, mce_amd: Print IPID and Syndrome on a separate line)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (3962d9226404 Merge branch 'for-next/ftrace/core' into temp)
Merging rcu/rcu/next (31945aa9f140 Merge branches 'doc.2017.01.15b', 'dyntick.2017.01.23a', 'fixes.2017.01.23a', 'srcu.2017.01.25a' and 'torture.2017.01.15b' into HEAD)
Merging kvm/linux-next (b95234c84004 kvm: x86: do not use KVM_REQ_EVENT for APICv interrupt injection)
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (bcd3bb63dbc8 KVM: PPC: Book3S HV: Disable HPT resizing on POWER9 for now)
Merging kvms390/next (260a1d6afe2e KVM: s390: log runtime instrumentation enablement)
Merging xen-tip/linux-next (4610d240d691 xen/privcmd: add IOCTL_PRIVCMD_RESTRICT)
Merging percpu/for-next (966d2b04e070 percpu-refcount: fix reference leak during percpu-atomic transition)
Merging workqueues/for-next (a45463cbf3f9 workqueue: avoid clang warning)
Merging drivers-x86/for-next (1aa758d3a548 platform/x86: thinkpad_acpi: Call led_classdev_notify_brightness_hw_changed on kbd brightness change)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (fb3d769173d2 leds: ledtrig-heartbeat: Make top brightness adjustable)
Merging ipmi/for-next (db3b7e134185 char: ipmi: constify ipmi_smi_handlers structures)
Merging driver-core/driver-core-next (17627157cda1 kernfs: handle null pointers while printing node name and path)
CONFLICT (content): Merge conflict in include/linux/kref.h
Merging usb/usb-next (0df8a3dbacb5 Merge tag 'usb-serial-4.11-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging usb-gadget/next (e42a5dbb8a3d usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions)
Merging usb-serial/usb-next (beabdc3cd3e3 USB: serial: keyspan: drop header file)
Merging usb-chipidea-next/ci-for-usb-next (753dfd23612d usb: chipidea: msm: Fix return value check in ci_hdrc_msm_probe())
Merging phy-next/next (0b10f64dbe60 phy: qcom-ufs: Fix misplaced jump label)
Merging tty/tty-next (d8a4995bcea1 tty: pl011: Work around QDF2400 E44 stuck BUSY bit)
Merging char-misc/char-misc-next (6cf18e6927c0 goldfish: Sanitize the broken interrupt handler)
CONFLICT (content): Merge conflict in Documentation/driver-api/index.rst
Merging extcon/extcon-next (3573d97d840c extcon: palmas: Don't miss GPIO events during suspend/resume)
Merging staging/staging-next (0a441275018b Staging: vc04_services: Fix the "space prohibited" code style errors)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_parallel.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_parallel.c left in tree.
$ git rm -f drivers/staging/media/lirc/lirc_parallel.c
Merging slave-dma/next (298115af3450 Merge branch 'for-linus' into next)
Merging cgroup/for-next (63f1ca59453a Merge branch 'cgroup/for-4.11-rdmacg' into cgroup/for-4.11)
Merging scsi/for-next (1d483bda11e8 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (d1da522fb8a7 scsi: megaraid_sas: handle dma_addr_t right on 32-bit)
Merging target-updates/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (d022785b1acc qla2xxx: Fix a warning reported by the "smatch" static checker)
CONFLICT (content): Merge conflict in include/target/iscsi/iscsi_transport.h
CONFLICT (content): Merge conflict in drivers/target/iscsi/iscsi_target.c
CONFLICT (content): Merge conflict in drivers/target/iscsi/cxgbit/cxgbit_target.c
Merging libata/for-next (428d57c1683a Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (80363894995b virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (96e3485759b7 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (deab2b0524aa gpio: pci-idio-16: Fix PCI BAR index)
CONFLICT (content): Merge conflict in drivers/staging/greybus/gpio.c
Applying: serial: st-asc: Use new GPIOD API to obtain RTS pin
Merging pinctrl/for-next (baafacab092e pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data())
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (38b0a526ec33 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (fea6d2a610c8 vfs: Use upper filesystem inode in bprm_fill_uid())
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (68bd42d97c30 selftests/powerpc: Fix remaining fallout from recent changes)
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/Makefile
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (372e2db7210d livepatch: doc: remove the limitation for schedule() patching)
Merging coresight/next (bfbe02e3e1ba coresight: etm3x: Correctly output counter values in sysfs node)
Merging rtc/rtc-next (b180cf8b0bce rtc: m48t86: add NVRAM support)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bfb34527a32a libnvdimm, pfn: fix memmap reservation size versus 4K alignment)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging extable/extable (90858794c960 module.h: remove extable.h include now users have migrated)
Merging idr/idr-4.11 (768dd325a382 radix tree test suite: Run iteration tests for longer)
Merging akpm-current/current (ae8f7647f968 scatterlist: do not disable IRQs in sg_copy_buffer)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in include/linux/kprobes.h
CONFLICT (content): Merge conflict in include/linux/iomap.h
CONFLICT (content): Merge conflict in include/linux/dax.h
CONFLICT (content): Merge conflict in fs/iomap.c
CONFLICT (content): Merge conflict in fs/dax.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in arch/score/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/m32r/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
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
Applying: mm: add arch-independent testcases for RODATA
Applying: mm: testcases for RODATA: fix config dependency
Merging akpm/master (616a11e2fecf mm: testcases for RODATA: fix config dependency)
