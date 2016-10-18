From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Oct 18
Date: Tue, 18 Oct 2016 13:27:42 +1100
Message-ID: <20161018132742.4139f7f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38107 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755705AbcJRC1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Oct 2016 22:27:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20161017:

The drm-intel tree gained build failures so I used the version from
next-20161017.

The akpm-current tree still had its build failures for which I applied
2 patches.

Non-merge commits (relative to Linus' tree): 910
 1213 files changed, 32579 insertions(+), 17418 deletions(-)

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

I am currently merging 243 trees (counting Linus' and 34 trees of patches
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
Merging origin/master (1001354ca341 Linux 4.9-rc1)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (d3e2773c4ede builddeb: Skip gcc-plugins when not configured)
Merging arc-current/for-curr (27f3d2a3b59f ARC: [build] Support gz, lzma compressed uImage)
Merging arm-current/fixes (fb833b1fbb68 ARM: fix delays)
Merging m68k-current/for-linus (6736e65effc3 m68k: Migrate exception table users off module.h and onto extable.h)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (b79331a5eb9f powerpc/powernv/pci: Fix m64 checks for SR-IOV and window alignment)
Merging sparc/master (4c1fad64eff4 Merge tag 'for-f2fs-4.9' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging net/master (3dfcb4f56f35 Merge branch 'net-driver-autoload')
CONFLICT (content): Merge conflict in drivers/net/ethernet/qlogic/Kconfig
Applying: qed*: merge fix for CONFIG_INFINIBAND_QEDR Kconfig move
Merging ipsec/master (7f92083eb58f vti6: flush x-netns xfrm cache when vti interface is removed)
Merging netfilter/master (6d3a4c404648 strparser: Propagate correct error code in strp_recv())
Merging ipvs/master (ea43f860d984 Merge branch 'ethoc-fixes')
Merging wireless-drivers/master (1ea2643961b0 ath6kl: add Dell OEM SDIO I/O for the Venue 8 Pro)
Merging mac80211/master (f4a067f9ffca mac80211: move struct aead_req off the stack)
Merging sound-current/for-linus (fdd8218d7d1b ALSA: line6: fix a crash in line6_hwdep_write())
Merging pci-current/for-linus (15480f3ab7a8 PCI: layerscape: Fix drvdata usage before assignment)
Merging driver-core.current/driver-core-linus (1001354ca341 Linux 4.9-rc1)
Merging tty.current/tty-linus (1001354ca341 Linux 4.9-rc1)
Merging usb.current/usb-linus (a19b882c07a6 wusb: Stop using the stack for sg crypto scratch space)
Merging usb-gadget-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging usb-serial-fixes/usb-linus (ca006f785fbf USB: serial: ftdi_sio: add support for Infineon TriBoard TC2X7)
Merging usb-chipidea-fixes/ci-for-usb-stable (6b7f456e67a1 usb: chipidea: host: fix NULL ptr dereference during shutdown)
Merging staging.current/staging-linus (c89d98e224b4 staging/lustre/llite: Move unstable_stats from sysfs to debugfs)
Merging char-misc.current/char-misc-linus (1001354ca341 Linux 4.9-rc1)
Merging input-current/for-linus (1134ca268e73 Merge branch 'next' into for-linus)
Merging crypto-current/master (c3afafa47898 Merge git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (c8952a707556 vfio/pci: Fix NULL pointer oops in error interrupt setup handling)
Merging kselftest-fixes/fixes (29b4817d4018 Linux 4.8-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (5baaf3b9efe1 usb: dwc3: st: Use explicit reset_control_get_exclusive() API)
Merging drm-intel-fixes/for-linux-next-fixes (1001354ca341 Linux 4.9-rc1)
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (8df0cc75f530 ARC: [build] Support gz, lzma compressed uImage)
Merging arm/for-next (70fe0fd28524 Merge branch 'fixes' into for-next)
Merging arm-perf/for-next/perf (694d0d0bb203 Linux 4.8-rc2)
Merging arm-soc/for-next (83cb44244ff6 Merge branch 'fixes' into for-next)
Merging pinctrl/for-next (6d475e0b3980 pinctrl: baytrail: Fix lockdep)
Merging amlogic/for-next (8148ca0d95ec Merge branch 'v4.8/dt64-2' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (1443dff71db6 Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (70da51e698c7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (81f448072d1d Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (624018387bcf Merge branch 'omap-for-v4.9/dt-v2' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (4feeec0c6e6d Merge tag 'qcom-arm64-defconfig-for-4.9' into all-for-4.8)
Merging renesas/next (88b7b6785243 Merge branches 'arm64-dt-for-v4.10', 'dt-for-v4.10', 'drivers-for-v4.10', 'soc-for-v4.10' and 'defconfig-for-v4.10' into next)
Merging rockchip/for-next (e80be333a38f Merge branch 'v4.9-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (1619c96933e4 Merge branch 'next/defconfig' into for-next)
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
Merging m68knommu/for-next (00e8287f59cf m68k: add Sysam AMCORE open board support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (38b876746212 Documentation: MIPS supports HAVE_REGS_AND_STACK_ACCESS_API)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (c8d2bc9bc39e Linux 4.8)
Merging powerpc/next (08bf75ba852e powerpc/mm/hash64: Fix might_have_hea() check)
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (229e4caa6677 s390/dasd: Define often used variable)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (a4c6be5ad1d0 xtensa: disable MMU initialization option on MMUv2 cores)
Merging befs/for-next (3c8a965ad630 befs: remove signatures from comments)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (54ce19f68430 Merge branch 'for-next-next-4.9-20161012' into for-next-20161012)
Merging ceph/master (0d7718f666be ceph: fix error handling in ceph_read_iter)
Merging cifs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (6ed47823005f isofs: Do not return EACCES for unknown filesystems)
Merging ext4/dev (d74f3d25289a ext4: add missing KERN_CONT to a few more debugging uses)
Merging f2fs/dev (4c1fad64eff4 Merge tag 'for-f2fs-4.9' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (63401ccdb2ca fuse: limit xattr returned size)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (4d2899d73c47 Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging nfsd/nfsd-next (29ae7f9dc21a NFSD: Implement the COPY call)
Merging orangefs/for-next (f60fbdbf41c8 Revert "orangefs: bump minimum userspace version")
Merging overlayfs/overlayfs-next (8dd63617f3a9 ovl: use vfs_clone_file_range() for copy up if possible)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (ec037dfcc064 UBIFS: improve function-level documentation)
Merging xfs/for-next (feac470e3642 xfs: convert COW blocks to real blocks before unwritten extent conversion)
Merging file-locks/linux-next (d67fd44f697d locks: Filter /proc/locks output on proc pid ns)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1001354ca341 Linux 4.9-rc1)
Merging pstore/for-next/pstore (f88baf68ebe5 ramoops: move spin_lock_init after kmalloc error checking)
Merging hid/for-next (419c103f0833 Merge branch 'for-4.9/upstream' into for-next)
Merging i2c/i2c/for-next (1001354ca341 Linux 4.9-rc1)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (7ce4190c4ca4 hwmon: (nct6775) Add support for multiple virtual temperature sources)
Merging jc_docs/docs-next (8c67e73f1884 Merge branch 'doc/4.9' into docs-next)
CONFLICT (content): Merge conflict in Documentation/sphinx-static/theme_overrides.css
Merging v4l-dvb/master (02a628e5c024 Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (1001354ca341 Linux 4.9-rc1)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (43720df96023 thermal: int3403: Process trip change notification)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (6449e31ddebd firewire: nosy: do not ignore errors in ioremap_nocache())
Merging dlm/next (5c93f56f770e dlm: Use kmemdup instead of kmalloc and memcpy)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (3f3177bb680f fsl/fman: fix error return code in mac_probe())
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (1b830996c160 Merge branch 's390-net')
Merging ipvs-next/master (ae9442f688c3 ipvs: Use IS_ERR_OR_NULL(svc) instead of IS_ERR(svc) || svc == NULL)
Merging wireless-drivers-next/master (15b95a159502 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (526c86021e51 Bluetooth: hci_bcm: Fix autosuspend PM for Lenovo ThinkPad 8)
Merging mac80211-next/master (a3e2f4b6ed9d mac80211: fix A-MSDU outer SA/DA)
Merging rdma/for-next (2937f3757519 staging/lustre: Disable InfiniBand support)
Merging rdma-leon/rdma-next (1001354ca341 Linux 4.9-rc1)
Merging rdma-leon-test/testing/rdma-next (1001354ca341 Linux 4.9-rc1)
Merging mtd/master (69db4aa44fdd Merge tag '4.9/mtd-pairing-scheme' of github.com:linux-nand/linux)
Merging l2-mtd/master (69db4aa44fdd Merge tag '4.9/mtd-pairing-scheme' of github.com:linux-nand/linux)
Merging nand/nand/next (b156b7f2169b mtd: nand: omap2: Fix module autoload)
Merging crypto/master (f97581cfa6e7 crypto: caam - treat SGT address pointer as u64)
Merging drm/drm-next (fa860a1751e3 drm: Print device information again in debugfs)
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (bfd02b3c557c drm/i915: Suppress underruns during DP link retraining)
$ git reset --hard HEAD^
Merging next-20161017 version of drm-intel
Merging drm-tegra/drm/tegra/for-next (08ee01789eeb drm/tegra: Fix window[0] base address corruption)
Merging drm-misc/topic/drm-misc (9edbf1fa600a drm: Add API for capturing frame CRCs)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (59ba2422b430 MAINTAINERS: Add entry for Mali-DP driver)
Merging sunxi/sunxi/for-next (82c04e7929c0 Merge branches 'sunxi/clk-for-4.10', 'sunxi/defconfig-for-4.10', 'sunxi/drm-fixes-for-4.9' and 'sunxi/dt-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (09dd109d8241 latent_entropy: Mark functions with __latent_entropy)
CONFLICT (add/add): Merge conflict in scripts/gcc-plugins/latent_entropy_plugin.c
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (96d87581df93 Merge tag 'regmap-v4.9' into regmap-linus)
Merging sound/for-next (fdd8218d7d1b ALSA: line6: fix a crash in line6_hwdep_write())
Merging sound-asoc/for-next (681551a3aadf Merge remote-tracking branches 'asoc/fix/cs4270', 'asoc/fix/da7219-pops', 'asoc/fix/tas571x' and 'asoc/fix/topology-abi' into asoc-linus)
Merging modules/modules-next (49aadcf1b6f4 extable.h: add stddef.h so "NULL" definition is not implicit)
Merging input/next (4a7126a25b4d Merge tag 'v4.8' into next)
Merging block/for-next (25d09398f1c4 Merge branch 'for-4.9/block' into for-next)
Merging lightnvm/for-next (1a6fe74dfd1b nvme: Pass pointers, not dma addresses, to nvme_get/set_features())
Merging device-mapper/for-next (b052b07c39d5 dm raid: fix activation of existing raid4/10 devices)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (48e3efb2c6ae Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (a16aea0285e4 RAID10: ignore discard error)
Merging mfd/for-mfd-next (b8d336ed90f5 mfd: arizona: Handle probe deferral for reset GPIO)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (1d72706f0485 power: supply: bq27xxx_battery: allow kernel poll_interval parameter runtime update)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (80f473833aba Merge tag 'regulator-v4.9' into regulator-linus)
Merging security/next (1306d8e1c09f Merge tag 'tpmdd-next-20160927' of git://git.infradead.org/users/jjs/linux-tpmdd into ra-next)
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
Merging spi/for-next (ed34b9560902 Merge tag 'spi-v4.9' into spi-linus)
Merging tip/auto-latest (d5797dee4226 Merge branch 'perf/urgent')
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (a29d64a45eed EDAC, altera: Add IRQ Flags to disable IRQ while handling)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
Merging rcu/rcu/next (e53e0b3e7b3c rcu: Make expedited grace periods recheck dyntick idle state)
Merging kvm/linux-next (6218590bcb45 Merge tag 'kvm-4.9-1' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging kvm-arm/next (0099b7701f52 KVM: arm/arm64: vgic: Don't flush/sync without a working vgic)
Merging kvm-mips/next (bf18db4e7bd9 KVM: MIPS: Drop dubious EntryHi optimisation)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (a6a198bc60e6 xen/x86: Update topology map for PV VCPUs)
Merging percpu/for-next (9b7396624a7b mm/percpu.c: fix potential memory leakage for pcpu_embed_first_chunk())
Merging workqueues/for-next (863b710b664b workqueue: remove keventd_up())
Merging drivers-x86/for-next (ea893695ec11 platform/x86: asus-wmi: add SERIO_I8042 dependency)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (46d771b7975d leds: lp3952: Export I2C module alias information for module autoload)
Merging ipmi/for-next (bd85f4b37ddf ipmi: fix crash on reading version from proc after unregisted bmc)
Merging driver-core/driver-core-next (1001354ca341 Linux 4.9-rc1)
Merging tty/tty-next (1001354ca341 Linux 4.9-rc1)
Merging usb/usb-next (1001354ca341 Linux 4.9-rc1)
Merging usb-gadget/next (1001354ca341 Linux 4.9-rc1)
Merging usb-serial/usb-next (1001354ca341 Linux 4.9-rc1)
Merging usb-chipidea-next/ci-for-usb-next (c6900310b6cc usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging staging/staging-next (26f64a6ba149 Staging: vt6655: Replace dwIoBase by iobase)
Merging char-misc/char-misc-next (1001354ca341 Linux 4.9-rc1)
Merging extcon/extcon-next (38085c987f52 extcon: Add support for qcom SPMI PMIC USB id detection hardware)
Merging slave-dma/next (1001354ca341 Linux 4.9-rc1)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (129344deecf4 Merge branch 'misc' into for-next)
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (df073d9e6a7d Merge branch 'for-4.9' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (789ffaecf80b virtio_pci: Limit DMA mask to 44 bits for legacy virtio devices)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
CONFLICT (content): Merge conflict in drivers/remoteproc/remoteproc_core.c
Merging rpmsg/for-next (2fdd6c32d6a5 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (a5ea9f982d2b gpio: mxs: Unmap region obtained by of_iomap)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (069d5ac9ae0d autofs:  Fix automounts by using current_real_cred()->uid)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (d3397484bb5b clk: hi6220: use CLK_OF_DECLARE_DRIVER for sysctrl and mediactrl clock init)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (fecf861e765b selftests/futex: Check ANSI terminal color support)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (b562e44f507e Linux 4.5)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (c42e5f09e839 coresight: reset "enable_sink" flag when need be)
Merging rtc/rtc-next (1001354ca341 Linux 4.9-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (e476f94482fc Merge branch 'for-4.9/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (000cf9328226 kdump, vmcoreinfo: report actual value of phys_base)
Applying: powerpc: merge fix for CONFIG_WORD_SIZE -> BITS rename
Applying: powerpc: include asm/ima.h for setup_ima_buffer
Applying: powerpc: disable KEXEC_FILE for now
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (afb7b3b92f42 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
