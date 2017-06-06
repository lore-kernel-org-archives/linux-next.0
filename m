From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 6
Date: Tue, 6 Jun 2017 15:50:26 +1000
Message-ID: <20170606155026.3985c909@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750734AbdFFFu3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Jun 2017 01:50:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170605:

The clk tree lost its build failure.

The net-next tree gained a conflict against the net tree.

The mfd tree lost its build failure.

The akpm-current tree still had its build failure for which I reverted
a commit.

Non-merge commits (relative to Linus' tree): 4302
 4549 files changed, 175376 insertions(+), 94057 deletions(-)

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

I am currently merging 264 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (ba7b2387ad23 Merge branch 'for-4.12-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (05d8cba4a1e8 kbuild: skip install/check of headers right under uapi directories)
Merging arc-current/for-curr (a4da5b17736d arc: Set IO-coherency aperture base to LINUX_LINK_BASE)
Merging arm-current/fixes (06a4b6d009a1 ARM: 8677/1: boot/compressed: fix decompressor header layout for v7-M)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (0e5e7f5e9700 powerpc/64: Reclaim CPU_FTR_SUBCORE)
Merging sparc/master (1b4af13ff2cc sparc64: Add __multi3 for gcc 7.x and later.)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (269f9883fe25 net/mlx4: Check if Granular QoS per VF has been enabled before updating QP qos_vport)
Merging ipsec/master (a486cd23661c xfrm: fix state migration copy replay sequence numbers)
Merging netfilter/master (468b0df61a51 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (dc89481bb4c9 Merge tag 'iwlwifi-for-kalle-2017-06-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (e165bc02a02c mac80211: fix dropped counter in multiqueue RX)
Merging sound-current/for-linus (d2c3b14e1f0d ALSA: hda - Fix applying MSI dual-codec mobo quirk)
Merging pci-current/for-linus (bd2df9b1e094 PCI: Make error code types consistent in pci_{read,write}_config_*)
Merging driver-core.current/driver-core-linus (08332893e37a Linux 4.12-rc2)
Merging tty.current/tty-linus (3c2993b8c614 Linux 4.12-rc4)
Merging usb.current/usb-linus (29532e7b67f0 Merge tag 'phy-for-4.12-rc-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-linus)
Merging usb-gadget-fixes/fixes (afbbc7913a28 usb: gadget: udc: renesas_usb3: Fix PN_INT_ENA disabling timing)
Merging usb-serial-fixes/usb-linus (5ed02dbb4974 Linux 4.12-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (9605bc46433d phy: qualcomm: phy-qcom-qmp: fix application of sizeof to pointer)
Merging staging.current/staging-linus (0a33252e060e staging/lustre/lov: remove set_fs() call from lov_getstripe())
Merging char-misc.current/char-misc-linus (6f9193ec044a mei: make sysfs modalias format similar as uevent modalias)
Merging input-current/for-linus (0fd5f2210938 Input: axp20x-pek - switch to acpi_dev_present and check for ACPI0011 too)
Merging crypto-current/master (f3ad587070d6 crypto: gcm - wait for crypto op not signal safe)
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (963761a0b2e8 [media] rc-core: race condition during ir_raw_event_register())
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (3c2993b8c614 Linux 4.12-rc4)
Merging drm-misc-fixes/for-linux-next-fixes (75fb636324a8 drm: Fix oops + Xserver hang when unplugging USB drm devices)
Merging kbuild/for-next (547b9255cde5 Merge branch 'fixes' into for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (649ea043b511 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (2ea659a9ef48 Linux 4.12-rc1)
Merging arm-soc/for-next (74962b38a6d1 Document merges)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (fff484c158fb Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (630efea351f0 Merge branch 'at91-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/Kconfig
Merging bcm2835/for-next (c156bb73ae01 Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e79b47dc3c49 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (b45371147f9d Merge branch 'for_4.13/keystone_dts' into next)
Merging mvebu/for-next (e629b4b1c763 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (78f9b622f8a9 Merge branch 'omap-for-v4.13/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (cae285ea12b5 dt-bindings: reset: Add reset manager offsets for Stratix10)
Merging qcom/for-next (bca31d5e9dcb Merge branch 'arm64-for-4.13' into all-for-4.13)
Merging realtek/realtek/for-next (3d7f2ce10cb3 Merge branch 'realtek/v4.13/dt64' into next)
Merging renesas/next (dfa4e78cd21b Merge branch 'dt-bindings-for-v4.13' into next)
Merging rockchip/for-next (dd3f24b9ff88 Merge branch 'v4.13-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (3cd885f16313 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (efea15db3f04 Merge branch 'sunxi/dt-for-4.13' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (8dd0ee651d8a arm64: cpufeature: Fix CPU_OUT_OF_SPEC taint for uniform systems)
Merging clk/clk-next (4a5f06a01cfd clk: at91: fix clk-generated compilation)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (1072734a2c63 m68k/defconfig: Update defconfigs for v4.12-rc1)
Merging m68knommu/for-next (3c2993b8c614 Linux 4.12-rc4)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (83f0124ad81e microblaze: remove asm-generic wrapper headers)
Merging mips/mips-for-linux-next (bc53f9c58065 Merge branch '4.12-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (8d797f3169d1 openrisc: explicitly include linux/bug.h in asm/fixmap.h)
Merging parisc-hd/for-next (5aa2aabff1ce parisc: Stop CPUs via PAT firmware before system halt or reboot.)
Merging powerpc/next (f718d426d7e4 powerpc/lib/xor_vmx: Ensure no altivec code executes before enable_kernel_altivec())
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (caf40f52ac5a s390/dasd: Display read-only attribute correctly)
Merging sparc-next/master (60925ee97e2b Merge branch 'sparc64-queued-locks')
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6fad04b7585d Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (736202ae51c5 Merge branch 'for-next-next-v4.13-20170605' into for-next-20170605)
Merging ceph/master (6ac56951dc10 rbd: implement REQ_OP_WRITE_ZEROES)
Merging cifs/for-next (a95cfad947d5 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (d8747d642ec4 reiserfs: Make flush bios explicitely sync)
Merging ext4/dev (67a7d5f561f4 ext4: fix fdatasync(2) after extent manipulation operations)
Merging f2fs/dev (1b7d8dd63b27 f2fs: fix a panic caused by NULL flush_cmd_control)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0b6e9ea041e6 fuse: Add support for pid namespaces)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (6ea44adce915 SUNRPC: ensure correct error is reported by xs_tcp_setup_socket())
Merging nfsd/nfsd-next (bb2a8b0cd116 nfsd4: const-ify nfsd4_ops)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (a082c6f680da ovl: filter trusted xattr for non-admin)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (7bccd12d27b7 ubi: Add debugfs file for tracking PEB state)
Merging xfs/for-next (161f55efba5d xfs: fix use-after-free in xfs_finish_page_writeback)
Merging file-locks/linux-next (94073ad77fff fs/locks: don't mess with the address limit in compat_fcntl64)
Merging vfs/for-next (919bb328b020 Merge branch 'work.misc' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (719f6a7040f1 printk: Use the main logbuf in NMI when logbuf_lock is available)
Merging pci/next (c823e5b95885 Merge branch 'pci/host-xilinx' into next)
Merging pstore/for-next/pstore (d3762358a739 pstore: Fix format string to use %u for record id)
Merging hid/for-next (e52f086b62b3 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f9831bfec741 i2c: mxs: change error printing to debug for mxs_i2c_pio_wait_xfer_end)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (7e27b1d21d7a hwmon: (scpi) Fix the scale of SCP sensor readings)
Merging jc_docs/docs-next (68f04b571da4 Doc: fix a markup error in coding-style.rst)
Merging v4l-dvb/master (af3a8480646c [media] uvcvideo: annotate a switch fall through)
CONFLICT (content): Merge conflict in include/media/cec-notifier.h
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/i2c/ov5693/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/i2c/imx/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/i2c/Makefile
Merging v4l-dvb-next/master (791a9a666d1a Merge tag 'kbuild-uapi-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging fbdev/fbdev-for-next (34bf129a7f06 fbdev: sti: don't select CONFIG_VT)
Merging pm/linux-next (0fb21b0c59e3 Merge branch 'pm-tools' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (33011c583fcc Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (9d15e5cc8cb6 mdio: mux: fix an incorrect less than zero error check using a u32)
CONFLICT (content): Merge conflict in net/dsa/dsa2.c
CONFLICT (content): Merge conflict in drivers/net/phy/marvell.c
Merging ipsec-next/master (d49c9dc1c848 ipv6: remove unused variables in esp6)
Merging netfilter-next/master (34158151d2aa netfilter: cttimeout: use nf_ct_iterate_cleanup_net to unlink timeout objs)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (219569ad0c41 rsi: use subdirectory for firmware file)
Merging bluetooth/master (a3995460491d net: phy: Relax error checking on sysfs_create_link())
Merging mac80211-next/master (5d473fedd17a mac80211: Invoke TX LED in more code paths)
Merging rdma/for-next (5ed02dbb4974 Linux 4.12-rc3)
Merging gfs2/for-next (3ef2bc099d1c Merge tag 'devicetree-for-4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging mtd/master (05e97a9eda72 Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD)
Merging l2-mtd/master (44225c9c79ae mtd: mchp23k256: switch to mtd_device_register())
Merging nand/nand/next (30ee809e980b mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller)
Merging spi-nor/spi-nor/next (05d090f00203 mtd: spi-nor: Potential oops on error path in quad_enable())
Merging crypto/master (284e76387c38 hw_random: timeriomem_rng: Allow setting RNG quality from platform data)
Merging drm/drm-next (2a1720376add Backmerge tag 'v4.12-rc3' into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (938361e7a506 drm/i915/cnp: Panel Power sequence changes for CNP PCH.)
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
Merging drm-misc/for-linux-next (2d7b56378d32 drm/rockchip: gem: add the lacks lock and trivial changes)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (763656d30b3d drm: mali-dp: use div_u64 for expensive 64-bit divisions)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (b8f0951de854 gpu: ipu-v3: prg: remove counter load enable)
Merging etnaviv/etnaviv/next (46a269da7e8a drm/etnaviv: restore ETNA_PREP_NOSYNC behaviour)
Merging kspp/for-next/kspp (4b49d6a66b06 Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (f7a478178a8e ALSA: doc: Update copy_user, copy_kernel and fill_silence PCM ops)
Merging sound-asoc/for-next (aed323d42578 Merge remote-tracking branches 'asoc/topic/stm32', 'asoc/topic/sunxi', 'asoc/topic/tlv320dac31xx' and 'asoc/topic/wm-adsp' into asoc-next)
Merging modules/modules-next (3e2e857f9c3a module: Add module name to modinfo)
Merging input/next (78bcac7b2ae1 Input: add support for the STMicroelectronics FingerTip touchscreen)
Merging block/for-next (fe02d46ab775 Merge branch 'for-4.13/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (d8fc98f845c9 dm kcopyd: add sequential write feature)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (6e75316c15df mmc: tmio: make sure SDIO gets reinitialized after resume)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (66a8066d55fd md: simplify code with bio_io_error)
Merging mfd/for-mfd-next (5b0784e7fbab mfd: axp20x-i2c: Document that this must be builtin on x86)
Merging backlight/for-backlight-next (e739c5bb20be backlight: Add support for Arctic Sand LED backlight driver chips)
Merging battery/for-next (b5910897b2ee power_supply: Add Apple Brick ID power supply type)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (af7a73de20f9 Merge remote-tracking branches 'regulator/topic/settle' and 'regulator/topic/tps65917' into regulator-next)
Merging security/next (d68c51e0b377 Sync to mainline for security submaintainers to work against)
Merging integrity/next (89e54ebf27d4 ima: Add cgroups2 to the defaults list)
Merging keys/keys-next (e36484b5ac31 crypto : asymmetric_keys : verify_pefile:zero memory content before freeing)
Merging selinux/next (8e71bf75efce selinux: use pernet operations for hook registration)
Merging tpmdd/next (ffd526e290f1 tpm: vtpm_proxy: Suppress error logging when in closed state)
Merging watchdog/master (3a9aedb282ac watchdog: w83627hf: Add support for NCT6793D and NCT6795D)
Merging iommu/next (752b80575ea4 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/core', 'x86/vt-d' and 'x86/amd' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (7786f6b6dfc1 audit: add ambient capabilities to CAPSET and BPRM_FCAPS records)
Merging devicetree/for-next (08cd94ec522b dt-bindings: net: move FMan binding)
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (b8076f1a1d44 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/slave', 'spi/topic/spidev' and 'spi/topic/st-ssc4' into spi-next)
Merging tip/auto-latest (894645be751b Merge branch 'x86/mm')
Merging clockevents/clockevents/next (d9569035d594 clocksource: Add an alias macro CLOCKSOURCE_OF_DECLARE)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (cf97825862f0 EDAC, thunderx: Fix a warning during l2c debugfs node creation)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (6ee98ffeea0b x86/ftrace: Make sure that ftrace trampolines are not RWX)
Merging rcu/rcu/next (5c246613fb79 documentation: Fix relation between nohz_full and rcu_nocbs)
Merging kvm/linux-next (9d643f63128b KVM: x86: avoid large stack allocations in em_fxrstor)
Merging kvm-arm/next (a2b19e6e2d4b KVM: arm/arm64: vgic-its: Cleanup after failed ITT restore)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (76d837a4c0f9 KVM: PPC: Book3S PR: Don't include SPAPR TCE code on non-pseries platforms)
Merging kvms390/next (a2bdbb2c7e70 KVM: s390: ioctls to get and set guest storage attributes)
Merging xen-tip/linux-next (c71e6d804c88 xen: make xen_flush_tlb_all() static)
Merging percpu/for-next (1328710b8ec3 mark most percpu globals as __ro_after_init)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (5d4be5f2b1f1 platform/x86: dell-rbtn: Improve explanation about DELLABC6)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (3026050179a3 HSI: ssi_protocol: double free in ssip_pn_xmit())
Merging leds/for-next (834938e8788f leds: Remove SEAD-3 driver)
Merging ipmi/for-next (bf10ff69dd6e ipmi_ssif: remove redundant null check on array client->adapter->name)
Merging driver-core/driver-core-next (06a45a93e7d3 firmware: move umh try locks into the umh code)
Merging usb/usb-next (ef189c8dde9a usb: host: ohci-omap3: Remove driver in favor of ohci-platform)
Merging usb-gadget/next (2868b2513aa7 Merge tag 'linux-kselftest-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging usb-serial/usb-next (4cd4475effd8 USB: serial: upd78f0730: make constants static)
Merging usb-chipidea-next/ci-for-usb-next (c4a0bbbdb7f6 usb: chipidea: properly handle host or gadget initialization failure)
Merging phy-next/next (4b797aa5d326 phy: rockchip-inno-usb2: add support of usb2-phy for rk3228 SoCs)
Merging tty/tty-next (8bc39bca5e3e Merge 4.12-rc4 into tty-next)
Merging char-misc/char-misc-next (73726380a26f mux: mmio-based syscon mux controller)
Merging extcon/extcon-next (a781a7d646ad extcon: qcom-spmi-misc: add dependency on ARCH_QCOM)
Merging staging/staging-next (9f98c6e67ffd staging: ks7010: use le16_to_cpu() to access __le16 field)
CONFLICT (content): Merge conflict in include/uapi/linux/tty.h
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (cb636f8d7007 Merge branch 'fixes' into next)
Merging cgroup/for-next (41c25707d217 cpuset: consider dying css as offline)
Merging scsi/for-next (494ea5cc82f0 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (37503d5a843c scsi: megaraid: Fix a sleep-in-atomic bug)
Merging target-updates/for-next (982a458dbf13 iscsi-target: Kill left-over iscsi_target_do_cleanup)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (54a616753388 Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c8b0d7290657 s390/virtio: change maintainership)
Merging rpmsg/for-next (0696d197bda1 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7043bc081bd1 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (62edf480d86a Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-samsung/for-next (eb1c179c966a pinctrl: samsung: Explicitly cast pointer returned by of_iomap() to iomem)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (296990deb389 mnt: Make propagate_umount less slow for overlapping mount propagation trees)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9dfa7bba35ac fix race in drivers/char/random.c:get_reg())
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (ea48ee387aef selftests/ftrace: Add a testcase for many kprobe events)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (c87a040fb6c5 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (92cd7037795e arm64: dts: qcom: msm8916: Add debug unit)
Merging rtc/rtc-next (5c82a6ae0242 rtc: remove rtc_device.name)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f5705aa8cfed dax, xfs, ext4: compile out iomap-dax paths in the FS_DAX=n case)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging uuid/for-next (fafd3cdfbe24 MAINTAINERS: add uuid entry)
Merging akpm-current/current (3ba56b246344 ipc/util.h: update documentation for ipc_getref() and ipc_putref())
Applying: Revert "include/linux/string.h: add the option of fortified string.h functions"
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/netfilter/x_tables.c: use kvmalloc() in xt_alloc_table_info()
Applying: sparc64: NG4 memset 32 bits overflow
Applying: xtensa: use generic fb.h
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (98c21a634f70 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
