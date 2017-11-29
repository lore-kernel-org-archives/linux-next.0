From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 29
Date: Wed, 29 Nov 2017 14:11:35 +1100
Message-ID: <20171129141135.6d696fd8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751979AbdK2DLh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 22:11:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20171128:

New trees:	bpf, bpf-next
Renamed tree:	kvm-master to kvm-fixes
Dropped tree:	vfs (badly conflicting commit)

The vfs tree gained conflicts against Linus' tree so I dropped it
for today.

The i2c tree lost its build failure.

The etnaviv tree still had its build failure, so I used the version from
next-20171127.

The sound-asoc tree gained a build failure, so I used the version from
next-20171128.

Non-merge commits (relative to Linus' tree): 1362
 1321 files changed, 29513 insertions(+), 16743 deletions(-)

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

I am currently merging 251 trees (counting Linus' and 40 trees of bug
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
Merging origin/master (43f462f1c2e1 Merge tag 'drm-for-v4.15-part2-fixes' of git://people.freedesktop.org/~airlied/linux)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (bb3f38c3c5b7 kbuild: clang: fix build failures with sparse check)
Merging arc-current/for-curr (4fbd8d194f06 Linux 4.15-rc1)
Merging arm-current/fixes (3aaf33bebda8 ARM: avoid faulting on qemu)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (2621e945fbf1 powerpc/kexec: Fix kexec/kdump in P9 guest kernels)
Merging sparc/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (d51aae68b142 net: sched: cbq: create block for q->link.block)
CONFLICT (content): Merge conflict in net/rxrpc/call_object.c
Merging bpf/master (a39e17b2d842 bpf: offload: add a license header)
Merging ipsec/master (94802151894d Revert "xfrm: Fix stack-out-of-bounds read in xfrm_state_find.")
Merging netfilter/master (8b1836c4b643 netfilter: conntrack: clamp timeouts to INT_MAX)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (ed59b7d53c95 Merge ath-current from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging mac80211/master (72e2c3438ba3 mac80211: tear down RX aggregations first)
Merging sound-current/for-linus (4fbd8d194f06 Linux 4.15-rc1)
Merging pci-current/for-linus (4fbd8d194f06 Linux 4.15-rc1)
Merging driver-core.current/driver-core-linus (0946b2fb38fd firmware: cleanup FIRMWARE_IN_KERNEL message)
Merging tty.current/tty-linus (c8ec2041f549 MIPS: Add custom serial.h with BASE_BAUD override for generic kernel)
Merging usb.current/usb-linus (7fee72d5e8f1 uas: Always apply US_FL_NO_ATA_1X quirk to Seagate devices)
Merging usb-gadget-fixes/fixes (a3acc696085e usb: f_fs: Force Reserved1=1 in OS_DESC_EXT_COMPAT)
Merging usb-serial-fixes/usb-linus (762ff4678e89 USB: serial: usb_debug: add new USB device id)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (4fbd8d194f06 Linux 4.15-rc1)
Merging staging.current/staging-linus (0590cdfead8c staging: octeon-usb: use __delay() instead of cvmx_wait())
Merging char-misc.current/char-misc-linus (0631fb8b027f firmware: vpd: Fix platform driver and device registration/unregistration)
Merging input-current/for-linus (c25141062a82 Merge branch 'next' into for-linus)
Merging crypto-current/master (c14ca8386539 crypto: skcipher - Fix skcipher_walk_aead_common)
Merging ide/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging vfio-fixes/for-linus (e41dd1556d4d Merge branch 'iommu-fixes/vt-d' into for-linus)
Merging kselftest-fixes/fixes (a323335e62cc selftests: lib.mk: print individual test results to console by default)
Merging backlight-fixes/for-backlight-fixes (bebc6082da0a Linux 4.14)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (4fbd8d194f06 Linux 4.15-rc1)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (30b4e122d71c media: rc: sir_ir: detect presence of port)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (b084116f8587 MIPS: AR7: Ensure that serial ports are properly set up)
Merging kvm-fixes/master (a63dd7480d8f Merge tag 'kvm-ppc-fixes-4.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into kvm-master)
Merging drm-intel-fixes/for-linux-next-fixes (05dfe9f2be9d Merge tag 'gvt-fixes-2017-11-28' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (517f56839f58 drm/rockchip: dw-mipi-dsi: fix possible un-balanced runtime PM enable)
Merging kbuild/for-next (10aaa3b7e95b kbuild: drop $(extra-y) from real-objs-y)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (d51192c7fd2a Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (cf9b0772f2e4 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging actions/for-next (a15f031b7361 Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (5751276f6bbf Merge branch 'v4.15/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (9c9ae757dc8b Merge branch 'dt-for-v4.15' into for-next)
Merging at91/at91-next (bee152d6af7d Merge branch 'at91-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging imx-mxs/for-next (ac5a1ba06d5c Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8270bfa5860d Merge branch 'for_4.15/keystone-soc' into next)
Merging mvebu/for-next (c6c5ff72be36 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (612c2ca32cf5 Merge branch 'omap-for-v4.15/fixes-v2' into for-next)
Merging reset/reset/next (13fba8ef50db reset: remove reset_control_get(_optional))
Merging qcom/for-next (e7048ed58ed9 Merge tag 'qcom-drivers-for-4.15-2' into final-for-4.15)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (710a0b7d9b76 Merge branches 'arm64-dt-for-v4.16', 'dt-bindings-for-v4.16', 'dt-for-v4.16' and 'soc-for-v4.16' into next)
Merging rockchip/for-next (308c3c77ccb3 Merge branch 'v4.15-armsoc/dts64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging sunxi/sunxi/for-next (df7cacd062cd Merge branches 'sunxi/dt-for-4.16', 'sunxi/dt64-for-4.16' and 'sunxi/fixes-for-4.15' into sunxi/for-next)
Merging tegra/for-next (ec0c973f47c7 Merge branch for-4.15/reset into for-next)
Merging arm64/for-next/core (6cfa7cc46b1a arm64: Make ARMV8_DEPRECATED depend on SYSCTL)
Merging clk/clk-next (36331641eb42 Merge branch 'clk-cleanup' into clk-next)
Merging clk-samsung/for-next (bebc6082da0a Linux 4.14)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (c8b61d508986 m68k: add Sysam stmark2 open board support)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (dfe390a6d844 microblaze: add missing include to mmu_context_mm.h)
Merging mips/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (610f01b9a88a openrisc: fix possible deadlock scenario during timer sync)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (5b0e2cb02008 Merge tag 'powerpc-4.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (f0b0655e9936 Merge tag 'v4.14-rc8' into for-linux-next)
Merging s390/features (345f8f34bb47 s390: revert ELF_ET_DYN_BASE base changes)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (777a45b45866 arch/tile: Implement ->set_state_oneshot_stopped())
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (9d327c98b9d0 Merge branch 'for-next-next-v4.15-20171127' into for-next-20171127)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
Merging ceph/master (3cfa3b16dd2f rbd: default to single-major device number scheme)
Merging cifs/for-next (d13ecaa98be7 cifs: avoid a kmalloc in smb2_send_recv/SendReceive2 for the common case)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (b8b099238223 Pull error handling fix in dquot_file_open().)
Merging ext4/dev (232530680290 ext4: improve smp scalability for inode generation)
Merging f2fs/dev (4fbd8d194f06 Linux 4.15-rc1)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging nfsd/nfsd-next (81833de1a46e lockd: fix "list_add double add" caused by legacy signal interface)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (d9768076068f ovl: remove unneeded arg from ovl_verify_origin())
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (712d361d59ef xfs: calculate correct offset in xfs_scrub_quota_item)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (7d8c430e7e22 Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in fs/overlayfs/super.c
CONFLICT (content): Merge conflict in fs/nfs/internal.h
CONFLICT (content): Merge conflict in fs/jffs2/super.c
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in fs/ext2/super.c
CONFLICT (content): Merge conflict in fs/cifs/cifsglob.h
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/afs/super.c
$ git reset --hard HEAD
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (9afe77ed849d added new line symbol after warning about dropped messages)
Merging pci/next (625955ba7f2c Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (4fbd8d194f06 Linux 4.15-rc1)
Merging hid/for-next (6c08525dc1af Merge branch 'for-4.16/elo' into for-next)
Merging i2c/i2c/for-next (41493dd4c8b6 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (631cc4b570a0 hwmon: (coretemp) deprecate pci_get_bus_and_slot())
Merging jc_docs/docs-next (3a025e1d1c2e Add optional check for bad kernel-doc comments)
Merging v4l-dvb/master (04226916d236 media: usbtv: add a new usbid)
Merging v4l-dvb-next/master (db6321a1af84 media: platform: VIDEO_QCOM_CAMSS should depend on HAS_DMA)
Merging fbdev/fbdev-for-next (5f215d252496 OMAPFB: prevent buffer underflow in omapfb_parse_vram_param())
Merging pm/linux-next (d94f8ef6efe1 Merge branch 'acpi-pm' into linux-next)
Merging cpupower/cpupower (dbdc468f35ee cpupower : Fix cpupower working when cpu0 is offline)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging thermal/next (1e032393d968 Merge branches 'thermal-core', 'thermal-tool', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (b2fd708ffa7f thermal: cpu_cooling: pr_err() strings should end with newlines)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (1d3b78bbc6e9 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging bpf-next/master (2020b6b5afee Merge branch 'bpf-infra-for-error-injection')
Merging ipsec-next/master (2a171788ba7b Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging netfilter-next/master (c5c44aa5791e netfilter: conntrack: timeouts can be const)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (fdd0bd88ceae brcmfmac: add CLM download support)
Merging bluetooth/master (da3768401021 Bluetooth: hci_bcm: Add support for BCM2E72)
Merging mac80211-next/master (5048a9c329af mac80211: make __ieee80211_start_rx_ba_session static)
CONFLICT (content): Merge conflict in net/mac80211/agg-tx.c
CONFLICT (content): Merge conflict in net/mac80211/agg-rx.c
Merging rdma/for-next (4190b4e96954 RDMA/core: Rename kernel modify_cq to better describe its usage)
Merging gfs2/for-next (9aa015932727 gfs2: Remove unused gfs2_write_jdata_pagevec parameter)
Merging mtd/master (36de80740008 mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user)
Merging l2-mtd/master (1530578abdac mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid)
Merging nand/nand/next (30863e38ebeb mtd: nand: Fix writing mtdoops to nand flash.)
Merging spi-nor/spi-nor/next (4fbd8d194f06 Linux 4.15-rc1)
Merging crypto/master (1d9ddde12e3c lib/mpi: call cond_resched() from mpi_powm() loop)
Merging drm/drm-next (c209101fc1c9 Merge tag 'drm-misc-fixes-2017-11-20' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-amd-dc/drm-next-amd-dc-staging (49e37ba07a3a Merge branch 'drm-next-4.15-dc' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (3572f04c69ed drm/i915: Fix init_clock_gating for resume)
Merging drm-tegra/drm/tegra/for-next (e1335e2f0cfc drm/tegra: sor: Reimplement pad clock)
Merging drm-misc/for-linux-next (c209101fc1c9 Merge tag 'drm-misc-fixes-2017-11-20' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-msm/msm-next (ad9d50c79043 drm/msm: free kstrdup'd cmdline)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (d66611856832 drm/imx: advertise supported plane format modifiers)
Merging etnaviv/etnaviv/next (ec4abe26f8e3 drm/etnaviv: Improve unlocking of a mutex in etnaviv_iommu_map_gem())
$ git reset --hard HEAD^
Merging next-20171127 version of etnaviv
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (a15fdc340db1 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/hwspinlock' into regmap-next)
Merging sound/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging sound-asoc/for-next (5c22c26402af Merge remote-tracking branch 'asoc/topic/wm8903' into asoc-next)
$ git reset --hard HEAD^
Merging next-20171128 version of sound-asoc
Merging modules/modules-next (ece1996a21ee module: Do not paper over type mismatches in module_param_call())
Merging input/next (c1b433e04ef9 Input: gamecon - mark expected switch fall-throughs)
Merging block/for-next (50da70ed9c48 Merge branch 'for-4.15/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (a453c57c2278 dm table: fix regression from improper dm_dev_internal.count refcount_t conversion)
Merging mmc/next (ab5517f24417 Merge branch 'fixes' into next)
Merging md/for-next (0868b99c214a md: free unused memory after bitmap resize)
Merging mfd/for-mfd-next (b2596d703513 dt-bindings: mfd: mc13xxx: Remove obsolete property)
Merging backlight/for-backlight-next (29fae2c1db24 backlight: ili922x: Remove redundant variable len)
Merging battery/for-next (838c8afa67f9 power: supply: cpcap-charger: fix incorrect return value check)
Merging regulator/for-next (6cd0a0a06737 Merge remote-tracking branch 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (e5729f86a298 ima: Remove redundant conditional operator)
Merging integrity/next (e87dafe70acc ima: Remove redundant conditional operator)
CONFLICT (content): Merge conflict in Documentation/ABI/testing/evm
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4f0753e708c2 security: replace FSF address with web source in license notices)
Merging tpmdd/next (f8b73d394f91 tpm: parse TPM event logs based on EFI table)
CONFLICT (content): Merge conflict in include/linux/tpm_eventlog.h
Merging watchdog/master (14807b07a7d8 watchdog: pcwd_usb: remove unneeded DRIVER_LICENSE #define)
CONFLICT (content): Merge conflict in drivers/watchdog/mpc8xxx_wdt.c
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d04222983379 Merge branches 'iommu/arm/smmu', 'iommu/updates', 'vfio/fixes', 'vfio/platform', 'iommu/vt-d', 'iommu/ipmmu-vmsa' and 'iommu/iova' into next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (54192011468d of: overlay: Remove else after goto)
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (c9f66367b722 Merge remote-tracking branches 'spi/topic/fsl-dspi', 'spi/topic/imx', 'spi/topic/meson' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (0df8a88e651b Merge branch 'WIP.x86/mm')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (86a18ee21e5e EDAC, ti: Add support for TI keystone and DRA7xx EDAC)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a96a5037ed0f tracing, thermal: Hide cpu cooling trace events when not in use)
Merging rcu/rcu/next (d7e182c9c324 rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data())
Merging kvm/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging kvm-arm/next (95b110ab9a09 KVM: arm/arm64: Don't queue VLPIs on INV/INVALL)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (da9a1446d248 KVM: s390: provide a capability for AIS state migration)
Merging xen-tip/linux-next (646d944c2ef5 xen/pvcalls: fix potential endless loop in pvcalls-front.c)
Merging percpu/for-next (abee210500ed percpu: hack to let the CRIS architecture to boot until they clean up)
Merging workqueues/for-next (c98a98050964 workqueue: respect isolated cpus when queueing an unbound work)
Merging drivers-x86/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (8635d6b3afe6 dt-bindings: hsi: add omap4 hsi controller bindings)
Merging leds/for-next (6650fea34004 leds: pwm: Remove unneeded header file)
Merging ipmi/for-next (942e1563654c ipmi: Stop timers before cleaning up the module)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_si_intf.c
Merging driver-core/driver-core-next (4fbd8d194f06 Linux 4.15-rc1)
Merging usb/usb-next (4fbd8d194f06 Linux 4.15-rc1)
Merging usb-gadget/next (ce2b21a4e5ce usb: dwc2: Fix UDC state tracking)
Merging usb-serial/usb-next (d8a42b1ff8a3 USB: serial: ark3116: clean up return values of register accessors)
Merging usb-chipidea-next/ci-for-usb-next (2a53e060a053 usb: chipidea: fix trivial typo in Kconfig)
Merging phy-next/next (4fbd8d194f06 Linux 4.15-rc1)
Merging tty/tty-next (4fbd8d194f06 Linux 4.15-rc1)
Merging char-misc/char-misc-next (9a450484089d lp: support 64-bit time_t user space)
Merging extcon/extcon-next (4f65b63ecc4c extcon: axp288:: Handle return value of platform_get_irq)
Merging staging/staging-next (fb17be96eed8 staging: fsl-mc-bus: fix build warning)
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (4fbd8d194f06 Linux 4.15-rc1)
Merging cgroup/for-next (52cf373c37a6 cgroup: properly init u64_stats)
Merging scsi/for-next (c2e8fbf908af scsi: libsas: align sata_device's rps_resp on a cacheline)
Merging scsi-mkp/for-next (c2e8fbf908af scsi: libsas: align sata_device's rps_resp on a cacheline)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (20f9ceed72f1 pata_pdc2027x : make pdc2027x_*_timing structures const)
Merging vhost/linux-next (b33b3cef4f3c vhost/scsi: Improve a size determination in four functions)
Merging rpmsg/for-next (c4ec2b7731d8 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (24f0966c3e3f gpio: tegra186: Remove tegra186_gpio_lock_class)
Merging pinctrl/for-next (eeb690bceb1e pinctrl: gemini: Fix missing pad descriptions)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (f83e2ae2606b pwm: stm32-lp: Remove pwm_is_enabled() check before calling pwm_disable())
Merging userns/for-next (3fda0e737e90 userns: Simplify insert_extent)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (c3e0d179bff5 selftests: firmware: skip unsupported custom firmware fallback tests)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (3602b15a20a6 Merge branch 'for-4.15/callbacks' into for-next)
Merging coresight/next (26fabc4585ae coresight: Deduplicate bus_find_device() by name matching)
Merging rtc/rtc-next (87c9fd818253 dt-bindings: rtc: imxdi: Improve the bindings text)
Merging nvdimm/libnvdimm-for-next (4247f24c2358 Merge branch 'for-4.15/dax' into libnvdimm-for-next)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging ntb/ntb-next (49400481bbab NTB: switchtec_ntb: Add new line on appropriate printks)
Merging kspp/for-next/kspp (3889a28c449c lkdtm: Update usercopy tests for whitelisting)
CONFLICT (content): Merge conflict in virt/kvm/kvm_main.c
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in mm/slab.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/slab.h
Merging akpm-current/current (46400aa39482 pids: introduce find_get_task_by_vpid() helper)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: vfs: remove might_sleep() from clear_inode()
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (e5f833628524 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
