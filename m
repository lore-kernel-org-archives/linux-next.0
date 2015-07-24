From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 24
Date: Fri, 24 Jul 2015 15:54:49 +1000
Message-ID: <20150724155449.1debf375@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40381 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754028AbbGXFyv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jul 2015 01:54:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150723:

The ext4 tree still had its build failure so I used the version from
next-20150722.

The next-next tree lost its build failure.

The wireless-drivers-next tree still had its build failure so I used the
version from next-20150721.

The input tree gained a build failure so I used the version from
next-20150723.

The mmc-uh tree gained a conflict against the imx-mxs tree.

The vhost tree gained a conflict against Linus' tree.

The akpm-current tree gained 2 build failures for which I reverted
2 commits.

Non-merge commits (relative to Linus' tree): 3545
 3550 files changed, 158080 insertions(+), 90948 deletions(-)

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
Merging origin/master (45b4b782e848 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (0871b7248113 ARM: fix __virt_to_idmap build error on !MMU)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-merge-benh/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (4a10a91756ef Merge branch 'upstream' of git://git.infradead.org/users/pcmoore/audit)
Merging net/master (c5dfd654d0ec Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once at start of day.)
Merging sound-current/for-linus (cba59972a119 ALSA: hda - Add headset mic pin quirk for a Dell device)
Merging pci-current/for-linus (c9ddbac9c891 PCI: Restore PCI_MSIX_FLAGS_BIRMASK definition)
Merging wireless-drivers/master (df2cd4586f17 Merge tag 'iwlwifi-for-kalle-2015-06-12' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (52721d9d3334 Linux 4.2-rc3)
Merging tty.current/tty-linus (dec273ecc116 sc16is7xx: fix FIFO address of secondary UART)
Merging usb.current/usb-linus (1209544d8a2a USB: OHCI: fix bad #define in ohci-tmio.c)
Merging usb-gadget-fixes/fixes (aebda6187181 usb: dwc3: Reset the transfer resource index on SET_INTERFACE)
Merging usb-serial-fixes/usb-linus (6da3700c98cd USB: qcserial: Add support for Dell Wireless 5809e 4G Modem)
Merging staging.current/staging-linus (00243b1d180b Merge tag 'iio-fixes-for-4.2c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (154322f47376 mei: prevent unloading mei hw modules while the device is opened.)
Merging input-current/for-linus (968491709e5b Input: usbtouchscreen - avoid unresponsive TSC-30 touch screen)
Merging crypto-current/master (f898c522f0e9 crypto: ixp4xx - Remove bogus BUG_ON on scattered dst buffer)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (758556bdc1c8 module: Fix load_module() error path)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible timeout)
Merging kselftest-fixes/fixes (fee50f3c8427 selftests/futex: Fix futex_cmp_requeue_pi() error handling)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging drm-intel-fixes/for-linux-next-fixes (648a9bc5308d drm/i915: Use two 32bit reads for select 64bit REG_READ ioctls)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (450ed0db011d ARCv2: allow selection of page size for MMUv4)
Merging arm/for-next (e18e0166508d Merge branches 'fixes', 'misc' and 'omap-barrier' into for-next)
CONFLICT (content): Merge conflict in arch/arm/include/asm/Kbuild
Merging arm-perf/for-next/perf (73d9b01e4184 arm: perf: factor arm_pmu core out to drivers)
CONFLICT (content): Merge conflict in drivers/perf/arm_pmu.c
Merging arm-soc/for-next (402572f5deb0 arm-soc: document merges)
Merging at91/at91-next (dd1f58f398fb Merge branch 'at91-4.2-dt' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' and 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (5228adb0e270 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (b66ba2c1292d Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (636fdae14fa0 Merge branch 'omap-for-v4.3/legacy-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging renesas/next (65b8b8bba011 Merge branch 'heads/dt-for-v4.3' into next)
Merging samsung/for-next (0c0bbcdd2243 Merge branch 'v4.3-next/dt-samsung' into for-next)
Merging samsung-krzk/for-next (a42a077aac4c Merge branch 'samsung-for-next' into for-next)
Merging sunxi/sunxi/for-next (2676ca3b2993 Merge branch 'sunxi/dt-for-4.3' into sunxi/for-next)
Merging tegra/for-next (7124274285a4 Merge branch for-4.3/defconfig into for-next)
Merging arm64/for-next/core (f871d2680707 arm64: Fix show_unhandled_signal_ratelimited usage)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for debug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (cea36619a7a3 m68k/coldfire/pit: Migrate to new 'set-state' interface)
Merging metag/for-next (7ce0c22b0787 metag/irq: Use access helper irq_data_get_affinity_mask())
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary struct pci_dev declaration)
Merging mips/mips-for-linux-next (8dfdba328c4b Merge branch '4.2-fixes' into mips-for-linux-next)
Merging nios2/nios2-next (a8955cc3a504 nios2: check number of timer instances)
Merging parisc-hd/for-next (9d37e6679dfd Merge branch 'fixes' of git://ftp.arm.linux.org.uk/~rmk/linux-arm)
Merging powerpc/next (79cd95200035 powerpc/eeh: Dump PHB diag-data for non-existing PE)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging powerpc-benh/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (5f26f2eaed8c s390: remove generic email address from maintainers file)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (332d94bf2a47 tile/time: Migrate to new 'set-state' interface)
Merging uml/linux-next (46acfb806813 um: Fix out-of-tree build)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (1203b34261e4 xtensa: fix threadptr reload on return to userspace)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_add_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the zero page)
Merging cifs/for-next (6468ffb3e9da cifs: Fix use-after-free on mid_q_entry)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl commands through)
Merging ext3/for_next (debeb29792f9 mm/Kconfig: NEED_BOUNCE_POOL: clean-up condition)
Merging ext4/dev (bb9a4e7e824e ext4 crypto: fix spelling typo in comment)
$ git reset --hard HEAD^
Merging next-20150722 version of ext4
Merging f2fs/dev (f235401a255f f2fs: convert inline data before set atomic/volatile flag)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (ea79f0ec7a38 GFS2: Make ht_parms static)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (115c48d7a535 NFS: nfs_mark_for_revalidate should always set NFS_INO_REVAL_PAGECACHE)
Merging nfsd/nfsd-next (a75d029a9588 nfsd: don't hold i_mutex over userspace upcalls)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (669d3d123395 UBI: Remove unnecessary `\')
Merging xfs/for-next (bc0195aad0da Linux 4.2-rc2)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (0f1db7dee200 9p: cope with bogus responses from server in p9_client_{read,write})
Merging pci/next (bc0195aad0da Linux 4.2-rc2)
Merging hid/for-next (71f35da47c75 Merge branch 'for-4.3/wacom' into for-next)
Merging i2c/i2c/for-next (19e0ff423382 i2c: omap: fix cleanup regression)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (1840cf8ac8dc hwmon: (f71882fg) Add support for f81768d)
Merging v4l-dvb/master (5bab86243d94 [media] media/pci/cobalt: fix Kconfig and build when SND is not enabled)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kbuild/for-next)
Merging kconfig/for-next (b953c0d234bc Linux 4.1)
Merging libata/for-next (e695342e5aea Merge branch 'for-4.2-fixes' into for-next)
Merging pm/linux-next (119d6c5cb91a Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (eda118f6d479 Merge branches 'for-rc' and 'thermal-core' of .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (db084c00acb7 Merge branch 'fixes' into next)
Merging net-next/master (045a0fa0c5f5 ip_tunnel: Call ip_tunnel_core_init() from inet_init())
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (e79801ffe9c8 mwifiex: correct p2p and station interface counters)
$ git reset --hard HEAD^
Merging next-20150721 version of wireless-drivers-next
Merging bluetooth/master (9a0a8a8e852d Bluetooth: Move IRK checking logic in preparation to new connect method)
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict)
Merging l2-mtd/master (43163022927b mtd: m25p80: allow arbitrary OF matching for "jedec,spi-nor")
Merging crypto/master (03952d980153 crypto: nx - make platform drivers directly register with crypto)
Merging drm/drm-next (c5fd936e992d drm/nouveau: Pause between setting gpu to D3hot and cutting the power)
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add bus format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (63c88d2204bb drm/i915/bxt: add support for HPD long/short pulse detection on HPD_PORT_A pin)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Registers are 32-bit)
Merging drm-misc/topic/drm-misc (f9fe4b9b2ad4 drm/mgag200: remove unneeded variable)
Merging drm-exynos/exynos-drm/for-next (95eac904c794 drm/exynos: move order to register vidi kms driver)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits after hang)
Merging sound/for-next (fbce23a0b957 ALSA: hda - Check the return value from pm_runtime_get/put*())
Merging sound-asoc/for-next (7593388026b5 Merge remote-tracking branches 'asoc/topic/wm8731', 'asoc/topic/wm8904', 'asoc/topic/wm8996' and 'asoc/topic/xtensa' into asoc-next)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_lock if CONFIG_MODULES)
Merging input/next (551336bc63f4 Input: cyapa - add ACPI HID CYAP0002 for Gen6 devices)
$ git reset --hard HEAD^
Merging next-20150723 version of input
Merging block/for-next (f309ead158b3 Merge branch 'for-4.3/drivers' into for-next)
Merging device-mapper/for-next (ac8470cca009 dm btree remove: remove unused function get_nr_entries())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (77a5f675e2d8 mmc: block: add fixup of broken CMD23 for Sandisk card)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (489c8a21ace6 md/raid5: clear R5_NeedReplace when no longer needed.)
Merging mfd/for-mfd-next (dbe2759173df mfd: ipaq-micro: Convert to built-in platform driver)
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the return type of backlight_update_status() to int)
Merging battery/master (1ae25d626cfe power: reset: at91: add sama5d3 reset function)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (8ea5640b82e4 Merge remote-tracking branches 'regulator/topic/qcom-spmi', 'regulator/topic/rk808', 'regulator/topic/stub' and 'regulator/topic/tps6586x' into regulator-next)
Merging security/next (fe6c59dc1790 Merge tag 'seccomp-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into next)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging iommu/next (289903b0b819 Merge branch 'iommu/fixes' into next)
Merging dwmw2-iommu/master (c83b2f20fdde iommu/vt-d: Only enable extended context tables if PASID is supported)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentation)
Merging jc_docs/docs-next (0098f75bf729 Merge branch 'doc/4.3-reproducible' into docs-next)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negative/)
Merging audit/next (0b08c5e59441 audit: Fix check of return value of strnlen_user())
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (0b34c1a489f6 Documentation: DT: Fix a typo in the filename "lantiq,<chip>-pinumx.txt")
Merging mailbox/mailbox-for-next (7d641938aa2a mailbox/bcm2835: Fix mailbox full detection.)
Merging spi/for-next (4b762b0e383c Merge remote-tracking branch 'spi/topic/xcomm' into spi-next)
Merging tip/auto-latest (44a92ebab386 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (6fd817226ae6 clockevents/drivers/timer-sp804: Migrate to new 'set-state' interface)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (f586abe27a44 EDAC, ppc4xx: Access mci->csrows array elements properly)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring buffer benchmark immediately)
Merging rcu/rcu/next (623f41bedea6 rcu: Silence lockdep false positive for expedited grace periods)
CONFLICT (content): Merge conflict in arch/x86/kernel/traps.c
Applying: rcu: merge fix for Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()
Merging kvm/linux-next (549283037017 KVM: svm: handle KVM_X86_QUIRK_CD_NW_CLEARED in svm_get_mt_mask)
Merging kvm-arm/next (c62e631d4a8e KVM: arm/arm64: vgic: Remove useless arm-gic.h #include)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (1de80fd4566e KVM: s390: remove outdated documentation)
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (292c24a073ee percpu: clean up of schunk->map[] assignment in pcpu_setup_first_chunk)
Merging workqueues/for-next (badb7f5e8bdd workqueue: add myself as a dedicated reviwer)
Merging drivers-x86/for-next (d770e558e219 Linux 4.2-rc1)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_laptop - instantiate Atmel at primary address)
Merging regmap/for-next (9faf99c55eba Merge remote-tracking branches 'regmap/topic/debugfs', 'regmap/topic/force-update' and 'regmap/topic/seq-delay' into regmap-next)
Applying: mfd: Fixup clients of multi_reg_write/register_patch
Merging hsi/for-next (f451e76f8969 HSI: nokia-modem: use flags argument of devm_gpiod_get to set direction)
Merging leds/for-next (efbc61308e23 leds: leds-ns2: depends on MACH_ARMADA_370)
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was only read)
Merging driver-core/driver-core-next (52721d9d3334 Linux 4.2-rc3)
Merging tty/tty-next (52721d9d3334 Linux 4.2-rc3)
Merging usb/usb-next (52721d9d3334 Linux 4.2-rc3)
Merging usb-gadget/next (d770e558e219 Linux 4.2-rc1)
Merging usb-serial/usb-next (f4c126ecaef1 USB: serial: ftdi_sio: Fix broken URL in comment)
Merging staging/staging-next (ed15e8880fc3 Merge 4.2-rc3 into staging-next)
Merging char-misc/char-misc-next (52721d9d3334 Linux 4.2-rc3)
Merging extcon/extcon-next (5d900d071232 extcon: Drop owner assignment from i2c_driver)
Merging kdbus/kdbus (748cf9547ea3 kdbus: fix unused %docs make-targets)
Merging cgroup/for-next (917d8e2d10f4 cgroup: add documentation for the PIDs controller)
Merging scsi/for-next (1278dd6809b1 scsi: fix host max depth checking for the 'queue_depth' sysfs interface)
Merging target-updates/for-next (f8d2b3fdf5fe tcm_loop: Send I_T_NEXUS_LOSS_OCCURRED UA)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (79807a02eb54 Merge branch 'devel' into for-next)
Merging vhost/linux-next (6b1152ec14c7 PCI/MSI: Make pci_msi_shutdown(), pci_msix_shutdown() static)
CONFLICT (content): Merge conflict in include/uapi/linux/pci_regs.h
CONFLICT (content): Merge conflict in drivers/vhost/vhost.c
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (1dbda6f997b2 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton platform)
Merging dma-buf/for-next (bc0195aad0da Linux 4.2-rc2)
Merging userns/for-next (75509fd88fbd nsfs: Add a show_path method to fix mountinfo)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (fd7eae82627d clk: socfpga: switch to GENMASK())
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (d770e558e219 Linux 4.2-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (395855d956ed coresight: Fix implicit inclusion of linux/sched.h)
Merging rtc/rtc-next (2f27941335c0 rtc: fix drivers that consider 0 as a valid IRQ in client->irq)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f0f2c072cf53 nfit: add support for NVDIMM "latch" flag)
Merging akpm-current/current (7949ba1dc592 ipc/msg.c: use freezable blocking call)
CONFLICT (modify/delete): fs/ext3/super.c deleted in HEAD and modified in akpm-current/current. Version akpm-current/current of fs/ext3/super.c left in tree.
CONFLICT (content): Merge conflict in arch/cris/arch-v32/kernel/entry.S
CONFLICT (content): Merge conflict in arch/cris/arch-v10/kernel/entry.S
$ git rm -f fs/ext3/super.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
Applying: ARM: mm: do not use virt_to_idmap() for NOMMU systems
Applying: namei: fix warning while make xmldocs caused by namei.c
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix
Applying: mm: mark most vm_operations_struct const
Applying: mm, mpx: add "vm_flags_t vm_flags" arg to do_mmap_pgoff()
Applying: mm: make sure all file VMAs have ->vm_ops set
Applying: mm: use vma_is_anonymous() in create_huge_pmd() and wp_huge_pmd()
Applying: mm, madvise: use vma_is_anonymous() to check for anon VMA
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (16d55c86965a drivers/w1/w1_int.c: call put_device if device_register fails)
$ git am -3 ../patches/0001-Revert-mm-srcu-ify-shrinkers.patch
Applying: Revert "mm: srcu-ify shrinkers"
$ git am -3 ../patches/0001-Revert-hugetlbfs-add-hugetlbfs_fallocate.patch
Applying: Revert "hugetlbfs: add hugetlbfs_fallocate()"
