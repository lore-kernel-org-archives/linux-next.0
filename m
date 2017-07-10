From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 10
Date: Mon, 10 Jul 2017 15:58:43 +1000
Message-ID: <20170710155843.7e373297@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750969AbdGJF6q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 01:58:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Please do not add any v4.14 material to your linux-next included branches
until after v4.13-rc1 has been released.

Changes since 20170707:

The unicore32 tree gained conflicts against the kbuild tree.

The vfs tree gained a build failure for which I applied a hack patch.
And another (from an interaction with the akpm-current tree) for which
I applied a fix patch.

The spi tree gained a build failure so I dropped it for today.

The rtc tree gained a conflict against Linus' tree.

The akpm-current tree gained a conflict against the vfs tree.

The akpm tree gained a conflict against the kbuild tree.

Non-merge commits (relative to Linus' tree): 2763
 2306 files changed, 410296 insertions(+), 48628 deletions(-)

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
Merging origin/master (d3e3b7eac886 afs: Add metadata xattrs)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (ad8181060788 kconfig: fix sparse warnings in nconfig)
Merging arc-current/for-curr (11352460b8dc ARC: [plat-axs10x]: prepare dts files for enabling PAE40 on axs103)
Merging arm-current/fixes (9e25ebfe56ec ARM: 8685/1: ensure memblock-limit is pmd-aligned)
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (d6bd8194e286 powerpc/32: Avoid miscompilation w/GCC 4.6.3 - don't inline copy_to/from_user())
Merging sparc/master (dbd2667a4fb9 sparc64: Fix gup_huge_pmd)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (b36c20244af3 Merge tag 'mlx5-fixes-2017-07-09' of https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging ipsec/master (ca3a1b856636 esp6_offload: Fix IP6CB(skb)->nhoff for ESP GRO)
Merging netfilter/master (c644bd79c0a7 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (35abcd4f9f30 brcmfmac: fix uninitialized warning in brcmf_usb_probe_phase2())
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (20e2b791796b ALSA: msnd: Optimize / harden DSP and MIDI loops)
Merging pci-current/for-linus (98dbf5af4fdd PCI: endpoint: Select CRC32 to fix test build error)
Merging driver-core.current/driver-core-linus (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging tty.current/tty-linus (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging usb.current/usb-linus (cee37d83e6d9 Merge branch 'work.read_write' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging usb-gadget-fixes/fixes (f50b878fed33 USB: gadget: fix GPF in gadgetfs)
Merging usb-serial-fixes/usb-linus (996fab55d864 USB: serial: qcserial: new Sierra Wireless EM7305 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (9605bc46433d phy: qualcomm: phy-qcom-qmp: fix application of sizeof to pointer)
Merging staging.current/staging-linus (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging char-misc.current/char-misc-linus (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging input-current/for-linus (ede2e7cdc58e Merge branch 'next' into for-linus)
Merging crypto-current/master (b82ce24426a4 crypto: sha1-ssse3 - Disable avx2)
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
Merging kbuild/for-next (2a7b59a5e5af kbuild: remove wrapper files handling from Makefile.headersinst)
Merging uuid/for-next (b86a496a4206 ACPI: hns_dsaf_acpi_dsm_guid can be static)
Merging dma-mapping/for-next (1655cf8829d8 ARM: dma-mapping: Remove traces of NOMMU code)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (6f8119230ed0 ARC: set boot print log level to PR_INFO)
Merging arm/for-next (fc256ee00f0c Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (c0f7f7acdecd perf: xgene: Add support for SoC PMU version 3)
Merging arm-soc/for-next (ebc5ff9e87f6 Merge branch 'next/dt64' into for-next)
Merging actions/for-next (8ba75fbb148a Merge branch 'v4.13/arm+sps' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (f99503e956ae Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (19964541c231 Merge tag 'armsoc-arm64' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging bcm2835/for-next (652fb0c6435c Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (bf6e15ed7f86 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (b45371147f9d Merge branch 'for_4.13/keystone_dts' into next)
Merging mvebu/for-next (cf79eb3aab84 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (05f2a5417cf1 Merge branch 'omap-for-v4.13/mmc-regulator' into for-next)
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
Merging arm64/for-next/core (425e1ed73e65 arm64: fix endianness annotation for 'struct jit_ctx' and friends)
Merging clk/clk-next (3cf50f6b13a2 Merge branch 'binding-doc-cp110-ap806' of git://git.infradead.org/linux-mvebu into clk-next)
Merging c6x/for-linux-next (91ebcd1b97ae MAINTAINERS: update email address for C6x maintainer)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging m68knommu/for-next (354b6382847d m68k: defconfig: Cleanup from old Kconfig options)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (9cc7e560b8f2 MIPS: Traced negative syscalls should return -ENOSYS)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (6f7da290413b Linux 4.12)
Merging powerpc/next (1e0fc9d1eb2b powerpc/Kconfig: Enable STRICT_KERNEL_RWX for some configs)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (0c6b2975a9a7 Update my email address)
Merging sparc-next/master (f263fbb8d608 Merge tag 'pci-v4.13-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (1bcbfbfdeb00 um: add dummy ioremap and iounmap functions)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (bdf3b55fde37 Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (799ce1dbb9bb befs: add kernel-doc formatting for befs_bt_read_super())
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (848c23b78faf btrfs: Remove false alert when fiemap range is smaller than on-disk extent)
Merging ceph/master (33e9c8dbfbce libceph: advertise support for NEW_OSDOP_ENCODING and SERVER_LUMINOUS)
Merging cifs/for-next (eef914a9eb5e [SMB3] Improve security, move default dialect to SMB3 from old CIFS)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (08db141b5313 reiserfs: fix race in prealloc discard)
Merging ext4/dev (ff95015648df ext4: fix spelling mistake: "prellocated" -> "preallocated")
Merging f2fs/dev (0abd675e97e6 f2fs: support plain user/group quota)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (68227c03cba8 fuse: initialize the flock flag in fuse_file on allocation)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (6f7da290413b Linux 4.12)
Merging nfsd/nfsd-next (bb2a8b0cd116 nfsd4: const-ify nfsd4_ops)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (f4439de11828 ovl: mark parent impure and restore timestamp on ovl_link_up())
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (af65936a7a5b ubifs: don't bother checking for encryption key in ->mmap())
Merging xfs/for-next (cd87d8679201 xfs: don't crash on unexpected holes in dir/attr btrees)
Merging file-locks/linux-next (cee37d83e6d9 Merge branch 'work.read_write' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs/for-next (0facd00ec25e Merge branches 'work.misc', 'misc.compat', 'work.uaccess-unaligned', 'work.mount' and 'work.__copy_to_user' into for-next)
Applying: disable the spufs show options for now
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (f4e981cba2de printk: add __printf attributes to internal functions)
Merging pci/next (6aed468480e8 Merge branch 'pci/host-tango' into next)
Merging pstore/for-next/pstore (0752e4028c00 powerpc/nvram: use memdup_user)
Merging hid/for-next (8b454744e88d Merge branch 'for-4.13/ish' into for-next)
Merging i2c/i2c/for-next (2e3522cf4373 Merge branch 'i2c/for-4.13' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (8efa050f19fe firmware: dmi_scan: Check DMI structure length)
Merging hwmon-staging/hwmon-next (44b413661b57 hwmon: (aspeed-pwm-tacho) Poll with short sleeps.)
Merging jc_docs/docs-next (ecebcd4da6cd docs: Do not include from kernel/rcu/srcu.c)
Merging v4l-dvb/master (2748e76ddb29 media: staging: cxd2099: Activate cxd2099 buffer mode)
Merging v4l-dvb-next/master (d9c4615854ec [media] dvb uapi docs: enums are passed by value, not reference)
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-set-voltage.rst
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-set-tone.rst
CONFLICT (content): Merge conflict in Documentation/media/uapi/dvb/fe-diseqc-send-burst.rst
Merging fbdev/fbdev-for-next (360772f26407 video: fbdev: matrox: the list iterator can't be NULL)
Merging pm/linux-next (9f11765f6370 Merge branches 'pm-domains', 'pm-sleep' and 'pm-cpufreq' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (5d72ed35678a Merge branches 'thermal-core', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (f263fbb8d608 Merge tag 'pci-v4.13-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging ipsec-next/master (8bafd73093f2 xfrm: add UDP encapsulation port in migrate message)
Merging netfilter-next/master (04ba724b659c netfilter: nfnetlink: extended ACK reporting)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (17d9aa66b08d Merge tag 'iwlwifi-next-for-kalle-2017-06-30' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (7627da7e6a11 Bluetooth: hci_ll: Use new hci_uart_unregister_device() function)
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (bc5214ee2922 IB/hfi1: Handle missing magic values in config file)
Merging gfs2/for-next (da029c11e6b1 exec: Limit arg stack to at most 75% of _STK_LIM)
Merging mtd/master (05e97a9eda72 Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD)
Merging l2-mtd/master (b9504247a6eb mtd: Fix check in mtd_unpoint())
Merging nand/nand/next (81667e9c8ad8 mtd: nand: mtk: release lock on error path)
Merging spi-nor/spi-nor/next (1a18915b4971 mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables)
Merging crypto/master (bcf741cb7792 crypto: testmgr - Reenable sha1/aes in FIPS mode)
Merging drm/drm-next (00fc2c26bc46 drm: Remove unused drm_file parameter to drm_syncobj_replace_fence())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_execbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_internal.h
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (04941829b004 drm/i915: Hold RPM wakelock while initializing OA buffer)
Merging drm-tegra/drm/tegra/for-next (43240bbd871e gpu: host1x: At first try a non-blocking allocation for the gather copy)
Merging drm-misc/for-linux-next (4086d90cffb8 drm/atomic: Add missing drm_atomic_state_clear to atomic_remove_fb)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (4a630fadbb29 drm/msm: Fix potential buffer overflow issue)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e40eda3dda1e drm/arm: mali-dp: Use CMA helper for plane buffer address calculation)
Merging sunxi-drm/sunxi-drm/for-next (110d33dd428e drm/sun4i: Add compatible for the A10s pipeline)
Merging imx-drm/imx-drm/next (994fc62e1d04 drm/imx: lock scanout transfers for consecutive bursts)
Merging etnaviv/etnaviv/next (8cc47b3ea082 drm/etnaviv: populate GEM objects on cpu_prep)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (2a40f9421cb7 Merge remote-tracking branches 'regmap/topic/1wire', 'regmap/topic/irq' and 'regmap/topic/lzo' into regmap-next)
Merging sound/for-next (20e2b791796b ALSA: msnd: Optimize / harden DSP and MIDI loops)
Merging sound-asoc/for-next (beeb69e052cf Merge remote-tracking branches 'asoc/topic/spear' and 'asoc/topic/twl6040' into asoc-next)
Merging modules/modules-next (96b5b19459b3 module: make the modinfo name const)
Merging input/next (0f107573da41 Input: gpio_keys - handle the missing key press event in resume phase)
Merging block/for-next (815fa0795595 Merge branch 'for-linus' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (4d49f1b4a1fc dm raid: stop using BUG() in __rdev_sectors())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (e47c0b96678c mmc: dw_mmc: remove the unnecessary slot variable)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (7184ef8bab0c MD: fix sleep in atomic)
Merging mfd/for-mfd-next (d1f99b97478e mfd: madera: Add register definitions for Cirrus Logic Madera codecs)
Merging backlight/for-backlight-next (056d6ff470a8 video: adp8870: move header file out of I2C realm)
Merging battery/for-next (7bb5a650f347 power: supply: twl4030-charger: add deferred probing for phy and iio)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (185f76bf3bb5 Merge remote-tracking branch 'regulator/topic/qcom' into regulator-next)
Merging security/next (c4758fa59285 apparmor: put back designators in struct initialisers)
Merging integrity/next (fc26bd50539b IMA: update IMA policy documentation to include pcr= option)
Merging keys/keys-next (3088c2ad40cf Merge remote-tracking branch 'origin/keys-fixes' into keys-next)
CONFLICT (content): Merge conflict in security/keys/dh.c
Merging selinux/next (6a3911837da0 selinux: enable genfscon labeling for tracefs)
Merging tpmdd/next (65bbcc19ab70 tpm: do not suspend/resume if power stays on)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (6a7086431fa1 Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/smmu', 'arm/core', 'x86/vt-d', 'x86/amd', 's390' and 'core' into next)
CONFLICT (content): Merge conflict in Documentation/arm64/silicon-errata.txt
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5d6dee80a1e9 vfio: New external user group/file match)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (15318a9f8015 audit: Reduce overhead using a coarse clock)
Merging devicetree/for-next (a4485b545e2f Merge branch 'dt/property-move' into dt/next)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (3686c6eae48a Merge remote-tracking branches 'spi/topic/spidev', 'spi/topic/st-ssc4' and 'spi/topic/stm32' into spi-next)
$ git reset --hard HEAD^
Merging tip/auto-latest (4422d80ed7d4 Merge branch 'ras-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging clockevents/clockevents/next (d9569035d594 clocksource: Add an alias macro CLOCKSOURCE_OF_DECLARE)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
CONFLICT (content): Merge conflict in drivers/clocksource/timer-fttmr010.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-moxart/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (164c29244d4b EDAC, pnd2: Fix Apollo Lake DIMM detection)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (29b1a8ad7df4 tracing: Attempt to record other information even if some fail)
Merging rcu/rcu/next (6d48152eafde rcu: Remove RCU CPU stall warnings from Tiny RCU)
Merging kvm/linux-next (1372324b328c Update my email address)
Merging kvm-arm/next (d38338e396ee arm64: Remove a redundancy in sysreg.h)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (d52cd2076eb2 KVM: s390: Inject machine check into the nested guest)
Merging xen-tip/linux-next (c54590cac51d x86/xen: allow userspace access during hypercalls)
Merging percpu/for-next (e3efe3db932b percpu: fix static checker warnings in pcpu_destroy_chunk)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (d791db9a57ab platform/x86: sony-laptop: constify attribute_group and input index array)
Merging chrome-platform/for-next (5d6a312e8f99 platform/chrome: cros_ec_lightbar - hide unused PM functions)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (4d1707c1c690 leds: lp55xx: make various arrays static const)
Merging ipmi/for-next (4495ec6d770e ipmi:ssif: Add missing unlock in error branch)
Merging driver-core/driver-core-next (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging usb/usb-next (cee37d83e6d9 Merge branch 'work.read_write' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging usb-gadget/next (0591bc236015 usb: gadget: add f_uac1 variant based on a new u_audio api)
Merging usb-serial/usb-next (c22ac6d29f18 USB: serial: propagate late probe errors)
Merging usb-chipidea-next/ci-for-usb-next (c4a0bbbdb7f6 usb: chipidea: properly handle host or gadget initialization failure)
Merging phy-next/next (af850e14a7ae phy: bcm-ns-usb3: add MDIO driver using proper bus layer)
Merging tty/tty-next (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging char-misc/char-misc-next (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging extcon/extcon-next (20ad72adbc62 extcon: int3496: Constify acpi_device_id)
Merging staging/staging-next (650fc870a2ef Merge tag 'docs-4.13' of git://git.lwn.net/linux)
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (f6a28cf9aff9 Merge branch 'fixes' into next)
Merging cgroup/for-next (610467270fb3 cgroup: don't call migration methods if there are no tasks to migrate)
Merging scsi/for-next (48d9c49d7106 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (c345c6ca1382 qla2xxx: Fix NVMe entry_type for iocb packet on BE system)
Merging target-updates/for-next (4d69a06a22a5 tcmu: Fix dev_config_store)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/tcm_qla2xxx.c
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_target.c
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (af62e4938e3c Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (e41b1355508d virtio_balloon: disable VIOMMU support)
Merging rpmsg/for-next (9ef2b6cc595a Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (8d2c6297aec9 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-mvebu.c
Merging pinctrl/for-next (ece5946c2eed Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (a453f3693f2a pinctrl: samsung: Explicitly cast pointer returned by of_iomap() to iomem)
Merging pwm/for-next (5ec8c48a6235 Merge branch 'for-4.13/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (296990deb389 mnt: Make propagate_umount less slow for overlapping mount propagation trees)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (e2682130931f random: suppress spammy warnings about unseeded randomness)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (e67f85fb96ca selftests: membarrier: use ksft_* var arg msg api)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (9e4de0683f68 coresight: etm3x: Set synchronisation frequencty to TRM default)
Merging rtc/rtc-next (f4b82d39e40f rtc: st-lpc: make it robust against y2038/2106 bug)
CONFLICT (content): Merge conflict in tools/testing/selftests/timers/Makefile
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (9d92573fff3e Merge branch 'for-4.13/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb00e6b58abb Merge branch 'for-next/gcc-plugin/randstruct' into for-next/kspp)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging akpm-current/current (e4de4adfff02 ipc/util.h: update documentation for ipc_getref() and ipc_putref())
CONFLICT (content): Merge conflict in include/linux/sem.h
CONFLICT (content): Merge conflict in include/linux/ipc.h
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
Applying: fix type for "dentry name snapshots"
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
Applying: powerpc/64s: watchdog false positive warning at CPU unplug
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
Applying: random,stackprotect: introduce get_random_canary function
Applying: fork,random: use get_random_canary() to set tsk->stack_canary
Applying: x86: ascii armor the x86_64 boot init stack canary
Applying: arm64: ascii armor the arm64 boot init stack canary
Applying: sh64: ascii armor the sh64 boot init stack canary
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
Applying: checkpatch: improve the STORAGE_CLASS test
Applying: ARM: KVM: move asmlinkage before type
Applying: ARM: HP Jornada 7XX: move inline before return type
Applying: CRIS: gpio: move inline before return type
Applying: FRV: tlbflush: move asmlinkage before return type
Applying: ia64: move inline before return type
Applying: ia64: sn: pci: move inline before type
Applying: m68k: coldfire: move inline before return type
Applying: MIPS: SMP: move asmlinkage before return type
Applying: sh: move inline before return type
Applying: x86/efi: move asmlinkage before return type
Applying: drivers: s390: move static and inline before return type
Applying: drivers: tty: serial: move inline before return type
Applying: USB: serial: safe_serial: move __inline__ before return type
Applying: video: fbdev: intelfb: move inline before return type
Applying: video: fbdev: omap: move inline before return type
Applying: ARM: samsung: usb-ohci: move inline before return type
Applying: sparc64: NG4 memset 32 bits overflow
Applying: xtensa: use generic fb.h
CONFLICT (content): Merge conflict in arch/xtensa/include/asm/Kbuild
Applying: MAINTAINERS: give kmod some maintainer love
Applying: kmod: add test driver to stress test the module loader
Applying: kmod: add dependencies for test module
Applying: kmod: throttle kmod thread limit
Applying: writeback: rework wb_[dec|inc]_stat family of functions
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (70614261b64f lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
