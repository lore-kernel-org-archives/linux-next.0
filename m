From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 14
Date: Mon, 14 Dec 2015 17:18:36 +1100
Message-ID: <20151214171836.6510208e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36897 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbbLNGSj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2015 01:18:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151211:

The net-next tree gained a conflict against the pci tree.

The drm-misc tree gained conflicts against the drm-intel and Linus' trees.

The block tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 5241
 5871 files changed, 211929 insertions(+), 90370 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After the
final fixups (if any), I do an x86_64 modules_install followed by builds
for powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(this fails its final link) and pseries_le_defconfig and i386, sparc,
sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 231 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (fc89182834db Merge tag 'nfs-for-4.4-3' of git://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (3d84ba362b60 ARC: dw2 unwind: Reinstante unwinding out of modules)
Merging arm-current/fixes (f5e985580978 ARM: 8475/1: SWP emulation: Restore original *data when failed)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (dc9c41bd9ece Revert "powerpc/eeh: Don't unfreeze PHB PE after reset")
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (2c302e7e4105 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging net/master (6d13cab4abec Merge branch 'mpls-fixes')
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (eeec5d0ef7ee rtlwifi: rtl8821ae: Fix lockups on boot)
Merging mac80211/master (b7bb11000860 rfkill: copy the name into the rfkill struct)
Merging sound-current/for-linus (5328e1ea87fb ALSA: hda/ca0132 - quirk for Alienware 17 2015)
Merging pci-current/for-linus (5bd242f824e2 Revert "PCI: hisi: Add HiSilicon SoC Hip05 PCIe driver")
Merging driver-core.current/driver-core-linus (31ade3b83e18 Linux 4.4-rc3)
Merging tty.current/tty-linus (9ce119f318ba tty: Fix GPF in flush_to_ldisc())
Merging usb.current/usb-linus (ad87e03213b5 USB: add quirk for devices with broken LPM)
Merging usb-gadget-fixes/fixes (7d32cdef5356 usb: musb: fail with error when no DMA controller set)
Merging usb-serial-fixes/usb-linus (a0e80fbd56b4 USB: serial: Another Infineon flash loader USB ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (9225c0b7b976 staging: lustre: echo_copy.._lsm() dereferences userland pointers directly)
Merging char-misc.current/char-misc-linus (e8c77bda05e5 fpga manager: Fix firmware resource leak on error)
Merging input-current/for-linus (fd18ab89166a Input: sun4i-lradc-keys - fix typo in binding documentation)
Merging crypto-current/master (70d906bc1750 crypto: skcipher - Copy iv from desc even for 0-len walks)
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (634b3a4a476e drm/i915: Do a better job at disabling primary plane in the noatomic case.)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (31ade3b83e18 Linux 4.4-rc3)
Merging arm/for-next (1b954cd6ee9c Merge branches 'component', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (9e9caa6a4961 arm64: perf: Add event descriptions)
Merging arm-soc/for-next (05bb70d386ff Merge branch 'next/drivers' into for-next)
Merging at91/at91-next (e0a9f710047c Merge tag 'at91-4.4-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (4ba393976a75 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (e9305522180f Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (ddddd2d97c0e Merge branch 'omap-for-v4.5/81xx-fixes' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (65321d273ac9 Revert "arm64: dts: Add msm8996 SoC and MTP board support")
Merging renesas/next (b754178cfa96 Merge branch 'heads/arm64-dt-for-v4.5' into next)
Merging rockchip/for-next (3fdf7756df4a Merge branch 'v4.5-armsoc/dts64' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/platsmp.c
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (945028c273a7 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (d8b26a3aee7b Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (3ba3a74b6545 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/Kconfig
Merging arm64/for-next/core (32d6397805d0 arm64: mm: ensure that the zero page is visible to the page table walker)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (44a7ecf909fb h8300: signal stack fix)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (70bc53b47343 m68k/mac: Kill psc_present)
Merging m68knommu/for-next (527e9316f8ec Linux 4.4-rc4)
Merging metag/for-next (f23d0e2468bc MAINTAINERS: Change Meta arch port status to Odd Fixes)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (6eae2f5fb44a Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (6a13feb9c828 Linux 4.3)
Merging powerpc/next (d1e1cf2e38de powerpc: clean up asm/switch_to.h)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (419123f900da s390/spinlock: do not yield to a CPU in udelay/mdelay)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (09745f38a74e arch/tile: turn off timer tick for oneshot_stopped state)
Merging uml/linux-next (887a9853092c um: fix returns without va_end)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (6573b8564d37 update signing code)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (dde86e3169da ext4 crypto: add missing locking for keyring_key access)
Merging f2fs/dev (fb39cbda1470 Merge branch 'libnvdimm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (3ceb22a7b7a1 gfs2: clear journal live bit in	gfs2_log_flush)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (756b9b37cfb2 SUNRPC: Fix callback channel)
Merging nfsd/nfsd-next (d093ded79a89 nfsd: don't base cl_cb_status on stale information)
Merging orangefs/for-next (555fa0fa618b fs: out of bounds on stack in iov_iter_advance)
Applying: orangefs: update for POSIX ACL name changes
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (8c1c5f263833 ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (8ace5dfb983e locks: use list_first_entry_or_null())
Merging vfs/for-next (ec087f1b421e Merge branches 'work.misc', 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in drivers/s390/char/zcore.c
Applying: orangfs: update for follow_link to get_link change
Merging pci/next (c6123e06042d Merge branches 'pci/host-generic', 'pci/host-imx6', 'pci/host-iproc' and 'pci/host-rcar' into next)
Merging hid/for-next (fbfc99cec8cb Merge branch 'for-4.5/wacom' into for-next)
Merging i2c/i2c/for-next (f87b3150098a Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (072151bb0154 firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (090b1e0097ae MAINTAINERS: change the maintainer of fam15h_power driver)
Merging v4l-dvb/master (3cd22fb4f836 Merge branch 'devel/media-controller-rc3' into to_next)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
Merging kbuild/for-next (45538834d1f5 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (6099f4c01fe3 Merge branch 'for-4.4-fixes' into for-next)
Merging pm/linux-next (3b79631d5c54 Merge branches 'powercap', 'pm-cpufreq' and 'pm-domains' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal-soc/next (31ade3b83e18 Linux 4.4-rc3)
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (7969d9df3f36 Merge branches 'topic/rcar' and 'topic/stm32' into next)
Merging net-next/master (f68766d8844f Merge branch '1GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in include/linux/pci_ids.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
CONFLICT (content): Merge conflict in net/ipv6/netfilter/nf_conntrack_reasm.c
Merging wireless-drivers-next/master (9b2761cb72dc wlcore/wl12xx: spi: fix oops on firmware load)
Merging bluetooth/master (7302b9d90117 ieee802154/adf7242: Driver for ADF7242 MAC IEEE802154)
Merging mac80211-next/master (df30ff0d6c15 wireless: change cfg80211 regulatory domain info as debug messages)
Merging rdma/for-next (db7489e07669 IB/core, cma: Make __attribute_const__ declarations sparse-friendly)
Merging mtd/master (e488ca9f8d4f doc: dt: mtd: partitions: add compatible property to "partitions" node)
Merging l2-mtd/master (320092a05dab mtd: nand: denali: add missing nand_release() call in denali_remove())
Merging crypto/master (1f6a9ab05ab5 crypto: asymmetric_keys - signature.c does not need <module.h>)
Merging drm/drm-next (663a233eef64 Merge branch 'drm-header-fixes' of https://github.com/GabrielL/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Merging drm-panel/drm/panel/for-next (caa602e71609 drm/bridge: Remove gratuitous blank line)
Merging drm-intel/for-linux-next (7370c68d5b9a drm/i915: PSR also doesn't have link_entry_time on SKL.)
Merging drm-tegra/drm/tegra/for-next (a8e676117060 gpu: host1x: Use platform_register/unregister_drivers())
Merging drm-misc/topic/drm-misc (d6e6e14fa61d drm: modes: Revert cc344980c767 "replace simple_strtoul by kstrtouint")
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_dp.c
Merging drm-exynos/exynos-drm/for-next (3f17ee2487a4 ARM: dts: Use OF graph for DP to panel connection in exynos5800-peach-pi)
Merging drm-msm/msm-next (a9ee34b70e07 drm/msm: Remove local fbdev emulation Kconfig option)
Merging sound/for-next (17074c1a5f1b ALSA: usb-audio: constify usb_protocol_ops structures)
Merging sound-asoc/for-next (75f655943f4f Merge remote-tracking branch 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (f889beaaab1c Input: da9063 - report KEY_POWER instead of KEY_SLEEP during power key-press)
Merging block/for-next (4c93772e14f0 Merge branch 'for-4.5/nvme' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Merging device-mapper/for-next (0cc37c2df4fa dm verity: add ignore_zero_blocks feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (5acbb99e3883 mmc: core: fix __mmc_switch timeout caused by preempt)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (80659653418e raid5-cache: free meta_page earlier)
Merging mfd/for-mfd-next (526c0ab13672 mfd: syscon: Add a DT property to set value width)
Merging backlight/for-backlight-next (ee65ad0e2a9e backlight: pwm_bl: Avoid backlight flicker when probed from DT)
Merging battery/master (f96576bd63e5 power: Fix unmet dependency on POWER_SUPPLY by POWER_RESET by uncoupling them)
Merging omap_dss2/for-next (1ea5b30117e8 fbdev: Make fb-notify a no-op if CONFIG_FB=n)
Merging regulator/for-next (c4537731d172 Merge remote-tracking branches 'regulator/topic/pv88090', 'regulator/topic/tps6105x', 'regulator/topic/tps65086', 'regulator/topic/tps65218' and 'regulator/topic/wm831x' into regulator-next)
Merging security/next (ebd68df3f24b Sync to Linus v4.4-rc2 for LSM developers.)
Merging integrity/next (9cf35733f514 security/integrity: make ima/ima_mok.c explicitly non-modular)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (d68106bbec2c watchdog: w83627hf_wdt: use core reboot notifier)
Merging iommu/next (b67ad2f7c751 Merge branches 'x86/vt-d', 'arm/omap', 'arm/smmu', 's390', 'core' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (222e684ca762 vfio/pci: make an array larger)
Merging jc_docs/docs-next (7acccdbc4d0b Doc: treewide: Fix grammar "a" to "an")
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (09eccd1da92b audit: always enable syscall auditing when supported and audit is enabled)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (0cce22ddca09 Merge branch 'dt/linus' into for-next)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (60887577b592 Merge remote-tracking branches 'spi/topic/sun4i' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (2cbd4f5c5c24 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (2527dfeb1f64 clocksource/drivers/tango-xtal: Replace code by clocksource_mmio_init)
CONFLICT (content): Merge conflict in arch/h8300/include/asm/io.h
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (45f4d3ab3ee8 EDAC, sb_edac: Set fixed DIMM width on Xeon Knights Landing)
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (39daa7b9e895 ftrace: Show all tramps registered to a record on ftrace_bug())
Merging rcu/rcu/next (66d163e6c087 rcu: Update rcu_report_qs_rsp() comment)
Merging kvm/linux-next (460146348518 Merge tag 'kvm-s390-next-4.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (460146348518 Merge tag 'kvm-s390-next-4.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (696066f875bc KVM: PPC: Increase memslots to 512)
Merging kvms390/next (2f8a43d45d14 KVM: s390: remove redudant assigment of error code)
Merging xen-tip/linux-next (b9fcbcf55dc4 xen/time: use READ_ONCE)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (82607adcf9cd workqueue: implement lockup detector)
Merging drivers-x86/for-next (816b1ee80f0c platform:x86: add Intel P-Unit mailbox IPC driver)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (b10c319b98d8 Merge remote-tracking branches 'regmap/topic/64bit', 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (0ab402a9594c leds: sunfire: Use platform_register/unregister_drivers())
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (31ade3b83e18 Linux 4.4-rc3)
Merging tty/tty-next (527e9316f8ec Linux 4.4-rc4)
Merging usb/usb-next (900937c0375e usb: ehci: ohci: fix bool assignments)
Merging usb-gadget/next (527e9316f8ec Linux 4.4-rc4)
Merging usb-serial/usb-next (365a0442f6de USB: mos7840: remove redundant condition)
Merging usb-chipidea-next/ci-for-usb-next (15af5aea51de usb: chipidea: removing of_find_property)
Merging staging/staging-next (f89c2b39ce67 staging:iio:mxs-lradc Fix large integer implicitly truncated to unsigned warning)
Merging char-misc/char-misc-next (1ec218373b8e Linux 4.4-rc2)
Merging extcon/extcon-next (5f01e6bc3336 extcon: rt8973: Add IRQF_ONESHOT to interrupt flags)
Merging cgroup/for-next (79a155f4c4c5 Merge branch 'for-4.5' into for-next)
Merging scsi/for-next (26b20b4975d4 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (a2ba59203791 target: use offset_in_page macro)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (55c21f12a8db Merge branch 'devel' into for-next)
Merging vhost/linux-next (2286bbcb6bd3 virtio: drop heuristics on ring full)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (d57b487d91fc Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (5dcd7b42f1d0 pwm: sunxi: Fix whitespace issue)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (41cabbc24d0a Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (4aaae2f2c74f scripts/kconfig/Makefile: add kselftest-mergeconfig)
Merging y2038/y2038 (8750343a6505 coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (d2b29c2f35a2 coresight: Fix a typo in Kconfig)
Merging rtc/rtc-next (980dc707bca4 rtc: imxdi: fix spelling mistake in warning message)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (6b577c9d772c nfit: Adjust for different _FIT and NFIT headers)
Merging akpm-current/current (27e5f5f5d8ae ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
CONFLICT (content): Merge conflict in mm/vmstat.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in Makefile
$ git checkout -b akpm remotes/origin/akpm/master
Applying: include/linux/property.h: fix build issues with gcc-4.4.4
Applying: fs/overlayfs/super.c needs pagemap.h
Applying: fs/adfs/adfs.h: tidy up comments
Applying: iio: core: introduce IIO configfs support
Applying: iio: core: introduce IIO software triggers
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: iio: trigger: introduce IIO hrtimer based trigger
Applying: iio: Documentation: add IIO configfs documentation
Applying: dma-mapping: make the generic coherent dma mmap implementation optional
Applying: arc: convert to dma_map_ops
Applying: arc: dma mapping fixes
Applying: avr32: convert to dma_map_ops
Applying: blackfin: convert to dma_map_ops
Applying: c6x: convert to dma_map_ops
Applying: C6X: fix build breakage
Applying: c6x: dma mapping fixes
Applying: cris: convert to dma_map_ops
Applying: nios2: convert to dma_map_ops
Applying: nios2: dma mapping fixes
Applying: frv: convert to dma_map_ops
Applying: parisc: convert to dma_map_ops
Applying: mn10300: convert to dma_map_ops
Applying: m68k: convert to dma_map_ops
Applying: metag: convert to dma_map_ops
Applying: sparc: use generic dma_set_mask
Applying: tile: uninline dma_set_mask
Applying: dma-mapping: always provide the dma_map_ops based implementation
Applying: HAVE_DMA_ATTRS: remove leftovers in Kconfig
Applying: dma-mapping: remove <asm-generic/dma-coherent.h>
Applying: dma-mapping: use offset_in_page macro
Applying: memstick: use sector_div instead of do_div
Applying: mm: memcontrol: drop unused @css argument in memcg_init_kmem
Applying: mm: memcontrol: remove double kmem page_counter init
Applying: mm: memcontrol: give the kmem states more descriptive names
Applying: mm: memcontrol: group kmem init and exit functions together
Applying: mm: memcontrol: separate kmem code from legacy tcp accounting code
Applying: mm: memcontrol: move kmem accounting code to CONFIG_MEMCG
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-v2
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-fix
Applying: mm: memcontrol: account "kmem" consumers in cgroup2 memory controller
Applying: mm: memcontrol: allow to disable kmem accounting for cgroup2
Applying: mm: memcontrol: introduce CONFIG_MEMCG_LEGACY_KMEM
Applying: mm: memcontrol: only manage socket pressure for CONFIG_INET
Applying: net: drop tcp_memcontrol.c
Merging akpm/master (1bfcb92b67c3 net: drop tcp_memcontrol.c)
