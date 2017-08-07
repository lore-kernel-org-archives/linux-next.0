From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 7
Date: Mon, 7 Aug 2017 16:44:41 +1000
Message-ID: <20170807164441.5c739772@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60841 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751564AbdHGGon (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Aug 2017 02:44:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170804:

The rockchip tree gained a conflict against Linus' tree.

The pm tree gained a conflict against the dmi tree.

The net-next tree gained a conflict against the net tree.

I again reverted a commit from the staging tree that was causing overnight
build failures.

Non-merge commits (relative to Linus' tree): 4354
 4565 files changed, 168345 insertions(+), 94716 deletions(-)

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
Merging origin/master (acdae9ee6aba Merge tag 'platform-drivers-x86-v4.13-4' of git://git.infradead.org/linux-platform-drivers-x86)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (ad8181060788 kconfig: fix sparse warnings in nconfig)
Merging arc-current/for-curr (b5ddb6d54729 ARCv2: PAE40: set MSB even if !CONFIG_ARC_HAS_PAE40 but PAE exists in SoC)
Merging arm-current/fixes (ce184a0dee92 ARM: 8687/1: signal: Fix unparseable iwmmxt_sigframe in uc_regspace[])
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (3db40c312c2c powerpc/64: Fix __check_irq_replay missing decrementer interrupt)
Merging sparc/master (0a23ea65ce9f Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (2c460621bb2e bpf: fix byte order test in test_verifier)
Merging ipsec/master (7bab09631c2a xfrm: policy: check policy direction value)
Merging netfilter/master (9beceb54fa2c netfilter: x_tables: Fix use-after-free in ipt_do_table.)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (368bd88ebb64 Merge tag 'iwlwifi-for-kalle-2017-08-02' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (5ef26e966d3f Merge tag 'asoc-fix-v4.13-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (8466489ef5ba xhci: Reset Renesas uPD72020x USB controller for 32-bit DMA issue)
Merging driver-core.current/driver-core-linus (5771a8c08880 Linux v4.13-rc1)
Merging tty.current/tty-linus (9527b82ae3af Revert "serial: Delete dead code for CIR serial ports")
Merging usb.current/usb-linus (8cc34c8d6113 Merge tag 'usb-serial-4.13-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (b7d44c36a6f6 usb: renesas_usbhs: gadget: fix unused-but-set-variable warning)
Merging usb-serial-fixes/usb-linus (fd1b8668af59 USB: serial: option: add D-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (cef988642cda staging: comedi: comedi_fops: do not call blocking ops when !TASK_RUNNING)
Merging char-misc.current/char-misc-linus (520eccdfe187 Linux 4.13-rc2)
Merging input-current/for-linus (293b915fd9be Input: trackpoint - assume 3 buttons when buttons detection fails)
Merging crypto-current/master (60c4081ec419 crypto: inside-secure - fix the sha state length in hmac_sha1_setkey)
Merging ide/master (921edf312a6a ide: avoid warning for timings calculation)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (5771a8c08880 Linux v4.13-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (8033120f36c0 media: atomisp2: array underflow in imx_enum_frame_size())
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (16f73eb02d7e Linux 4.13-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (80c471ea040a drm/rockchip: vop: report error when check resource error)
Merging kbuild/for-next (5771a8c08880 Linux v4.13-rc1)
Merging uuid/for-next (832e4c83abc5 uuid: remove uuid_be)
Merging dma-mapping/for-next (878ec36765fa ARM: NOMMU: Wire-up default DMA interface)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (6f8119230ed0 ARC: set boot print log level to PR_INFO)
Merging arm/for-next (9182571b44a4 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (5771a8c08880 Linux v4.13-rc1)
Merging arm-soc/for-next (41c454fa0e86 Merge tag 'davinci-fixes-for-v4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci into fixes)
Merging actions/for-next (253d192bc4aa Merge branch 'v4.14/dt' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (8c31a9e33516 Merge branch 'v4.14/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (01c1fe77824e Merge branch 'at91-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (6694c45eb2d8 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb1a6241a46e Merge branch 'for_4.14/keystone_dts' into next)
Merging mvebu/for-next (fb18f4b252a9 Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (191ae5a41246 Merge branch 'omap-for-v4.14/debug-ll' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (e0be864f1424 ARC: reset: introduce HSDKv1 reset driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging qcom/for-next (c3c9fffc9384 soc: qcom: mdt_loader: Use request_firmware_into_buf())
Merging realtek/for-next (5771a8c08880 Linux v4.13-rc1)
Merging renesas/next (77c3d7971bba Merge branches 'fixes-for-v4.13', 'arm64-dt-for-v4.14', 'arm64-defconfig-for-v4.14', 'defconfig-for-v4.14', 'drivers-for-v4.14', 'dt-bindings-for-v4.14', 'dt-for-v4.14' and 'soc-for-v4.14' into next)
Merging rockchip/for-next (667fc2127d44 Merge branch 'v4.14-armsoc/soc32' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3288.dtsi
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (86247b536cd0 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (1ee75aa01e17 Merge branches 'sunxi/clk-fixes-for-4.13', 'sunxi/clk-for-4.14', 'sunxi/config-for-4.14', 'sunxi/dt-for-4.14' and 'sunxi/dt64-for-4.14' into sunxi/for-next)
Merging tegra/for-next (20e72aa386b0 Merge branch for-4.14/arm/defconfig into for-next)
Merging arm64/for-next/core (425e1ed73e65 arm64: fix endianness annotation for 'struct jit_ctx' and friends)
Merging clk/clk-next (8e7be401f2f5 Merge branch 'clk-fixes' into clk-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging c6x/for-linux-next (eab89e215ae4 c6x: defconfig: Cleanup from old Kconfig options)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (8f7657c37322 m68k: allow NULL clock for clk_get_rate)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (e36f14f04d11 Merge branch '4.13-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (6f7da290413b Linux 4.12)
Merging powerpc/next (f74c89bd80fb powerpc/perf: Add thread IMC PMU support)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (ac34bbc3604b s390/cio: add const to bin_attribute structures)
Merging sparc-next/master (cb8c65ccff7f Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
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
Merging ceph/master (ae78dd8139ce libceph: make RECOVERY_DELETES feature create a new interval)
Merging cifs/for-next (235b84fc862a Merge branch 'i2c/for-4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (84969465ddc4 hfsplus: Don't clear SGID when inheriting ACLs)
Merging ext4/dev (4e5620132144 ext4: fix copy paste error in ext4_swap_extents())
Merging f2fs/dev (a36c106dffb6 f2fs: use printk_ratelimited for f2fs_msg)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (61c12b49e1c9 fuse: Dont call set_page_dirty_lock() for ITER_BVEC pages for async_dio)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (16f73eb02d7e Linux 4.13-rc3)
Merging nfsd/nfsd-next (b20dae70bfa5 svcrdma: fix an incorrect check on -E2BIG and -EINVAL)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (0e082555cec9 ovl: check for bad and whiteout index on lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a6664433d383 ubifs: Set double hash cookie also for RENAME_EXCHANGE)
Merging xfs/for-next (56bdf855e676 xfs: Fix per-inode DAX flag inheritance)
Merging file-locks/locks-next (3953704fde7e locks: restore a warn for leaked locks on close)
Merging wberr/wberr-next (6d4b51241394 ecryptfs: convert to file_write_and_wait in ->fsync)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (5a814231ae3d printk/console: Enhance the check for consoles using init memory)
Merging pci/next (16f73eb02d7e Linux 4.13-rc3)
Merging pstore/for-next/pstore (520eccdfe187 Linux 4.13-rc2)
Merging hid/for-next (30da3fc10ec6 Merge branch 'for-4.14/constify-attribute_group' into for-next)
Merging i2c/i2c/for-next (ba1f668f388c Merge branch 'i2c/for-4.14' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (f996c4155d0d dmi: Mark all struct dmi_system_id instances const)
Merging hwmon-staging/hwmon-next (2732fc0ffb35 hwmon: (i5k_amb) constify pci_device_id)
Merging jc_docs/docs-next (bc7938deaca7 docs: submitting-patches - change non-ascii character to ascii)
Merging v4l-dvb/master (da48c948c263 media: fix warning on v4l2_subdev_call() result interpreted as bool)
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (376b3ff54c9a fbdev: Nuke FBINFO_MODULE)
Merging pm/linux-next (cb51759d060e Merge branches 'intel_pstate' and 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in drivers/acpi/sbs.c
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (5d72ed35678a Merge branches 'thermal-core', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c1326a3c2207 dlm: avoid double-free on error path in dlm_device_{register,unregister})
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (a54df682e559 aquantia: Switch to use napi_gro_receive)
CONFLICT (content): Merge conflict in net/ipv4/tcp_output.c
CONFLICT (content): Merge conflict in drivers/net/hyperv/netvsc.c
Merging ipsec-next/master (f70f250a7731 net: Allow IPsec GSO for local sockets)
Merging netfilter-next/master (4d3a57f23dec netfilter: conntrack: do not enable connection tracking unless needed)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (9d546198705a rtlwifi: Replace hardcode value with macro)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mvm/ops.c
Merging bluetooth/master (35615994c1f7 Merge branch 'socket-sendmsg-zerocopy')
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (913cc67159bc IB/hfi1: Always perform offline transition)
Merging gfs2/for-next (9513f7bd924e gfs2: forcibly flush ail to relieve memory pressure)
Merging mtd/master (33983675fbd5 Merge tag 'nand/fixes-for-4.13-rc4' of git://git.infradead.org/l2-mtd into MTD)
Merging l2-mtd/master (1fbef470f369 mtd: mtdswap: remove unused variables 'dev' and 'gd')
Merging nand/nand/next (bd02f8e5a08c mtd: nand: mxc: Fix mxc_v1 ooblayout)
Merging spi-nor/spi-nor/next (eb353aaa7c55 mtd: mtk-quadspi: Remove unneeded pinctrl header)
Merging crypto/master (5060ffc97bc6 crypto: ccp - Add XTS-AES-256 support for CCP version 5)
Merging drm/drm-next (c27668ba9ab0 Merge branch 'topic-arcpgu-updates' of https://github.com/foss-for-synopsys-dwc-arc-processors/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nv50_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (41533940a962 drm/i915/selftests: Retarget igt_render_engine_reset_fallback())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (7cc4ab225ae3 drm/bridge: dw-hdmi: add better clock disable control)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nv50_display.c
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (a49b9ec9cae3 drm/msm: fix spelling mistake: "ringubffer" -> "ringbuffer")
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (790cb4c7c954 drm/imx: lock scanout transfers for consecutive bursts)
Merging etnaviv/etnaviv/next (8cc47b3ea082 drm/etnaviv: populate GEM objects on cpu_prep)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (a7c33d98535c Merge remote-tracking branch 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (5e463d6d292a ALSA: usbusx2y: constify usb_device_id.)
Merging sound-asoc/for-next (0f2b230eee7d Merge remote-tracking branches 'asoc/topic/wm8804' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (4323418d62fe Input: sur40 - skip all blobs that are not touches)
Merging block/for-next (1bc69e1aabff Merge branch 'for-4.14/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (397c248c0d3d Revert "mmc: mmci_qcom_dml: include mmci_qcom_dml.h to fix sparse warnings")
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (8efaa3ece2f4 md/r5cache: call mddev_lock/unlock() in r5c_journal_mode_set)
Merging mfd/for-mfd-next (48a14b9f0cc6 mfd: max8998: Fix potential NULL pointer dereference)
Merging backlight/for-backlight-next (8c03a937ca99 backlight: pwm_bl: Make of_device_ids const)
Merging battery/for-next (67bd22c09ac1 power: supply: bq27xxx: move platform driver code into bq27xxx_battery_hdq.c)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (4e1896446b8d Merge remote-tracking branches 'regulator/topic/cpcap', 'regulator/topic/dt', 'regulator/topic/fan53555', 'regulator/topic/pwm' and 'regulator/topic/qcom' into regulator-next)
Merging security/next (be6f039747e7 security: fix description of values returned by cap_inode_need_killpriv)
Merging integrity/next (fc26bd50539b IMA: update IMA policy documentation to include pcr= option)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (af63f4193f9f selinux: Generalize support for NNP/nosuid SELinux domain transitions)
Merging tpmdd/next (20ae91be32b5 Documentation: tpm: add powered-while-suspended binding documentation)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (a7521d49605b Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'arm/omap', 'arm/mediatek', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7f56c30bd0a2 vfio: Remove unnecessary uses of vfio_container.group_lock)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (739bde1f2229 selinux: remove AVC init audit log message)
Merging devicetree/for-next (5b71456f5445 dt-bindings: update OpenFirmware document links to devicetree.org)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (2d0614215317 Merge remote-tracking branches 'spi/topic/stm32', 'spi/topic/sunxi', 'spi/topic/tegra' and 'spi/topic/tools' into spi-next)
Merging tip/auto-latest (f74b4d835d21 Merge branch 'x86/urgent' into auto-latest)
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbmem.c
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (3e5d2bd19138 EDAC, pnd2: Build in a minimal sideband driver for Apollo Lake)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a7e52ad7ed82 ring-buffer: Have ring_buffer_alloc_read_page() return error on offline CPU)
Merging rcu/rcu/next (cd4db3e71a56 rcu: Provide GP ordering in face of migrations and delays)
Merging kvm/linux-next (16f73eb02d7e Linux 4.13-rc3)
Merging kvm-arm/next (7e5a672289c9 KVM: arm/arm64: Handle hva aging while destroying the vm)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (5091d7c8ca2d KVM: s390: Multiple Epoch Facility support)
Merging xen-tip/linux-next (e91b2b119433 xen: dont fiddle with event channel masking in suspend/resume)
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (5dab90af0906 Merge branch 'for-4.13-fixes' into for-next)
Merging drivers-x86/for-next (c801603e6d0c platform/x86: intel-vbtn: match power button on press rather than release)
Merging chrome-platform/for-next (3c778a7fcfaa platform/chrome : Add myself as Maintainer)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (7358df4d5b01 leds: blinkm: constify attribute_group structures.)
Merging ipmi/for-next (8c3cbb96adf6 char: ipmi: eliminate misleading print info when being probed via ACPI)
Merging driver-core/driver-core-next (1f5000bd8afa initcall_debug: add deferred probe times)
Merging usb/usb-next (e978e9b977b0 c67x00-hcd: constify hc_driver structures)
Merging usb-gadget/next (5771a8c08880 Linux v4.13-rc1)
Merging usb-serial/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-chipidea-next/ci-for-usb-next (7c3a8b81503c usb: chipidea: core: do not register extcon notifier if extcon device is not existed)
Merging phy-next/next (e7cded272612 phy: allwinner: phy-sun4i-usb: Add log when probing)
Merging tty/tty-next (8a5a90a2a477 tty: fix __tty_insert_flip_char regression)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_core.c
Merging char-misc/char-misc-next (e819accd74a6 Merge tag 'lkdtm-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into char-misc-next)
Merging extcon/extcon-next (5c27036d2b05 extcon: Convert to using %pOF instead of full_name)
Merging staging/staging-next (5551ad1e9fad staging: wlan-ng: Fix the types of the hfa384x_comm_tallies_16/32 members)
Applying: Revert "staging: fsl-mc: allow the driver compile multi-arch"
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (d4381f3cff0b Merge branch 'topic/bcm' into next)
Merging cgroup/for-next (96e2c6dba80f Merge branch 'for-4.14' into for-next)
Merging scsi/for-next (442e748876fe Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (bb9be3739281 scsi: qla2xxx: Fix remoteport disconnect for FC-NVMe)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (d0e01c1d1f33 Merge branch 'for-4.14' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c9379b24d6fc virtio_blk: fix incorrect message when disk is resized)
Merging rpmsg/for-next (99ec27115e39 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (2fdefbf2e9d4 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (30b8db108380 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (bbed85f45b2b pinctrl: samsung: Remove unneeded local variable initialization)
Merging pwm/for-next (5ec8c48a6235 Merge branch 'for-4.13/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (64a76d0d64be signal: Fix sending signals with siginfo)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (7d005195e9eb selftests: capabilities: convert the test to use TAP13 ksft framework)
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
Merging kspp/for-next/kspp (281ea251df82 Merge branch 'for-next/secureexec' into for-next/kspp)
Merging akpm-current/current (b6839dac0afe ipc: convert kern_ipc_perm.refcount from atomic_t to refcount_t)
Applying: mm-thp-enable-thp-migration-in-generic-path-fix-fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fscache: fix fscache_objlist_show format processing
Applying: IB/mlx4: fix sprintf format warning
Applying: iopoll: avoid -Wint-in-bool-context warning
Applying: Kbuild: use -fshort-wchar globally
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (c3c188332511 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
