From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 6
Date: Wed, 6 Dec 2017 15:19:23 +1100
Message-ID: <20171206151923.4243de60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20171205:

Removed trees: tile (orphaned)
	drm-amd-dc (finished with)

The printk tree gained a build failure for which I reverted a commit.

The drm-misc tree gained a build failure due to an interaction with the
drm-intel tree, so I applied a merge fix up patch.

Non-merge commits (relative to Linus' tree): 2719
 3246 files changed, 78978 insertions(+), 39889 deletions(-)

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

I am currently merging 250 trees (counting Linus' and 40 trees of bug
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
Merging origin/master (13231caccedf Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (4fbd8d194f06 Linux 4.15-rc1)
Merging arc-current/for-curr (329b4130bc5e ARC: Fix detection of dual-issue enabled)
Merging arm-current/fixes (3aaf33bebda8 ARM: avoid faulting on qemu)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (7e4d4233260b powerpc: Do not assign thread.tidr if already assigned)
Merging sparc/master (a0908a1b7d68 Merge branch 'akpm' (patches from Andrew))
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (c9d3fe9da094 VSOCK: fix outdated sk_state value in hvs_release())
Merging bpf/master (2391f0b4808e Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging ipsec/master (4ce3dbe397d7 xfrm: Fix xfrm_input() to verify state is valid when (encap_type < 0))
Merging netfilter/master (8b1836c4b643 netfilter: conntrack: clamp timeouts to INT_MAX)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (5c3de777bdaf brcmfmac: change driver unbind order of the sdio function devices)
Merging mac80211/master (72e2c3438ba3 mac80211: tear down RX aggregations first)
Merging sound-current/for-linus (362bca57f5d7 ALSA: pcm: prevent UAF in snd_pcm_info)
Merging pci-current/for-linus (4fbd8d194f06 Linux 4.15-rc1)
Merging driver-core.current/driver-core-linus (0946b2fb38fd firmware: cleanup FIRMWARE_IN_KERNEL message)
Merging tty.current/tty-linus (c8ec2041f549 MIPS: Add custom serial.h with BASE_BAUD override for generic kernel)
Merging usb.current/usb-linus (80e457699a8d usb: xhci: fix panic in xhci_free_virt_devices_depth_first)
Merging usb-gadget-fixes/fixes (a3acc696085e usb: f_fs: Force Reserved1=1 in OS_DESC_EXT_COMPAT)
Merging usb-serial-fixes/usb-linus (762ff4678e89 USB: serial: usb_debug: add new USB device id)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (4fbd8d194f06 Linux 4.15-rc1)
Merging staging.current/staging-linus (e168e9845d95 Merge tag 'iio-fixes-for-4.15a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (66bc5df31110 MAINTAINERS: update Android driver maintainers.)
Merging input-current/for-linus (4c83c071b784 Input: elants_i2c - do not clobber interrupt trigger on x86)
Merging crypto-current/master (ecaaab564978 crypto: salsa20 - fix blkcipher_walk API usage)
Merging ide/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging vfio-fixes/for-linus (e41dd1556d4d Merge branch 'iommu-fixes/vt-d' into for-linus)
Merging kselftest-fixes/fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging backlight-fixes/for-backlight-fixes (8ff5cbc6e3c5 backlight: as3711_bl: fix device-tree node leaks)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging mfd-fixes/for-mfd-fixes (001dde9400d5 mfd: cros ec: spi: Fix "in progress" error signaling)
Merging v4l-dvb-fixes/fixes (781b045baefd media: imx274: Fix error handling, add MAINTAINERS entry)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (b084116f8587 MIPS: AR7: Ensure that serial ports are properly set up)
Merging kvm-fixes/master (609b7002705a Merge tag 'kvm-arm-fixes-for-v4.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm)
Merging drm-intel-fixes/for-linux-next-fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging kbuild/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (383f07dc0a84 Merge branches 'fixes', 'misc' and 'sa1111' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (ee4c54d09127 Merge branch 'fixes' into for-next)
Merging actions/for-next (a15f031b7361 Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (9f8e06ca1d0e ARM64: dts: odroid-c2: Add HDMI and CEC Nodes)
Merging aspeed/for-next (9c9ae757dc8b Merge branch 'dt-for-v4.15' into for-next)
Merging at91/at91-next (bee152d6af7d Merge branch 'at91-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging imx-mxs/for-next (3d48b83d1ab5 Merge branch 'imx/dt64' into for-next)
Merging keystone/next (1064f63204a0 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (c6c5ff72be36 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (aa40a77609db Merge branch 'omap-for-v4.15/fixes-v2' into for-next)
Merging reset/reset/next (0e5721f76252 reset: meson-axg: add compatible string for Meson-AXG SoC)
Merging qcom/for-next (e7048ed58ed9 Merge tag 'qcom-drivers-for-4.15-2' into final-for-4.15)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (2dd944f637d5 Merge branches 'arm64-dt-for-v4.16', 'dt-bindings-for-v4.16' and 'dt-for-v4.16' into next)
Merging rockchip/for-next (d683087d6944 Merge branch 'v4.15-armsoc/fixes64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (a77db8a22596 Merge branch 'next/defconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging sunxi/sunxi/for-next (81ea246a6edf Merge branches 'sunxi/fixes-for-4.15' and 'sunxi/dt-for-4.16' into sunxi/for-next)
Merging tegra/for-next (ec0c973f47c7 Merge branch for-4.15/reset into for-next)
Merging arm64/for-next/core (6cfa7cc46b1a arm64: Make ARMV8_DEPRECATED depend on SYSCTL)
Merging clk/clk-next (4fbd8d194f06 Linux 4.15-rc1)
Merging clk-samsung/for-next (bebc6082da0a Linux 4.14)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (4cc9ce65974b m68k/defconfig: fix stmark2 broken local compilation)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (da25f490a0b3 microblaze: add missing include to mmu_context_mm.h)
Merging mips/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (610f01b9a88a openrisc: fix possible deadlock scenario during timer sync)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (ae64f9bd1d36 Linux 4.15-rc2)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (f0b0655e9936 Merge tag 'v4.14-rc8' into for-linux-next)
Merging s390/features (4c48b1da1d91 s390/vdso: revise CFI annotations of vDSO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (88e3f65c2c20 fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (03c80fe23cf7 Merge branch 'for-next-next-v4.15-20171205' into for-next-20171205)
Merging ceph/master (febe4f631532 ceph: decrease session->s_trim_caps only after caps get trimmed)
Merging cifs/for-next (d13ecaa98be7 cifs: avoid a kmalloc in smb2_send_recv/SendReceive2 for the common case)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (88bc0ede8d35 quota: Check for register_shrinker() failure.)
Merging ext4/dev (e243560f12d7 ext4: fix fdatasync(2) after fallocate(2) operation)
Merging f2fs/dev (4fbd8d194f06 Linux 4.15-rc1)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (13231caccedf Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging nfs-anna/linux-next (eb5b46faa693 SUNRPC: Handle ENETDOWN errors)
Merging nfsd/nfsd-next (a14fbdff76ba lockd: convert nlm_rqst.a_count from atomic_t to refcount_t)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (d9768076068f ovl: remove unneeded arg from ovl_verify_origin())
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (373b0589dc8d xfs: Properly retry failed dquot items in case of error during buffer writeback)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (80628e018d43 Merge branches 'work.get_user_pages_fast', 'for-davem', 'work.wmci', 'work.sock_recvmsg', 'misc.netdrv', 'work.mkobj', 'misc.poll', 'work.whack-a-mole' and 'work.misc' into for-next)
CONFLICT (content): Merge conflict in drivers/net/ethernet/via/via-rhine.c
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (3f892e63a947 Merge commit 'da6af54dc0014d733ce014a196e4c84ee43cabec' into for-4.16-deprecate-printk-pf)
Merging pci/next (b78742a02873 Merge branch 'pci/virtualization' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (100a65b3d07d Merge branch 'for-4.16/hid-quirks-cleanup/multitouch' into for-next)
Merging i2c/i2c/for-next (c86d671f7d85 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (ccdb35594d7b hwmon: (w83773g) Fix fault detection and reporting)
Merging jc_docs/docs-next (9956cfef3409 Documentation: fix docs build error after source file removed)
Merging v4l-dvb/master (781b045baefd media: imx274: Fix error handling, add MAINTAINERS entry)
Merging v4l-dvb-next/master (db6321a1af84 media: platform: VIDEO_QCOM_CAMSS should depend on HAS_DMA)
Merging fbdev/fbdev-for-next (5f215d252496 OMAPFB: prevent buffer underflow in omapfb_parse_vram_param())
Merging pm/linux-next (96fe03c9f78f Merge branch 'acpi-apei' into linux-next)
Merging cpupower/cpupower (ae64f9bd1d36 Linux 4.15-rc2)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging thermal/next (1e032393d968 Merge branches 'thermal-core', 'thermal-tool', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (fd6d2e506ce6 Merge tag 'docs-4.15-fixes' of git://git.lwn.net/linux)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (9a63b255dffd net_sched: remove unused parameter from act cleanup ops)
Merging bpf-next/master (f19397a5c656 bpf: Add access to snd_cwnd and others in sock_ops)
Merging ipsec-next/master (9b7e14dba0c0 xfrm: Remove redundant state assignment in xfrm_input())
Merging netfilter-next/master (c5c44aa5791e netfilter: conntrack: timeouts can be const)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (80b0ebd488b3 Merge tag 'iwlwifi-next-for-kalle-2017-11-29' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (da0898db1e7c Bluetooth: hci_ll: add constant for vendor-specific command)
Merging mac80211-next/master (5048a9c329af mac80211: make __ieee80211_start_rx_ba_session static)
CONFLICT (content): Merge conflict in net/mac80211/agg-tx.c
CONFLICT (content): Merge conflict in net/mac80211/agg-rx.c
Merging rdma/for-next (315d160c5a4e IB/core: Only enforce security for InfiniBand)
Merging gfs2/for-next (9aa015932727 gfs2: Remove unused gfs2_write_jdata_pagevec parameter)
Merging mtd/master (36de80740008 mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user)
Merging l2-mtd/master (1530578abdac mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid)
Merging nand/nand/next (41abeee8dd1e mtd: nand: provide valid ->data_interface during NAND detection)
Merging spi-nor/spi-nor/next (b3fbf5e23f8c mtd: spi-nor: Check that BP bits are set properly)
Merging crypto/master (45223b78118c crypto: arm64/aes - do not call crypto_unregister_skcipher twice on error)
Merging drm/drm-next (c5dd52f653fa Merge branch 'drm/next/du' of git://linuxtv.org/pinchartl/media into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (2abf3c0da996 drm/i915: add platform tag to WA)
Merging drm-tegra/drm/tegra/for-next (e1335e2f0cfc drm/tegra: sor: Reimplement pad clock)
Merging drm-misc/for-linux-next (3b71239181e5 drm/fsl-dcu: Use drm_mode_config_helper_suspend/resume())
Applying: drm/i915: fix up for "drm/i915: s/enum plane/enum i9xx_plane_id/"
Merging drm-msm/msm-next (ad9d50c79043 drm/msm: free kstrdup'd cmdline)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (d66611856832 drm/imx: advertise supported plane format modifiers)
Merging etnaviv/etnaviv/next (49b82c389d2a drm/etnaviv: make THERMAL selectable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (5a9a24faae43 Merge remote-tracking branch 'regmap/topic/hwspinlock' into regmap-next)
Merging sound/for-next (108884e6c5aa ALSA: usb-audio: Change the semantics of the enable option)
Merging sound-asoc/for-next (9bb96c3a6c96 Merge remote-tracking branches 'asoc/topic/wm8903', 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (ece1996a21ee module: Do not paper over type mismatches in module_param_call())
Merging input/next (c1b433e04ef9 Input: gamecon - mark expected switch fall-throughs)
Merging block/for-next (50da70ed9c48 Merge branch 'for-4.15/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (a49796788d08 dm: safely allocate multiple bioset bios)
Merging mmc/next (40d72bbbc868 mmc: sdhci-of-esdhc: fix the mmc error after sleep on ls1046ardb)
Merging md/for-next (3f5b7d277da9 md/raid1,raid10: silence warning about wait-within-wait)
Merging mfd/for-mfd-next (b534651d7a50 mfd: pm8xxx: Make elegible for COMPILE_TEST)
Applying: misc: rtsx: fix symbol clashes
Merging backlight/for-backlight-next (29fae2c1db24 backlight: ili922x: Remove redundant variable len)
Merging battery/for-next (d16002755dc8 power: supply: bq24190_charger: Remove extcon handling)
Merging regulator/for-next (40d5e58782e6 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (4c6082336a74 Merge tag 'seccomp-next' of https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into next-testing)
Merging integrity/next (e87dafe70acc ima: Remove redundant conditional operator)
CONFLICT (content): Merge conflict in Documentation/ABI/testing/evm
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (ef28df55ac27 selinux: ensure the context is NUL terminated in security_context_to_sid_core())
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
Merging spi/for-next (5ca0175131d4 Merge remote-tracking branches 'spi/topic/fsl-dspi', 'spi/topic/imx', 'spi/topic/meson', 'spi/topic/sh-msiof' and 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (0df8a88e651b Merge branch 'WIP.x86/mm')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (86a18ee21e5e EDAC, ti: Add support for TI keystone and DRA7xx EDAC)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a96a5037ed0f tracing, thermal: Hide cpu cooling trace events when not in use)
Merging rcu/rcu/next (f8549f993007 EXP: rcu: Add ->boost_tasks to assertion)
Merging kvm/linux-next (4fbd8d194f06 Linux 4.15-rc1)
Merging kvm-arm/next (4fbd8d194f06 Linux 4.15-rc1)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (da9a1446d248 KVM: s390: provide a capability for AIS state migration)
Merging xen-tip/linux-next (646d944c2ef5 xen/pvcalls: fix potential endless loop in pvcalls-front.c)
Merging percpu/for-next (abee210500ed percpu: hack to let the CRIS architecture to boot until they clean up)
Merging workqueues/for-next (62408c1ef007 workqueue/hotplug: remove the workaround in rebind_workers())
Merging drivers-x86/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (92fdb03c084e leds: blinkm: avoid uninitialized data use)
Merging ipmi/for-next (066bccbd0c72 ipmi_si: Fix oops with PCI devices)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_si_intf.c
Merging driver-core/driver-core-next (82bdf495169f test_firmware: wrap custom sysfs load tests into helper)
Merging usb/usb-next (7739376eb1ed USB: of: clean up device-node helper)
Merging usb-gadget/next (ce2b21a4e5ce usb: dwc2: Fix UDC state tracking)
Merging usb-serial/usb-next (d8a42b1ff8a3 USB: serial: ark3116: clean up return values of register accessors)
Merging usb-chipidea-next/ci-for-usb-next (2a53e060a053 usb: chipidea: fix trivial typo in Kconfig)
Merging phy-next/next (4fbd8d194f06 Linux 4.15-rc1)
Merging tty/tty-next (4fbd8d194f06 Linux 4.15-rc1)
Merging char-misc/char-misc-next (9a450484089d lp: support 64-bit time_t user space)
Merging extcon/extcon-next (4f65b63ecc4c extcon: axp288:: Handle return value of platform_get_irq)
Merging staging/staging-next (82aec3ed46fd Merge tag 'iio-for-4.16a' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/iio/adc/meson_saradc.c
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (f1b8ae7acceb Merge branch 'topic/mic' into next)
Merging cgroup/for-next (c2f31b79d510 cgroup: add warning about RT not being supported on cgroup2)
Merging scsi/for-next (5271b8a207ba Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (417dff6cc15c scsi: ibmvscsis: add DRC indices to debug statements)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (2dc0b46b5ea3 libata: sata_down_spd_limit should return if driver has not recorded sstatus speed)
Merging vhost/linux-next (d9a4645e7e7c Merge branch 'this' into vhost)
Merging rpmsg/for-next (c4ec2b7731d8 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (e3ce8c16971c Merge branch 'devel' into for-next)
Merging pinctrl/for-next (8ed259d4f687 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configuration for Meson-AXG)
Merging userns/for-next (116ceac9741e autofs4: Modify autofs_wait to use current_uid() and current_gid())
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (ae64f9bd1d36 Linux 4.15-rc2)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (a57fcf2ddba5 Merge branch 'for-4.16/signal-sysfs-force' into for-next)
Merging coresight/next (869704675319 coresight: Use PTR_ERR_OR_ZERO())
Merging rtc/rtc-next (9f33399c9074 rtc: stm32: Fix copyright)
Merging nvdimm/libnvdimm-for-next (4247f24c2358 Merge branch 'for-4.15/dax' into libnvdimm-for-next)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (1f51194db0d7 eeprom: at24: remove now unneeded smbus-related code)
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (589cde432c02 lkdtm: Update usercopy tests for whitelisting)
Applying: Revert "symbol lookup: introduce dereference_symbol_descriptor()"
Merging akpm-current/current (ba0cf5d1a44b pids: introduce find_get_task_by_vpid() helper)
CONFLICT (content): Merge conflict in scripts/checkpatch.pl
CONFLICT (content): Merge conflict in lib/vsprintf.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: vfs: remove might_sleep() from clear_inode()
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (5fefda304799 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
