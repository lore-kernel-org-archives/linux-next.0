From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 10
Date: Wed, 10 Jan 2018 16:24:27 +1100
Message-ID: <20180110162427.2fd67e71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59493 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932078AbeAJFY3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jan 2018 00:24:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20180109:

The net-next tree gained a conflict against the vfs tree. it also gained
a build failure for which I applied a patch.

The akpm-current tree still had its build failure for which I applied
a patch.

Non-merge commits (relative to Linus' tree): 8051
 8389 files changed, 331034 insertions(+), 224209 deletions(-)

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
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 255 trees (counting Linus' and 43 trees of bug
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
Merging origin/master (d476c5334f1d Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (9059a3493efe kconfig: fix relational operators for bool and tristate symbols)
Merging arc-current/for-curr (b2cd1df66037 Linux 4.15-rc7)
Merging arm-current/fixes (36b0cb84ee85 ARM: 8731/1: Fix csum_partial_copy_from_user() stack mismatch)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (e2d5915293ff powerpc/pseries: Make RAS IRQ explicitly dependent on DLPAR WQ)
Merging sparc/master (59585b4be9ae sparc64: repair calling incorrect hweight function from stubs)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (4512c43eac7e ipv6: remove null_entry before adding default route)
Merging bpf/master (be95a845cc44 bpf: avoid false sharing of map refcount with max_entries)
Merging ipsec/master (b1bdcb59b64f xfrm: don't call xfrm_policy_cache_flush while holding spinlock)
Merging netfilter/master (889c604fd0b5 netfilter: x_tables: fix int overflow in xt_alloc_table_info())
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (49fdde89e2b8 Merge ath-current from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging mac80211/master (736a80bbfda7 mac80211: mesh: drop frames appearing to be from us)
Merging sound-current/for-linus (900498a34a3a ALSA: pcm: Allow aborting mutex lock at OSS read/write loops)
Merging pci-current/for-linus (1291a0d5049d Linux 4.15-rc4)
Merging driver-core.current/driver-core-linus (30a7acd57389 Linux 4.15-rc6)
Merging tty.current/tty-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb.current/usb-linus (928afc852707 uas: ignore UAS for Norelsys NS1068(X) chips)
Merging usb-gadget-fixes/fixes (b2cd1df66037 Linux 4.15-rc7)
Merging usb-serial-fixes/usb-linus (d14ac576d10f USB: serial: cp210x: add new device ID ELV ALC 8xxx)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (443064cb0b1f staging: android: ashmem: fix a race condition in ASHMEM_SET_SIZE ioctl)
Merging char-misc.current/char-misc-linus (aa1f10e85b0a mux: core: fix double get_device())
Merging input-current/for-linus (906bf7daa061 Input: 88pm860x-ts - fix child-node lookup)
Merging crypto-current/master (9a00674213a3 crypto: algapi - fix NULL dereference in crypto_remove_spawns())
Merging ide/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging vfio-fixes/for-linus (563b5cbe334e iommu/arm-smmu-v3: Cope with duplicated Stream IDs)
Merging kselftest-fixes/fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging backlight-fixes/for-backlight-fixes (8ff5cbc6e3c5 backlight: as3711_bl: fix device-tree node leaks)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (10a6a6975691 Revert "dt-bindings: mtd: add sst25wf040b and en25s64 to sip-nor list")
Merging mfd-fixes/for-mfd-fixes (107b7d9fa94c mfd: rtsx: Release IRQ during shutdown)
Merging v4l-dvb-fixes/fixes (781b045baefd media: imx274: Fix error handling, add MAINTAINERS entry)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (b084116f8587 MIPS: AR7: Ensure that serial ports are properly set up)
Merging kvm-fixes/master (bb4945e60dd0 Merge tag 'kvm-s390-master-4.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux)
Merging kvms390-fixes/master (c2cf265d8608 KVM: s390: prevent buffer overrun on memory hotplug during migration)
Merging drm-intel-fixes/for-linux-next-fixes (67c3f3fc028e Merge tag 'gvt-fixes-2018-01-08' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (b0bb222440a5 Merge branch 'linux-4.15' of git://github.com/skeggsb/linux into drm-fixes)
Merging kbuild/for-next (69139a531700 Merge branch 'kbuild' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (4dc807457260 Merge branches 'misc', 'sa1111' and 'sa1100-for-next' into for-next)
Merging arm-perf/for-next/perf (7520fa99246d perf: ARM DynamIQ Shared Unit PMU support)
Merging arm-soc/for-next (4e5b1b0fb0c2 arm-soc: document merges)
Merging actions/for-next (61862a89e6ac Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (d66ac45818eb Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-next)
Merging at91/at91-next (fa4cf68ab4b1 Merge tag 'at91-ab-4.16-dt' into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (824162aa1454 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a29b8b93e158 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (bf643c28580f Merge branch 'mvebu/dt64' into mvebu/for-next)
CONFLICT (add/add): Merge conflict in arch/arm64/boot/dts/marvell/armada-cp110.dtsi
Merging omap/for-next (60ccd41e6ce4 Merge branch 'omap-for-v4.16/dt' into for-next)
Merging reset/reset/next (70d2f16a6289 reset: meson: enable level reset support on Meson8b)
Merging qcom/for-next (f5788d2f2929 Merge tag 'qcom-arm64-defconfig-for-4.16' into tagged-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (4ed563126750 Merge branch 'arm64-dt-for-v4.16' into next)
Merging rockchip/for-next (273cddbe1912 Merge branch 'v4.16-armsoc/dts64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (3b6327365aba Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (d7ec2c507677 Merge branch 'sunxi/fixes-for-4.15' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (3b3b681097fa arm64: v8.4: Support for new floating point multiplication instructions)
Merging clk/clk-next (40d55e8bf720 Merge branch 'clk-meson' into clk-next)
Merging clk-samsung/for-next (7685570f2ae2 clk: samsung: s3c: Remove unneeded enumeration)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (30a7acd57389 Linux 4.15-rc6)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (50c4c4e268a2 Linux 4.15-rc3)
Merging mips/mips-next (f0176419948c Merge branches '4.15-fixes', '4.16-features' and 'octeon-3-net-mips-bits' into mips-next)
Merging mips-james/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (73acae67e363 openrisc: Fix conflicting types for _exext and _stext)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (f36dbfe1a504 selftests/powerpc: Fix build errors in powerpc ptrace selftests)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (fbf08e6c5deb automerging branch "github.com-riscv/next-tlb" into "for-linux-next")
Merging s390/features (7bceec4e58ee s390/vdso: revise CFI annotations of vDSO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (73b37067623c xtensa: fix futex_atomic_cmpxchg_inatomic)
CONFLICT (content): Merge conflict in Documentation/features/debug/KASAN/arch-support.txt
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs when under IO limits)
Merging btrfs-kdave/for-next (767c04095470 Merge branch 'for-next-next-v4.15-20180108' into for-next-20180108)
Merging ceph/master (21acdf45f495 rbd: set max_segments to USHRT_MAX)
Merging cifs/for-next (d1602a348da2 CIFS: SMBD: _smbd_get_connection() can be static)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (d5bd821350e6 udf: Sanitize nanoseconds for time stamps)
Merging ext4/dev (9d5afec6b8bd ext4: fix crash when a directory's i_size is too small)
Merging f2fs/dev (b1ca321d1cd8 f2fs: skip stop_checkpoint for user data writes)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (ef7f8cec80a0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing over more CPUs)
CONFLICT (content): Merge conflict in net/sunrpc/xprt.c
Merging nfsd/nfsd-next (a14fbdff76ba lockd: convert nlm_rqst.a_count from atomic_t to refcount_t)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (da2e6b7eeda8 ovl: fix overlay: warning prefix)
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (ac503a4cc9e8 xfs: refactor the geometry structure filling function)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (418bb8b3ff50 Merge branch 'misc.netdrv' into for-next)
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging iversion/iversion-next (6dc99a46265b ext4: don't split xattr inode refcounts across i_ctime and i_version fields)
Merging printk/for-next (5bb89d16e465 Merge branch 'for-4.16-deprecate-printk-pf' into for-4.16)
Merging pci/next (93dce3d9e2fc Merge remote-tracking branch 'lorenzo/pci/dwc' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanup/pixart' into for-next)
Merging i2c/i2c/for-next (9afdda4aa197 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (4471879acf92 hwmon: (pmbus) cffps: Add PMBUS_SKIP_STATUS_CHECK)
Merging jc_docs/docs-next (36bde81e23d2 docs: add index entry for networking/msg_zerocopy)
CONFLICT (content): Merge conflict in Documentation/core-api/printk-formats.rst
Merging v4l-dvb/master (e3ee691dbf24 media: ov5640: add support of RGB565 and YUYV formats)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dmxdev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Applying: media: videobuf2: fix up for "media: annotate ->poll() instances"
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto description at the docs)
Merging fbdev/fbdev-for-next (f950bc7880b3 fbdev: auo_k190x: Use zeroing memory allocator instead of allocator/memset)
Merging pm/linux-next (361cdbc99a48 Merge branches 'pm-sleep', 'pm-opp', 'pm-devfreq', 'pm-avs' and 'pm-tools' into linux-next)
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (e856f078bcf1 OPP: Introduce "required-opp" property)
Merging thermal/next (b8a86f1d99ef Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (d0ecbbbe518e thermal/drivers/hisi: Remove bogus const from function return type)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (61ad64080e03 Merge branch 'r8169-improve-runtime-pm')
CONFLICT (content): Merge conflict in tools/testing/selftests/bpf/test_align.c
CONFLICT (content): Merge conflict in net/tipc/socket.c
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
Merging bpf-next/master (5896351ea936 bpf: fix verifier GPF in kmalloc failure path)
Merging ipsec-next/master (1a4bb1d14f7c xfrm: update the stats documentation)
Merging netfilter-next/master (f998b6b10144 netfilter: ipset: Missing nfnl_lock()/nfnl_unlock() is added to ip_set_net_exit())
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (f1398fd2dd8c qtnfmac: support MAC address based access control)
Merging bluetooth/master (61f5acea8737 Bluetooth: btusb: Restore QCA Rome suspend/resume fix with a "rewritten" version)
Merging mac80211-next/master (3a3713ec3601 mac80211: Fix setting TX power on monitor interfaces)
Merging rdma/for-next (5793b4652155 IB/rxe: remove unnecessary skb_clone in xmit)
Merging gfs2/for-next (1f23bc7869ff gfs2: Trim the ordered write list in gfs2_ordered_write())
Merging mtd/master (fee4380f368e mtd: nand: pxa3xx: Fix READOOB implementation)
Merging l2-mtd/mtd/next (f72071b892d6 mtd: Add an helper to make erase request aligned on ->erasesize)
Merging nand/nand/next (069f05346d01 mtd: nand: qcom: Add a NULL check for devm_kasprintf())
Merging spi-nor/spi-nor/next (2167d6d7a96a mtd: fsl-quadspi: account for const type of of_device_id.data)
Merging crypto/master (b7dac3731848 crypto: x86/poly1305 - remove cra_alignmask)
Merging drm/drm-next (fb8baefc7b2d drm/amdgpu: use %pap format string for phys_addr_t)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_cdclk.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_syncobj.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
Applying: drm/amd/display: fix mismerge of identical patches
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (17bd6e66d8f6 drm/i915: Fix using BIT_ULL() vs. BIT() for power domain masks)
Merging drm-tegra/drm/tegra/for-next (8f62142e490d drm/tegra: dc: Properly cleanup overlay planes)
Merging drm-misc/for-linux-next (a1c55bccf600 drm/panel: lvds: Add support for the power-supply property)
Merging drm-msm/msm-next (9dcfbc182f1a drm/msm: Fix NULL deref in adreno_load_gpu)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with COMPILE_TEST)
Merging etnaviv/etnaviv/next (2f20fc4fc9db drm/etnaviv: use memset32 to init pagetable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (5f3ca1037299 Merge remote-tracking branches 'regmap/topic/soundwire' and 'regmap/topic/zero' into regmap-next)
Merging sound/for-next (da911b1f5e98 ALSA: hda/realtek - update ALC225 depop optimize)
Merging sound-asoc/for-next (8aea77e889d4 Merge remote-tracking branches 'asoc/topic/wm8400', 'asoc/topic/wm8903', 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (1291a0d5049d Linux 4.15-rc4)
Merging input/next (da7bdec455b1 Input: cyapa - remove duplicated macro definitions)
Merging block/for-next (ef60a7313fac Merge branch 'for-4.16/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (af2df4895eca dm log writes: fix max length used for kstrndup)
Merging mmc/next (3602785b341a mmc: sdhci-esdhc-imx: Enable/Disable mmc clock during runtime suspend)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (92e6245deab8 md/r5cache: print more info of log recovery)
Merging mfd/for-mfd-next (d9147793abb3 mfd: lpc_ich: Do not touch SPI-NOR write protection bit on Apollo Lake)
Merging backlight/for-backlight-next (2023b0524a63 backlight: tdo24m: Fix the SPI CS between transfers)
Merging battery/for-next (8be4c3667cf1 MAINTAINERS: Add AXP288 PMIC entry)
Merging regulator/for-next (214244a26af8 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (28c8627de265 Merge tag 'tpmdd-next-20180108' of git://git.infradead.org/users/jjs/linux-tpmdd into next-testing)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
Merging integrity/next-integrity (a2a2c3c8580a ima: Use i_version only when filesystem supports it)
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition processing if the policy isn't loaded)
Merging tpmdd/next (68021bf4734d tpm: remove unused variables)
Merging watchdog/master (38a1222ae4f3 watchdog: core: make sure the watchdog worker always works)
Merging iommu/next (fac6862ff1d1 Merge branches 'arm/renesas', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5887a2b2d6cc Merge branches 'v4.16-iommu/amd', 'v4.16-iommu/ipmmu-vmsa', 'v4.16-iommu/misc', 'v4.16-iommu/vt-d' and 'v4.16/vfio' into v4.16/next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (bd6dc70b62bb of: unittest: refactor Makefile)
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (a6111c81eafc Merge remote-tracking branches 'spi/topic/sirf', 'spi/topic/sun6i' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (37b2b3f8b18b Merge branch 'x86/pti')
Merging clockevents/clockevents/next (322fd24f5e67 clocksource/drivers/stm32: Start the timer's counter sooner)
CONFLICT (content): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/timer-of.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (68fa24f9121c EDAC, mv64x60: Fix an error handling path)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4397f04575c4 tracing: Fix possible double free on failure of allocating trace buffer)
Merging rcu/rcu/next (2781e186b35e rcutorture: Add basic ARM64 support to run scripts)
Merging kvm/linux-next (ccff53fd86ee KVM: x86: avoid unnecessary XSETBV on guest entry)
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sregs()
Merging kvm-arm/next (448fadc8a4a3 arm64: mm: Add additional parameter to uaccess_ttbr0_enable)
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (6762ec307d25 kvm_config: add CONFIG_S390_GUEST)
Merging xen-tip/linux-next (66a640e7823d x86: xen: remove the use of VLAIS)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized can be boolean)
Merging workqueues/for-next (40c17f75dfa9 workqueue: allow WQ_MEM_RECLAIM on early init workqueues)
Merging drivers-x86/for-next (9a1a62591847 platform/x86: wmi: Call acpi_wmi_init() later)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (a2169c9b762a leds: lp8860: Various fixes to align with LED framework)
Merging ipmi/for-next (1b4254cee064 ipmi: use correct string length)
Merging driver-core/driver-core-next (a9afc573dbe6 firmware: Fix a typo in fallback-mechanisms.rst)
Merging usb/usb-next (cf1fcd45be25 arm64: dts: mt8173: update properties about USB wakeup)
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel)
Merging usb-serial/usb-next (e255f2078b12 USB: serial: ark3116: move TIOCGSERIAL ioctl case to function)
Merging usb-chipidea-next/ci-for-usb-next (061e20e9899e usb: chipidea: tegra: Use aligned DMA on Tegra30)
Merging phy-next/next (e4b227c1ca70 phy: phy-mtk-tphy: use of_device_get_match_data())
Merging tty/tty-next (e397824bf095 gpio: serial: max310x: Support open-drain configuration for GPIOs)
Merging char-misc/char-misc-next (f0fa297404c3 vmbus: add monitor_id and subchannel_id to sysfs per channel)
Merging extcon/extcon-next (ca90a64dc671 extcon: axp288: Handle reserved charger-type values better)
Merging staging/staging-next (3861b724de9d staging: pi433: align function parameters with open parenthesis)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (3613816d4059 Merge branch 'topic/qcom_hidma' into next)
Merging cgroup/for-next (0438eb4190c0 Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (2b9681631634 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (f7c3d0667404 scsi: hisi_sas: Change frame type for SET MAX commands)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (e94af7d7a69d Merge branch 'for-4.16' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (0d87c130f812 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (686e17c4ac0e Merge branch 'devel' into for-next)
Merging pinctrl/for-next (8668693769bb Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configuration for Meson-AXG)
Merging userns/for-next (8b2770a4e1c7 fix typo in assignment of fs default overflow gid)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (ae64f9bd1d36 Linux 4.15-rc2)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (c99a2be790b0 livepatch: force transition to finish)
Merging coresight/next (1443f5b4fb45 MAINTAINERS: Add SoundWire entry)
Merging rtc/rtc-next (54c47014b474 rtc: add mxc driver for i.MX53 SRTC)
Merging nvdimm/libnvdimm-for-next (24e3a7fb60a9 libnvdimm, btt: Fix an incompatibility in the log layout)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (0f30aca72c3b eeprom: at24: extend the list of chips supported in DT)
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (f6ff65a31f8b lkdtm: Update usercopy tests for whitelisting)
Merging init_task/init_task (cb61e6e12d54 Expand INIT_STRUCT_PID and remove)
Applying: tuntap: fix for "tuntap: XDP transmission"
Merging akpm-current/current (70286688e5ad ipc/mqueue.c: have RT tasks queue in by priority in wq_add())
Applying: mm, migrate: remove reason argument from new_page_t fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: vfs: remove might_sleep() from clear_inode()
Applying: mm/userfaultfd.c: remove duplicate include
Applying: mm: remove unneeded kallsyms include
Applying: hrtimer: remove unneeded kallsyms include
Applying: genirq: remove unneeded kallsyms include
Applying: mm/memblock: memblock_is_map/region_memory can be boolean
Applying: lib/lockref: __lockref_is_dead can be boolean
Applying: kernel/cpuset: current_cpuset_is_being_rebound can be boolean
Applying: kernel/resource: iomem_is_exclusive can be boolean
Applying: kernel/module: module_is_live can be boolean
Applying: kernel/mutex: mutex_is_locked can be boolean
Applying: crash_dump: is_kdump_kernel can be boolean
Applying: certs/blacklist_nohashes.c: fix const confusion in certs blacklist
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer overflow
Applying: kasan: rework Kconfig settings
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (e3de7584b841 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
