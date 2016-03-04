From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 4
Date: Fri, 4 Mar 2016 19:17:44 +1100
Message-ID: <20160304191744.7a162fd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42878 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751367AbcCDIRr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Mar 2016 03:17:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160303:

The net-next tree gained a conflict against the net tree.

The device-mapper tree gained a build failure so I used the version
from next-20160303.

The tip tree lost its build failure.

The rcu tree gained a conflict against the tip tree.

The kvm tree gained a conflict against the powerpc tree.

The staging tree gained a conflict against the v4l-dvb tree.

The aio tree still had a build failure so I used the version from
next-20160111.

The akpm-current tree gained a conflict against the powerpc tree.

Non-merge commits (relative to Linus' tree): 9198
 7250 files changed, 348387 insertions(+), 167339 deletions(-)

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

I am currently merging 241 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (e3c2ef41f88e Merge tag 'pci-v4.5-fixes-4' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (fc77dbd34c5c Linux 4.5-rc6)
Merging arm-current/fixes (c7edd7f99cda ARM: 8534/1: virt: fix hyp-stub build for pre-ARMv7 CPUs)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (fb822e6076d9 powerpc/hw_breakpoint: Fix oops when destroying hw_breakpoint event)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (f983cd32cd5d Merge branch 'parisc-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging net/master (c1bb0a558881 be2net: don't enable multicast flag in be_enable_if_filters() routine)
Merging ipsec/master (3ed01df4ff79 xfrm: Reset encapsulation field of the skb before transformation)
Merging ipvs/master (5acaf89f88b9 netfilter: ipvs: handle ip_vs_fill_iph_skb_off failure)
Merging wireless-drivers/master (10da848f67a7 ssb: host_soc depends on sprom)
Merging mac80211/master (2af8c4dc2e9c mac80211_hwsim: treat as part of mac80211 for MAINTAINERS)
Merging sound-current/for-linus (02322ac9dee9 ALSA: hda - Fix mic issues on Acer Aspire E1-472)
Merging pci-current/for-linus (1195c103f6c9 PCI: layerscape: Fix MSG TLP drop setting)
Merging driver-core.current/driver-core-linus (18558cae0272 Linux 4.5-rc4)
Merging tty.current/tty-linus (18558cae0272 Linux 4.5-rc4)
Merging usb.current/usb-linus (861c3849222b Merge tag 'usb-serial-4.5-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (3b2435192fe9 MAINTAINERS: drop OMAP USB and MUSB maintainership)
Merging usb-serial-fixes/usb-linus (04fdbc825ffc USB: qcserial: add Sierra Wireless EM74xx device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipidea: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (fc77dbd34c5c Linux 4.5-rc6)
Merging char-misc.current/char-misc-linus (fc77dbd34c5c Linux 4.5-rc6)
Merging input-current/for-linus (ff84dabe3c6e Input: colibri-vf50-ts - add missing #include <linux/of.h>)
Merging crypto-current/master (8a3978ad55fb crypto: marvell/cesa - fix test in mv_cesa_dev_dma_init())
Merging ide/master (e04a2bd6d8c9 drivers/ide: make ide-scan-pci.c driver explicitly non-modular)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handling)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (eda908967fee drm/i915: Balance assert_rpm_wakelock_held() for !IS_ENABLED(CONFIG_PM))
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (463a42848bee ARC: clockevent: Prepare for DT based probe)
Merging arm/for-next (113b44c6c25b Merge branches 'amba', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (fe638401a091 arm64: perf: Extend ARMV8_EVTYPE_MASK to include PMCR.LC)
Merging arm-soc/for-next (2379bf18edfb arm-soc: document merges)
Merging at91/at91-next (c40abde4b32e Merge branch 'at91-4.6-dt' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (1305141d1a72 ARM: bcm2835: add bcm2835-aux-uart support to DT)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (0a05d3b71ada ARM: multi_v7_defconfig: Enable BCM283x)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (9e26d5f485d7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8fdbbde4a16c Merge branch 'for_4.6/keystone_dts' into next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/Makefile
Merging mvebu/for-next (5be603bdf1a7 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (aec24f100558 Merge branch 'omap-for-v4.6/fixes-not-urgent' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/logicpd-torpedo-som.dtsi
Merging omap-pending/for-next (8fe097a3d99e ARM: DRA7: hwmod: Add reset data for PCIe)
Merging qcom/for-next (f17d0d578214 ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (f094c5346231 Merge branch 'heads/sh-drivers-for-v4.6' into next)
Merging rockchip/for-next (545d1b355f3a Merge branch 'v4.6-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (61b99f519944 Merge branch 'next/defconfig' into for-next)
CONFLICT (content): Merge conflict in drivers/clk/Kconfig
Merging sunxi/sunxi/for-next (73e5379b0442 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/config64-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (6bc0046e0a7b Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (57efac2f7108 arm64: enable CONFIG_DEBUG_RODATA by default)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cputype.h
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
Merging mips/mips-for-linux-next (b355c39c1fc9 Merge branch '4.5-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (ee3b93ebfbed powerpc/mm: Move hash64 tlbflush code into a new header)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (f369b98ee30d s390/percpu: remove this_cpu_cmpxchg_double_4)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f1c3418ed4e6 tile kgdb: fix bug in copy to gdb regs, and optimize memset)
Merging uml/linux-next (288b31a382d2 um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (5e33a2bd7ca7 Btrfs: do not collect ordered extents when logging that inode exists)
Merging btrfs-kdave/for-next (a3116483930c Merge branch 'for-next-4.6-20160229' into for-next-20160229)
Merging ceph/master (cd8140c673d9 libceph: don't spam dmesg with stray reply warnings)
Merging cifs/for-next (f983cd32cd5d Merge branch 'parisc-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging configfs/for-next (b1f1a29d8fb5 configfs: Replace CURRENT_TIME by current_fs_time())
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (ab73ef46398e quota: Fix possible GPF due to uninitialised pointers)
Merging ext4/dev (d89b5f6318c2 jbd2: save some atomic ops in __JI_COMMIT_RUNNING handling)
Merging f2fs/dev (836b158ba9f2 f2fs crypto: sync ext4_lookup and ext4_file_open)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a63be4e6d0e9 GFS2: Eliminate parameter non_block on gfs2_inode_lookup)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (ecf782868399 Merge branch 'multipath')
Merging nfsd/nfsd-next (be99bb11400c svcrdma: Use new CQ API for RPC-over-RDMA server send CQs)
Merging orangefs/for-next (9d9e7ba9ee8f Orangefs: improve gossip statements)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (31bb2360d45a Merge branch 'xfs-misc-fixes-4.6-2' into for-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_aops.c
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (a314966fad61 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-layerscape' and 'pci/host-rcar' into next)
Merging hid/for-next (4ed76d1877c8 Merge branch 'for-4.6/cmedia' into for-next)
Merging i2c/i2c/for-next (3bf58bb5da86 i2c: imx: remove extra spaces.)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (d3c24a1f7798 Doc: hwmon: Fix typo "montoring" in hwmon)
Merging v4l-dvb/master (7529bf2f7a3a Merge ../patchwork into to_next)
Merging kbuild/for-next (94b0432df4fa Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (212199b71be7 Merge branch 'for-4.5-fixes' into for-next)
Merging pm/linux-next (767acf5299ee Merge branch 'pm-sleep-fixes' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (192cb9ee6547 thermal: intel_pch_thermal: Enable Skylake PCH thermal)
Merging thermal-soc/next (6427895d808e Merge branch 'work-fixes' into work-next)
Merging ieee1394/for-next (575913946989 firewire: ABI documentation: jujuutils were renamed to linux-firewire-utils)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (0d059b5a7cd3 Merge branch 'topic/pl330' into next)
Merging net-next/master (1f27cde313d7 net: sched: use pfifo_fast for non real queues)
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mvm/fw.c
CONFLICT (content): Merge conflict in drivers/net/vxlan.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (0a44b22009d5 rtlwifi: rtl8821ae: Convert driver to use common 5G channel table)
Merging bluetooth/master (1932597b739d Bluetooth: btusb: Add a new AR3012 ID 13d3:3472)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (18558cae0272 Linux 4.5-rc4)
Merging mtd/master (44248affb5d8 MAINTAINERS: add maintainer entry for FREESCALE GPMI NAND driver)
Merging l2-mtd/master (5817b9dc9cc1 jffs2: Improve post-mount CRC scan efficiency)
Merging crypto/master (ce0ae266feaf crypto: ccp - memset request context to zero during import)
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
CONFLICT (modify/delete): fs/f2fs/f2fs_crypto.h deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/f2fs_crypto.h left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto_key.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto_key.c left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto.c left in tree.
CONFLICT (content): Merge conflict in fs/crypto/fname.c
$ git rm -f fs/f2fs/f2fs_crypto.h fs/f2fs/crypto_key.c fs/f2fs/crypto.c
Merging drm/drm-next (42e856067843 Merge tag 'imx-drm-next-20160301' of git://git.pengutronix.de/git/pza/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_fbdev.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
Applying: drm: fix bad merge of drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (5ba001783ba6 drm/i915: Do not wait atomically for display clocks)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_csr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
Merging drm-tegra/drm/tegra/for-next (26ff27e69ee2 gpu: host1x: Set DMA ops on device creation)
Merging drm-misc/topic/drm-misc (327097930d65 drm/crtc: Use drm_mode_object_put() in __drm_framebuffer_unregister())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (fc04023fafec drm/vc4: Add support for YUV planes.)
Merging regmap/for-next (57837844a3aa Merge remote-tracking branches 'regmap/topic/doc', 'regmap/topic/irq', 'regmap/topic/stride' and 'regmap/topic/update-bits' into regmap-next)
Merging sound/for-next (03367bf7fd30 ALSA: portman2x4: fix NULL pointer dereference)
Merging sound-asoc/for-next (3b114d1f1d86 Merge remote-tracking branches 'asoc/topic/ssm4567', 'asoc/topic/sunxi', 'asoc/topic/topology' and 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (564a68de8e82 Input: stmpe-ts - restore kerneldoc)
Merging block/for-next (3fe7a75379c6 Merge branch 'for-4.6/core' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging device-mapper/for-next (f838997d1784 dm: return error if bio_integrity_clone() fails in clone_bio())
$ git reset --hard HEAD^
Merging next-20160303 version of device-mapper
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (887171c73075 mmc: sdhci-pltfm: remove priv variable from sdhci_pltfm_host)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (70d9798b9556 MD: warn for potential deadlock)
Merging mfd/for-mfd-next (103d8a7bb8a2 mfd: tps65090: Set regmap config reg counts properly)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (830f71c600cc Merge remote-tracking branches 'regulator/topic/mt6397', 'regulator/topic/s2mps11', 'regulator/topic/s5m8767' and 'regulator/topic/vexpress' into regulator-next)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (4e8ae72a75aa X.509: Make algo identifiers text instead of enum)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging tpmdd/next (2c4934e534eb Merge branch 'master' into next)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (c36a483d8007 watchdog: Add watchdog timer support for the WinSystems EBC-C384)
Merging iommu/next (d459a0941140 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
CONFLICT (content): Merge conflict in drivers/memory/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173.dtsi
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (510e64fb0423 Doc: ARM: Fix a typo in clksrc-change-registers.awk)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (299b207dbce8 Input: ads7846: Add description how to use internal reference (ADS7846))
Merging mailbox/mailbox-for-next (789c59acc323 mailbox: Hi6220: add mailbox driver)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/apm/apm-storm.dtsi
Merging spi/for-next (bea3704efd27 Merge remote-tracking branches 'spi/topic/rockchip', 'spi/topic/sh' and 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (954af4b5fd2c Merge branch 'x86/timers')
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/efistub.h
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/arm64-stub.c
CONFLICT (content): Merge conflict in drivers/cpufreq/intel_pstate.c
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (7fd13615992a tracing/dma-buf/fence: Fix timeline str value on fence_annotate_wait_on)
Merging rcu/rcu/next (25f0d48a4299 Merge commit 'abedf8e2419fb873d919dd74de2e84b510259339' into wagi.2016.03.01a)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (13d268ca2c4c KVM: MMU: apply page track notifier)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio_hv.c
Merging kvm-arm/next (9b4a3004439d KVM: arm/arm64: timer: Add active state caching)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp.S
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (bac8fe570aac KVM: s390: wake up when the VCPU cpu timer expires)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (9b7f6597f013 sched/core: Get rid of 'cpu' argument in wq_worker_sleeping())
Merging drivers-x86/for-next (2d6cace8476a ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (3e8d09d79e63 leds: gpio: Use GPIOF_OUT_INIT_LOW instead of hardcoded zero)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a3f0b77f36ca sc16is7xx: implemented get_mctrl)
Merging usb/usb-next (7b05d3b37437 Merge tag 'usb-ci-v4.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-next)
Merging usb-gadget/next (4082ae2f6a8e usb: renesas_usbhs: gadget: fix giveback status code in usbhsg_pipe_disable())
Merging usb-serial/usb-next (7084fa868b50 USB: serial: cp210x: add new access functions for large registers)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (ea363b419f5c staging: lustre: do less intense allocating retry for ko2iblnd)
CONFLICT (content): Merge conflict in include/linux/irqdomain.h
CONFLICT (content): Merge conflict in drivers/watchdog/Makefile
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
CONFLICT (content): Merge conflict in drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
CONFLICT (modify/delete): drivers/staging/dgap/dgap.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/dgap/dgap.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/dvb-frontends/mn88473.c
CONFLICT (content): Merge conflict in drivers/base/firmware_class.c
$ git rm -f drivers/staging/dgap/dgap.c
Applying: staging: mark CONFIG_FSL_MC_BUS as broken for now
Merging char-misc/char-misc-next (d74e026ae5c4 Merge tag 'lkdtm-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into char-misc-testing)
Merging extcon/extcon-next (ae64e42cc2b3 extcon: palmas: Drop IRQF_EARLY_RESUME flag)
Merging cgroup/for-next (43dee95c102e Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (3e1cc7df8efc Merge branch 'misc' into for-next)
Merging target-updates/for-next (02fe93a816ff target/user: Report capability of handling out-of-order completions to userspace)
Merging target-merge/for-next-merge (b46008b4854a iscsi-target: update Kconfig and Makefile)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
Merging pinctrl/for-next (cf48fde5f6c9 Merge branch 'devel' into for-next)
Merging vhost/linux-next (2f47f0294edd virtio_balloon: Allow to resize and update the balloon stats in parallel)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (531dd08c87bd Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (content): Merge conflict in drivers/pinctrl/sunxi/pinctrl-sunxi.c
CONFLICT (content): Merge conflict in drivers/gpio/Makefile
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (ff01c944cfa9 pwm: Mark all devices as "might sleep")
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (8626556f2593 clk: lpc32xx: fix compilation warning)
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-master.c
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-main.c
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (fb2e69217129 aio: Fix compile error due to unexpected use of cmpxchg())
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (6accd8e9bf22 selftests: media_dcevice_test fix usage information)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (4c5e6154516b Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging coresight/next (f1e2c1b13dfa drivers/hwtracing: make coresight-etm-perf.c explicitly non-modular)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight-etm-perf.c
Merging rtc/rtc-next (bbdfdcad60e2 rtc: enable COMPILE_TEST)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (6b0b69f03576 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/mprotect.c
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/Makefile
CONFLICT (content): Merge conflict in arch/x86/realmode/rm/Makefile
CONFLICT (content): Merge conflict in arch/x86/kernel/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/boot/compressed/Makefile
CONFLICT (content): Merge conflict in arch/x86/boot/Makefile
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Applying: mm: cleanup *pte_alloc* interfaces fix
Applying: mm: cleanup *pte_alloc* interfaces fix 2
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (fc99d7aa98e3 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
