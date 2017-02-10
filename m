From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 10
Date: Fri, 10 Feb 2017 18:56:04 +1100
Message-ID: <20170210185604.0063e901@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20170209:

The l2mtd-tree still had ist build failure so I used the version from
next-20170208.

The kvm tree gained conflicts against the powerpc tree.

The akpm-current tree gained conflicts against the xfs tree.

The akpm tree gained a conflict against the net tree.

Non-merge commits (relative to Linus' tree): 8369
 9421 files changed, 356691 insertions(+), 174353 deletions(-)

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

I am currently merging 256 trees (counting Linus' and 37 trees of bug
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
Merging origin/master (55aac6ef53e1 Merge git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (c7858bf16c0b asm-prototypes: Clear any CPP defines before declaring the functions)
Merging arc-current/for-curr (8ba605b607b7 ARC: [plat-*] ARC_HAS_COH_CACHES no longer relevant)
Merging arm-current/fixes (228dbbfb5d77 ARM: 8643/3: arm/ptrace: Preserve previous registers for short regset write)
Merging m68k-current/for-linus (ad595b77c4a8 m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (f83e6862047e powerpc/powernv: Properly set "host-ipi" on IPIs)
Merging sparc/master (f9a42e0d58cf Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (bb1a619735b4 net: phy: Initialize mdio clock at probe function)
Merging ipsec/master (4e5da369df64 Documentation/networking: fix typo in mpls-sysctl)
Merging netfilter/master (f95d7a46bc57 netfilter: ctnetlink: Fix regression in CTA_HELP processing)
Merging ipvs/master (045169816b31 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging wireless-drivers/master (52f5631a4c05 rtlwifi: rtl8192ce: Fix loading of incorrect firmware)
Merging mac80211/master (fd551bac4795 nl80211: Fix mesh HT operation check)
Merging sound-current/for-linus (af677166cf63 ALSA: hda - adding a new NV HDMI/DP codec ID in the driver)
Merging pci-current/for-linus (d98e0929071e Revert "PCI: pciehp: Add runtime PM support for PCIe hotplug ports")
Merging driver-core.current/driver-core-linus (49def1853334 Linux 4.10-rc4)
Merging tty.current/tty-linus (49def1853334 Linux 4.10-rc4)
Merging usb.current/usb-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging usb-gadget-fixes/fixes (efe357f4633a usb: dwc2: host: fix Wmaybe-uninitialized warning)
Merging usb-serial-fixes/usb-linus (d07830db1bdb USB: serial: pl2303: add ATEN device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (7ce7d89f4883 Linux 4.10-rc1)
Merging staging.current/staging-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging char-misc.current/char-misc-linus (d5adbfcd5f7b Linux 4.10-rc7)
Merging input-current/for-linus (413d37326700 Input: synaptics-rmi4 - select 'SERIO' when needed)
Merging crypto-current/master (7c2cf1c4615c crypto: chcr - Fix key length for RFC4106)
Merging ide/master (da095587e6be Revert "ide: Fix interface autodetection in legacy IDE driver (trial #2)")
Merging vfio-fixes/for-linus (930a42ded3fe vfio/spapr_tce: Set window when adding additional groups to container)
Merging kselftest-fixes/fixes (7738789fba09 selftests: x86/pkeys: fix spelling mistake: "itertation" -> "iteration")
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1a41741fd60b mfd: wm8994-core: Don't use managed regulator bulk get API)
Merging v4l-dvb-fixes/fixes (f9f96fc10c09 [media] cec: fix wrong last_la determination)
Merging drm-intel-fixes/for-linux-next-fixes (6e7eb1783be7 drm/i915: Always convert incoming exec offsets to non-canonical)
Merging drm-misc-fixes/for-linux-next-fixes (49d29a077af8 drm: vc4: adapt to new behaviour of drm_crtc.c)
Merging kbuild/for-next (fde42bfcd232 genksyms: Regenerate parser)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (1ba318e23204 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (0c744ea4f77d Linux 4.10-rc2)
Merging arm-soc/for-next (3461b12aebf5 Merge branches 'next/arm64' and 'next/dt64' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
Merging amlogic/for-next (700501d48123 Merge v4.11/dt64)
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (e514f82c67c1 Merge tag 'at91-ab-4.11-dt2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (8d6e1b09237b Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (57aba12f97c2 Merge branch 'zte/pm-domains' into for-next)
Merging keystone/next (9e07c85a01ec Merge branch 'for_4.11/keystone_dts' into next)
Merging mvebu/for-next (f8e8eda32b4a Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (bfdc40158227 Merge branch 'omap-for-v4.11/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (a844f941617c Merge tag 'qcom-arm64-for-4.11-2' into final-for-4.11)
Merging renesas/next (59fd3e06b3d7 Merge branches 'arm64-dt-for-v4.11', 'dt-for-v4.11' and 'soc-for-v4.11' into next)
Merging rockchip/for-next (0aab64671deb Merge branch 'v4.11-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (9689628ec120 Merge branch 'for-v4.11/drivers-soc-exynos-pmu-the-joy-never-ends' into for-next)
Merging tegra/for-next (6ef2dbf97439 Merge branch for-4.11/i2c into for-next)
Merging arm64/for-next/core (2bf47e194608 arm64: head.S: Enable EL1 (host) access to SPE when entered at EL2)
Merging clk/clk-next (09bdcd6e1784 clk: sunxi-ng: sun9i-a80: Fix wrong pointer passed to PTR_ERR())
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (ecdc35c45398 m68k: Delete an unnecessary variable assignment in sys_cacheflush())
Merging m68knommu/for-next (dd51779bf9a6 m68k/defconfig: amcore board defconfig tuning)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (b9564010df62 MIPS: Fix protected_cache(e)_op() for microMIPS)
Merging nios2/for-next (744606c76c4a nios2: add screen_info)
Merging openrisc/for-next (07d7c4560b7a openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (69973b830859 Linux 4.9)
Merging powerpc/next (de55ce0de94b Documentation: powerpc/fsl: Update compatible for l2cache binding)
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (57d7f939e7bd s390: add no-execute support)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (14e73e78ee98 tile: use __ro_after_init instead of tile-specific __write_once)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6e72293ab0e9 xtensa: fix noMMU build on cores with MMU)
Merging fscrypt/master (b14c8e6afd87 fscrypt: properly declare on-stack completion)
Merging befs/for-next (f7b75aaed5ef befs: add NFS export support)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (d29384cee18a Merge branch 'for-next-current-v4.10-20170208' into for-next-20170208)
Merging ceph/master (6df8c9d80a27 ceph: fix bad endianness handling in parse_reply_info_extra)
Merging cifs/for-next (ae6f8dd4d0c8 CIFS: Allow to switch on encryption with seal mount option)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (6c71100db53e fanotify: simplify the code of fanotify_merge)
Merging ext4/dev (168316db3583 dax: assert that i_rwsem is held exclusive for writes)
Merging f2fs/dev (cccc259d00f5 f2fs: fix a typo in f2fs.txt)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (210675270caa fuse: fix time_to_jiffies nsec sanity check)
Merging gfs2/for-next (c548a1c17560 gfs2: Make gfs2_write_full_page static)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging nfsd/nfsd-next (81fa3275f95a svcrdma: Poll CQs in "workqueue" mode)
Merging orangefs/for-next (eb68d0324dc4 orangefs: fix buffer size mis-match between kernel space and user space.)
Merging overlayfs/overlayfs-next (51f8f3c4e225 ovl: drop CAP_SYS_RESOURCE from saved mounter's credentials)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (4560e78f40cb xfs: don't block the log commit handler for discards)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (59479ae85e43 Merge branches 'work.sendmsg' and 'work.splice-net' into for-next)
CONFLICT (content): Merge conflict in drivers/block/nbd.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (bfe219d373ca vfs: wrap write f_ops with file_{start,end}_write())
Merging printk/for-next (d9c23523ed98 printk: drop call_console_drivers() unused param)
Merging pci/next (83a96ebd0efa Merge branch 'pci/host-thunder' into next)
Merging pstore/for-next/pstore (0c744ea4f77d Linux 4.10-rc2)
Merging hid/for-next (075b896bb38f Merge branch 'for-4.11/intel-ish' into for-next)
Merging i2c/i2c/for-next (fc51222d5070 Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0c744ea4f77d Linux 4.10-rc2)
Merging hwmon-staging/hwmon-next (646933284e46 DT: add binding documentation for STTS751)
Merging jc_docs/docs-next (dc36143fba93 docs: Remove the copyright year from conf.py)
Merging v4l-dvb/master (9eeb0ed0f309 [media] mtk-vcodec: fix build warnings without DEBUG)
Merging v4l-dvb-next/master (7b2a4ddd20ce Merge branch 'patchwork' into to_next)
Merging fbdev/fbdev-for-next (0704916a4b24 video: fbdev: fsl-diu-fb: remove impossible condition)
Merging pm/linux-next (a818559a1469 Merge branch 'pm-tools' into linux-next)
CONFLICT (content): Merge conflict in arch/mips/configs/lemote2f_defconfig
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (7b09ae6042cd Merge branches 'ida-conversion' and 'for-rc' into next)
Merging thermal-soc/next (4f47aff5201c Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (f1225ee4c8fc swiotlb-xen: update dev_addr after swapping pages)
Merging net-next/master (c0e4dadb3494 net: dsa: mv88e6xxx: Move forward declaration to where it is needed)
Applying: smc: merge fix for "switch socket ->splice_read() to struct file *"
Merging ipsec-next/master (152bff377653 Merge branch 'bridge-improve-cache-utilization')
Merging netfilter-next/master (935b7f643018 netfilter: nft_exthdr: add TCP option matching)
Merging ipvs-next/master (8d8e20e2d7bb ipvs: Decrement ttl)
Merging wireless-drivers-next/master (cbda794cf1bb Merge tag 'iwlwifi-next-for-kalle-2017-02-08' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (264e6777f958 Merge branch 'netvsc-enhancements')
Merging mac80211-next/master (f181d6a3bcc3 mac80211: fix CSA in IBSS mode)
Merging rdma/for-next (24dc831b77ec IB/core: Add inline function to validate port)
Merging rdma-leon/rdma-next (37b93d66c8ad Merge branch 'topic/mlx5-fixes-for-4.11' into rdma-next)
Merging rdma-leon-test/testing/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging mtd/master (7a308bb3016f Linux 4.10-rc5)
Merging l2-mtd/master (ccc38234fdc7 mtd: bcm47xxsflash: support reading flash out of mapping window)
$ git reset --hard HEAD^
Merging next-20170208 version of l2-mtd
Merging nand/nand/next (a4077ce58713 mtd: nand: Add Winbond manufacturer id)
Merging spi-nor/next (dc12bcccadaf mtd: spi-nor: cqspi: remove redundant dead code on error return check)
Merging crypto/master (1a20b9661265 crypto: arm/aes - don't use IV buffer to return final keystream block)
Merging drm/drm-next (13f62f54d174 Merge branch 'drm-next-4.11' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in lib/Kconfig
CONFLICT (content): Merge conflict in include/drm/drm_connector.h
CONFLICT (content): Merge conflict in include/drm/drm_atomic.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_sprite.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_fbc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_connector.c
Merging drm-panel/drm/panel/for-next (eaeebffa90f3 drm/panel: simple: Specify bus width and flags for EDT displays)
Merging drm-intel/for-linux-next (05e7866a174f Merge tag 'gvt-next-2017-02-07' of https://github.com/01org/gvt-linux into drm-intel-next-fixes)
Merging drm-tegra/drm/tegra/for-next (7b1d4185050d gpu: host1x: Set OF node for new host1x devices)
Merging drm-misc/for-linux-next (f9ad86e42d03 drm/atomic: fix an error code in mode_fixup())
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (21c42da18ef1 drm/msm: return -EFAULT if copy_from_user() fails)
Merging hdlcd/for-upstream/hdlcd (747e5a5ff2a2 drm: hdlcd: Fix cleanup order)
Merging mali-dp/for-upstream/mali-dp (83d642ee6dbe drm: mali-dp: fix stride setting for multi-plane formats)
Merging sunxi/sunxi/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging kspp/for-next/kspp (59a84e1e32f6 Merge branch 'for-next/rename-debug_rodata' into for-next/kspp)
CONFLICT (content): Merge conflict in include/asm-generic/asm-prototypes.h
CONFLICT (content): Merge conflict in arch/s390/Kconfig.debug
CONFLICT (content): Merge conflict in arch/arm/configs/aspeed_g5_defconfig
CONFLICT (content): Merge conflict in arch/Kconfig
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (8d8c9aec9ae3 ALSA: x86: Avoid unconditional call of snd_pcm_period_elapsed())
Merging sound-asoc/for-next (71d7b89701f4 Merge remote-tracking branches 'asoc/topic/wm8753' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (1f318a8bafcf modules: mark __inittest/__exittest as __maybe_unused)
Merging input/next (83f66a6f08fa Input: add driver for Zeitec ZET6223)
CONFLICT (content): Merge conflict in drivers/input/rmi4/Kconfig
Merging block/for-next (8cf4433a8295 Merge branch 'for-4.11/next' into for-next)
CONFLICT (content): Merge conflict in drivers/block/nbd.c
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (f5b0cba8f239 dm crypt: replace RCU read-side section with rwsem)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (7c6e11f3c39a mmc: Adding AUTO_BKOPS_EN bit set for Auto BKOPS support)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (c457c0a1f034 md/raid10: don't abuse bio->bi_phys_segments)
Merging mfd/for-mfd-next (197ac6d28fce MAINTAINERS: Add include/dt-bindings/mfd to MFD entry)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (744cc304a18f power: supply: add AC power supply driver for AXP20X and AXP22X PMICs)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (3761de31e8aa Merge remote-tracking branches 'regulator/topic/s2mpa01', 'regulator/topic/supplies' and 'regulator/topic/tps65217' into regulator-next)
Merging security/next (52176603795c KEYS: Use memzero_explicit() for secret data)
Applying: selinux: merge fix for "smc: establish new socket family"
Merging integrity/next (20f482ab9e0f ima: allow to check MAY_APPEND)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (1ea0ce40690d selinux: allow changing labels for cgroupfs)
Merging tpmdd/next (d554626be919 tpm xen: drop unneeded chip variable)
Merging watchdog/master (7ce7d89f4883 Linux 4.10-rc1)
Merging iommu/next (0e4b8ec58c3d Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/smmu', 'arm/mediatek', 'arm/core', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d88423f7844e vfio: Fix build break when SPAPR_TCE_IOMMU=n)
Merging trivial/for-next (74dcba3589fc NTB: correct ntb_spad_count comment typo)
Merging audit/next (62bc306e2083 audit: log 32-bit socketcalls)
CONFLICT (content): Merge conflict in include/uapi/linux/audit.h
Merging devicetree/for-next (bd0096d7467f of: Add missing space at end of pr_fmt().)
Merging mailbox/mailbox-for-next (db4d22c07e3e mailbox: mailbox-test: allow reserved areas in SRAM)
Merging spi/for-next (6160be71baba Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/slave' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (5bf728f02218 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in security/apparmor/include/apparmor.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo.c
Applying: locking/atomic, kref: merge fixup for code movement
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (9cae24b7b113 Merge commit 'daf34710a9e8849e04867d206692dc42d6d22263' into next)
CONFLICT (content): Merge conflict in drivers/edac/edac_pci.c
CONFLICT (content): Merge conflict in drivers/edac/edac_device.c
CONFLICT (content): Merge conflict in Documentation/00-INDEX
Merging edac-amd/for-next (279fa5803563 EDAC, fsl_ddr: Make locally used symbols static)
Merging irqchip/irqchip/for-next (88e20c74ee02 irqchip/mxs: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND)
Merging ftrace/for-next (e704eff3ff51 ftrace: Have set_graph_function handle multiple functions in one write)
Merging rcu/rcu/next (40b1f8f7b57f rcu: Default RCU_FANOUT_LEAF to 16 unless explicitly changed)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_core.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
Applying: smc: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (8ef81a9a453f KVM: x86: hide KVM_HC_CLOCK_PAIRING on 32 bit)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/exceptions-64s.S
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/head-64.h
Merging kvm-arm/next (7b6b46311a85 KVM: arm/arm64: Emulate the EL1 phys timer registers)
Merging kvm-mips/next (12ed1faece3f KVM: MIPS: Allow multiple VCPUs to be created)
Merging kvm-ppc/kvm-ppc-next (5982f0849e08 KVM: PPC: Book 3S: Fix error return in kvm_vm_ioctl_create_spapr_tce())
CONFLICT (content): Merge conflict in arch/powerpc/platforms/powernv/opal-wrappers.S
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/opal.h
Merging kvms390/next (fb7dc1d4ddce KVM: s390: detect some program check loops)
Merging xen-tip/linux-next (c0d197d55e8e xenbus: Neaten xenbus_va_dev_error)
Merging percpu/for-next (966d2b04e070 percpu-refcount: fix reference leak during percpu-atomic transition)
Merging workqueues/for-next (a45463cbf3f9 workqueue: avoid clang warning)
Merging drivers-x86/for-next (e3c1763c26c0 platform/x86: intel_mid_powerbtn: Unify IRQ acknowledegment)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (8bb1de680dac tools/leds: Add led_hw_brightness_mon program)
Merging ipmi/for-next (db3b7e134185 char: ipmi: constify ipmi_smi_handlers structures)
Merging driver-core/driver-core-next (64e90a8acb85 Introduce STATIC_USERMODEHELPER to mediate call_usermodehelper())
Merging usb/usb-next (f3c4c73704b2 usb: xhci-mtk: make the reference clock optional)
Merging usb-gadget/next (e42a5dbb8a3d usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions)
Merging usb-serial/usb-next (5182c2cf2a9b USB: serial: mos7840: fix another NULL-deref at open)
Merging usb-chipidea-next/ci-for-usb-next (753dfd23612d usb: chipidea: msm: Fix return value check in ci_hdrc_msm_probe())
Merging phy-next/next (0b10f64dbe60 phy: qcom-ufs: Fix misplaced jump label)
Merging tty/tty-next (36523b6830fa ARM: dts: STiH410-b2260: Enable HW flow-control)
Merging char-misc/char-misc-next (17fa87fe5a51 Merge 4.10-rc7 into char-misc-next)
CONFLICT (content): Merge conflict in Documentation/driver-api/index.rst
Merging extcon/extcon-next (8ea227886002 extcon: arizona: Wait for any running HPDETs to complete on jack removal)
Merging staging/staging-next (a769f30c7bd7 Merge 4.10-rc7 into staging-next)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_parallel.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_parallel.c left in tree.
$ git rm -f drivers/staging/media/lirc/lirc_parallel.c
Merging slave-dma/next (bd98fba52645 Merge branch 'for-linus' into next)
Merging cgroup/for-next (63f1ca59453a Merge branch 'cgroup/for-4.11-rdmacg' into cgroup/for-4.11)
Merging scsi/for-next (dfc54176fb62 Merge branch 'misc' into for-next)
Applying: scsi: mpt3sas: fix up for "block: fold cmd_type into the REQ_OP_ space"
Merging scsi-mkp/for-next (8b9b22ba7590 scsi: qedi: Fix possible memory leak in qedi_iscsi_update_conn())
Merging target-updates/for-next (b2c9652eba6c target: Remove command flag CMD_T_DEV_ACTIVE)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (3d88460dbd28 Merge tag 'drm-fixes-for-v4.10-rc8' of git://people.freedesktop.org/~airlied/linux)
Merging libata/for-next (428d57c1683a Merge branch 'for-4.11' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (80363894995b virtio_mmio: expose header to userspace)
Merging rpmsg/for-next (446521b2e8a2 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e4df1ebdfeb4 Merge branch 'ib-gpiod-flags' into devel)
CONFLICT (content): Merge conflict in drivers/staging/greybus/gpio.c
Applying: serial: st-asc: Use new GPIOD API to obtain RTS pin
Merging pinctrl/for-next (2039834c86f3 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (4651209c75d1 Merge branch 'for-4.11/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (1064f874abc0 mnt: Tuck mounts under others instead of creating shadow/side mounts.)
CONFLICT (content): Merge conflict in security/selinux/hooks.c
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (2195bff04148 selftests, x86, protection_keys: fix wrong offset in siginfo)
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/Makefile
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (372e2db7210d livepatch: doc: remove the limitation for schedule() patching)
Merging coresight/next (7f12a0d4a674 coresight: STM: Balance enable/disable)
Merging rtc/rtc-next (4c6106406eb1 rtc: sun6i: Fix compatibility with old DT binding)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bfb34527a32a libnvdimm, pfn: fix memmap reservation size versus 4K alignment)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging extable/extable (90858794c960 module.h: remove extable.h include now users have migrated)
Merging idr/idr-4.11 (12d3b9b904e8 radix tree test suite: Run iteration tests for longer)
Merging akpm-current/current (1224d22e9f1c scatterlist: do not disable IRQs in sg_copy_buffer)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/Makefile
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in include/linux/kprobes.h
CONFLICT (content): Merge conflict in include/linux/iomap.h
CONFLICT (content): Merge conflict in include/linux/dax.h
CONFLICT (content): Merge conflict in fs/iomap.c
CONFLICT (content): Merge conflict in fs/dax.c
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
CONFLICT (content): Merge conflict in drivers/net/usb/sierra_net.c
Applying: checkpatch: warn when formats use %Z and suggest %z
Applying: checkpatchpl-warn-against-using-%z-fix
Applying: mm: add new mmgrab() helper
Applying: mm: add new mmget() helper
Applying: mm: use mmget_not_zero() helper
Applying: mm: clarify mm_struct.mm_{users,count} documentation
Applying: debugobjects: track number of kmem_cache_alloc/kmem_cache_free done
Applying: debugobjects: scale thresholds with # of CPUs
Applying: debugobjects: reduce contention on the global pool_lock
Merging akpm/master (abf6ab93577e debugobjects: reduce contention on the global pool_lock)
