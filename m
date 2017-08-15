From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 15
Date: Tue, 15 Aug 2017 17:35:52 +1000
Message-ID: <20170815173552.64aa38c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49609 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753185AbdHOHfz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Aug 2017 03:35:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170811:

The net-next tree gained a conflict against the rockchip tree and a
build failure for which I reverted a commit.

The rcu tree interaction with the tip has been fixed up.

The staging tree lost its overnight build failures.

The complex conflict between the akpm-current tree and the tip tree was
fixed up in the tip tree.

Non-merge commits (relative to Linus' tree): 6033
 6078 files changed, 236894 insertions(+), 117259 deletions(-)

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

I am currently merging 268 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (fcd07350007b Merge tag 'md/4.13-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shli/md)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (4e433fc4d1a9 fixdep: trivial: typo fix and correction)
Merging arc-current/for-curr (a8ec3ee861b6 arc: Mask individual IRQ lines during core INTC init)
Merging arm-current/fixes (1abd35023763 ARM: align .data section)
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (96ea91e7b6ee powerpc/watchdog: add locking around init/exit functions)
Merging sparc/master (9157259d16a8 mm: add pmd_t initializer __pmd() to work around a GCC bug.)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (59a361bc6f6e tipc: avoid inheriting msg_non_seq flag when message is returned)
Merging ipsec/master (4ff0308f06da esp: Fix error handling on layer 2 xmit.)
Merging netfilter/master (9beceb54fa2c netfilter: x_tables: Fix use-after-free in ipt_do_table.)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (e9bf53ab1ee3 brcmfmac: feature check for multi-scheduled scan fails on bcm4343x devices)
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (8df4b0031067 ALSA: hda/realtek - Fix pincfg for Dell XPS 13 9370)
Merging pci-current/for-linus (8466489ef5ba xhci: Reset Renesas uPD72020x USB controller for 32-bit DMA issue)
Merging driver-core.current/driver-core-linus (ef954844c7ac Linux 4.13-rc5)
Merging tty.current/tty-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb.current/usb-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb-gadget-fixes/fixes (b7d44c36a6f6 usb: renesas_usbhs: gadget: fix unused-but-set-variable warning)
Merging usb-serial-fixes/usb-linus (fd1b8668af59 USB: serial: option: add D-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (ef954844c7ac Linux 4.13-rc5)
Merging char-misc.current/char-misc-linus (ef954844c7ac Linux 4.13-rc5)
Merging input-current/for-linus (293b915fd9be Input: trackpoint - assume 3 buttons when buttons detection fails)
Merging crypto-current/master (8861249c740f crypto: x86/sha1 - Fix reads beyond the number of blocks passed)
Merging ide/master (921edf312a6a ide: avoid warning for timings calculation)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (622b2fbe625b selftests: timers: freq-step: fix compile error)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (0659445f4758 media: staging: atomisp: sh_css_calloc shall return a pointer to the allocated space)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (781cc76e0c24 drm/i915: Avoid the gpu reset vs. modeset deadlock)
Merging drm-misc-fixes/for-linux-next-fixes (1724c7c0c949 Merge origin/master into drm-misc-fixes)
Merging kbuild/for-next (4e433fc4d1a9 fixdep: trivial: typo fix and correction)
Merging uuid/for-next (832e4c83abc5 uuid: remove uuid_be)
Merging dma-mapping/for-next (878ec36765fa ARM: NOMMU: Wire-up default DMA interface)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (6f8119230ed0 ARC: set boot print log level to PR_INFO)
Merging arm/for-next (862f4c2c1e06 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (5771a8c08880 Linux v4.13-rc1)
Merging arm-soc/for-next (41c454fa0e86 Merge tag 'davinci-fixes-for-v4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci into fixes)
Merging actions/for-next (253d192bc4aa Merge branch 'v4.14/dt' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (3a5fd3ca8f08 Merge branch 'v4.14/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (01c1fe77824e Merge branch 'at91-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (b90b6c45ff6b Merge branch 'zte/dt64' into for-next)
Merging keystone/next (f922ce7bbcf5 Merge branch 'for_4.14/keystone_dts' into next)
Merging mvebu/for-next (25a3042cceae Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (4e61d1da8cc6 Merge branch 'omap-for-v4.14/dt-v3' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (ac0c735ac3dd reset: uniphier: add analog amplifiers reset control)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging qcom/for-next (2ab014d39cd5 soc: qcom: mdt_loader: Use request_firmware_into_buf())
Merging realtek/for-next (b18ab60120b9 Merge branch 'v4.14/dt64' into next)
Merging renesas/next (3cdd70d1d5b8 Merge branch 'dt-for-v4.14' into next)
Merging rockchip/for-next (79b4edf09d2f Merge branch 'v4.14-armsoc/dts32' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3288.dtsi
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (86247b536cd0 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (ab09a15651d9 Merge branch 'sunxi/clk-for-4.14' into sunxi/for-next)
Merging tegra/for-next (20e72aa386b0 Merge branch for-4.14/arm/defconfig into for-next)
Merging arm64/for-next/core (82d24d114f24 arm64: compat: Remove leftover variable declaration)
Merging clk/clk-next (8e7be401f2f5 Merge branch 'clk-fixes' into clk-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging clk-samsung/for-next (599cebea93e6 clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL)
Merging c6x/for-linux-next (eab89e215ae4 c6x: defconfig: Cleanup from old Kconfig options)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (b01409093793 m68k: allow NULL clock for clk_get_rate)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (aa9a357f236f Merge branches '4.13-fixes' and '4.13-fp-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (6f7da290413b Linux 4.12)
Merging powerpc/next (df4c79831894 powerpc/xive: Fix section mismatch warnings)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (a3c1a2194a7c s390/scm: use common completion path)
Merging sparc-next/master (fa5dc772e32e Merge branch 'sparc64-M7-memcpy')
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (637f23abca87 tile: array underflow in setup_maxnodemem())
Merging uml/linux-next (61e8d462457f um: Correctly check for PTRACE_GETRESET/SETREGSET)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (3497efbab8dc Merge branch 'for-next-next-v4.14-20170728' into for-next-20170728)
CONFLICT (content): Merge conflict in fs/btrfs/scrub.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (326547a91b3f ceph: fix readpage from fscache)
Merging cifs/for-next (235b84fc862a Merge branch 'i2c/for-4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (34fc75bfc616 uapi/linux/quota.h: Do not include linux/errno.h)
Merging ext4/dev (32aaf194201e ext4: add missing xattr hash update)
Merging f2fs/dev (a36c106dffb6 f2fs: use printk_ratelimited for f2fs_msg)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9183976ef1c8 fuse: set mapping error in writepage_locked when it fails)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (92b2e6a6f580 Merge branch 'writeback')
Merging nfsd/nfsd-next (b20dae70bfa5 svcrdma: fix an incorrect check on -E2BIG and -EINVAL)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (4edb83bb1041 ovl: constant d_ino for non-merge dirs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a6664433d383 ubifs: Set double hash cookie also for RENAME_EXCHANGE)
Merging xfs/for-next (56bdf855e676 xfs: Fix per-inode DAX flag inheritance)
Merging file-locks/locks-next (3953704fde7e locks: restore a warn for leaked locks on close)
Merging wberr/wberr-next (6d4b51241394 ecryptfs: convert to file_write_and_wait in ->fsync)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (5a814231ae3d printk/console: Enhance the check for consoles using init memory)
Merging pci/next (9b790d29aa6d Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (a4ee22cbf0c4 Revert "pstore: Honor dmesg_restrict sysctl on dmesg dumps")
Merging hid/for-next (8c3693552f8d Merge branch 'for-4.14/upstream' into for-next)
Merging i2c/i2c/for-next (57ade868eaa0 Merge branch 'i2c/for-4.14' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (f996c4155d0d dmi: Mark all struct dmi_system_id instances const)
Merging hwmon-staging/hwmon-next (1e069dfd96df hwmon: (pmbus) Add debugfs for status registers)
Merging jc_docs/docs-next (8ac5ac1b0ef8 doc: linux-wpan: Change the old function names to the lastest function names)
Merging v4l-dvb/master (ec0c3ec497ca media: ddbridge: split code into multiple files)
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (5ad3f3f6eb1f fbdev: matrox: hide unused 'hotplug' variable)
Merging pm/linux-next (c394fc6acab1 Merge branch 'device-properties' into linux-next)
CONFLICT (content): Merge conflict in drivers/acpi/sbs.c
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (1ef4bd4b47f3 Merge branch 'rockchip-rk3328' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (1c2428537241 dlm: use sock_create_lite inside tcp_accept_from_sock)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (cb44a8606f06 Merge branch 'mlnx-i2c')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328.dtsi
Applying: Revert "ARM: dts: rk3228-evb: Enable the integrated PHY for gmac"
Merging ipsec-next/master (077fbac405bf net: xfrm: support setting an output mark.)
Merging netfilter-next/master (549d2d41c1a4 netfilter: constify nf_loginfo structures)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (3d6b2d4e36e5 Merge tag 'iwlwifi-next-for-kalle-2017-08-11' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (3dfe55d9cae7 Bluetooth: kfree tmp rather than an alias to it)
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (3e5f0881f175 IB/hns: Avoid compile test under non 64bit environments)
Merging gfs2/for-next (b066a4eebd4f gfs2: forcibly flush ail to relieve memory pressure)
Merging mtd/master (9a51544774a5 mtd: blkdevs: Fix mtd block write failure)
Merging l2-mtd/master (1fbef470f369 mtd: mtdswap: remove unused variables 'dev' and 'gd')
Merging nand/nand/next (c9abfa74c8e1 mtd: nand: qcom: add and initialize QPIC DMA resources)
Merging spi-nor/spi-nor/next (18ba7101a4e9 mtd: spi-nor: fix "No newline at end of file")
Merging crypto/master (2d97591ef43d crypto: af_alg - consolidation of duplicate code)
Merging drm/drm-next (09ef2378dc42 Merge tag 'drm-misc-next-2017-08-08' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nv50_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (9db529aac938 drm/i915: More surgically unbreak the modeset vs reset deadlock)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (b9c55b6e2cc4 drm/vc4: Continue the switch to drm_*_put() helpers)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (d04fb3394460 drm/msm: Error pointer dereference in error handling)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (1372bc56e537 drm/imx: switch to drm_*_get(), drm_*_put() helpers)
Merging etnaviv/etnaviv/next (23d1dd03cc51 drm/etnaviv: switch to drm_*{get,put} helpers)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (45f8eca2803d Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (aa5ebc7831bf ALSA: wss: constify snd_pcm_ops structures)
Merging sound-asoc/for-next (4f1636835f16 Merge remote-tracking branches 'asoc/topic/wm8524', 'asoc/topic/wm8804' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (94aef061c796 Input: xpad - constify usb_device_id)
Merging block/for-next (5d77af35ebf6 Merge branch 'for-4.14/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (7bb2a5d1342f Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4b80b874e889 lib/raid6: align AVX512 constants to 512 bits, not bytes)
Merging mfd/for-mfd-next (af74963b8c0a mfd: lp87565: Convert to use devm_mfd_add_devices())
Merging backlight/for-backlight-next (2606706e4d7b backlight: gpio_backlight: Delete pdata inversion)
Merging battery/for-next (810e006a82c9 power: supply: lp8788: Make several arrays static const * const)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (485dbd53900a Merge remote-tracking branches 'regulator/topic/cpcap', 'regulator/topic/dt', 'regulator/topic/fan53555', 'regulator/topic/pwm' and 'regulator/topic/qcom' into regulator-next)
Merging security/next (771a70dc55a6 MAINTAINERS: update the NetLabel and Labeled Networking information)
Merging integrity/next (2d7a12b69b4a ima: don't remove the securityfs policy file)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (5703ffaa001d MAINTAINERS: update the NetLabel and Labeled Networking information)
Merging tpmdd/next (20ae91be32b5 Documentation: tpm: add powered-while-suspended binding documentation)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (60110f262d40 Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'arm/omap', 'arm/mediatek', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (f203f7f1dbb2 vfio/type1: Give hardware MSI regions precedence)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (4070ad3e8ffa audit: update the function comments)
Merging devicetree/for-next (358155ede4fb device property: use of_graph_get_remote_endpoint() for of_fwnode)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (8317ebf8d83f Merge remote-tracking branches 'spi/topic/tools' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (03a0e614c31c Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in kernel/sched/fair.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbmem.c
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (3e5d2bd19138 EDAC, pnd2: Build in a minimal sideband driver for Apollo Lake)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a7e52ad7ed82 ring-buffer: Have ring_buffer_alloc_read_page() return error on offline CPU)
Merging rcu/rcu/next (7b37dbe2f330 rcu: Create call_rcu_tasks() kthread at boot time)
Merging kvm/linux-next (eebed2438923 kvm: nVMX: Add support for fast unprotection of nested guest page tables)
Merging kvm-arm/next (7e5a672289c9 KVM: arm/arm64: Handle hva aging while destroying the vm)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (5091d7c8ca2d KVM: s390: Multiple Epoch Facility support)
Merging xen-tip/linux-next (020db9d3c1dc xen/events: Fix interrupt lost during irq_disable and irq_enable)
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (1fce1c2b4f51 Merge branch 'for-4.14' into for-next)
Merging drivers-x86/for-next (c801603e6d0c platform/x86: intel-vbtn: match power button on press rather than release)
Merging chrome-platform/for-next (69237e85ece7 platform/chrome: cros_ec: register shutdown function for debugfs)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (5384fe0e7751 leds: lm3533: constify attribute_group structure)
Merging ipmi/for-next (1d51142219c3 ipmi: fix unsigned long underflow)
Merging driver-core/driver-core-next (f75f6ff2eaa6 Merge 4.13-rc5 into driver-core-next)
Merging usb/usb-next (feea468014f0 Merge 4.13-rc5 into usb-next)
Merging usb-gadget/next (5771a8c08880 Linux v4.13-rc1)
Merging usb-serial/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-chipidea-next/ci-for-usb-next (f86c9d735b49 usb: chipidea: Add support for Tegra20/30/114/124)
Merging phy-next/next (29f2711eb51c phy: ti-pipe3: Use TRM recommended settings for SATA DPLL)
Merging tty/tty-next (cf0a1579dda4 Merge 4.13-rc5 into tty-next)
Merging char-misc/char-misc-next (d985524680b7 Merge 4.13-rc5 into char-misc-next)
Merging extcon/extcon-next (1cf76c4eeb07 extcon: cros-ec: Fix a potential NULL pointer dereference)
Merging staging/staging-next (0116ced91d3a staging: fsl-mc: add explicit dependencies for compile-tested arches)
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (d4381f3cff0b Merge branch 'topic/bcm' into next)
Merging cgroup/for-next (a833764ca4f9 Merge branch 'for-4.14' into for-next)
Merging scsi/for-next (c0d1f980d9c7 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (4859a115f67f scsi: sym53c8xx: Avoid undefined behaviour)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (a335414843d5 Merge branch 'for-4.14' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c9379b24d6fc virtio_blk: fix incorrect message when disk is resized)
Merging rpmsg/for-next (99ec27115e39 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
Merging gpio/for-next (592338359064 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (06351d133dea pinctrl: add a Gemini SoC pin controller)
Merging pinctrl-samsung/for-next (bbed85f45b2b pinctrl: samsung: Remove unneeded local variable initialization)
Merging pwm/for-next (5ec8c48a6235 Merge branch 'for-4.13/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (64a76d0d64be signal: Fix sending signals with siginfo)
CONFLICT (content): Merge conflict in arch/mips/kernel/traps.c
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (e375920a429c selftests: futex: convert test to use ksft TAP13 framework)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (6d34a5f3806d coresight: STM: Clean up __iomem type usage)
Merging rtc/rtc-next (2f7f1b780dd6 rtc: max8925: remove redundant check on ret)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bbb3be170ac2 device-dax: fix sysfs duplicate warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb624a11ecd5 Merge branch 'for-next/secureexec' into for-next/kspp)
Merging akpm-current/current (e2eff28aab55 ipc/sem: play nicer with large nsops allocations)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fscache: fix fscache_objlist_show format processing
Applying: IB/mlx4: fix sprintf format warning
Applying: iopoll: avoid -Wint-in-bool-context warning
Applying: Kbuild: use -fshort-wchar globally
Applying: select: use get/put_timespec64
Applying: io_getevents: use timespec64 to represent timeouts
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (c1975822894c lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
