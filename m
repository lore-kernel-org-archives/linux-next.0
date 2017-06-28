From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 28
Date: Wed, 28 Jun 2017 19:16:24 +1000
Message-ID: <20170628191624.132fb489@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55327 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751501AbdF1JQ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 05:16:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170627:

I applied a supplied patch to the pci tree to fix a build problem.

The i2c tree lost its build failure.

The block tree gained a conflict against the file-locks tree. It also
gained a build failure on 32 bit powerpc for which I applied a patch.

The tip tree gained conflicts against the pci and blutooth trees.

The xen-tip tree gained a conflict against the tip tree.

The target-updates tree gained conflicts against the scsi tree.

The kspp tree gained a conflict against the block tree.

The akpm-current tree gained a conflict against the kselftest tree.

Non-merge commits (relative to Linus' tree): 9468
 8884 files changed, 722147 insertions(+), 179596 deletions(-)

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
Merging origin/master (3c2bfbaadff6 Merge branch 'fixes' of git://git.armlinux.org.uk/~rmk/linux-arm)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (ad8181060788 kconfig: fix sparse warnings in nconfig)
Merging arc-current/for-curr (45c7d002f207 ARC: defconfig: Cleanup from old Kconfig options)
Merging arm-current/fixes (d360a687d995 ARM: 8682/1: V7M: Set cacheid iff DminLine or IminLine is nonzero)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (d6bd8194e286 powerpc/32: Avoid miscompilation w/GCC 4.6.3 - don't inline copy_to/from_user())
Merging sparc/master (dbd2667a4fb9 sparc64: Fix gup_huge_pmd)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (e20bd60bf62a net: usb: asix88179_178a: Add support for the Belkin B2B128)
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
Merging input-current/for-linus (9768935264c4 Input: synaptics-rmi4 - only read the F54 query registers which are used)
Merging crypto-current/master (019d62db5401 crypto: caam - fix gfp allocation flags (part II))
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (d4ed3b9015b5 mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging mfd-fixes/for-mfd-fixes (9e69672e90cc dt-bindings: mfd: Update STM32 timers clock names)
Merging v4l-dvb-fixes/fixes (2a2599c66368 [media] media: entity: Catch unbalanced media_pipeline_stop calls)
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (611cdf3695a3 drm/i915: Disable EXEC_OBJECT_ASYNC when doing relocations)
Merging drm-misc-fixes/for-linux-next-fixes (e94ac3510b6a drm: Fix GETCONNECTOR regression)
Merging kbuild/for-next (39be5eac380d Merge branches 'misc', 'kbuild' and 'thin-ar' into for-next)
Merging uuid/for-next (b86a496a4206 ACPI: hns_dsaf_acpi_dsm_guid can be static)
Merging dma-mapping/for-next (dd64ef4fd3a2 ARM: dma-mapping: Remove traces of NOMMU code)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (db60a589614c ARC: set boot print log level to PR_INFO)
Merging arm/for-next (8288dded165c Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (c0f7f7acdecd perf: xgene: Add support for SoC PMU version 3)
Merging arm-soc/for-next (5d5cb55b2743 Merge branch 'next/arm64' into for-next)
Merging actions/for-next (8ba75fbb148a Merge branch 'v4.13/arm+sps' into next)
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
Merging omap/for-next (eb0028987143 Merge branch 'omap-for-v4.13/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (dfeac250c429 reset: zx2967: constify zx2967_reset_ops.)
Merging qcom/for-next (9c60544280d4 Merge tag 'qcom-drivers-for-4.13' into all-for-4.13-revised)
Merging realtek/for-next (007e6304223c Merge branch 'v4.13/dt64' into next)
Merging renesas/next (d75d45bfffd5 Merge branch 'fixes-for-v4.13' into next)
Merging rockchip/for-next (dd3f24b9ff88 Merge branch 'v4.13-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (005537e095a6 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (efb85d294c2a Merge branches 'sunxi/h3-for-4.13', 'sunxi/dt-for-4.13' and 'sunxi/dt64-for-4.13' into sunxi/for-next)
Merging tegra/for-next (07bb9460b188 Merge branch for-4.13/arm64/dt into for-next)
Merging arm64/for-next/core (3edb1dd13ce6 Merge branch 'aarch64/for-next/ras-apei' into aarch64/for-next/core)
Merging clk/clk-next (682430e87734 clk: keystone: TI_SCI_PROTOCOL is needed for clk driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging c6x/for-linux-next (91ebcd1b97ae MAINTAINERS: update email address for C6x maintainer)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (354b6382847d m68k: defconfig: Cleanup from old Kconfig options)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (0554f2ed67f1 MIPS: Loogson: Make enum loongson_cpu_type more clear)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (d6b1d990957c parisc: use compat_sys_keyctl())
Merging powerpc/next (d4cfb11387ee powerpc: Convert VDSO update function to use new update_vsyscall interface)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (f044f4c58898 s390/fpu: export save_fpu_regs for all configs)
Merging sparc-next/master (a718d1392700 sparc64: fix typo in property)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (bdf3b55fde37 Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (4a240ddbe6b5 Merge branch 'for-next-current-v4.12-20170626' into for-next-20170626)
Merging ceph/master (4ca2fea6f827 ceph: unify inode i_ctime update)
Merging cifs/for-next (b3fdda4d1e1b cifs: Use smb 2 - 3 and cifsacl mount options getacl functions)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (08db141b5313 reiserfs: fix race in prealloc discard)
Merging ext4/dev (037ee4110538 ext4: require key for truncate(2) of encrypted file)
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
Merging xfs/for-next (39775431f82f xfs: free uncommitted transactions during log recovery)
Merging file-locks/linux-next (df3bb902438d btrfs: minimal conversion to errseq_t writeback error reporting on fsync)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging vfs/for-next (919bb328b020 Merge branch 'work.misc' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (f4e981cba2de printk: add __printf attributes to internal functions)
Merging pci/next (44825fb1af1d Merge branch 'pci/host-xilinx' into next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_device.c
Applying: PCI: mediatek: change to use the new host bridge interface
Merging pstore/for-next/pstore (d3762358a739 pstore: Fix format string to use %u for record id)
Merging hid/for-next (0f9089b979a6 Merge branch 'for-4.13/wacom' into for-next)
Merging i2c/i2c/for-next (25c34d08744f Merge branch 'i2c/for-4.13' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (8efa050f19fe firmware: dmi_scan: Check DMI structure length)
Merging hwmon-staging/hwmon-next (44b413661b57 hwmon: (aspeed-pwm-tacho) Poll with short sleeps.)
Merging jc_docs/docs-next (52b3f239bb69 Docs: clean up some DocBook loose ends)
CONFLICT (modify/delete): scripts/kernel-doc-xml-ref deleted in jc_docs/docs-next and modified in HEAD. Version HEAD of scripts/kernel-doc-xml-ref left in tree.
$ git rm -f scripts/kernel-doc-xml-ref
Merging v4l-dvb/master (2748e76ddb29 media: staging: cxd2099: Activate cxd2099 buffer mode)
Merging v4l-dvb-next/master (d9c4615854ec [media] dvb uapi docs: enums are passed by value, not reference)
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-set-voltage.rst
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-set-tone.rst
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst
Merging fbdev/fbdev-for-next (a8feae091106 uvesafb: Fix continuation printks without KERN_LEVEL to pr_cont, neatening)
Merging pm/linux-next (9b87b566ba4b Merge branch 'device-properties' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (33011c583fcc Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (2ee87db3a287 Merge branch 'nfp-get_phys_port_name-for-representors-and-SR-IOV-reorder')
CONFLICT (content): Merge conflict in drivers/net/wireless/marvell/mwifiex/pcie.c
CONFLICT (content): Merge conflict in drivers/net/macvlan.c
Applying: remove duplicate ethernet node intruduced by merge
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (04ba724b659c netfilter: nfnetlink: extended ACK reporting)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (57c00f2fac51 brcmfmac: Fix a memory leak in error handling path in 'brcmf_cfg80211_attach')
Merging bluetooth/master (5da8e47d849d Bluetooth: hidp: fix possible might sleep error in hidp_session_thread)
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (4931c6ef04b4 net/mlx4_en: Optimized single ring steering)
Merging gfs2/for-next (722f6f62a563 GFS2: Eliminate vestigial sd_log_flush_wrapped)
Merging mtd/master (05e97a9eda72 Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD)
Merging l2-mtd/master (c169e3d3c049 mtd: partitions: fixup some allocate_partition() whitespace)
Merging nand/nand/next (edfee3619c49 mtd: nand: mtk: add ->setup_data_interface() hook)
Merging spi-nor/spi-nor/next (1a18915b4971 mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables)
Merging crypto/master (30b4c54ccdeb crypto: ccp - Release locks before returning)
Merging drm/drm-next (6d61e70ccc21 Backmerge tag 'v4.12-rc7' into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_execbuffer.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (bdbbf7d619d1 drm/i915: Clear execbuf's vma backpointer upon release)
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (c048c984de38 Merge remote-tracking branch 'airlied/drm-next' into drm-misc-next-fixes)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (4a630fadbb29 drm/msm: Fix potential buffer overflow issue)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e40eda3dda1e drm/arm: mali-dp: Use CMA helper for plane buffer address calculation)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (994fc62e1d04 drm/imx: lock scanout transfers for consecutive bursts)
Merging etnaviv/etnaviv/next (46a269da7e8a drm/etnaviv: restore ETNA_PREP_NOSYNC behaviour)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (5ea32fb24a83 Merge remote-tracking branches 'regmap/topic/1wire', 'regmap/topic/irq' and 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (b602aa8eb1a0 ALSA: pcm: Disable only control mmap for explicit appl_ptr sync)
Merging sound-asoc/for-next (f08c17370aea Merge remote-tracking branch 'asoc/topic/zx-aud96p22' into asoc-next)
CONFLICT (content): Merge conflict in drivers/of/base.c
Applying: of_graph: merge fix up for creating of drivers/of/property.c
Merging modules/modules-next (165d1cc0074b kmod: reduce atomic operations on kmod_concurrent and simplify)
Merging input/next (be19788c73d3 Input: xpad - sync supported devices with XBCD)
Merging block/for-next (2c4a9e73b3c6 Merge branch 'for-4.13/block' into for-next)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in include/linux/fs.h
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
CONFLICT (content): Merge conflict in drivers/md/dm-raid1.c
CONFLICT (content): Merge conflict in drivers/md/dm-io.c
Applying: s390: fix up for "blk-mq: switch ->queue_rq return value to blk_status_t"
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (0aefb813be29 dm thin: do not queue freed thin mapping for next stage processing)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (2fe35968fecc mmc: renesas-sdhi: improve checkpatch cleanness)
CONFLICT (content): Merge conflict in drivers/mmc/core/block.c
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (7f053a6a7455 MD: fix a null dereference)
Applying: md: fix up for "blk: replace bioset_create_nobvec() with a flags arg to bioset_create()"
Merging mfd/for-mfd-next (d905cd268c76 dt-bindings: vendor-prefixes: Add arctic to vendor prefix)
Merging backlight/for-backlight-next (7e715c2d9c27 backlight: Report error on failure)
Merging battery/for-next (bfa953d336cd power: supply: sbs-battery: Don't needlessly set CAPACITY_MODE)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (5b5ca94679d5 Merge remote-tracking branches 'regulator/topic/settle', 'regulator/topic/tps65910' and 'regulator/topic/tps65917' into regulator-next)
Merging security/next (c377a2c8eaaa Merge tag 'seccomp-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into next)
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
Merging devicetree/for-next (ce4fecf1fe15 vsprintf: Add %p extension "%pOF" for device tree)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net/ethernet.txt
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (aacc6307f188 Merge remote-tracking branches 'spi/topic/st-ssc4' and 'spi/topic/stm32' into spi-next)
Merging tip/auto-latest (fb01f68ee7a4 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in net/bluetooth/hidp/core.c
CONFLICT (content): Merge conflict in net/bluetooth/cmtp/core.c
CONFLICT (content): Merge conflict in net/bluetooth/bnep/core.c
CONFLICT (content): Merge conflict in kernel/irq/affinity.c
CONFLICT (content): Merge conflict in drivers/acpi/apei/ghes.c
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm/include/uapi/asm/Kbuild
CONFLICT (modify/delete): Documentation/DocBook/kernel-hacking.tmpl deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of Documentation/DocBook/kernel-hacking.tmpl left in tree.
$ git rm -f Documentation/DocBook/kernel-hacking.tmpl
Applying: sched/wait: fix up for "docs-rst: convert kernel-hacking to ReST"
Applying: Bluetooth: hidp: fix for "sched/wait: Rename wait_queue_t => wait_queue_entry_t"
Merging clockevents/clockevents/next (d9569035d594 clocksource: Add an alias macro CLOCKSOURCE_OF_DECLARE)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
CONFLICT (content): Merge conflict in drivers/clocksource/timer-fttmr010.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-moxart/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (77641dacead2 EDAC, pnd2: Make function sbi_send() static)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (681bec0367c2 tracing: Rename update the enum_map file)
Merging rcu/rcu/next (49729e9a4e67 torture: Fix typo suppressing CPU-hotplug statistics)
Merging kvm/linux-next (865279c53ca9 tools/kvm_stat: display guest list in pid/guest selection screens)
Merging kvm-arm/next (d38338e396ee arm64: Remove a redundancy in sysreg.h)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (579006944e0d KVM: PPC: Book3S HV: Virtualize doorbell facility on POWER9)
Merging kvms390/next (1cae025577f4 KVM: s390: avoid packed attribute)
CONFLICT (content): Merge conflict in arch/s390/kvm/gaccess.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/kvm_host.h
Merging xen-tip/linux-next (a5d5f328b0e2 xen: allocate page for shared info page from low memory)
CONFLICT (content): Merge conflict in drivers/xen/events/events_base.c
Merging percpu/for-next (303abfdf76ea percpu: fix early calls for spinlock in pcpu_stats)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (f4d342cf900a platform/x86: silead_dmi: Add touchscreen info for PoV mobii wintab p800w)
Merging chrome-platform/for-next (5d6a312e8f99 platform/chrome: cros_ec_lightbar - hide unused PM functions)
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
Merging staging/staging-next (8a21ff775f56 staging: speakup: make ttyio synths use device name)
CONFLICT (content): Merge conflict in include/uapi/linux/tty.h
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (e9446e2b2d9d Merge branch 'for-linus' into next)
Merging cgroup/for-next (39fd64ae9f47 cgroup: "cgroup.subtree_control" should be writeable by delegatee)
Merging scsi/for-next (80de14915dae Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_transport_fc.c
CONFLICT (content): Merge conflict in drivers/scsi/scsi_lib.c
Merging scsi-mkp/for-next (f62f9ffdb5ef scsi: sun_esp: fix device reference leaks)
Merging target-updates/for-next (055c758171c9 tcmu: make array tcmu_attrib_attrs static const)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_target.c
Applying: qla2xxx: fix up for bad merge fix
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (5894b6212dd6 Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (e41b1355508d virtio_balloon: disable VIOMMU support)
Merging rpmsg/for-next (9cbbe36c425f Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
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
Merging kselftest/next (66ec5edabf11 selftests: intel_pstate: add .gitignore)
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/dev-tools/index.rst
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (92cd7037795e arm64: dts: qcom: msm8916: Add debug unit)
Merging rtc/rtc-next (9f4ad359c801 rtc: brcmstb-waketimer: Add Broadcom STB wake-timer)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f5705aa8cfed dax, xfs, ext4: compile out iomap-dax paths in the FS_DAX=n case)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (b3645fbb0553 Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/fs.h
Applying: apparmor: put back designators in struct initialisers
Applying: fs: don't read an enum directly from a u64 __user *
Merging akpm-current/current (9ea4131ee41d ipc/util.h: update documentation for ipc_getref() and ipc_putref())
CONFLICT (modify/delete): tools/testing/selftests/sysctl/run_stringtests deleted in akpm-current/current and modified in HEAD. Version HEAD of tools/testing/selftests/sysctl/run_stringtests left in tree.
CONFLICT (modify/delete): tools/testing/selftests/sysctl/run_numerictests deleted in akpm-current/current and modified in HEAD. Version HEAD of tools/testing/selftests/sysctl/run_numerictests left in tree.
CONFLICT (modify/delete): tools/testing/selftests/sysctl/common_tests deleted in akpm-current/current and modified in HEAD. Version HEAD of tools/testing/selftests/sysctl/common_tests left in tree.
CONFLICT (content): Merge conflict in include/linux/sem.h
CONFLICT (content): Merge conflict in include/linux/random.h
CONFLICT (content): Merge conflict in include/linux/ipc.h
$ git rm -f tools/testing/selftests/sysctl/common_tests tools/testing/selftests/sysctl/run_numerictests tools/testing/selftests/sysctl/run_stringtests
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/netfilter/x_tables.c: use kvmalloc() in xt_alloc_table_info()
Applying: kernel/watchdog: remove unused declaration
Applying: kernel/watchdog: introduce arch_touch_nmi_watchdog()
Applying: kernel/watchdog: split up config options
Applying: watchdog-split-up-config-options-fix
Applying: kernel/watchdog: provide watchdog_nmi_reconfigure() for arch watchdogs
Applying: watchdog-provide-watchdog_reconfigure-for-arch-watchdogs-fix
Applying: kernel/watchdog: hide unused function
Applying: powerpc/64s: implement arch-specific hardlockup watchdog
Applying: powerpc/64s: watchdog honor watchdog disable at boot/hotplug
Applying: powerpc-64s-implement-arch-specific-hardlockup-watchdog-checkpatch-fixes
Applying: efi: avoid fortify checks in EFI stub
Applying: kexec_file: adjust declaration of kexec_purgatory
Applying: IB/rxe: do not copy extra stack memory to skb
Applying: powerpc: don't fortify prom_init
Applying: powerpc: make feature-fixup tests fortify-safe
Applying: include/linux/string.h: add the option of fortified string.h functions
Applying: x86: fix fortified memcpy
Applying: fortify: avoid panic() in favor of BUG()
Applying: sh: mark end of BUG() implementation as unreachable
Applying: x86/mmap: properly account for stack randomization in mmap_base
Applying: arm64/mmap: properly account for stack randomization in mmap_base
Applying: powerpc,mmap: properly account for stack randomization in mmap_base
Applying: MIPS: do not use __GFP_REPEAT for order-0 request
Applying: mm, tree wide: replace __GFP_REPEAT by __GFP_RETRY_MAYFAIL with more useful semantic
Applying: mm-tree-wide-replace-__gfp_repeat-by-__gfp_retry_mayfail-with-more-useful-semantic-fix
Applying: mm-tree-wide-replace-__gfp_repeat-by-__gfp_retry_mayfail-with-more-useful-semantic-fix
Applying: mm-tree-wide-replace-__gfp_repeat-by-__gfp_retry_mayfail-with-more-useful-semantic-fix-3
Applying: xfs: map KM_MAYFAIL to __GFP_RETRY_MAYFAIL
Applying: mm: kvmalloc support __GFP_RETRY_MAYFAIL for all sizes
Applying: drm/i915: use __GFP_RETRY_MAYFAIL
Applying: mm, migration: do not trigger OOM killer when migrating memory
Applying: sparc64: NG4 memset 32 bits overflow
Applying: xtensa: use generic fb.h
Applying: writeback: rework wb_[dec|inc]_stat family of functions
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (8b2d10808084 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
