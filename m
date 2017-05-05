From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 5
Date: Fri, 5 May 2017 14:22:57 +1000
Message-ID: <20170505142257.46fb09a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750812AbdEEEXB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 May 2017 00:23:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Please do not add any v4.13 destined material in your linux-next
included branches until after v4.12-rc1 has been released.

Changes since 20170504:

The rdma tree gained a conflict against the pci tree.

The spi-nor tree lost its build failure.

Non-merge commits (relative to Linus' tree): 5017
 5511 files changed, 511077 insertions(+), 81899 deletions(-)

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
and pseries_le_defconfig and i386, sparc and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 258 trees (counting Linus' and 37 trees of bug
fix patches pending for the current merge release).

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
Merging origin/master (4ac4d584886a Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (9be3213b14d4 gconfig: remove misleading parentheses around a condition)
Merging arc-current/for-curr (65c02a556bc4 ARCv2: ptrace: provide regset for accumulator/r30 regs)
Merging arm-current/fixes (6d8059493691 ARM: 8670/1: V7M: Do not corrupt vector table around v7m_invalidate_l1 call)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (be5c5e843c4a powerpc/64: Fix HMI exception on LE with CONFIG_RELOCATABLE=y)
Merging sparc/master (8c64415cc1f5 sparc: Remove redundant tests in boot_flags_init().)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (842be75c77cb cfg80211: make RATE_INFO_BW_20 the default)
Merging ipsec/master (9b3eb54106cf xfrm: fix stack access out of bounds with CONFIG_XFRM_SUB_POLICY)
Merging netfilter/master (f411af682218 Merge branch 'ibmvnic-Updated-reset-handler-andcode-fixes')
Merging ipvs/master (c8d6c6b496dc ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (842be75c77cb cfg80211: make RATE_INFO_BW_20 the default)
Merging sound-current/for-linus (a5c3b32a1146 Merge tag 'asoc-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (b9c1153f7a9c PCI: hisi: Fix DT binding (hisi-pcie-almost-ecam))
Merging driver-core.current/driver-core-linus (39da7c509acf Linux 4.11-rc6)
Merging tty.current/tty-linus (4f7d029b9bf0 Linux 4.11-rc7)
Merging usb.current/usb-linus (a71c9a1c779f Linux 4.11-rc5)
Merging usb-gadget-fixes/fixes (25cd9721c2b1 usb: gadget: f_hid: fix: Don't access hidg->req without spinlock held)
Merging usb-serial-fixes/usb-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (1a09b6a7c10e phy: qcom-usb-hs: Add depends on EXTCON)
Merging staging.current/staging-linus (39da7c509acf Linux 4.11-rc6)
Merging char-misc.current/char-misc-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging input-current/for-linus (0337966d121e Merge branch 'next' into for-linus)
Merging crypto-current/master (929562b14478 crypto: stm32 - Fix OF module alias information)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (a351e9b9fc24 Linux 4.11)
Merging drm-misc-fixes/for-linux-next-fixes (0c45b36f8acc drm/udl: Fix unaligned memory access in udl_render_hline)
Merging kbuild/for-next (11d5300b0fc9 Merge branch 'kbuild' into for-next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
CONFLICT (content): Merge conflict in include/linux/crypto.h
CONFLICT (content): Merge conflict in arch/s390/include/uapi/asm/Kbuild
CONFLICT (modify/delete): arch/avr32/include/uapi/asm/Kbuild deleted in HEAD and modified in kbuild/for-next. Version kbuild/for-next of arch/avr32/include/uapi/asm/Kbuild left in tree.
$ git rm -f arch/avr32/include/uapi/asm/Kbuild
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (c92a90a5060a Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f00fa5f4163b arm64: pmuv3: use arm_pmu ACPI framework)
Merging arm-soc/for-next (e1cf8cbc408c arm-soc: document merges)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stm32746g-eval.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3188.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r7s72100.dtsi
Applying: tee: merge fix for dma-ops field name changes
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (715dcd206041 Merge branch 'v4.12/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (ce60fdaa7e9e Merge remote-tracking branch 'alex_korg/at91-dt' into at91-next)
Merging bcm2835/for-next (7ea6e490ba7f Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (990df0480610 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (4495c08e8472 Linux 4.11-rc2)
Merging mvebu/for-next (4cfb1f480e35 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (5a0bbcf7ab0f Merge branch 'omap-for-v4.12/defconfig' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (9f514b0f9cf3 Merge branch 'drivers-for-4.12' into all-for-4.12)
Merging renesas/next (c8906b237adf Merge branch 'fixes-for-v4.12' into next)
Merging rockchip/for-next (b1e842489772 Merge branch 'v4.12-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (226464bdf486 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (5675caea945d Merge branches 'sunxi/clk-for-4.12', 'sunxi/dt-for-4.12' and 'sunxi/fixes-for-4.11' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (8f9cc6d655a1 arm64: Fix the DMA mmap and get_sgtable API with DMA_ATTR_FORCE_CONTIGUOUS)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/bug.h
Merging clk/clk-next (0119dc6132d2 clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging m68knommu/for-next (99a2c395541f m68k/coldfire/pit: set ->min_delta_ticks and ->max_delta_ticks)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
CONFLICT (content): Merge conflict in arch/metag/include/asm/uaccess.h
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (b153c82756e9 Merge branch '4.11-fixes' into mips-for-linux-next)
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Merging nios2/for-next (d8f347ba35cf nios2: enable earlycon support)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (4f7d029b9bf0 Linux 4.11-rc7)
Merging powerpc/next (700b7eadd562 powerpc/64s: Power9 has no LPCR[VRMASD] field so don't set it)
CONFLICT (content): Merge conflict in kernel/kprobes.c
Merging fsl/next (726bd223105c powerpc/8xx: Adding support of IRQ in MPC8xx GPIO)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (db55947dd2d0 s390/uprobes: fix compile for !KPROBES)
Merging sparc-next/master (94836ecf1e73 Merge tag 'nfsd-4.11-2' of git://linux-nfs.org/~bfields/linux)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6fad04b7585d Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (953a8bf6cedd Merge branch 'for-next-next-v4.12-20170425' into for-next-20170425)
Merging ceph/master (eeca958dce0a ceph: fix memory leak in __ceph_setxattr())
Merging cifs/for-next (7db0a6efdc3e SMB3: Work around mount failure when using SMB3 dialect to Macs)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (07f7e3135e58 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (17f423b51607 jbd2: cleanup write flags handling from jbd2_write_superblock())
Merging f2fs/dev (e9cdd307704b f2fs: fix a mount fail for wrong next_scan_nid)
CONFLICT (content): Merge conflict in fs/f2fs/inline.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0b6e9ea041e6 fuse: Add support for pid namespaces)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (c296cfe26bdd pNFS: Fix NULL dereference in pnfs_generic_alloc_ds_commits)
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-parameters.txt
Merging nfsd/nfsd-next (ed6473ddc704 NFSv4: Fix callback server shutdown)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (4a99f3c83dc4 ovl: do not set overlay.opaque on non-dir create)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (32fe905c17f0 ubifs: Fix O_TMPFILE corner case in ubifs_link())
Merging xfs/for-next (8290b7502b7b xfs: fix use-after-free in xfs_finish_page_writeback)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (ef3296e0e82f Merge branch 'for-linus' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (cf39bf58afda printk: fix double printing with earlycon)
Merging pci/next (3146c8f4de9b Merge branch 'pci/remove' into next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
CONFLICT (content): Merge conflict in include/linux/pci.h
CONFLICT (content): Merge conflict in drivers/pci/msi.c
Merging pstore/for-next/pstore (3a7d2fd16c57 pstore: Solve lockdep warning by moving inode locks)
Merging hid/for-next (38c81b5434ac Merge branch 'for-4.11/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f49ee0593cde Merge branch 'i2c/for-4.12' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (6eaaea144dc5 hwmon: (pmbus) Add client driver for IR35221)
Merging jc_docs/docs-next (9bb0e9cb04c8 docs: Fix a couple typos)
Merging v4l-dvb/master (3622d3e77ece [media] ov2640: print error if devm_*_optional*() fails)
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_hdmi.c
Merging v4l-dvb-next/master (6d95b3f24881 Merge branch 'TTT' into to_next)
Merging fbdev/fbdev-for-next (5c9cfda13dc5 drivers/video/fbdev/omap/lcd_mipid.c: Use time comparison kernel macros)
Merging pm/linux-next (a061321a7e70 Merge branches 'acpi-pmic', 'powercap' and 'pm-cpuidle' into linux-next)
CONFLICT (content): Merge conflict in drivers/acpi/acpi_apd.c
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (f7b553c688c3 Merge branches 'for-rc' and 'thermal-core' into next)
Merging thermal-soc/next (19fd1783c24e Merge branch 'work-linus' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/Makefile
CONFLICT (content): Merge conflict in drivers/thermal/Kconfig
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (89c9fea3c803 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging ipsec-next/master (e892d2d40445 esp: Fix misplaced spin_unlock_bh.)
Merging netfilter-next/master (89c9fea3c803 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (47d272f0f988 Merge tag 'iwlwifi-next-for-kalle-2017-04-26' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (2da711ac3f6d Bluetooth: Skip vendor diagnostic configuration for HCI User Channel)
Merging mac80211-next/master (e3bf4c61da80 sparc64: Fix BPF JIT wrt. branches and ldimm64 instructions.)
Merging rdma/for-next (67cf3623e097 rxe: expose num_possible_cpus() cnum_comp_vectors)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/hfi1/hfi.h
Merging gfs2/for-next (d552a2b9b33e GFS2: Non-recursive delete)
Merging mtd/master (c1ae3cfa0e89 Linux 4.11-rc1)
Merging l2-mtd/master (6a623e076944 mtd: nand: add ooblayout for old hamming layout)
Merging nand/nand/next (9d2ee0a60b8b mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program)
Merging spi-nor/next (fd8dbf418bda mtd: spi-nor: stm32-quadspi: allow building with COMPILE_TEST)
Merging crypto/master (929562b14478 crypto: stm32 - Fix OF module alias information)
Merging drm/drm-next (8b03d1ed2c43 Merge branch 'linux-4.12' of git://github.com/skeggsb/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (88326ef05b26 drm/i915: Confirm the request is still active before adding it to the await)
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/drm.c
Merging drm-misc/for-linux-next (e345da82bd6b drm/edid: Add 10 bpc quirk for LGD 764 panel in HP zBook 17 G2)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (763656d30b3d drm: mali-dp: use div_u64 for expensive 64-bit divisions)
Merging sunxi-drm/sunxi-drm/for-next (2da042ac05e9 MAINTAINERS: Add sun4i-drm git repo)
Merging imx-drm/imx-drm/next (1465dc794b00 gpu: ipu-v3: prg: remove counter load enable)
Merging etnaviv/etnaviv/next (78ec187f64fa drm/etnaviv: submit support for out-fences)
Merging kspp/for-next/kspp (62111ab351b8 Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (a5c3b32a1146 Merge tag 'asoc-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc/for-next (20d5c84bef06 Merge remote-tracking branches 'asoc/topic/wm8960', 'asoc/topic/wm8978' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (175861882769 kallsyms: Use bounded strnchr() when parsing string)
Merging input/next (8a038b83e012 Input: ar1021_i2c - use BIT to check for a bit)
Merging block/for-next (4d1ee100af58 Merge branch 'for-4.12/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (7ab84db64f11 dm integrity: improve the Kconfig help text for DM_INTEGRITY)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (a627f025eb05 mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (3d05f3aed5d7 md/raid5: make use of spin_lock_irq over local_irq_disable + spin_lock)
Merging mfd/for-mfd-next (ab6241ae07c3 input: touchscreen: mxs-lradc: || vs && typos)
Merging backlight/for-backlight-next (e739c5bb20be backlight: Add support for Arctic Sand LED backlight driver chips)
Merging battery/for-next (35f4f99ccbc1 power: supply: cpcap-charger: Keep trickle charger bits disabled)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f123e7b2a6e3 Merge remote-tracking branch 'regulator/topic/vctrl' into regulator-next)
Merging security/next (8979b02aaf1d tpm: Fix reference count to main device)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (e36484b5ac31 crypto : asymmetric_keys : verify_pefile:zero memory content before freeing)
Merging selinux/next (cae303df3f37 selinux: Fix an uninitialized variable bug)
Merging tpmdd/next (61e59bd2321e tpm: move endianness conversion of ordinals to tpm_input_header)
Merging watchdog/master (00078cff73db Merge branch 'watchdog-next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
CONFLICT (content): Merge conflict in drivers/watchdog/iTCO_wdt.c
Merging iommu/next (2c0248d68880 Merge branches 'arm/exynos', 'arm/omap', 'arm/rockchip', 'arm/mediatek', 'arm/smmu', 'arm/core', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (48d0e023af97 audit: fix the RCU locking for the auditd_connection structure)
Merging devicetree/for-next (17a70355ea57 of: fix sparse warnings in fdt, irq, reserved mem, and resolver code)
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (282ec0ea65da Merge remote-tracking branches 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (fbd781de3bac Merge branch 'x86/vdso')
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging clockevents/clockevents/next (6f9c89000c3f Merge tag 'arch-timer-errata' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into clockevents/4.12)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (f8d5549df25e EDAC, ghes: Do not enable it by default)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (8bbb767495af Merge branch 'for-next/ftrace/core' into trace/for-next)
CONFLICT (content): Merge conflict in kernel/trace/trace.h
CONFLICT (content): Merge conflict in kernel/trace/trace.c
Merging rcu/rcu/next (933dfbd7c437 rcu: Open-code the rcu_cblist_n_lazy_cbs() function)
Merging kvm/linux-next (bd17117bb2af Merge tag 'kvm-s390-next-4.12-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (35d2d5d490e2 KVM: arm/arm64: Move shared files to virt/kvm/arm)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic.h
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic-v2.c
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (fb7dcf723dd2 Merge remote-tracking branch 'remotes/powerpc/topic/xive' into kvm-ppc-next)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/cpu_setup_power.S
Applying: powerpc: merge fix for powerpc_debugfs_root move.
Merging kvms390/next (e000b8e0968d s390: kvm: Cpu model support for msa6, msa7 and msa8)
Merging xen-tip/linux-next (3dbd8204af48 xen: Move xen_have_vector_callback definition to enlighten.c)
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (6df97f85611c platform/x86: Make SILEAD_DMI depend on TOUCHSCREEN_SILEAD)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (3026050179a3 HSI: ssi_protocol: double free in ssip_pn_xmit())
Merging leds/for-next (28c5fe99016d leds: pca9532: Extend pca9532 device tree support)
Merging ipmi/for-next (2c1175c2e8e5 ipmi/watchdog: fix wdog hang on panic waiting for ipmi response)
Merging driver-core/driver-core-next (523aa3586ffb Merge 4.11-rc6 into driver-core-next)
Merging usb/usb-next (c034a43e72dd staging: typec: Fairchild FUSB302 Type-c chip driver)
CONFLICT (content): Merge conflict in Documentation/media/v4l-drivers/philips.rst
Merging usb-gadget/next (48eab1f28d49 usb: gadget: udc: atmel: Update Kconfig help for fifo_mode = 0)
Merging usb-serial/usb-next (31c5d1922b90 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit)
Merging usb-chipidea-next/ci-for-usb-next (a932a8041ff9 usb: chipidea: core: add sysfs group)
Merging phy-next/next (6239879b415e phy: qcom-qusb2: add NVMEM dependency)
Merging tty/tty-next (8e1c21f48694 serial: small Makefile reordering)
CONFLICT (content): Merge conflict in include/linux/serdev.h
Merging char-misc/char-misc-next (2a76f89fa58c firmware: google memconsole: Fix return value check in platform_memconsole_init())
CONFLICT (content): Merge conflict in drivers/scsi/osd/osd_uld.c
CONFLICT (content): Merge conflict in drivers/misc/Makefile
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Applying: firmware: google memconsole: merge fix for e820.h move
Merging extcon/extcon-next (70641a0a84e1 extcon: Use BIT() macro for the left-shift operation)
Merging staging/staging-next (11270059e8d0 staging: fsl-mc/dpio: add cpu <--> LE conversion for dpaa2_fd)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sir.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sir.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sasem.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sasem.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/Kconfig
CONFLICT (content): Merge conflict in drivers/staging/Makefile
$ git rm -f drivers/staging/media/lirc/lirc_sasem.c drivers/staging/media/lirc/lirc_sir.c
Applying: staging: merge fix for add/change_virtual-intf API change
Applying: staging: merge fix for "nl80211: allow multiple active scheduled scan requests"
Applying: staging: rtl8723bs: fix up for cfg80211_roamed() API change
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (64fe6098da04 Merge branch 'for-linus' into next)
Merging cgroup/for-next (0948307b3a5d Merge branch 'for-4.12' into for-next)
Merging scsi/for-next (e83d14310c40 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e7731da36f10 scsi: qla4xxx: fix spelling mistake: "Tempalate" -> "Template")
Merging target-updates/for-next (47f4cce7c72d tcmu: fix module removal due to stuck thread)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (6b0778cd8a78 Merge branch 'for-4.12' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (d635daaa99c6 ptr_ring: batched ring producer)
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b86c86aa9805 gpio: f7188x: Add a missing break)
Merging pinctrl/for-next (1aa2faf52f76 pinctrl: mediatek: Add missing pinctrl bindings for mt7623)
Merging pinctrl-samsung/for-next (c8dd100397f3 Merge branch 'pinctrl-next' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (d66bb1607e2d proc: Fix unbalanced hard link numbers)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (945f8f5f8633 selftests: x86: add missing executables to .gitignore)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/run_vmtests
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (608822c0f7af Merge branch 'for-4.12/upstream' into for-next)
Merging coresight/next (8b3fa19142e8 coresight: tmc: minor fix for output log)
Merging rtc/rtc-next (332e0d13d3c7 rtc: gemini: add return value validation)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (b9193db97d30 Merge branch 'for-4.12/dax' into libnvdimm-for-next)
CONFLICT (content): Merge conflict in fs/dax.c
CONFLICT (content): Merge conflict in drivers/nvdimm/pmem.c
CONFLICT (content): Merge conflict in drivers/block/brd.c
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (d9096ab96a05 sysv,ipc: cacheline align kern_ipc_perm)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: imx7: fix Kconfig warning and build errors
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: zero hash tables in allocator
Applying: mm: update callers to use HASH_ZERO flag
Applying: mm: adaptive hash table scaling
Applying: mm: introduce kv[mz]alloc helpers
Applying: mm: introduce kv[mz]alloc helpers - f2fs fix up
Applying: mm, vmalloc: properly track vmalloc users
Applying: mm: support __GFP_REPEAT in kvmalloc_node for >32kB
Applying: lib/rhashtable.c: simplify a strange allocation pattern
Applying: net/ipv6/ila/ila_xlat.c: simplify a strange allocation pattern
Applying: fs/xattr.c: zero out memory copied to userspace in getxattr
Applying: treewide: use kv[mz]alloc* rather than opencoded variants
Applying: net: use kvmalloc with __GFP_REPEAT rather than open coded variant
Applying: drivers/md/dm-ioctl.c: use kvmalloc rather than opencoded variant
Applying: drivers/md/bcache/super.c: use kvmalloc
Applying: mm, swap: use kvzalloc to allocate some swap data structures
Applying: mm, vmalloc: use __GFP_HIGHMEM implicitly
Applying: scripts/spelling.txt: add "memory" pattern and fix typos
Applying: scripts/spelling.txt: Add regsiter -> register spelling mistake
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: treewide: spelling: correct diffrent[iate] and banlance typos
Applying: treewide: move set_memory_* functions away from cacheflush.h
Applying: arm: use set_memory.h header
Applying: arm64: use set_memory.h header
Applying: s390: use set_memory.h header
Applying: x86: use set_memory.h header
Applying: agp: use set_memory.h header
Applying: drm: use set_memory.h header
Applying: drm-use-set_memoryh-header-fix
Applying: drivers/hwtracing/intel_th/msu.c: use set_memory.h header
Applying: drivers/watchdog/hpwdt.c: use set_memory.h header
Applying: include/linux/filter.h: use set_memory.h header
Applying: kernel/module.c: use set_memory.h header
Applying: kernel/power/snapshot.c: use set_memory.h header
Applying: alsa: use set_memory.h header
Applying: drivers/misc/sram-exec.c: use set_memory.h header
Applying: drivers/video/fbdev/vermilion/vermilion.c: use set_memory.h header
Applying: drivers/staging/media/atomisp/pci/atomisp2: use set_memory.h
Applying: treewide: decouple cacheflush.h and set_memory.h
Applying: kprobes/x86: merge fix for set_memory.h decoupling
Applying: kref: remove WARN_ON for NULL release functions
Applying: drivers/scsi/megaraid: remove expensive inline from megasas_return_cmd
Applying: include/linux/uaccess.h: remove expensive WARN_ON in pagefault_disabled_dec
Applying: fs: semove set but not checked AOP_FLAG_UNINTERRUPTIBLE flag
Applying: Documentation/vm/transhuge.txt: fix trivial typos
Applying: docs-vm-transhuge-fix-few-trivial-typos-fix
Applying: format-security: move static strings to const
Applying: fs: f2fs: use ktime_get_real_seconds for sit_info times
Applying: trace: make trace_hwlat timestamp y2038 safe
Applying: fs: cifs: replace CURRENT_TIME by other appropriate apis
Applying: fs: ceph: CURRENT_TIME with ktime_get_real_ts()
Applying: fs: ufs: use ktime_get_real_ts64() for birthtime
Applying: fs: ubifs: replace CURRENT_TIME_SEC with current_time
Applying: lustre: replace CURRENT_TIME macro
Applying: apparmorfs: replace CURRENT_TIME with current_time()
Applying: gfs2: replace CURRENT_TIME with current_time
Applying: time: delete CURRENT_TIME_SEC and CURRENT_TIME
Applying: time: delete current_fs_time()
Applying: mm/huge_memory.c.c: use zap_deposited_table() more
Applying: mm/huge_memory.c: deposit a pgtable for DAX PMD faults when required
Applying: mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
Applying: mm: introduce memalloc_noreclaim_{save,restore}
Applying: treewide: convert PF_MEMALLOC manipulations to new helpers
Applying: treewide-convert-pf_memalloc-manipulations-to-new-helpers-fix
Applying: mtd: nand: nandsim: convert to memalloc_noreclaim_*()
Applying: dax: add tracepoints to dax_iomap_pte_fault()
Applying: dax: add tracepoints to dax_pfn_mkwrite()
Applying: dax: add tracepoints to dax_load_hole()
Applying: dax: add tracepoints to dax_writeback_mapping_range()
Applying: dax: fix regression in dax_writeback_mapping_range()
Applying: dax: add tracepoint to dax_writeback_one()
Applying: dax-add-tracepoint-to-dax_writeback_one-fix
Applying: dax: add tracepoint to dax_insert_mapping()
Applying: selftests/vm: add a test for virtual address range mapping
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (d51e44cdf96d lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
