From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 15
Date: Thu, 15 Oct 2015 18:51:50 +1100
Message-ID: <20151015185150.76cecc3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34536 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750711AbbJOHvx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 03:51:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151013:

The asm-generic tree gained a build failure for which I applied a
fix patch.

The arm-soc tree gained a build failure so I used the version from
next-20151013.

I used the h8300 tree from next-20150828 since the current tree has been
rebased onto linux-next again :-(

The slave-dma tree gained a build failure for which I applied a merge
fix patch.

The net-next tree gained a conflict against the net tree.

The crypto tree gained a build failure so I used the version from
next-20151013.

The drm-misc tree gained a conflict against the drm-intel tree.

The mfd tree gained a conflict against the arm-soc tree and a build
failure for which I applied a merge fix patch.

The battery tree still had its build failure so I used the version from
next-20150925.

The dwmw2-iommu tree lost its build failure.

The tip tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 7286
 6061 files changed, 285961 insertions(+), 125568 deletions(-)

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
Merging origin/master (5b5f1455272e Merge tag 'nfsd-4.3-2' of git://linux-nfs.org/~bfields/linux)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (049e6dde7e57 Linux 4.3-rc4)
Merging arm-current/fixes (868e87ccda24 ARM: make RiscPC depend on MMU)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (abb39bc792aa selftests/powerpc: Fix build failure of load_unaligned_zeropad test)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (0f8b8e28fb32 tipc: eliminate risk of stalled link synchronization)
Merging ipsec/master (4e077237cfb6 xfrm: Fix state threshold configuration from userspace)
Merging ipvs/master (6ece90f9a13e netfilter: fix Kconfig dependencies for nf_dup_ipv{4,6})
Merging sound-current/for-linus (e8d65a8d9852 ALSA: hda - Fix inverted internal mic on Lenovo G50-80)
Merging pci-current/for-linus (1266963170f5 PCI: Prevent out of bounds access in numa_node override)
Merging wireless-drivers/master (de28a05ee28e Merge tag 'iwlwifi-for-kalle-2015-10-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (9ffecb102835 Linux 4.3-rc3)
Merging tty.current/tty-linus (25cb62b76430 Linux 4.3-rc5)
Merging usb.current/usb-linus (25cb62b76430 Linux 4.3-rc5)
Merging usb-gadget-fixes/fixes (f5f6afa85aa8 usb: renesas_usbhs: Add support for R-Car H3)
Merging usb-serial-fixes/usb-linus (049e6dde7e57 Linux 4.3-rc4)
Merging staging.current/staging-linus (25cb62b76430 Linux 4.3-rc5)
Merging char-misc.current/char-misc-linus (25cb62b76430 Linux 4.3-rc5)
Merging input-current/for-linus (a487c03fa282 Input: cyapa - fix the copy paste error on electrodes_rx value)
Merging crypto-current/master (8996eafdcbad crypto: ahash - ensure statesize is non-zero)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (18e9345b0db9 drm/i915: Add primary plane to mask if it's visible)
Merging asm-generic/master (9fe5cf2f2b49 asm-generic: cmpxchg: avoid warnings from macro-ized cmpxchg() implementations)
Applying: fix for "move io-64-nonatomic*.h out of asm-generic"
Merging arc/for-next (c65be716beb6 ARC: boot: Annotate functins with ENTRY/END)
Merging arm/for-next (4b07b838b432 Merge branches 'drm-dwhdmi-devel', 'drm-tda998x-devel2' and 'drm-armada-devel' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (054254019229 arm-soc: document merges)
$ git reset --hard HEAD^
Merging next-20151013 version of arm-soc
Merging at91/at91-next (5ccea17e1ab3 Merge branch 'at91-4.4-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (99c5d7234cf2 Merge branch 'berlin64/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (72cb4da12bc8 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (6818a20cf823 Merge branch 'for_4.4/dts-part2' into next)
Merging mvebu/for-next (dfca164707fe Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (daaf64975530 Merge branches 'omap-for-v4.4/dt' and 'omap-for-v4.4/cleanup' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (fcbba086b456 ARM: dts: msm8974: Add SCM firmware node)
Merging renesas/next (c7aba848d39f Merge branches 'heads/defconfig-for-v4.4' and 'heads/dt-for-v4.4' into next)
Merging rockchip/for-next (e48710e700ef Merge branch 'v4.4-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (bf75c3826aa4 Merge branch 'v4.4-samsung-defconfig' into for-next)
Merging samsung-krzk/for-next (356cc128dc85 Merge branch 'dt-for-next' into for-next)
Merging sunxi/sunxi/for-next (3b47c1d196d1 Merge branch 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (84529095fefd Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (52fa1927e953 Revert "arm64: ioremap: add ioremap_cache macro")
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (d81a922cf21f CRIS: Drop code related to obsolete or unused kconfigs)
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (78dbbf304149 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (bdb232890472 Merge branch '4.3-fixes' into mips-for-linux-next)
Merging nios2/for-next (8840da98bfec nios2: Switch to generic __xchg())
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (891121e6c02c powerpc/mm: Differentiate between hugetlb and THP during page walk)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (fdbbe8e79147 s390/spinlock: remove unneeded serializations at unlock)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (dfd51f97823e tile/jump_label: add jump label support for TILE-Gx)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (c6fa8e6de3dc Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (1c4b54e369dc ext4: use private version of page_zero_new_buffers() for data=journal mode)
Merging f2fs/dev (d237bc0389e9 f2fs: set GFP_NOFS for grab_cache_page)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (491e94f79098 gfs2: Add missing else in trans_add_meta/data)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (c6fa8e6de3dc Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging nfsd/nfsd-next (b9102aeeec90 sunrpc: avoid warning in gss_key_timeout)
Merging orangefs/for-next (548049495cb4 Orangefs: fix some checkpatch.pl complaints that had creeped in.)
Merging overlayfs/overlayfs-next (8d3095f4ad47 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (1cb8f9776c7d ubi: fastmap: Implement produce_free_peb())
Merging xfs/for-next (1e2103cbf4ad Merge branch 'xfs-misc-fixes-for-4.4-1' into for-next)
Merging file-locks/linux-next (128a37852234 fs: fix data races on inode->i_flctx)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (eff85634ffb2 Merge branch 'pci/misc' into next)
Merging hid/for-next (7c5cb8c04b33 Merge branch 'for-4.4/multitouch' into for-next)
Merging i2c/i2c/for-next (708ca4084126 i2c: rcar: clean up after refactoring)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (cc904f9cf26d hwmon: (coretemp) Increase limit of maximum core ID from 32 to 128.)
Merging v4l-dvb/master (41a8f406dacd Merge branch 'missed' into to_next)
CONFLICT (content): Merge conflict in mm/Makefile
Merging kbuild/for-next (c57e3c5c6d65 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (dd4242167fae Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (77291ef3fd34 Merge branch 'pm-opp' into linux-next)
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (a353d85dc365 Merge branches 'thermal-core' and 'thermal-intel' of .git into next)
Merging thermal-soc/next (b840b6e65cbe thermal: ti-soc-thermal: add OMAP36xx support)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (8cd0f1c3b306 Merge branch 'topic/edma' into next)
Applying: dmaengine: idma64: merge fix for "move io-64-nonatomic*.h out of asm-generic"
Merging net-next/master (4b418bff3dae net: vrf: Documentation update, ip commands)
CONFLICT (content): Merge conflict in net/switchdev/switchdev.c
CONFLICT (content): Merge conflict in net/ipv6/xfrm6_output.c
CONFLICT (content): Merge conflict in net/ipv4/inet_connection_sock.c
CONFLICT (content): Merge conflict in drivers/net/usb/asix_common.c
Merging ipsec-next/master (c386578f1cdb xfrm: Let the flowcache handle its size by default.)
Merging ipvs-next/master (92240e8dc0d1 ipvs: Remove possibly unused variables from ip_vs_conn_net_{init,cleanup})
Merging wireless-drivers-next/master (8785955bbc28 mwifiex: remove unnecessary NULL check)
Merging bluetooth/master (6c6eb77f5134 Bluetooth: btusb: Print information of Intel SfP lock states)
Merging rdma/for-next (070b39972320 IB/mlx4: Report checksum offload cap for RAW QP when query device)
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (f49c352d4d19 mtd: fsl-quadspi: Include <linux/sizes.h> to avoid build error)
Merging crypto/master (62f57d05e287 crypto: pkcs7 - Fix unaligned access in pkcs7_verify())
$ git reset --hard HEAD^
Merging next-20151013 version of crypto
Merging drm/drm-next (d4070ff71363 Merge tag 'drm-intel-next-2015-09-11' of git://anongit.freedesktop.org/drm-intel into drm-next)
Applying: drm/fb-helper: merge fix for "Use -errno return in restore_mode_unlocked"
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (7564fde3a13e MAINTAINERS: add link to the Intel Graphics for Linux web site)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (3fe2c7d4c85b gpu: host1x: Fix MLOCK's debug info)
Merging drm-misc/topic/drm-misc (5f4796e02d2e gpu/doc: Convert to markdown harder)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_irq.c
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (ab30965d9bfc ALSA: usb-audio: Fix max packet size calculation for USB audio)
Merging sound-asoc/for-next (4ee8f0c3d228 Merge remote-tracking branch 'asoc/topic/topology' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (47ec6e5a5f57 Input: rotary_encoder - add wake up support)
Merging block/for-next (9d84a0e316e5 Merge branch 'for-4.4/drivers' into for-next)
Merging device-mapper/for-next (0f712a30ac9e dm: convert ffs to __ffs)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (f264ecfaa770 mmc: core: Remove MMC_CLKGATE)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (c665249239c4 Fix adding of new disk with new reload code)
Merging mfd/for-mfd-next (db96ec728d69 mfd: dt-bindings: Document pulled down WRSTBI pin on S2MPS1X)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/s2mps11.txt
Applying: mfd: fix for "move io-64-nonatomic*.h out of asm-generic"
Applying: mfd: fix for "move io-64-nonatomic*.h out of asm-generic"
Merging backlight/for-backlight-next (7111c6c672fc backlight: adp8870: Remove unnecessary MODULE_ALIAS())
Merging battery/master (6169588f69f8 Documentation: power: bq24257: Document exported sysfs entries)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (08bfb453f045 radeonfb: Deinline large functions)
Merging regulator/for-next (647c450ec24f Merge remote-tracking branches 'regulator/topic/qcom-smd', 'regulator/topic/supply', 'regulator/topic/tps6105x' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (049e6dde7e57 Linux 4.3-rc4)
Merging integrity/next (72e1eed8abb1 integrity: prevent loading untrusted certificates on the IMA trusted keyring)
Merging selinux/next (7bd1c6fc9679 selinux: Use a kmem_cache for allocation struct file_security_struct)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (55f1dfb398d9 watchdog: iTCO: Fix dependencies on I2C)
Merging iommu/next (2b5c981d352b Merge branches 'iommu/fixes', 'x86/amd', 'x86/vt-d', 'arm/omap' and 's390' into next)
Merging dwmw2-iommu/master (d74dd73b2759 iommu/vt-d: Add callback to device driver on page faults)
Applying: iommu/vt-d: fix for "Add intel_svm_{un,}bind_mm() functions"
CONFLICT (content): Merge conflict in include/linux/intel-iommu.h
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (334bb79c18eb doc: Clarify that nmi_watchdog param is for hardlockups)
CONFLICT (content): Merge conflict in Documentation/Changes
Merging trivial/for-next (0c6cac7ab444 hwmon: applesmc: fix comment typos)
Merging audit/next (fdccf5752869 audit: audit_tree_match can be boolean)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (0f1cba62520b Merge branch 'dt-doc-cleanup' into for-next)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (883c72a246eb Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/stats' and 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (67aae811de8a Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in arch/x86/Makefile
CONFLICT (content): Merge conflict in arch/arm64/kernel/acpi.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/atomic.h
CONFLICT (content): Merge conflict in Documentation/arm/uefi.txt
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (9bb04c919a70 Merge branch 'ras-for-4.4' into for-next)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (37aea98b84c0 tracing: Add trace options for tracer options to instances)
Merging rcu/rcu/next (c3c7edcab39d documentation: Expand on scheduler/RCU deadlock requirements)
Merging kvm/linux-next (bff98d3b01e0 Merge branch 'kvm-master' into HEAD)
Merging kvm-arm/next (1f93e4a96c91 Linux 4.3-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (3eb4ee682542 KVM: PPC: Book3S: Take the kvm->srcu lock in kvmppc_h_logical_ci_load/store())
Merging kvms390/next (1330a0170a48 Merge tag 'kvm-s390-next-20151013' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging xen-tip/linux-next (10e5d40c0b61 xen/balloon: Use the correct sizeof when declaring frame_list)
CONFLICT (content): Merge conflict in arch/x86/xen/p2m.c
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (4fcfc3013144 Merge branch 'for-4.4' into for-next)
Merging drivers-x86/for-next (7d3777d10691 OLPC: Use %*ph specifier instead of passing direct values)
Merging chrome-platform/for-next (18800fc7a04e platform/chrome: Support reading/writing the vboot context)
Merging regmap/for-next (d4a1a317e747 Merge remote-tracking branches 'regmap/topic/atomic', 'regmap/topic/debugfs' and 'regmap/topic/irq-hdr' into regmap-next)
Merging hsi/for-next (e74eba049356 hsi: omap_ssi_port: Prevent warning if cawake_gpio is not defined.)
Merging leds/for-next (879055753e51 leds: leds-gpio: add shutdown function)
Merging ipmi/for-next (f22b7d0682d3 char: ipmi: Move MODULE_DEVICE_TABLE() to follow struct)
Merging driver-core/driver-core-next (8346aa765e14 Revert "mm: Check if section present during memory block (un)registering")
Merging tty/tty-next (378102f364d3 Merge 4.3-rc5 into tty-next)
Merging usb/usb-next (b1630da0589d Merge 4.3-rc5 into usb-next)
Merging usb-gadget/next (09a75e857790 usb: dwc2: refactor common low-level hw code to platform.c)
Merging usb-serial/usb-next (92944c4520ed USB: qcserial: update comment for Sierra Wireless MC7304/MC7354)
Merging staging/staging-next (26368fd7048f Staging: skein: Remove NULL comparison)
Merging char-misc/char-misc-next (4970c0cb6aa8 Merge 4.3-rc5 into char-misc next)
Merging extcon/extcon-next (aae35f970c26 extcon: Modify the id and name of external connector)
Merging kdbus/kdbus (fc87a0ace7e3 kdbus: create /sys/fs/kdbus with sysfs_create_mount_point())
Merging cgroup/for-next (a3e72739b7a7 cgroup: fix too early usage of static_branch_disable())
Applying: vmscan build fix
Merging scsi/for-next (15e3d5a285ab 3w-9xxx: don't unmap bounce buffered commands)
Merging target-updates/for-next (517982229f78 configfs: remove old API)
CONFLICT (content): Merge conflict in samples/Makefile
Applying: stm class: Use per-attribute show and store methods in configfs policy
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (0254cb138f0e Merge branch 'devel' into for-next)
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (2db8aba860c7 gpio: pca953x: Add TI TCA9539 support)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (7e3b7dc76c41 pwm: Add MediaTek display PWM driver support)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (4e4f485c89c9 clk: tegra: delete unneeded of_node_put)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (e2343596c9d6 selftests/pstore: add pstore test scripts going with reboot)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (4b46883661fe coresight: etm3x: adding documentation for sysFS's cpu interface)
CONFLICT (content): Merge conflict in Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Merging rtc/rtc-next (0c155bd0c179 rtc: stmp3xxx: unify register access macros)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (538ea4aa4473 pmem, memremap: convert to numa aware allocations)
Merging akpm-current/current (c3a0c7301db7 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/failslab.c
CONFLICT (content): Merge conflict in drivers/usb/host/u132-hcd.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
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
Merging akpm/master (82d3dc5a0833 drivers/scsi/cxgbi: fix build with EXTRA_CFLAGS)
