From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 21
Date: Wed, 21 Oct 2015 17:16:23 +1100
Message-ID: <20151021171623.2d651735@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59302 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753153AbbJUGQZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Oct 2015 02:16:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

There will be no linux-next releases after tomorrow until Nov 2 (kernel
summit).

Changes since 20151020:

The battery tree still had its build failure so I used the version from
next-20150925.

The akpm-current tree gained a build failure for which I reverted
a commit.

Non-merge commits (relative to Linus' tree): 8842
 7114 files changed, 334622 insertions(+), 160218 deletions(-)

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
(32 and 64 bit), ppc44x_defconfig, allyesconfig (this fails its final
link) and pseries_le_defconfig and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 228 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (ce1fad2740c6 Merge branch 'keys-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (049e6dde7e57 Linux 4.3-rc4)
Merging arm-current/fixes (625faa6a720d clkdev: fix clk_add_alias() with a NULL alias device name)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (abb39bc792aa selftests/powerpc: Fix build failure of load_unaligned_zeropad test)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (1099f8604411 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (ca064bd89363 xfrm: Fix pmtu discovery for local generated packets.)
Merging ipvs/master (6ece90f9a13e netfilter: fix Kconfig dependencies for nf_dup_ipv{4,6})
Merging sound-current/for-linus (d289619a219d ALSA: hda - Fix deadlock at error in building PCM)
Merging pci-current/for-linus (1266963170f5 PCI: Prevent out of bounds access in numa_node override)
Merging wireless-drivers/master (de28a05ee28e Merge tag 'iwlwifi-for-kalle-2015-10-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (9ffecb102835 Linux 4.3-rc3)
Merging tty.current/tty-linus (f235f664a8af fbcon: initialize blink interval before calling fb_set_par)
Merging usb.current/usb-linus (fd7cd061adcf xhci: Add spurious wakeup quirk for LynxPoint-LP controllers)
Merging usb-gadget-fixes/fixes (25cb62b76430 Linux 4.3-rc5)
Merging usb-serial-fixes/usb-linus (049e6dde7e57 Linux 4.3-rc4)
Merging staging.current/staging-linus (4301de3b0ac4 Merge tag 'iio-fixes-for-4.3a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (25cb62b76430 Linux 4.3-rc5)
Merging input-current/for-linus (c8a1978e07c4 Input: sur40 - add dependency on VIDEO_V4L2)
Merging crypto-current/master (3fc89adb9fa4 crypto: api - Only abort operations on fatal signal)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (18e9345b0db9 drm/i915: Add primary plane to mask if it's visible)
Merging asm-generic/master (4008cb3ad223 asm-generic: temporarily add back asm-generic/io-64-nonatomic*.h)
Merging arc/for-next (f21e9c52d3ea ARC: boot: Non Master cpus only need to call EARLY_CPU_SETUP once)
Merging arm/for-next (769428594678 Merge branches 'drm-dwhdmi-devel', 'drm-tda998x-devel2' and 'drm-armada-devel' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (13d7d9d61c3e arm-soc document merges)
Merging at91/at91-next (5ccea17e1ab3 Merge branch 'at91-4.4-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (27527ea5f2fd Merge branch 'berlin/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (f843df81257a Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (4e91d7a20ccc Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (5f67e51672a1 Merge branch 'omap-for-v4.4/soc' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (fcbba086b456 ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
Merging renesas/next (c7aba848d39f Merge branches 'heads/defconfig-for-v4.4' and 'heads/dt-for-v4.4' into next)
Merging rockchip/for-next (55e899c44d10 Merge branch 'v4.4-armsoc/drivers' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (ac061109d748 Merge branch 'v4.3-samsung-fixes-2' into for-next)
Merging samsung-krzk/for-next (9cd0fe6ab629 Merge branch 'defconfig-for-next' into for-next)
Merging sunxi/sunxi/for-next (a20e59abc3c4 Merge branch 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (2d37df587e3c Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (9f93f3e9461a arm64: Synchronise dump_backtrace() with perf callchain)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (d81a922cf21f CRIS: Drop code related to obsolete or unused kconfigs)
Merging h8300/h8300-next (fce2a6bf0840 asm-generic: {get,put}_user ptr argument evaluate only 1 time)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (ae9ca0f7c12b fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (ed07371bb36f MIPS: VDSO: Add implementations of gettimeofday() and clock_gettime())
Merging nios2/for-next (8840da98bfec nios2: Switch to generic __xchg())
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (20d09927e669 selftests/powerpc: Allow the tm-syscall test to build with old headers)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (20d09927e669 selftests/powerpc: Allow the tm-syscall test to build with old headers)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (b0753902d42f s390/fpu: split fpu-internal.h into fpu internals, api, and type headers)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (09745f38a74e arch/tile: turn off timer tick for oneshot_stopped state)
Merging uml/linux-next (56b88a3bf97a um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (c6fa8e6de3dc Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (1c4b54e369dc ext4: use private version of page_zero_new_buffers() for data=journal mode)
Merging f2fs/dev (ce604b84c4f5 f2fs: convert inline_data for f2fs_fiemap)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (491e94f79098 gfs2: Add missing else in trans_add_meta/data)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (c3848ca12a30 Merge branch 'nfsclone')
Merging nfsd/nfsd-next (67b40c7e5e4a nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (548049495cb4 Orangefs: fix some checkpatch.pl complaints that had creeped in.)
Merging overlayfs/overlayfs-next (8d3095f4ad47 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (1cb8f9776c7d ubi: fastmap: Implement produce_free_peb())
Merging xfs/for-next (fcd8a399a9d4 Merge branch 'xfs-stats-fixes' into for-next)
Merging file-locks/linux-next (6ca7d910121a locks: Use more file_inode and fix a comment)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (26c90b94f4c4 Merge branches 'pci/misc', 'pci/msi' and 'pci/virtualization' into next)
Merging hid/for-next (7c5cb8c04b33 Merge branch 'for-4.4/multitouch' into for-next)
Merging i2c/i2c/for-next (6e82f74d11c8 Merge branch 'i2c/for-4.4' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (cc904f9cf26d hwmon: (coretemp) Increase limit of maximum core ID from 32 to 128.)
Merging v4l-dvb/master (8132ccfb864a Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (9bb48099f231 Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (40258a7cee19 Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (c6240328e702 Merge branch 'powercap' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/timer.c
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (a353d85dc365 Merge branches 'thermal-core' and 'thermal-intel' of .git into next)
Merging thermal-soc/next (b840b6e65cbe thermal: ti-soc-thermal: add OMAP36xx support)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (8cd0f1c3b306 Merge branch 'topic/edma' into next)
Merging net-next/master (26440c835f8b Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
Merging ipsec-next/master (c386578f1cdb xfrm: Let the flowcache handle its size by default.)
Merging ipvs-next/master (92240e8dc0d1 ipvs: Remove possibly unused variables from ip_vs_conn_net_{init,cleanup})
Merging wireless-drivers-next/master (8785955bbc28 mwifiex: remove unnecessary NULL check)
Merging bluetooth/master (644563771560 Bluetooth: l2cap_disconnection_req priority over shutdown)
Merging rdma/for-next (070b39972320 IB/mlx4: Report checksum offload cap for RAW QP when query device)
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (64862dbc98ca mtd: lpc32xx_mlc: fix warnings caused by enabling unprepared clock)
Merging crypto/master (271817a3e92c crypto: asymmetric_keys - Fix unaligned access in x509_get_sig_params())
Merging drm/drm-next (affa0e033b04 Merge tag 'topic/drm-misc-2015-10-19' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (606bb5e0b28b drm/i915: Use round to closest when computing the CEA 1.001 pixel clocks)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
Merging drm-tegra/drm/tegra/for-next (3fe2c7d4c85b gpu: host1x: Fix MLOCK's debug info)
Merging drm-misc/topic/drm-misc (5d170139eb10 vga_switcheroo: Constify vga_switcheroo_handler)
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (f937b43d48f1 ALSA: firewire-tascam: clear extra MIDI bytes in an asynchronous transaction)
Merging sound-asoc/for-next (c18ad31c5c7f Merge remote-tracking branches 'asoc/topic/sunxi' and 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (fbe6a3114471 Input: xpad - fix clash of presence handling with LED setting)
Merging block/for-next (7b6fc3549a08 Merge branch 'for-4.4/drivers' into for-next)
Merging device-mapper/for-next (0f712a30ac9e dm: convert ffs to __ffs)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (10e2cf053bbb mmc: sdhci-of-esdhc: avoid writing power control register)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (d1f86045e899 md-cluster: Fix warnings when build with CF=-D__CHECK_ENDIAN__)
Merging mfd/for-mfd-next (db96ec728d69 mfd: dt-bindings: Document pulled down WRSTBI pin on S2MPS1X)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/s2mps11.txt
Merging backlight/for-backlight-next (dc881123aa1a backlight: pwm: Reject legacy PWM request for device defined in DT)
Merging battery/master (6bd03ce3c12a power: bq27xxx_battery: Remove unneeded dependency in Kconfig)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (08bfb453f045 radeonfb: Deinline large functions)
Merging regulator/for-next (f572ab40660a Merge remote-tracking branches 'regulator/topic/tps6105x' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (fbf98265891a Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
Merging integrity/next (72e1eed8abb1 integrity: prevent loading untrusted certificates on the IMA trusted keyring)
Merging selinux/next (7bd1c6fc9679 selinux: Use a kmem_cache for allocation struct file_security_struct)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (ce1fad2740c6 Merge branch 'keys-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging iommu/next (d1ddb31d74ac Merge branches 'iommu/fixes', 'x86/amd', 'x86/vt-d', 'arm/omap', 's390' and 'core' into next)
Merging dwmw2-iommu/master (5d52f482ebb7 iommu/vt-d: Fix SVM IOTLB flush handling)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (334bb79c18eb doc: Clarify that nmi_watchdog param is for hardlockups)
CONFLICT (content): Merge conflict in Documentation/Changes
Merging trivial/for-next (0c6cac7ab444 hwmon: applesmc: fix comment typos)
Merging audit/next (fdccf5752869 audit: audit_tree_match can be boolean)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (138d8b73e6a3 Merge branch 'on-demand-probes-for-next' of git://git.collabora.com/git/user/tomeu/linux into for-next)
CONFLICT (content): Merge conflict in drivers/regulator/core.c
Merging mailbox/mailbox-for-next (6c03663f98b9 mailbox: Fix a couple of trivial static checker issues)
Merging spi/for-next (73e04cf6fa15 Merge remote-tracking branch 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (d3f683641ad3 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in include/linux/of_irq.h
CONFLICT (content): Merge conflict in arch/x86/Makefile
CONFLICT (content): Merge conflict in arch/arm64/kernel/acpi.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/atomic.h
CONFLICT (content): Merge conflict in Documentation/arm/uefi.txt
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (941fd2e70964 EDAC, altera: SoCFPGA EDAC should not look for ECC_CORR_EN)
Merging irqchip/irqchip/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (37aea98b84c0 tracing: Add trace options for tracer options to instances)
Merging rcu/rcu/next (c3c7edcab39d documentation: Expand on scheduler/RCU deadlock requirements)
Merging kvm/linux-next (8c85ac1c0a1b KVM: x86: MMU: Initialize force_pt_level before calling mapping_level())
Merging kvm-arm/next (041b2229387b KVM: arm/arm64: Fix vGIC documentation)
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (224f363246c3 KVM: PPC: e500: fix couple of shift operations on 64 bits)
Merging kvms390/next (1330a0170a48 Merge tag 'kvm-s390-next-20151013' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging xen-tip/linux-next (0e5ec8d22e31 xenbus: Support multiple grants ring with 64KB)
CONFLICT (content): Merge conflict in arch/x86/xen/p2m.c
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (4fcfc3013144 Merge branch 'for-4.4' into for-next)
Merging drivers-x86/for-next (9d1d459bf52b intel_scu_ipc: Protect dev member assignment on ->remove())
Merging chrome-platform/for-next (18800fc7a04e platform/chrome: Support reading/writing the vboot context)
Merging regmap/for-next (d4a1a317e747 Merge remote-tracking branches 'regmap/topic/atomic', 'regmap/topic/debugfs' and 'regmap/topic/irq-hdr' into regmap-next)
Merging hsi/for-next (d2c85ac24ed7 hsi: correctly handle return value of kzalloc)
Merging leds/for-next (e6138f49df35 leds: leds-net48xx: Use devm_led_classdev_register)
Merging ipmi/for-next (f22b7d0682d3 char: ipmi: Move MODULE_DEVICE_TABLE() to follow struct)
Merging driver-core/driver-core-next (c23fe83138ed debugfs: Add debugfs_create_ulong())
Merging tty/tty-next (e052c6d15c61 tty: Use unbound workqueue for all input workers)
Merging usb/usb-next (ffa2366666f0 usb/host/fotg210: Remove return statement inside if)
Merging usb-gadget/next (81e9d14a53eb usb: gadget: net2280: restore ep_cfg after defect7374 workaround)
Merging usb-serial/usb-next (92944c4520ed USB: qcserial: update comment for Sierra Wireless MC7304/MC7354)
Merging staging/staging-next (c3af8a28f433 staging: IB/hfi1: use TASK_COMM_LEN in hfi1_ctxtdata)
Merging char-misc/char-misc-next (d0eaa0c2fe9c coresight: etm3x: adding documentation for sysFS's cpu interface)
Merging extcon/extcon-next (11eecf910bd8 extcon: Modify the id and name of external connector)
Merging kdbus/kdbus (fc87a0ace7e3 kdbus: create /sys/fs/kdbus with sysfs_create_mount_point())
Merging cgroup/for-next (e4b7037c8613 cgroup: drop cgroup__DEVEL__legacy_files_on_dfl)
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/events/core.c
Applying: vmscan build fix
Merging scsi/for-next (15e3d5a285ab 3w-9xxx: don't unmap bounce buffered commands)
Merging target-updates/for-next (517982229f78 configfs: remove old API)
CONFLICT (content): Merge conflict in samples/Makefile
Applying: stm class: Use per-attribute show and store methods in configfs policy
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (ec879f127228 pinctrl: baytrail: Fix compilation warnings when !CONFIG_PM)
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (90b665f627b1 gpiolib: Add and use OF_GPIO_SINGLE_ENDED flag)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (7e3b7dc76c41 pwm: Add MediaTek display PWM driver support)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (eae14465de25 Merge tag 'tegra-for-4.4-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (256d0afb11d6 selftests/seccomp: build and pass on arm64)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (4b46883661fe coresight: etm3x: adding documentation for sysFS's cpu interface)
Merging rtc/rtc-next (36d87a0307be rtc: isl1208: Pass the IRQF_ONESHOT flag)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (538ea4aa4473 pmem, memremap: convert to numa aware allocations)
Merging akpm-current/current (d7499989475f ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
CONFLICT (content): Merge conflict in mm/pgtable-generic.c
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in mm/failslab.c
CONFLICT (content): Merge conflict in fs/proc/task_mmu.c
CONFLICT (content): Merge conflict in drivers/usb/host/u132-hcd.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/pgtable.h
Applying: mm-page_alloc-rename-__gfp_wait-to-__gfp_reclaim-arm-fix
Applying: mm-page_alloc-rename-__gfp_wait-to-__gfp_reclaim-arm-fix-fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
Applying: drivers/rtc/rtc-pcf2127.c hack
Applying: mips: add entry for new mlock2 syscall
Applying: sparc/sparc64: allocate sys_membarrier system call number
Applying: kernel.h: make abs() work with 64-bit types
Applying: Remove abs64()
Applying: remove-abs64-fix
Applying: remove-abs64-fix-fix
Applying: Documentation/sysctl/vm.txt: fix misleading code reference of overcommit_memory
Applying: pcnet32: use pci_set_dma_mask insted of pci_dma_supported
Applying: tw68-core: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7164: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7134: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx88: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx25821: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx23885: use pci_set_dma_mask insted of pci_dma_supported
Applying: netup_unidvb: use pci_set_dma_mask insted of pci_dma_supported
Applying: nouveau: don't call pci_dma_supported
Applying: sfc: don't call dma_supported
Applying: kaweth: remove ifdefed out call to dma_supported
Applying: usbnet: remove ifdefed out call to dma_supported
Applying: pci: remove pci_dma_supported
Applying: dma: remove external references to dma_supported
Applying: modpost: add flag -E for making section mismatches fatal
Applying: drivers/scsi/cxgbi: fix build with EXTRA_CFLAGS
Applying: kmap_atomic_to_page() has no users, remove it
Applying: include/linux/kdev_t.h: remove unused huge_valid_dev()
Applying: include/linux/kdev_t.h: old/new_valid_dev() can return bool
Applying: fs/9p: remove unnecessary new_valid_dev() checks
Applying: fs/btrfs/inode.c: remove unnecessary new_valid_dev() check
Applying: fs/exofs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/ext2/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/ext4/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/f2fs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/hpfs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/jfs: remove unnecessary new_valid_dev() checks
Applying: fs/ncpfs/dir.c: remove unnecessary new_valid_dev() check
Applying: fs/nfs/dir.c: remove unnecessary new_valid_dev() check
Applying: fs/nilfs2/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/reiserfs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/stat.c: remove unnecessary new_valid_dev() check
Applying: fs/ubifs/: remove unnecessary new_valid_dev() checks
Applying: fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries
Merging akpm/master (2b35ee726310 fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries)
Applying: Revert "powerpc/mm: add page soft dirty tracking"
