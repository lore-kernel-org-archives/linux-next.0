From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 26
Date: Fri, 26 Feb 2016 17:37:42 +1100
Message-ID: <20160226173742.4516d586@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37799 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751072AbcBZGhp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Feb 2016 01:37:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160225:

The sunxi tree gained conflicts against Linus' and the arm-soc trees.

The net-next tree gained a conflict against the net tree.

The tip tree gained conflicts against the arm64 tree.

The aio tree still had a build failure so I used the version from
next-20160111.

The akpm-current tree gained a conflict against the tip tree and I
applied another fix patch.  It also gained another build failure for
which I applied another fix patch.

Non-merge commits (relative to Linus' tree): 7266
 5926 files changed, 270491 insertions(+), 129316 deletions(-)

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
(this fails its final link) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 239 trees (counting Linus' and 36 trees of patches
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
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (6dc390ad61ac Merge tag 'arc-4.5-rc6-fixes-upd' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (9ef2d8be5565 arc: SMP: CONFIG_ARC_IPI_DBG cleanup)
Merging arm-current/fixes (c7edd7f99cda ARM: 8534/1: virt: fix hyp-stub build for pre-ARMv7 CPUs)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (9ab3ac233a8b powerpc/mm/hash: Clear the invalid slot information correctly)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (ca0bb0798022 Add sun4v_wdt watchdog driver)
Merging net/master (ee50c130c821 net: jme: fix suspend/resume on JMC260)
Merging ipsec/master (3ed01df4ff79 xfrm: Reset encapsulation field of the skb before transformation)
Merging ipvs/master (5acaf89f88b9 netfilter: ipvs: handle ip_vs_fill_iph_skb_off failure)
Merging wireless-drivers/master (c699404db182 Merge tag 'iwlwifi-for-kalle-2016-02-15' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (b86071528f32 cfg80211: stop critical protocol session upon disconnect event)
Merging sound-current/for-linus (2ae955774f29 ALSA: hda - Fixup speaker pass-through control for nid 0x14 on ALC225)
Merging pci-current/for-linus (0a61cb947a5a Merge branch 'pci/host-hv' into for-linus)
Merging driver-core.current/driver-core-linus (18558cae0272 Linux 4.5-rc4)
Merging tty.current/tty-linus (18558cae0272 Linux 4.5-rc4)
Merging usb.current/usb-linus (428b315a2475 Merge tag 'fixes-for-v4.5-rc6' of http://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (3b2435192fe9 MAINTAINERS: drop OMAP USB and MUSB maintainership)
Merging usb-serial-fixes/usb-linus (d061c1caa31d USB: option: add "4G LTE usb-modem U901")
Merging usb-chipidea-fixes/ci-for-usb-stable (8c0614ca312c usb: chipidea: fix return value check in ci_hdrc_pci_probe())
Merging staging.current/staging-linus (7a64cd887fdb drivers: android: correct the size of struct binder_uintptr_t for BC_DEAD_BINDER_DONE)
Merging char-misc.current/char-misc-linus (18558cae0272 Linux 4.5-rc4)
Merging input-current/for-linus (ff84dabe3c6e Input: colibri-vf50-ts - add missing #include <linux/of.h>)
Merging crypto-current/master (8a3978ad55fb crypto: marvell/cesa - fix test in mv_cesa_dev_dma_init())
Merging ide/master (e04a2bd6d8c9 drivers/ide: make ide-scan-pci.c driver explicitly non-modular)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (16ab8a5cbea4 vfio/noiommu: Don't use iommu_present() to track fake groups)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (9b18572e83bf drm/i915/gen9: Verify and enforce dc6 state writes)
Merging asm-generic/master (040b323b5012 ARM: asm/div64.h: adjust to generic codde)
Merging arc/for-next (e75daf55992d ARC: clockevent: Prepare for DT based probe)
Merging arm/for-next (113b44c6c25b Merge branches 'amba', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (94085fe570e7 arm64: dts: Add Cavium ThunderX specific PMU)
Merging arm-soc/for-next (4455d3de7d77 ARM: SoC: document merges)
Merging at91/at91-next (799da647446d Merge tag 'at91-ab-4.6-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (1305141d1a72 ARM: bcm2835: add bcm2835-aux-uart support to DT)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (0a05d3b71ada ARM: multi_v7_defconfig: Enable BCM283x)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (655f2d0d2295 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8fdbbde4a16c Merge branch 'for_4.6/keystone_dts' into next)
Merging mvebu/for-next (5be603bdf1a7 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (601052bca473 Merge branch 'omap-for-v4.6/dt' into for-next)
Merging omap-pending/for-next (8fe097a3d99e ARM: DRA7: hwmod: Add reset data for PCIe)
Merging qcom/for-next (5b19b3012f3b ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (fd5c290b7efd Merge branches 'heads/sh-drivers-fixes-for-v4.5', 'heads/arm64-defconfig-for-v4.6', 'heads/arm64-dt-for-v4.6', 'heads/defconfig-for-v4.6' and 'heads/dt-for-v4.6' into next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging rockchip/for-next (2def4fc4fc2d Merge branch 'v4.6-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (341080b4d9b4 Merge branch 'next/soc' into for-next)
Merging sunxi/sunxi/for-next (73e5379b0442 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/config64-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging tegra/for-next (6af0a1cda782 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (cac4b8cdf5a2 arm64: Fix building error with 16KB pages and 36-bit VA)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (11943fdd17d2 h8300: dts: Rename the serial port clock to fck)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (a9c9d9aca4e7 zorro: Use kobj_to_dev())
Merging m68knommu/for-next (0cdfea013ee8 m68knommu: fix FEC platform device registration when driver is modular)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (606aab63d453 Merge branch '4.5-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (c3ab300ea555 powerpc: Add POWER9 cputable entry)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (993e0681084c s390/oprofile: add z13/z13s model numbers)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f1c3418ed4e6 tile kgdb: fix bug in copy to gdb regs, and optimize memset)
Merging uml/linux-next (288b31a382d2 um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (988f1f576d4f Merge branch 'for-chris-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.5)
Merging btrfs-kdave/for-next (b7364eb223db Merge branch 'for-next-4.6-20160225' into for-next-20160225)
Merging ceph/master (cd8140c673d9 libceph: don't spam dmesg with stray reply warnings)
Merging cifs/for-next (6dc390ad61ac Merge tag 'arc-4.5-rc6-fixes-upd' of git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc)
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (6332b9b5e797 ext4: Make Q_GETNEXTQUOTA work for quota in hidden inodes)
Merging ext4/dev (d89b5f6318c2 jbd2: save some atomic ops in __JI_COMMIT_RUNNING handling)
Merging f2fs/dev (362977b0dbc6 f2fs crypto: sync ext4_lookup and ext4_file_open)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a63be4e6d0e9 GFS2: Eliminate parameter non_block on gfs2_inode_lookup)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (9fd4b9fc7695 NFSv4.x/pnfs: Fix a race between layoutget and bulk recalls)
Merging nfsd/nfsd-next (b7052cd7bcf3 sunrpc/cache: fix off-by-one in qword_get())
Merging orangefs/for-next (c1223ca48baa orangefs: get rid of op refcounts)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (e15c65b38461 Merge branch 'xfs-writepage-rework-4.6' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (a314966fad61 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-layerscape' and 'pci/host-rcar' into next)
CONFLICT (content): Merge conflict in drivers/pci/probe.c
Merging hid/for-next (c2781579ce25 Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (33f5ccc343b7 i2c: piix4: Pre-shift the port number)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (e1370715b20e ARM: dts: vfxxx: Add iio_hwmon node for ADC temperature channel)
Merging v4l-dvb/master (0d8f3357897d Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (c2fd1465f329 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (8490bda29ad1 Merge branch 'for-4.5-fixes' into for-next)
Merging pm/linux-next (154b7d22e480 Merge branch 'acpica' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (98d94507e10c Merge branches 'thermal-intel', 'thermal-suspend-fix' and 'thermal-soc' into next)
Merging thermal-soc/next (eb4fc33eb268 thermal: small style cleanup in mtk_thermal)
Merging ieee1394/for-next (575913946989 firewire: ABI documentation: jujuutils were renamed to linux-firewire-utils)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (7a02d9b6888e Merge branch 'topic/omap' into next)
Merging net-next/master (619b17452a38 tipc: fix null deref crash in compat config path)
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (0a44b22009d5 rtlwifi: rtl8821ae: Convert driver to use common 5G channel table)
Merging bluetooth/master (395174bb07c1 Bluetooth: hci_uart: Add Intel/AG6xx support)
Merging mac80211-next/master (b573213927c5 rfkill: Notify userspace of airplane-mode state changes)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
Merging rdma/for-next (18558cae0272 Linux 4.5-rc4)
Merging mtd/master (44248affb5d8 MAINTAINERS: add maintainer entry for FREESCALE GPMI NAND driver)
Merging l2-mtd/master (46f0ba976663 mtd: brcmnand: Fix v7.1 register offsets)
Merging crypto/master (49abc0d2e19b crypto: xts - fix compile errors)
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
CONFLICT (modify/delete): fs/f2fs/f2fs_crypto.h deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/f2fs_crypto.h left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto_key.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto_key.c left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto.c left in tree.
CONFLICT (content): Merge conflict in fs/crypto/fname.c
$ git rm -f fs/f2fs/f2fs_crypto.h fs/f2fs/crypto_key.c fs/f2fs/crypto.c
Merging drm/drm-next (0041ee4d3642 Merge branch 'drm/next/du' of git://linuxtv.org/pinchartl/fbdev into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
Applying: drm: fix bad merge of drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (032b612e055e drm/i915: Remove update_sprite_watermarks.)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_csr.c
Merging drm-tegra/drm/tegra/for-next (d50bbe33efb5 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (a6ddd2f1b99f drm/udl: Use module_usb_driver)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (3932f008e3eb drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (fc04023fafec drm/vc4: Add support for YUV planes.)
Merging sound/for-next (956dea9e9112 ALSA: oxfw: discontinue MIDI substream for scs1x at transaction failure)
Merging sound-asoc/for-next (7135909be57e Merge remote-tracking branch 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (6ccb1d8f78bd Input: add MELFAS MIP4 Touchscreen driver)
Merging block/for-next (ab3d8b3ecf77 Merge branch 'for-4.6/core' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging device-mapper/for-next (01dd954e0fd8 dm: drop unnecessary assignment of md->queue)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (af3d6866825f mmc: sdhci-pltfm: remove priv variable from sdhci_pltfm_host)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (93ac96deff4c md: Drop sending a change uevent when stopping)
Merging mfd/for-mfd-next (103d8a7bb8a2 mfd: tps65090: Set regmap config reg counts properly)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (5c0e09e03fb5 power: act8945a: add charger driver for ACT8945A)
Merging omap_dss2/for-next (f059c4b220b8 fbdev: exynos: fix IS_ERR_VALUE usage)
Merging regulator/for-next (3c030f0deff7 Merge remote-tracking branch 'regulator/topic/vexpress' into regulator-next)
Merging security/next (602094428090 Merge branch 'smack-for-4.6' of https://github.com/cschaufler/smack-next into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1926e54f1157 MAINTAINERS: Update mailing list for Renesas ARM64 SoC Development)
Merging iommu/next (fd6b6b40c17e Merge branches 'iommu/fixes' and 'arm/rockchip' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (a13b64591747 vfio/pci: Expose shadow ROM as PCI option ROM)
Merging jc_docs/docs-next (510e64fb0423 Doc: ARM: Fix a typo in clksrc-change-registers.awk)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (6338b8a12d0a Merge branches 'dt/linus' and 'dt/next' into for-next)
Merging mailbox/mailbox-for-next (be9c09bcca03 arm64: dts: mailbox device tree node for APM X-Gene platform.)
Merging spi/for-next (4483631212ee Merge remote-tracking branches 'spi/topic/rockchip', 'spi/topic/sh' and 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (9d102a2e2002 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/efistub.h
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/arm64-stub.c
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (95d4f352d268 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (7fd13615992a tracing/dma-buf/fence: Fix timeline str value on fence_annotate_wait_on)
Merging rcu/rcu/next (2863b4e3dd92 Merge branches 'doc.2015.02.23a', 'fixes.2015.02.23a' and 'torture.2015.02.23a' into HEAD)
Merging kvm/linux-next (433da86023f8 KVM: async_pf: use list_first_entry)
Merging kvm-arm/next (67aaab4cff18 arm64: KVM: Move __cpu_init_stage2 after kvm_call_hyp)
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp.S
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_host.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (d3695aa4f452 KVM: PPC: Add support for multiple-TCE hcalls)
Merging kvms390/next (1763f8d09d52 KVM: s390: bail out early on fatal signal in dirty logging)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (23217b443b4b workqueue: Replace usage of init_name with dev_set_name())
Merging drivers-x86/for-next (2d905b3e74ad intel-hid: allocate correct amount of memory for private struct)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (10c43341ac84 Merge remote-tracking branches 'regmap/topic/doc', 'regmap/topic/irq', 'regmap/topic/stride' and 'regmap/topic/update-bits' into regmap-next)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (94b0580b6768 leds: gpio: Use GPIOF_OUT_INIT_LOW instead of hardcoded zero)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a3f0b77f36ca sc16is7xx: implemented get_mctrl)
Merging usb/usb-next (a057c3259ab6 usb: dwc2: USB_DWC2 should depend on HAS_DMA)
Merging usb-gadget/next (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-serial/usb-next (18558cae0272 Linux 4.5-rc4)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (c4e315884ed8 staging: lustre: Remove LASSERTS from router checker)
CONFLICT (content): Merge conflict in drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
CONFLICT (modify/delete): drivers/staging/dgap/dgap.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/dgap/dgap.c left in tree.
CONFLICT (content): Merge conflict in drivers/base/firmware_class.c
$ git rm -f drivers/staging/dgap/dgap.c
Applying: staging: mark CONFIG_FSL_MC_BUS as broken for now
Merging char-misc/char-misc-next (35bf7692e765 mei: fix format string in debug prints)
Merging extcon/extcon-next (0331966df0a2 arm: boot: beaglex15: pass correct interrupt)
Merging cgroup/for-next (468de7d80707 Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (3f84575f934a Merge branch 'misc' into for-next)
Merging target-updates/for-next (fab683eb12e7 scsi: qla2xxxx: avoid type mismatch in comparison)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (683072c71ff1 Merge branch 'devel' into for-next)
Merging vhost/linux-next (b91608c87c59 vring: Use the DMA API on Xen)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (531dd08c87bd Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/sunxi/pinctrl-sunxi.c
CONFLICT (content): Merge conflict in drivers/gpio/Makefile
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (ff01c944cfa9 pwm: Mark all devices as "might sleep")
Merging dma-buf/for-next (0cbb0b92689a Merge tag 'pci-v4.5-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (023bd7166be0 clk: skip unnecessary set_phase if nothing to do)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (fb2e69217129 aio: Fix compile error due to unexpected use of cmpxchg())
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (3d6dee7af7fe Makefile: add kselftest-merge)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (4c5e6154516b Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging coresight/next (37fe87dbde16 coresight: implementing 'cpu_id()' API)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (ef1654006c2f rtc: pic32: Add PIC32 real time clock driver)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (c27b54512f75 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/mprotect.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_aops.c
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Applying: mm: cleanup *pte_alloc* interfaces fix
Applying: mm: cleanup *pte_alloc* interfaces fix 2
Applying: signals, pkeys: make si_pkey 32 bits for now
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: net/sched/sch_mqprio.c: fix build with older gcc
Merging akpm/master (8404c72206cb net/sched/sch_mqprio.c: fix build with older gcc)
