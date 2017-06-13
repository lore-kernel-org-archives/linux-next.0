From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 13
Date: Tue, 13 Jun 2017 18:38:05 +1000
Message-ID: <20170613183805.504fef48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751801AbdFMIiI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 04:38:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170609:

New tree: actions
Dropped tree: sound-current

The sound-current tree gained a build failure so I dropped it for today.

The block tree gained conflicts against the s390 and btrfs-kdave trees.

The device-mapper tree lost its build failure.

The mmc tree gained a conflict against the block tree.

The md tree gained a conflict against the block tree.

The driver-core tree gained a build failure for which I reverted a commit.

The usb-gadget tree gained a conflict against Linus' tree.

The char-misc tree gained a conflict against the jc_docs tree.

The target-updates tree gained a conflict against the scsi-mkp tree.

The uuid tree lost its build failure.

The akpm-current tree still had its build failure for which I reverted
a commit.

Non-merge commits (relative to Linus' tree): 5986
 6062 files changed, 243533 insertions(+), 119859 deletions(-)

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
and pseries_le_defconfig and i386, sparc and sparc64 defconfig. And
finally, a simple boot test of the powerpc pseries_le_defconfig kernel
in qemu.

Below is a summary of the state of the merge.

I am currently merging 265 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (32c1431eea48 Linux 4.12-rc5)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (ff85a1a80e00 kconfig: Check for libncurses before menuconfig)
Merging arc-current/for-curr (45c7d002f207 ARC: defconfig: Cleanup from old Kconfig options)
Merging arm-current/fixes (d360a687d995 ARM: 8682/1: V7M: Set cacheid iff DminLine or IminLine is nonzero)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (c6ee9619e2ed powerpc/book3s64: Move PPC_DT_CPU_FTRs and enable it by default)
Merging sparc/master (5faab9e0f03c Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (6964e53f5583 i40e: fix handling of HW ATR eviction)
Merging ipsec/master (138437f591dd xfrm: move xfrm_garbage_collect out of xfrm_policy_flush)
Merging netfilter/master (4b1f0d33db7d net: ipmr: Fix some mroute forwarding issues in vrf's)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (dc89481bb4c9 Merge tag 'iwlwifi-for-kalle-2017-06-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (f0fd108e141d mac80211: don't look at the PM bit of BAR frames)
Merging sound-current/for-linus (8c6e31b25e15 ALSA: seq: Simplify device registration)
$ git reset --hard HEAD^
Merging pci-current/for-linus (98dbf5af4fdd PCI: endpoint: Select CRC32 to fix test build error)
Merging driver-core.current/driver-core-linus (08332893e37a Linux 4.12-rc2)
Merging tty.current/tty-linus (3c2993b8c614 Linux 4.12-rc4)
Merging usb.current/usb-linus (d2f48f05cd2a usb: xhci: ASMedia ASM1042A chipset need shorts TX quirk)
Merging usb-gadget-fixes/fixes (f50b878fed33 USB: gadget: fix GPF in gadgetfs)
Merging usb-serial-fixes/usb-linus (5ed02dbb4974 Linux 4.12-rc3)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (9605bc46433d phy: qualcomm: phy-qcom-qmp: fix application of sizeof to pointer)
Merging staging.current/staging-linus (32c1431eea48 Linux 4.12-rc5)
Merging char-misc.current/char-misc-linus (32c1431eea48 Linux 4.12-rc5)
Merging input-current/for-linus (a0897d5f2c2d Input: synaptics-rmi4 - register F03 port as pass-through serio)
Merging crypto-current/master (d41519a69b35 crypto: Work around deallocated stack frame reference gcc bug on sparc.)
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging mfd-fixes/for-mfd-fixes (27fef9f8ecb0 mfd: arizona: Fix typo using hard-coded register)
Merging v4l-dvb-fixes/fixes (f9f314f32395 [media] media/cec.h: use IS_REACHABLE instead of IS_ENABLED)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (ef6c4d75e353 drm/i915: fix warning for unused variable)
Merging drm-misc-fixes/for-linux-next-fixes (d758619ba6a5 drm: dw-hdmi: Fix compilation breakage by selecting REGMAP_MMIO)
Merging kbuild/for-next (e814942193b7 Merge branches 'kbuild' and 'fixes' into for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (7e9fe4572e26 ARC: [plat-eznps] use schd.wft instruction instead of sleep at idle task)
Merging arm/for-next (9d7fb07136c9 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (2ea659a9ef48 Linux 4.12-rc1)
Merging arm-soc/for-next (b0cd8f449f09 Merge branch 'fixes' into for-next)
Merging actions/for-next (cae7fc484f46 Merge branch 'v4.13/arm64' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (62018527d9eb Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (630efea351f0 Merge branch 'at91-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/Kconfig
Merging bcm2835/for-next (ab094a62ccec Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e79b47dc3c49 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (b45371147f9d Merge branch 'for_4.13/keystone_dts' into next)
Merging mvebu/for-next (441971f89970 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (de1337319a34 Merge branch 'omap-for-v4.13/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (28df169b9afa reset: Add the TI SCI reset driver)
Merging qcom/for-next (882a2c7208ad Merge branch 'arm64-defcofig-for-4.13' into all-for-4.13)
Merging realtek/for-next (007e6304223c Merge branch 'v4.13/dt64' into next)
Merging renesas/next (26cbddb5ed7a Merge branches 'fixes-for-v4.12', 'arm64-defconfig-for-v4.13', 'arm64-dt-for-v4.13', 'drivers-for-v4.13', 'dt-bindings-for-v4.13' and 'dt-for-v4.13' into next)
Merging rockchip/for-next (dd3f24b9ff88 Merge branch 'v4.13-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (a73df8fda605 Merge branch 'for-v4.13/defconfig-arm-cleanup' into for-next)
Merging sunxi/sunxi/for-next (6c366c428360 Merge branch 'sunxi/dt-for-4.13' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (c484f2564db1 arm64: kconfig: allow support for memory failure handling)
Merging clk/clk-next (b608a89221b4 clk: imx7d: Fix the DDR PLL enable bit)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (1072734a2c63 m68k/defconfig: Update defconfigs for v4.12-rc1)
Merging m68knommu/for-next (f4d8f47e52ec m68k: defconfig: Cleanup from old Kconfig options)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (83f0124ad81e microblaze: remove asm-generic wrapper headers)
Merging mips/mips-for-linux-next (07b86a886727 Merge branch '4.12-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (f02e6c61bc1f parisc: Don't hardcode PSW values in hpmc code)
Merging powerpc/next (90df4bfb4d9e powerpc/64s: Machine check handle ifetch from foreign real address for POWER9)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (a75259825401 s390: rename struct psw_bits members)
Merging sparc-next/master (9300d9c4ad29 Merge branch 'sparc64-early-boot-timestamp')
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (bdf3b55fde37 Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (736202ae51c5 Merge branch 'for-next-next-v4.13-20170605' into for-next-20170605)
CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
Merging ceph/master (6ac56951dc10 rbd: implement REQ_OP_WRITE_ZEROES)
Merging cifs/for-next (a95cfad947d5 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (d8747d642ec4 reiserfs: Make flush bios explicitely sync)
Merging ext4/dev (67a7d5f561f4 ext4: fix fdatasync(2) after extent manipulation operations)
Merging f2fs/dev (1b7d8dd63b27 f2fs: fix a panic caused by NULL flush_cmd_control)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (68227c03cba8 fuse: initialize the flock flag in fuse_file on allocation)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (501e7a468937 NFSv4.2: Don't send mode again in post-EXCLUSIVE4_1 SETATTR with umask)
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
Merging hid/for-next (110e3fb59bb9 Merge branch 'for-4.13/apple' into for-next)
Merging i2c/i2c/for-next (f9831bfec741 i2c: mxs: change error printing to debug for mxs_i2c_pio_wait_xfer_end)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (bf0324625630 firmware: dmi: Check DMI structure length)
Merging hwmon-staging/hwmon-next (677252a185a9 hwmon: (pwm-fan) Switch to new atomic PWM API)
Merging jc_docs/docs-next (68f04b571da4 Doc: fix a markup error in coding-style.rst)
Merging v4l-dvb/master (47f910f0e0de [media] v4l: subdev: tolerate null in media_entity_to_v4l2_subdev)
Merging v4l-dvb-next/master (791a9a666d1a Merge tag 'kbuild-uapi-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging fbdev/fbdev-for-next (34bf129a7f06 fbdev: sti: don't select CONFIG_VT)
Merging pm/linux-next (b94dd9cfc5db Merge branch 'acpica' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (33011c583fcc Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (a1fa1a00b31c net: phy: marvell: Show complete link partner advertising)
Applying: remove duplicate ethernet node intruduced by merge
Applying: qtnfmac: fix up for "net: Fix inconsistent teardown and release of private netdev state."
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (34158151d2aa netfilter: cttimeout: use nf_ct_iterate_cleanup_net to unlink timeout objs)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (833689044e13 Merge tag 'iwlwifi-next-for-kalle-2017-06-06' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (4284ecbeda81 Bluetooth: btbcm: Read controller features during configuration)
Merging mac80211-next/master (699cb58c8a52 mac80211: manage RX BA session offload without SKB queue)
Merging rdma/for-next (5ed02dbb4974 Linux 4.12-rc3)
Merging gfs2/for-next (df68f20f5608 GFS2: Remove gl_list from glock structure)
Merging mtd/master (05e97a9eda72 Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD)
Merging l2-mtd/master (c46adf0976ea mtd: subpagetest: fix wrong written check in function write_eraseblock2)
Merging nand/nand/next (91300dd67bae mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants)
Merging spi-nor/spi-nor/next (05d090f00203 mtd: spi-nor: Potential oops on error path in quad_enable())
Merging crypto/master (48df28b85991 dt-bindings: crypto: remove mediatek ethif clock)
Merging drm/drm-next (c9f0726ff360 Merge tag 'exynos-drm-next-for-v4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_uc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_engine_cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_dp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (da411a48bdeb drm/i915/cfl: Basic DDI plumbing for Coffee Lake.)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_engine_cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
Merging drm-misc/for-linux-next (2d7b56378d32 drm/rockchip: gem: add the lacks lock and trivial changes)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (d417f0815ce7 drm/arm: malidp: Use crtc->mode_valid() callback)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (add1318723a0 gpu: ipu-v3: vdic: include AUTO field order bit in ipu_vdi_set_field_order)
Merging etnaviv/etnaviv/next (46a269da7e8a drm/etnaviv: restore ETNA_PREP_NOSYNC behaviour)
Merging kspp/for-next/kspp (4b49d6a66b06 Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (5ea32fb24a83 Merge remote-tracking branches 'regmap/topic/1wire', 'regmap/topic/irq' and 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (f5abd532227a ALSA: pcm: use %s instead of %c for format of PCM buffer tracepoints)
Merging sound-asoc/for-next (06768aa28f66 Merge remote-tracking branches 'asoc/topic/tlv320dac31xx', 'asoc/topic/topology' and 'asoc/topic/wm-adsp' into asoc-next)
Merging modules/modules-next (3e2e857f9c3a module: Add module name to modinfo)
Merging input/next (ad2ee015245d Input: xen-kbdfront - use string constants from PV protocol)
Merging block/for-next (10965de0c408 Merge branch 'for-4.13/block' into for-next)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.h
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.h
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
CONFLICT (content): Merge conflict in drivers/s390/block/scm_blk.h
CONFLICT (content): Merge conflict in drivers/s390/block/scm_blk.c
Applying: btrfs: merge fix for "block: switch bios to blk_status_t"
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (8160944ec02b dm zoned: drive-managed zoned block device target)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (405726d470b7 mmc: core: for data errors, take response of stop cmd into account)
CONFLICT (content): Merge conflict in drivers/mmc/core/block.c
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (95ec77e91e08 md: don't use flush_signals in userspace processes)
CONFLICT (content): Merge conflict in drivers/md/raid5.c
CONFLICT (content): Merge conflict in drivers/md/raid10.c
CONFLICT (content): Merge conflict in drivers/md/raid1.c
Merging mfd/for-mfd-next (91bff31a52be mfd: arizona: Fix typo using hard-coded register)
Merging backlight/for-backlight-next (7e715c2d9c27 backlight: Report error on failure)
Merging battery/for-next (153e9e90ff89 Merge branch 'psy-reboot-mode-immutable' into psy-next)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (50f7452761f3 Merge remote-tracking branch 'regulator/topic/tps65917' into regulator-next)
Merging security/next (33f2eadabba5 apparmor: export that basic profile namespaces are supported)
Merging integrity/next (89e54ebf27d4 ima: Add cgroups2 to the defaults list)
Merging keys/keys-next (3088c2ad40cf Merge remote-tracking branch 'origin/keys-fixes' into keys-next)
CONFLICT (content): Merge conflict in security/keys/dh.c
Merging selinux/next (0b4d3452b8b4 security/selinux: allow security_sb_clone_mnt_opts to enable/disable native labeling behavior)
Merging tpmdd/next (ffd526e290f1 tpm: vtpm_proxy: Suppress error logging when in closed state)
Merging watchdog/master (3a9aedb282ac watchdog: w83627hf: Add support for NCT6793D and NCT6795D)
Merging iommu/next (56d95945c7e8 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/core', 'x86/vt-d' and 'x86/amd' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (e4c1a0d15b62 audit: style fix)
Merging devicetree/for-next (08cd94ec522b dt-bindings: net: move FMan binding)
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (73384500b8df Merge remote-tracking branches 'spi/topic/slave', 'spi/topic/spidev' and 'spi/topic/st-ssc4' into spi-next)
Merging tip/auto-latest (46c36ea495c0 Merge branch 'x86/timers')
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging clockevents/clockevents/next (d9569035d594 clocksource: Add an alias macro CLOCKSOURCE_OF_DECLARE)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (3b405e30cbca EDAC, mv64x60: Sanity check edac_op_state before registering)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (6ee98ffeea0b x86/ftrace: Make sure that ftrace trampolines are not RWX)
Merging rcu/rcu/next (0d882d40abd1 rcutorture: Use nr_cpus rather than maxcpus to limit test size)
Merging kvm/linux-next (9d643f63128b KVM: x86: avoid large stack allocations in em_fxrstor)
Merging kvm-arm/next (ebb127f2d6f3 KVM: arm/arm64: Don't assume initialized vgic when setting PMU IRQ)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (76d837a4c0f9 KVM: PPC: Book3S PR: Don't include SPAPR TCE code on non-pseries platforms)
Merging kvms390/next (a2bdbb2c7e70 KVM: s390: ioctls to get and set guest storage attributes)
CONFLICT (content): Merge conflict in arch/s390/include/asm/kvm_host.h
Merging xen-tip/linux-next (9cc91f212111 xen: avoid type warning in xchg_xen_ulong)
Merging percpu/for-next (1328710b8ec3 mark most percpu globals as __ro_after_init)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (5d4be5f2b1f1 platform/x86: dell-rbtn: Improve explanation about DELLABC6)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (834938e8788f leds: Remove SEAD-3 driver)
Merging ipmi/for-next (bf10ff69dd6e ipmi_ssif: remove redundant null check on array client->adapter->name)
Merging driver-core/driver-core-next (1b8b02f0d084 arm: ecard: fix dev_groups patch typo)
Applying: Revert "zram: use class_groups instead of class_attrs"
Applying: Revert "driver core: remove class_attrs from struct class"
Merging usb/usb-next (81606aea2303 Merge 4.12-rc5 into usb-next)
Merging usb-gadget/next (c5a9044949a5 usb: gadget: mass_storage: set msg_registered after msg registered)
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/f_mass_storage.c
Merging usb-serial/usb-next (4cd4475effd8 USB: serial: upd78f0730: make constants static)
Merging usb-chipidea-next/ci-for-usb-next (c4a0bbbdb7f6 usb: chipidea: properly handle host or gadget initialization failure)
Merging phy-next/next (787f24543c4a phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY driver for Northstar2)
Merging tty/tty-next (54ebbfb16034 tty: add TIOCGPTPEER ioctl)
Merging char-misc/char-misc-next (069a0f32c9ca Merge 4.12-rc5 into char-misc-next)
CONFLICT (content): Merge conflict in Documentation/admin-guide/index.rst
Merging extcon/extcon-next (1f4be24786b8 extcon: int3496: Switch to devm_acpi_dev_add_driver_gpios())
Merging staging/staging-next (7bf1e44f8655 Merge 4.12-rc5 into staging-next)
CONFLICT (content): Merge conflict in include/uapi/linux/tty.h
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (c988e96b7d85 Merge branch 'topic/rcar' into next)
Merging cgroup/for-next (41c25707d217 cpuset: consider dying css as offline)
Merging scsi/for-next (c515ae1456aa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1080f7ec6125 scsi: lpfc: update to revision to 11.4.0.0)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd-pci.c
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_init.c
Merging target-updates/for-next (28d44b983000 tcmu: Add Type of reconfig into netlink)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_target.c
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (d6f6f8c3f726 Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c8b0d7290657 s390/virtio: change maintainership)
Merging rpmsg/for-next (0696d197bda1 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (65e82a93ae35 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (97ce3e6dc904 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-samsung/for-next (a453f3693f2a pinctrl: samsung: Explicitly cast pointer returned by of_iomap() to iomem)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (296990deb389 mnt: Make propagate_umount less slow for overlapping mount propagation trees)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9d9035bc6d78 random: suppress duplicate crng_init=0 warnings)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (34a048cc0680 selftests: kselftest_harness: Fix compile warning)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/dev-tools/index.rst
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
Merging uuid/for-next (87085ff2e90e thermal: int340x_thermal: fix compile after the UUID API switch)
Merging akpm-current/current (3ba56b246344 ipc/util.h: update documentation for ipc_getref() and ipc_putref())
CONFLICT (content): Merge conflict in include/linux/random.h
Applying: Revert "include/linux/string.h: add the option of fortified string.h functions"
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/netfilter/x_tables.c: use kvmalloc() in xt_alloc_table_info()
Applying: sparc64: NG4 memset 32 bits overflow
Applying: xtensa: use generic fb.h
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (3174151fb2a9 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
