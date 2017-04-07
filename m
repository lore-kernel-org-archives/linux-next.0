From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 7
Date: Fri, 7 Apr 2017 18:27:32 +1000
Message-ID: <20170407182732.455c5c90@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753730AbdDGI1g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 04:27:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170406:

The vfs tree gained a conflict against the s390 tree.

The net-next tree gained conflicts against the net and vfs trees

The kvm-ppc tree gained a conflict against the kvm tree and a build
failure for which I reverted 4 commits.

The kvms390 tree gained conflicts against the kvm and kvm-ppc trees.

The mfd tree still had its build failure for which I reverted a commit.

The usb-gadget tree gained conflicts against the usb tree.

The scsi-mkp tree gained a conflict against the char-misc tree.

The akpm tree gained a conflict against the arm64 tree and lost a patch
that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 7906
 7907 files changed, 923252 insertions(+), 161456 deletions(-)

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

I am currently merging 256 trees (counting Linus' and 37 trees of bug
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
Merging origin/master (977674c06b18 Merge branch 'upstream' of git://git.linux-mips.org/pub/scm/ralf/upstream-linus)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (9be3213b14d4 gconfig: remove misleading parentheses around a condition)
Merging arc-current/for-curr (a71c9a1c779f Linux 4.11-rc5)
Merging arm-current/fixes (35512d971274 Merge branch 'kprobe-fixes' of https://git.linaro.org/people/tixy/kernel into fixes)
Merging m68k-current/for-linus (e3b1ebd67387 m68k: Wire up statx)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (88b1bf7268f5 powerpc/mm: Add missing global TLB invalidate if cxl is active)
Merging sparc/master (86e1066fe2af sparc: remove unused wp_works_ok macro)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (16cf72bb0856 team: call netdev_change_features out of team lock)
Merging ipsec/master (89e357d83c06 af_key: Add lock to key dump)
Merging netfilter/master (0b9aefea8600 tcp: minimize false-positives on TCP/GRO check)
Merging ipvs/master (0b9aefea8600 tcp: minimize false-positives on TCP/GRO check)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (75514b665485 net: ethernet: ti: cpsw: wake tx queues on ndo_tx_timeout)
Merging sound-current/for-linus (2f726aec19a9 ALSA: hda - fix a problem for lineout on a Dell AIO machine)
Merging pci-current/for-linus (794a8604fe6e PCI: dwc: Fix dw_pcie_ops NULL pointer dereference)
Merging driver-core.current/driver-core-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging tty.current/tty-linus (a71c9a1c779f Linux 4.11-rc5)
Merging usb.current/usb-linus (a71c9a1c779f Linux 4.11-rc5)
Merging usb-gadget-fixes/fixes (25cd9721c2b1 usb: gadget: f_hid: fix: Don't access hidg->req without spinlock held)
Merging usb-serial-fixes/usb-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (1a09b6a7c10e phy: qcom-usb-hs: Add depends on EXTCON)
Merging staging.current/staging-linus (a6d361404d81 Merge tag 'iio-fixes-for-4.11d' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging input-current/for-linus (5659495a7a14 uapi: add missing install of userio.h)
Merging crypto-current/master (40c98cb57cdb crypto: caam - fix RNG deinstantiation error checking)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (65b1adebfe43 vfio: Rework group release notifier warning)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (cf082a4a264d Merge tag 'gvt-fixes-2017-04-01' of https://github.com/01org/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (a71c9a1c779f Linux 4.11-rc5)
Merging kbuild/for-next (e68966e4f52e Merge branch 'uapi' into for-next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (0c4441f0b734 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (3071f13d75f6 perf: qcom: Add L3 cache PMU driver)
Merging arm-soc/for-next (60e1ed69406f arm-soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r7s72100.dtsi
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (715dcd206041 Merge branch 'v4.12/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (ab15e12960f1 Merge branches 'defconfig-for-v4.11', 'soc-for-v4.11' and 'dt-for-v4.11' into for-next)
Merging at91/at91-next (fabfb0f29bb5 Merge branch 'at91-dt' into at91-next)
Merging bcm2835/for-next (7ea6e490ba7f Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (abffca6fb621 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (9abf3e9b9cc8 Merge branch 'for_4.12/soc-pmdomain' into next)
Merging mvebu/for-next (55c66a310963 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (08e244fab835 Merge branch 'omap-for-v4.12/defconfig' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (9f514b0f9cf3 Merge branch 'drivers-for-4.12' into all-for-4.12)
Merging renesas/next (ce0f28606ca8 Merge branches 'arm64-dt-for-v4.12', 'dt-for-v4.12' and 'sysc-for-v4.12' into next)
Merging rockchip/for-next (84c1b7fec3d5 Merge branch 'v4.12-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (835ca0530460 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (5675caea945d Merge branches 'sunxi/clk-for-4.12', 'sunxi/dt-for-4.12' and 'sunxi/fixes-for-4.11' into sunxi/for-next)
Merging tegra/for-next (e4f6f5202ff8 Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (b824b9306823 arm64: print a fault message when attempting to write RO memory)
Merging clk/clk-next (e19400cf41f4 clk: qcom: msm8996: Fix the vfe1 powerdomain name)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (3dfe33020ca8 m68k/sun3: Remove dead code in paging_init())
Merging m68knommu/for-next (120815c1c1b9 m68k/coldfire/pit: set ->min_delta_ticks and ->max_delta_ticks)
Merging metag/for-next (d3ba2e922d4d metag/usercopy: Add 64-bit get_user support)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (d72c4a87e3df Merge branch 'linus' into mips-for-linux-next)
Merging nios2/for-next (d8f347ba35cf nios2: enable earlycon support)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (a9f6b6b8cd2f Merge tag 'usb-4.11-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging powerpc/next (11fe909d2362 powerpc/powernv: Add OPAL exports attributes to sysfs)
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (df26c2e87e6c s390/cpumf: simplify detection of guest samples)
CONFLICT (content): Merge conflict in arch/s390/include/uapi/asm/Kbuild
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (d0c32cdc395c Merge branch 'xtensa-dma-map-fix' into xtensa-for-next)
Merging fscrypt/master (94840e3c802d fscrypt: eliminate ->prepare_context() operation)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (2d1d18079404 Merge branch 'for-next-next-v4.12-20170406' into for-next-20170406)
Merging ceph/master (633ee407b9d1 libceph: force GFP_NOIO for socket allocations)
Merging cifs/for-next (ecfe1ae23bd7 Reset TreeId to zero on SMB2 TREE_CONNECT)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (1acf736831f4 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (d67d64f42314 ext4: fix two spelling nits)
Merging f2fs/dev (65f770f2ead7 f2fs: avoid IO split due to mixed WB_SYNC_ALL and WB_SYNC_NONE)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9a87ad3da905 fuse: release: private_data cannot be NULL)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (a71c9a1c779f Linux 4.11-rc5)
Merging nfsd/nfsd-next (7920c2f404a3 lockd: fix lockd shutdown race)
Merging orangefs/for-next (e98bdb3059cb Merge tag 'v4.10' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into for-next)
Merging overlayfs/overlayfs-next (b1eaa950f7e9 ovl: lockdep annotate of nested stacked overlayfs inode lock)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (4c934c7dd60c xfs: report realtime space information via the rtbitmap)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (03b723221568 Merge branch 'work.uaccess' into for-next)
CONFLICT (content): Merge conflict in arch/s390/Kconfig
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (257ab443118b printk: Correctly handle preemption in console_unlock())
Merging pci/next (d7566c5014b8 Merge branch 'pci/host-mvebu' into next)
Merging pstore/for-next/pstore (eec50d76a6ee pstore: Drop needless inode lock during population)
Merging hid/for-next (5d497a0a562b Merge branch 'for-4.12/wacom' into for-next)
Merging i2c/i2c/for-next (aab817ebee6f Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (cc96f6f6d766 hwmon: Support for ASPEED PWM/Fan tach)
Merging jc_docs/docs-next (0e056eb5530d kernel-api.rst: fix a series of errors when parsing C files)
Merging v4l-dvb/master (2f65ec0567f7 [media] s5p-g2d: Fix error handling)
Merging v4l-dvb-next/master (432ac2d4acef Merge branch 'v4l_for_linus' into to_next)
Merging fbdev/fbdev-for-next (6f9655b1b81f drivers/video: Convert remaining uses of pr_warning to pr_warn)
Merging pm/linux-next (bc3d898b0e5d Merge branch 'pm-cpuidle' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (f7b553c688c3 Merge branches 'for-rc' and 'thermal-core' into next)
Merging thermal-soc/next (c64d1b57043e Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (dc423b6be10c Merge branch 'ftgmac-rework-batch2-rx-path')
CONFLICT (content): Merge conflict in net/sched/sch_generic.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging ipsec-next/master (6c786bcb29dd xfrm: branchless addr4_match() on 64-bit)
Merging netfilter-next/master (592d42ac7fd3 Merge branch 'qed-IOV-cleanups')
Merging ipvs-next/master (e24113769960 ipvs: remove unused variable)
Merging wireless-drivers-next/master (1aed89640a89 mwifiex: apply radar flag)
Merging bluetooth/master (3eed8950c0f8 Bluetooth: L2CAP: Don't return -EAGAIN if out of credits)
Merging mac80211-next/master (a339e4c226c0 cfg80211: add intro to documentation)
Merging rdma/for-next (b58fc8049790 IB/hfi1: Eliminate synchronize_rcu() in mr delete)
Merging gfs2/for-next (d4d7fc12b642 gfs2: Re-enable fallocate for the rindex)
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (a779475bdf56 mtd: nand: allow drivers to request minimum alignment for passed buffer)
Merging spi-nor/next (0859c617ba1f mtd: spi-nor: Add support for N25Q256A11)
Merging crypto/master (ad1064cd612e crypto: xts - drop gf128mul dependency)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Merging drm/drm-next (016877811568 Merge branch 'drm-next-4.12' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (b268d9fe0f10 drm/i915: Use the right mapping_gfp_mask for final shmem allocation)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/drm.c
Merging drm-misc/for-linux-next (09bffa6e5192 drm: omap: use common OF graph helpers)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (849f0512efc9 msm/drm: gpu: Dynamically locate the clocks from the device tree)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/adreno/adreno_gpu.c
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (cda0c3ce3297 drm: mali-dp: remove unused variable)
Merging sunxi-drm/sunxi-drm/for-next (2da042ac05e9 MAINTAINERS: Add sun4i-drm git repo)
Merging kspp/for-next/kspp (517e1fbeb65f mm/usercopy: Drop extra is_vmalloc_or_module() check)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (f87e7f25893d ALSA: hda - Improved position reporting on SKL+)
Merging sound-asoc/for-next (eca7fa89876f Merge remote-tracking branches 'asoc/topic/wm8903', 'asoc/topic/wm8960', 'asoc/topic/wm8978' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (5bd933fe4481 module: set .init_array alignment to 8)
Merging input/next (deeb1e902fbc Input: use svg files instead of xfig in force feedback documentation)
CONFLICT (content): Merge conflict in Documentation/input/ff.rst
Merging block/for-next (2a874b7af2f3 Merge branch 'for-4.12/block' into for-next)
Merging lightnvm/for-next (e57ef816cf77 Merge branch 'for-4.11/block' into for-next)
Merging device-mapper/for-next (3591b6613c18 Merge branch 'dm-4.11' into dm-next)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (72cc952b8954 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (8fc04e6ea02d md: raid1: kill warning on powerpc_pseries)
CONFLICT (content): Merge conflict in drivers/md/raid5.h
Merging mfd/for-mfd-next (eb2a445f7d8f mfd: intel_soc_pmic: Fix a mess with compilation units)
Applying: Revert "mfd: intel_soc_pmic: Fix a mess with compilation units"
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (5782dcb20370 power: supply: bq24190_charger: Don't spam the logs on charger plug / unplug)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (533ffbd550e8 Merge remote-tracking branches 'regulator/topic/settle' and 'regulator/topic/twl6030' into regulator-next)
Merging security/next (622f6e326570 apparmor: Make path_max parameter readonly)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (f1c316a3ab9d KEYS: add SP800-56A KDF support for DH)
Merging selinux/next (cae303df3f37 selinux: Fix an uninitialized variable bug)
Merging tpmdd/next (c93bebd62678 tpm: fix handling of the TPM 2.0 event logs)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm_crb.c
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (41346dad4de0 Merge branches 'x86/vt-d', 'arm/core', 'core' and 'iommu/fixes' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d9d84780f17c vfio: fix a typo in comment of function vfio_pin_pages)
Merging trivial/for-next (4f6cce39105e Fix dead URLs to ftp.kernel.org)
Merging audit/next (36fe46d172e5 audit: normalize NETFILTER_PKT)
CONFLICT (content): Merge conflict in net/netfilter/xt_AUDIT.c
Merging devicetree/for-next (8654cb8d0371 dtc: update warning settings for new bus and node/property name checks)
Merging mailbox/mailbox-for-next (73874913d504 mailbox: Remove depends on COMPILE_TEST for BCM_FLEXRM_MBOX)
Merging spi/for-next (a0d1f303c543 Merge remote-tracking branches 'spi/topic/test', 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (71c4271c9a58 Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi-pstore.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/bug.h
Merging clockevents/clockevents/next (f947ee147e08 clocksource/drivers/arm_arch_timer: Map frame with of_io_request_and_map())
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (621c4fe3cca5 EDAC, thunderx: Fix L2C MCI interrupt disable)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (696ced4fb1d7 tracing/kprobes: expose maxactive for kretprobe in kprobe_events)
Merging rcu/rcu/next (ac70aaf72670 doc: Emphasize that "toy" RCU requires recursive rwlock)
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (715958f921c2 Merge tag 'kvm_mips_4.12_1' of git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/kvm-mips)
Merging kvm-arm/next (255905e4ff0f KVM: arm/arm64: vgic: Improve sync_hwstate performance)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (63b7f2b544c3 KVM: PPC: Book3S PR: Do not fail emulation with mtspr/mfspr for unknown SPRs)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvms390/next (1721ee7d57c4 KVM: s390: introduce AIS capability)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging xen-tip/linux-next (9a0f13debac9 x86/xen: remove unused static function from smp_pv.c)
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (0d90fca74e2c platform/x86: asus-nb-wmi: Add wapf4 quirk for the X302UA)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (cd3b0b05328e leds: cpcap: new driver)
Merging ipmi/for-next (31151bf07a52 ipmi: bt-bmc: Add ast2500 compatible string)
Merging driver-core/driver-core-next (96fb7e256a06 Merge 4.11-rc4 into driver-core-next)
Merging usb/usb-next (cb2e3d461b26 Merge 4.11-rc5 into usb-next)
Merging usb-gadget/next (f7649d3a6c8b usb: gadget: mv_u3d: fix error handling in mv_u3d_probe())
CONFLICT (content): Merge conflict in drivers/usb/gadget/udc/amd5536udc.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/udc/Kconfig
Merging usb-serial/usb-next (e1fdd5b26201 USB: serial: drop obsolete open-race workaround)
Merging usb-chipidea-next/ci-for-usb-next (4f4555cfe704 usb: chipidea: udc: update gadget state after bus resume)
Merging phy-next/next (6629c9873e74 phy: rockchip-usb: Add vbus regulator support.)
Merging tty/tty-next (9ccd8d744592 Merge 4.11-rc5 into tty-next)
Merging char-misc/char-misc-next (57c0eabbd57e Merge 4.11-rc4 into char-misc-next)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Merging extcon/extcon-next (70641a0a84e1 extcon: Use BIT() macro for the left-shift operation)
Merging staging/staging-next (edf5e79422a9 Merge tag 'iio-for-4.12c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sir.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sir.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sasem.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sasem.c left in tree.
$ git rm -f drivers/staging/media/lirc/lirc_sasem.c drivers/staging/media/lirc/lirc_sir.c
Merging mux/for-next (5238347fea92 mux: adg792a: add mux controller driver for ADG792A/G)
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging slave-dma/next (cb220e16013c Merge branch 'topic/cppi' into next)
Merging cgroup/for-next (2b29fbe02b78 Merge branch 'for-4.12' into for-next)
Merging scsi/for-next (13365ca5cc33 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (bf5ea6fba78b scsi: qla4xxx: drop redundant init_completion)
CONFLICT (content): Merge conflict in drivers/scsi/osd/osd_uld.c
Merging target-updates/for-next (9f7ebfc64d2c tcm: make pi data verification configurable)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (0a7d2635b8cf Merge branch 'for-4.12' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (cc79d42a7d7e virtio_net: fix support for small rings)
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (d85f6bb30759 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/input/misc/soc_button_array.c
Merging pinctrl/for-next (b2740b4f018d Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (786b1f7c95d7 Merge branch 'pinctrl-next' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (cf4db7047d02 Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (040757f738e1 ucount: Remove the atomicity from ucount->count)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (8044e92eb7c2 Merge branch 'for-4.12/upstream' into for-next)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/init_task.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.h
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
CONFLICT (content): Merge conflict in arch/s390/include/asm/thread_info.h
Merging coresight/next (c749b99b9ade coresight: Fix reference count for software sources)
Merging rtc/rtc-next (04767b9fc231 dt-bindings: rtc: document the rtc-sh bindings)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (22486cb6d929 acpi, nfit: remove unnecessary newline)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Applying: Revert "KVM: PPC: Add MMIO emulation for remaining floating-point instructions"
Applying: Revert "KVM: PPC: Emulation for more integer loads and stores"
Applying: Revert "KVM: PPC: Add MMIO emulation for stdx (store doubleword indexed)"
Applying: Revert "KVM: PPC: Book3S: Add MMIO emulation for FP and VSX instructions"
Merging akpm-current/current (35ea10aa2207 sysv,ipc: cacheline align kern_ipc_perm)
Applying: linux-next-rejects
$ git checkout -b akpm remotes/origin/akpm/master
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: zero hash tables in allocator
Applying: mm: update callers to use HASH_ZERO flag
Applying: mm: adaptive hash table scaling
Applying: mm: introduce kv[mz]alloc helpers
Applying: mm: introduce kv[mz]alloc helpers - f2fs fix up
Applying: mm: support __GFP_REPEAT in kvmalloc_node for >32kB
Applying: lib/rhashtable.c: simplify a strange allocation pattern
Applying: net/ipv6/ila/ila_xlat.c: simplify a strange allocation pattern
Applying: fs/xattr.c: zero out memory copied to userspace in getxattr
Applying: treewide: use kv[mz]alloc* rather than opencoded variants
Applying: net: use kvmalloc with __GFP_REPEAT rather than open coded variant
Applying: drivers/md/dm-ioctl.c: use kvmalloc rather than opencoded variant
Applying: drivers/md/bcache/super.c: use kvmalloc
Applying: mm, vmalloc: use __GFP_HIGHMEM implicitly
Applying: scripts/spelling.txt: add "memory" pattern and fix typos
Applying: scripts/spelling.txt: Add regsiter -> register spelling mistake
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: treewide: spelling: correct diffrent[iate] and banlance typos
Applying: treewide: move set_memory_* functions away from cacheflush.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cacheflush.h
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
Applying: kref: remove WARN_ON for NULL release functions
Applying: drivers/scsi/megaraid: remove expensive inline from megasas_return_cmd
Applying: include/linux/uaccess.h: remove expensive WARN_ON in pagefault_disabled_dec
Applying: fs: semove set but not checked AOP_FLAG_UNINTERRUPTIBLE flag
Merging akpm/master (e7bdf14d8df7 fs: semove set but not checked AOP_FLAG_UNINTERRUPTIBLE flag)
