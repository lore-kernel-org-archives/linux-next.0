From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 2
Date: Fri, 2 Oct 2015 15:27:50 +1000
Message-ID: <20151002152750.3576ccca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

There will be no linux-next release on Monday.

Changes since 20151001:

I used the h8300 tree from next-20150828 since the current tree has been
rebased onto linux-next again :-(

The battery tree still had its build failure so I used the version from
next-20150925.

The target-updates tree gained a conflict against the kdbus tree.

The pinctrl tree still had its build failure so I used the version from
next-20150924.

The akpm-current tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 4318
 3547 files changed, 168949 insertions(+), 76355 deletions(-)

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

I am currently merging 226 trees (counting Linus' and 33 trees of patches
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
Merging origin/master (ccf70ddcbe99 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (868e87ccda24 ARM: make RiscPC depend on MMU)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (5f81b95fe2a2 cxl: fix leak of ctx->mapping when releasing kernel API contexts)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (b84f78782052 net: Initialize flow flags in input path)
Merging ipsec/master (4e077237cfb6 xfrm: Fix state threshold configuration from userspace)
Merging sound-current/for-linus (7f57d803ee03 ALSA: hda - Disable power_save_node for Thinkpads)
Merging pci-current/for-linus (de24c18c0fac PCI: rcar: Add R8A7794 support)
Merging wireless-drivers/master (76d164f58215 ath10k: fix DMA related firmware crashes on multiple devices)
Merging driver-core.current/driver-core-linus (9ffecb102835 Linux 4.3-rc3)
Merging tty.current/tty-linus (9ffecb102835 Linux 4.3-rc3)
Merging usb.current/usb-linus (9ffecb102835 Linux 4.3-rc3)
Merging usb-gadget-fixes/fixes (f5f6afa85aa8 usb: renesas_usbhs: Add support for R-Car H3)
Merging usb-serial-fixes/usb-linus (19ab6bc5674a USB: option: add ZTE PIDs)
Merging staging.current/staging-linus (9ffecb102835 Linux 4.3-rc3)
Merging char-misc.current/char-misc-linus (9ffecb102835 Linux 4.3-rc3)
Merging input-current/for-linus (218c1f76b8b2 Input: psmouse - fix data race in __ps2_command)
Merging crypto-current/master (09185e2756a8 hwrng: xgene - fix handling platform_get_irq)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (b94be972538f drm/i915: Call non-locking version of drm_kms_helper_poll_enable(), v2)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging arm/for-next (4d52d4ba57ce Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (8ff305bef7bb Merge branch 'fixes' into for-next)
Merging at91/at91-next (5ccea17e1ab3 Merge branch 'at91-4.4-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (73080a8f18aa Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e82731e47607 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (6fc43b806999 Merge branch 'for_4.4/config' into next)
Merging mvebu/for-next (8e4bb296450b Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (9a5e3f27d1b8 ARM: dts: fix omap2+ address translation for pbias)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (0eac5ea05ecd Merge branch 'dts-for-4.3-rc2' into base-4.3-rc1)
Merging renesas/next (a674ce365560 Merge branch 'heads/cleanup-for-v4.4' into next)
Merging rockchip/for-next (6ba6d4146d13 Merge branch 'v4.4-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (acf92fee9a9b Merge branch 'v4.4-next/dt-samsung' into for-next)
Merging samsung-krzk/for-next (f681f707ea8b Merge branch 'dt-for-next' into for-next)
Merging sunxi/sunxi/for-next (a3dbb527644b Merge branch 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (d27eb50227d8 Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (6ff33f3902c3 Linux 4.3-rc1)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (657926a83df9 cris: time: Cleanup of persistent clock stuff)
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (a509af1245d8 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (dc9ec9f2e065 MIPS: Use ARCH_USE_BUILTIN_BSWAP.)
CONFLICT (content): Merge conflict in arch/mips/include/asm/mips-cm.h
Merging nios2/for-next (8840da98bfec nios2: Switch to generic __xchg())
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (2adc48a69186 powerpc: Add ppc64le_defconfig)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (56e42242b16b s390/mm: try to avoid storage key operation in ptep_set_access_flags)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (dfd51f97823e tile/jump_label: add jump label support for TILE-Gx)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (ff9f84b7d79d [SMB3] Missing null tcon check)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (9181f8bf5abf udf: Don't modify filesystem for read-only mounts)
Merging ext4/dev (bdfe0cbd746a Revert "ext4: remove block_device_ejected")
Merging f2fs/dev (86c62cee20c5 f2fs: use vmalloc to handle -ENOMEM error)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (6de20eb0dee4 GFS2: Set s_mode before parsing mount options)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (e3be4266d348 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging nfsd/nfsd-next (5de7c5d9f5e5 nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (d9aa4e0bfb63 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (7c7feb2ebfc9 UBI: return ENOSPC if no enough space available)
Merging xfs/for-next (1f93e4a96c91 Linux 4.3-rc2)
Merging file-locks/linux-next (128a37852234 fs: fix data races on inode->i_flctx)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (ebfc4df6bfc8 Merge branches 'pci/host-designware', 'pci/host-generic', 'pci/host-imx6', 'pci/host-rcar' and 'pci/host-tegra' into next)
Merging hid/for-next (231ccd55b312 Merge branch 'for-4.4/corsair' into for-next)
Merging i2c/i2c/for-next (f5956abbe430 Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (91cec9604f54 hwmon: (abx500) drop the use of IRQF_NO_SUSPEND)
Merging v4l-dvb/master (41a8f406dacd Merge branch 'missed' into to_next)
CONFLICT (content): Merge conflict in mm/Makefile
Merging kbuild/for-next (a8503631df45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (8d6153c32fd3 Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (5d95ac8b1761 Merge branch 'pm-tools' into linux-next)
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (97584d1838b7 thermal: power_allocator: exit early if there are no cooling devices)
Merging thermal-soc/next (b840b6e65cbe thermal: ti-soc-thermal: add OMAP36xx support)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (9089e2dc74eb Merge branch 'topic/of' into next)
Merging net-next/master (4bf1b54f9df7 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next)
CONFLICT (content): Merge conflict in net/dsa/slave.c
Merging ipsec-next/master (c386578f1cdb xfrm: Let the flowcache handle its size by default.)
Merging wireless-drivers-next/master (1f9c6e1bc1ba mwifiex: fix mwifiex_rdeeprom_read())
Merging bluetooth/master (5f509239eccc ieee802154: handle datagram variables as u16)
Merging rdma/for-next (070b39972320 IB/mlx4: Report checksum offload cap for RAW QP when query device)
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (a7f5ba40c74e mtd: nand: remove unused ->init_size() hook)
Merging crypto/master (9196d9676fe7 crypto: qat - remove unneeded variable)
Merging drm/drm-next (2d4df13c0f9e Merge tag 'topic/drm-misc-2015-09-25' of git://anongit.freedesktop.org/drm-intel into drm-next)
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (101b506a7fc7 drm/i915: Wa32bitGeneralStateOffset & Wa32bitInstructionBaseOffset)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
Merging drm-tegra/drm/tegra/for-next (459cc2c6800b drm/tegra: sor: Add HDMI support)
Merging drm-misc/topic/drm-misc (945ef5bb146e vgaarb: use kzalloc in vga_arbiter_add_pci_device())
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (44b7308871ac ALSA: firewire-digi00x: add support for asynchronous messaging)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_audio.c
Merging sound-asoc/for-next (f03a501d76d0 Merge remote-tracking branch 'asoc/topic/sunxi' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (a27b5e0a78c3 Input: add DA9062 OnKey capability to DA9063 OnKey driver)
Merging block/for-next (f7e7868b4743 cdrom: Random writing support for BD-RE media)
Merging device-mapper/for-next (2a708cff93f1 dm: fix AB-BA deadlock in __dm_destroy())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (f7734d097520 mmc: debugfs: implement ios show for SDR12 and SDR25)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (ef28ba0c94bb md/bitmap: don't pass -1 to bitmap_storage_alloc.)
Merging mfd/for-mfd-next (006d2c2a7105 mfd: atmel-flexcom: Add a driver for Atmel Flexible Serial Communication Unit)
Merging backlight/for-backlight-next (13d20b3b618a backlight: tosa: Export I2C module alias information)
Merging battery/master (6169588f69f8 Documentation: power: bq24257: Document exported sysfs entries)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (6a5e3bd0c8bc tridentfb: Add DDC support)
Merging regulator/for-next (400f67e19e2f Merge remote-tracking branches 'regulator/topic/pwm', 'regulator/topic/qcom-smd', 'regulator/topic/supply' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (07f081fb5057 PKCS#7: Add OIDs for sha224, sha284 and sha512 hash algos and use them)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (db73b9d316b6 selinux: ioctl_has_perm should be static)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (55f1dfb398d9 watchdog: iTCO: Fix dependencies on I2C)
Merging iommu/next (4ad79562577a Merge branches 'arm/omap', 'arm/msm', 'arm/smmu', 'arm/tegra', 'x86/vt-d', 'x86/amd', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (b479bfd00e46 DocBook: Use a fixed encoding for output)
Merging trivial/for-next (0c6cac7ab444 hwmon: applesmc: fix comment typos)
Merging audit/next (fdccf5752869 audit: audit_tree_match can be boolean)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (a13f18f59d26 Documentation: arm: Fix typo in the idle-states bindings examples)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (34860522c13a Merge remote-tracking branches 'spi/topic/omap-uwire', 'spi/topic/pxa2xx', 'spi/topic/s3c64xx', 'spi/topic/stats' and 'spi/topic/txx9' into spi-next)
Merging tip/auto-latest (c7fb3fd8c115 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (baf7dce4608a Merge branch 'ras-for-4.4' into for-next)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (37aea98b84c0 tracing: Add trace options for tracer options to instances)
Merging rcu/rcu/next (19a5ecde086a rcu: Suppress lockdep false positive for rcp->exp_funnel_mutex)
Merging kvm/linux-next (b7d2063177a5 iommu/vt-d: Add a command line parameter for VT-d posted-interrupts)
Merging kvm-arm/next (1f93e4a96c91 Linux 4.3-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (3eb4ee682542 KVM: PPC: Book3S: Take the kvm->srcu lock in kvmppc_h_logical_ci_load/store())
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (3e64472c1c74 xen: switch extra memory accounting to use pfns)
CONFLICT (content): Merge conflict in arch/x86/include/asm/xen/page.h
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (874bbfe600a6 workqueue: make sure delayed work run in local cpu)
Merging drivers-x86/for-next (8a1513b49321 hp-wmi: limit hotkey enable)
Merging chrome-platform/for-next (1d95e6f10fd8 platform/chrome: cros_ec: Fix possible leak in led_rgb_store())
Merging regmap/for-next (f4d999b8c3d3 Merge remote-tracking branches 'regmap/topic/atomic', 'regmap/topic/debugfs', 'regmap/topic/irq' and 'regmap/topic/irq-hdr' into regmap-next)
Merging hsi/for-next (c616ac28a5b3 HSI: Fix a typo)
Merging leds/for-next (18ce230f96e1 LED/MIPS: Move SEAD3 LED driver to where it belongs.)
Merging ipmi/for-next (f22b7d0682d3 char: ipmi: Move MODULE_DEVICE_TABLE() to follow struct)
Merging driver-core/driver-core-next (9ffecb102835 Linux 4.3-rc3)
Merging tty/tty-next (9ffecb102835 Linux 4.3-rc3)
Merging usb/usb-next (07294cc2ea30 USB: Added forgotten parameter description for authorized attribute in usb.h)
Merging usb-gadget/next (21795c826a45 usb: dwc2: exit hibernation on session request)
Merging usb-serial/usb-next (6ff33f3902c3 Linux 4.3-rc1)
Merging staging/staging-next (5b62408ffe42 staging: dgap: fix memory leak in dgap_parsefile())
Merging char-misc/char-misc-next (c566f365434e Merge 4.3-rc3 into char-misc-next)
Merging extcon/extcon-next (de992acb93df extcon: gpio: Use descriptor-based GPIO interface instead of legacy gpio_* API)
Merging kdbus/kdbus (a36324913ff2 kdbus: selftests: add more name registry tests)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
Merging cgroup/for-next (a3e72739b7a7 cgroup: fix too early usage of static_branch_disable())
Applying: vmscan build fix
Merging scsi/for-next (1378889c563a scsi_dh: Use the correct module name when loading device handler)
Merging target-updates/for-next (f71933438300 configfs: remove old API)
CONFLICT (content): Merge conflict in samples/Makefile
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (f6c804b08ca5 ARM: at91/dt: sama5d2: add pio controller node)
$ git reset --hard HEAD^
Merging next-20150924 version of pinctrl
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (46d4f7c25e1b gpio: omap: Fix GPIO numbering for deferred probe)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (a83a6a82250f pwm: atmel-hlcdc: Fix module autoload for OF platform driver)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (a3ff23375aa4 clk: atlas7: fix noc/socket disconnect/reconnect for unit clks)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (4d92ff1f399d kselftest: add cleankselftest rule)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (ce9478fdb6e0 coresight: etm3x: making error message unambiguous)
Merging rtc/rtc-next (ec7fe80d5f9e rtc: pcf2127: make module license match the file header)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (ae4f97696889 mm: fix type cast in __pfn_to_phys())
Merging akpm-current/current (1c6c4fb52319 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
CONFLICT (content): Merge conflict in fs/proc/base.c
CONFLICT (content): Merge conflict in fs/proc/array.c
CONFLICT (content): Merge conflict in Documentation/filesystems/proc.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
Applying: mips: allocate sys_membarrier system call number
Applying: sparc/sparc64: allocate sys_membarrier system call number
Applying: kernel.h: make abs() work with 64-bit types
Applying: Remove abs64()
Applying: remove-abs64-fix
Applying: Documentation/sysctl/vm.txt: fix misleading code reference of overcommit_memory
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (fe5f843a2efe drivers/w1/w1_int.c: call put_device if device_register fails)
