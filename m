From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 9
Date: Wed, 9 Mar 2016 16:38:52 +1100
Message-ID: <20160309163852.4dd159b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42735 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752379AbcCIFiz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:38:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160308:

The usb tree gained a conflict against the tip tree.

The gpio tree gained a conflict against the mfd tree.

The aio tree still had a build failure so I used the version from
next-20160111.

Non-merge commits (relative to Linus' tree): 10121
 7937 files changed, 377182 insertions(+), 189149 deletions(-)

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
Merging origin/master (7f02bf6b5f5d Merge tag 'sound-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (fc77dbd34c5c Linux 4.5-rc6)
Merging arm-current/fixes (f474c8c857d9 ARM: 8544/1: set_memory_xx fixes)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (37c5e942bb2e powerpc/fsl-book3e: Avoid lbarx on e5500)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (f983cd32cd5d Merge branch 'parisc-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging net/master (133800d1f028 sctp: fix copying more bytes than expected in sctp_add_bind_addr)
Merging ipsec/master (52717aa43094 vti: Fix recource leeks on pmtu discovery)
Merging ipvs/master (7617a24f83b5 ipvs: correct initial offset of Call-ID header search in SIP persistence engine)
Merging wireless-drivers/master (10da848f67a7 ssb: host_soc depends on sprom)
Merging mac80211/master (2af8c4dc2e9c mac80211_hwsim: treat as part of mac80211 for MAINTAINERS)
Merging sound-current/for-linus (ad09ef2cce91 Merge tag 'asoc-fix-v4.5-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
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
Merging powerpc/next (ee3b93ebfbed powerpc/mm: Move hash64 tlbflush code into a new header)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (ea6370d23c91 powerpc/fsl: Update fman dt binding with pcs-phy and tbi-phy)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (7eb792bf7c25 s390: Fix misspellings in comments)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (1edbdfe03982 tile: Fix misspellings in comments.)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (5e33a2bd7ca7 Btrfs: do not collect ordered extents when logging that inode exists)
Merging btrfs-kdave/for-next (a3116483930c Merge branch 'for-next-4.6-20160229' into for-next-20160229)
Merging ceph/master (cd8140c673d9 libceph: don't spam dmesg with stray reply warnings)
Merging cifs/for-next (f983cd32cd5d Merge branch 'parisc-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging configfs/for-next (1ae1602de028 configfs: switch ->default groups to a linked list)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (ab73ef46398e quota: Fix possible GPF due to uninitialised pointers)
Merging ext4/dev (d89b5f6318c2 jbd2: save some atomic ops in __JI_COMMIT_RUNNING handling)
Merging f2fs/dev (4d99d34e4a32 f2fs: declare static functions)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a63be4e6d0e9 GFS2: Eliminate parameter non_block on gfs2_inode_lookup)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (ecf782868399 Merge branch 'multipath')
Merging nfsd/nfsd-next (9e01cf8c39f6 nfsd: add SCSI layout support)
Merging orangefs/for-next (9d9e7ba9ee8f Orangefs: improve gossip statements)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (b81de061fa59 ovl: copy new uid/gid into overlayfs runtime inode)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (e4f6daac2033 ubi: Fix out of bounds write in volume update code)
Merging xfs/for-next (ab9d1e4f7b02 Merge branch 'xfs-misc-fixes-4.6-3' into for-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_aops.c
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (7c4641aca314 Merge branches 'pci/enumeration', 'pci/resource', 'pci/virtualization' and 'pci/vpd' into next)
Merging hid/for-next (9634fbb88959 Merge branch 'for-4.6/multitouch' into for-next)
Merging i2c/i2c/for-next (3bf58bb5da86 i2c: imx: remove extra spaces.)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (e60e2e42851a hwmon: Create an NSA320 hardware monitoring driver)
Merging v4l-dvb/master (65e667aa737a Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (a4f54c25dec6 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (015e34fc5519 Merge branch 'for-4.6' into for-next)
Merging pm/linux-next (53e2325f8e27 Merge branch 'acpi-pci-fixes' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (33cae63614e6 Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (f8dbfad11e01 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (575913946989 firewire: ABI documentation: jujuutils were renamed to linux-firewire-utils)
Merging dlm/next (b81171cb6869 DLM: Save and restore socket callbacks properly)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (df7c2e001f52 Merge branch 'topic/xilinx' into next)
Merging net-next/master (f14b488d50b7 Merge branch 'bpf-map-prealloc')
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f6ca9f46f661 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (836856e3bd61 wireless: cw1200: use __maybe_unused to hide pm functions_)
Merging bluetooth/master (f432df86e8d9 Bluetooth: btmrvl_sdio: fix firmware activation failure)
Merging mac80211-next/master (0a87cadbb54e nl80211: add feature for BSS selection support)
Merging rdma/for-next (18558cae0272 Linux 4.5-rc4)
Merging mtd/master (c57753d4541d mtd: nand: tests: fix regression introduced in mtd_nandectest)
Merging l2-mtd/master (9648388fc773 mtd: spi-nor: support lock/unlock for a few Winbond chips)
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
Merging drm-intel/for-linux-next (9dfbffcf4ac0 drm/i915: Fix bogus dig_port_map[] assignment for pre-HSW)
Merging drm-tegra/drm/tegra/for-next (5dff6a2179a0 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (5488dc16fde7 drm: introduce pipe color correction properties)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (fcda50c8f484 drm/msm: rename hdmi symbols)
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (fc04023fafec drm/vc4: Add support for YUV planes.)
Merging regmap/for-next (d25263d917ca Merge remote-tracking branch 'regmap/topic/update-bits' into regmap-next)
Merging sound/for-next (a1ce94d03bfd ALSA: seq: Provide card number / PID via sequencer client info)
Merging sound-asoc/for-next (c0c2e009f485 Merge remote-tracking branches 'asoc/topic/topology' and 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (fa6e3ca27442 Input: ad7879 - add device tree support)
Merging block/for-next (ee0ec1c315af Merge branch 'for-4.6/drivers' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/core.c
Applying: nvme: fix up for "split pci module out of core module"
Merging device-mapper/for-next (5b699155e7bd dm: add missing newline between DM_DEBUG_BLOCK_STACK_TRACING and DM_BUFIO)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (67b3fcff2da9 mmc: mediatek: Use mmc_regulator_set_vqmmc in start_signal_voltage_switch)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (0f9ce866e093 Update MD git tree URL)
Merging mfd/for-mfd-next (103d8a7bb8a2 mfd: tps65090: Set regmap config reg counts properly)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (0df6e32b0e36 power: pm2301-charger: use __maybe_unused to hide pm functions)
Merging omap_dss2/for-next (32ad61951574 video: fbdev: sis: remove unused variable)
Merging regulator/for-next (3efd8bf9147d Merge remote-tracking branches 'regulator/topic/mt6397', 'regulator/topic/pv88060', 'regulator/topic/s2mps11', 'regulator/topic/s5m8767' and 'regulator/topic/vexpress' into regulator-next)
Merging security/next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (95ee08fa373b ima: require signed IMA policy)
Merging keys/keys-next (88a1b564a20e Merge tag 'keys-next-20160303' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging tpmdd/next (2c4934e534eb Merge branch 'master' into next)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (97914cf66632 watchdog: imx2: Convert to use infrastructure triggered keepalives)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/foundation-v8.dts
Merging iommu/next (d459a0941140 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/io-pgtable', 'arm/renesas' and 'core' into next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173.dtsi
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (c4aec3101319 vfio/pci: return -EFAULT if copy_to_user fails)
Merging jc_docs/docs-next (510e64fb0423 Doc: ARM: Fix a typo in clksrc-change-registers.awk)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (fa38a82096a1 scripts/dtc: Update to upstream version 53bf130b1cdd)
Merging mailbox/mailbox-for-next (14d653af4e32 mailbox/xgene-slimpro: Checking for IS_ERR instead of NULL)
Merging spi/for-next (215ed9297ce1 Merge remote-tracking branches 'spi/topic/rockchip', 'spi/topic/sh' and 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (ee20fc066fbc Merge branch 'timers/nohz')
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
Merging rcu/rcu/next (dc96aeda643f Merge commit '27d50c7eeb0f' into wagi.2016.03.01a)
Merging kvm/linux-next (bb9eadf0c35f KVM: MMU: micro-optimize gpte_access)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio_hv.c
Merging kvm-arm/next (9b4a3004439d KVM: arm/arm64: timer: Add active state caching)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
CONFLICT (content): Merge conflict in arch/arm64/kvm/hyp.S
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (58ded4201ff0 KVM: PPC: Add support for 64bit TCE windows)
Merging kvms390/next (c54f0d6ae057 KVM: s390: allocate only one DMA page per VM)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (9b7f6597f013 sched/core: Get rid of 'cpu' argument in wq_worker_sleeping())
Merging drivers-x86/for-next (b19e28784343 dell-wmi: support Dell Inspiron M5110)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (c6f4d40d4efb leds: Add SN3218 and SN3216 support to the IS31FL32XX driver)
Merging ipmi/for-next (42a018c63aee ipmi: do not probe ACPI devices if si_tryacpi is unset)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a95fc9c8e576 serial: 8250: describe CONFIG_SERIAL_8250_RSA)
Merging usb/usb-next (a56750059896 Merge tag 'phy-for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-testing)
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
Merging scsi/for-next (8fa77b0134a9 Merge branch 'misc' into for-next)
Merging target-updates/for-next (f630dbf5b534 target/iblock: Use -EAGAIN/-ENOMEM to propigate SAM BUSY/TASK_SET_FULL)
Merging target-merge/for-next-merge (4bc76cc43f8a iscsi-target: update Kconfig and Makefile)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
Merging pinctrl/for-next (cf48fde5f6c9 Merge branch 'devel' into for-next)
Merging vhost/linux-next (2f47f0294edd virtio_balloon: Allow to resize and update the balloon stats in parallel)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (b21aebd99997 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (content): Merge conflict in drivers/pinctrl/sunxi/pinctrl-sunxi.c
CONFLICT (content): Merge conflict in drivers/gpio/gpio-tps65912.c
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
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (0964acffc614 aio: revert addition of io_send_sig() in generic_write_checks)
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (6accd8e9bf22 selftests: media_dcevice_test fix usage information)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (db6fc729a663 Merge branch 'for-4.6/upstream' into for-next)
Merging coresight/next (f1e2c1b13dfa drivers/hwtracing: make coresight-etm-perf.c explicitly non-modular)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight-etm3x.c
Merging rtc/rtc-next (d6c66e83fddf rtc: rv3029: Add device tree property for trickle charger)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (08e6340df290 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in kernel/memremap.c
CONFLICT (content): Merge conflict in include/linux/huge_mm.h
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/Makefile
CONFLICT (content): Merge conflict in arch/x86/realmode/rm/Makefile
CONFLICT (content): Merge conflict in arch/x86/kernel/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/vdso/Makefile
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
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
Applying: dma-mapping: rename dma_*_writecombine() to dma_*_wc()
Applying: dma-rename-dma__writecombine-to-dma__wc-checkpatch-fixes
Merging akpm/master (2e5d50c938d0 dma-rename-dma__writecombine-to-dma__wc-checkpatch-fixes)
