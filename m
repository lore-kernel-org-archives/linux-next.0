From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 28
Date: Fri, 28 Jul 2017 15:45:31 +1000
Message-ID: <20170728154531.4989ace2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58955 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751628AbdG1Fpe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Jul 2017 01:45:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170727:

Non-merge commits (relative to Linus' tree): 2843
 2887 files changed, 101051 insertions(+), 48048 deletions(-)

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
Merging origin/master (0ce2f3851193 Merge tag 'acpi-4.13-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (ad8181060788 kconfig: fix sparse warnings in nconfig)
Merging arc-current/for-curr (37f1db0e85ff ARC: [plat-axs10x]: prepare dts files for enabling PAE40 on axs103)
Merging arm-current/fixes (ce184a0dee92 ARM: 8687/1: signal: Fix unparseable iwmmxt_sigframe in uc_regspace[])
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (0da12a7a81f1 powerpc/mm/hash: Free the subpage_prot_table correctly)
Merging sparc/master (8cd3ec51c0c3 sbus: Convert to using %pOF instead of full_name)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (6b84202c946c sctp: fix the check for _sctp_walk_params and _sctp_walk_errors)
Merging ipsec/master (e6194923237f esp: Fix memleaks on error paths.)
Merging netfilter/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (5f5d03143de5 brcmfmac: fix memleak due to calling brcmf_sdiod_sgtable_alloc() twice)
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (ba92b1142879 ALSA: hda - Add mute led support for HP ProBook 440 G4)
Merging pci-current/for-linus (34d5ac2af644 PCI: rockchip: Check for pci_scan_root_bus_bridge() failure correctly)
Merging driver-core.current/driver-core-linus (5771a8c08880 Linux v4.13-rc1)
Merging tty.current/tty-linus (520eccdfe187 Linux 4.13-rc2)
Merging usb.current/usb-linus (520eccdfe187 Linux 4.13-rc2)
Merging usb-gadget-fixes/fixes (520eccdfe187 Linux 4.13-rc2)
Merging usb-serial-fixes/usb-linus (9585e340db9f USB: serial: cp210x: add support for Qivicon USB ZigBee dongle)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (055655a9f0fe Merge tag 'iio-fixes-for-4.13a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (520eccdfe187 Linux 4.13-rc2)
Merging input-current/for-linus (293b915fd9be Input: trackpoint - assume 3 buttons when buttons detection fails)
Merging crypto-current/master (41cdf7a45389 crypto: authencesn - Fix digest_null crash)
Merging ide/master (921edf312a6a ide: avoid warning for timings calculation)
Merging vfio-fixes/for-linus (bb67b496c338 include/linux/vfio.h: Guard powerpc-specific functions with CONFIG_VFIO_SPAPR_EEH)
Merging kselftest-fixes/fixes (5771a8c08880 Linux v4.13-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (8033120f36c0 media: atomisp2: array underflow in imx_enum_frame_size())
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (5fe220a160e5 Merge tag 'gvt-fixes-2017-07-26' of https://github.com/01org/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (fea20995976f gpu: host1x: Free the IOMMU domain when there is no device to attach)
Merging kbuild/for-next (5771a8c08880 Linux v4.13-rc1)
Merging uuid/for-next (832e4c83abc5 uuid: remove uuid_be)
Merging dma-mapping/for-next (878ec36765fa ARM: NOMMU: Wire-up default DMA interface)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (6f8119230ed0 ARC: set boot print log level to PR_INFO)
Merging arm/for-next (640265076a84 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (5771a8c08880 Linux v4.13-rc1)
Merging arm-soc/for-next (1d20d8a9fce8 ARM: pxa: select both FB and FB_W100 for eseries)
Merging actions/for-next (253d192bc4aa Merge branch 'v4.14/dt' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (bdbe8158fd32 Merge branch 'v4.13/fixes' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (01c1fe77824e Merge branch 'at91-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (389c81b7e7ae Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (83bf680264c1 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (9fa3966f3f80 Merge branch 'for_4.14/keystone_config' into next)
Merging mvebu/for-next (fd63b625307d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (05f2a5417cf1 Merge branch 'omap-for-v4.13/mmc-regulator' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (e0be864f1424 ARC: reset: introduce HSDKv1 reset driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging qcom/for-next (f46a1bb0750a soc: qcom: mdt_loader: Use request_firmware_into_buf())
Merging realtek/for-next (007e6304223c Merge branch 'v4.13/dt64' into next)
Merging renesas/next (779440689141 Merge branches 'fixes-for-v4.13', 'arm64-dt-for-v4.14', 'arm64-defconfig-for-v4.14', 'defconfig-for-v4.14', 'drivers-for-v4.14', 'dt-bindings-for-v4.14', 'dt-for-v4.14' and 'soc-for-v4.14' into next)
Merging rockchip/for-next (29a737be1eab Merge branch 'v4.14-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (69e2d7289cf9 Merge branch 'next/drivers' into for-next)
Merging sunxi/sunxi/for-next (c9618d5f5d9c Merge branches 'sunxi/fixes-for-4.13', 'sunxi/dt-for-4.14', 'sunxi/dt64-for-4.14', 'sunxi/config-for-4.14', 'sunxi/clk-fixes-for-4.13' and 'sunxi/clk-for-4.14' into sunxi/for-next)
Merging tegra/for-next (07bb9460b188 Merge branch for-4.13/arm64/dt into for-next)
Merging arm64/for-next/core (425e1ed73e65 arm64: fix endianness annotation for 'struct jit_ctx' and friends)
Merging clk/clk-next (1667393126d7 clk: Convert to using %pOF instead of full_name)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging c6x/for-linux-next (eab89e215ae4 c6x: defconfig: Cleanup from old Kconfig options)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (896329b870dd m68k: allow NULL clock for clk_get_rate)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (e36f14f04d11 Merge branch '4.13-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (6f7da290413b Linux 4.12)
Merging powerpc/next (f74c89bd80fb powerpc/perf: Add thread IMC PMU support)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (dd783b4c7bf6 Merge tag 'vfio-ccw-20170724' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/vfio-ccw into features)
Merging sparc-next/master (cb8c65ccff7f Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (637f23abca87 tile: array underflow in setup_maxnodemem())
Merging uml/linux-next (61e8d462457f um: Correctly check for PTRACE_GETRESET/SETREGSET)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (51b5e9756efd Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (fafc6f631b23 Merge branch 'for-next-next-v4.14-20170726' into for-next-20170726)
CONFLICT (content): Merge conflict in fs/btrfs/scrub.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (36222ccb6838 libceph: make RECOVERY_DELETES feature create a new interval)
Merging cifs/for-next (235b84fc862a Merge branch 'i2c/for-4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (84969465ddc4 hfsplus: Don't clear SGID when inheriting ACLs)
Merging ext4/dev (ff95015648df ext4: fix spelling mistake: "prellocated" -> "preallocated")
Merging f2fs/dev (1766871af8a0 f2fs: support project quota)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (68227c03cba8 fuse: initialize the flock flag in fuse_file on allocation)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (6f7da290413b Linux 4.12)
Merging nfsd/nfsd-next (b20dae70bfa5 svcrdma: fix an incorrect check on -E2BIG and -EINVAL)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (0e082555cec9 ovl: check for bad and whiteout index on lookup)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a6664433d383 ubifs: Set double hash cookie also for RENAME_EXCHANGE)
Merging xfs/for-next (cd87d8679201 xfs: don't crash on unexpected holes in dir/attr btrees)
Merging file-locks/locks-next (3953704fde7e locks: restore a warn for leaked locks on close)
Merging wberr/wberr-next (89d62b5aa1c5 gfs2: convert to errseq_t based writeback error reporting for fsync)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (5a814231ae3d printk/console: Enhance the check for consoles using init memory)
Merging pci/next (af3c8d98508d Merge tag 'drm-for-v4.13' of git://people.freedesktop.org/~airlied/linux)
Merging pstore/for-next/pstore (520eccdfe187 Linux 4.13-rc2)
Merging hid/for-next (57bbec7de54d Merge branch 'for-4.14/wacom' into for-next)
Merging i2c/i2c/for-next (efe2cda164b1 Merge tag 'ib-mfd-arm-i2c-v4.14' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (8efa050f19fe firmware: dmi_scan: Check DMI structure length)
Merging hwmon-staging/hwmon-next (2732fc0ffb35 hwmon: (i5k_amb) constify pci_device_id)
Merging jc_docs/docs-next (bc7938deaca7 docs: submitting-patches - change non-ascii character to ascii)
Merging v4l-dvb/master (da48c948c263 media: fix warning on v4l2_subdev_call() result interpreted as bool)
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (4c99ceda0d06 fbdev: make get_fb_unmapped_area depends of !MMU)
Merging pm/linux-next (3f4240280943 Merge branches 'pm-cpufreq' and 'pm-cpufreq-sched' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (5d72ed35678a Merge branches 'thermal-core', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (e94d6f64e7ba dlm: print log message when cluster name is not set)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (fb5e7606b100 net: phy: Remove stale comments referencing timer)
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (7a68ada6ec7d Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (6e9aae179f29 wl1251: add a missing spin_lock_init())
Merging bluetooth/master (98b5798499b6 mrf24j40: Fix en error handling path in 'mrf24j40_probe()')
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (a5f66725c774 Merge branch 'misc' into k.o/for-next)
Merging gfs2/for-next (4e0320f16189 GFS2: Don't waste time locking lru_lock for non-lru glocks)
Merging mtd/master (5771a8c08880 Linux v4.13-rc1)
Merging l2-mtd/master (1fbef470f369 mtd: mtdswap: remove unused variables 'dev' and 'gd')
Merging nand/nand/next (81667e9c8ad8 mtd: nand: mtk: release lock on error path)
Merging spi-nor/spi-nor/next (f384b352cbf0 mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables)
Merging crypto/master (10a515ddb5f1 hwrng: remember rng chosen by user)
Merging drm/drm-next (e6742e1021a5 drm: linux-next: build failure after merge of the drm-misc tree)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (de44e256b92c drm/i915/sdvo: Shut up state checker with hdmi cards on gen3)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (78acea381d6e Merge airlied/drm-next into drm-misc-next)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (4a630fadbb29 drm/msm: Fix potential buffer overflow issue)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e40eda3dda1e drm/arm: mali-dp: Use CMA helper for plane buffer address calculation)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (790cb4c7c954 drm/imx: lock scanout transfers for consecutive bursts)
Merging etnaviv/etnaviv/next (8cc47b3ea082 drm/etnaviv: populate GEM objects on cpu_prep)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (65745e84ee10 Merge remote-tracking branch 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (6c5a266029cc ALSA: hda: constify pci_device_id.)
Merging sound-asoc/for-next (9d7efa6f18ba Merge remote-tracking branches 'asoc/topic/twl6040', 'asoc/topic/wm8804' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (5279631271b3 module: fix ddebug_remove_module())
Merging input/next (4323418d62fe Input: sur40 - skip all blobs that are not touches)
Merging block/for-next (3b06b1a7448e Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (bb1407c0df2c Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (ed9b66d21866 MD: fix warnning for UP case)
Merging mfd/for-mfd-next (48a14b9f0cc6 mfd: max8998: Fix potential NULL pointer dereference)
Merging backlight/for-backlight-next (8c03a937ca99 backlight: pwm_bl: Make of_device_ids const)
Merging battery/for-next (67bd22c09ac1 power: supply: bq27xxx: move platform driver code into bq27xxx_battery_hdq.c)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (7a6370a555be Merge remote-tracking branch 'regulator/topic/qcom' into regulator-next)
Merging security/next (be6f039747e7 security: fix description of values returned by cap_inode_need_killpriv)
Merging integrity/next (fc26bd50539b IMA: update IMA policy documentation to include pcr= option)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (03c91322b89a credits: update Paul Moore's info)
Merging tpmdd/next (e7d872bf1bc5 Documentation: tpm: add powered-while-suspended binding documentation)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (4f019dc5a68e Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7f56c30bd0a2 vfio: Remove unnecessary uses of vfio_container.group_lock)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (15318a9f8015 audit: Reduce overhead using a coarse clock)
Merging devicetree/for-next (b041303c3e88 Merge branch 'dt/linus' into for-next)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (fb670506a9ff Merge remote-tracking branches 'spi/topic/stm32', 'spi/topic/sunxi', 'spi/topic/tegra' and 'spi/topic/tools' into spi-next)
Merging tip/auto-latest (683a6c2576a2 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (2efdda4a4108 EDAC, cpc925, ppc4xx: Convert to using %pOF instead of full_name)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (2e028c4fe129 ftrace: Fix uninitialized variable in match_records())
Merging rcu/rcu/next (2ffef889632a Merge branches 'doc.2017.07.24c', 'fixes.2017.07.25a', 'hotplug.2017.07.25b', 'misc.2017.07.27b', 'spin_unlock_wait_no.2017.07.25a', 'srcu.2017.07.27c' and 'torture.2017.07.24c' into HEAD)
Merging kvm/linux-next (7b5e0a4e82bf Merge branch 'kvm-ppc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into kvm-master)
Merging kvm-arm/next (7e5a672289c9 KVM: arm/arm64: Handle hva aging while destroying the vm)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (5091d7c8ca2d KVM: s390: Multiple Epoch Facility support)
Merging xen-tip/linux-next (e91b2b119433 xen: dont fiddle with event channel masking in suspend/resume)
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (e5a49e187361 Merge branch 'for-4.13-fixes' into for-next)
Merging drivers-x86/for-next (972777171f33 platform/x86: wmi: Fix error handling in acpi_wmi_init())
Merging chrome-platform/for-next (3c778a7fcfaa platform/chrome : Add myself as Maintainer)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (c68729119f4d leds: tlc591xx: add missing of_node_put)
Merging ipmi/for-next (4495ec6d770e ipmi:ssif: Add missing unlock in error branch)
Merging driver-core/driver-core-next (1af824f085e8 Merge branch 'bind_unbind' into driver-core-next)
Merging usb/usb-next (141769851cb7 Merge 4.13-rc2 into usb-next)
Merging usb-gadget/next (5771a8c08880 Linux v4.13-rc1)
Merging usb-serial/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-chipidea-next/ci-for-usb-next (7c3a8b81503c usb: chipidea: core: do not register extcon notifier if extcon device is not existed)
Merging phy-next/next (e7cded272612 phy: allwinner: phy-sun4i-usb: Add log when probing)
Merging tty/tty-next (329f0a8a35a6 Merge 4.13-rc2 into tty-next)
Merging char-misc/char-misc-next (24a81a2c2581 Merge 4.13-rc2 into char-misc-next)
Merging extcon/extcon-next (5c27036d2b05 extcon: Convert to using %pOF instead of full_name)
Merging staging/staging-next (a29e24907208 Merge 4.13-rc2 into staging-next)
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (d4381f3cff0b Merge branch 'topic/bcm' into next)
Merging cgroup/for-next (dba9eccd4164 Merge branch 'for-4.14' into for-next)
Merging scsi/for-next (0dbbec278e24 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (bb9be3739281 scsi: qla2xxx: Fix remoteport disconnect for FC-NVMe)
Merging target-updates/for-next (138d351eefb7 iscsi-target: Add login_keys_workaround attribute for non RFC initiators)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (37cbf519e8c6 Merge branch 'for-4.13-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (cfa0ebc9d6d6 virtio-net: fix module unloading)
Merging rpmsg/for-next (5771a8c08880 Linux v4.13-rc1)
Merging gpio/for-next (8d2c6297aec9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mvebu.c
Merging pinctrl/for-next (ece5946c2eed Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (bbed85f45b2b pinctrl: samsung: Remove unneeded local variable initialization)
Merging pwm/for-next (5ec8c48a6235 Merge branch 'for-4.13/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (64a76d0d64be signal: Fix sending signals with siginfo)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (97e493685158 selftests: ftrace: Check given string is not zero-length)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (ee0c4a55a06c perf: cs-etm: Fix ETMv4 CONFIGR entry in perf.data file)
Merging rtc/rtc-next (5771a8c08880 Linux v4.13-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bbb3be170ac2 device-dax: fix sysfs duplicate warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (99fd41e99f53 randstruct: Enable function pointer struct detection)
Merging akpm-current/current (cc624835c3f0 kernel-reboot-add-devm_register_reboot_notifier-fix)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (19335ad01d48 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
