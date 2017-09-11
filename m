From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 11
Date: Mon, 11 Sep 2017 13:02:55 +1000
Message-ID: <20170911130255.43b6e16a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751963AbdIKDC6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Sep 2017 23:02:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Please do not add any v4.15 related material to your linux-next
included branches until after v4.14-rc1 has been released.

Changes since 20170908:

The watchdog tree gained a conflict against the arm-soc tree.

The aio tree gained a conflict against the vfs tree.

The akpm-current tree still had its build failure for which I applied
a fix patch.

Non-merge commits (relative to Linus' tree): 1830
 2014 files changed, 77242 insertions(+), 18986 deletions(-)

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
Merging origin/master (d719518d9ce9 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (64236e315955 kbuild: update comments of Makefile.asm-generic)
Merging arc-current/for-curr (1ee55a8f7f6b ARC: Re-enable MMU upon Machine Check exception)
Merging arm-current/fixes (746a272e4414 ARM: 8692/1: mm: abort uaccess retries upon fatal signal)
Merging m68k-current/for-linus (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (1a92a80ad386 powerpc/mm: Ensure cpumask update is ordered)
Merging sparc/master (6470812e2226 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (1f4f554a72be net: qualcomm: rmnet: Fix a double free)
Merging ipsec/master (f581a0dd744f wl1251: add a missing spin_lock_init())
Merging netfilter/master (90c4ae4e2c1d netfilter: xt_hashlimit: fix build error caused by 64bit division)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (f957dd3c8db2 brcmfmac: feature check for multi-scheduled scan fails on bcm4345 devices)
Merging mac80211/master (126f760ca94d rds: Fix incorrect statistics counting)
Merging sound-current/for-linus (2a0d85d9add7 ALSA: asihpi: Kill BUG_ON() usages)
Merging pci-current/for-linus (8e1101d25164 PCI/MSI: Don't warn when irq_create_affinity_masks() returns NULL)
Merging driver-core.current/driver-core-linus (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging tty.current/tty-linus (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging usb.current/usb-linus (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging usb-gadget-fixes/fixes (b7d44c36a6f6 usb: renesas_usbhs: gadget: fix unused-but-set-variable warning)
Merging usb-serial-fixes/usb-linus (fd1b8668af59 USB: serial: option: add D-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging char-misc.current/char-misc-linus (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging input-current/for-linus (a6cbfa1e6d38 Merge branch 'next' into for-linus)
Merging crypto-current/master (2d45a7e89833 crypto: af_alg - get_page upon reassignment to TX SGL)
Merging ide/master (b671e1703394 PNP: ide: constify pnp_device_id)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (622b2fbe625b selftests: timers: freq-step: fix compile error)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (4cd7d6c957b0 media: get rid of removed DMX_GET_CAPS and DMX_SET_SOURCE leftovers)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (cc4a41fe5541 Linux 4.13-rc7)
Merging drm-misc-fixes/for-linux-next-fixes (79964dbaf662 drm/bridge/sii8620: Fix memory corruption)
Merging kbuild/for-next (cf67100b797d Merge branch 'kbuild' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (d35b0996fef3 dma-coherent: fix dma_declare_coherent_memory() logic error)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (cc4a41fe5541 Linux 4.13-rc7)
Merging arm/for-next (67715a8964fc Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (e884f80cf2a7 arm64: perf: add support for Cortex-A35)
Merging arm-soc/for-next (765a385caf94 ARM: SoC: Document merges)
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328-evb.dts
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
Merging actions/for-next (7d5700467a94 Merge branch 'v4.14/dt64' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (293cd5ae9884 Merge branch 'v4.14/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (0eead81e7847 Merge branches 'dt-for-v4.14' and 'defconfig-for-v4.14' into for-next)
Merging at91/at91-next (569dbb88e80d Linux 4.13)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (b90b6c45ff6b Merge branch 'zte/dt64' into for-next)
Merging keystone/next (f922ce7bbcf5 Merge branch 'for_4.14/keystone_dts' into next)
Merging mvebu/for-next (b9d2ea8a7107 Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (a70cb93b6c2f Merge branch 'omap-for-v4.14/dt-v3' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (ac0c735ac3dd reset: uniphier: add analog amplifiers reset control)
Merging qcom/for-next (b212aba8f7bf Merge tag 'qcom-drivers-for-4.14' into final-for-sure-4.14)
Merging realtek/for-next (932a3d80019d Merge branch 'v4.14/dt64' into next)
Merging renesas/next (e6bf13206283 Merge branches 'arm64-dt-for-v4.14', 'dt-bindings-for-v4.14' and 'dt-for-v4.14' into next)
Merging rockchip/for-next (23b856f7af3c Merge branch 'v4.14-armsoc/dts64' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328-evb.dts
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (e6f2efc1a7da Merge branch 'next/soc' into for-next)
Merging sunxi/sunxi/for-next (a5cedb2ecb7f Merge branch 'sunxi/clk-for-4.14' into sunxi/for-next)
Merging tegra/for-next (b4aed883ebbe Merge branch for-4.14/arm/defconfig into for-next)
Merging arm64/for-next/core (d1be5c99a034 arm64: cleanup {COMPAT_,}SET_PERSONALITY() macro)
Merging clk/clk-next (73c950da6ec5 clk: si5351: fix PLL reset)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging clk-samsung/for-next (599cebea93e6 clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging m68knommu/for-next (8a1943492bd6 m68knommu: remove dead code)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (094032707c2c Merge branches '4.13-fixes' and '4.14-features' into mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/phy/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/irq-mips-gic.c
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (56ce2f25ab0d openrisc: add forward declaration for struct vm_area_struct)
Merging parisc-hd/for-next (569dbb88e80d Linux 4.13)
Merging powerpc/next (265601f034df powerpc/xive: Fix section __init warning)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (e443343e509a s390/dasd: blk-mq conversion)
Merging sparc-next/master (b6fe1089667a sparc64: Handle additional cases of no fault loads)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (637f23abca87 tile: array underflow in setup_maxnodemem())
Merging uml/linux-next (2fb44600fe78 um: Fix check for _xstate for older hosts)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
CONFLICT (content): Merge conflict in fs/btrfs/compression.h
Merging btrfs-kdave/for-next (d112b114021d Merge branch 'for-next-next-v4.14-20170822' into for-next-20170822)
Merging ceph/master (15b51bd6badb ceph: stop on-going cached readdir if mds revokes FILE_SHARED cap)
Merging cifs/for-next (5b6d827f246f cifs: check rsp for NULL before dereferencing in SMB2_open)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (9b8d51f53833 Merge dnotify cleanup from branch 'for_next_testing' into for_next.)
Merging ext4/dev (b5f515735bea ext4: avoid Y2038 overflow in recently_deleted())
Merging f2fs/dev (27161f13e3c3 f2fs: avoid race in between read xattr & write xattr)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9183976ef1c8 fuse: set mapping error in writepage_locked when it fails)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (1bd5d6d08ea7 NFS: Count the bytes of skipped subrequests in nfs_lock_and_join_requests())
Merging nfsd/nfsd-next (26fb2254dd33 svcrdma: Estimate Send Queue depth properly)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (7c6893e3c9ab ovl: don't allow writing ioctl on lower layer)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a6664433d383 ubifs: Set double hash cookie also for RENAME_EXCHANGE)
Merging xfs/for-next (6c370590cfe0 xfs: use kmem_free to free return value of kmem_zalloc)
Merging file-locks/locks-next (3b9f8ed25dbe Merge branch 'for-4.14' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata)
Merging vfs/for-next (976a5f29dd6b Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/read_write.c
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (077a1cc06f72 printk: Clean up do_syslog() error handling)
Merging pci/next (cf2d804110d3 Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (c71b02e4d207 Revert "pstore: Honor dmesg_restrict sysctl on dmesg dumps")
Merging hid/for-next (abbc4db7a3a0 Merge branch 'for-4.14/upstream' into for-next)
Merging i2c/i2c/for-next (2f1db5e1f86f Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (f996c4155d0d dmi: Mark all struct dmi_system_id instances const)
CONFLICT (content): Merge conflict in drivers/acpi/sbs.c
CONFLICT (content): Merge conflict in drivers/acpi/blacklist.c
Merging hwmon-staging/hwmon-next (7074d0a92758 hwmon: (ltq-cputemp) add cpu temp sensor driver)
Merging jc_docs/docs-next (6fad4e69e835 kokr/memory-barriers.txt: Apply atomic_t.txt change)
Merging v4l-dvb/master (1efdf1776e22 media: leds: as3645a: add V4L2_FLASH_LED_CLASS dependency)
Merging v4l-dvb-next/master (4cd7d6c957b0 media: get rid of removed DMX_GET_CAPS and DMX_SET_SOURCE leftovers)
Merging fbdev/fbdev-for-next (23e9f4ef99dd video/console: Update BIOS dates list for GPD win console rotation DMI quirk)
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbmem.c
Merging pm/linux-next (7f8122a4e8c8 Merge branch 'acpi-apei' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (91f5b61c3d53 Merge branches 'thermal-core', 'thermal-intel', 'thermal-soc' and 'const-thermal-zone-structure' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (1c2428537241 dlm: use sock_create_lite inside tcp_accept_from_sock)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (ad9a19d00370 Merge tag 'nfsd-4.14' of git://linux-nfs.org/~bfields/linux)
Merging ipsec-next/master (8598112d04af xfrm: Fix return value check of copy_sec_ctx.)
Merging netfilter-next/master (80cee03bf1d6 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (eb464d4a8d09 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (f5f3dc0abf8b Bluetooth: btqcomsmd: retrieve BD address from DT property)
Merging mac80211-next/master (80cee03bf1d6 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging rdma/for-next (c50c98d38291 Merge branch 'k.o/net-next-base' into k.o/for-next-merged-2)
Merging gfs2/for-next (309e8cda596f gfs2: preserve i_mode if __gfs2_set_acl() fails)
Merging mtd/master (be3e83e3471c mtd: nand: atmel: Relax tADL_min constraint)
Merging l2-mtd/master (d1f936d73683 Merge tag 'nand/for-4.14' of git://git.infradead.org/l2-mtd into mtd/next)
Merging nand/nand/next (2d2a2b8c080a mtd: nand: complain loudly when chip->bits_per_cell is not correctly initialized)
Merging spi-nor/spi-nor/next (90074de6630f mtd: spi-nor: fix DMA unsafe buffer issue in spi_nor_read_sfdp())
Merging crypto/master (2d45a7e89833 crypto: af_alg - get_page upon reassignment to TX SGL)
Merging drm/drm-next (7846b12fe0b5 Merge branch 'drm-vmwgfx-next' of git://people.freedesktop.org/~syeh/repos_linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (426ca2cb69cd Merge tag 'gvt-fixes-2017-09-06' of https://github.com/01org/gvt-linux into drm-intel-next-fixes)
Merging drm-tegra/drm/tegra/for-next (65d5d30ccebd drm/tegra: trace: Fix path to include)
Merging drm-misc/for-linux-next (f44d85389e17 drm: rename u32 in __u32 in uapi)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (0502a625c2ee drm/msm: fix error path cleanup)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (9303519985ed drm/imx: parallel-display: use correct connector enum)
Merging etnaviv/etnaviv/next (65375b873cb5 drm/etnaviv: switch GEM allocations to __GFP_RETRY_MAYFAIL)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (1874021ec3a8 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (2a0d85d9add7 ALSA: asihpi: Kill BUG_ON() usages)
Merging sound-asoc/for-next (469e95940406 Merge remote-tracking branches 'asoc/topic/ac97', 'asoc/topic/cs43130' and 'asoc/topic/fsl' into asoc-next)
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (3e5b08518f6a Input: add a driver for PWM controllable vibrators)
Merging block/for-next (50305e13dc24 Merge branch 'for-4.14/block-postmerge' into for-next)
CONFLICT (content): Merge conflict in mm/page_io.c
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (b917c6d18c03 mmc: cavium: Fix use-after-free in of_platform_device_destroy)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (184a09eb9a2f md/raid5: preserve STRIPE_ON_UNPLUG_LIST in break_stripe_batch_list)
Merging mfd/for-mfd-next (b01e9348e106 mfd: intel_soc_pmic: Differentiate between Bay and Cherry Trail CRC variants)
Merging backlight/for-backlight-next (2606706e4d7b backlight: gpio_backlight: Delete pdata inversion)
Merging battery/for-next (5d01fd38a3b0 power: supply: bq27xxx: enable writing capacity values for bq27421)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f039685b2e3a Merge remote-tracking branches 'regulator/topic/rc5t619' and 'regulator/topic/stm32-vref' into regulator-next)
Merging security/next (10e3781dda77 Revert "ima: use fs method to read integrity data")
Merging integrity/next (ed301d2614d2 ima: define "fs_unsafe" builtin policy)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (0c3014f22dec selinux: constify nf_hook_ops)
Merging tpmdd/next (6227756a7b0a tpm/tpm_crb: Use start method value from ACPI table directly)
Merging watchdog/master (4cb30b044a8f watchdog: mei_wdt: constify mei_cl_device_id)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
Merging iommu/next (47b59d8e4085 Merge branches 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'arm/omap', 'arm/mediatek', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/vt-d', 'x86/amd', 's390' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (417fb50d5516 vfio: platform: constify amba_id)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (196a5085592c audit: update the function comments)
Merging devicetree/for-next (84024468cf16 devicetree: Adjust status "ok" -> "okay" under drivers/of/)
Merging mailbox/mailbox-for-next (1da92afbbfcd mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll)
Merging spi/for-next (ecb478bf866b Merge remote-tracking branch 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (bdc56fb7a7f9 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (398443471f16 EDAC, mce_amd: Get rid of local var in amd_filter_mce())
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (170b3b1050e2 tracing: Apply trace_clock changes to instance max buffer)
Merging rcu/rcu/next (656e7c0c0a2e Merge branches 'doc.2017.08.17a', 'fixes.2017.08.17a', 'hotplug.2017.07.25b', 'misc.2017.08.17a', 'spin_unlock_wait_no.2017.08.17a', 'srcu.2017.07.27c' and 'torture.2017.07.24c' into HEAD)
Merging kvm/linux-next (5f54c8b2d4fa Merge branch 'kvm-ppc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc)
Merging kvm-arm/next (9b87e7a8bfb5 KVM: arm/arm64: Support uaccess of GICC_APRn)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (43f6b0cfb2e4 KVM: PPC: Book3S HV: Fix memory leak in kvm_vm_ioctl_get_htab_fd)
Merging kvms390/next (c95c895303ed KVM: s390: vsie: cleanup mcck reinjection)
Merging xen-tip/linux-next (d785d9ec7894 xen/mmu: set MMU_NORMAL_PT_UPDATE in remap_area_mfn_pte_fn)
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (f7db01f6cbac Merge branch 'for-4.14' into for-next)
Merging drivers-x86/for-next (00ebbeb39b70 platform/x86: dell-wmi: Update dell_wmi_check_descriptor_buffer() to new model)
Merging chrome-platform/for-next (69237e85ece7 platform/chrome: cros_ec: register shutdown function for debugfs)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (1591caf2d5ea leds: pca955x: check for I2C errors)
Merging ipmi/for-next (80a469559980 ipmi: Remove the device id from ipmi_register_smi())
Merging driver-core/driver-core-next (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging usb/usb-next (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging usb-gadget/next (0852659ef071 usb: gadget: f_ncm/u_ether: Move 'SKB reserve' quirk setup to u_ether)
Merging usb-serial/usb-next (b5fdde28d4b7 USB: serial: option: simplify 3 D-Link device entries)
Merging usb-chipidea-next/ci-for-usb-next (dfebb5f43a78 usb: chipidea: Add support for Tegra20/30/114/124)
Merging phy-next/next (d9c51f4c53ae phy: brcm-sata: fix a timeout test in init)
Merging tty/tty-next (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging char-misc/char-misc-next (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging extcon/extcon-next (4243c408f740 extcon: max77693: Allow MHL attach notifier)
Merging staging/staging-next (d34fc1adf01f Merge branch 'akpm' (patches from Andrew))
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (7024d0a3f107 Merge branch 'for-linus' into next)
Merging cgroup/for-next (9c3bace4684b Merge branch 'for-4.13-fixes' into for-next)
Merging scsi/for-next (5462e1f38eaa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (9189e380e2d3 scsi: qla2xxx: Fix an integer overflow in sysfs code)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (2ca77e8f558b Merge branch 'for-4.14' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ac7380709f65 vhost: fix end of range for access_ok)
Merging rpmsg/for-next (7148e5c13dd7 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (02b6bddb0b0a gpio: mockup: remove unused variable gc)
Merging pinctrl/for-next (ac059e2aa01d Revert "pinctrl: sunxi: Don't enforce bias disable (for now)")
Merging pinctrl-samsung/for-next (bbed85f45b2b pinctrl: samsung: Remove unneeded local variable initialization)
Merging pwm/for-next (7755daf5e7e8 Merge branch 'for-4.14/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (076a9bcacfc7 signal/mips: Remove FPE_FIXME usage from mips)
CONFLICT (content): Merge conflict in arch/mips/kernel/traps.c
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (eb5263749f68 aio: handle integer overflow in io_getevents() timespec usage)
CONFLICT (content): Merge conflict in fs/aio.c
Merging kselftest/next (369130b63178 selftests: Enhance kselftest_harness.h to print which assert failed)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (817ee52788a5 coresight: Extend the PIDR mask to cover relevant bits in PIDR2)
Merging rtc/rtc-next (b4be271cebb6 rtc: ds1307: use octal permissions)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (04c3c982fcc0 libnvdimm, btt: fix format string warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb624a11ecd5 Merge branch 'for-next/secureexec' into for-next/kspp)
Merging akpm-current/current (b57e644ad05d kernel-reboot-add-devm_register_reboot_notifier-fix)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/media/cec/cec-adap.c: fix build with gcc-4.4.4
Applying: fscache: fix fscache_objlist_show format processing
Applying: IB/mlx4: fix sprintf format warning
Applying: iopoll: avoid -Wint-in-bool-context warning
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: treewide: remove GFP_TEMPORARY allocation flag
Applying: treewide-remove-gfp_temporary-allocation-flag-fix
Applying: treewide-remove-gfp_temporary-allocation-flag-checkpatch-fixes
Applying: drm/i915: fix up for mm: treewide: remove GFP_TEMPORARY allocation flag
Applying: arm64: stacktrace: avoid listing stacktrace functions in stacktrace
Applying: mm, page_owner: skip unnecessary stack_trace entries
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (6cfc8998d314 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
