From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 21
Date: Thu, 21 Sep 2017 14:04:03 +1000
Message-ID: <20170921140403.240e3fd5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750795AbdIUEEG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Sep 2017 00:04:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170920:

Linus' tree lost its build failure.

The sound-asoc tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1337
 1200 files changed, 49498 insertions(+), 15649 deletions(-)

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

I am currently merging 267 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (c52f56a69d10 Merge tag 'trace-v4.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (25b080bd53f2 kbuild: rpm-pkg: fix version number handling)
Merging arc-current/for-curr (307b30e26861 ARC: [plat-eznps] Update platform maintainer as Noam left)
Merging arm-current/fixes (746a272e4414 ARM: 8692/1: mm: abort uaccess retries upon fatal signal)
Merging m68k-current/for-linus (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (8afafa6fba78 powerpc/kprobes: Update optprobes to use emulate_update_regs())
Merging sparc/master (6470812e2226 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (6cc40834b480 Merge branch 'hns3-tm-fixes')
Merging ipsec/master (23e9fcfef1f3 vti: fix NULL dereference in xfrm_input())
Merging netfilter/master (7f4f7dd4417d netfilter: ipset: ipset list may return wrong member count for set with timeout)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a715b3a0efe7 qtnfmac: cancel scans on wireless interface changes)
Merging mac80211/master (265698d7e613 nl80211: fix null-ptr dereference on invalid mesh configuration)
Merging sound-current/for-linus (0dcd020b7abb ALSA: usb-audio: Add sample rate quirk for Plantronics C310/C520-M)
Merging pci-current/for-linus (749aaf3372b8 PCI: endpoint: Use correct "end of test" interrupt)
Merging driver-core.current/driver-core-linus (850fdec8d2fd driver core: remove DRIVER_ATTR)
Merging tty.current/tty-linus (c91261437985 serial: sccnxp: Fix error handling in sccnxp_probe())
Merging usb.current/usb-linus (bd7a3fe770eb USB: fix out-of-bounds in usb_set_configuration)
Merging usb-gadget-fixes/fixes (7661ca09b2ff usb: gadget: dummy: fix nonsensical comparisons)
Merging usb-serial-fixes/usb-linus (c496ad835c31 USB: serial: cp210x: add support for ELV TFD500)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (974d4d03fc02 staging: vchiq_2835_arm: Fix NULL ptr dereference in free_pagelist)
Merging char-misc.current/char-misc-linus (aad8d097c922 nvmem: add missing of_node_put() in of_nvmem_cell_get())
Merging input-current/for-linus (bbc8608755da Merge branch 'next' into for-linus)
Merging crypto-current/master (e117765a117d crypto: af_alg - update correct dst SGL entry)
Merging ide/master (b671e1703394 PNP: ide: constify pnp_device_id)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (0ec1d92b5462 selftests: futex: Makefile: fix for lops in targets to run silently)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (1efdf1776e22 media: leds: as3645a: add V4L2_FLASH_LED_CLASS dependency)
Merging reset-fixes/reset/fixes (13541226dc05 ARC: reset: remove the misleading v1 suffix all over)
Merging drm-intel-fixes/for-linux-next-fixes (99df13b6ea81 drm/i915: Remove unused 'in_vbl' from i915_get_crtc_scanoutpos())
Merging drm-misc-fixes/for-linux-next-fixes (b0e07da3f5c8 qxl: fix primary surface handling)
Merging kbuild/for-next (25b080bd53f2 kbuild: rpm-pkg: fix version number handling)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (6d57339890c9 dma-coherent: fix rmem_dma_device_init regression)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (cc4a41fe5541 Linux 4.13-rc7)
Merging arm/for-next (67715a8964fc Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (e884f80cf2a7 arm64: perf: add support for Cortex-A35)
Merging arm-soc/for-next (ed3b42e5f399 ARM: SoC: Document merges)
Merging actions/for-next (2a6a17c006da Merge branch 'v4.15/dt' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (293cd5ae9884 Merge branch 'v4.14/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (0eead81e7847 Merge branches 'dt-for-v4.14' and 'defconfig-for-v4.14' into for-next)
Merging at91/at91-next (819b0a26fdd8 Merge tag 'at91-fixes' into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (d65a19177f18 Merge branch 'imx/dt64' into for-next)
Merging keystone/next (f922ce7bbcf5 Merge branch 'for_4.14/keystone_dts' into next)
Merging mvebu/for-next (80690b5be637 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (fa2cc631e60b Merge branch 'omap-for-v4.15/soc' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (fe6e31a04ae1 reset: socfpga: build the reset-socfpga for Stratix10 SOC)
Merging qcom/for-next (b212aba8f7bf Merge tag 'qcom-drivers-for-4.14' into final-for-sure-4.14)
Merging realtek/for-next (74e912bc01df Merge branch 'v4.15/dt64' into next)
Merging renesas/next (edf018e8ea1c Merge branches 'arm64-defconfig-for-v4.15', 'arm64-dt-for-v4.15', 'defconfig-for-v4.15', 'drivers-for-v4.15', 'dt-bindings-for-v4.15', 'dt-for-v4.15' and 'soc-for-v4.15' into next)
Merging rockchip/for-next (8b6f2c854c24 Merge branch 'v4.14-clk/fixes' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (1cb686c08d12 ARM: dts: exynos: Add status property to Exynos 542x Mixer nodes)
Merging sunxi/sunxi/for-next (eebe1700cebf Merge branches 'sunxi/clk-for-4.15', 'sunxi/dt-for-4.15' and 'sunxi/dt64-for-4.15' into sunxi/for-next)
Merging tegra/for-next (b4aed883ebbe Merge branch for-4.14/arm/defconfig into for-next)
Merging arm64/for-next/core (d1be5c99a034 arm64: cleanup {COMPAT_,}SET_PERSONALITY() macro)
Merging clk/clk-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging clk-samsung/for-next (599cebea93e6 clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging m68knommu/for-next (6a3f01a0f87b m68k: allow ColdFire m5441x parts to run with MMU enabled)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (9de59ab25ca4 microblaze: Add missing kvm_para.h to Kbuild)
Merging mips/mips-for-linux-next (0e25207cab0f Merge branch '4.14-fixes' into mips-for-linux-next)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (56ce2f25ab0d openrisc: add forward declaration for struct vm_area_struct)
Merging parisc-hd/for-next (b28210912d38 parisc: Add CPU topology support)
Merging powerpc/next (265601f034df powerpc/xive: Fix section __init warning)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (9ea4aa40495d s390/zcrypt: Explicitly check input data length.)
Merging sparc-next/master (d719518d9ce9 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (637f23abca87 tile: array underflow in setup_maxnodemem())
Merging uml/linux-next (6d20e6b235aa um: return negative in tuntap_open_tramp())
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (677410d3c8eb Merge branch 'for-next-next-v4.14-20170914' into for-next-20170914)
CONFLICT (content): Merge conflict in fs/btrfs/root-tree.c
Merging ceph/master (717e6f2893eb ceph: avoid panic in create_session_open_msg() if utsname() returns NULL)
Merging cifs/for-next (f5c4ba816315 cifs: release auth_key.response for reconnect.)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (0ab0b271bf75 isofs: fix build regression)
Merging ext4/dev (b5f515735bea ext4: avoid Y2038 overflow in recently_deleted())
Merging f2fs/dev (e6c6de18f010 f2fs: hurry up to issue discard after io interruption)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (5b97eeacbd80 fuse: getattr cleanup)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging nfsd/nfsd-next (7d34cd12061d MAINTAINERS: associate linux/fs.h with VFS instead of file locking)
Merging orangefs/for-next (0b08273c8ab7 orangefs: Adjust three checks for null pointers)
Merging overlayfs/overlayfs-next (939ae4efd51c ovl: fix false positive ESTALE on lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (89b68cd92663 UBI: Fix two typos in comments)
Merging xfs/for-next (6c370590cfe0 xfs: use kmem_free to free return value of kmem_zalloc)
Merging file-locks/locks-next (3b9f8ed25dbe Merge branch 'for-4.14' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata)
Merging vfs/for-next (f8340cc34799 mips: switch to {get,put}_compat_sigset())
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (077a1cc06f72 printk: Clean up do_syslog() error handling)
Merging pci/next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging pstore/for-next/pstore (c71b02e4d207 Revert "pstore: Honor dmesg_restrict sysctl on dmesg dumps")
Merging hid/for-next (abbc4db7a3a0 Merge branch 'for-4.14/upstream' into for-next)
Merging i2c/i2c/for-next (aeb068c57214 i2c: i2c-stm32f7: add driver)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (18f317345038 firmware: dmi: Optimize dmi_matches)
Merging hwmon-staging/hwmon-next (0fc85a358283 hwmon: (sht15) remove redundant check on status and send of status value)
Merging jc_docs/docs-next (6fad4e69e835 kokr/memory-barriers.txt: Apply atomic_t.txt change)
Merging v4l-dvb/master (1efdf1776e22 media: leds: as3645a: add V4L2_FLASH_LED_CLASS dependency)
Merging v4l-dvb-next/master (1efdf1776e22 media: leds: as3645a: add V4L2_FLASH_LED_CLASS dependency)
Merging fbdev/fbdev-for-next (23e9f4ef99dd video/console: Update BIOS dates list for GPD win console rotation DMI quirk)
Merging pm/linux-next (b2f8e7b8d694 Merge branch 'acpi-properties' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (02bc1bd0498c Merge branch 'imx-nvmem' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (1ce8ed7eff15 DLM: fix NULL pointer dereference in send_to_sock())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (34929cb4d691 cxgb4: add new T5 pci device id's)
CONFLICT (content): Merge conflict in lib/kobject_uevent.c
Merging ipsec-next/master (8598112d04af xfrm: Fix return value check of copy_sec_ctx.)
Merging netfilter-next/master (80cee03bf1d6 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (e9a3846afaa4 mwifiex: use get_random_mask_addr() helper)
Merging bluetooth/master (493668b457c3 ieee802154: fix gcc-4.9 warnings)
Merging mac80211-next/master (ed554136b0a8 nl80211: add an option to allow MFP without requiring it)
Merging rdma/for-next (c50c98d38291 Merge branch 'k.o/net-next-base' into k.o/for-next-merged-2)
Merging gfs2/for-next (fdc47b4f0c23 gfs2: Fix debugfs glocks dump)
Merging mtd/master (73600b619bf8 mtd: nand: remove unused blockmask variable)
Merging l2-mtd/master (d1f936d73683 Merge tag 'nand/for-4.14' of git://git.infradead.org/l2-mtd into mtd/next)
Merging nand/nand/next (2d2a2b8c080a mtd: nand: complain loudly when chip->bits_per_cell is not correctly initialized)
Merging spi-nor/spi-nor/next (90074de6630f mtd: spi-nor: fix DMA unsafe buffer issue in spi_nor_read_sfdp())
Merging crypto/master (2d45a7e89833 crypto: af_alg - get_page upon reassignment to TX SGL)
Merging drm/drm-next (47e0cd6b1dbb Merge branch 'drm-next-4.14' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (4babc5e27cfd drm/i915: remove redundant variable hw_check)
CONFLICT (content): Merge conflict in drivers/media/v4l2-core/videobuf2-dma-contig.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_execbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
Merging drm-tegra/drm/tegra/for-next (65d5d30ccebd drm/tegra: trace: Fix path to include)
Merging drm-misc/for-linux-next (f44d85389e17 drm: rename u32 in __u32 in uapi)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (642e5ef8c6c4 drm/msm: fix _NO_IMPLICIT fencing case)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (9303519985ed drm/imx: parallel-display: use correct connector enum)
Merging etnaviv/etnaviv/next (65375b873cb5 drm/etnaviv: switch GEM allocations to __GFP_RETRY_MAYFAIL)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (1874021ec3a8 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (729fbfc92a45 ALSA: line6: add support for POD HD DESKTOP)
Merging sound-asoc/for-next (779db2820564 Merge remote-tracking branches 'asoc/topic/ts3a277e', 'asoc/topic/wm97xx' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (697c5d8a3676 Input: i8042 - add Gigabyte P57 to the keyboard reset table)
Merging block/for-next (50305e13dc24 Merge branch 'for-4.14/block-postmerge' into for-next)
CONFLICT (content): Merge conflict in mm/page_io.c
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (c3ca015fab6d dax: remove the pmem_dax_ops->flush abstraction)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (d32df218819d Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (184a09eb9a2f md/raid5: preserve STRIPE_ON_UNPLUG_LIST in break_stripe_batch_list)
Merging mfd/for-mfd-next (b01e9348e106 mfd: intel_soc_pmic: Differentiate between Bay and Cherry Trail CRC variants)
Merging backlight/for-backlight-next (2606706e4d7b backlight: gpio_backlight: Delete pdata inversion)
Merging battery/for-next (5d01fd38a3b0 power: supply: bq27xxx: enable writing capacity values for bq27421)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging security/next (10e3781dda77 Revert "ima: use fs method to read integrity data")
Merging integrity/next (ed301d2614d2 ima: define "fs_unsafe" builtin policy)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (7c620ece125c selinux: Use kmem_cache for hashtab_node)
Merging tpmdd/next (6227756a7b0a tpm/tpm_crb: Use start method value from ACPI table directly)
Merging watchdog/master (4cb30b044a8f watchdog: mei_wdt: constify mei_cl_device_id)
Merging iommu/next (6942e78ae429 Merge branches 'arm/omap', 'arm/exynos' and 'iommu/fixes' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (417fb50d5516 vfio: platform: constify amba_id)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (462d9d959613 audit: use audit_set_enabled() in audit_enable())
Merging devicetree/for-next (35f3c9845485 scripts/dtc: dtx_diff - 2nd update of include dts paths to match build)
Merging mailbox/mailbox-for-next (1da92afbbfcd mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll)
Merging spi/for-next (442f4e787ddd Merge remote-tracking branches 'spi/topic/davinci', 'spi/topic/imx', 'spi/topic/rspi', 'spi/topic/slave' and 'spi/topic/spreadtrum' into spi-next)
Merging tip/auto-latest (dc1fb16d0a77 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (acdbb48efecb MAINTAINERS: Fix path and add bindings to timers)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (398443471f16 EDAC, mce_amd: Get rid of local var in amd_filter_mce())
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (170b3b1050e2 tracing: Apply trace_clock changes to instance max buffer)
Merging rcu/rcu/next (cb7f8519a489 timers: Adjust timeout at CPU-offline migration)
Merging kvm/linux-next (4f350c6dbcb9 kvm: nVMX: Handle deferred early VMLAUNCH/VMRESUME failure properly)
Merging kvm-arm/next (9b87e7a8bfb5 KVM: arm/arm64: Support uaccess of GICC_APRn)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (67f8a8c1151c KVM: PPC: Book3S HV: Fix bug causing host SLB to be restored incorrectly)
Merging kvms390/next (c95c895303ed KVM: s390: vsie: cleanup mcck reinjection)
Merging xen-tip/linux-next (0555ac4333d7 xen, arm64: drop dummy lookup_address())
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (ebb2c2437d80 Merge tag 'mmc-v4.14-2' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc)
Merging drivers-x86/for-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (f292bbfaa69d leds: Replace flags bit shift with BIT() macros)
Merging ipmi/for-next (80a469559980 ipmi: Remove the device id from ipmi_register_smi())
Merging driver-core/driver-core-next (fb7ff3f8721b cpuinfo: implement sysfs nodes for arm64)
Merging usb/usb-next (38502ef49f96 usb: storage: make const arrays static, reduces object code size)
Merging usb-gadget/next (0852659ef071 usb: gadget: f_ncm/u_ether: Move 'SKB reserve' quirk setup to u_ether)
Merging usb-serial/usb-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging usb-chipidea-next/ci-for-usb-next (dfebb5f43a78 usb: chipidea: Add support for Tegra20/30/114/124)
Merging phy-next/next (d9c51f4c53ae phy: brcm-sata: fix a timeout test in init)
Merging tty/tty-next (be7da1a2b714 serial: imx: default to half duplex rs485)
Merging char-misc/char-misc-next (e701c67c30e6 nvmem: remove unneeded IS_ENABLED(CONFIG_NVMEM) conditional)
Merging extcon/extcon-next (f12c89504cb8 extcon: make extcon_info static const, fixes warning)
Merging staging/staging-next (c3eec59659cf staging: lustre: ptlrpc: kfree used instead of kvfree)
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (4fccd758036d Merge branch 'topic/xilinx' into next)
Merging cgroup/for-next (9c3bace4684b Merge branch 'for-4.13-fixes' into for-next)
Merging scsi/for-next (3e0097499839 scsi: sg: fixup infoleak when using SG_GET_REQUEST_TABLE)
Merging scsi-mkp/for-next (3882a734c19b Fix up MAINTAINERS file sorting)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (9826313227fe Merge branch 'for-4.15' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ac7380709f65 vhost: fix end of range for access_ok)
Merging rpmsg/for-next (7148e5c13dd7 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (64bbd57d4d2f Merge branch 'devel' into for-next)
Merging pinctrl/for-next (12b136dec281 pinctrl: uniphier: make arrays static, reduces object code size)
Merging pinctrl-samsung/for-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging pwm/for-next (7755daf5e7e8 Merge branch 'for-4.14/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (076a9bcacfc7 signal/mips: Remove FPE_FIXME usage from mips)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (096d08d830e9 coresight: Extend the PIDR mask to cover relevant bits in PIDR2)
Merging rtc/rtc-next (46c1e79fee41 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (04c3c982fcc0 libnvdimm, btt: fix format string warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb624a11ecd5 Merge branch 'for-next/secureexec' into for-next/kspp)
Merging akpm-current/current (a443333ea9bb kernel-reboot-add-devm_register_reboot_notifier-fix)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: iopoll: avoid -Wint-in-bool-context warning
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (d377ef5d8407 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
