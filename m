From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 21
Date: Fri, 21 Jul 2017 14:10:19 +1000
Message-ID: <20170721141019.5776e9a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42289 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750727AbdGUEKW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Jul 2017 00:10:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170720:

The kbuild tree still produces a large number of build warnings so I
reverted a commit from it.

The drm tree gained a conflict against the drm-intel-fixes tree.

The userns tree lost its build failure.

Non-merge commits (relative to Linus' tree): 2018
 2161 files changed, 82061 insertions(+), 39649 deletions(-)

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

I am currently merging 266 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (63a86362130f Merge tag 'pm-4.13-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (ad8181060788 kconfig: fix sparse warnings in nconfig)
Merging arc-current/for-curr (37f1db0e85ff ARC: [plat-axs10x]: prepare dts files for enabling PAE40 on axs103)
Merging arm-current/fixes (9e25ebfe56ec ARM: 8685/1: ensure memblock-limit is pmd-aligned)
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (029d9252b116 powerpc/mm: Mark __init memory no-execute when STRICT_KERNEL_RWX=y)
Merging sparc/master (8cd3ec51c0c3 sbus: Convert to using %pOF instead of full_name)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (cbf5ecb30560 net: bonding: Fix transmit load balancing in balance-alb mode)
Merging ipsec/master (e6194923237f esp: Fix memleaks on error paths.)
Merging netfilter/master (36ac344e16e0 netfilter: expect: fix crash when putting uninited expectation)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (35abcd4f9f30 brcmfmac: fix uninitialized warning in brcmf_usb_probe_phase2())
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (610e1ae9b533 ALSA: fm801: Initialize chip after IRQ handler is registered)
Merging pci-current/for-linus (34d5ac2af644 PCI: rockchip: Check for pci_scan_root_bus_bridge() failure correctly)
Merging driver-core.current/driver-core-linus (5771a8c08880 Linux v4.13-rc1)
Merging tty.current/tty-linus (c6325179238f tty: Fix TIOCGPTPEER ioctl definition)
Merging usb.current/usb-linus (d6f5f071f1e1 xhci: fix memleak in xhci_run())
Merging usb-gadget-fixes/fixes (b8b9c974afee usb: renesas_usbhs: gadget: disable all eps when the driver stops)
Merging usb-serial-fixes/usb-linus (9585e340db9f USB: serial: cp210x: add support for Qivicon USB ZigBee dongle)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (5a1d4c5dd4eb staging: rtl8188eu: add TL-WN722N v2 support)
Merging char-misc.current/char-misc-linus (c89876dda018 w1: omap-hdq: fix error return code in omap_hdq_probe())
Merging input-current/for-linus (293b915fd9be Input: trackpoint - assume 3 buttons when buttons detection fails)
Merging crypto-current/master (41cdf7a45389 crypto: authencesn - Fix digest_null crash)
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (5771a8c08880 Linux v4.13-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (745f79ac9373 media: cec-notifier: small improvements)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (9cc5bb18bd0a drm/i915: Fix bad comparison in skl_compute_plane_wm.)
Merging drm-misc-fixes/for-linux-next-fixes (636c4c3e762b drm/mst: Avoid processing partially received up/down message transactions)
Merging kbuild/for-next (6a007e0e602b kbuild: modpost: Warn about references from rodata to __init text)
Applying: Revert "kbuild: modpost: Warn about references from rodata to __init text"
Merging uuid/for-next (b86a496a4206 ACPI: hns_dsaf_acpi_dsm_guid can be static)
Merging dma-mapping/for-next (878ec36765fa ARM: NOMMU: Wire-up default DMA interface)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (6f8119230ed0 ARC: set boot print log level to PR_INFO)
Merging arm/for-next (fc256ee00f0c Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (5771a8c08880 Linux v4.13-rc1)
Merging arm-soc/for-next (ebc5ff9e87f6 Merge branch 'next/dt64' into for-next)
Merging actions/for-next (8ba75fbb148a Merge branch 'v4.13/arm+sps' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (f99503e956ae Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (cd9e550740ae Merge branch 'at91-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (389c81b7e7ae Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (078690243113 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (b45371147f9d Merge branch 'for_4.13/keystone_dts' into next)
Merging mvebu/for-next (fd63b625307d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (05f2a5417cf1 Merge branch 'omap-for-v4.13/mmc-regulator' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (e0be864f1424 ARC: reset: introduce HSDKv1 reset driver)
Merging qcom/for-next (6a3282b03fe6 Merge tag 'qcom-defconfig-for-4.13-2' into all-for-4.13-revised)
Merging realtek/for-next (007e6304223c Merge branch 'v4.13/dt64' into next)
Merging renesas/next (c2432fc935fd Merge branch 'fixes-for-v4.13' into next)
Merging rockchip/for-next (8f2f97b7a071 Merge branch 'v4.14-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (d745ae1ae91c Merge branch 'next/soc' into for-next)
Merging sunxi/sunxi/for-next (d6aa74d396fe Merge branch 'sunxi/dt64-for-4.14' into sunxi/for-next)
Merging tegra/for-next (07bb9460b188 Merge branch for-4.13/arm64/dt into for-next)
Merging arm64/for-next/core (425e1ed73e65 arm64: fix endianness annotation for 'struct jit_ctx' and friends)
Merging clk/clk-next (1f5e4c15d3bb Merge branch 'clk-fixes' into clk-next)
Merging c6x/for-linux-next (91ebcd1b97ae MAINTAINERS: update email address for C6x maintainer)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (4658c0a43043 m68k: allow NULL clock for clk_get_rate)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (e36f14f04d11 Merge branch '4.13-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (6f7da290413b Linux 4.12)
Merging powerpc/next (1e0fc9d1eb2b powerpc/Kconfig: Enable STRICT_KERNEL_RWX for some configs)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (622b0681cfea s390/spinlock: add niai spinlock hints)
Merging sparc-next/master (cb8c65ccff7f Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (7c88f2bf7840 tile: defconfig: Cleanup from old Kconfig options)
Merging uml/linux-next (61e8d462457f um: Correctly check for PTRACE_GETRESET/SETREGSET)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (bdf3b55fde37 Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (2f93381a60d9 Merge branch 'for-next-next-v4.14-20170719' into for-next-20170719)
Merging ceph/master (7c40b22f6f84 libceph: potential NULL dereference in ceph_msg_data_create())
Merging cifs/for-next (235b84fc862a Merge branch 'i2c/for-4.13' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (84969465ddc4 hfsplus: Don't clear SGID when inheriting ACLs)
Merging ext4/dev (ff95015648df ext4: fix spelling mistake: "prellocated" -> "preallocated")
Merging f2fs/dev (63a86362130f Merge tag 'pm-4.13-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
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
Merging file-locks/linux-next (9d5b86ac13c5 fs/locks: Remove fl_nspid and use fs-specific l_pid for remote locks)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (f4e981cba2de printk: add __printf attributes to internal functions)
Merging pci/next (af3c8d98508d Merge tag 'drm-for-v4.13' of git://people.freedesktop.org/~airlied/linux)
Merging pstore/for-next/pstore (0752e4028c00 powerpc/nvram: use memdup_user)
Merging hid/for-next (4ce1a33cb462 Merge branch 'for-4.14/asus' into for-next)
Merging i2c/i2c/for-next (4ca6df134847 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (8efa050f19fe firmware: dmi_scan: Check DMI structure length)
Merging hwmon-staging/hwmon-next (2732fc0ffb35 hwmon: (i5k_amb) constify pci_device_id)
Merging jc_docs/docs-next (e604f1cb8536 docs: disable KASLR when debugging kernel)
Merging v4l-dvb/master (6538b02d210f media: Make parameter of media_entity_remote_pad() const)
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (4c99ceda0d06 fbdev: make get_fb_unmapped_area depends of !MMU)
Merging pm/linux-next (064dba0dd86d Merge branch 'pm-domains' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (5d72ed35678a Merge branches 'thermal-core', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (e94d6f64e7ba dlm: print log message when cluster name is not set)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (760446f96767 cxgb4: display serial config and vpd versions)
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (04ba724b659c netfilter: nfnetlink: extended ACK reporting)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (17d9aa66b08d Merge tag 'iwlwifi-next-for-kalle-2017-06-30' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (1d609dd32cd2 Bluetooth: btwilink: remove unnecessary static in bt_ti_probe())
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (760765903025 Merge tag 'v4.13-rc1' into k.o/for-4.14)
Merging gfs2/for-next (98e5a91a6136 gfs2: Fixup to "Get rid of flush_delayed_work in gfs2_evict_inode")
Merging mtd/master (7d84120b5ba6 Documentation: ABI: mtd: describe "offset" more precisely)
Merging l2-mtd/master (7d84120b5ba6 Documentation: ABI: mtd: describe "offset" more precisely)
Merging nand/nand/next (81667e9c8ad8 mtd: nand: mtk: release lock on error path)
Merging spi-nor/spi-nor/next (f384b352cbf0 mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables)
Merging crypto/master (10a515ddb5f1 hwrng: remember rng chosen by user)
Merging drm/drm-next (a26307ced13c Merge tag 'drm-misc-next-2017-07-18' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vc4/vc4_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Applying: drm: fixes for staging due to API changes in the drm core
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (3118cb067855 drm/i915: Drop unpin stall in atomic_prepare_commit)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (5be37168d3bb drm: Improve kerneldoc for drm_modeset_lock)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (4a630fadbb29 drm/msm: Fix potential buffer overflow issue)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e40eda3dda1e drm/arm: mali-dp: Use CMA helper for plane buffer address calculation)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (790cb4c7c954 drm/imx: lock scanout transfers for consecutive bursts)
Merging etnaviv/etnaviv/next (8cc47b3ea082 drm/etnaviv: populate GEM objects on cpu_prep)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (65745e84ee10 Merge remote-tracking branch 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (6c5a266029cc ALSA: hda: constify pci_device_id.)
Merging sound-asoc/for-next (89526e36d1c1 Merge remote-tracking branch 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (5771a8c08880 Linux v4.13-rc1)
Merging input/next (4323418d62fe Input: sur40 - skip all blobs that are not touches)
Merging block/for-next (3b06b1a7448e Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (d780d124fc69 dm integrity: optimize writing dm-bufio buffers that are partially changed)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (f6aa1ee22b18 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (0101976175df md/raid1: fix writebehind bio clone)
Merging mfd/for-mfd-next (48a14b9f0cc6 mfd: max8998: Fix potential NULL pointer dereference)
Merging backlight/for-backlight-next (8c03a937ca99 backlight: pwm_bl: Make of_device_ids const)
Merging battery/for-next (5771a8c08880 Linux v4.13-rc1)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (01be70f6b487 Merge remote-tracking branch 'regulator/topic/qcom' into regulator-next)
Merging security/next (3cf299314532 LSM: Remove security_task_create() hook.)
Merging integrity/next (fc26bd50539b IMA: update IMA policy documentation to include pcr= option)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (12f6dc2696a5 selinux: Assign proper class to PF_UNIX/SOCK_RAW sockets)
Merging tpmdd/next (e7d872bf1bc5 Documentation: tpm: add powered-while-suspended binding documentation)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (6a7086431fa1 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/smmu', 'arm/core', 'x86/vt-d', 'x86/amd', 's390' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7f56c30bd0a2 vfio: Remove unnecessary uses of vfio_container.group_lock)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (15318a9f8015 audit: Reduce overhead using a coarse clock)
Merging devicetree/for-next (d1651b03c2df of: overlay: add overlay symbols to live device tree)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (10b26bee84ce Merge remote-tracking branches 'spi/topic/pxa2xx', 'spi/topic/sh-msiof', 'spi/topic/stm32', 'spi/topic/sunxi' and 'spi/topic/tegra' into spi-next)
Merging tip/auto-latest (5d9df3b2a39a Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (2efdda4a4108 EDAC, cpc925, ppc4xx: Convert to using %pOF instead of full_name)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (2e028c4fe129 ftrace: Fix uninitialized variable in match_records())
Merging rcu/rcu/next (5a654f4c0153 rcutorture: Invoke call_rcu() from timer handler)
Merging kvm/linux-next (5771a8c08880 Linux v4.13-rc1)
Merging kvm-arm/next (d38338e396ee arm64: Remove a redundancy in sysreg.h)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (d52cd2076eb2 KVM: s390: Inject machine check into the nested guest)
Merging xen-tip/linux-next (764ffce17fd5 xen/balloon: don't online new memory initially)
Merging percpu/for-next (9c01516278ef percpu: update the header comment and pcpu_build_alloc_info comments)
Merging workqueues/for-next (d593b7e8b15f Merge branch 'for-4.13-fixes' into for-next)
Merging drivers-x86/for-next (5771a8c08880 Linux v4.13-rc1)
Merging chrome-platform/for-next (3c778a7fcfaa platform/chrome : Add myself as Maintainer)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (c68729119f4d leds: tlc591xx: add missing of_node_put)
Merging ipmi/for-next (4495ec6d770e ipmi:ssif: Add missing unlock in error branch)
Merging driver-core/driver-core-next (d8bcf4db9244 arch_topology: Get rid of cap_parsing_done)
Merging usb/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-gadget/next (5771a8c08880 Linux v4.13-rc1)
Merging usb-serial/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-chipidea-next/ci-for-usb-next (b74c43156c0c usb: chipidea: msm: ci_hdrc_msm_probe() missing of_node_get())
Merging phy-next/next (5771a8c08880 Linux v4.13-rc1)
Merging tty/tty-next (5771a8c08880 Linux v4.13-rc1)
Merging char-misc/char-misc-next (91c17449fe04 Revert "x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set")
Merging extcon/extcon-next (5c27036d2b05 extcon: Convert to using %pOF instead of full_name)
Merging staging/staging-next (d56c160cb625 staging: lustre: fix spelling mistake, "grranted" -> "granted")
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (2d4e17e5f86e Merge branch 'topic/ioat' into next)
Merging cgroup/for-next (8b4950c0eab6 Merge branch 'for-4.13-fixes' into for-next)
Merging scsi/for-next (14074aba4bcd scsi: sg: fix static checker warning in sg_is_valid_dxfer)
Merging scsi-mkp/for-next (6f37e2102778 scsi: libfc: pass an error pointer to fc_disc_error())
Merging target-updates/for-next (138d351eefb7 iscsi-target: Add login_keys_workaround attribute for non RFC initiators)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (37cbf519e8c6 Merge branch 'for-4.13-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (e41b1355508d virtio_balloon: disable VIOMMU support)
Merging rpmsg/for-next (9ef2b6cc595a Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (8d2c6297aec9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mvebu.c
Merging pinctrl/for-next (ece5946c2eed Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (12cdd5790fe3 pinctrl: samsung: Consistently use unsigned instead of u32 for nr_banks)
Merging pwm/for-next (5ec8c48a6235 Merge branch 'for-4.13/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (b539713a5961 signal: Fix sending signals with siginfo)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (5771a8c08880 Linux v4.13-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (a627ed2ecdea coresight: etm4x: Adds trace return stack option programming for ETMv4.)
Merging rtc/rtc-next (5771a8c08880 Linux v4.13-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bbb3be170ac2 device-dax: fix sysfs duplicate warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb00e6b58abb Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
Merging akpm-current/current (7f004d4884d4 kernel-reboot-add-devm_register_reboot_notifier-fix)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (d7980276133e lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
