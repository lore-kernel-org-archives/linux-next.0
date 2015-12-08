From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 8
Date: Tue, 8 Dec 2015 15:49:10 +1100
Message-ID: <20151208154910.78d27c03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43067 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754534AbbLHEtP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 23:49:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20151207:

Undropped tree: cgroup

The vfs tree gained a conflict against the s390 tree and a build failure
so I used the version from next-20151207.

The drm-misc tree gained a build failure so I used the version from
next-20151207.

The gpio tree still had its build failure, so I used the version from
next-20151127 for today.

Non-merge commits (relative to Linus' tree): 4217
 4833 files changed, 174427 insertions(+), 73667 deletions(-)

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
Merging origin/master (62ea1ec5e17f Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (6d1a2adef782 ARC: [axs10x] cap ethernet phy to 100 Mbit/sec)
Merging arm-current/fixes (db0ad024543c ARM: fix uaccess_with_memcpy() with SW_DOMAIN_PAN)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (7f821fc9c77a powerpc/tm: Check for already reclaimed tasks)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (2c302e7e4105 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging net/master (4675390a9e71 ethernet: aurora: AURORA_NB8800 should depend on HAS_DMA)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (eeec5d0ef7ee rtlwifi: rtl8821ae: Fix lockups on boot)
Merging mac80211/master (c1df932c0574 mac80211: fix off-channel mgmt-tx uninitialized variable usage)
Merging sound-current/for-linus (02f6ff90400d ALSA: hda - Add inverted dmic for Packard Bell DOTS)
Merging pci-current/for-linus (99496bd2971f PCI: altera: Fix error when INTx is 4)
Merging driver-core.current/driver-core-linus (31ade3b83e18 Linux 4.4-rc3)
Merging tty.current/tty-linus (31ade3b83e18 Linux 4.4-rc3)
Merging usb.current/usb-linus (4a0c4c36094c USB: host: ohci-at91: fix a crash in ohci_hcd_at91_overcurrent_irq)
Merging usb-gadget-fixes/fixes (62e345ae5b6e usb: dwc3: gadget: don't prestart interrupt endpoints)
Merging usb-serial-fixes/usb-linus (a0e80fbd56b4 USB: serial: Another Infineon flash loader USB ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (9225c0b7b976 staging: lustre: echo_copy.._lsm() dereferences userland pointers directly)
Merging char-misc.current/char-misc-linus (e8c77bda05e5 fpga manager: Fix firmware resource leak on error)
Merging input-current/for-linus (1cf44efa1e4f Input: arizona-haptic - fix disabling of haptics device)
Merging crypto-current/master (79960943fdc1 crypto: talitos - Fix timing leak in ESP ICV verification)
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (527e9316f8ec Linux 4.4-rc4)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (31ade3b83e18 Linux 4.4-rc3)
Merging arm/for-next (6f3fcc61d003 Merge branches 'component', 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (9e9caa6a4961 arm64: perf: Add event descriptions)
Merging arm-soc/for-next (5fa42dbf98eb Merge branch 'next/defconfig' into for-next)
Merging at91/at91-next (17038941c090 Merge branch 'at91-4.4-fixes' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (a85dac7bd3c3 Merge branches 'berlin64/dt', 'berlin/dt' and 'berlin64/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (8d22e1523d6d Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (e5b77c3c5cd0 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (ffeaf25ceeb7 Merge branch 'omap-for-v4.5/dt' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (f7ae3dd65b9b soc: qcom: enable smsm/smp2p modular build)
Merging renesas/next (7e9e9d7f8bc7 Merge branch 'heads/dt-for-v4.5' into next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/Kconfig
Merging rockchip/for-next (45d2677e6738 Merge branch 'v4.5-armsoc/dts32' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/platsmp.c
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (945028c273a7 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (2eda61e3b9ef Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (3ba3a74b6545 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/Kconfig
Merging arm64/for-next/core (004ab584e028 arm64: ftrace: fix the comments for ftrace_modify_code)
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
Merging mips/mips-for-linux-next (df1ab72748ba MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (54046148cf68 parisc: Wire up mlock2 syscall)
Merging powerpc/next (d1e1cf2e38de powerpc: clean up asm/switch_to.h)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (419123f900da s390/spinlock: do not yield to a CPU in udelay/mdelay)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (09745f38a74e arch/tile: turn off timer tick for oneshot_stopped state)
Merging uml/linux-next (2eb5f31bc4ea um: Switch clocksource to hrtimers)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (6573b8564d37 update signing code)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (087ffd4eae99 jbd2: fix null committed data return in undo_access)
Merging f2fs/dev (fb39cbda1470 Merge branch 'libnvdimm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (83bdc7b7b084 gfs2: change gfs2 readdir cookie)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (527e9316f8ec Linux 4.4-rc4)
Merging nfsd/nfsd-next (d093ded79a89 nfsd: don't base cl_cb_status on stale information)
Merging orangefs/for-next (555fa0fa618b fs: out of bounds on stack in iov_iter_advance)
Merging overlayfs/overlayfs-next (257f87199347 ovl: move super block magic number to magic.h)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (8c1c5f263833 ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (8ace5dfb983e locks: use list_first_entry_or_null())
Merging vfs/for-next (2f404fa467a2 Merge branches 'work.misc', 'work.iov_iter', 'work.copy_file_range' and 'work.xattr' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in drivers/s390/char/zcore.c
$ git reset --hard HEAD^
Merging next-20151207 version of vfs
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/overlayfs/inode.c
[master 3728e6c85ba1] next-20151207/vfs
Merging pci/next (1ec218373b8e Linux 4.4-rc2)
Merging hid/for-next (cb45262a811e Merge branch 'for-4.5/async-suspend' into for-next)
Merging i2c/i2c/for-next (6f37d635bc5a Merge branch 'i2c/for-4.5' into i2c/for-next)
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (072151bb0154 firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (aa1c25666a0c hwmon: (pmbus) Add client driver for LTC3815)
Merging v4l-dvb/master (ca79e72cf39c Merge branch 'patchwork' into to_next)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
Merging kbuild/for-next (9a7d0efd6707 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (6099f4c01fe3 Merge branch 'for-4.4-fixes' into for-next)
Merging pm/linux-next (3ced9fa4533d Merge branch 'acpi-scan' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (31ade3b83e18 Linux 4.4-rc3)
Merging thermal-soc/next (31ade3b83e18 Linux 4.4-rc3)
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (9074639d8644 Merge branch 'topic/tegra' into next)
Merging net-next/master (ad9360b3e5d4 Merge tag 'mac80211-next-for-davem-2015-12-07' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
CONFLICT (content): Merge conflict in net/ipv6/netfilter/nf_conntrack_reasm.c
Merging wireless-drivers-next/master (2abcd3d40d2c Merge tag 'iwlwifi-next-for-kalle-2015-12-01' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/pci.c
Merging bluetooth/master (eeaef728978b Bluetooth: btintel: Create common Intel Version Read function)
Merging mac80211-next/master (1b894521e60c mac80211: handle HW ROC expired properly)
Merging rdma/for-next (db7489e07669 IB/core, cma: Make __attribute_const__ declarations sparse-friendly)
Merging mtd/master (1ddaa021b000 MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs)
Merging l2-mtd/master (41849d49d7d5 mtd: nand: r852: Remove unnecessary synchronize_irq() before free_irq())
Merging crypto/master (a103a75ad978 crypto: n2 - Use platform_register/unregister_drivers())
Merging drm/drm-next (47c0fd728221 Merge tag 'topic/drm-misc-2015-12-04' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/imx-drm-core.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_runtime_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_debugfs.c
Merging drm-panel/drm/panel/for-next (caa602e71609 drm/bridge: Remove gratuitous blank line)
Merging drm-intel/for-linux-next (0d014ff344ab drm/i915: Remove double wait_for_vblank on broadwell.)
Merging drm-tegra/drm/tegra/for-next (a8e676117060 gpu: host1x: Use platform_register/unregister_drivers())
Merging drm-misc/topic/drm-misc (267dce842ac0 drm: Document drm_encoder/crtc_helper_funcs)
$ git reset --hard HEAD^
Merging next-20151207 version of drm-misc
Merging drm-exynos/exynos-drm/for-next (dc085392a3a7 drm/exynos: dsi: modify a error type when getting a node failed)
Merging drm-msm/msm-next (a9ee34b70e07 drm/msm: Remove local fbdev emulation Kconfig option)
Merging sound/for-next (c10368897e10 ALSA: compress: add support for 32bit calls in a 64bit kernel)
Merging sound-asoc/for-next (1a12a4812d67 Merge remote-tracking branches 'asoc/topic/wm8962' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (bcf5b3deb0d2 Input: pixcir_i2c - add support for wake and enable gpios)
Merging block/for-next (8850ffbae636 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Merging device-mapper/for-next (95ae3ad60fba dm verity: add ignore_zero_blocks feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (5acbb99e3883 mmc: core: fix __mmc_switch timeout caused by preempt)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (0ddf8219ca27 md-cluster: Protect communication with mutexes)
Merging mfd/for-mfd-next (526c0ab13672 mfd: syscon: Add a DT property to set value width)
Merging backlight/for-backlight-next (ee65ad0e2a9e backlight: pwm_bl: Avoid backlight flicker when probed from DT)
Merging battery/master (703df6c09795 power: bq27xxx_battery: Reorganize I2C into a module)
Merging omap_dss2/for-next (56fb0cc3b7b6 video: fbdev: rivafb: unlock chip before probiding EDID)
Merging regulator/for-next (ec763d19d3bc Merge remote-tracking branches 'regulator/topic/tps6105x', 'regulator/topic/tps65086', 'regulator/topic/tps65218' and 'regulator/topic/wm831x' into regulator-next)
Merging security/next (ebd68df3f24b Sync to Linus v4.4-rc2 for LSM developers.)
Merging integrity/next (e596de92e5f6 evm: EVM_LOAD_X509 depends on EVM)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1f32f83e5d81 MAINTAINERS: Add Guenter Roeck as reviewer of watchdog drivers)
Merging iommu/next (b67ad2f7c751 Merge branches 'x86/vt-d', 'arm/omap', 'arm/smmu', 's390', 'core' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (222e684ca762 vfio/pci: make an array larger)
Merging jc_docs/docs-next (04bed3278abf Merge branch 'doc/4.5' into docs-next)
Merging trivial/for-next (75021d28594d Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging audit/next (08b9fd158f1d audit: force seccomp event logging to honor the audit_enabled flag)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (65c4d6ee5684 Merge branch 'dt/linus' into for-next)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (cd7c8c2b7fd0 Merge remote-tracking branches 'spi/topic/sun4i' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (2cbd4f5c5c24 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (2527dfeb1f64 clocksource/drivers/tango-xtal: Replace code by clocksource_mmio_init)
CONFLICT (content): Merge conflict in arch/h8300/include/asm/io.h
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (f549707af565 EDAC: Rework workqueue handling)
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (39daa7b9e895 ftrace: Show all tramps registered to a record on ftrace_bug())
Merging rcu/rcu/next (dc15c60e39a3 rcutorture: Don't keep empty console.log.diags files)
Merging kvm/linux-next (460146348518 Merge tag 'kvm-s390-next-4.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (460146348518 Merge tag 'kvm-s390-next-4.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (a3eaa8649e4c KVM: VMX: Fix commit which broke PML)
Merging kvms390/next (2f8a43d45d14 KVM: s390: remove redudant assigment of error code)
Merging xen-tip/linux-next (b9fcbcf55dc4 xen/time: use READ_ONCE)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (7931fabdfb62 Merge branch 'for-4.5' into for-next)
Merging drivers-x86/for-next (0ab19793ecc0 apple-gmux: Assign apple_gmux_data before registering)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (e7c1e9a35ef4 Merge remote-tracking branches 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (0ab402a9594c leds: sunfire: Use platform_register/unregister_drivers())
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (31ade3b83e18 Linux 4.4-rc3)
Merging tty/tty-next (31ade3b83e18 Linux 4.4-rc3)
Merging usb/usb-next (900937c0375e usb: ehci: ohci: fix bool assignments)
Merging usb-gadget/next (8005c49d9aea Linux 4.4-rc1)
Merging usb-serial/usb-next (6f923a0134d9 USB: cp210x: add tx_empty())
Merging usb-chipidea-next/ci-for-usb-next (15af5aea51de usb: chipidea: removing of_find_property)
Merging staging/staging-next (f89c2b39ce67 staging:iio:mxs-lradc Fix large integer implicitly truncated to unsigned warning)
Merging char-misc/char-misc-next (1ec218373b8e Linux 4.4-rc2)
Merging extcon/extcon-next (5f01e6bc3336 extcon: rt8973: Add IRQF_ONESHOT to interrupt flags)
Merging cgroup/for-next (a644f92283d9 Merge branch 'for-4.5' into for-next)
Merging scsi/for-next (6e3ac04845fb Merge branch 'fixes' into for-next)
Merging target-updates/for-next (a2ba59203791 target: use offset_in_page macro)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (55c21f12a8db Merge branch 'devel' into for-next)
Merging vhost/linux-next (2286bbcb6bd3 virtio: drop heuristics on ring full)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (9bc96457b53a Merge branch 'devel' into for-next)
$ git reset --hard HEAD^
Merging next-20151127 version of gpio
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
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (a0aede15d496 coresight: checking for NULL string in coresight_name_match())
Merging rtc/rtc-next (980dc707bca4 rtc: imxdi: fix spelling mistake in warning message)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (6b577c9d772c nfit: Adjust for different _FIT and NFIT headers)
Merging akpm-current/current (b4f04f0f6ed9 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/arm/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
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
Merging akpm/master (7378e2d56f7f memstick: use sector_div instead of do_div)
