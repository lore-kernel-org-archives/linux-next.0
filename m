From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 14
Date: Fri, 14 Aug 2015 18:52:14 +1000
Message-ID: <20150814185214.57d78572@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48781 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753903AbbHNIwQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2015 04:52:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150813:

The v4l-dvb tree still had its build failure so I used the version from
next-20150810.

The drm-tegra tree gained a conflict against the drm-misc tree.

The drm-misc tree gained a conflict against Linus' tree.

The xen-tip tree gained a conflict against Linus' tree.

The akpm-current tree gained a build failure for which I reverted
2 commits.

Non-merge commits (relative to Linus' tree): 7354
 6578 files changed, 329391 insertions(+), 155203 deletions(-)

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

I am currently merging 224 trees (counting Linus' and 33 trees of patches
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
Merging origin/master (5b3e2e14eaa2 Merge tag 'dm-4.2-fixes-5' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (09edea4f8fde ARM: 8410/1: VDSO: fix coarse clock monotonicity regression)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (f7644cbfcdf0 Linux 4.2-rc6)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (e6d006938c9b cosa: missing error code on failure in probe())
Merging ipsec/master (158cd4af8ded packet: missing dev_put() in packet_do_bind())
Merging sound-current/for-linus (7ccb0a9917a5 ALSA: hda - Fix the white noise on Dell laptop)
Merging pci-current/for-linus (c9ddbac9c891 PCI: Restore PCI_MSIX_FLAGS_BIRMASK definition)
Merging wireless-drivers/master (741e3b9902d1 rtlwifi: rtl8723be: Add module parameter for MSI interrupts)
Merging driver-core.current/driver-core-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging tty.current/tty-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging usb.current/usb-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging usb-gadget-fixes/fixes (c93e64e91248 usb: udc: core: add device_del() call to error pathway)
Merging usb-serial-fixes/usb-linus (74472233233f USB: sierra: add 1199:68AB device ID)
Merging staging.current/staging-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging char-misc.current/char-misc-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging input-current/for-linus (6b30c73e9f37 Input: elantech - add special check for fw_version 0x470f01 touchpad)
Merging crypto-current/master (b310c178e6d8 crypto: caam - fix memory corruption in ahash_final_ctx)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (fe0d34d242fa module: weaken locking assertion for oops path.)
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (fee50f3c8427 selftests/futex: Fix futex_cmp_requeue_pi() error handling)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (fb9caeedafe6 mfd: Remove MFD_CROS_EC_SPI depends on OF)
Merging drm-intel-fixes/for-linux-next-fixes (e8fa4270536d drm/i915: Only dither on 6bpc panels)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (af6c253b6158 ARCv2: IOC: Allow boot time disable)
Merging arm/for-next (b57afc7c4f13 Merge branch 'thermal' into for-next)
CONFLICT (content): Merge conflict in arch/arm/include/asm/Kbuild
Merging arm-perf/for-next/perf (fa8ad7889d83 arm: perf: factor arm_pmu core out to drivers)
Merging arm-soc/for-next (2c2404d2e29f arm-soc: document merges)
CONFLICT (modify/delete): arch/arm/kernel/psci.c deleted in HEAD and modified in arm-soc/for-next. Version arm-soc/for-next of arch/arm/kernel/psci.c left in tree.
$ git rm -f arch/arm/kernel/psci.c
Applying: ARM: fix for PSCI code movement
Merging at91/at91-next (253ebd4df402 Merge branch 'at91-4.3-defconfig' into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/sama5.c
CONFLICT (content): Merge conflict in arch/arm/configs/at91_dt_defconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (c746ef1b64e9 Merge branch 'imx/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (8864478b0dba Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (b2a882022a1e Merge branch 'omap-for-v4.3/dt-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (4ae93a64be4f soc: qcom: smem: Fix errant private access)
Merging renesas/next (dd97771953c4 Merge branch 'heads/sh-drivers-for-v4.3' into next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (a3f93b49c040 Merge branch 'v4.3-next/dt64-samsung' into for-next)
Merging samsung-krzk/for-next (86de2fe33fc6 Merge branch 'dt-for-next' into for-next)
CONFLICT (content): Merge conflict in drivers/cpufreq/Makefile
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
Merging sunxi/sunxi/for-next (9d73c13a139c Merge branches 'sunxi/dt-for-4.3' and 'sunxi/defconfig-for-4.3' into sunxi/for-next)
Merging tegra/for-next (f27ec95f3ff3 Merge branch for-4.3/defconfig into for-next)
Merging arm64/for-next/core (9a5ad7d0e3e1 arm64: Add __exception_irq_entry definition for function graph)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1ecb40643a9a m68k/bootinfo: Use kmemdup rather than duplicating its implementation)
Merging m68knommu/for-next (9b9bd98e55de m68k/coldfire: use PFN_DOWN macro)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary struct pci_dev declaration)
Merging mips/mips-for-linux-next (1853ad00dae5 Merge branch '4.2-fixes' into mips-for-linux-next)
Merging nios2/for-next (4469942bbbe5 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging parisc-hd/for-next (9d37e6679dfd Merge branch 'fixes' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging powerpc/next (9afac933433c powerpc/prom: Use DRCONF flags while processing detected LMBs)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (c60232029aee powerpc/fsl: Force coherent memory on e500mc derivatives)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (b179b037e568 s390/dasd: enhance CUIR scope detection)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (ff3e9a7307db tile/vdso: emit a GNU hash as well)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (1203b34261e4 xtensa: fix threadptr reload on return to userspace)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_add_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the zero page)
Merging cifs/for-next (6468ffb3e9da cifs: Fix use-after-free on mid_q_entry)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl commands through)
Merging ext3/for_next (72d4d0e48995 quota: remove an unneeded condition)
Merging ext4/dev (6d3ec14d703c jbd2: limit number of reserved credits)
Merging f2fs/dev (181cb245f6a4 f2fs: skip checkpoint if there is no dirty and prefree segments)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (ea79f0ec7a38 GFS2: Make ht_parms static)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (0847ef88c3c9 NFS: Remove duplicate svc_xprt_put from nfs41_callback_up)
Merging nfsd/nfsd-next (5494e10316e3 nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (071a1f837f72 UGIFS: fix a typo in comment of ubifs_budget_req)
Merging xfs/for-next (5461ad99cab9 Merge branch 'xfs-meta-uuid' into for-next)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (0f1db7dee200 9p: cope with bogus responses from server in p9_client_{read,write})
Merging pci/next (5a4f3cf0d1f0 Merge branches 'pci/irq', 'pci/misc', 'pci/resource' and 'pci/virtualization' into next)
Merging hid/for-next (95bde96cd55f Merge branch 'for-4.3/lenovo' into for-next)
Merging i2c/i2c/for-next (3508ff0175aa Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (15398566f0ea hwmon: (ltc2978) Add support for LTC3887)
Merging v4l-dvb/master (694152d6b0be Merge branch 'patchwork': multiarch fixup patches)
$ git reset --hard HEAD^
Merging next-20150810 version of v4l-dvb
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (b1ebd835445e Merge branch 'for-4.3' into for-next)
Merging pm/linux-next (9b3c34775072 Merge branches 'pm-clk', 'powercap', 'pm-avs' and 'pm-tools' into linux-next)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (6ce87b2a60f1 Merge branches 'for-rc' and 'release' of .git into next)
Merging thermal-soc/next (3c19d237dd81 thermal: exynos: Remove unused code related to platform_data on probe())
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (f328c13a7b57 Merge branch 'topic/zxdma' into next)
Merging net-next/master (e8fed985d7bd documentation: bring vxlan documentation more up-to-date)
CONFLICT (content): Merge conflict in drivers/net/ethernet/cavium/Kconfig
Merging ipsec-next/master (e69948a0a530 net: Document xfrm4_gc_thresh and xfrm6_gc_thresh)
Merging wireless-drivers-next/master (9b412590faae ath: Make ath_opmode_to_string understand OCB mode)
Merging bluetooth/master (50d78bcf5d06 Bluetooth: hci_bcm: Fix "implicit declaration")
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict)
Merging l2-mtd/master (72cb9fca670d mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI))
Merging crypto/master (e558017b558d crypto: caam - Remove unneeded 'ret' variable)
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
Merging drm/drm-next (dcd14dd957f0 Merge tag 'topic/connector-locking-2015-07-23' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
Merging drm-panel/drm/panel/for-next (b6b8d6ac240b drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (2881c509b40a drm/i915: clflush on pin_to_display after pwrite to UC bo in LLC)
Merging drm-tegra/drm/tegra/for-next (459cc2c6800b drm/tegra: sor: Add HDMI support)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/sor.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/rgb.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/dsi.c
Merging drm-misc/topic/drm-misc (b90180b057f7 drm/irq: More pipe/crtc consistency cleanups)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_irq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_crtc.c
Merging drm-exynos/exynos-drm/for-next (c098dc82d448 drm/exynos: return return value of exynos_crtc->enable_vblank)
Merging drm-msm/msm-next (196c2b53b072 drm/msm/dsi: Modify dsi manager bridge ops to work with external bridges)
Merging sound/for-next (41450b1b5ba1 Merge branch 'for-linus' into for-next)
Merging sound-asoc/for-next (6f2f4869a8e8 Merge remote-tracking branches 'asoc/topic/wm8983', 'asoc/topic/wm8996' and 'asoc/topic/xtensa' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (71d0f562358c Input: elan_i2c - enable asynchronous probing)
Merging block/for-next (38ced1229d34 Merge branch 'for-4.3/core' into for-next)
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in block/bounce.c
Applying: block: lustre: temporary fix for bio_endio API change
Merging device-mapper/for-next (76c44f6d80e1 dm snapshot: don't invalidate on-disk image on snapshot write overflow)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (77a5f675e2d8 mmc: block: add fixup of broken CMD23 for Sandisk card)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (f093136d2cad md-cluster: Read the disk bitmap sb and check if it needs recovery)
Merging mfd/for-mfd-next (8de4efdaf3db mfd: axp20x: Add a cell for the usb power_supply part of the axp20x PMICs)
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the return type of backlight_update_status() to int)
Merging battery/master (b49d15d138aa twl4030_charger: fix compile error when TWL4030_MADC not available.)
Merging omap_dss2/for-next (2a17d7e80f1d fbcon: unconditionally initialize cursor blink interval)
Merging regulator/for-next (966a61e5e4c7 Merge remote-tracking branches 'regulator/topic/qcom-spmi', 'regulator/topic/rk808', 'regulator/topic/stub' and 'regulator/topic/tps6586x' into regulator-next)
Merging security/next (aa62efff65ba MAINTAINERS: The keyrings mailing list has moved)
CONFLICT (content): Merge conflict in security/yama/yama_lsm.c
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging iommu/next (df0d06a2cc71 Merge branches 'arm/omap', 'arm/smmu', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (b325e832e947 ARM: keystone: add documentation for SoCs and EVMs)
Merging trivial/for-next (e5f6450c3f40 MAINTAINERS: update my e-mail address)
CONFLICT (modify/delete): drivers/regulator/max77843.c deleted in HEAD and modified in trivial/for-next. Version trivial/for-next of drivers/regulator/max77843.c left in tree.
$ git rm -f drivers/regulator/max77843.c
Merging audit/next (15ce414b82b0 fixup: audit: implement audit by executable)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (76f90d76c27a of: Add vendor prefix for Sharp Microelectronics)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (22aa2d0605d6 Merge remote-tracking branches 'spi/topic/sg', 'spi/topic/sh-msiof', 'spi/topic/spidev', 'spi/topic/stats' and 'spi/topic/xcomm' into spi-next)
Merging tip/auto-latest (489de182e85e Merge branch 'locking/core' into auto-latest)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-r8a7779.c
CONFLICT (modify/delete): arch/arm/mach-shmobile/intc-sh73a0.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/arm/mach-shmobile/intc-sh73a0.c left in tree.
$ git rm -f arch/arm/mach-shmobile/intc-sh73a0.c
Merging clockevents/clockevents/next (2b5cf544934f cris/time: Migrate to new 'set-state' interface)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (f586abe27a44 EDAC, ppc4xx: Access mci->csrows array elements properly)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring buffer benchmark immediately)
Merging rcu/rcu/next (12d560f4ea87 rcu,locking: Privatize smp_mb__after_unlock_lock())
Merging kvm/linux-next (ae6c0aa6ae4d Merge tag 'kvm-s390-next-20150812' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (f120cd6533d2 KVM: arm/arm64: timer: Allow the timer to control the active state)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (d09b9107c46e xen/xenbus: Rename the variable xen_store_mfn to xen_store_gfn)
CONFLICT (content): Merge conflict in arch/x86/xen/enlighten.c
CONFLICT (content): Merge conflict in arch/x86/xen/Makefile
Merging percpu/for-next (292c24a073ee percpu: clean up of schunk->map[] assignment in pcpu_setup_first_chunk)
Merging workqueues/for-next (1dadafa86a77 workqueue: Make flush_workqueue() available again to non GPL modules)
Merging drivers-x86/for-next (6d212b8adce4 ideapad-laptop: add alternative representation for Yoga 2 to DMI table)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (80afe8f53e98 Merge remote-tracking branches 'regmap/topic/debugfs', 'regmap/topic/force-update', 'regmap/topic/lockdep' and 'regmap/topic/seq-delay' into regmap-next)
Applying: mfd: Fixup clients of multi_reg_write/register_patch
Merging hsi/for-next (d770e558e219 Linux 4.2-rc1)
Merging leds/for-next (c5d39d96ac57 leds/led-class: Add missing put_device())
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was only read)
Merging driver-core/driver-core-next (71db87ba5700 bus: subsys: update return type of ->remove_dev() to void)
CONFLICT (content): Merge conflict in drivers/cpufreq/cpufreq.c
Merging tty/tty-next (d3159455bf46 serial: 8250_pci: fix mode after S3/S4 resume for F81504/508/512)
Merging usb/usb-next (e6bbe1d05353 Merge 4.2-rc6 into usb-next)
Merging usb-gadget/next (2f3cc24f07b8 usb: musb: gadget: fix build break by adding missing 'break')
CONFLICT (content): Merge conflict in drivers/usb/renesas_usbhs/mod_gadget.c
Merging usb-serial/usb-next (26c78daade0f USB: io_ti: Add heartbeat to keep idle EP/416 ports from disconnecting)
Merging staging/staging-next (1c46ae0af6df Merge tag 'iio-for-4.3b-2' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (modify/delete): drivers/staging/ozwpan/ozproto.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/ozwpan/ozproto.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
$ git rm -f drivers/staging/ozwpan/ozproto.c
Applying: staging/lustre: fix for bio_endio() API change
Merging char-misc/char-misc-next (5d44f4b3484e Merge 4.2-rc6 into char-misc-next)
CONFLICT (content): Merge conflict in drivers/misc/ti-st/st_kim.c
Applying: Drivers: hv: vmbus: fix for the removal of rdtscll()
Merging extcon/extcon-next (ac22a1d3386e extcon: palmas: Fix build break due to devm_gpiod_get_optional API change)
Merging kdbus/kdbus (a36324913ff2 kdbus: selftests: add more name registry tests)
Merging cgroup/for-next (bd6ce770e185 Merge branch 'for-4.3' into for-next)
Merging scsi/for-next (604a69102804 Merge branch 'misc' into for-next)
Merging target-updates/for-next (109e2381749c target: Drop iSCSI use of mutex around max_cmd_sn increment)
CONFLICT (content): Merge conflict in include/scsi/scsi_eh.h
CONFLICT (content): Merge conflict in drivers/scsi/scsi_error.c
CONFLICT (content): Merge conflict in drivers/ata/libata-scsi.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (48356aa79ccb pinctrl: sirf: add power management support for atlas7)
Merging vhost/linux-next (0c63b715912b PCI/MSI: Make pci_msi_shutdown(), pci_msix_shutdown() static)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (505936131ea7 gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock)
Applying: Input: elants_i2c: fix for devm_gpiod_get API change
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (c42743f11f58 clk: add bindings for the Ux500 clocks)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
CONFLICT (content): Merge conflict in drivers/clk/ti/Makefile
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (d770e558e219 Linux 4.2-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (395855d956ed coresight: Fix implicit inclusion of linux/sched.h)
Merging rtc/rtc-next (c4911a56474e Support of century in rtc-cmos)
CONFLICT (add/add): Merge conflict in drivers/mfd/wm8998-tables.c
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f6ef5a2a5081 nvdimm: fix inline function return type warning)
Merging akpm-current/current (4cbb4c58f019 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/early_ioremap.c
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
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix-fix
Applying: mm: mark most vm_operations_struct const
Applying: mm, mpx: add "vm_flags_t vm_flags" arg to do_mmap_pgoff()
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix-checkpatch-fixes
Applying: mm: make sure all file VMAs have ->vm_ops set
Applying: mm: use vma_is_anonymous() in create_huge_pmd() and wp_huge_pmd()
Applying: mm, madvise: use vma_is_anonymous() to check for anon VMA
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (de41ff3a796e drivers/w1/w1_int.c: call put_device if device_register fails)
$ git am -3 ../patches/0001-Revert-mm-hugetlb-proc-add-hugetlbpages-field-to-pro.patch
Applying: Revert "mm-hugetlb-proc-add-hugetlbpages-field-to-proc-pid-status-fix"
$ git am -3 ../patches/0002-Revert-mm-hugetlb-proc-add-HugetlbPages-field-to-pro.patch
Applying: Revert "mm: hugetlb: proc: add HugetlbPages field to /proc/PID/status"
