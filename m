From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 15
Date: Fri, 15 Dec 2017 15:13:48 +1100
Message-ID: <20171215151348.77ad1be5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50149 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754903AbdLOENv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 23:13:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20171214:

New tree: init_task

The staging.current tree still had its build failure for which I reverted
a commit.

Non-merge commits (relative to Linus' tree): 4569
 4982 files changed, 156683 insertions(+), 143157 deletions(-)

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

I am currently merging 253 trees (counting Linus' and 43 trees of bug
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
Merging origin/master (d455df0bcc00 Merge tag '4.15-rc-smb3' of git://git.samba.org/sfrench/cifs-2.6)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (cfe17c9bbe6a kbuild: move cc-option and cc-disable-warning after incl. arch Makefile)
Merging arc-current/for-curr (799ab4a2c85b arc: do not use __print_symbol())
Merging arm-current/fixes (3aaf33bebda8 ARM: avoid faulting on qemu)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (110df8bd3e41 powerpc/perf: Fix kfree memory allocated for nest pmus)
Merging sparc/master (a0908a1b7d68 Merge branch 'akpm' (patches from Andrew))
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (8c8f67a46f2b Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging bpf/master (8c8f67a46f2b Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf)
Merging ipsec/master (d2950278d2d0 xfrm: put policies when reusing pcpu xdst entry)
Merging netfilter/master (d6da83813fb3 Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a41886f56b7b Merge tag 'iwlwifi-for-kalle-2017-12-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (4564b187c163 nl80211: fix nl80211_send_iface() error paths)
Merging sound-current/for-linus (c1cfd9025cc3 ALSA: rawmidi: Avoid racy info ioctl via ctl device)
Merging pci-current/for-linus (e1a355add3c2 PCI: endpoint: Fix find_first_zero_bit() usage)
Merging driver-core.current/driver-core-linus (50c4c4e268a2 Linux 4.15-rc3)
Merging tty.current/tty-linus (50c4c4e268a2 Linux 4.15-rc3)
Merging usb.current/usb-linus (48a4ff1c7bb5 USB: core: prevent malicious bNumInterfaces overflow)
Merging usb-gadget-fixes/fixes (9dbe416b656b Revert "usb: gadget: allow to enable legacy drivers without USB_ETH")
Merging usb-serial-fixes/usb-linus (762ff4678e89 USB: serial: usb_debug: add new USB device id)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (521e84ab2507 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (d98e6dbf42f7 staging: ion: Fix ion_cma_heap allocations)
Applying: Revert "staging: ion: Fix ion_cma_heap allocations"
Merging char-misc.current/char-misc-linus (50c4c4e268a2 Linux 4.15-rc3)
Merging input-current/for-linus (4c83c071b784 Input: elants_i2c - do not clobber interrupt trigger on x86)
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
Merging kvm-fixes/master (cf656c76614c tools/kvm_stat: add line for totals)
Merging kvms390-fixes/master (ca76ec9ca871 KVM: s390: Fix skey emulation permission check)
Merging drm-intel-fixes/for-linux-next-fixes (2cf654db8d7e drm/i915/fence: Use rcu to defer freeing of irq_work)
Merging drm-misc-fixes/for-linux-next-fixes (bd36d3bab2e3 drm/drm_lease: Prevent deadlock in case drm_lease_create() fails)
Merging kbuild/for-next (49ef51835a36 Merge branches 'kconfig' and 'misc' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (383f07dc0a84 Merge branches 'fixes', 'misc' and 'sa1111' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (8be0b9886b64 Merge branch 'fixes' into for-next)
Merging actions/for-next (a15f031b7361 Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (293db547c4a5 Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (9c9ae757dc8b Merge branch 'dt-for-v4.15' into for-next)
Merging at91/at91-next (bee152d6af7d Merge branch 'at91-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (3d48b83d1ab5 Merge branch 'imx/dt64' into for-next)
Merging keystone/next (f594d414d4f4 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (c6c5ff72be36 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (ac54e2fb21c6 Merge branch 'omap-for-v4.16/dt' into for-next)
Merging reset/reset/next (0e5721f76252 reset: meson-axg: add compatible string for Meson-AXG SoC)
Merging qcom/for-next (e7048ed58ed9 Merge tag 'qcom-drivers-for-4.15-2' into final-for-4.15)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (19e03b156dab Merge branch 'arm64-dt-for-v4.16' into next)
Merging rockchip/for-next (c73d733c7515 Merge branch 'v4.15-armsoc/fixes64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (ee530ad3b5ec Merge branch 'next/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging sunxi/sunxi/for-next (68865e126ffb Merge branches 'sunxi/clk-for-4.16', 'sunxi/dt-for-4.16' and 'sunxi/dt64-for-4.16' into sunxi/for-next)
Merging tegra/for-next (5eb9e5fbfdd0 Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (6aef0fdd35ea Merge branch 'kpti' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux)
Merging clk/clk-next (cd926aaac3b6 Merge branch 'clk-qcom-alpha-pll' into clk-next)
Merging clk-samsung/for-next (bebc6082da0a Linux 4.14)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (50c4c4e268a2 Linux 4.15-rc3)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (50c4c4e268a2 Linux 4.15-rc3)
Merging mips/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (73acae67e363 openrisc: Fix conflicting types for _exext and _stext)
Merging parisc-hd/for-next (79f2a61d4eea parisc: Reduce thread stack to 16 kb)
Merging powerpc/next (f36dbfe1a504 selftests/powerpc: Fix build errors in powerpc ptrace selftests)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (8943d9736821 automerging branch "github.com-riscv/next-audit_dir_write" into "for-linux-next")
Merging s390/features (7bceec4e58ee s390/vdso: revise CFI annotations of vDSO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (a5840bee73a3 Merge branch 'xtensa-asm-cleanups' into xtensa-for-next)
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (eccfa5b02330 Merge branch 'for-next-next-v4.15-20171212' into for-next-20171212)
Merging ceph/master (040d786032bf ceph: drop negative child dentries before try pruning inode's alias)
Merging cifs/for-next (5702591fc6a3 CIFS: don't log STATUS_NOT_FOUND errors for DFS)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (88bc0ede8d35 quota: Check for register_shrinker() failure.)
Merging ext4/dev (e243560f12d7 ext4: fix fdatasync(2) after fallocate(2) operation)
Merging f2fs/dev (4fbd8d194f06 Linux 4.15-rc1)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (a638349bf6c2 Merge branch 'for-4.15-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing over more CPUs)
Merging nfsd/nfsd-next (a14fbdff76ba lockd: convert nlm_rqst.a_count from atomic_t to refcount_t)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (da2e6b7eeda8 ovl: fix overlay: warning prefix)
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (a192de265b26 xfs: allow CoW remap transactions to use reserve blocks)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (18c4468d431b Merge branch 'for-linus' into for-next)
CONFLICT (content): Merge conflict in net/netfilter/xt_bpf.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/via/via-rhine.c
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (926adbad7320 Merge commit 'da6af54dc0014d733ce014a196e4c84ee43cabec' into for-4.16-deprecate-printk-pf)
Merging pci/next (329c863b0c1d Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanup/pixart' into for-next)
Merging i2c/i2c/for-next (7f361814eb1f Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (4c95d48a1b0b hwmon: (pmbus) cffps: Add debugfs entries)
Merging jc_docs/docs-next (2a7c7cba38f4 docs: Remove "could not extract kernel version" warning)
Merging v4l-dvb/master (0ca4e3130402 media: pxa_camera: rename the soc_camera_ prefix to pxa_camera_)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto description at the docs)
Merging fbdev/fbdev-for-next (5f215d252496 OMAPFB: prevent buffer underflow in omapfb_parse_vram_param())
Merging pm/linux-next (6424368125cb Merge branch 'powercap' into linux-next)
Merging cpupower/cpupower (ae64f9bd1d36 Linux 4.15-rc2)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging thermal/next (1e032393d968 Merge branches 'thermal-core', 'thermal-tool', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (fd6d2e506ce6 Merge tag 'docs-4.15-fixes' of git://git.lwn.net/linux)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (5c13e07580c8 net: dsa: lan9303: Introduce lan9303_read_wait)
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
CONFLICT (content): Merge conflict in drivers/net/phy/meson-gxl.c
Merging bpf-next/master (7310c23328ad Merge branch 'bpf-bpftool-cgroup-ops')
Merging ipsec-next/master (9b7e14dba0c0 xfrm: Remove redundant state assignment in xfrm_input())
Merging netfilter-next/master (e02538c6458b netfilter: reduce size of hook entry point locations)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_h323_asn1.c
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (1dde35d0b8e3 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/pcie/drv.c
Merging bluetooth/master (22b371cbb949 Bluetooth: introduce DEFINE_SHOW_ATTRIBUTE() macro)
Merging mac80211-next/master (b0d52ad82184 mac80211: Add airtime account and scheduling to TXQs)
Applying: mt76: fix up for "mac80211: Add TXQ scheduling API"
Merging rdma/for-next (9b67dd4a1ca0 Merge branch 'k.o/for-rc' into k.o/for-next)
Merging gfs2/for-next (850d2d915fa6 gfs2: Add a crc field to resource group headers)
Merging mtd/master (36de80740008 mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user)
Merging l2-mtd/master (1530578abdac mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid)
Merging nand/nand/next (24f46bcae62f mtd: nand: add ->exec_op() implementation)
Merging spi-nor/spi-nor/next (59b356ffd0b0 mtd: m25p80: restore the status of SPI flash when exiting)
Merging crypto/master (65cd9588c597 MAINTAINERS: Add myself as co-maintainer for s5p-sss.c)
Merging drm/drm-next (9428088c90b6 drm/qxl: reapply cursor after resetting primary)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/scheduler.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (ee5b5bf351ec drm/i915: Update DRIVER_DATE to 20171214)
Merging drm-tegra/drm/tegra/for-next (bbbd366c00a4 drm/tegra: Use IOMMU groups)
Merging drm-misc/for-linux-next (ca40cfc85e54 drm/atomic-helper: Make zpos property kerneldoc less misleading)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_edid.c
Merging drm-msm/msm-next (e11bf4505dd0 drm/msm: Fix NULL deref in adreno_load_gpu)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (d66611856832 drm/imx: advertise supported plane format modifiers)
Merging etnaviv/etnaviv/next (49b82c389d2a drm/etnaviv: make THERMAL selectable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (30ff8b14c0e5 Merge remote-tracking branch 'regmap/topic/const' into regmap-next)
Merging sound/for-next (108884e6c5aa ALSA: usb-audio: Change the semantics of the enable option)
Merging sound-asoc/for-next (6a8af7ab181d Merge remote-tracking branches 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (ece1996a21ee module: Do not paper over type mismatches in module_param_call())
Merging input/next (c1b433e04ef9 Input: gamecon - mark expected switch fall-throughs)
Merging block/for-next (50da70ed9c48 Merge branch 'for-4.15/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (3d7f45625a84 dm: fix __send_changing_extent_only() to send first bio and chain remainder)
Merging mmc/next (e828b53afd7f Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (474beb575c03 md/raid1,raid10: silence warning about wait-within-wait)
Merging mfd/for-mfd-next (15a94ce2b7ae mfd: stm32: Adopt SPDX identifier)
Merging backlight/for-backlight-next (29fae2c1db24 backlight: ili922x: Remove redundant variable len)
Merging battery/for-next (70a39e107501 Add support for bq27521 battery monitor)
Merging regulator/for-next (0cbd8b5da176 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (457e594528bf Merge branch 'next-general' into next-testing)
Merging integrity/next (e87dafe70acc ima: Remove redundant conditional operator)
CONFLICT (content): Merge conflict in include/linux/module.h
CONFLICT (content): Merge conflict in fs/namespace.c
CONFLICT (content): Merge conflict in Documentation/ABI/testing/evm
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition processing if the policy isn't loaded)
Merging tpmdd/next (db3248e8a036 tpm: Keep CLKRUN enabled throughout the duration of transmit_cmd())
CONFLICT (content): Merge conflict in include/linux/tpm_eventlog.h
Merging watchdog/master (14807b07a7d8 watchdog: pcwd_usb: remove unneeded DRIVER_LICENSE #define)
CONFLICT (content): Merge conflict in drivers/watchdog/mpc8xxx_wdt.c
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d04222983379 Merge branches 'iommu/arm/smmu', 'iommu/updates', 'vfio/fixes', 'vfio/platform', 'iommu/vt-d', 'iommu/ipmmu-vmsa' and 'iommu/iova' into next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (aa199b746678 dt-bindings: arm: document supported STM32 SoC family)
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (0dc0b857cc26 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/sun6i' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (638250bd465e Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (86a18ee21e5e EDAC, ti: Add support for TI keystone and DRA7xx EDAC)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (7cf19b391f18 tracing: Have stack trace not record if RCU is not watching)
Merging rcu/rcu/next (b9623f0e768f doc: Fixed typo in rcutorture documentation)
Merging kvm/linux-next (9f95bccc848d KVM: x86: avoid unnecessary XSETBV on guest entry)
Merging kvm-arm/next (4fbd8d194f06 Linux 4.15-rc1)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (da9a1446d248 KVM: s390: provide a capability for AIS state migration)
Merging xen-tip/linux-next (c4f9d9cb2c29 xen: XEN_ACPI_PROCESSOR is Dom0-only)
Merging percpu/for-next (abee210500ed percpu: hack to let the CRIS architecture to boot until they clean up)
Merging workqueues/for-next (01dfee9582d9 workqueue: remove unneeded kallsyms include)
Merging drivers-x86/for-next (c454a99d4ce1 intel-hid: add a DMI quirk to support Wacom MobileStudio Pro)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (381ba90a2d1e leds: as3645a: Fix line over 80 characters)
Merging ipmi/for-next (174134ac7602 ipmi_si: Fix error handling of platform device)
Merging driver-core/driver-core-next (73cf7e111ed6 Merge 4.15-rc3 into driver-core-next)
Merging usb/usb-next (66222f0d4b0f usb: xhci: make function xhci_dbc_free_req static)
Merging usb-gadget/next (50c4c4e268a2 Linux 4.15-rc3)
Merging usb-serial/usb-next (c7b8f77872c7 USB: serial: io_edgeport: fix possible sleep-in-atomic)
Merging usb-chipidea-next/ci-for-usb-next (2a53e060a053 usb: chipidea: fix trivial typo in Kconfig)
Merging phy-next/next (4fbd8d194f06 Linux 4.15-rc1)
Merging tty/tty-next (42e64571d516 Merge 4.15-rc3 into tty-next)
Merging char-misc/char-misc-next (8d52af6795c0 mei: speed up the power down flow)
Merging extcon/extcon-next (4f65b63ecc4c extcon: axp288:: Handle return value of platform_get_irq)
Merging staging/staging-next (9a38450ac3d1 staging: pi433: Fix disordered switch case)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (eadb0c38d8df Merge branch 'topic/qcom' into next)
Merging cgroup/for-next (f5a097b03320 Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (a9417e74ff41 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (ed123b6e4740 scsi: qla2xxx: remove duplicate includes)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (ebb82e3c79d2 ahci: Allow setting a default LPM policy for mobile chipsets)
Merging vhost/linux-next (03e25277b029 Merge branch 'this' into vhost)
Merging rpmsg/for-next (aae5207dd9c4 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (1cb26d26cc0f Merge branch 'devel' into for-next)
Merging pinctrl/for-next (353c2e005e37 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configuration for Meson-AXG)
Merging userns/for-next (8b2770a4e1c7 fix typo in assignment of fs default overflow gid)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (ae64f9bd1d36 Linux 4.15-rc2)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (c99a2be790b0 livepatch: force transition to finish)
Merging coresight/next (2bbe5ac62413 coresight: etb10: remove duplicate includes)
Merging rtc/rtc-next (9f33399c9074 rtc: stm32: Fix copyright)
Merging nvdimm/libnvdimm-for-next (4247f24c2358 Merge branch 'for-4.15/dax' into libnvdimm-for-next)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (1c387ad396ac eeprom: at24: support eeproms that do not auto-rollover reads)
CONFLICT (content): Merge conflict in drivers/misc/eeprom/at24.c
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (589cde432c02 lkdtm: Update usercopy tests for whitelisting)
Merging init_task/init_task (3a0b110aa454 Expand INIT_STRUCT_PID and remove)
Merging akpm-current/current (55514d143574 lustre: don't set f_version in ll_readdir)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: vfs: remove might_sleep() from clear_inode()
Applying: mm/userfaultfd.c: remove duplicate include
Applying: ipc, mqueue: lazy call kern_mount_data in new namespaces
Applying: mm: remove unneeded kallsyms include
Applying: power: remove unneeded kallsyms include
Applying: pci: remove unneeded kallsyms include
Applying: pnp: remove unneeded kallsyms include
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
Merging akpm/master (1fa90b4b2444 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
