From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 15
Date: Fri, 15 Jan 2016 15:09:41 +1100
Message-ID: <20160115150941.501b58c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Please do not add any material for v4.6 to your linux-next included
branches until after v4.5-rc1 is released.

Changes since 20160114:

The drivers-x86 tree gained a conflict against Linus' tree.

The aio tree still had a build failure so I used the version from
next-20160111.

The luto-misc tree gained a conflict against Linus' tree.

The akpm tree still had its build failure that I just left broken for now.

Non-merge commits (relative to Linus' tree): 4905
 4531 files changed, 266268 insertions(+), 95795 deletions(-)

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

I am currently merging 238 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (10a0c0f0595b Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (34bfbae33ae8 ARM: 8475/1: SWP emulation: Restore original *data when failed)
Merging m68k-current/for-linus (eb37bc3f85b6 m68k: Provide __phys_to_pfn() and __pfn_to_phys())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (afd2ff9b7e1b Linux 4.4)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (36beca6571c9 sparc64: Fix numa node distance initialization)
Merging net/master (5d19c619ab3f fsl/fman: Delete one function call "put_device" in dtsec_config())
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (01d85b9b2b6b Merge tag 'iwlwifi-for-kalle-2015-12-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (da629cf111a2 mac80211: Don't buffer non-bufferable MMPDUs)
Merging sound-current/for-linus (af368027a49a ALSA: timer: Fix race among timer ioctls)
Merging pci-current/for-linus (5c3b99d05752 PCI: dra7xx: Mark driver as broken)
Merging driver-core.current/driver-core-linus (afd2ff9b7e1b Linux 4.4)
Merging tty.current/tty-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb.current/usb-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb-gadget-fixes/fixes (7d32cdef5356 usb: musb: fail with error when no DMA controller set)
Merging usb-serial-fixes/usb-linus (f7d7f59ab124 USB: cp210x: add ID for ELV Marble Sound Board 1)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (f744c423cacf Merge tag 'iio-fixes-for-4.4c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging input-current/for-linus (009f77383651 Merge branch 'next' into for-linus)
Merging crypto-current/master (cd7e98414462 crypto: algif_skcipher - Add key check exception for cipher_null)
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (afd2ff9b7e1b Linux 4.4)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (4dc0323fd6bd ARCv2: STAR 9000950267: Handle return from intr to Delay Slot #2)
Merging arm/for-next (4ba1a28869c7 Merge branch 'amba-pl011' into for-next)
CONFLICT (content): Merge conflict in drivers/tty/serial/amba-pl011.c
Merging arm-perf/for-next/perf (8fcf04067cb5 Revert "arm64: kernel: enforce pmuserenr_el0 initialization and restore")
Merging arm-soc/for-next (ce504c3d4750 ARM: SoC: document merges)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging at91/at91-next (f2837af0c89d Merge branch 'at91-4.5-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (53b6084357a4 ARM: bcm2835: Add the auxiliary clocks to the device tree.)
Merging bcm2835-soc/bcm2835-soc-next (5234c34e4cd7 ARM: bcm2835: Add Kconfig support for bcm2836)
Merging bcm2835-drivers/bcm2835-drivers-next (a09cd356586d ARM: bcm2835: add rpi power domain driver)
Merging bcm2835-defconfig/bcm2835-defconfig-next (b63074fccbeb ARM: bcm2835: enable auxiliary spi driver in defconfig)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (c6abe665c94f Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (64c3c928aef2 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (95c5bf2f0552 Merge branch 'omap-for-v4.4/fixes' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (e654927c5ff7 ARM: qcom: Drop ARCH_MSM* configs)
Merging renesas/next (23a0d0a54a30 Merge branch 'heads/dt-fixes-for-v4.5' into next)
Merging rockchip/for-next (755651cf0f31 Merge tag 'v4.4-rc5' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (94c286811b3b Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (97dd53d76893 Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
Merging tegra/for-next (92b100361a4e Merge branch for-4.5/defconfig into for-next)
Merging arm64/for-next/core (2a803c4db615 arm64: head.S: use memset to clear BSS)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (2039b162f1cc Merge remote-tracking branch 'origin/master' into h8300-next)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (eb37bc3f85b6 m68k: Provide __phys_to_pfn() and __pfn_to_phys())
Merging m68knommu/for-next (4693c2493a9b m68k: coldfire/gpio: Be sure to clamp return value)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (544f742d0c2a Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (9105b4a82439 parisc: Protect huge page pte changes with spinlocks)
Merging powerpc/next (be6bfc29bc75 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (c2ab7282f0fc s390/sclp: fix possible control register corruption)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (544f7d5a408e numa: remove stale node_has_online_mem() define)
Merging uml/linux-next (3e46b2537632 um: Use race-free temporary file creation)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (988f1f576d4f Merge branch 'for-chris-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.5)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (01b9b0b28626 cifs_dbg() outputs an uninitialized buffer in cifs_readdir())
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (bb00c898ad1c udf: Check output buffer length when converting name to CS0)
Merging ext4/dev (9f053aee1bb8 fs: clean up the flags definition in uapi/linux/fs.h)
Merging f2fs/dev (447135a86659 f2fs: should unset atomic flag after successful commit)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (7508abc4bdac GFS2: Check if iopen is held when deleting inode)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (44aab3e09ef9 NFS: Fix a compile warning about unused variable in nfs_generic_pg_pgios())
CONFLICT (content): Merge conflict in fs/nfs/nfs4file.c
Merging nfsd/nfsd-next (ed97e830390a NFSv4: fix getacl ERANGE for some ACL buffer sizes)
Merging orangefs/for-next (4f20854bf736 Orangefs: don't change EXTRAVERSION)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (dde7f55bd000 Merge branch 'xfs-misc-fixes-for-4.5-2' into for-next)
Merging file-locks/linux-next (b4d629a39e10 locks: rename __posix_lock_file to posix_lock_inode)
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (5c6c026b3867 Merge branch 'pci/trivial' into next)
CONFLICT (content): Merge conflict in include/linux/pci_ids.h
Merging hid/for-next (86243f383145 Merge branch 'for-4.5/logitech' into for-next)
Merging i2c/i2c/for-next (4c7916427953 Merge branch 'i2c/for-4.5' into i2c/for-next)
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-platdrv.c
Merging jdelvare-hwmon/master (ef0303d2bba0 hwmon: (emc2103) Fix typo in MODULE_PARM_DESC)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (91918d13eb17 hwmon: (nct6683) Add basic support for NCT6683 on Mitac boards)
Merging v4l-dvb/master (fef24ea1b8c1 Merge branch 'topic/media-controller' into to_next)
Merging kbuild/for-next (9ab3e1d71e55 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (44858e07ff87 Merge branch 'for-4.5' into for-next)
Merging pm/linux-next (43576081fbb1 Merge branch 'pm-core' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (efa2498bb842 Merge branches 'thermal-core', 'thermal-soc' and 'thermal-intel' into next)
Merging thermal-soc/next (ce0265dd6f8e thermal: trip_point_temp_store() calls thermal_zone_device_update())
CONFLICT (content): Merge conflict in drivers/thermal/thermal_core.c
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (45f29dde4d57 Merge branch 'fixes' into next)
Merging net-next/master (725da8dee445 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
Merging wireless-drivers-next/master (42e0ed0d454c brcmfmac: Do not handle link downs for ibss.)
Merging bluetooth/master (8e69d71996e4 Bluetooth: add LED trigger for indicating HCI is powered up)
Merging mac80211-next/master (6f6239808cdf mac80211_hwsim: remove shadowing variable)
Merging rdma/for-next (59caaed7a72a IB/iser: Support the remote invalidation exception)
CONFLICT (content): Merge conflict in include/linux/mlx5/vport.h
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
CONFLICT (content): Merge conflict in include/linux/mlx5/device.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/vport.c
Applying: fixup! Merge remote-tracking branch 'gerrit/ib-next' into HEAD
Applying: IB/mlx5: merge fix for mlx5_ib_port_link_layer API change
Merging mtd/master (9146cbd52b11 mtd: jz4780_nand: replace if/else blocks with switch/case)
Merging l2-mtd/master (9146cbd52b11 mtd: jz4780_nand: replace if/else blocks with switch/case)
Merging crypto/master (48d627648141 crypto: hifn_795x, picoxcell - use ablkcipher_request_cast)
Merging drm/drm-next (e9c5e7402dad drm/amdgpu: add missing irq.h include)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (48ea1e32c39d drm/i915/gen9: Set PIN_ZONE_4G end to 4GB - 1 page)
Merging drm-tegra/drm/tegra/for-next (ad906599c191 drm/tegra: Advertise DRIVER_ATOMIC)
Merging drm-misc/topic/drm-misc (d122cbf1a310 drm/sysfs: use kobj_to_dev())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (40eb4e27aa20 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (5645e785cea2 drm/vc4: fix an error code)
Merging sound/for-next (af368027a49a ALSA: timer: Fix race among timer ioctls)
Merging sound-asoc/for-next (108915e8535a Merge tag 'asoc-v4.4-rc8' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (809d9516da73 Input: gpio-keys - allow disabling individual buttons in DT)
Merging block/for-next (bb1192dd3fad Merge branch 'for-4.5/drivers' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Applying: nvme: merge fix up for ns code movement
Merging device-mapper/for-next (385277bfb57f dm snapshot: fix hung bios when copy error occurs)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (d50f42384dbf mmc: tmio_mmc_dma: don't print invalid DMA cookie)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (1501efadc524 md/raid: only permit hot-add of compatible integrity profiles)
Merging mfd/for-mfd-next (9fb41166076b mfd: davinci_voicecodec: Remove pointless 'out of memory' error message)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (265b60497a57 power: bq27xxx_battery: Fix bq27541 AveragePower register address)
Merging omap_dss2/for-next (caf05780f6ed Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (d3bd4e0a5fd4 Merge remote-tracking branch 'regulator/topic/wm831x' into regulator-next)
Merging security/next (607259e17b37 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into ra-next)
Merging integrity/next (1d6d167c2efc KEYS: refcount bug fix)
Merging selinux/next (76319946f321 selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (ac36856fe432 watchdog: asm9260: remove __init and __exit annotations)
Merging iommu/next (dabc4de14132 Merge branches 'iommu/fixes', 's390', 'arm/renesas', 'arm/msm', 'arm/shmobile', 'arm/smmu', 'x86/amd' and 'x86/vt-d' into next)
Merging dwmw2-iommu/master (fda3bec12d09 iommu/vt-d: Fix 64-bit accesses to 32-bit DMAR_GSTS_REG)
Merging vfio/next (d4f50ee2f5b4 vfio/iommu_type1: make use of info.flags)
Merging jc_docs/docs-next (ec3fc58b1e7a thermal: add description for integral_cutoff unit)
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (09eccd1da92b audit: always enable syscall auditing when supported and audit is enabled)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (183223770ae8 drivers/of: Export OF changeset functions)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (cabeea980879 Merge remote-tracking branches 'spi/topic/sun4i', 'spi/topic/topcliff-pch' and 'spi/topic/zynq' into spi-next)
Merging tip/auto-latest (5852b88267ad Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (1cac5503fbf7 EDAC, i5100: Use to_delayed_work())
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b7522056ec1a ftrace: Remove unused nr_trampolines var)
Merging rcu/rcu/next (984cf355aeaa sysrq: Fix warning in sysrq generated crash.)
Merging kvm/linux-next (45bdbcfdf241 kvm: x86: Fix vmwrite to SECONDARY_VM_EXEC_CONTROL)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b4d7f161feb3 KVM: PPC: Fix ONE_REG AltiVec support)
Merging kvms390/next (c6e5f166373a KVM: s390: implement the RI support of guest)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (6201171e3b2c workqueue: simplify the apply_workqueue_attrs_locked())
Merging drivers-x86/for-next (41c48274014c thinkpad_acpi: Add support for keyboard backlight)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-wmi.c
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (6cb07abcc318 Merge remote-tracking branches 'regmap/topic/mmio', 'regmap/topic/rbtree' and 'regmap/topic/seq' into regmap-next)
Merging hsi/for-next (525e1abc6b5a HSI: omap_ssi_port: fix handling of_get_named_gpio result)
Merging leds/for-next (522f17e1214c leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358)
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (afd2ff9b7e1b Linux 4.4)
Merging tty/tty-next (041497eb721d drivers/tty/serial: delete unused MODULE_DEVICE_TABLE from atmel_serial.c)
Merging usb/usb-next (60d77b3d2229 MAINTAINERS: change my email address)
Merging usb-gadget/next (5072cfc40a80 usb: dwc3: of-simple: fix build warning on !PM)
Merging usb-serial/usb-next (6ff9d2761b86 USB: mxu11x0: drop redundant function name from error messages)
Merging usb-chipidea-next/ci-for-usb-next (d0c40d9fda12 usb: chipidea: debug: use list_for_each_entry)
Merging staging/staging-next (841e3ed977e0 Revert "arm64: dts: Add dts files to enable ION on Hi6220 SoC.")
Merging char-misc/char-misc-next (ed6dc538e5a3 mei: fix fasync return value on error)
Merging extcon/extcon-next (f78bf950aec3 extcon: arizona: Use DAPM mutex helper functions)
Merging cgroup/for-next (36ae3fad335f Merge branch 'for-4.5' into for-next)
Merging scsi/for-next (4d45033f31a0 Merge branch 'misc' into for-next)
Merging target-updates/for-next (4c1a6448e1ee target: Obtain se_node_acl->acl_kref during get_initiator_node_acl)
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/isert/ib_isert.c
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (14da0a91bf4a pinctrl: mediatek: Modify pinctrl bindings for mt2701)
Merging vhost/linux-next (43e361f23c49 checkpatch: add virt barriers)
CONFLICT (content): Merge conflict in include/asm-generic/barrier.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/ia64/include/asm/barrier.h
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (c474e348778b gpio: generic: make bgpio_pdata always visible)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (074726402b82 pwm: omap-dmtimer: Potential NULL dereference on error)
Merging dma-buf/for-next (168309855a7d Linux 4.4-rc8)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (b360ada3f153 Merge tag 'tegra-for-4.5-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (514c11dabdf2 aio: fix a compiler warning on 32 bit architectures in aio_renameat())
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (1b1fe542b6f0 selftests: firmware: add empty string and async tests)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (8735f8e16a70 selftests/x86: Add tests for UC_SIGCONTEXT_SS and UC_STRICT_RESTORE_SS)
CONFLICT (content): Merge conflict in tools/testing/selftests/x86/Makefile
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (b23d8dc4ecdf coresight: Fix a typo in Kconfig)
Merging rtc/rtc-next (079062b28fb4 rtc: cmos: prevent kernel warning on IRQ flags mismatch)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (8b63b6bfc1a5 Merge branch 'for-4.5/block-dax' into for-4.5/libnvdimm)
Merging akpm-current/current (35a645a836d8 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in scripts/tags.sh
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_ipv4.c
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/memblock.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in drivers/nvdimm/pmem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/omapdrm/omap_gem.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_64.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/nohash/64/pgtable.h
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in Makefile
Applying: merge fix for "powerpc, thp: remove infrastructure for handling splitting PMDs"
Applying: mm, dax, gpu: merge fix for convert vm_insert_mixed to pfn_t
Applying: mm, dax: convert vmf_insert_pfn_pmd() to pfn_t fix
Applying: fix up for bad merge of arch/powerpc/include/asm/pgtable-ppc64.h: add pmd_[dirty|mkclean] for THP
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs/overlayfs/super.c needs pagemap.h
Applying: fs/adfs/adfs.h: tidy up comments
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: dma-mapping: make the generic coherent dma mmap implementation optional
Applying: arc: convert to dma_map_ops
Applying: arc: dma mapping fixes
Applying: ARC: dma mapping fixes #2
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
Applying: net-drop-tcp_memcontrolc-fix
Applying: mm: memcontrol: rein in the CONFIG space madness
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix-fix
Applying: mm: memcontrol: flatten struct cg_proto
Applying: mm: memcontrol: clean up alloc, online, offline, free functions
Applying: mm: memcontrol: clean up alloc, online, offline, free functions fix
Applying: memcg: fix SLOB build regression
Applying: mm: memcontrol: charge swap to cgroup2
Applying: mm: vmscan: pass memcg to get_scan_count()
Applying: mm: memcontrol: replace mem_cgroup_lruvec_online with mem_cgroup_online
Applying: swap.h: move memcg related stuff to the end of the file
Applying: mm: vmscan: do not scan anon pages if memcg swap limit is hit
Applying: mm: free swap cache aggressively if memcg swap is full
Applying: Documentation: cgroup: add memory.swap.{current,max} description
Applying: MAINTAINERS: add git URL for APM driver
Applying: MAINTAINERS: add git URL for at91
Applying: MAINTAINERS: add git URL for Rockchip
Applying: MAINTAINERS: add git URL for ARM64
Applying: MAINTAINERS: update git URL for ath6kl
Applying: MAINTAINERS: add git URL for backlight
Applying: MAINTAINERS: add git URL for chrome
Applying: MAINTAINERS: add git URL for cris
Applying: MAINTAINERS: add git URL for cryptodev
Applying: MAINTAINERS: add git URL for devfreq
Applying: MAINTAINERS: update git URL for DLM
Applying: MAINTAINERS: add git URL for eCryptfs
Applying: MAINTAINERS: add git URL for ext4
Applying: MAINTAINERS: add git URL for hwspinlock
Applying: MAINTAINERS: add git URL for integrity
Applying: MAINTAINERS: add git URL for IPVS
Applying: MAINTAINERS: add git URL for nfsd
Applying: MAINTAINERS: add git URL for KVM/s390
Applying: MAINTAINERS: add git URL for kgdb
Applying: MAINTAINERS: add git URL for nvdimm
Applying: MAINTAINERS: add git URL for metag
Applying: MAINTAINERS: add git URL for wireless drivers
Applying: MAINTAINERS: add git URL for devicetree
Applying: MAINTAINERS: update git URL for PCMCIA
Applying: MAINTAINERS: update git URL for pstore
Applying: MAINTAINERS: update git URL for ath10k
Applying: MAINTAINERS: add git URL for hexagon
Applying: MAINTAINERS: add git URL for reset
Applying: MAINTAINERS: add git URL for s390
Applying: MAINTAINERS: fix tree format for SAMSUNG thermal
Applying: MAINTAINERS: add git URL for md
Applying: MAINTAINERS: add git URL for squashfs
Applying: MAINTAINERS: add git URL for swiotlb
Applying: MAINTAINERS: add git URL for xtensa
Applying: MAINTAINERS: fix tree format for TPM
Applying: MAINTAINERS: add git URL for UML
Applying: MAINTAINERS: add git URL for VFIO
Applying: MAINTAINERS: add git URL for vhost
Applying: MAINTAINERS: update git URL for XFS
Applying: MAINTAINERS: fix MIC maintainers entry
Applying: dax: fix NULL pointer dereference in __dax_dbg()
Applying: dax: fix conversion of holes to PMDs
Applying: pmem: add wb_cache_pmem() to the PMEM API
Applying: pmem-add-wb_cache_pmem-to-the-pmem-api-v6
Applying: dax: support dirty DAX entries in radix tree
Applying: dax-support-dirty-dax-entries-in-radix-tree-v6
Applying: mm: add find_get_entries_tag()
Applying: dax: add support for fsync/sync
Applying: dax-add-support-for-fsync-sync-v6
Applying: dax: fix dax_pmd_dbg build warning
Applying: dax: add support for fsync/msync
Applying: dax-add-support-for-fsync-msync-v8
Applying: ext2: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: ext4: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: xfs: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: tree wide: use kvfree() than conditional kfree()/vfree()
Merging akpm/master (ae4205f02141 tree wide: use kvfree() than conditional kfree()/vfree())
