From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 25
Date: Tue, 25 Oct 2016 14:31:34 +1100
Message-ID: <20161025143134.7ab67718@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752521AbcJYDbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Oct 2016 23:31:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

There will probably be no linux-next releases next week while I attend
the Kernel Summit.

Changes since 20161024:

The pm tree gained a conflict against the imx-mxs tree.

The mali-dp tree gained a conflict against the drm-misc tree.

The sunxi tree gained a build failure so I used the version from
next-20161024.

The akpm-current tree still had its build failures for which I applied
2 patches.

Non-merge commits (relative to Linus' tree): 2174
 2622 files changed, 187829 insertions(+), 38953 deletions(-)

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
(this fails its final link) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 245 trees (counting Linus' and 35 trees of patches
pending for Linus' tree).

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
Merging origin/master (07d9a380680d Linux 4.9-rc2)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (989cea5c14be kbuild: prevent lib-ksyms.o rebuilds)
Merging arc-current/for-curr (9868c77a82f7 ARC: build: retire old toggles)
Merging arm-current/fixes (6127d124ee4e ARM: wire up new pkey syscalls)
Merging m68k-current/for-linus (6736e65effc3 m68k: Migrate exception table users off module.h and onto extable.h)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (09b7e37b18ee powerpc/64: Fix race condition in setting lock bit in idle/wakeup code)
Merging sparc/master (4c1fad64eff4 Merge tag 'for-f2fs-4.9' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging net/master (44060abe1dd6 Merge branch 'for-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth)
CONFLICT (content): Merge conflict in drivers/net/ethernet/qlogic/Kconfig
Applying: qed*: merge fix for CONFIG_INFINIBAND_QEDR Kconfig move
Merging ipsec/master (7f92083eb58f vti6: flush x-netns xfrm cache when vti interface is removed)
Merging netfilter/master (7034b566a4e7 netfilter: fix nf_queue handling)
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (1ea2643961b0 ath6kl: add Dell OEM SDIO I/O for the Venue 8 Pro)
Merging mac80211/master (b4f0fd4baa90 qed: Use list_move_tail instead of list_del/list_add_tail)
Merging sound-current/for-linus (6aecd8715802 ALSA: hda - Fix headset mic detection problem for two Dell laptops)
Merging pci-current/for-linus (02a1b8f4167e PCI: designware-plat: Update author email address)
Merging driver-core.current/driver-core-linus (07d9a380680d Linux 4.9-rc2)
Merging tty.current/tty-linus (1001354ca341 Linux 4.9-rc1)
Merging usb.current/usb-linus (b76032396d79 usb: renesas_usbhs: add wait after initialization for R-Car Gen3)
Merging usb-gadget-fixes/fixes (a1aa8cf6471b Revert "Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size")
Merging usb-serial-fixes/usb-linus (07d9a380680d Linux 4.9-rc2)
Merging usb-chipidea-fixes/ci-for-usb-stable (6b7f456e67a1 usb: chipidea: host: fix NULL ptr dereference during shutdown)
Merging phy/fixes (1001354ca341 Linux 4.9-rc1)
Merging staging.current/staging-linus (e866dd8aab76 greybus: fix a leak on error in gb_module_create())
Merging char-misc.current/char-misc-linus (43605e293eb1 mei: txe: don't clean an unprocessed interrupt cause.)
Merging input-current/for-linus (da25311c7ca8 Input: i8042 - add XMG C504 to keyboard reset table)
Merging crypto-current/master (6d4952d9d9d4 hwrng: core - Don't use a stack buffer in add_early_randomness())
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (07d9a380680d Linux 4.9-rc2)
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (9868c77a82f7 ARC: build: retire old toggles)
Merging arm/for-next (509d3b3effe2 Merge branches 'fixes', 'misc', 'sa1100-base' and 'syscalls' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (83cb44244ff6 Merge branch 'fixes' into for-next)
Merging pinctrl/for-next (98632f9da1c6 Merge branch 'devel' into for-next)
Merging amlogic/for-next (5a0803bd5ae2 ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (1443dff71db6 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (4020cd6682d6 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (81f448072d1d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (624018387bcf Merge branch 'omap-for-v4.9/dt-v2' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (216cd02cfef0 Merge branch 'soc-for-5.0' into all-for-5.0)
Merging renesas/next (9522d6ff696e Merge branch 'dt-for-v4.10' into next)
Merging rockchip/for-next (8a3339648bb5 Merge branch 'v4.10-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (19350594a556 Merge branch 'next/dt' into for-next)
Merging tegra/for-next (74e8115883f5 Merge branch for-4.9/arm64/dt into for-next)
Merging arm64/for-next/core (db68f3e7594a arm64: tlbflush.h: add __tlbi() macro)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (2dc024e94578 cris: return of class_create should be considered)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (6736e65effc3 m68k: Migrate exception table users off module.h and onto extable.h)
Merging m68knommu/for-next (baa6ae0f015b m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (1001354ca341 Linux 4.9-rc1)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (c8d2bc9bc39e Linux 4.8)
Merging powerpc/next (08bf75ba852e powerpc/mm/hash64: Fix might_have_hea() check)
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (86651b6aa355 s390/cio: clean up DEV_STATE_SENSE_PGID)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (a4c6be5ad1d0 xtensa: disable MMU initialization option on MMUv2 cores)
Merging befs/for-next (3c8a965ad630 befs: remove signatures from comments)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (54626da80217 Merge branch 'for-next-next-4.9-20161024' into for-next-20161024)
Merging ceph/master (5130ccea7cf4 ceph: fix non static symbol warning)
Merging cifs/for-next (faad81c4f581 CIFS: iterate over posix acl xattr entry correctly in ACL_to_cifs_posix())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (e952813e210b ext2: avoid bogus -Wmaybe-uninitialized warning)
Merging ext4/dev (d74f3d25289a ext4: add missing KERN_CONT to a few more debugging uses)
Merging f2fs/dev (f050cd028755 f2fs: use BIO_MAX_PAGES for bio allocation)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0ce267ff95a0 fuse: fix root dentry initialization)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (14155cafeadd btrfs: assign error values to the correct bio structs)
Merging nfsd/nfsd-next (1c505001f96a nfsd: catch errors in decode_fattr earlier)
Merging orangefs/for-next (f60fbdbf41c8 Revert "orangefs: bump minimum userspace version")
Merging overlayfs/overlayfs-next (204f6afd0743 ovl: split super.c)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (c83ed4c9dbb3 ubifs: Abort readdir upon error)
Merging xfs/for-next (b77428b12b55 xfs: defer should abort intent items if the trans roll fails)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1001354ca341 Linux 4.9-rc1)
Merging pstore/for-next/pstore (f88baf68ebe5 ramoops: move spin_lock_init after kmalloc error checking)
Merging hid/for-next (d7ff87349d20 Merge branches 'for-4.10/i2c-hid' and 'for-4.10/sony' into for-next)
Merging i2c/i2c/for-next (1001354ca341 Linux 4.9-rc1)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (c2d95c252f65 hwmon: (adm1275) Enable adm1278 VOUT sampling)
Merging jc_docs/docs-next (75a163c4a3ee vme: Convert documentation to reStructuredText, move under driver APIs)
Merging v4l-dvb/master (02a628e5c024 Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (f73a24f7e46b Merge branches 'pm-opp' and 'pm-core' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-imx/gpc.c
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (3105f234e0ab thermal/powerclamp: correct cpu support check)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (6449e31ddebd firewire: nosy: do not ignore errors in ioremap_nocache())
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (432490f9d455 net: ip, diag -- Add diag interface for raw sockets)
CONFLICT (content): Merge conflict in net/core/dev.c
CONFLICT (content): Merge conflict in include/net/udp.h
CONFLICT (content): Merge conflict in include/linux/netdevice.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (1b830996c160 Merge branch 's390-net')
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (15b95a159502 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (604907eeed85 Bluetooth: btwilink: Fix probe return value)
Merging mac80211-next/master (7a50e995ad32 cfg80211: fix beacon interval in interface combination iteration)
Merging rdma/for-next (2937f3757519 staging/lustre: Disable InfiniBand support)
Merging rdma-leon/rdma-next (1001354ca341 Linux 4.9-rc1)
Merging rdma-leon-test/testing/rdma-next (1001354ca341 Linux 4.9-rc1)
Merging mtd/master (1001354ca341 Linux 4.9-rc1)
Merging l2-mtd/master (69db4aa44fdd Merge tag '4.9/mtd-pairing-scheme' of github.com:linux-nand/linux)
Merging nand/nand/next (668592492409 mtd: nand: Add OX820 NAND Support)
Merging crypto/master (3cf799680d26 crypto: ccp - change type of struct member lsb to signed)
Merging drm/drm-next (fa860a1751e3 drm: Print device information again in debugfs)
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (0fc6a9dc94e4 drm/i915/fbc: fix FBC_COMPRESSION_MASK on BDW+)
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (c170a14e2029 drm/msm: add missing header dependencies)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
Applying: drm/i915: merge fix for INTEL_GEN API change
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (156f3a886cf0 drm/arm: mark symbols static where possible)
CONFLICT (content): Merge conflict in drivers/gpu/drm/arm/malidp_planes.c
Merging sunxi/sunxi/for-next (c1c6ff67e56b Merge branches 'sunxi/clk-fixes-for-4.9', 'sunxi/clk-for-4.10', 'sunxi/defconfig-for-4.10', 'sunxi/drm-fixes-for-4.9', 'sunxi/drm-for-4.10' and 'sunxi/dt-for-4.10' into sunxi/for-next)
$ git reset --hard HEAD^
Merging next-20161024 version of sunxi
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
CONFLICT (add/add): Merge conflict in scripts/gcc-plugins/latent_entropy_plugin.c
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (1001354ca341 Linux 4.9-rc1)
Merging sound/for-next (6aecd8715802 ALSA: hda - Fix headset mic detection problem for two Dell laptops)
Merging sound-asoc/for-next (3d8a82d53841 Merge remote-tracking branches 'asoc/topic/wm9705', 'asoc/topic/wm9712' and 'asoc/topic/wm9713' into asoc-next)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (77b425399f6d Input: i8042 - use chassis info to skip selftest on Asus laptops)
Merging block/for-next (e056af9a7854 Merge branch 'for-4.10/block' into for-next)
Merging lightnvm/for-next (1a6fe74dfd1b nvme: Pass pointers, not dma addresses, to nvme_get/set_features())
Merging device-mapper/for-next (a6e3a623e7d9 dm cache metadata: DM_CACHE_FEATURE_INCOMPAT_SEP_DIRTY_BITS)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (2a688788ba1d mmc: core: Don't use ->card_busy() and CMD13 in combination when polling)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (e980cc74735a md: don't fail an array if there are unacknowledged bad blocks)
Merging mfd/for-mfd-next (b8d336ed90f5 mfd: arizona: Handle probe deferral for reset GPIO)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (44fccac4ff17 power: supply: lp8788: remove an unneeded NULL check)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (1fcfba653094 Merge remote-tracking branches 'regulator/topic/arizona' and 'regulator/topic/tps6507x' into regulator-next)
Merging security/next (07d9a380680d Linux 4.9-rc2)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (1306d8e1c09f Merge tag 'tpmdd-next-20160927' of git://git.infradead.org/users/jjs/linux-tpmdd into ra-next)
Merging tpmdd/next (213ebc81ac3f tmp/tpm_crb: implement runtime pm for tpm_crb)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (13a08259187c Merge branches 'x86/amd', 'x86/vt-d', 'arm/exynos', 'arm/mediatek', 'arm/renesas' and 'arm/smmu' into next)
Merging dwmw2-iommu/master (2566278551d3 Merge git://git.infradead.org/intel-iommu)
Merging vfio/next (61771468e0a5 vfio_pci: use pci_alloc_irq_vectors)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (7ff89ac608d9 audit: add exclude filter extension to feature bitmap)
Merging devicetree/for-next (87e5fc99b028 DT: irqchip: renesas-irqc: document R8A7743/5 support)
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (21a27175ab00 Merge remote-tracking branch 'spi/topic/spidev' into spi-next)
Merging tip/auto-latest (acda06d80ceb Merge branch 'perf/core')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (90e493d7d51c EDAC, altera: Disable IRQs while injecting SDRAM errors)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
Merging rcu/rcu/next (367b548872c8 Documentation/RCU: Fix minor typo)
Merging kvm/linux-next (07d9a380680d Linux 4.9-rc2)
Merging kvm-arm/next (0099b7701f52 KVM: arm/arm64: vgic: Don't flush/sync without a working vgic)
Merging kvm-mips/next (d852b5f35e84 KVM: MIPS: Add missing uaccess.h include)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (a6a198bc60e6 xen/x86: Update topology map for PV VCPUs)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (304887041d95 platform/x86: Introduce support for Mellanox hotplug driver)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (d287715d4037 cleanup LED documentation and make it match reality)
Merging ipmi/for-next (bd85f4b37ddf ipmi: fix crash on reading version from proc after unregisted bmc)
Merging driver-core/driver-core-next (07d9a380680d Linux 4.9-rc2)
Merging tty/tty-next (1001354ca341 Linux 4.9-rc1)
Merging usb/usb-next (6110c425d98b usb: ohci-da8xx: Remove code that references mach)
Merging usb-gadget/next (1001354ca341 Linux 4.9-rc1)
Merging usb-serial/usb-next (a98b69002a16 USB: serial: ch341: add debug output for chip version)
Merging usb-chipidea-next/ci-for-usb-next (c6900310b6cc usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (7809cd2ce6ab phy: meson: add USB2 PHY support for Meson8b and GXBB)
Merging staging/staging-next (49b9137a6002 staging: greybus: audio: remove redundant slot field)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (modify/delete): drivers/staging/iio/accel/sca3000_core.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/iio/accel/sca3000_core.c left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
$ git rm -f drivers/staging/iio/accel/sca3000_core.c
Merging char-misc/char-misc-next (07d9a380680d Linux 4.9-rc2)
Merging extcon/extcon-next (67fafcf82c3e extcon: usb-gpio: Add VBUS detection support)
Merging slave-dma/next (3277a5ccb332 Merge branch 'topic/st_fdma' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (85d3116d8d50 Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (8a338d9d0678 Merge branch 'for-4.9-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (789ffaecf80b virtio_pci: Limit DMA mask to 44 bits for legacy virtio devices)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
CONFLICT (content): Merge conflict in drivers/remoteproc/remoteproc_core.c
Merging rpmsg/for-next (20b1f39a51dc Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0c449a77bc96 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (ce99dd5fd5f6 mm: Add a user_ns owner to mm_struct and fix ptrace_may_access)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (7ae74aaf3850 Merge branch 'clk-next-oxnas' into clk-next)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (fecf861e765b selftests/futex: Check ANSI terminal color support)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (96eb47802487 remove cpu_relax_lowlatency)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (e87d6305b858 coresight: reset "enable_sink" flag when need be)
Merging rtc/rtc-next (290cd0f07f0c rtc: cmos: don't refer to asm-generic/rtc.h)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (e476f94482fc Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (000cf9328226 kdump, vmcoreinfo: report actual value of phys_base)
Applying: powerpc: merge fix for CONFIG_WORD_SIZE -> BITS rename
Applying: powerpc: include asm/ima.h for setup_ima_buffer
Applying: powerpc: disable KEXEC_FILE for now
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (7aff762187ab drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
