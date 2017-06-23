From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 23
Date: Fri, 23 Jun 2017 17:13:58 +1000
Message-ID: <20170623171358.1c1ff8fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751149AbdFWHOB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jun 2017 03:14:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170622:

Removed tree: dma-mapping
Renamed tree: dma-mapping-hch to dma-mapping

The net-next tree gained a conflict against the net tree.

The sound-asoc tree gained a conflict against the pm tree.

The block tree gained a conflict against Linus' tree.

The devicetree tree gained a conflict the net-next tree.

I applied a supplied patch to fix the sparc64 build.

I dropped some patches from the akpm-current tree as requested.

Non-merge commits (relative to Linus' tree): 8649
 8369 files changed, 690739 insertions(+), 169235 deletions(-)

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
Merging origin/master (a38371cba675 Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (2f263d145140 kbuild: fix header installation under fakechroot environment)
Merging arc-current/for-curr (45c7d002f207 ARC: defconfig: Cleanup from old Kconfig options)
Merging arm-current/fixes (d360a687d995 ARM: 8682/1: V7M: Set cacheid iff DminLine or IminLine is nonzero)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (bf05fc25f268 powerpc/perf: Fix oops when kthread execs user process)
Merging sparc/master (d8f431a0de40 Merge branch 'sparc-Suppressing-version-generation-failed-warnings-in-sparc')
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (bb53f4d4f511 sfc: Fix MCDI command size for filter operations)
Merging ipsec/master (ca3a1b856636 esp6_offload: Fix IP6CB(skb)->nhoff for ESP GRO)
Merging netfilter/master (4b1f0d33db7d net: ipmr: Fix some mroute forwarding issues in vrf's)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (35abcd4f9f30 brcmfmac: fix uninitialized warning in brcmf_usb_probe_phase2())
Merging mac80211/master (4b153ca989a9 Merge tag 'mac80211-for-davem-2017-06-16' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging sound-current/for-linus (c7ecb9068e67 ALSA: hda - Apply quirks to Broxton-T, too)
Merging pci-current/for-linus (98dbf5af4fdd PCI: endpoint: Select CRC32 to fix test build error)
Merging driver-core.current/driver-core-linus (08332893e37a Linux 4.12-rc2)
Merging tty.current/tty-linus (3c2993b8c614 Linux 4.12-rc4)
Merging usb.current/usb-linus (dec08194ffec xhci: Limit USB2 port wake support for AMD Promontory hosts)
Merging usb-gadget-fixes/fixes (f50b878fed33 USB: gadget: fix GPF in gadgetfs)
Merging usb-serial-fixes/usb-linus (996fab55d864 USB: serial: qcserial: new Sierra Wireless EM7305 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (9605bc46433d phy: qualcomm: phy-qcom-qmp: fix application of sizeof to pointer)
Merging staging.current/staging-linus (41f1830f5a7a Linux 4.12-rc6)
Merging char-misc.current/char-misc-linus (32c1431eea48 Linux 4.12-rc5)
Merging input-current/for-linus (817ae460c784 Input: i8042 - add Fujitsu Lifebook AH544 to notimeout list)
Merging crypto-current/master (019d62db5401 crypto: caam - fix gfp allocation flags (part II))
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (f9f314f32395 [media] media/cec.h: use IS_REACHABLE instead of IS_ENABLED)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (a8ae0a773d38 drm/i915: Don't enable backlight at setup time.)
Merging drm-misc-fixes/for-linux-next-fixes (e94ac3510b6a drm: Fix GETCONNECTOR regression)
Merging kbuild/for-next (d29bdc239223 Merge branches 'kbuild', 'thin-ar' and 'misc' into for-next)
Merging uuid/for-next (c37f69ff2e6a mmc: sdhci-pci: make guid intel_dsm_guid static)
Merging dma-mapping/for-next (335979c41912 MAINTAINERS: add entry for dma mapping helpers)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (db60a589614c ARC: set boot print log level to PR_INFO)
Merging arm/for-next (8288dded165c Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (c0f7f7acdecd perf: xgene: Add support for SoC PMU version 3)
Merging arm-soc/for-next (5c6e94961309 Document merges)
Merging actions/for-next (dadf70c41231 Merge branch 'v4.13/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (f99503e956ae Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (630efea351f0 Merge branch 'at91-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
CONFLICT (add/add): Merge conflict in arch/arm/mach-at91/samv7.c
CONFLICT (content): Merge conflict in arch/arm/mach-at91/Kconfig
Merging bcm2835/for-next (652fb0c6435c Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (bf6e15ed7f86 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (b45371147f9d Merge branch 'for_4.13/keystone_dts' into next)
Merging mvebu/for-next (cf79eb3aab84 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (33bb085d65d5 Merge branch 'omap-for-v4.13/soc-v4' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (dfeac250c429 reset: zx2967: constify zx2967_reset_ops.)
Merging qcom/for-next (9c60544280d4 Merge tag 'qcom-drivers-for-4.13' into all-for-4.13-revised)
Merging realtek/for-next (007e6304223c Merge branch 'v4.13/dt64' into next)
Merging renesas/next (d75d45bfffd5 Merge branch 'fixes-for-v4.13' into next)
Merging rockchip/for-next (dd3f24b9ff88 Merge branch 'v4.13-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (5fa286799f96 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (efb85d294c2a Merge branches 'sunxi/h3-for-4.13', 'sunxi/dt-for-4.13' and 'sunxi/dt64-for-4.13' into sunxi/for-next)
Merging tegra/for-next (07bb9460b188 Merge branch for-4.13/arm64/dt into for-next)
Merging arm64/for-next/core (8effeaaf2cac arm64: dump cpu_hwcaps at panic time)
Merging clk/clk-next (72d0d8672cf6 clk: uniphier: provide NAND controller clock rate)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging c6x/for-linux-next (91ebcd1b97ae MAINTAINERS: update email address for C6x maintainer)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (dbda37714dac m68k: defconfig: Cleanup from old Kconfig options)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (156b0ddcf50b Merge branch '4.12-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (f02e6c61bc1f parisc: Don't hardcode PSW values in hpmc code)
Merging powerpc/next (fd88b945c188 powerpc/64s: Rename slb_allocate_realmode() to slb_allocate())
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (f044f4c58898 s390/fpu: export save_fpu_regs for all configs)
Merging sparc-next/master (c55c5ddedba0 sparc/time: make of_device_ids const)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (bdf3b55fde37 Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (174c6c563019 Merge branch 'for-next-current-v4.12-20170621' into for-next-20170621)
Merging ceph/master (4ca2fea6f827 ceph: unify inode i_ctime update)
Merging cifs/for-next (517a6e43c487 CIFS: Fix some return values in case of error in 'crypt_message')
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (fd3cfad374d4 udf: Convert udf_disk_stamp_to_time() to use mktime64())
Merging ext4/dev (e12873d33dcc ext4: add nombcache mount option)
Merging f2fs/dev (01d42209996c f2fs: introduce reserved_blocks in sysfs)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (68227c03cba8 fuse: initialize the flock flag in fuse_file on allocation)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (5acd48642842 PNFS fix dangling DS mount)
Merging nfsd/nfsd-next (bb2a8b0cd116 nfsd4: const-ify nfsd4_ops)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (a082c6f680da ovl: filter trusted xattr for non-admin)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (7bccd12d27b7 ubi: Add debugfs file for tracking PEB state)
Merging xfs/for-next (4f4a8bf32040 xfs: free uncommitted transactions during log recovery)
Merging file-locks/linux-next (90e01997591f btrfs: minimal conversion to errseq_t writeback error reporting on fsync)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging vfs/for-next (919bb328b020 Merge branch 'work.misc' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (f4e981cba2de printk: add __printf attributes to internal functions)
Merging pci/next (44825fb1af1d Merge branch 'pci/host-xilinx' into next)
Merging pstore/for-next/pstore (d3762358a739 pstore: Fix format string to use %u for record id)
Merging hid/for-next (4f9f2a4f4c6d Merge branch 'for-4.13/retrode' into for-next)
Merging i2c/i2c/for-next (b54d85862214 Merge branch 'i2c/for-4.13' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (8efa050f19fe firmware: dmi_scan: Check DMI structure length)
Merging hwmon-staging/hwmon-next (3a2b3d37e1ee hwmon: (ibmpowernv) Add current(A) sensor)
Merging jc_docs/docs-next (68f04b571da4 Doc: fix a markup error in coding-style.rst)
Merging v4l-dvb/master (76724b30f222 [media] media: venus: enable building with COMPILE_TEST)
Merging v4l-dvb-next/master (791a9a666d1a Merge tag 'kbuild-uapi-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging fbdev/fbdev-for-next (a8feae091106 uvesafb: Fix continuation printks without KERN_LEVEL to pr_cont, neatening)
Merging pm/linux-next (6b1386dcf341 Merge branch 'pm-opp' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (33011c583fcc Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (4b943faedfc2 udp/v6: prefetch rmem_alloc in udp6_queue_rcv_skb())
CONFLICT (content): Merge conflict in drivers/net/wireless/marvell/mwifiex/pcie.c
CONFLICT (content): Merge conflict in drivers/net/macvlan.c
Applying: remove duplicate ethernet node intruduced by merge
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (34158151d2aa netfilter: cttimeout: use nf_ct_iterate_cleanup_net to unlink timeout objs)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (52f8c9380f2e Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (3715c47bcda8 Merge branch 'r8152-support-new-chips')
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (5ed02dbb4974 Linux 4.12-rc3)
Merging gfs2/for-next (722f6f62a563 GFS2: Eliminate vestigial sd_log_flush_wrapped)
Merging mtd/master (05e97a9eda72 Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD)
Merging l2-mtd/master (6eab81e63587 MAINTAINERS: Update SPI NOR subsystem git repositories)
Merging nand/nand/next (a57ce439505d MAINTAINERS: add entry for Denali NAND controller driver)
Merging spi-nor/spi-nor/next (7ef0e5e16d18 mtd: spi-nor: aspeed: configure chip window on AHB bus)
Merging crypto/master (30b4c54ccdeb crypto: ccp - Release locks before returning)
Merging drm/drm-next (047b8e21e3bf Merge tag 'drm-misc-next-2017-06-19_0' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (c5e855d07834 drm/i915: Always use 9 bits of the LPC bridge device ID for PCH detection)
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (e6f0acb2f0da bridge: Fix panel-bridge error return on !panel.)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (4a630fadbb29 drm/msm: Fix potential buffer overflow issue)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e40eda3dda1e drm/arm: mali-dp: Use CMA helper for plane buffer address calculation)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (add1318723a0 gpu: ipu-v3: vdic: include AUTO field order bit in ipu_vdi_set_field_order)
Merging etnaviv/etnaviv/next (46a269da7e8a drm/etnaviv: restore ETNA_PREP_NOSYNC behaviour)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (5ea32fb24a83 Merge remote-tracking branches 'regmap/topic/1wire', 'regmap/topic/irq' and 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (c2d6af53a43f ALSA: hda/realtek - Add default procedure for suspend and resume state)
Merging sound-asoc/for-next (98edf4b8bec2 Merge remote-tracking branches 'asoc/topic/stm32', 'asoc/topic/sunxi', 'asoc/topic/tlv320dac31xx', 'asoc/topic/topology' and 'asoc/topic/wm-adsp' into asoc-next)
CONFLICT (content): Merge conflict in drivers/of/base.c
Applying: of_graph: merge fix up for creating of drivers/of/property.c
Merging modules/modules-next (3e2e857f9c3a module: Add module name to modinfo)
Merging input/next (be19788c73d3 Input: xpad - sync supported devices with XBCD)
Merging block/for-next (6d3b7d63a3d4 Merge branch 'for-4.13/block' into for-next)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.h
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.h
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.c
CONFLICT (content): Merge conflict in drivers/s390/block/scm_blk.h
CONFLICT (content): Merge conflict in drivers/s390/block/scm_blk.c
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in block/blk-mq-sched.c
Applying: s390: fix up for "blk-mq: switch ->queue_rq return value to blk_status_t"
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (3b1a94c88b79 dm zoned: drive-managed zoned block device target)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (2fe35968fecc mmc: renesas-sdhi: improve checkpatch cleanness)
CONFLICT (content): Merge conflict in drivers/mmc/core/block.c
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (5a85071c2cbc md: use a separate bio_set for synchronous IO.)
Applying: md: fix up for "blk: replace bioset_create_nobvec() with a flags arg to bioset_create()"
Merging mfd/for-mfd-next (d905cd268c76 dt-bindings: vendor-prefixes: Add arctic to vendor prefix)
Merging backlight/for-backlight-next (7e715c2d9c27 backlight: Report error on failure)
Merging battery/for-next (bfa953d336cd power: supply: sbs-battery: Don't needlessly set CAPACITY_MODE)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (5b5ca94679d5 Merge remote-tracking branches 'regulator/topic/settle', 'regulator/topic/tps65910' and 'regulator/topic/tps65917' into regulator-next)
Merging security/next (5965453d5e3f Merge branch 'stable-4.13' of git://git.infradead.org/users/pcmoore/selinux into next)
Merging integrity/next (fc26bd50539b IMA: update IMA policy documentation to include pcr= option)
Merging keys/keys-next (3088c2ad40cf Merge remote-tracking branch 'origin/keys-fixes' into keys-next)
CONFLICT (content): Merge conflict in security/keys/dh.c
Merging selinux/next (6a3911837da0 selinux: enable genfscon labeling for tracefs)
Merging tpmdd/next (7df12cdde474 tpm: consolidate the TPM startup code)
Merging watchdog/master (3a9aedb282ac watchdog: w83627hf: Add support for NCT6793D and NCT6795D)
Merging iommu/next (c71bf5f13305 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/core', 'x86/vt-d' and 'x86/amd' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7b3a10df1d4b vfio: Use ERR_CAST() instead of open coding it)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (cd33f5f2cbfa audit: make sure we never skip the multicast broadcast)
Merging devicetree/for-next (8ee8a0e795e7 dt-bindings: thermal: add file extension to brcm,ns-thermal)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net/ethernet.txt
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (7d1da5f53955 Merge remote-tracking branches 'spi/topic/st-ssc4' and 'spi/topic/stm32' into spi-next)
Merging tip/auto-latest (de98cec5be75 Merge branch 'x86/timers')
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm/include/uapi/asm/Kbuild
CONFLICT (modify/delete): Documentation/DocBook/kernel-hacking.tmpl deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of Documentation/DocBook/kernel-hacking.tmpl left in tree.
$ git rm -f Documentation/DocBook/kernel-hacking.tmpl
Applying: sched/wait: fix up for "docs-rst: convert kernel-hacking to ReST"
Merging clockevents/clockevents/next (d9569035d594 clocksource: Add an alias macro CLOCKSOURCE_OF_DECLARE)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
CONFLICT (content): Merge conflict in drivers/clocksource/timer-fttmr010.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-moxart/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (ff0abed4922f EDAC, altera: Simplify calculation of total memory)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (681bec0367c2 tracing: Rename update the enum_map file)
Merging rcu/rcu/next (4384c26f62d9 rcu: Migrate callbacks earlier in the CPU-offline timeline)
Merging kvm/linux-next (865279c53ca9 tools/kvm_stat: display guest list in pid/guest selection screens)
Merging kvm-arm/next (d38338e396ee arm64: Remove a redundancy in sysreg.h)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (579006944e0d KVM: PPC: Book3S HV: Virtualize doorbell facility on POWER9)
Merging kvms390/next (1cae025577f4 KVM: s390: avoid packed attribute)
CONFLICT (content): Merge conflict in arch/s390/kvm/gaccess.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/kvm_host.h
Merging xen-tip/linux-next (84b7625728ea xen: add sysfs node for hypervisor build id)
Merging percpu/for-next (303abfdf76ea percpu: fix early calls for spinlock in pcpu_stats)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (f4d342cf900a platform/x86: silead_dmi: Add touchscreen info for PoV mobii wintab p800w)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (64601cb1343f leds: Remove SEAD-3 driver)
Merging ipmi/for-next (0944d889a237 ipmi: Convert DMI handling over to a platform device)
Merging driver-core/driver-core-next (d565ed38d045 arm: mach-rpc: ecard: fix build error)
Merging usb/usb-next (9c691cc9f8b5 usb: musb: tusb6010_omap: Convert to DMAengine API)
Merging usb-gadget/next (0591bc236015 usb: gadget: add f_uac1 variant based on a new u_audio api)
Merging usb-serial/usb-next (c22ac6d29f18 USB: serial: propagate late probe errors)
Merging usb-chipidea-next/ci-for-usb-next (c4a0bbbdb7f6 usb: chipidea: properly handle host or gadget initialization failure)
Merging phy-next/next (af850e14a7ae phy: bcm-ns-usb3: add MDIO driver using proper bus layer)
Merging tty/tty-next (9f60e0e7aea6 tty/serial: meson_uart: update to stable bindings)
CONFLICT (content): Merge conflict in include/linux/platform_data/atmel.h
Merging char-misc/char-misc-next (cbbdc6082917 misc: apds990x: Use sysfs_match_string() helper)
CONFLICT (content): Merge conflict in Documentation/admin-guide/index.rst
CONFLICT (modify/delete): Documentation/DocBook/w1.tmpl deleted in HEAD and modified in char-misc/char-misc-next. Version char-misc/char-misc-next of Documentation/DocBook/w1.tmpl left in tree.
$ git rm -f Documentation/DocBook/w1.tmpl
Applying: docs-rst: merge fix for "DocBook: w1: Update W1 file locations and names in DocBook"
Merging extcon/extcon-next (1f4be24786b8 extcon: int3496: Switch to devm_acpi_dev_add_driver_gpios())
Merging staging/staging-next (d06838de4a01 Merge 4.12-rc6 into staging-next)
CONFLICT (content): Merge conflict in include/uapi/linux/tty.h
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (a24064ddb354 Merge branch 'for-linus' into next)
Merging cgroup/for-next (b6053d40e338 cgroup: fix lockdep warning in debug controller)
Merging scsi/for-next (086154128ccf Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_lib.c
Merging scsi-mkp/for-next (b609b1c75336 scsi: lpfc: update to revision to 11.4.0.1)
Merging target-updates/for-next (28d44b983000 tcmu: Add Type of reconfig into netlink)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_target.c
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (f7f78c6fb296 Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (e41b1355508d virtio_balloon: disable VIOMMU support)
Merging rpmsg/for-next (0696d197bda1 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (f245d9ef6616 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (40dadbafbdb4 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-samsung/for-next (a453f3693f2a pinctrl: samsung: Explicitly cast pointer returned by of_iomap() to iomem)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (296990deb389 mnt: Make propagate_umount less slow for overlapping mount propagation trees)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (e2682130931f random: suppress spammy warnings about unseeded randomness)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (34539b6c487c kselftest: membarrier: make test names more informative)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/dev-tools/index.rst
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (92cd7037795e arm64: dts: qcom: msm8916: Add debug unit)
Merging rtc/rtc-next (5c82a6ae0242 rtc: remove rtc_device.name)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f5705aa8cfed dax, xfs, ext4: compile out iomap-dax paths in the FS_DAX=n case)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (b3645fbb0553 Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/fs.h
Applying: apparmor: put back designators in struct initialisers
Applying: sparc64: Use indirect calls in hamming weight stubs.
Merging powerpc-fixes/fixes (34f19ff1b5a0 powerpc/64: Initialise thread_info for emergency stacks)
Merging powerpc/next (d4cfb11387ee powerpc: Convert VDSO update function to use new update_vsyscall interface)
Merging akpm-current/current (93a73791c095 ipc/util.h: update documentation for ipc_getref() and ipc_putref())
CONFLICT (content): Merge conflict in include/linux/sem.h
CONFLICT (content): Merge conflict in include/linux/random.h
CONFLICT (content): Merge conflict in include/linux/ipc.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/netfilter/x_tables.c: use kvmalloc() in xt_alloc_table_info()
Applying: sparc64: NG4 memset 32 bits overflow
Applying: xtensa: use generic fb.h
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (0da4bfe2d8ff lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
