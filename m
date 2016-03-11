From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 11
Date: Fri, 11 Mar 2016 16:43:27 +1100
Message-ID: <20160311164327.10cb39a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34365 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751453AbcCKFnc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Mar 2016 00:43:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160310:

New tree: rpmsg

The tip tree gained a conflict against the pm tree.

The aio tree still had a build failure so I used the version from
next-20160111.

Non-merge commits (relative to Linus' tree): 10657
 8209 files changed, 406492 insertions(+), 196211 deletions(-)

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

I am currently merging 231 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (f2c1242194c7 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (fc77dbd34c5c Linux 4.5-rc6)
Merging arm-current/fixes (f474c8c857d9 ARM: 8544/1: set_memory_xx fixes)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging powerpc-fixes/fixes (37c5e942bb2e powerpc/fsl-book3e: Avoid lbarx on e5500)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (f983cd32cd5d Merge branch 'parisc-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging net/master (133800d1f028 sctp: fix copying more bytes than expected in sctp_add_bind_addr)
Merging ipsec/master (52717aa43094 vti: Fix recource leeks on pmtu discovery)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (10da848f67a7 ssb: host_soc depends on sprom)
Merging mac80211/master (2af8c4dc2e9c mac80211_hwsim: treat as part of mac80211 for MAINTAINERS)
Merging sound-current/for-linus (4f8e4f3537ca ALSA: hda - Don't handle ELD notify from invalid port)
Merging pci-current/for-linus (54c6e2dd00c3 PCI: Allow a NULL "parent" pointer in pci_bus_assign_domain_nr())
Merging driver-core.current/driver-core-linus (18558cae0272 Linux 4.5-rc4)
Merging tty.current/tty-linus (18558cae0272 Linux 4.5-rc4)
Merging usb.current/usb-linus (861c3849222b Merge tag 'usb-serial-4.5-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (3b2435192fe9 MAINTAINERS: drop OMAP USB and MUSB maintainership)
Merging usb-serial-fixes/usb-linus (f6cede5b49e8 Linux 4.5-rc7)
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
Merging drm-intel-fixes/for-linux-next-fixes (2f791908a70e drm/i915: Fix bogus dig_port_map[] assignment for pre-HSW)
Merging asm-generic/master (a1cbaad75a8f asm-generic: remove old nonatomic-io wrapper files)
Merging arc/for-next (a34cc6460c61 ARC: [intc-*] switch to linear domain)
Merging arm/for-next (1b3bf847977c Merge branches 'amba', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (fe638401a091 arm64: perf: Extend ARMV8_EVTYPE_MASK to include PMCR.LC)
Merging arm-soc/for-next (4e7673d03715 Merge branch 'fixes' into for-next)
Merging at91/at91-next (c40abde4b32e Merge branch 'at91-4.6-dt' into at91-next)
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
Merging samsung-krzk/for-next (466369e4e14b Merge branch 'next/defconfig' into for-next)
CONFLICT (content): Merge conflict in drivers/clk/Kconfig
Merging sunxi/sunxi/for-next (73e5379b0442 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/config64-for-4.6' and 'sunxi/dt-for-4.6' into sunxi/for-next)
Merging tegra/for-next (755f165105b1 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (ef769e320863 arm64: Fix misspellings in comments.)
CONFLICT (content): Merge conflict in arch/arm64/mm/init.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cputype.h
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (11943fdd17d2 h8300: dts: Rename the serial port clock to fck)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (a9c9d9aca4e7 zorro: Use kobj_to_dev())
Merging m68knommu/for-next (a3595962d824 m68knommu: remove obsolete 68360 support)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (30322b71a5e3 MIPS: traps: Correct the SIGTRAP debug ABI in `do_watch' and `do_trap_or_bp')
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (17eb3eef19f2 cxl: Ignore probes for virtual afu pci devices)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (3b5eb41b8ce0 powerpc/p5040: Add device node for RAID Engine)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (e370e4769463 s390: fix floating pointer register corruption (again))
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (1edbdfe03982 tile: Fix misspellings in comments.)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (5e33a2bd7ca7 Btrfs: do not collect ordered extents when logging that inode exists)
Merging btrfs-kdave/for-next (a3116483930c Merge branch 'for-next-4.6-20160229' into for-next-20160229)
Merging ceph/master (cd8140c673d9 libceph: don't spam dmesg with stray reply warnings)
Merging cifs/for-next (2f0d94ea413a Merge tag 'pci-v4.5-fixes-5' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging configfs/for-next (1ae1602de028 configfs: switch ->default groups to a linked list)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (ab73ef46398e quota: Fix possible GPF due to uninitialised pointers)
Merging ext4/dev (600be30a8bc1 ext4: remove i_ioend_count)
Merging f2fs/dev (dfdfa1c51b48 f2fs: fix to avoid unneeded unlock_new_inode)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a63be4e6d0e9 GFS2: Eliminate parameter non_block on gfs2_inode_lookup)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (ecf782868399 Merge branch 'multipath')
Merging nfsd/nfsd-next (a43a57e92528 nfsd: block and scsi layout drivers need to depend on CONFIG_BLOCK)
Merging orangefs/for-next (9d9e7ba9ee8f Orangefs: improve gossip statements)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (b81de061fa59 ovl: copy new uid/gid into overlayfs runtime inode)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (e4f6daac2033 ubi: Fix out of bounds write in volume update code)
Merging xfs/for-next (ab9d1e4f7b02 Merge branch 'xfs-misc-fixes-4.6-3' into for-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_aops.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/ext4/ext4.h
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (7c4641aca314 Merge branches 'pci/enumeration', 'pci/resource', 'pci/virtualization' and 'pci/vpd' into next)
Merging hid/for-next (eebcda9ddebf Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (3bf58bb5da86 i2c: imx: remove extra spaces.)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (630300d5fcb6 hwmon: Create an NSA320 hardware monitoring driver)
Merging v4l-dvb/master (1752d448bb5e Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (a4f54c25dec6 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (015e34fc5519 Merge branch 'for-4.6' into for-next)
Merging pm/linux-next (981185a2af9d Merge branch 'powercap' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal/next (33cae63614e6 Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (44fa372da981 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (575913946989 firewire: ABI documentation: jujuutils were renamed to linux-firewire-utils)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (265d909df318 Merge branch 'fixes' into next)
Merging net-next/master (e8ab563f4b2e Merge branch 'flower-offload')
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (ccfe1e853220 rtl8xxxu: Temporarily disable 8192eu device init)
Merging bluetooth/master (a5ab50359618 Bluetooth: Increment management interface revision)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (18558cae0272 Linux 4.5-rc4)
Merging mtd/master (9df4f913eb39 MAINTAINERS: add a maintainer for the NAND subsystem)
Merging l2-mtd/master (c76b78d8ec05 mtd: nand: Qualcomm NAND controller driver)
Merging crypto/master (ce0ae266feaf crypto: ccp - memset request context to zero during import)
CONFLICT (content): Merge conflict in net/rxrpc/rxkad.c
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
CONFLICT (modify/delete): fs/f2fs/f2fs_crypto.h deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/f2fs_crypto.h left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto_key.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto_key.c left in tree.
CONFLICT (modify/delete): fs/f2fs/crypto.c deleted in HEAD and modified in crypto/master. Version crypto/master of fs/f2fs/crypto.c left in tree.
CONFLICT (content): Merge conflict in fs/crypto/fname.c
$ git rm -f fs/f2fs/f2fs_crypto.h fs/f2fs/crypto_key.c fs/f2fs/crypto.c
Merging drm/drm-next (550e3b23a53c Merge branch 'drm-next-4.6' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_csr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_fbdev.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
Applying: drm: fix bad merge of drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
Merging drm-panel/drm/panel/for-next (c8a3b2ae0713 drm/bridge: Make (pre/post) enable/disable callbacks optional)
Merging drm-intel/for-linux-next (842e03076ffb drm/i915: Update state before setting watermarks, v2.)
Merging drm-tegra/drm/tegra/for-next (5dff6a2179a0 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (562c5b4d8986 drm: fix blob pointer check)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (fc04023fafec drm/vc4: Add support for YUV planes.)
Merging regmap/for-next (d25263d917ca Merge remote-tracking branch 'regmap/topic/update-bits' into regmap-next)
Merging sound/for-next (0ab1ace85620 ALSA: pcm: Avoid "BUG:" string for warnings again)
Merging sound-asoc/for-next (dcc9d9d51f84 Merge remote-tracking branch 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (fa6e3ca27442 Input: ad7879 - add device tree support)
Merging block/for-next (ee0ec1c315af Merge branch 'for-4.6/drivers' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/core.c
Applying: nvme: fix up for "split pci module out of core module"
Merging device-mapper/for-next (5b699155e7bd dm: add missing newline between DM_DEBUG_BLOCK_STACK_TRACING and DM_BUFIO)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc-uh/next (67b3fcff2da9 mmc: mediatek: Use mmc_regulator_set_vqmmc in start_signal_voltage_switch)
Merging md/for-next (fb3229d5cd4c md/raid5: output stripe state for debug)
Merging mfd/for-mfd-next (acb61da505d5 mfd: intel-lpss: Pass I2C configuration via properties on BXT)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (3efd8bf9147d Merge remote-tracking branches 'regulator/topic/mt6397', 'regulator/topic/pv88060', 'regulator/topic/s2mps11', 'regulator/topic/s5m8767' and 'regulator/topic/vexpress' into regulator-next)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging tpmdd/next (2c4934e534eb Merge branch 'master' into next)
Merging watchdog/master (c0732e8a5bb1 watchdog: Ensure that wdd is not dereferenced if NULL)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/foundation-v8.dts
Merging iommu/next (d459a0941140 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173.dtsi
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (4db1fa6648b1 Documentation: kselftest: Remove duplicate word)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (fa38a82096a1 scripts/dtc: Update to upstream version 53bf130b1cdd)
Merging mailbox/mailbox-for-next (14d653af4e32 mailbox/xgene-slimpro: Checking for IS_ERR instead of NULL)
Merging spi/for-next (643acda3c655 Merge remote-tracking branches 'spi/topic/res', 'spi/topic/rockchip', 'spi/topic/sh', 'spi/topic/ti-qspi' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (79ea369c69c9 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in kernel/sched/sched.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/omapdrm/omap_gem.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/efistub.h
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/arm64-stub.c
CONFLICT (content): Merge conflict in drivers/cpufreq/intel_pstate.c
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mvebu' into irqchip/for-next)
Merging ftrace/for-next (1cf8067b5418 tracing: Fix typoes in code comment and printk in trace_nop.c)
Merging rcu/rcu/next (38abb2abb9de locktorture: Fix nil pointer dereferencing for cleanup paths)
Merging kvm/linux-next (f958ee745f70 Merge tag 'kvm-s390-next-4.6-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio_hv.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp.S
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging kvm-arm/next (b40c4892d175 arm64: KVM: vgic-v3: Only wipe LRs on vcpu exit)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c54f0d6ae057 KVM: s390: allocate only one DMA page per VM)
Merging xen-tip/linux-next (4478c407ea38 xen/x86: Drop mode-selecting ifdefs in startup_xen())
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (9b7f6597f013 sched/core: Get rid of 'cpu' argument in wq_worker_sleeping())
Merging drivers-x86/for-next (5b4466b8f63b hp-wmi: Remove GPS rfkill support via pre-2009 interface)
Merging chrome-platform/for-next (1dc318166a9a platform/chrome: use to_platform_device())
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (9e91f6598479 leds: triggers: simplify led_trigger_store)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a95fc9c8e576 serial: 8250: describe CONFIG_SERIAL_8250_RSA)
Merging usb/usb-next (ce53bfc4374c Merge tag 'usb-serial-4.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
CONFLICT (content): Merge conflict in Documentation/kernel-parameters.txt
Merging usb-gadget/next (0561f77e2db9 usb: gadget: f_acm: Fix configfs attr name)
Merging usb-serial/usb-next (7084fa868b50 USB: serial: cp210x: add new access functions for large registers)
Merging usb-chipidea-next/ci-for-usb-next (01b8479400ab usb: chipidea: imx: avoid EPROBE_DEFER printed as error)
Merging staging/staging-next (708a24c18979 staging: lustre: make LNet use lprocfs_call_handler)
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
Merging char-misc/char-misc-next (16617535684f goldfish: Fix build error of missing ioremap on UM)
Merging extcon/extcon-next (ae64e42cc2b3 extcon: palmas: Drop IRQF_EARLY_RESUME flag)
Merging cgroup/for-next (74507aeac4b4 Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (d6ea0c65b523 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (b4e78f51c0ce usb-gadget: Add percpu-ida memset + alloc_sess callback)
Merging target-merge/for-next-merge (4bc76cc43f8a iscsi-target: update Kconfig and Makefile)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
Merging pinctrl/for-next (cc998d8bc743 Merge tag 'v4.5-rc5' into devel)
Merging vhost/linux-next (030881372460 vhost_net: basic polling support)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (69ae9895d3fe MAINTAINERS: Add co-maintainer for remoteproc subsystems)
Merging gpio/for-next (ec57bde1a1f2 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (content): Merge conflict in drivers/pinctrl/sunxi/pinctrl-sunxi.c
CONFLICT (content): Merge conflict in drivers/gpio/Makefile
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (116e5575805d pwm: brcmstb: Fix check of devm_ioremap_resource() return code)
Merging dma-buf/for-next (8f496d3fcc9d dma-buf/fence: fix fence_is_later v2)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (d3781a74bcc9 clk: fixed-rate: Remove CLK_IS_ROOT)
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-master.c
CONFLICT (content): Merge conflict in drivers/clk/at91/clk-main.c
Merging aio/master (0964acffc614 aio: revert addition of io_send_sig() in generic_write_checks)
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging kselftest/next (6accd8e9bf22 selftests: media_dcevice_test fix usage information)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (d6566346e17b Merge branch 'for-4.6/upstream' into for-next)
Merging coresight/next (f1e2c1b13dfa drivers/hwtracing: make coresight-etm-perf.c explicitly non-modular)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (4baecb6d9a04 rtc: ds3232: use rtc->ops_lock to protect alarm operations)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (489011652a2d Merge branch 'for-4.6/pfn' into libnvdimm-for-next)
Merging akpm-current/current (7d1ac13b79b1 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in include/linux/huge_mm.h
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/Makefile
CONFLICT (content): Merge conflict in arch/x86/realmode/rm/Makefile
CONFLICT (content): Merge conflict in arch/x86/kernel/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/Makefile
CONFLICT (content): Merge conflict in arch/x86/boot/compressed/Makefile
CONFLICT (content): Merge conflict in arch/x86/boot/Makefile
CONFLICT (content): Merge conflict in arch/mips/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: staging/goldfish: use 6-arg get_user_pages()
Applying: mm/mprotect.c: don't imply PROT_EXEC on non-exec fs
Applying: kernel/signal.c: add compile-time check for __ARCH_SI_PREAMBLE_SIZE
Applying: memremap: don't modify flags
Applying: memremap: add MEMREMAP_WC flag
Applying: drivers: dma-coherent: use MEMREMAP_WC for DMA_MEMORY_MAP
Applying: drivers: dma-coherent: use memset_io for DMA_MEMORY_IO mappings
Applying: kernel/...: convert pr_warning to pr_warn
Applying: dma-rename-dma__writecombine-to-dma__wc-checkpatch-fixes
Applying: alpha/extable: use generic search and sort routines
Applying: s390/extable: use generic search and sort routines
Applying: x86/extable: use generic search and sort routines
Applying: ia64/extable: use generic search and sort routines
Merging akpm/master (f1b72036df31 ia64/extable: use generic search and sort routines)
