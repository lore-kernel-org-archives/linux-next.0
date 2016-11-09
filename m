From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 9
Date: Wed, 9 Nov 2016 15:40:46 +1100
Message-ID: <20161109154046.794b2125@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20161108:

The drm-misc tree gained a build failure, so I used the version from
next-20161108.

The sound-asoc tree still had its build failure, so I used the version
from next-20161028.

The scsi-mkp tree gained conflicts against the block and scsi trees.

The rtc tree lost its build failure.

The akpm tree gained a conflict against the jc_docs tree.

Non-merge commits (relative to Linus' tree): 4645
 5193 files changed, 293049 insertions(+), 97254 deletions(-)

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

I am currently merging 246 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (e3a00f68e426 Merge tag 'iommu-fixes-v4.9-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu)
Merging fixes/master (30066ce675d3 Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (4efca4ed05cb kbuild: modversions for EXPORT_SYMBOL() for asm)
Merging arc-current/for-curr (0a0a047def15 ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination core)
Merging arm-current/fixes (6127d124ee4e ARM: wire up new pkey syscalls)
Merging m68k-current/for-linus (7e251bb21ae0 m68k: Fix ndelay() macro)
Merging metag-fixes/fixes (35d04077ad96 metag: Only define atomic_dec_if_positive conditionally)
Merging powerpc-fixes/fixes (fb479e44a9e2 powerpc/64s: relocation, register save fixes for system reset interrupt)
Merging sparc/master (0c183d92b20b Merge tag 'spi-fix-v4.9-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging net/master (fd0285a39b1c fib_trie: Correct /proc/net/route off by one error)
Merging ipsec/master (7f92083eb58f vti6: flush x-netns xfrm cache when vti interface is removed)
Merging netfilter/master (b73b8a1ba598 netfilter: nft_dup: do not use sreg_dev if the user doesn't specify it)
Merging ipvs/master (b73b8a1ba598 netfilter: nft_dup: do not use sreg_dev if the user doesn't specify it)
Merging wireless-drivers/master (d3532ea6ce4e brcmfmac: avoid maybe-uninitialized warning in brcmf_cfg80211_start_ap)
Merging mac80211/master (269ebce4531b xen-netfront: cast grant table reference first to type int)
Merging sound-current/for-linus (6809cd682b82 ALSA: info: Return error for invalid read/write)
Merging pci-current/for-linus (16d917b130d7 PCI: Don't attempt to claim shadow copies of ROM)
Merging driver-core.current/driver-core-linus (bdacd1b426db driver core: fix smatch warning on dev->bus check)
Merging tty.current/tty-linus (a909d3e63699 Linux 4.9-rc3)
Merging usb.current/usb-linus (7309aa847ead cdc-acm: fix uninitialized variable)
Merging usb-gadget-fixes/fixes (fd9afd3cbe40 usb: gadget: u_ether: remove interrupt throttling)
Merging usb-serial-fixes/usb-linus (9bfef729a3d1 USB: serial: ftdi_sio: add support for TI CC3200 LaunchPad)
Merging usb-chipidea-fixes/ci-for-usb-stable (991d5add50a5 usb: chipidea: host: fix NULL ptr dereference during shutdown)
Merging phy/fixes (4320f9d4c183 phy: sun4i: check PMU presence when poking unknown bit of pmu)
Merging staging.current/staging-linus (68fae2f3df45 staging: nvec: remove managed resource from PS2 driver)
Merging char-misc.current/char-misc-linus (f6b2db084b65 vmbus: make sysfs names consistent with PCI)
Merging input-current/for-linus (324ae0958cab Input: psmouse - cleanup Focaltech code)
Merging crypto-current/master (6d4952d9d9d4 hwrng: core - Don't use a stack buffer in add_early_randomness())
Merging ide/master (797cee982eef Merge branch 'stable-4.8' of git://git.infradead.org/users/pcmoore/audit)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (05692d7005a3 vfio/pci: Fix integer overflows, bitmask check)
Merging kselftest-fixes/fixes (1001354ca341 Linux 4.9-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (51717929d835 mfd: intel_soc_pmic_bxtwc: Fix usbc interrupt)
Merging drm-intel-fixes/for-linux-next-fixes (54905ab5fe7a drm/i915: Limit Valleyview and earlier to only using mappable scanout)
Merging kbuild/for-next (fbcbee25745d Merge branches 'kbuild/kbuild' and 'kbuild/misc' into kbuild/for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (1001354ca341 Linux 4.9-rc1)
Merging arm/for-next (f167e1f561ae Merge branches 'fixes', 'misc', 'sa1100-base' and 'syscalls' into for-next)
Merging arm-perf/for-next/perf (1001354ca341 Linux 4.9-rc1)
Merging arm-soc/for-next (1e1ce567d3a6 ARM: SoC: Document merges)
Merging pinctrl/for-next (71891d6cdb66 Merge branch 'devel' into for-next)
Merging amlogic/for-next (8c8a1078e8a3 Merge branch 'v4.10/defconfig' into tmp/aml-rebuild)
Merging at91/at91-next (0f59c948faed Merge tag 'at91-ab-4.8-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (391823c4373c Merge branch anholt/bcm2835-dt-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e6e1aa531aa6 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (fb2a68db621a Merge branch 'for_4.9/keystone_dts' into next)
Merging mvebu/for-next (2fb556b700c6 Merge branch 'mvebu/dt64-fix' into mvebu/for-next)
Merging omap/for-next (6e32e0eda2c9 Merge branch 'omap-for-v4.10/cpuidle' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (c49806e0fa1e Merge branch 'arm64-for-5.0' into all-for-5.0)
Merging renesas/next (d31c50e214d9 Merge branch 'dt-for-v4.10' into next)
Merging rockchip/for-next (f9e4dfbd058c Merge branch 'v4.10-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1a695a905c18 Linux 4.7-rc1)
Merging samsung-krzk/for-next (b33c7bb9d59c Merge branch 'next/dt' into for-next)
Merging tegra/for-next (817d74019bab Merge branch for-4.10/arm/defconfig into for-next)
Merging arm64/for-next/core (db68f3e7594a arm64: tlbflush.h: add __tlbi() macro)
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (c78874f116be tty: serial: make crisv10 explicitly non-modular)
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (25ba49085c4f m68k/atari: Use seq_puts() in atari_get_hardware_list())
Merging m68knommu/for-next (98a87d21afd5 m68knommu: AMCORE board, add iMX i2c support)
Merging metag/for-next (f5d163aad31e metag: perf: fix build on Meta1)
Merging microblaze/next (52e9e6e05617 microblaze: pci: export isa_io_base to fix link errors)
Merging mips/mips-for-linux-next (3f56647d2d68 Merge branch '4.9-fixes' into mips-for-linux-next)
Merging nios2/for-next (476080a79367 nios2: use of_property_read_bool)
Merging parisc-hd/for-next (c8d2bc9bc39e Linux 4.8)
Merging powerpc/next (08bf75ba852e powerpc/mm/hash64: Fix might_have_hea() check)
Merging fsl/next (e0b80f00bb96 arch/powerpc: Add CONFIG_FSL_DPAA to corenetXX_smp_defconfig)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (847e0700121b s390: remove unneeded dependency for gen_facilities)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (bf55d575234b tile: migrate exception table users off module.h and onto extable.h)
Merging uml/linux-next (dad223284407 um: Don't discard .text.exit section)
Merging unicore32/unicore32 (1ace5d1e3d4b unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (d4eccafcaf33 xtensa: clean up printk usage for boot/crash logging)
Merging befs/for-next (3c8a965ad630 befs: remove signatures from comments)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (2a782f537899 Merge branch 'for-next-next-4.9-20161108' into for-next-20161108)
Merging ceph/master (5130ccea7cf4 ceph: fix non static symbol warning)
Merging cifs/for-next (faad81c4f581 CIFS: iterate over posix acl xattr entry correctly in ACL_to_cifs_posix())
Merging configfs/for-next (42857cf512cb configfs: Return -EFBIG from configfs_write_bin_file.)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (e952813e210b ext2: avoid bogus -Wmaybe-uninitialized warning)
Merging ext4/dev (d74f3d25289a ext4: add missing KERN_CONT to a few more debugging uses)
Merging f2fs/dev (751e1d334e73 f2fs: return directly if block has been removed from the victim)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0ce267ff95a0 fuse: fix root dentry initialization)
Merging gfs2/for-next (a3443cda5588 Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security)
Merging jfs/jfs-next (240c5185c52d jfs: Simplify code)
Merging nfs/linux-next (14155cafeadd btrfs: assign error values to the correct bio structs)
Merging nfsd/nfsd-next (56094edd1797 sunrpc: GFP_KERNEL should be GFP_NOFS in crypto code)
Merging orangefs/for-next (dc0336214eb0 orangefs: clean up debugfs)
Merging overlayfs/overlayfs-next (b454c10e53ca ovl: split super.c)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a00052a296e5 ubifs: Fix regression in ubifs_readdir())
Merging xfs/for-next (84716639acc3 Merge branch 'xfs-4.10-misc-fixes-1' into for-next)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (b26b5ef5ec7e Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (c8d2bc9bc39e Linux 4.8)
Merging pci/next (1001354ca341 Linux 4.9-rc1)
Merging pstore/for-next/pstore (07d9a380680d Linux 4.9-rc2)
Merging hid/for-next (003ba7361116 Merge branch 'for-4.10/upstream' into for-next)
Merging i2c/i2c/for-next (bc33b0ca11e3 Linux 4.9-rc4)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (c8d2bc9bc39e Linux 4.8)
Merging hwmon-staging/hwmon-next (c2d95c252f65 hwmon: (adm1275) Enable adm1278 VOUT sampling)
Merging jc_docs/docs-next (d55003d86e0c USB: fix typo in documentation)
Merging v4l-dvb/master (778de0140232 Merge branch 'v4l_for_linus' into to_next)
Merging pm/linux-next (d6555d53674f Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (3105f234e0ab thermal/powerclamp: correct cpu support check)
Merging thermal-soc/next (c6935931c189 Linux 4.8-rc5)
Merging ieee1394/for-next (e9300a4b7bba firewire: net: fix fragmented datagram_size off-by-one)
Merging dlm/next (aa9f1012858b dlm: don't specify WQ_UNBOUND for the ast callback workqueue)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging net-next/master (f5f99309fa74 sock: do not set sk_err in sock_dequeue_err_skb)
CONFLICT (content): Merge conflict in net/netlink/genetlink.c
Merging ipsec-next/master (2258d927a691 xfrm: remove unused helper)
Merging netfilter-next/master (08733a0cb7de netfilter: handle NF_REPEAT from nf_conntrack_in())
Merging ipvs-next/master (75a608d8d3b2 ipvs: Decrement ttl)
Merging wireless-drivers-next/master (3f8247c8c480 Merge tag 'iwlwifi-next-for-kalle-2016-10-25-2' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (52069883235a Bluetooth: hci_qca: Use setup_timer Kernel API instead of init_timer)
Merging mac80211-next/master (17197236d62c enic: set skb->hash type properly)
Merging rdma/for-next (e37a79e5d4ca net/mlx5e: Add tc support for FWD rule with counter)
Merging rdma-leon/rdma-next (a909d3e63699 Linux 4.9-rc3)
Merging rdma-leon-test/testing/rdma-next (33b4f7c41bae Merge branch 'testing/queue-next' into testing/rdma-next)
CONFLICT (content): Merge conflict in drivers/infiniband/core/roce_gid_mgmt.c
Merging mtd/master (0e2ce9d3fcba Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux)
Merging l2-mtd/master (64ad46379fcf mtd: bcm47xxsflash: use uncached MMIO access for BCM53573)
Merging nand/nand/next (83f48f80de8a mtd: nand: socrates: use nand_scan() for nand_scan_ident/tail() combo)
Merging crypto/master (89277a7d0ed4 crypto: cryptd - Remove unused but set variable 'tfm')
Merging drm/drm-next (afdd548f742c Merge branch 'linux-4.10' of git://github.com/skeggsb/linux into drm-next)
Merging drm-panel/drm/panel/for-next (c96f566273bf drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel)
Merging drm-intel/for-linux-next (71d5895aac0c drm/i915: avoid harmless empty-body warning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (cc09cb6da9b0 drm/tegra: gem: Remove some dead code)
Merging drm-misc/topic/drm-misc (06d9f56f1d9a drm/msm: module param to dump state on error irq)
$ git reset --hard HEAD^
Merging next-20161108 version of drm-misc
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (7a3bcc0a8e2a drm/msm: bump kernel api version for explicit fencing)
Merging hdlcd/for-upstream/hdlcd (523d939ef98f Linux 4.7)
Merging mali-dp/for-upstream/mali-dp (e64053f05eb9 drm: mali-dp: Clear CVAL when leaving config mode)
Merging sunxi/sunxi/for-next (bc5952be2d42 Merge branch 'sunxi/dt64-for-4.10' into sunxi/for-next)
Merging kspp/for-next/kspp (07d9a380680d Linux 4.9-rc2)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (74e3368de87d Merge remote-tracking branches 'regmap/fix/header' and 'regmap/fix/macro' into regmap-linus)
Merging sound/for-next (4ce8e6a51abf ALSA: hda - Fix typo)
Merging sound-asoc/for-next (2fd876810ed6 Merge remote-tracking branch 'asoc/topic/wm9713' into asoc-next)
$ git reset --hard HEAD^
Merging next-20161028 version of sound-asoc
CONFLICT (content): Merge conflict in sound/soc/samsung/s3c24xx-i2s.c
[master 76d515f08f6e] next-20161028/sound-asoc
Merging modules/modules-next (a467a672cf09 MAINTAINERS: Begin module maintainer transition)
Merging input/next (8dd5e0b364e5 Input: da9063 - fix module autoload when registered via OF)
Merging block/for-next (abb87e497e06 Merge branch 'for-4.10/block' into for-next)
Merging lightnvm/for-next (b759d3ddb52f lightnvm: rrpc: split bios of size > 256kb)
Merging device-mapper/for-next (5c5eb3db2893 dm cache metadata: DM_CACHE_FEATURE_INCOMPAT_SEP_DIRTY_BITS)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (22c55ad7026c mmc: sh_mobile_sdhi: Add r7s72100 support)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (85c9ccd4f026 md/bitmap: Don't write bitmap while earlier writes might be in-flight)
Merging mfd/for-mfd-next (77f298a18ff8 mfd: sun4i-gpadc: Fix 'cast from pointer to integer of different size' warning)
Merging backlight/for-backlight-next (0c9501f823a4 backlight: pwm_bl: Handle gpio that can sleep)
Merging battery/for-next (44fccac4ff17 power: supply: lp8788: remove an unneeded NULL check)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (121c4e997cee Merge remote-tracking branches 'regulator/topic/arizona', 'regulator/topic/fixed' and 'regulator/topic/tps6507x' into regulator-next)
Merging security/next (07d9a380680d Linux 4.9-rc2)
Merging integrity/next (56078b570983 module: Fully remove the kernel_module_from_file hook)
Merging keys/keys-next (ed51e44e914c Merge branch 'keys-asym-keyctl' into keys-next)
Merging selinux/next (07d9a380680d Linux 4.9-rc2)
Merging tpmdd/next (7839a496de6d char: tpm: fix kerneldoc tpm2_unseal_trusted name typo)
Merging watchdog/master (39487f6688a5 watchdog: imx2_wdt: add pretimeout function support)
Merging iommu/next (bea64033dd7b iommu/vt-d: Fix dead-locks in disable_dmar_iommu() path)
Merging dwmw2-iommu/master (5b3c5c539eac iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (61771468e0a5 vfio_pci: use pci_alloc_irq_vectors)
Merging trivial/for-next (380cc42d5a6c nvme: add missing \n to end of dev_warn message)
Merging audit/next (b4eb4f7f1a97 audit: less stack usage for /proc/*/loginuid)
Merging devicetree/for-next (87e5fc99b028 DT: irqchip: renesas-irqc: document R8A7743/5 support)
Merging mailbox/mailbox-for-next (a649244de727 dt-bindings: mailbox: Add Amlogic Meson MHU Bindings)
Merging spi/for-next (3ab554413ec4 Merge remote-tracking branches 'spi/topic/omap', 'spi/topic/rspi', 'spi/topic/spidev' and 'spi/topic/sunxi' into spi-next)
Merging tip/auto-latest (7f5aea355653 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Merging clockevents/clockevents/next (1d661bf5327a clocksource/drivers/time-armada-370-xp: Fix return value check)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (90e493d7d51c EDAC, altera: Disable IRQs while injecting SDRAM errors)
Merging irqchip/irqchip/for-next (0ccb54a7dba0 Merge branch 'irqchip/core' into irqchip/for-next)
Merging ftrace/for-next (f971cc9aabc2 tracing: Have max_latency be defined for HWLAT_TRACER as well)
Merging rcu/rcu/next (d011087a0402 torture: Update RCU test scenario documentation)
Merging kvm/linux-next (ad3610919e6f kvm: x86: avoid atomic operations on APICv vmentry)
Merging kvm-arm/next (0099b7701f52 KVM: arm/arm64: vgic: Don't flush/sync without a working vgic)
Merging kvm-mips/next (07d9a380680d Linux 4.9-rc2)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (fa73c3b25bd8 KVM: PPC: Book3s PR: Allow access to unprivileged MMCR2 register)
Merging kvms390/next (b0eb91ae630a Merge remote-tracking branch 'kvms390/s390forkvm' into kvms390next)
Merging xen-tip/linux-next (999c9af9e3a2 xen: make use of xenbus_read_unsigned() in xenbus)
Merging percpu/for-next (3ca45a46f8af percpu: ensure the requested alignment is power of two)
Merging workqueues/for-next (8bc4a0445596 Merge branch 'for-4.9' into for-4.10)
Merging drivers-x86/for-next (401df5ace9d6 intel_pmc_core: Add KBL CPUID support)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (883d32ce3385 leds: core: Add support for poll()ing the sysfs brightness attr for changes.)
Merging ipmi/for-next (6f48ef64097b ipmi: Pick up slave address from SMBIOS on an ACPI device)
Merging driver-core/driver-core-next (baa8809f6097 PM / runtime: Optimize the use of device links)
Merging tty/tty-next (5131dcd78108 Merge 4.9-rc3 into tty-next)
CONFLICT (modify/delete): Documentation/VGA-softcursor.txt deleted in HEAD and modified in tty/tty-next. Version tty/tty-next of Documentation/VGA-softcursor.txt left in tree.
$ git rm -f Documentation/VGA-softcursor.txt
Merging usb/usb-next (11f107f708fd usb: storage: drop freezer.h usage)
Merging usb-gadget/next (a909d3e63699 Linux 4.9-rc3)
Merging usb-serial/usb-next (a98b69002a16 USB: serial: ch341: add debug output for chip version)
Merging usb-chipidea-next/ci-for-usb-next (c6900310b6cc usb: chipidea: imx: Disable internal 60Mhz clock with ULPI PHY)
Merging phy-next/next (7809cd2ce6ab phy: meson: add USB2 PHY support for Meson8b and GXBB)
Merging staging/staging-next (993403b97981 staging: lustre: fixed shadowed variable in socklnd_cb.c)
CONFLICT (content): Merge conflict in drivers/staging/wlan-ng/p80211netdev.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/i2c/trivial-devices.txt
Merging char-misc/char-misc-next (3372592a140d Drivers: hv: vmbus: On the read path cleanup the logic to interrupt the host)
Merging extcon/extcon-next (56182a830cbf extcon: usb-gpio: Add VBUS detection support)
Merging slave-dma/next (8d197083fd9f Merge branch 'topic/qcom' into next)
Merging cgroup/for-next (4221d2ce6e57 Merge branch 'for-4.9' into for-next)
Merging scsi/for-next (ce769f7be3c4 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
Merging scsi-mkp/for-next (4861ee15f2b7 scsi: ufs: Use the resource-managed function to add devfreq device)
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufshcd.c
CONFLICT (content): Merge conflict in drivers/scsi/ufs/ufs-qcom.c
Merging target-updates/for-next (291e3e51a34d target: fix spelling mistake: "limitiation" -> "limitation")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging libata/for-next (a9d72eeb1308 Merge branch 'for-4.9-fixes' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (75bfa81bf089 virtio_ring: mark vring_dma_dev inline)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
CONFLICT (content): Merge conflict in drivers/remoteproc/remoteproc_core.c
Merging rpmsg/for-next (9641800e7ea2 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b38b2dfcf2a3 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (dc8e6e1e8f2d Merge branch 'for-4.9/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (2e41414828bb mm: Add a user_ns owner to mm_struct and fix ptrace permission checks)
Merging ktest/for-next (2dcd0af568b0 Linux 4.6)
Merging clk/clk-next (172ff5a22d4c clk: ti: make clk-dra7-atl explicitly non-modular)
Merging random/dev (59b8d4f1f5d2 random: use for_each_online_node() to iterate over NUMA nodes)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (1001354ca341 Linux 4.9-rc1)
Merging y2038/y2038 (549eb7b22e24 AFS: Correctly use 64-bit time for UUID)
CONFLICT (content): Merge conflict in fs/afs/main.c
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (dcc37f904443 processor.h: remove cpu_relax_lowlatency)
Merging livepatching/for-next (2992ef29ae01 livepatch/module: make TAINT_LIVEPATCH module-specific)
Merging coresight/next (7f73c6f7d72a coresight: Add support for ARM Coresight STM-500)
Merging rtc/rtc-next (72d3d79f8da9 rtc: fix typos in Kconfig)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (52e73eb2872c device-dax: fix percpu_ref_exit ordering)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging akpm-current/current (1b399f45323f ipc/shm.c: coding style fixes)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Applying: kexec_file: allow arch-specific memory walking for kexec_add_buffer
Applying: kexec_file: change kexec_add_buffer to take kexec_buf as argument
Applying: kexec_file: factor out kexec_locate_mem_hole from kexec_add_buffer
Applying: powerpc: change places using CONFIG_KEXEC to use CONFIG_KEXEC_CORE instead
Applying: powerpc: factor out relocation code in module_64.c
Applying: powerpc: implement kexec_file_load
Applying: powerpc: add functions to read ELF files of any endianness
Applying: powerpc: add support for loading ELF kernels with kexec_file_load
Applying: powerpc: add purgatory for kexec_file_load implementation
Applying: powerpc: enable CONFIG_KEXEC_FILE in powerpc server defconfigs
Applying: powerpc: ima: get the kexec buffer passed by the previous kernel
Applying: ima: on soft reboot, restore the measurement list
Applying: ima: permit duplicate measurement list entries
Applying: ima: maintain memory size needed for serializing the measurement list
Applying: powerpc: ima: send the kexec buffer to the next kernel
Applying: ima: on soft reboot, save the measurement list
Applying: ima: store the builtin/custom template definitions in a list
Applying: ima: support restoring multiple template formats
Applying: ima: define a canonical binary_runtime_measurements list format
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-parameters.rst
Applying: ima: platform-independent hash value
Applying: ktest.pl: fix english
Applying: kernel/watchdog.c: move shared definitions to nmi.h
Applying: kernel/watchdog.c: move hardlockup detector to separate file
Applying: sparc: implement watchdog_nmi_enable and watchdog_nmi_disable
Merging akpm/master (96fdefe1fe93 sparc: implement watchdog_nmi_enable and watchdog_nmi_disable)
