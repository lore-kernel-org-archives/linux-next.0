From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 15
Date: Mon, 15 Jan 2018 16:44:18 +1100
Message-ID: <20180115164418.1661a9ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44097 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752322AbeAOFoV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 00:44:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20180112:

The arm64 tree gained a conflict against Linus' tree.

The f2fs tree gained a conflict against the fscrypt tree.

The net-next tree lost its build failure and gained a conflict against
the net tree.

The bpf-next tree gained a conflict against Linus' tree.

The rdma tree gained a conflict against the net tree.

The kvm tree gained conflicts against Linus' and the tip trees.

The akpm-current tree lost its build failure but gained a conflict
against the kspp tree.

Non-merge commits (relative to Linus' tree): 8829
 8931 files changed, 367108 insertions(+), 235333 deletions(-)

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

I am currently merging 256 trees (counting Linus' and 44 trees of bug
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
Merging origin/master (9443c168505d Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (36c1681678b5 genksyms: drop *.hash.c from .gitignore)
Merging arc-current/for-curr (b2cd1df66037 Linux 4.15-rc7)
Merging arm-current/fixes (36b0cb84ee85 ARM: 8731/1: Fix csum_partial_copy_from_user() stack mismatch)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (6e032b350cd1 powerpc/powernv: Check device-tree for RFI flush settings)
Merging sparc/master (59585b4be9ae sparc64: repair calling incorrect hweight function from stubs)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (8155aedf512e Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging bpf/master (c366287ebd69 bpf: fix divides by zero)
Merging ipsec/master (76a420119181 xfrm: Fix a race in the xdst pcpu cache.)
Merging netfilter/master (889c604fd0b5 netfilter: x_tables: fix int overflow in xt_alloc_table_info())
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (49fdde89e2b8 Merge ath-current from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging mac80211/master (736a80bbfda7 mac80211: mesh: drop frames appearing to be from us)
Merging rdma-fixes/for-rc (57194fa763bf IB/hfi1: Prevent a NULL dereference)
Merging sound-current/for-linus (b3defb791b26 ALSA: seq: Make ioctls race-free)
Merging pci-current/for-linus (03a551734cfc x86/PCI: Move and shrink AMD 64-bit window to avoid conflict)
Merging driver-core.current/driver-core-linus (30a7acd57389 Linux 4.15-rc6)
Merging tty.current/tty-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb.current/usb-linus (1a2e91e795de Documentation: usb: fix typo in UVC gadgetfs config command)
Merging usb-gadget-fixes/fixes (b2cd1df66037 Linux 4.15-rc7)
Merging usb-serial-fixes/usb-linus (d14ac576d10f USB: serial: cp210x: add new device ID ELV ALC 8xxx)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (443064cb0b1f staging: android: ashmem: fix a race condition in ASHMEM_SET_SIZE ioctl)
Merging char-misc.current/char-misc-linus (aa1f10e85b0a mux: core: fix double get_device())
Merging input-current/for-linus (4d94e776bd29 Input: ALPS - fix multi-touch decoding on SS4 plus touchpads)
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
Merging mips-fixes/mips-fixes (7f6a6847c3fd MIPS: ralink: Fix platform_get_irq's error checking)
Merging kvm-fixes/master (2aad9b3e0711 Merge branch 'kvm-insert-lfence' into kvm-master)
Merging kvms390-fixes/master (c2cf265d8608 KVM: s390: prevent buffer overrun on memory hotplug during migration)
Merging drm-intel-fixes/for-linux-next-fixes (5005c8514285 drm/i915: Don't adjust priority on an already signaled fence)
Merging drm-misc-fixes/for-linux-next-fixes (3b9c57cef4de drm/sun4i: hdmi: Add missing rate halving check in sun4i_tmds_determine_rate)
Merging kbuild/for-next (d9727df94e58 Merge branches 'kbuild', 'misc' and 'kconfig' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (4dc807457260 Merge branches 'misc', 'sa1111' and 'sa1100-for-next' into for-next)
Merging arm-perf/for-next/perf (7520fa99246d perf: ARM DynamIQ Shared Unit PMU support)
Merging arm-soc/for-next (9e7e886e1b18 ARM: Document merges)
Merging actions/for-next (61862a89e6ac Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (d66ac45818eb Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-next)
Merging at91/at91-next (fa4cf68ab4b1 Merge tag 'at91-ab-4.16-dt' into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (824162aa1454 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a29b8b93e158 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (91cbd0893d7d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (a2ef0751a548 Merge branch 'omap-for-v4.16/dt-clk' into for-next)
Merging reset/reset/next (70d2f16a6289 reset: meson: enable level reset support on Meson8b)
Merging qcom/for-next (f5788d2f2929 Merge tag 'qcom-arm64-defconfig-for-4.16' into tagged-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (2f6dce8f4ea2 Merge branch 'dt-for-v4.16' into next)
Merging rockchip/for-next (273cddbe1912 Merge branch 'v4.16-armsoc/dts64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (3b6327365aba Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (d7ec2c507677 Merge branch 'sunxi/fixes-for-4.15' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (bb48711800e6 arm64: cpu_errata: Add Kryo to Falkor 1003 errata)
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cputype.h
Merging clk/clk-next (34459c0de1ec Merge branch 'clk-allwinner' into clk-next)
Merging clk-samsung/for-next (7685570f2ae2 clk: samsung: s3c: Remove unneeded enumeration)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (bebc6082da0a Linux 4.14)
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (30a7acd57389 Linux 4.15-rc6)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (50c4c4e268a2 Linux 4.15-rc3)
Merging mips/mips-next (132939062a32 Merge branches '4.15-fixes', '4.16-features' and 'octeon-3-net-mips-bits' into mips-next)
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
Merging fscrypt/master (3d204e24d452 fscrypt: remove 'ci' parameter from fscrypt_put_encryption_info())
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs when under IO limits)
Merging btrfs-kdave/for-next (767c04095470 Merge branch 'for-next-next-v4.15-20180108' into for-next-20180108)
Merging ceph/master (21acdf45f495 rbd: set max_segments to USHRT_MAX)
Merging cifs/for-next (5fcbc8455075 CIFS: SMBD: work around gcc -Wmaybe-uninitialized warning)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (d5bd821350e6 udf: Sanitize nanoseconds for time stamps)
Merging ext4/dev (a6c927bb894f ext4: create ext4_kset dynamically)
Merging f2fs/dev (b1ca321d1cd8 f2fs: skip stop_checkpoint for user data writes)
CONFLICT (content): Merge conflict in fs/f2fs/namei.c
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
Merging iversion/iversion-next (2c22da552727 fs: handle inode->i_version more efficiently)
Merging printk/for-next (5bb89d16e465 Merge branch 'for-4.16-deprecate-printk-pf' into for-4.16)
Merging pci/next (93dce3d9e2fc Merge remote-tracking branch 'lorenzo/pci/dwc' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanup/pixart' into for-next)
Merging i2c/i2c/for-next (9afdda4aa197 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (abe6c3b06fa8 hwmon: (sht3x) wait predefined limits loading complete before access)
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
Merging pm/linux-next (51268408ceb5 Merge branch 'pm-cpufreq' into linux-next)
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-platdrv.c
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (e856f078bcf1 OPP: Introduce "required-opp" property)
Merging thermal/next (b8a86f1d99ef Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (d0ecbbbe518e thermal/drivers/hisi: Remove bogus const from function return type)
Merging ieee1394/for-next (188775181bc0 firewire-ohci: work around oversized DMA reads on JMicron controllers)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (564737f981fb Merge branch '10GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in net/tipc/socket.c
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
Merging bpf-next/master (fdde5f3b6ba4 Merge branch 'error-injection')
CONFLICT (content): Merge conflict in arch/x86/lib/Makefile
Merging ipsec-next/master (1a4bb1d14f7c xfrm: update the stats documentation)
Merging netfilter-next/master (902d6a4c2a4f netfilter: nf_defrag: Skip defrag if NOTRACK is set)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (4330b53e9662 b43: Replace mdelay with usleep_range in b43_radio_2057_init_post)
Merging bluetooth/master (8c2e6c904fd8 Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next)
Merging mac80211-next/master (c5e62a24278a Merge branch 'sfc-support-25G-configuration-with-ethtool')
Merging rdma/for-next (4f9a3018a2bb infiniband: fix sw/rdmavt/* kernel-doc notation)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
Merging gfs2/for-next (1f23bc7869ff gfs2: Trim the ordered write list in gfs2_ordered_write())
Merging mtd/master (fee4380f368e mtd: nand: pxa3xx: Fix READOOB implementation)
Merging l2-mtd/mtd/next (db032762b3b9 mtd: Remove duplicate checks on mtd_oob_ops parameter)
Merging nand/nand/next (b4525db6f0c6 MAINTAINERS: Add entry for Marvell NAND controller driver)
Merging spi-nor/spi-nor/next (23bae78e8a57 mtd: mtk-nor: modify functions' name more generally)
Merging crypto/master (9555003a3373 Documentation/bindings: crypto: document the SafeXcel EIP97 compatible)
Merging drm/drm-next (9be712ef4612 Merge tag 'drm/tegra/for-4.16-rc1-fixes' of git://anongit.freedesktop.org/tegra/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/sor.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_cdclk.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_syncobj.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_cm.c
Applying: drm/amd/display: fix mismerge of identical patches
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (c9ef291a7e79 drm/i915/psr: Avoid initializing PSR if there is no sink support.)
Merging drm-tegra/drm/tegra/for-next (8f62142e490d drm/tegra: dc: Properly cleanup overlay planes)
Merging drm-misc/for-linux-next (a1c55bccf600 drm/panel: lvds: Add support for the power-supply property)
Merging drm-msm/msm-next (f91c14ab448a drm/msm: Add devfreq support for the GPU)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with COMPILE_TEST)
Merging etnaviv/etnaviv/next (2f20fc4fc9db drm/etnaviv: use memset32 to init pagetable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (a75de7721184 Merge remote-tracking branches 'regmap/topic/soundwire' and 'regmap/topic/zero' into regmap-next)
Merging sound/for-next (8999bd3c6323 Merge tag 'asoc-v4.16-2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-next)
Merging sound-asoc/for-next (27f90fc75a50 Merge remote-tracking branches 'asoc/topic/wm8903', 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (1291a0d5049d Linux 4.15-rc4)
Merging input/next (faec44b68383 Input: goodix - disable IRQs while suspended)
Merging block/for-next (3e61cea1ae89 Merge branch 'for-4.16/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (8bcf67a101dd Merge branch 'dm-4.16' into block-4.16_dm-4.16)
Merging mmc/next (de21dc1d9a2a mmc: tmio: use mmc_can_gpio_cd() instead of checking TMIO_MMC_USE_GPIO_CD)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (fcbf3735a067 raid5-ppl: PPL support for disks with write-back cache enabled)
Merging mfd/for-mfd-next (0f89ffefa4e1 mfd: lpc_ich: Do not touch SPI-NOR write protection bit on Apollo Lake)
Merging backlight/for-backlight-next (2023b0524a63 backlight: tdo24m: Fix the SPI CS between transfers)
Merging battery/for-next (8be4c3667cf1 MAINTAINERS: Add AXP288 PMIC entry)
Merging regulator/for-next (214244a26af8 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (429262d70af8 Merge branch 'smack-for-4.16' of git://github.com/cschaufler/next-smack into next-testing)
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
Merging devicetree/for-next (5fbd55d21e56 libfdt: remove unnecessary include directive from <linux/libfdt.h>)
Merging mailbox/mailbox-for-next (ca64af43924f mailbox: ti-msgmgr: Use %zu for size_t print format)
Merging spi/for-next (f0915ebf76ec Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/sirf', 'spi/topic/sun6i' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (a6f4e1a666b5 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (322fd24f5e67 clocksource/drivers/stm32: Start the timer's counter sooner)
CONFLICT (content): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/timer-of.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (68fa24f9121c EDAC, mv64x60: Fix an error handling path)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4397f04575c4 tracing: Fix possible double free on failure of allocating trace buffer)
Merging rcu/rcu/next (1dfa55e01987 Merge branches 'cond_resched.2017.12.04a', 'dyntick.2017.11.28a', 'fixes.2017.12.11a', 'srbd.2017.12.05a' and 'torture.2017.12.11a' into HEAD)
Merging kvm/linux-next (876baffd0778 KVM: nVMX: Fix races when sending nested PI while dest enters/leaves L2)
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sregs()
Merging kvm-arm/next (448fadc8a4a3 arm64: mm: Add additional parameter to uaccess_ttbr0_enable)
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (1627301020cb KVM: PPC: Use seq_puts() in kvmppc_exit_timing_show())
Merging kvms390/next (552677e0f8a2 KVM: s390: cleanup struct kvm_s390_float_interrupt)
Merging xen-tip/linux-next (cf2acf66ad43 xen/gntdev: Fix partial gntdev_mmap() cleanup)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized can be boolean)
Merging workqueues/for-next (a10eb37ccf1d Merge branch 'for-4.15-fixes' into for-next)
Merging drivers-x86/for-next (9a1a62591847 platform/x86: wmi: Call acpi_wmi_init() later)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (6a836631e303 leds: ledtrig-transient: Add SPDX license identifiers)
Merging ipmi/for-next (1b4254cee064 ipmi: use correct string length)
Merging driver-core/driver-core-next (a9afc573dbe6 firmware: Fix a typo in fallback-mechanisms.rst)
Merging usb/usb-next (2da050e4f151 Merge tag 'usb-serial-4.16-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next)
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel)
Merging usb-serial/usb-next (d1c48227d7c4 USB: serial: f81534: fix tx error on some baud rate)
Merging usb-chipidea-next/ci-for-usb-next (061e20e9899e usb: chipidea: tegra: Use aligned DMA on Tegra30)
Merging phy-next/next (e4b227c1ca70 phy: phy-mtk-tphy: use of_device_get_match_data())
Merging tty/tty-next (e397824bf095 gpio: serial: max310x: Support open-drain configuration for GPIOs)
Merging char-misc/char-misc-next (d6088e9a89f7 uio_hv_generic: fix new type mismatch warnings)
Merging extcon/extcon-next (ca90a64dc671 extcon: axp288: Handle reserved charger-type values better)
Merging staging/staging-next (a66a4e8e01f3 staging: pi433: Cleanup codestyle, indent statements after case labels)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (546951e077cf Merge branch 'topic/sprd' into next)
Merging cgroup/for-next (0438eb4190c0 Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (da2cd3bcb27f Merge branch 'postmerge' into for-next)
Merging scsi-mkp/for-next (87058dded5df scsi: megaraid_sas: driver version upgrade)
Merging target-updates/for-next (a24e7917e175 tcmu: fix error return code in tcmu_configure_device())
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (2b9f8605c138 Merge branch 'for-4.16' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (0d87c130f812 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (61b4af458d84 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (8668693769bb Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configuration for Meson-AXG)
Merging userns/for-next (8b2770a4e1c7 fix typo in assignment of fs default overflow gid)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (a4f0e38e1d0d selftests: media_tests: Add SPDX license identifier)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (d13f5d84ca27 Merge branch 'for-4.16/signal-sysfs-force-v2' into for-next)
Merging coresight/next (1443f5b4fb45 MAINTAINERS: Add SoundWire entry)
Merging rtc/rtc-next (796c0ad79ee6 Documentation: rtc: move iotcl interface documentation to ABI)
Merging nvdimm/libnvdimm-for-next (24e3a7fb60a9 libnvdimm, btt: Fix an incompatibility in the log layout)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (0f30aca72c3b eeprom: at24: extend the list of chips supported in DT)
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (7bdcf78082b3 lkdtm: Update usercopy tests for whitelisting)
CONFLICT (content): Merge conflict in net/sctp/socket.c
Merging init_task/init_task (cb61e6e12d54 Expand INIT_STRUCT_PID and remove)
Merging akpm-current/current (e2a01dec3feb ipc/mqueue.c: have RT tasks queue in by priority in wq_add())
CONFLICT (content): Merge conflict in arch/cris/include/arch-v10/arch/bug.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: ipc/mqueue: add missing error code in init_mqueue_fs()
Applying: net/ipv6/route.c: work around gcc-4.4.4 anon union initializer issue
Applying: arch/score/kernel/setup.c: combine two seq_printf() calls into one call in show_cpuinfo()
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
Applying: pipe, sysctl: drop 'min' parameter from pipe-max-size converter
Applying: pipe, sysctl: remove pipe_proc_fn()
Applying: pipe: actually allow root to exceed the pipe buffer limits
Applying: pipe: fix off-by-one error when checking buffer limits
Applying: pipe: reject F_SETPIPE_SZ with size over UINT_MAX
Applying: pipe: simplify round_pipe_size()
Applying: pipe: read buffer limits atomically
Merging akpm/master (00f7e0f2e061 pipe: read buffer limits atomically)
