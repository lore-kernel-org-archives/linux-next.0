From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 28
Date: Fri, 28 Aug 2015 18:27:12 +1000
Message-ID: <20150828182712.3d45a033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57046 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989AbbH1I1P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Aug 2015 04:27:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150827:

The rdma tree gained a conflict aaginst the net-next tree.

The sound-asoc tree gained a build failure for which I reverted a commit.

The mmc-uh tree lost its build failure.

The tty tree still had its build failure for which I reverted part of
a commit.

The nvdimm tree gained conflicts against Linus' and the v4l-dvb trees.

Non-merge commits (relative to Linus' tree): 10211
 8743 files changed, 533186 insertions(+), 210999 deletions(-)

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

I am currently merging 225 trees (counting Linus' and 33 trees of patches
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
Merging origin/master (95803812cfb3 Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (3939f3345050 ARM: 8418/1: add boot image dependencies to not generate invalid images)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (4d9aac397a5d powerpc/PCI: Disable MSI/MSI-X interrupts at PCI probe time in OF case)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (ce7b4ccc4f62 sctp: asconf's process should verify address parameter is in the beginning)
Merging ipsec/master (158cd4af8ded packet: missing dev_put() in packet_do_bind())
Merging sound-current/for-linus (c7cd0ef66aad ALSA: hda - Fix path power activation)
Merging pci-current/for-linus (45ea2a5fed6d PCI: Don't use 64-bit bus addresses on PA-RISC)
Merging wireless-drivers/master (741e3b9902d1 rtlwifi: rtl8723be: Add module parameter for MSI interrupts)
Merging driver-core.current/driver-core-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging tty.current/tty-linus (cbfe8fa6cd67 Linux 4.2-rc4)
Merging usb.current/usb-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging usb-gadget-fixes/fixes (c93e64e91248 usb: udc: core: add device_del() call to error pathway)
Merging usb-serial-fixes/usb-linus (d071a3cdd2e1 USB: qcserial: add HP lt4111 LTE/EV-DO/HSPA+ Gobi 4G Module)
Merging staging.current/staging-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging char-misc.current/char-misc-linus (f7644cbfcdf0 Linux 4.2-rc6)
Merging input-current/for-linus (e51e38494a8e Input: synaptics - fix handling of disabling gesture mode)
Merging crypto-current/master (b310c178e6d8 crypto: caam - fix memory corruption in ahash_final_ctx)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (fee50f3c8427 selftests/futex: Fix futex_cmp_requeue_pi() error handling)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (fb9caeedafe6 mfd: Remove MFD_CROS_EC_SPI depends on OF)
Merging drm-intel-fixes/for-linux-next-fixes (c13dcf9f2d6f Linux 4.2-rc8)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (3d5926599a6b ARCv2: entry: Fix reserved handler)
Merging arm/for-next (0986c811d54f Merge branch 'drm-dwhdmi-devel' into for-next)
CONFLICT (content): Merge conflict in arch/arm/include/asm/Kbuild
Merging arm-perf/for-next/perf (fa8ad7889d83 arm: perf: factor arm_pmu core out to drivers)
Merging arm-soc/for-next (38af586237cf arm-soc: document merges)
CONFLICT (modify/delete): drivers/cpufreq/exynos-cpufreq.c deleted in arm-soc/for-next and modified in HEAD. Version HEAD of drivers/cpufreq/exynos-cpufreq.c left in tree.
CONFLICT (modify/delete): arch/arm/kernel/psci.c deleted in HEAD and modified in arm-soc/for-next. Version arm-soc/for-next of arch/arm/kernel/psci.c left in tree.
$ git rm -f arch/arm/kernel/psci.c drivers/cpufreq/exynos-cpufreq.c
Applying: ARM: fix for PSCI code movement
Merging at91/at91-next (253ebd4df402 Merge branch 'at91-4.3-defconfig' into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/sama5.c
CONFLICT (content): Merge conflict in arch/arm/configs/at91_dt_defconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-M)
Merging imx-mxs/for-next (c746ef1b64e9 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2l.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2hk.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2e.dtsi
Merging mvebu/for-next (adfc8c76d84a Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (b2a882022a1e Merge branch 'omap-for-v4.3/dt-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (4ae93a64be4f soc: qcom: smem: Fix errant private access)
Merging renesas/next (078e7cdb7497 Merge branch 'heads/fixes-for-v4.3' into next)
Merging rockchip/for-next (ed0450118b2f Merge branch 'v4.3-armsoc/soc' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (112129267f1a Merge branch 'v4.3-next/dt64-samsung' into for-next)
Merging samsung-krzk/for-next (002528669469 Merge branch 'defconfig-for-next' into for-next)
Merging sunxi/sunxi/for-next (9d73c13a139c Merge branches 'sunxi/dt-for-4.3' and 'sunxi/defconfig-for-4.3' into sunxi/for-next)
Merging tegra/for-next (bea5a17a8beb Merge branch for-4.3/defconfig into for-next)
Merging arm64/for-next/core (674c242c9323 arm64: flush FP/SIMD state correctly after execve())
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-modular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (15978bfde3bb hexagon/time: Migrate to new 'set-state' interface)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1ecb40643a9a m68k/bootinfo: Use kmemdup rather than duplicating its implementation)
Merging m68knommu/for-next (50e48bd06731 m68k/coldfire: use PFN_DOWN macro)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (bb88ba0946dd elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (8e5f2cf82761 MIPS: math-emu: Remove unused handle_dsemul function declaration)
Merging nios2/for-next (81c9517e7ab4 nios2/time: Migrate to new 'set-state' interface)
Merging parisc-hd/for-next (0c0f80b3f908 parisc: Define ioremap_uc and ioremap_wc)
Merging powerpc/next (96983515657b Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (e4ec73510812 s390/jump_label: Use %*ph to print small buffers)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (8d03bc56cc27 tile: correct some typos in opcode type names)
CONFLICT (content): Merge conflict in include/uapi/linux/elf-em.h
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
CONFLICT (content): Merge conflict in arch/xtensa/include/asm/atomic.h
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the zero page)
Merging cifs/for-next (5fb4e288a025 cifs: Fix use-after-free on mid_q_entry)
Merging ecryptfs/next (0dad87fcb732 eCryptfs: Delete a check before the function call "key_put")
Merging ext3/for_next (9181f8bf5abf udf: Don't modify filesystem for read-only mounts)
Merging ext4/dev (bdfe0cbd746a Revert "ext4: remove block_device_ejected")
Merging f2fs/dev (19b2c30d3cce f2fs: update extent tree in batches)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (ea79f0ec7a38 GFS2: Make ht_parms static)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (1090c3bf81ef nfs42: remove unused declaration)
Merging nfsd/nfsd-next (a8bd5e23a345 nfsd: Add Jeff Layton as co-maintainer)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (b5ac1fb2717e 9p: fix return code of read() when count is 0)
Merging ubifs/linux-next (071a1f837f72 UGIFS: fix a typo in comment of ubifs_budget_req)
Merging xfs/for-next (70b33a7466ba Merge branch 'xfs-misc-fixes-for-4.3-3' into for-next)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (9af7b9b7eaaf Merge branches 'pci/enumeration' and 'pci/misc' into next)
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-iproc.c
CONFLICT (content): Merge conflict in drivers/pci/host/Kconfig
Merging hid/for-next (8e433b666751 Merge branch 'for-4.3/upstream' into for-next)
Merging i2c/i2c/for-next (31bb26d67b48 Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (1ed32160dba6 hwmon: (fam15h_power) Add ratio of Tsample to the PTSC period)
Merging v4l-dvb/master (cb72d295ed59 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (afa50c336d92 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (82908d67958c Merge branch 'for-4.2-fixes' into for-next)
Merging pm/linux-next (a5063b85e788 Merge branch 'acpi-pci' into linux-next)
Merging idle/next (aba5686671dc Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (6ce87b2a60f1 Merge branches 'for-rc' and 'release' of .git into next)
Merging thermal-soc/next (1afb9c539dae thermal/cpu_cooling: update policy limits if clipped_freq < policy->max)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (9dd4efc41d09 Merge branch 'for-linus' into next)
CONFLICT (content): Merge conflict in drivers/dma/Makefile
CONFLICT (content): Merge conflict in drivers/dma/Kconfig
Merging net-next/master (69dba9bbc506 sock: fix kernel doc error)
Merging ipsec-next/master (e69948a0a530 net: Document xfrm4_gc_thresh and xfrm6_gc_thresh)
Merging wireless-drivers-next/master (0ba3ac03c1f3 Merge ath-next from ath.git)
Merging bluetooth/master (d3ea6a7190f3 Bluetooth: hci_intel: Add support for platform driver)
Merging rdma/for-next (153b7306b7c6 Merge branch 'hfi1-v4' into to-be-rebased/for-4.3)
CONFLICT (content): Merge conflict in net/core/dev.c
Applying: net: merge change upper notifier changes
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict)
Merging l2-mtd/master (cc7fce802290 mtd: blkdevs: fix switch-bool compilation warning)
Merging crypto/master (bf433416e675 crypto: algif_aead - fix for multiple operations on AF_ALG sockets)
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
Merging drm/drm-next (d7b273685fed Merge branch 'drm-dwhdmi-devel' of git://ftp.arm.linux.org.uk/~rmk/linux-arm into drm-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (7616d2410010 drm/i915: Set the map-and-fenceable flag for preallocated objects)
Merging drm-tegra/drm/tegra/for-next (459cc2c6800b drm/tegra: sor: Add HDMI support)
Merging drm-misc/topic/drm-misc (301eb794baef drm/atomic: refuse changing CRTC for planes directly)
Merging drm-exynos/exynos-drm/for-next (1b647a166f07 Merge tag 'dmaengine-fix-4.2-rc8' of git://git.infradead.org/users/vkoul/slave-dma)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (0662292aec05 ALSA: usb-audio: Handle normal and auto-suspend equally)
Merging sound-asoc/for-next (999b3fa781af Merge remote-tracking branch 'asoc/topic/xtensa' into asoc-next)
$ git am -3 ../patches/0001-Revert-ASoC-ics43432-Add-codec-driver-for-InvenSense.patch
Applying: Revert "ASoC: ics43432: Add codec driver for InvenSense ICS-43432"
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (66bc2f51ef7d Input: psmouse - add small delay for IBM trackpoint pass-through mode)
Merging block/for-next (721cb0165e64 Merge branch 'for-4.3/drivers' into for-next)
CONFLICT (content): Merge conflict in fs/fs-writeback.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in fs/btrfs/volumes.c
CONFLICT (content): Merge conflict in fs/btrfs/scrub.c
CONFLICT (content): Merge conflict in fs/btrfs/raid56.c
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in crypto/ccm.c
CONFLICT (content): Merge conflict in block/bounce.c
Applying: block: lustre: temporary fix for bio_endio API change
Merging device-mapper/for-next (bd49784fd1e8 dm stats: report precise_timestamps and histogram in @stats_list output)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (987e05c9c3fb mmc: host: omap_hsmmc: remove CONFIG_REGULATOR check)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (8f4a806e5c12 md-cluster: remove inappropriate try_module_get from join())
CONFLICT (content): Merge conflict in drivers/md/raid5.c
CONFLICT (content): Merge conflict in drivers/md/raid0.c
Merging mfd/for-mfd-next (5a688c455066 mfd: jz4740-adc: Init mask cache in generic IRQ chip)
CONFLICT (content): Merge conflict in drivers/mfd/Kconfig
Merging backlight/for-backlight-next (13d20b3b618a backlight: tosa: Export I2C module alias information)
Merging battery/master (b68c3161430a bq2415x_charger: Allow to load and use driver even if notify device is not registered yet)
Merging omap_dss2/for-next (b06ece93cf96 video: fbdev: s3c-fb: Constify platform_device_id)
Merging regulator/for-next (2795987874ec Merge remote-tracking branches 'regulator/topic/stub', 'regulator/topic/tol' and 'regulator/topic/tps6586x' into regulator-next)
Merging security/next (3f1d44ae6401 Documentation/Changes: Now need OpenSSL devel packages for module signing)
CONFLICT (content): Merge conflict in security/yama/yama_lsm.c
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (c13dcf9f2d6f Linux 4.2-rc8)
Merging iommu/next (4d400e71a1ee Merge branches 'arm/omap', 'arm/msm', 'arm/smmu', 'arm/tegra', 'x86/vt-d', 'x86/amd', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (0fe0965e63c8 Documentation/x86: Rename IRQSTACKSIZE to IRQ_STACK_SIZE)
Merging trivial/for-next (e5f6450c3f40 MAINTAINERS: update my e-mail address)
CONFLICT (modify/delete): drivers/regulator/max77843.c deleted in HEAD and modified in trivial/for-next. Version trivial/for-next of drivers/regulator/max77843.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/v4l2-core/videobuf2-memops.c
$ git rm -f drivers/regulator/max77843.c
Merging audit/next (15ce414b82b0 fixup: audit: implement audit by executable)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (126b16e2ad98 Docs: dt: add generic MSI bindings)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (9b0a1ebd079f Merge remote-tracking branch 'spi/topic/xcomm' into spi-next)
Merging tip/auto-latest (9cc8370f6130 Merge branch 'x86/platform')
CONFLICT (content): Merge conflict in arch/s390/lib/uaccess.c
CONFLICT (content): Merge conflict in arch/mips/include/asm/switch_to.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-r8a7779.c
CONFLICT (modify/delete): arch/arm/mach-shmobile/intc-sh73a0.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/arm/mach-shmobile/intc-sh73a0.c left in tree.
$ git rm -f arch/arm/mach-shmobile/intc-sh73a0.c
Merging clockevents/clockevents/next (2b5cf544934f cris/time: Migrate to new 'set-state' interface)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP and -EX)
Merging edac-amd/for-next (99e1dfb7d209 EDAC, mce_amd: Don't emit 'CE' for Deferred error)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring buffer benchmark immediately)
Merging rcu/rcu/next (95f2435b1f83 rcu: Change _wait_rcu_gp() to work around gcc 67055 bug)
Merging kvm/linux-next (4d283ec908e6 x86/kvm: Rename VMX's segment access rights defines)
Merging kvm-arm/next (054167b3d551 arm: KVM: keep arm vfp/simd exit handling consistent with arm64)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_hv.c
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (0ac7a1841284 xen/xenbus: Rename the variable xen_store_mfn to xen_store_gfn)
CONFLICT (content): Merge conflict in arch/x86/xen/enlighten.c
Merging percpu/for-next (292c24a073ee percpu: clean up of schunk->map[] assignment in pcpu_setup_first_chunk)
Merging workqueues/for-next (355c06633e23 workqueue: fix some docbook warnings)
Merging drivers-x86/for-next (fc0bfacd045a hp-wireless: remove unneeded goto/label in hpwl_init)
Merging chrome-platform/for-next (1d95e6f10fd8 platform/chrome: cros_ec: Fix possible leak in led_rgb_store())
Merging regmap/for-next (579657f2e1ed Merge remote-tracking branches 'regmap/topic/lockdep', 'regmap/topic/raw' and 'regmap/topic/seq-delay' into regmap-next)
Applying: mfd: Fixup clients of multi_reg_write/register_patch
Merging hsi/for-next (d770e558e219 Linux 4.2-rc1)
Merging leds/for-next (5f414dd632fd leds: Export OF module alias information in missing drivers)
Merging ipmi/for-next (43ad3e6dcf35 ipmi:ssif: Add a module parm to specify that SMBus alerts don't work)
Merging driver-core/driver-core-next (71db87ba5700 bus: subsys: update return type of ->remove_dev() to void)
CONFLICT (content): Merge conflict in drivers/cpufreq/cpufreq.c
Merging tty/tty-next (c868cbb7e5c6 serial: imx: save and restore context in the suspend path)
Applying: serial: imx: partial revert of "introduce serial_imx_enable_wakeup()"
Merging usb/usb-next (44840dec6127 USB: qcserial: add HP lt4111 LTE/EV-DO/HSPA+ Gobi 4G Module)
Merging usb-gadget/next (2f3cc24f07b8 usb: musb: gadget: fix build break by adding missing 'break')
Merging usb-serial/usb-next (26c78daade0f USB: io_ti: Add heartbeat to keep idle EP/416 ports from disconnecting)
Merging staging/staging-next (415bcb5c6eff staging/lustre/o2iblnd: remove references to ib_reg_phsy_mr())
CONFLICT (modify/delete): drivers/staging/ozwpan/ozproto.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/ozwpan/ozproto.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
$ git rm -f drivers/staging/ozwpan/ozproto.c
Applying: staging/lustre: fix for bio_endio() API change
Merging char-misc/char-misc-next (672cfeeb93e5 Merge tag 'extcon-next-for-4.3' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-testing)
CONFLICT (content): Merge conflict in drivers/misc/ti-st/st_kim.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/mshyperv.c
Applying: Drivers: hv: vmbus: fix for the removal of rdtscll()
Merging extcon/extcon-next (ac22a1d3386e extcon: palmas: Fix build break due to devm_gpiod_get_optional API change)
Merging kdbus/kdbus (a36324913ff2 kdbus: selftests: add more name registry tests)
Merging cgroup/for-next (eacb1e7d4bfa Merge branch 'for-4.3' into for-next)
Merging scsi/for-next (294eb0a61964 Merge branch 'misc' into for-next)
Merging target-updates/for-next (140373b074ba target/qla2xxx: Honor max_data_sg_nents I/O transfer limit)
CONFLICT (content): Merge conflict in include/scsi/scsi_eh.h
CONFLICT (content): Merge conflict in drivers/scsi/scsi_error.c
CONFLICT (content): Merge conflict in drivers/ata/libata-scsi.c
Merging target-merge/for-next-merge (d770e558e219 Linux 4.2-rc1)
Merging pinctrl/for-next (3ab897d2113c Merge branch 'devel' into for-next)
Merging vhost/linux-next (0c63b715912b PCI/MSI: Make pci_msi_shutdown(), pci_msix_shutdown() static)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (929550b9f9f8 gpio: mxc: fix section mismatch warning)
Applying: tc358743: fix for devm_gpiod_get API change
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (01ec8472009c pwm-pca9685: Support changing the output frequency)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (ba3001157733 clk: s5pv210: add missing call to samsung_clk_of_add_provider())
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
CONFLICT (content): Merge conflict in drivers/clk/ti/Makefile
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeout=0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (9fae100cbd10 selftests: breakpoints: fix installing error on the architecture except x86)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (395855d956ed coresight: Fix implicit inclusion of linux/sched.h)
Merging rtc/rtc-next (c53d791e8e50 rtc: omap: Add external clock enabling support)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am437x-gp-evm.dts
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f96d05f6b198 libnvdimm, pmem: direct map legacy pmem by default)
CONFLICT (content): Merge conflict in mm/Kconfig
CONFLICT (content): Merge conflict in drivers/acpi/nfit.c
Merging akpm-current/current (0931fbddc5f2 lib: scatterlist: add sg splitting function)
CONFLICT (content): Merge conflict in mm/early_ioremap.c
CONFLICT (content): Merge conflict in mm/Makefile
CONFLICT (content): Merge conflict in mm/Kconfig
CONFLICT (content): Merge conflict in kernel/cgroup.c
CONFLICT (content): Merge conflict in include/linux/kexec.h
CONFLICT (modify/delete): fs/ext3/super.c deleted in HEAD and modified in akpm-current/current. Version akpm-current/current of fs/ext3/super.c left in tree.
CONFLICT (content): Merge conflict in drivers/video/console/Kconfig
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
$ git rm -f fs/ext3/super.c
Applying: userfaultfd: selftest: update userfaultfd x86 32bit syscall number
$ git checkout -b akpm remotes/origin/akpm/master
Applying: namei: fix warning while make xmldocs caused by namei.c
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix
Applying: fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-to-void-fix-fix
Applying: mm: mark most vm_operations_struct const
Applying: mm, mpx: add "vm_flags_t vm_flags" arg to do_mmap_pgoff()
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix
Applying: mm-mpx-add-vm_flags_t-vm_flags-arg-to-do_mmap_pgoff-fix-checkpatch-fixes
Applying: mm: make sure all file VMAs have ->vm_ops set
Applying: mm: use vma_is_anonymous() in create_huge_pmd() and wp_huge_pmd()
Applying: mm, madvise: use vma_is_anonymous() to check for anon VMA
Applying: sys_membarrier(): system-wide memory barrier (generic, x86)
Applying: selftests: add membarrier syscall test
Applying: selftests: enhance membarrier syscall test
Applying: dma-mapping: consolidate dma_{alloc,free}_{attrs,coherent}
Applying: dma-mapping: consolidate dma_{alloc,free}_noncoherent
Applying: dma-mapping: cosolidate dma_mapping_error
Applying: dma-mapping: consolidate dma_supported
Applying: dma-mapping: consolidate dma_set_mask
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (e212aa6d8f14 drivers/w1/w1_int.c: call put_device if device_register fails)
