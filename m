From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 22
Date: Fri, 22 Dec 2017 16:38:14 +1100
Message-ID: <20171222163814.55107de3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750897AbdLVFiR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Dec 2017 00:38:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

News: The next release will be on January 2nd.

Changes since 20171221:

New tree: mips (the old mips tree has been renamed to mips-james)

The aspeed tree gained conflicts against the arm-soc tree.

The omap tree gained a conflict against the keystone tree.

The xfs tree gained a conflict against Linus' tree.

The jc_docs tree gained a conflict against the printk tree.

The net-next tree gained a conflict against the net tree. It also gained
a build failure due to an interaction with the net tree for which I
applied a merge fix patch.

The spi tree gained a build failure so I used the version from
next-20171221.

Non-merge commits (relative to Linus' tree): 5934
 6024 files changed, 229386 insertions(+), 174054 deletions(-)

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

I am currently merging 254 trees (counting Linus' and 43 trees of bug
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
Merging origin/master (9035a8961b50 Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (cfe17c9bbe6a kbuild: move cc-option and cc-disable-warning after incl. arch Makefile)
Merging arc-current/for-curr (d3b388559fac ARC: handle gcc generated __builtin_trap for older compiler)
Merging arm-current/fixes (36b0cb84ee85 ARM: 8731/1: Fix csum_partial_copy_from_user() stack mismatch)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (110df8bd3e41 powerpc/perf: Fix kfree memory allocated for nest pmus)
Merging sparc/master (a0908a1b7d68 Merge branch 'akpm' (patches from Andrew))
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (c50b7c473f60 Merge branch 'net-zerocopy-fixes')
Merging bpf/master (82abbf8d2fc4 bpf: do not allow root to mangle valid pointers)
Merging ipsec/master (acf568ee859f xfrm: Reinject transport-mode packets through tasklet)
Merging netfilter/master (4c82fd0abb87 netfilter: uapi: correct UNTRACKED conntrack state bit number)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a41886f56b7b Merge tag 'iwlwifi-for-kalle-2017-12-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (04a7279ff12f cfg80211: ship certificates as hex files)
Merging sound-current/for-linus (1e9a328e4b35 Merge tag 'asoc-fix-v4.15-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (1291a0d5049d Linux 4.15-rc4)
Merging driver-core.current/driver-core-linus (9b3fa47d4a76 kobject: fix suppressing modalias in uevents delivered over netlink)
Merging tty.current/tty-linus (966031f34018 n_tty: fix EXTPROC vs ICANON interaction with TIOCINQ (aka FIONREAD))
Merging usb.current/usb-linus (76916b663e8d Merge tag 'usb-ci-v4.15-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-linus)
Merging usb-gadget-fixes/fixes (1291a0d5049d Linux 4.15-rc4)
Merging usb-serial-fixes/usb-linus (3920bb713038 USB: serial: option: adding support for YUGA CLM920-NC5)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (d6b246bb7a29 staging: android: ion: Fix dma direction for dma_sync_sg_for_cpu/device)
Merging char-misc.current/char-misc-linus (7f3dc0088b98 binder: fix proc->files use-after-free)
Merging input-current/for-linus (8b7e9d9e2d8b Input: hideep - fix compile error due to missing include file)
Merging crypto-current/master (d53c51357923 crypto: af_alg - fix race accessing cipher request)
Merging ide/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging vfio-fixes/for-linus (e41dd1556d4d Merge branch 'iommu-fixes/vt-d' into for-linus)
Merging kselftest-fixes/fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging backlight-fixes/for-backlight-fixes (8ff5cbc6e3c5 backlight: as3711_bl: fix device-tree node leaks)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (10a6a6975691 Revert "dt-bindings: mtd: add sst25wf040b and en25s64 to sip-nor list")
Merging mfd-fixes/for-mfd-fixes (b860b419d970 mfd: Fix RTS5227 (and others) powermanagement)
Merging v4l-dvb-fixes/fixes (781b045baefd media: imx274: Fix error handling, add MAINTAINERS entry)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (b084116f8587 MIPS: AR7: Ensure that serial ports are properly set up)
Merging kvm-fixes/master (aa12f594f97e tools/kvm_stat: sort '-f help' output)
Merging kvms390-fixes/master (ca76ec9ca871 KVM: s390: Fix skey emulation permission check)
Merging drm-intel-fixes/for-linux-next-fixes (8bc0d7ac934b i915: Reject CCS modifiers for pipe C on Geminilake)
Merging drm-misc-fixes/for-linux-next-fixes (d2a48e52541c drm: move lease init after validation in drm_lease_create)
Merging kbuild/for-next (51ead908186d Merge branches 'misc' and 'kconfig' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (9d002958042e Merge branches 'fixes', 'misc' and 'sa1111' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (da83cdd756f3 arm-soc: document merges)
Merging actions/for-next (a15f031b7361 Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (41e7e48adbd7 Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/aspeed-g4.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/Makefile
Merging at91/at91-next (313e34f3c183 Merge branch 'at91-dt' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (3d48b83d1ab5 Merge branch 'imx/dt64' into for-next)
Merging keystone/next (4b8c958da6ba Merge branch 'for_4.16/drivers-soc' into next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging mvebu/for-next (f88c3598b931 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (2292720481a0 Merge branch 'omap-for-v4.16/dt' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging reset/reset/next (0e5721f76252 reset: meson-axg: add compatible string for Meson-AXG SoC)
Merging qcom/for-next (1da6d150c1e2 Merge branch 'drivers-for-4.16' into all-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (428a4e4b3aaa Merge branches 'arm64-dt-for-v4.16', 'dt-for-v4.16', 'defconfig-for-v4.16' and 'soc-for-v4.16' into next)
Merging rockchip/for-next (bca80cbb9e79 Merge branch 'v4.16-armsoc/dts64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (894d29da0bc4 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (b928d8038f58 Merge branches 'sunxi/dt-for-4.16' and 'sunxi/fixes-for-4.15' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (6aef0fdd35ea Merge branch 'kpti' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging clk/clk-next (8951f7a70a94 Merge branch 'clk-omap' into clk-next)
Merging clk-samsung/for-next (bebc6082da0a Linux 4.14)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (1291a0d5049d Linux 4.15-rc4)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (50c4c4e268a2 Linux 4.15-rc3)
Merging mips/mips-next (31c8d70c01fc Merge branches '4.15-fixes', '4.16-features' and 'octeon-3-net-mips-bits' into mips-next)
Merging mips-james/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (73acae67e363 openrisc: Fix conflicting types for _exext and _stext)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (f36dbfe1a504 selftests/powerpc: Fix build errors in powerpc ptrace selftests)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (1135e9bc2b63 automerging branch "github.com-riscv/next-tlb" into "for-linux-next")
Merging s390/features (7bceec4e58ee s390/vdso: revise CFI annotations of vDSO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (60f8f2dd34b3 Merge branch 'xtensa-ssp-kasan' into xtensa-for-next)
CONFLICT (content): Merge conflict in Documentation/features/debug/KASAN/arch-support.txt
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs when under IO limits)
Merging btrfs-kdave/for-next (19046dac1143 Merge branch 'for-next-next-v4.15-20171221' into for-next-20171221)
Merging ceph/master (040d786032bf ceph: drop negative child dentries before try pruning inode's alias)
Merging cifs/for-next (a2b2eab6d76d cifs: Fix missing put_xid in cifs_file_strict_mmap)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (d5bd821350e6 udf: Sanitize nanoseconds for time stamps)
Merging ext4/dev (9d5afec6b8bd ext4: fix crash when a directory's i_size is too small)
Merging f2fs/dev (4fbd8d194f06 Linux 4.15-rc1)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (9035a8961b50 Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing over more CPUs)
CONFLICT (content): Merge conflict in net/sunrpc/xprt.c
Merging nfsd/nfsd-next (a14fbdff76ba lockd: convert nlm_rqst.a_count from atomic_t to refcount_t)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (da2e6b7eeda8 ovl: fix overlay: warning prefix)
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (68c58e9b9a88 xfs: only skip rmap owner checks for unknown-owner rmap removal)
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (b75cfa1913c2 Merge branches 'work.get_user_pages_fast', 'work.wmci', 'work.sock_recvmsg', 'misc.netdrv', 'work.mkobj', 'misc.poll', 'work.whack-a-mole' and 'work.misc' into for-next)
CONFLICT (content): Merge conflict in net/netfilter/xt_bpf.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/via/via-rhine.c
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (926adbad7320 Merge commit 'da6af54dc0014d733ce014a196e4c84ee43cabec' into for-4.16-deprecate-printk-pf)
Merging pci/next (e3987c2e2ca9 Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanup/pixart' into for-next)
Merging i2c/i2c/for-next (7f361814eb1f Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (4c95d48a1b0b hwmon: (pmbus) cffps: Add debugfs entries)
Merging jc_docs/docs-next (aa931b44ae3e w1_netlink.h: add support for nested structs)
CONFLICT (content): Merge conflict in Documentation/core-api/printk-formats.rst
Merging v4l-dvb/master (ae49432810c5 media: ddbridge: improve ddb_ports_attach() failure handling)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto description at the docs)
Merging fbdev/fbdev-for-next (5f215d252496 OMAPFB: prevent buffer underflow in omapfb_parse_vram_param())
Merging pm/linux-next (973c92251393 Merge branch 'pm-cpufreq-thermal' into linux-next)
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging thermal/next (1e032393d968 Merge branches 'thermal-core', 'thermal-tool', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (fd6d2e506ce6 Merge tag 'docs-4.15-fixes' of git://git.lwn.net/linux)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (0a80f0c26bf5 Merge branch 'flow_dissector-Provide-basic-batman-adv-unicast-handling')
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
CONFLICT (content): Merge conflict in kernel/bpf/verifier.c
CONFLICT (content): Merge conflict in drivers/net/phy/marvell.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/netronome/nfp/bpf/main.c
Applying: netdevsim: fix up for "cls_bpf: fix offload assumptions after callback conversion"
Applying: ipv6: fix up for "ipv6: Move dst->from into struct rt6_info"
Merging bpf-next/master (c475ffad58a8 tools/bpf: adjust rlimit RLIMIT_MEMLOCK for test_dev_cgroup)
Merging ipsec-next/master (9cb0d21d01b9 xfrm: wrap xfrmdev_ops with offload config)
Merging netfilter-next/master (e02538c6458b netfilter: reduce size of hook entry point locations)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_h323_asn1.c
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (f39a5c01c3d2 Merge branch 'nfp-flower-add-Geneve-tunnel-support')
Merging bluetooth/master (22b371cbb949 Bluetooth: introduce DEFINE_SHOW_ATTRIBUTE() macro)
Merging mac80211-next/master (983dafaab799 cfg80211: Scan results to also report the per chain signal strength)
Merging rdma/for-next (4f71e973ff09 Automatic merge of 'heads/k.o/for-next' and 'heads/k.o/for-rc' from rdma.git)
Merging gfs2/for-next (850d2d915fa6 gfs2: Add a crc field to resource group headers)
Merging mtd/master (d82c36821684 mtd: Fix mtd_check_oob_ops())
Merging l2-mtd/mtd/next (2e7c7f66b2b4 MAINTAINERS: Move all MTD related branches to a single repo)
Merging nand/nand/next (24f648c2ba5d mtd: onenand: samsung: Remove a useless include)
Merging spi-nor/spi-nor/next (29d6b29f5040 mtd: spi-nor: indent issi section)
Merging crypto/master (65cd9588c597 MAINTAINERS: Add myself as co-maintainer for s5p-sss.c)
Merging drm/drm-next (df2869abd92b Merge branch 'drm-next-4.16' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (3138872ceb11 drm/i915: Show FBC worker status in debugfs)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
Merging drm-tegra/drm/tegra/for-next (ebae8d07435a drm/tegra: dc: Implement legacy blending)
Merging drm-misc/for-linux-next (8d44e9e69aac drm/framebuffer: Print task that allocated the fb in debug info.)
Merging drm-msm/msm-next (e11bf4505dd0 drm/msm: Fix NULL deref in adreno_load_gpu)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with COMPILE_TEST)
Merging etnaviv/etnaviv/next (49b82c389d2a drm/etnaviv: make THERMAL selectable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (7c7e2a49cd8d Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/nolock' into regmap-next)
Merging sound/for-next (56a23ee52611 ALSA: usb-audio: Proper fallback at get_term_name())
Merging sound-asoc/for-next (9ca2b715ad7f Merge remote-tracking branch 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (1291a0d5049d Linux 4.15-rc4)
Merging input/next (c1b433e04ef9 Input: gamecon - mark expected switch fall-throughs)
Merging block/for-next (50da70ed9c48 Merge branch 'for-4.15/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (29d62af49289 dm mpath: skip calls to end_io_bio if using NVMe bio-based and round-robin)
Merging mmc/next (d63da8c64bbf mmc: tmio: use io* accessors consistently)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (92e6245deab8 md/r5cache: print more info of log recovery)
Merging mfd/for-mfd-next (88a9b9a80177 mfd: ab8500: Introduce DEFINE_SHOW_ATTRIBUTE() macro)
Merging backlight/for-backlight-next (12a9d3bb6a25 backlight: apple_bl: Deprecate pci_get_bus_and_slot())
Merging battery/for-next (70a39e107501 Add support for bq27521 battery monitor)
Merging regulator/for-next (d8a2a263fc64 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (457e594528bf Merge branch 'next-general' into next-testing)
Merging integrity/next-integrity (a2a2c3c8580a ima: Use i_version only when filesystem supports it)
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition processing if the policy isn't loaded)
Merging tpmdd/next (46dd3b29e328 tpm2-cmd: allow more attempts for selftest execution)
Merging watchdog/master (b83ceef74353 watchdog: pcwd_usb: remove unneeded DRIVER_LICENSE #define)
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5887a2b2d6cc Merge branches 'v4.16-iommu/amd', 'v4.16-iommu/ipmmu-vmsa', 'v4.16-iommu/misc', 'v4.16-iommu/vt-d' and 'v4.16/vfio' into v4.16/next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (81ee6f1ef9b1 dt-bindings: display: panel: Fix compatible string for Toshiba LT089AC29000)
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (b900167cc630 Merge remote-tracking branches 'spi/topic/pxa2xx', 'spi/topic/sh-msiof', 'spi/topic/sun6i' and 'spi/topic/xilinx' into spi-next)
$ git reset --hard HEAD^
Merging next-20171221 version of spi
Merging tip/auto-latest (4a5dbf8b3a7c Merge branch 'WIP.x86/pti')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (86a18ee21e5e EDAC, ti: Add support for TI keystone and DRA7xx EDAC)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (b00d607bb188 tracing: Have stack trace not record if RCU is not watching)
Merging rcu/rcu/next (2781e186b35e rcutorture: Add basic ARM64 support to run scripts)
Merging kvm/linux-next (ccff53fd86ee KVM: x86: avoid unnecessary XSETBV on guest entry)
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sregs()
Merging kvm-arm/next (4fbd8d194f06 Linux 4.15-rc1)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (6762ec307d25 kvm_config: add CONFIG_S390_GUEST)
Merging xen-tip/linux-next (b3cf8528bb21 xen/balloon: Mark unallocated host memory as UNUSABLE)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized can be boolean)
Merging workqueues/for-next (01dfee9582d9 workqueue: remove unneeded kallsyms include)
Merging drivers-x86/for-next (c454a99d4ce1 intel-hid: add a DMI quirk to support Wacom MobileStudio Pro)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (cd752231b380 leds: lp8860: Various fixes to align with LED framework)
Merging ipmi/for-next (174134ac7602 ipmi_si: Fix error handling of platform device)
Merging driver-core/driver-core-next (59e73854b5fd component: add debugfs support)
Merging usb/usb-next (3df613ec12f7 usb: pd: fix the offset for SVID specific commands)
CONFLICT (content): Merge conflict in drivers/usb/usbip/vhci_rx.c
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel)
Merging usb-serial/usb-next (c7b8f77872c7 USB: serial: io_edgeport: fix possible sleep-in-atomic)
Merging usb-chipidea-next/ci-for-usb-next (061e20e9899e usb: chipidea: tegra: Use aligned DMA on Tegra30)
Merging phy-next/next (4fbd8d194f06 Linux 4.15-rc1)
Merging tty/tty-next (2b022ab7542d pty: cancel pty slave port buf's work in tty_release)
Merging char-misc/char-misc-next (1443f5b4fb45 MAINTAINERS: Add SoundWire entry)
Merging extcon/extcon-next (f67b4e4d00d6 Merge branch 'ib-extcon-mfd-4.16' into extcon-next)
Merging staging/staging-next (11cc84e708db staging: ccree: use size_t consistently)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (7dbe51689ff8 Merge branch 'fixes' into next)
Merging cgroup/for-next (e7d40c5ddac1 Merge branch 'for-4.15-fixes' into for-next)
Merging scsi/for-next (03e3b9f7130a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (b996ce39960e scsi: lpfc: correct sg_seg_cnt attribute min vs default)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (0172624f3417 Merge branch 'for-4.15-fixes' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (71ace6f49ec7 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b0e68071b3ae Merge branch 'devel' into for-next)
Merging pinctrl/for-next (42f25cd282f1 Merge branch 'devel' into for-next)
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
Merging nvdimm/libnvdimm-for-next (4247f24c2358 Merge branch 'for-4.15/dax' into libnvdimm-for-next)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (761281f7f476 eeprom: at24: add support for the write-protect pin)
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (589cde432c02 lkdtm: Update usercopy tests for whitelisting)
Merging init_task/init_task (3a0b110aa454 Expand INIT_STRUCT_PID and remove)
Merging akpm-current/current (69c194b3bef2 lustre: don't set f_version in ll_readdir)
CONFLICT (content): Merge conflict in kernel/fork.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: vfs: remove might_sleep() from clear_inode()
Applying: mm/userfaultfd.c: remove duplicate include
Applying: ipc, mqueue: lazy call kern_mount_data in new namespaces
Applying: mm: remove unneeded kallsyms include
Applying: hrtimer: remove unneeded kallsyms include
Applying: genirq: remove unneeded kallsyms include
Applying: mm/memblock: memblock_is_map/region_memory can be boolean
Applying: lib/lockref: __lockref_is_dead can be boolean
Applying: kernel/cpuset: current_cpuset_is_being_rebound can be boolean
Applying: kernel/resource: iomem_is_exclusive can be boolean
Applying: kernel/module: module_is_live can be boolean
Applying: kernel/mutex: mutex_is_locked can be boolean
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (6f9f8078770f lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
