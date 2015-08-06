From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 6
Date: Thu, 6 Aug 2015 17:28:14 +1000
Message-ID: <20150806172814.06b346f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54898 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752943AbbHFH2Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Aug 2015 03:28:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150805:

The slave-dma tree gained a build failure so I used the version from
next-20150805.

The crypto tree lost its build failure.

The akpm-current tree gained a conflict against the char-misc tree and
a build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 5764
 5538 files changed, 271890 insertions(+), 127581 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64,
a multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), it is also built with powerpc allnoconfig
(32 and 64 bit), ppc44x_defconfig and allyesconfig (this fails its final
link) and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 224 trees (counting Linus' and 32 trees of patches
pending for Linus' tree).

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
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (4469942bbbe5 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (3473f26592c1 ARM: 8405/1: VDSO: fix regression with toolchains lacking ld.bfd executable)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (b8d65e9662b1 powerpc/eeh-powernv: Fix unbalanced IRQ warning)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (4a10a91756ef Merge branch 'upstream' of git://git.infradead.org/users/pcmoore/audit)
Merging net/master (2475b22526d7 xen-netback: Allocate fraglist early to avoid complex rollback)
Merging ipsec/master (158cd4af8ded packet: missing dev_put() in packet_do_bind())
Merging sound-current/for-linus (73851b36fe73 ALSA: hda - one Dell machine needs the headphone white noise fixup)
Merging pci-current/for-linus (c9ddbac9c891 PCI: Restore PCI_MSIX_FLAGS_BIRMASK definition)
Merging wireless-drivers/master (741e3b9902d1 rtlwifi: rtl8723be: Add module parameter for MSI interrupts)
Merging driver-core.current/driver-core-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging tty.current/tty-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging usb.current/usb-linus (0a1b6f63198f Merge tag 'phy-for-4.2-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-linus)
Merging usb-gadget-fixes/fixes (c93e64e91248 usb: udc: core: add device_del() call to error pathway)
Merging usb-serial-fixes/usb-linus (74472233233f USB: sierra: add 1199:68AB device ID)
Merging staging.current/staging-linus (fb1de5a4c825 staging: lustre: Include unaligned.h instead of access_ok.h)
Merging char-misc.current/char-misc-linus (eaf7e98d43c1 Merge tag 'extcon-fixes-for-4.2-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-linus)
Merging input-current/for-linus (e661d0a04462 Input: twl4030-vibra - fix ERROR: Bad of_node_put() warning)
Merging crypto-current/master (17fb874dee09 hwrng: core - correct error check of kthread_run call)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (fe0d34d242fa module: weaken locking assertion for oops path.)
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (fee50f3c8427 selftests/futex: Fix futex_cmp_requeue_pi() error handling)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging drm-intel-fixes/for-linux-next-fixes (f84180af6358 drm/i915: Allow parsing of variable size child device entries from VBT)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (87ce62802f7a ARC: Make pt_regs regs unsigned)
Merging arm/for-next (5ca46e120581 Merge branch 'devel-stable' into for-next)
CONFLICT (content): Merge conflict in arch/arm/include/asm/Kbuild
Merging arm-perf/for-next/perf (fa8ad7889d83 arm: perf: factor arm_pmu core out to drivers)
Merging arm-soc/for-next (dc6968f3a073 arm-soc: document merges)
Merging at91/at91-next (253ebd4df402 Merge branch 'at91-4.3-defconfig' into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/sama5.c
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (d798596285b7 Merge branch 'imx/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (6b27bd4ca33f Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (a0ea0dda273a Merge tag 'omap-for-v4.3/dt-dm814x' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (ca8c78b44e67 ARM: dts: ifc6410: add inforce LVDS panel support)
Merging renesas/next (aa5920f26776 Merge branch 'heads/sh-drivers-for-v4.3' into next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-r8a7779.c
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-marzen.c deleted in renesas/next and modified in HEAD. Version HEAD of arch/arm/mach-shmobile/board-marzen.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-marzen-reference.c deleted in renesas/next and modified in HEAD. Version HEAD of arch/arm/mach-shmobile/board-marzen-reference.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-marzen-reference.c arch/arm/mach-shmobile/board-marzen.c
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' and 'for-rpi-next-dt' into for-rpi-next)
Merging samsung/for-next (366c21fdd7b1 Merge branch 'v4.3-next/dt64-samsung' into for-next)
Merging samsung-krzk/for-next (1939ef954d2b Merge branch 'dt-for-next' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging sunxi/sunxi/for-next (9d73c13a139c Merge branches 'sunxi/dt-for-4.3' and 'sunxi/defconfig-for-4.3' into sunxi/for-next)
Merging tegra/for-next (66a41f4ac17e Merge branch for-4.3/defconfig into for-next)
Merging arm64/for-next/core (8ec41987436d arm64: mm: ensure patched kernel text is fetched from PoU)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (3738e41b32e9 m68k/coldfire/pit: Migrate to new 'set-state' interface)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary struct pci_dev declaration)
Merging mips/mips-for-linux-next (1853ad00dae5 Merge branch '4.2-fixes' into mips-for-linux-next)
Merging nios2/nios2-next (a8955cc3a504 nios2: check number of timer instances)
Merging parisc-hd/for-next (9d37e6679dfd Merge branch 'fixes' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging powerpc/next (5d83c2b37d43 selftests/seccomp: Add powerpc support)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (8578531dea96 s390/vtime: limit MT scaling value updates)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (232ff5eb2bf3 tile: Remove finish_arch_switch)
Merging uml/linux-next (46acfb806813 um: Fix out-of-tree build)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (1203b34261e4 xtensa: fix threadptr reload on return to userspace)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_add_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the zero page)
Merging cifs/for-next (6468ffb3e9da cifs: Fix use-after-free on mid_q_entry)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl commands through)
Merging ext3/for_next (926631c2012d ext4: memory leak on error in ext4_symlink())
Merging ext4/dev (6d3ec14d703c jbd2: limit number of reserved credits)
Merging f2fs/dev (c52c4e06577e f2fs: unify f2fs_bug_on when check blocks and segment)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (ea79f0ec7a38 GFS2: Make ht_parms static)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (bd0ad0e63a22 NFSv4.1/pnfs: Fix atomicity of commit list updates)
Merging nfsd/nfsd-next (a629590c1855 nfsd: allow the file cache expire time to be tunable)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (669d3d123395 UBI: Remove unnecessary `\')
Merging xfs/for-next (5461ad99cab9 Merge branch 'xfs-meta-uuid' into for-next)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (0f1db7dee200 9p: cope with bogus responses from server in p9_client_{read,write})
Merging pci/next (5a4f3cf0d1f0 Merge branches 'pci/irq', 'pci/misc', 'pci/resource' and 'pci/virtualization' into next)
Merging hid/for-next (386f6da56c13 Merge branch 'for-4.2/upstream-fixes-devm-fixed' into for-next)
Merging i2c/i2c/for-next (cdb7677d7f6b Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (3fd33362c247 hwmon: (it87) Add support for IT8732F)
Merging v4l-dvb/master (5bab86243d94 [media] media/pci/cobalt: fix Kconfig and build when SND is not enabled)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (b953c0d234bc Linux 4.1)
Merging libata/for-next (3a95a0528f73 Merge branch 'for-4.2-fixes' into for-next)
Merging pm/linux-next (3e64a6e1d98f Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (6ce87b2a60f1 Merge branches 'for-rc' and 'release' of .git into next)
Merging thermal-soc/next (3c19d237dd81 thermal: exynos: Remove unused code related to platform_data on probe())
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (c2407ef22507 Merge branches 'topic/ti-xbar' and 'topic/zxdma' into next)
$ git reset --hard HEAD^
Merging next-20150805 version of slave-dma
Merging net-next/master (9dc20a649609 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next)
Merging ipsec-next/master (0b42c2863b3b Merge branch 'arm-bpf-next')
Merging wireless-drivers-next/master (360d9bb5ee2d Revert "ath9k: export HW random number generator")
Merging bluetooth/master (bea3066afe5d Bluetooth: Fix breakage in amp_write_rem_assoc_frag())
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict)
Merging l2-mtd/master (43163022927b mtd: m25p80: allow arbitrary OF matching for "jedec,spi-nor")
Merging crypto/master (e94c6a7a6df1 crypto: authenc - Add Kconfig dependency on CRYPTO_NULL)
Merging drm/drm-next (dcd14dd957f0 Merge tag 'topic/connector-locking-2015-07-23' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add bus format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (80aa93128653 drm/i915: disable_shared_pll doesn't work on pre-gen5)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Registers are 32-bit)
Merging drm-misc/topic/drm-misc (a8bb39904bce drm: Add top level Kconfig option for DRM fbdev emulation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
Merging drm-exynos/exynos-drm/for-next (9eb8cc183731 drm/exynos: return return value of exynos_crtc->enable_vblank)
Merging drm-msm/msm-next (753f568f151c drm/msm: Enable clocks during enable/disable_vblank() callbacks)
Merging sound/for-next (f6af5df0c7d7 ALSA: aoa-soundbus: Switch to dev_pm_ops)
Merging sound-asoc/for-next (e1d386057ed5 Merge remote-tracking branch 'asoc/topic/xtensa' into asoc-next)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_lock if CONFIG_MODULES)
Merging input/next (6fd385022796 Input: elants_i2c - disable idle mode before updating firmware)
Merging block/for-next (89c5a5c7f990 Merge branch 'for-4.3/core' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in block/bounce.c
Applying: block: lustre: temporary fix for bio_endio API change
Merging device-mapper/for-next (bd4aaf8f9b85 dm: fix dm_merge_bvec regression on 32 bit systems)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (77a5f675e2d8 mmc: block: add fixup of broken CMD23 for Sandisk card)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (f093136d2cad md-cluster: Read the disk bitmap sb and check if it needs recovery)
Merging mfd/for-mfd-next (45bc1e960d6a mfd: da9062: Support for the DA9063 OnKey in the DA9062 core)
Applying: ACPI / PM: merge fix for code movement
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the return type of backlight_update_status() to int)
Merging battery/master (c9f85a90d414 power: bq24190_charger: Fix charge type sysfs property)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (55e3555a8b83 Merge remote-tracking branches 'regulator/topic/rk808', 'regulator/topic/stub' and 'regulator/topic/tps6586x' into regulator-next)
Merging security/next (730daa164e7c Yama: remove needless CONFIG_SECURITY_YAMA_STACKED)
CONFLICT (content): Merge conflict in security/yama/yama_lsm.c
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging iommu/next (bbd08c2a0188 Merge branches 'arm/omap', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentation)
Merging jc_docs/docs-next (7c97211b61d8 Documentation: Minor changes to men-chameleon-bus.txt)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negative/)
Merging audit/next (8c85fc9ae69a audit: make audit_del_rule() more robust)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (76f90d76c27a of: Add vendor prefix for Sharp Microelectronics)
Merging mailbox/mailbox-for-next (7d641938aa2a mailbox/bcm2835: Fix mailbox full detection.)
Merging spi/for-next (b313d1c2278e Merge remote-tracking branches 'spi/topic/spidev', 'spi/topic/stats' and 'spi/topic/xcomm' into spi-next)
Merging tip/auto-latest (40736f0db421 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-r8a7779.c
CONFLICT (modify/delete): arch/arm/mach-shmobile/intc-sh73a0.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/arm/mach-shmobile/intc-sh73a0.c left in tree.
$ git rm -f arch/arm/mach-shmobile/intc-sh73a0.c
Merging clockevents/clockevents/next (8390806ccbb0 kernel: broadcast-hrtimer: Migrate to new 'set-state' interface)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (f586abe27a44 EDAC, ppc4xx: Access mci->csrows array elements properly)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring buffer benchmark immediately)
Merging rcu/rcu/next (3dbe43f6fba9 Merge branches 'doc.2015.07.15a' and 'torture.2015.07.15a' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kernel/traps.c
Merging kvm/linux-next (554726d33c20 Merge tag 'kvm-s390-next-20150728' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into kvm-next)
Merging kvm-arm/next (f6596a60303f arm64: KVM: remove remaining reference to vgic_sr_vectors)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (fdf036507f1f KVM: s390: host STP toleration for VMs)
Merging xen-tip/linux-next (e98f79cc5de0 xen-blkfront: convert to blk-mq APIs)
Merging percpu/for-next (292c24a073ee percpu: clean up of schunk->map[] assignment in pcpu_setup_first_chunk)
Merging workqueues/for-next (1dadafa86a77 workqueue: Make flush_workqueue() available again to non GPL modules)
Merging drivers-x86/for-next (3e07e5baa2af toshiba_acpi: Add set_fan_status function)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (bd66dccff302 Merge remote-tracking branches 'regmap/topic/debugfs', 'regmap/topic/force-update' and 'regmap/topic/seq-delay' into regmap-next)
Applying: mfd: Fixup clients of multi_reg_write/register_patch
Merging hsi/for-next (d770e558e219 Linux 4.2-rc1)
Merging leds/for-next (c5d39d96ac57 leds/led-class: Add missing put_device())
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was only read)
Merging driver-core/driver-core-next (cbfe8fa6cd67 Linux 4.2-rc4)
Merging tty/tty-next (68be64ca7e2a sc16is7xx: constify devtype)
Merging usb/usb-next (a2e66ad34c10 Documentation: sysfs-bus-usb: s/CONFIG_PM_RUNTIME/CONFIG_PM/)
Merging usb-gadget/next (5dbe135a1538 usb: gadget: epautoconf: remove ep and desc configuration from ep_matches())
CONFLICT (content): Merge conflict in drivers/usb/renesas_usbhs/mod_gadget.c
Merging usb-serial/usb-next (26c78daade0f USB: io_ti: Add heartbeat to keep idle EP/416 ports from disconnecting)
Merging staging/staging-next (4e0fa71c9342 Staging: rtl8188eu/core: fixed code indentation warning as reported by checkpatch.pl)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
Applying: staging/lustre: fix for bio_endio() API change
Merging char-misc/char-misc-next (379e4f756b91 Drivers: hv: vmbus: Consider ND NIC in binding channels to CPUs)
Merging extcon/extcon-next (4e491fe7920c extcon: Fix signedness bugs about break error handling)
Merging kdbus/kdbus (63c8e2f6f337 kdbus: fix wrong message size on 32bit)
Merging cgroup/for-next (49d5dbccd137 Merge branch 'for-4.3' into for-next)
Merging scsi/for-next (0c958ecc69c2 scsi: fix memory leak with scsi-mq)
Merging target-updates/for-next (109e2381749c target: Drop iSCSI use of mutex around max_cmd_sn increment)
CONFLICT (content): Merge conflict in include/scsi/scsi_eh.h
CONFLICT (content): Merge conflict in drivers/scsi/scsi_error.c
CONFLICT (content): Merge conflict in drivers/ata/libata-scsi.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (48356aa79ccb pinctrl: sirf: add power management support for atlas7)
Merging vhost/linux-next (6569ffbcd749 PCI/MSI: Make pci_msi_shutdown(), pci_msix_shutdown() static)
CONFLICT (content): Merge conflict in include/uapi/linux/pci_regs.h
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (505936131ea7 gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (75509fd88fbd nsfs: Add a show_path method to fix mountinfo)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (1fb6dd9da6ed clk: hisi: refine parameter checking for init)
CONFLICT (content): Merge conflict in drivers/clk/ti/Makefile
Applying: clk: ti: fix for definition movement
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (d770e558e219 Linux 4.2-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/barrier.h
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (395855d956ed coresight: Fix implicit inclusion of linux/sched.h)
Merging rtc/rtc-next (e1fcaaabdab4 rtc: mt6397: implement suspend/resume function in rtc-mt6397 driver)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f6ef5a2a5081 nvdimm: fix inline function return type warning)
Merging akpm-current/current (ea1f0dea994a ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in include/linux/kexec.h
CONFLICT (modify/delete): fs/ext3/super.c deleted in HEAD and modified in akpm-current/current. Version akpm-current/current of fs/ext3/super.c left in tree.
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
$ git rm -f fs/ext3/super.c
Applying: userfaultfd: selftest: update userfaultfd x86 32bit syscall number
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
Applying: ARM: mm: do not use virt_to_idmap() for NOMMU systems
Applying: namei: fix warning while make xmldocs caused by namei.c
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix
Applying: mm: mark most vm_operations_struct const
Applying: mm, mpx: add "vm_flags_t vm_flags" arg to do_mmap_pgoff()
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix-checkpatch-fixes
Applying: mm: make sure all file VMAs have ->vm_ops set
Applying: mm: use vma_is_anonymous() in create_huge_pmd() and wp_huge_pmd()
Applying: mm, madvise: use vma_is_anonymous() to check for anon VMA
Applying: linux/bitmap: force inlining of bitmap weight functions
Applying: x86/hweight: force inlining of __arch_hweight{32,64}()
Applying: jiffies: force inlining of {m,u}msecs_to_jiffies()
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (03dc55587c25 drivers/w1/w1_int.c: call put_device if device_register fails)
[master db79f8aeafda] Revert "lib/test_user_copy.c: check user checksum functions"
