From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 4
Date: Thu, 4 Jan 2018 16:06:04 +1100
Message-ID: <20180104160604.2245e0bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20180103:

Non-merge commits (relative to Linus' tree): 6793
 7290 files changed, 280741 insertions(+), 199625 deletions(-)

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
Merging origin/master (d6bbd51587ec Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (cfe17c9bbe6a kbuild: move cc-option and cc-disable-warning after incl. arch Makefile)
Merging arc-current/for-curr (af1be2e21203 ARC: handle gcc generated __builtin_trap for older compiler)
Merging arm-current/fixes (36b0cb84ee85 ARM: 8731/1: Fix csum_partial_copy_from_user() stack mismatch)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (ecb101aed861 powerpc/mm: Fix SEGV on mapped region to return SEGV_ACCERR)
Merging sparc/master (59585b4be9ae sparc64: repair calling incorrect hweight function from stubs)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (820d1d5eba5e Merge branch '40GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue)
Merging bpf/master (2758b3e3e630 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging ipsec/master (2f10a61cee8f xfrm: fix rcu usage in xfrm_get_type_offload)
Merging netfilter/master (8bea728dce89 netfilter: nf_tables: fix potential NULL-ptr deref in nf_tables_dump_obj_done())
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a41886f56b7b Merge tag 'iwlwifi-for-kalle-2017-12-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (04a7279ff12f cfg80211: ship certificates as hex files)
Merging sound-current/for-linus (fe08f34d066f ALSA: pcm: Remove incorrect snd_BUG_ON() usages)
Merging pci-current/for-linus (1291a0d5049d Linux 4.15-rc4)
Merging driver-core.current/driver-core-linus (30a7acd57389 Linux 4.15-rc6)
Merging tty.current/tty-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb.current/usb-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb-gadget-fixes/fixes (1291a0d5049d Linux 4.15-rc4)
Merging usb-serial-fixes/usb-linus (4307413256ac USB: serial: cp210x: add IDs for LifeScan OneTouch Verio IQ)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: msm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (30a7acd57389 Linux 4.15-rc6)
Merging char-misc.current/char-misc-linus (30a7acd57389 Linux 4.15-rc6)
Merging input-current/for-linus (8b7e9d9e2d8b Input: hideep - fix compile error due to missing include file)
Merging crypto-current/master (2973633e9f09 crypto: inside-secure - do not use areq->result for partial results)
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
Merging kvms390-fixes/master (c2cf265d8608 KVM: s390: prevent buffer overrun on memory hotplug during migration)
Merging drm-intel-fixes/for-linux-next-fixes (af2e01da344e docs: fix, intel_guc_loader.c has been moved to intel_guc_fw.c)
Merging drm-misc-fixes/for-linux-next-fixes (e7cdf5c82f17 drm/syncobj: Stop reusing the same struct file for all syncobj -> fd)
Merging kbuild/for-next (7af1bec88c3c Merge branches 'misc' and 'kconfig' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (4dc807457260 Merge branches 'misc', 'sa1111' and 'sa1100-for-next' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (0e1d437585db Merge branches 'fixes', 'next/dt' and 'next/drivers' into for-next)
Merging actions/for-next (61862a89e6ac Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (ea8e5bfcab7d Merge branch 'v4.16/dt64' into tmp/aml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/aspeed-g4.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/Makefile
Merging at91/at91-next (313e34f3c183 Merge branch 'at91-dt' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-next into for-next)
Merging imx-mxs/for-next (73a604e17d72 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a29b8b93e158 Merge branch 'for_4.16/keystone-config' into next)
Merging mvebu/for-next (73f9380499d5 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (60ccd41e6ce4 Merge branch 'omap-for-v4.16/dt' into for-next)
Merging reset/reset/next (70d2f16a6289 reset: meson: enable level reset support on Meson8b)
Merging qcom/for-next (43ec8856dac1 Merge tag 'qcom-drivers-for-4.16' into tagged-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (9c7ff8b75e8e Merge branch 'soc-for-v4.16' into next)
Merging rockchip/for-next (273cddbe1912 Merge branch 'v4.16-armsoc/dts64' into for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (b6e849521384 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (1cd29219f4f2 Merge branch 'sunxi/clk-for-4.16' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into for-next)
Merging arm64/for-next/core (f5ed22e2647c arm64: make label allocation style consistent in tishift)
Merging clk/clk-next (40d55e8bf720 Merge branch 'clk-meson' into clk-next)
Merging clk-samsung/for-next (bebc6082da0a Linux 4.14)
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
Merging parisc-hd/for-next (88776c0e70be parisc: Fix alignment of pa_tlb_lock in assembly on 32-bit SMP kernel)
Merging powerpc/next (f36dbfe1a504 selftests/powerpc: Fix build errors in powerpc ptrace selftests)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging risc-v/for-linux-next (861013e85595 automerging branch "github.com-riscv/next-tlb" into "for-linux-next")
Merging s390/features (7bceec4e58ee s390/vdso: revise CFI annotations of vDSO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by_fd())
Merging xtensa/xtensa-for-next (c3d1b34b772f Merge branch 'xtensa-fixes' into xtensa-for-next)
CONFLICT (content): Merge conflict in Documentation/features/debug/KASAN/arch-support.txt
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding standard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs when under IO limits)
Merging btrfs-kdave/for-next (2a28fa9c2818 Merge branch 'for-next-next-v4.15-20180103' into for-next-20180103)
Merging ceph/master (040d786032bf ceph: drop negative child dentries before try pruning inode's alias)
Merging cifs/for-next (5954308b36a5 CIFS: SMBD: Disable signing on SMB direct transport)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (d5bd821350e6 udf: Sanitize nanoseconds for time stamps)
Merging ext4/dev (9d5afec6b8bd ext4: fix crash when a directory's i_size is too small)
Merging f2fs/dev (b1ca321d1cd8 f2fs: skip stop_checkpoint for user data writes)
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (30a7acd57389 Linux 4.15-rc6)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing over more CPUs)
CONFLICT (content): Merge conflict in net/sunrpc/xprt.c
Merging nfsd/nfsd-next (a14fbdff76ba lockd: convert nlm_rqst.a_count from atomic_t to refcount_t)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (da2e6b7eeda8 ovl: fix overlay: warning prefix)
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (b4d8ad7fd3a1 xfs: fix s_maxbytes overflow problems)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (416d20e8c311 Merge branches 'work.get_user_pages_fast', 'work.wmci', 'work.sock_recvmsg', 'misc.netdrv', 'misc.poll', 'work.mqueue', 'work.whack-a-mole' and 'work.misc' into for-next)
CONFLICT (content): Merge conflict in net/netfilter/xt_bpf.c
CONFLICT (content): Merge conflict in ipc/mqueue.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/via/via-rhine.c
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging iversion/iversion-next (8618bff77675 fs: handle inode->i_version more efficiently)
Merging printk/for-next (926adbad7320 Merge commit 'da6af54dc0014d733ce014a196e4c84ee43cabec' into for-4.16-deprecate-printk-pf)
Merging pci/next (792509b01eef Merge remote-tracking branch 'lorenzo/pci/xgene' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hardirq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanup/pixart' into for-next)
Merging i2c/i2c/for-next (f86d08e95992 Merge branch 'i2c/for-4.16' into i2c/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (9c593a8eac88 hwmon: (aspeed-pwm-tacho) Deassert reset in probe)
Merging jc_docs/docs-next (85afe608f5f3 scripts: kernel_doc: better handle show warnings logic)
CONFLICT (content): Merge conflict in Documentation/core-api/printk-formats.rst
Merging v4l-dvb/master (6f0e5fd39143 media: vb2: add a new warning about pending buffers)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dmxdev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Applying: media: videobuf2: fix up for "media: annotate ->poll() instances"
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto description at the docs)
Merging fbdev/fbdev-for-next (defddeff6104 video: smscufx: Improve a size determination in two functions)
Merging pm/linux-next (71c38544ea44 Merge branch 'pm-core' into linux-next)
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (e856f078bcf1 OPP: Introduce "required-opp" property)
Merging thermal/next (b8a86f1d99ef Merge branches 'thermal-core' and 'thermal-intel' into next)
Merging thermal-soc/next (d0ecbbbe518e thermal/drivers/hisi: Remove bogus const from function return type)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (4b24dd802280 Merge branch 'nfp-flower-repr-link-state')
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
Merging bpf-next/master (5620e1a8e2e6 Merge branch 'bpf-offload-report-dev')
Merging ipsec-next/master (1a4bb1d14f7c xfrm: update the stats documentation)
Merging netfilter-next/master (e0ca2b8c1e3c netfilter: add nf_queue_entry forward declaration)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_h323_asn1.c
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (f39a5c01c3d2 Merge branch 'nfp-flower-add-Geneve-tunnel-support')
Merging bluetooth/master (43fd0374f912 Bluetooth: hciuart: add nvmem dependency)
Merging mac80211-next/master (983dafaab799 cfg80211: Scan results to also report the per chain signal strength)
Merging rdma/for-next (0e37dd7332c9 Automatic merge of 'heads/k.o/for-next' and 'heads/k.o/for-rc' from rdma.git)
Merging gfs2/for-next (1f23bc7869ff gfs2: Trim the ordered write list in gfs2_ordered_write())
Merging mtd/master (d82c36821684 mtd: Fix mtd_check_oob_ops())
Merging l2-mtd/mtd/next (2e7c7f66b2b4 MAINTAINERS: Move all MTD related branches to a single repo)
Merging nand/nand/next (24f648c2ba5d mtd: onenand: samsung: Remove a useless include)
Merging spi-nor/spi-nor/next (17407ec3354d mtd: spi-nor: Add ISSI is25lp080d support)
Merging crypto/master (1ecdd37e308c crypto: aesni - Fix out-of-bounds access of the AAD buffer in generic-gcm-aesni)
Merging drm/drm-next (350877626fab Merge tag 'drm-intel-next-2017-12-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ddi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_syncobj.c
Applying: drm/amd/display: fix mismerge of identical patches
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (c68ce69910e3 drm/i915: Assert we do not try to wait on an invalid seqno)
Merging drm-tegra/drm/tegra/for-next (ebae8d07435a drm/tegra: dc: Implement legacy blending)
Merging drm-misc/for-linux-next (5b8ea816e8e0 drm/tinydrm: add driver for ST7735R panels)
Merging drm-msm/msm-next (9dcfbc182f1a drm/msm: Fix NULL deref in adreno_load_gpu)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances of drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable planes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with COMPILE_TEST)
Merging etnaviv/etnaviv/next (2f20fc4fc9db drm/etnaviv: use memset32 to init pagetable)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (25fd006b5fd3 Merge remote-tracking branches 'regmap/topic/const', 'regmap/topic/hwspinlock' and 'regmap/topic/nolock' into regmap-next)
Merging sound/for-next (7a0a87160a1d ALSA: pcm: Set config update bits only when really changed)
Merging sound-asoc/for-next (72ee0c6c7c1b Merge remote-tracking branches 'asoc/topic/wm8994', 'asoc/topic/wm8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (1291a0d5049d Linux 4.15-rc4)
Merging input/next (b8af0b5b9287 Input: tps65218-pwrbutton - fix a spelling mistake in Kconfig)
Merging block/for-next (cbf1885c810a Merge branch 'for-4.16/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (fc2bcd14a35f dm mpath: skip calls to end_io_bio if using NVMe bio-based and round-robin)
Merging mmc/next (d63da8c64bbf mmc: tmio: use io* accessors consistently)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asynchronous tests)
Merging md/for-next (92e6245deab8 md/r5cache: print more info of log recovery)
Merging mfd/for-mfd-next (88a9b9a80177 mfd: ab8500: Introduce DEFINE_SHOW_ATTRIBUTE() macro)
Merging backlight/for-backlight-next (12a9d3bb6a25 backlight: apple_bl: Deprecate pci_get_bus_and_slot())
Merging battery/for-next (70a39e107501 Add support for bq27521 battery monitor)
Merging regulator/for-next (b861833f85a0 Merge remote-tracking branches 'regulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (457e594528bf Merge branch 'next-general' into next-testing)
Merging integrity/next-integrity (a2a2c3c8580a ima: Use i_version only when filesystem supports it)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition processing if the policy isn't loaded)
Merging tpmdd/next (41ab58486a87 tpm: remove unused variables)
Merging watchdog/master (38a1222ae4f3 watchdog: core: make sure the watchdog worker always works)
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (5887a2b2d6cc Merge branches 'v4.16-iommu/amd', 'v4.16-iommu/ipmmu-vmsa', 'v4.16-iommu/misc', 'v4.16-iommu/vt-d' and 'v4.16/vfio' into v4.16/next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (62ce85a85e27 dt-bindings: imx6q-pcie: Add required property for i.MX6SX)
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (85e0ee086f53 Merge remote-tracking branch 'spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (8f9a5d637243 Merge branch 'x86/pti')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (86a18ee21e5e EDAC, ti: Add support for TI keystone and DRA7xx EDAC)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4397f04575c4 tracing: Fix possible double free on failure of allocating trace buffer)
Merging rcu/rcu/next (2781e186b35e rcutorture: Add basic ARM64 support to run scripts)
Merging kvm/linux-next (ccff53fd86ee KVM: x86: avoid unnecessary XSETBV on guest entry)
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sregs()
Merging kvm-arm/next (e5a2cfb492d5 KVM: arm/arm64: Delete outdated forwarded irq documentation)
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (6762ec307d25 kvm_config: add CONFIG_S390_GUEST)
Merging xen-tip/linux-next (4aac2caff30f xen/pvcalls: use GFP_ATOMIC under spin lock)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized can be boolean)
Merging workqueues/for-next (01dfee9582d9 workqueue: remove unneeded kallsyms include)
Merging drivers-x86/for-next (1b46f17d687a platform/x86: Add driver for GPD pocket custom fan controller)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead of timespec)
Merging leds/for-next (cf145758fb52 leds: lp8860: Various fixes to align with LED framework)
Merging ipmi/for-next (174134ac7602 ipmi_si: Fix error handling of platform device)
Merging driver-core/driver-core-next (8c9076b07c99 Merge 4.15-rc6 into driver-core-next)
Merging usb/usb-next (01f1918833e4 Merge 4.15.0-rc6 into usb-next)
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel)
Merging usb-serial/usb-next (c7b8f77872c7 USB: serial: io_edgeport: fix possible sleep-in-atomic)
Merging usb-chipidea-next/ci-for-usb-next (061e20e9899e usb: chipidea: tegra: Use aligned DMA on Tegra30)
Merging phy-next/next (e4b227c1ca70 phy: phy-mtk-tphy: use of_device_get_match_data())
Merging tty/tty-next (69c444ba93b7 Merge 4.15-rc6 into tty-next)
Merging char-misc/char-misc-next (b6a09416e83f Merge 4.15-rc6 into char-misc-next)
Merging extcon/extcon-next (ca90a64dc671 extcon: axp288: Handle reserved charger-type values better)
Merging staging/staging-next (87ad3722bfef Merge 4.15-rc6 into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux source files)
Merging slave-dma/next (9254c1f60476 Merge branch 'topic/imx' into next)
Merging cgroup/for-next (0438eb4190c0 Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (03e3b9f7130a Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (b996ce39960e scsi: lpfc: correct sg_seg_cnt attribute min vs default)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (b9594b3cbe5b Merge branch 'for-4.16' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (0d87c130f812 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (686e17c4ac0e Merge branch 'devel' into for-next)
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
Merging nvdimm/libnvdimm-for-next (24e3a7fb60a9 libnvdimm, btt: Fix an incompatibility in the log layout)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging at24/at24/for-next (0f30aca72c3b eeprom: at24: extend the list of chips supported in DT)
Merging ntb/ntb-next (c47963de5204 ntb_hw_switchtec: Force down the link before initializing)
Merging kspp/for-next/kspp (f6ff65a31f8b lkdtm: Update usercopy tests for whitelisting)
Merging init_task/init_task (3a0b110aa454 Expand INIT_STRUCT_PID and remove)
Merging akpm-current/current (29da970f781e lustre: don't set f_version in ll_readdir)
CONFLICT (content): Merge conflict in kernel/fork.c
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
Applying: arch/x86/platform/intel-mid/device_libs/platform_bt.c: fix const confusion
Applying: kasan: rework Kconfig settings
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (c7eba70e5db0 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
