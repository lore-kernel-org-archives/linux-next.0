From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 26
Date: Fri, 26 Jan 2018 13:58:56 +1100
Message-ID: <20180126135856.747be66b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751187AbeAZC7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 21:59:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20180119:

The powerpc tree lost its build failures.

The f2fs tree still had its build failure due to an interaction with
the btrfs tree for which I reverted a commit.

The vfs tree gained a conflict against the overlayfs tree.

The iversion tree gained a conflict against the nfsd tree.

The pci tree gained a build failure for which I applied a patch.

The net-next tree gained a conflict against the vfs tree.

The rmda tree gained a build failure so I used the version from
next-20180119.

The crypto tree gained a conflict against the net-next tree.

The devicetree tree gained a conflict against the pci tree.

The kvm tree gained a conflict against Linus' tree.

The scsi-mkp tree gained a conflict against the scsi tree.

The userns tree gained a build failure for which I added a patch.

The akpm tree lost 2 patches that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 10685
 10407 files changed, 433095 insertions(+), 277434 deletions(-)

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
Merging origin/master (3eab2ad9162e MAINTAINERS: update email address for James Morris)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (36c1681678b5 genksyms: drop *.hash.c from .gitignore)
Merging arc-current/for-curr (a46f24acf8bc ARC: boot log: Fix trailing semicolon)
Merging arm-current/fixes (091f02483df7 ARM: net: bpf: clarify tail_call index)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (1b689a95ce74 powerpc/pseries: include linux/types.h in asm/hvcall.h)
Merging sparc/master (aebb48f5e465 sparc64: fix typo in CONFIG_CRYPTO_DES_SPARC64 => CONFIG_CRYPTO_CAMELLIA_SPARC64)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (624ca9c33c8a net/ibm/emac: wrong bit is used for STA control register write)
Merging bpf/master (e58edaa48635 net/mlx5e: Fix fixpoint divide exception in mlx5e_am_stats_compare)
Merging ipsec/master (545d8ae7afff xfrm: fix boolean assignment in xfrm_get_type_offload)
Merging netfilter/master (889c604fd0b5 netfilter: x_tables: fix int overflow in xt_alloc_table_info())
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (cc124d5cc8d8 brcmfmac: fix CLM load error for legacy chips when user helper is enabled)
Merging mac80211/master (e58edaa48635 net/mlx5e: Fix fixpoint divide exception in mlx5e_am_stats_compare)
Merging rdma-fixes/for-rc (ae59c3f0b6cf RDMA/mlx5: Fix out-of-bound access while querying AH)
Merging sound-current/for-linus (1c9609e3a8cf ALSA: hda - Reduce the suspend time consumption for ALC256)
Merging pci-current/for-linus (838cda369707 x86/PCI: Enable AMD 64-bit window on resume)
Merging driver-core.current/driver-core-linus (30a7acd57389 Linux 4.15-rc6)
Merging tty.current/tty-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb.current/usb-linus (a8750ddca918 Linux 4.15-rc8)
Merging usb-gadget-fixes/fixes (b2cd1df66037 Linux 4.15-rc7)
Merging usb-serial-fixes/usb-linus (d14ac576d10f USB: serial: cp210x: add new device ID ELV ALC 8xxx)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (a8750ddca918 Linux 4.15-rc8)
Merging char-misc.current/char-misc-linus (a8750ddca918 Linux 4.15-rc8)
Merging input-current/for-linus (060403f34008 Revert "Input: synaptics_rmi4 - use devm_device_add_group() for attributes in F01")
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
Merging mips-fixes/mips-fixes (f35764e74f0e MIPS: Fix undefined reference to physical_memsize)
Merging kvm-fixes/master (0c5b9b5d9adb Linux 4.15-rc9)
Merging kvms390-fixes/master (1de1ea7efeb9 KVM: s390: add proper locking for CMMA migration bitmap)
Merging drm-intel-fixes/for-linux-next-fixes (0c5b9b5d9adb Linux 4.15-rc9)
Merging drm-misc-fixes/for-linux-next-fixes (17b11b76b87a drm/vc4: Fix NULL pointer dereference in vc4_save_hang_state())
Merging kbuild/for-next (cad13a280925 Merge branches 'kconfig' and 'misc' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (0d8488ac1b68 arm64: use swiotlb_alloc and swiotlb_free)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (3d7352b79292 Merge branches 'fixes', 'misc', 'sa1111' and 'sa1100-for-next' into for-next)
Merging arm-perf/for-next/perf (7520fa99246d perf: ARM DynamIQ Shared Unit PMU support)
Merging arm-soc/for-next (748576367d58 arm-soc: document merges)
Merging actions/for-next (61862a89e6ac Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (33aa6dd12d40 Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-next)
Merging at91/at91-next (fa4cf68ab4b1 Merge tag 'at91-ab-4.16-dt' into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (824162aa1454 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a29b8b93e158 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (91cbd0893d7d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (e38c38728951 Merge branch 'omap-for-v4.16/ti-sysc' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/dra7.dtsi
Merging reset/reset/next (70d2f16a6289 reset: meson: enable level reset support on Meson8b)
Merging qcom/for-next (f5788d2f2929 Merge tag 'qcom-arm64-defconfig-for-4.16' into tagged-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (b214f9f550fd Merge branches 'fixes-for-v4.15' and 'dt-for-v4.16' into next)
Merging rockchip/for-next (5432915256e7 Merge branch 'v4.16-armsoc/dts64fixes' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (3b6327365aba Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (d7ec2c507677 Merge branch 'sunxi/fixes-for-4.15' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (0ba2e29c7fc1 arm64: Turn on KPTI only on CPUs that need it)
CONFLICT (content): Merge conflict in arch/arm64/kernel/fpsimd.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cputype.h
Merging clk/clk-next (34459c0de1ec Merge branch 'clk-allwinner' into clk-next)
Merging clk-samsung/for-next (7685570f2ae2 clk: samsung: s3c: Remove unneeded enumeration)
Merging c6x/for-linux-next (9d440f7a2824 c6x: fix platforms/plldata.c get_coreid build error)
Merging cris/for-next (fd989db807a0 cris: Fix conflicting types for _etext, _edata, _end)
Merging m68k/for-next (2334b1ac1235 MAINTAINERS: Add NuBus subsystem entry)
Merging m68knommu/for-next (0d665e7b109d mm, page_vma_mapped: Drop faulty pointer arithmetics in check_pte())
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (7b6ce52be3f8 microblaze: Setup proper dependency for optimized lib functions)
Merging mips/mips-next (132939062a32 Merge branches '4.15-fixes', '4.16-features' and 'octeon-3-net-mips-bits' into mips-next)
Merging mips-james/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (73acae67e363 openrisc: Fix conflicting types for _exext and _stext)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (a08082f8e4e1 powerpc/selftests: Check endianness on trap in TM)
Merging fsl/next (c095ff93f901 powerpc/sysdev: change CPM GPIO to platform_device)
Merging risc-v/for-linux-next (1c746bc0a3c8 automerging branch "github.com-riscv/next-zone_dma32" into "for-linux-next")
Merging s390/features (47d67facb057 s390/decompressor: discard __ksymtab and .eh_frame sections)
Merging sparc-next/master (b3ca676f6814 sparc: vDSO: remove an extra tab)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (73b37067623c xtensa: fix futex_atomic_cmpxchg_inatomic)
CONFLICT (content): Merge conflict in Documentation/features/debug/KASAN/arch-support.txt
Merging fscrypt/master (3d204e24d452 fscrypt: remove 'ci' parameter from fscrypt_put_encryption_info())
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs when under IO limits)
Merging btrfs-kdave/for-next (60e70a87e4d6 Merge branch 'misc-next' into for-next-20180123)
Merging ceph/master (21acdf45f495 rbd: set max_segments to USHRT_MAX)
Merging cifs/for-next (e627d8fea729 CIFS: dump IPC tcon in debug proc file)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (f463589a7cd2 ext2: drop unneeded newline)
Merging ext4/dev (a6c927bb894f ext4: create ext4_kset dynamically)
Merging f2fs/dev (f236792311f4 f2fs: allow to recover node blocks given updated checkpoint)
CONFLICT (content): Merge conflict in fs/f2fs/namei.c
Applying: Revert "f2fs: implement cgroup writeback support"
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (535cb8f3193f lockd: Fix server refcounting)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing over more CPUs)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/transport.c
CONFLICT (content): Merge conflict in net/sunrpc/xprt.c
Merging nfsd/nfsd-next (3ac71a649c3d nfsd: store stat times in fill_pre_wcc() instead of inode times)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (8383f1748829 ovl: wire up NFS export operations)
Merging ubifs/linux-next (7f29ae9f977b ubi: block: Fix locking for idr_alloc/idr_remove)
Merging xfs/for-next (75d4a13b1f61 xfs: fix non-debug build compiler warnings)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (418bb8b3ff50 Merge branch 'misc.netdrv' into for-next)
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging iversion/iversion-next (3a7a22ba0063 fs: handle inode->i_version more efficiently)
CONFLICT (content): Merge conflict in fs/nfsd/nfsfh.h
Merging printk/for-next (bb4f552a598d Merge branch 'for-4.16-console-waiter-logic' into for-4.16)
CONFLICT (content): Merge conflict in scripts/checkpatch.pl
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
Merging pci/next (8d51820f4fb2 Merge remote-tracking branch 'lorenzo/pci/xgene' into next)
Applying: powerpc/pci: fix for "Use of_irq_parse_and_map_pci() helper"
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (494622678bc9 Merge branch 'for-4.16/hid-quirks-cleanup/toshiba' into for-next)
Merging i2c/i2c/for-next (a874749be222 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (6509614fdd2d hwmon: (k10temp) Add temperature offset for Ryzen 1900X)
Merging jc_docs/docs-next (ae17a87dd7c7 linux-next: docs-rst: Fix typos in kfigure.py)
CONFLICT (content): Merge conflict in Documentation/core-api/printk-formats.rst
Merging v4l-dvb/master (4852fdca8818 media: i2c: ov7740: use gpio/consumer.h instead of gpio.h)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dmxdev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Applying: media: videobuf2: fix up for "media: annotate ->poll() instances"
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto description at the docs)
Merging fbdev/fbdev-for-next (5865889fe431 video: udlfb: Switch from the pr_*() to the dev_*() logging functions)
Merging pm/linux-next (6926258048ca Merge branch 'pm-pci' into linux-next)
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-platdrv.c
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (e856f078bcf1 OPP: Introduce "required-opp" property)
Merging thermal/next (134f4010799a Merge branches 'thermal-core', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (d0ecbbbe518e thermal/drivers/hisi: Remove bogus const from function return type)
Merging ieee1394/for-next (188775181bc0 firewire-ohci: work around oversized DMA reads on JMicron controllers)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (8ec59b44a006 Merge branch 'rebased-net-ioctl' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
CONFLICT (content): Merge conflict in net/tipc/socket.c
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
Merging bpf-next/master (e9dcd80b9d77 bpf, doc: Correct one wrong value in "Register value tracking")
Merging ipsec-next/master (50bd870a9e5c xfrm: Add ESN support for IPSec HW offload)
Merging netfilter-next/master (c746fc0e8b2d cxgb4: add geneve offload support for T6)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (b69c1df47281 brcmfmac: separate firmware errors from i/o errors)
Merging bluetooth/master (0bd4ded3287d Bluetooth: btintel: Create common function for firmware download)
Merging mac80211-next/master (0ddcff49b672 mac80211_hwsim: fix possible memory leak in hwsim_new_radio_nl())
Merging rdma/for-next (052eac6eeb56 RDMA/cma: Update RoCE multicast routines to use net namespace)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/qp.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
$ git reset --hard HEAD^
Merging next-20180119 version of rdma
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/qp.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
[master 345df09c5f991288ad4eda441896691b3a59165c] next-20180119/rdma
Merging gfs2/for-next (805c090750a3 GFS2: Log the reason for log flushes in every log header)
Merging mtd/master (fee4380f368e mtd: nand: pxa3xx: Fix READOOB implementation)
Merging l2-mtd/mtd/next (0aede42e98e0 mtd: Remove duplicate checks on mtd_oob_ops parameter)
Merging nand/nand/next (c1a72e2dbb4a mtd: nand: Fix build issues due to an anonymous union)
Merging spi-nor/spi-nor/next (23bae78e8a57 mtd: mtk-nor: modify functions' name more generally)
Merging crypto/master (6e36719fbe90 crypto: aes-generic - fix aes-generic regression on powerpc)
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
Merging drm/drm-next (559f17bec508 Merge tag 'drm-misc-next-fixes-2018-01-18' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (759315f4f757 drm/i915: Only attempt to scan the requested number of shrinker slabs)
Merging drm-tegra/drm/tegra/for-next (8f62142e490d drm/tegra: dc: Properly cleanup overlay planes)
Merging drm-misc/for-linux-next (5bffee867df7 dma-buf: fix reservation_object_wait_timeout_rcu once more v2)
Merging drm-msm/msm-next (1822cb02975b drm/msm/dsi: correct DSI id bounds check during registration)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with COMPILE_TEST)
Merging etnaviv/etnaviv/next (4c93867aeb26 drm/etnaviv: replace hangcheck with scheduler timeout)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (a75de7721184 Merge remote-tracking branches 'regmap/topic/soundwire' and 'regmap/topic/zero' into regmap-next)
Merging sound/for-next (1c9609e3a8cf ALSA: hda - Reduce the suspend time consumption for ALC256)
Merging sound-asoc/for-next (89cef999bc73 Merge remote-tracking branches 'asoc/topic/wm8903', 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (0cad61d7a3d5 modpost: Remove trailing semicolon)
Merging input/next (4b3e910d7f43 Input: edt-ft5x06 - fix error handling for factory mode on non-M06)
Merging block/for-next (aefb65a45c12 Merge branch 'for-4.16/block' into for-next)
CONFLICT (content): Merge conflict in lib/Kconfig
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (364509f5a16c Merge branch 'dm-4.16' into block-4.16_dm-4.16)
Merging mmc/next (310eb252a783 mmc: mmci: fix error return code in mmci_probe())
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (1532d9e87e8b raid5-ppl: PPL support for disks with write-back cache enabled)
Merging mfd/for-mfd-next (0f89ffefa4e1 mfd: lpc_ich: Do not touch SPI-NOR write protection bit on Apollo Lake)
Merging backlight/for-backlight-next (2023b0524a63 backlight: tdo24m: Fix the SPI CS between transfers)
Merging battery/for-next (8be4c3667cf1 MAINTAINERS: Add AXP288 PMIC entry)
Merging regulator/for-next (e2aca59d47be Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (400f428062af Merge branch 'next-integrity' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next-testing)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
Merging integrity/next-integrity (87075a9acb09 ima: re-initialize iint->atomic_flags)
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition processing if the policy isn't loaded)
Merging tpmdd/next (68021bf4734d tpm: remove unused variables)
Merging watchdog/master (d040a2ee0e62 watchdog: remove at32ap700x_wdt)
Merging iommu/next (fedbd940d1c2 Merge branches 'arm/renesas', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (46ed90f157f4 vfio: mdev: make a couple of functions and structure vfio_mdev_driver static)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (5fbd55d21e56 libfdt: remove unnecessary include directive from <linux/libfdt.h>)
CONFLICT (content): Merge conflict in drivers/of/Kconfig
Merging mailbox/mailbox-for-next (ca64af43924f mailbox: ti-msgmgr: Use %zu for size_t print format)
Merging spi/for-next (adaa7827b5d1 Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/sirf', 'spi/topic/sun6i' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (a4b30d066a0f Merge branch 'linus')
Merging clockevents/clockevents/next (322fd24f5e67 clocksource/drivers/stm32: Start the timer's counter sooner)
CONFLICT (content): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/timer-of.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (68fa24f9121c EDAC, mv64x60: Fix an error handling path)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4397f04575c4 tracing: Fix possible double free on failure of allocating trace buffer)
Merging rcu/rcu/next (1dfa55e01987 Merge branches 'cond_resched.2017.12.04a', 'dyntick.2017.11.28a', 'fixes.2017.12.11a', 'srbd.2017.12.05a' and 'torture.2017.12.11a' into HEAD)
Merging kvm/linux-next (7cd918047a8b Merge tag 'kvm-s390-next-4.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux)
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sregs()
Merging kvm-arm/next (0482b50546b1 arm64: mm: Add additional parameter to uaccess_ttbr0_disable)
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (9b9b13a6d153 KVM: PPC: Book3S HV: Keep XIVE escalation interrupt masked unless ceded)
Merging kvms390/next (c25d03331819 KVM: s390: introduce the format-1 GISA)
Merging xen-tip/linux-next (cf2acf66ad43 xen/gntdev: Fix partial gntdev_mmap() cleanup)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized can be boolean)
Merging workqueues/for-next (a10eb37ccf1d Merge branch 'for-4.15-fixes' into for-next)
Merging drivers-x86/for-next (4d6bde512a86 platform/x86: dell-laptop: Filter out spurious keyboard backlight change events)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (6a836631e303 leds: ledtrig-transient: Add SPDX license identifiers)
Merging ipmi/for-next (e45af3d372f1 ipmi_ssif: Remove duplicate NULL check)
Merging driver-core/driver-core-next (c505cbd45f6e device property: Define type of PROPERTY_ENRTY_*() macros)
Merging usb/usb-next (d08dd3f3dd2a USB: serial: pl2303: new device id for Chilitag)
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel)
Merging usb-serial/usb-next (d1c48227d7c4 USB: serial: f81534: fix tx error on some baud rate)
Merging usb-chipidea-next/ci-for-usb-next (19360068b10c usb: chipidea: usbmisc: small clean up)
Merging phy-next/next (e4b227c1ca70 phy: phy-mtk-tphy: use of_device_get_match_data())
Merging tty/tty-next (c7e1b4059075 tty: serial: exar: Relocate sleep wake-up handling)
Merging char-misc/char-misc-next (9ff6576e124b char: lp: use true or false for boolean values)
Merging extcon/extcon-next (ca90a64dc671 extcon: axp288: Handle reserved charger-type values better)
Merging staging/staging-next (9d03032d309b Staging: rtl8723bs: Use !x instead of NULL comparison)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (5d51be1ba14e Merge branch 'topic/stm' into next)
Merging cgroup/for-next (659a0792e491 Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (fcb5ee39fd0a Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (a2390348c19d scsi: qla2xxx: Fix logo flag for qlt_free_session_done())
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_init.c
Merging target-updates/for-next (1c130ae00b76 iscsi-target: make sure to wake up sleeping login worker)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (83ab14e6cacc Merge branch 'for-4.16' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (163c558b84fe Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (d58f2bf261fd gpio: Timestamp events in hardirq handler)
Merging pinctrl/for-next (8668693769bb Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configuration for Meson-AXG)
Merging userns/for-next (9eba1cd4b565 24 Jan 2018 Merge of my siginfo and userns trees for testing in linux-next)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (0e9e327d1622 selftests: vm: update .gitignore with missing generated file)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (d13f5d84ca27 Merge branch 'for-4.16/signal-sysfs-force-v2' into for-next)
Merging coresight/next (1443f5b4fb45 MAINTAINERS: Add SoundWire entry)
Merging rtc/rtc-next (796c0ad79ee6 Documentation: rtc: move iotcl interface documentation to ABI)
Merging nvdimm/libnvdimm-for-next (807da390de05 Merge branch 'for-4.16/dax' into libnvdimm-for-next)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (0f30aca72c3b eeprom: at24: extend the list of chips supported in DT)
Merging ntb/ntb-next (41db09c9cf1d NTB: ntb_perf: fix cast to restricted __le32)
Merging kspp/for-next/kspp (e47e311843de lkdtm: Update usercopy tests for whitelisting)
CONFLICT (content): Merge conflict in net/sctp/socket.c
Merging init_task/init_task (e1e871aff3de Expand INIT_STRUCT_PID and remove)
Applying: mm/memory_failure: update powerpc for memory_failure() API change
Merging akpm-current/current (7ada87bbb98d ipc/mqueue.c: have RT tasks queue in by priority in wq_add())
CONFLICT (content): Merge conflict in mm/sparse-vmemmap.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: ipc/mqueue: add missing error code in init_mqueue_fs()
Applying: fs/crypto/hooks.c: fix build with gcc-4.4.4
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
Merging akpm/master (a338c41c7688 pipe: read buffer limits atomically)
