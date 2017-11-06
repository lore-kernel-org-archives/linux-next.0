From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 6
Date: Mon, 6 Nov 2017 18:30:19 +1100
Message-ID: <20171106183019.46c29b1f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750801AbdKFHaW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Nov 2017 02:30:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20171103:

New tree: cpupower

The powerpc tree still had its build failure for which I applied a patch.

The crypto tree gained a build failure so I used the version from
next-20171103.

The regmap tree lost its build failure.

The tip tree gained a conflict against the pm tree.

The kvm-arm tree gained conflicts against Linus' tree.

The scsi tree gained a conflict against Linus' tree.

The nvdimm tree lost its build failure.

The akpm-current tree gained a conflict against the arm64 tree.

The akpm tree lost a patch that turned up elsewhere and gained a build
failure for which I reveretd a commit.

Non-merge commits (relative to Linus' tree): 10807
 10067 files changed, 519168 insertions(+), 241982 deletions(-)

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

I am currently merging 272 trees (counting Linus' and 42 trees of bug
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
Merging origin/master (2d6349944d96 Merge branch 'fixes' of git://git.armlinux.org.uk/~rmk/linux-arm)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (bb3f38c3c5b7 kbuild: clang: fix build failures with sparse check)
Merging arc-current/for-curr (fdbed19697e1 ARC: unbork module link errors with !CONFIG_ARC_HAS_LLSC)
Merging arm-current/fixes (dad4675388fc ARM: add debug ".edata_real" symbol)
Merging m68k-current/for-linus (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (7ecb37f62fe5 powerpc/perf: Fix core-imc hotplug callback failure during imc initialization)
Merging sparc/master (23198ddffb6c sparc32: Add cmpxchg64().)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (d09b9e60e06d tcp: fix DSACK-based undo on non-duplicate ACK)
Merging ipsec/master (cf3796675174 xfrm: do unconditional template resolution before pcpu cache check)
Merging netfilter/master (7400bb4b5800 netfilter: nf_reject_ipv4: Fix use-after-free in send_reset)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a6127b4440d1 Merge tag 'iwlwifi-for-kalle-2017-10-06' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (9618aec3349b Merge tag 'mac80211-for-davem-2017-10-25' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging sound-current/for-linus (f5ce817951f3 ALSA: usb-audio: support new Amanero Combo384 firmware version)
Merging pci-current/for-linus (814eae5982cc alpha/PCI: Move pci_map_irq()/pci_swizzle() out of initdata)
Merging driver-core.current/driver-core-linus (bb176f67090c Linux 4.14-rc6)
Merging tty.current/tty-linus (8a5776a5f498 Linux 4.14-rc4)
Merging usb.current/usb-linus (bb176f67090c Linux 4.14-rc6)
Merging usb-gadget-fixes/fixes (7c80f9e4a588 usb: usbtest: fix NULL pointer dereference)
Merging usb-serial-fixes/usb-linus (0b07194bb55e Linux 4.14-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (2fb850092fd9 phy: rockchip-typec: Check for errors from tcphy_phy_init())
Merging staging.current/staging-linus (bb176f67090c Linux 4.14-rc6)
Merging char-misc.current/char-misc-linus (bb176f67090c Linux 4.14-rc6)
Merging input-current/for-linus (6f29c244075c Input: sparse-keymap - send sync event for KE_SW/KE_VSW)
Merging crypto-current/master (441f99c90497 crypto: ccm - preserve the IV buffer)
Merging ide/master (b671e1703394 PNP: ide: constify pnp_device_id)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (a323335e62cc selftests: lib.mk: print individual test results to console by default)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (8a5776a5f498 Linux 4.14-rc4)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (ead666000a5f media: dvb_frontend: only use kref after initialized)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (ca208b5f19cb MIPS: Update email address for Marcin Nowakowski)
Merging drm-intel-fixes/for-linux-next-fixes (bb5cf3386327 drm/i915: Check incoming alignment for unfenced buffers (on i915gm))
Merging drm-misc-fixes/for-linux-next-fixes (62676d10b483 qxl: alloc & use shadow for dumb buffers)
Merging kbuild/for-next (2c063bfbb917 Merge branches 'kbuild' and 'misc' into for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (64dd3a7c8202 Merge remote-tracking branch 'reset/reset/arc' into for-next)
Merging arm/for-next (4dd490dc84fd Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (0cfcfe8ec6de Merge branch 'next/drivers' into for-next)
CONFLICT (modify/delete): include/dt-bindings/pinctrl/stm32h7-pinfunc.h deleted in arm-soc/for-next and modified in HEAD. Version HEAD of include/dt-bindings/pinctrl/stm32h7-pinfunc.h left in tree.
CONFLICT (modify/delete): include/dt-bindings/pinctrl/stm32f746-pinfunc.h deleted in arm-soc/for-next and modified in HEAD. Version HEAD of include/dt-bindings/pinctrl/stm32f746-pinfunc.h left in tree.
CONFLICT (modify/delete): include/dt-bindings/pinctrl/stm32f429-pinfunc.h deleted in arm-soc/for-next and modified in HEAD. Version HEAD of include/dt-bindings/pinctrl/stm32f429-pinfunc.h left in tree.
CONFLICT (content): Merge conflict in drivers/thermal/tegra/Makefile
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/Makefile
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/Makefile
CONFLICT (modify/delete): arch/arm/mach-integrator/pci_v3.h deleted in arm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-integrator/pci_v3.h left in tree.
$ git rm -f arch/arm/mach-integrator/pci_v3.h include/dt-bindings/pinctrl/stm32f429-pinfunc.h include/dt-bindings/pinctrl/stm32f746-pinfunc.h include/dt-bindings/pinctrl/stm32h7-pinfunc.h
Merging actions/for-next (e707b3fe4814 Merge branch 'v4.15/dt64' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (4f6781bad8f6 Merge branch 'v4.15/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (9c9ae757dc8b Merge branch 'dt-for-v4.15' into for-next)
Merging at91/at91-next (bee152d6af7d Merge branch 'at91-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (ac5a1ba06d5c Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8270bfa5860d Merge branch 'for_4.15/keystone-soc' into next)
Merging mvebu/for-next (c6c5ff72be36 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (a95e738b4c72 Merge branch 'omap-for-v4.15/fixes' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (b9cbcd5f933c reset: remove reset_control_get(_optional))
Merging qcom/for-next (e7048ed58ed9 Merge tag 'qcom-drivers-for-4.15-2' into final-for-4.15)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (7cec0c56730a Merge branch 'arm64-dt-for-v4.15' into next)
Merging rockchip/for-next (308c3c77ccb3 Merge branch 'v4.15-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (767d6ca130af Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (b5996699462f Merge branches 'sunxi/dt-for-4.15' and 'sunxi/dt64-for-4.15' into sunxi/for-next)
Merging tegra/for-next (ec0c973f47c7 Merge branch for-4.15/reset into for-next)
Merging arm64/for-next/core (fb8722735f50 arm64: support __int128 on gcc 5+)
CONFLICT (content): Merge conflict in drivers/acpi/arm64/iort.c
Merging clk/clk-next (ccf6413a3013 Merge branch 'clk-gpio' into clk-next)
Merging clk-samsung/for-next (a4f21e9ceb5c clk: samsung: Remove obsolete clkdev alias support)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (10df0ba4c2c2 m68k/defconfig: Update defconfigs for v4.14-rc1)
Merging m68knommu/for-next (670c50807af2 m68k: coldfire: add dspi0 module support)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (dfe390a6d844 microblaze: add missing include to mmu_context_mm.h)
Merging mips/mips-for-linux-next (64876b53b008 Merge branches '4.14-fixes' and '4.15-features' into mips-for-linux-next)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (610f01b9a88a openrisc: fix possible deadlock scenario during timer sync)
Merging parisc-hd/for-next (569dbb88e80d Linux 4.13)
Merging powerpc/next (4dd9eab39c71 powerpc/pseries: Cleanup error handling in iommu_pseries_alloc_group())
CONFLICT (content): Merge conflict in arch/powerpc/mm/tlb-radix.c
CONFLICT (content): Merge conflict in arch/powerpc/kvm/powerpc.c
Applying: powerpc/64s: ppc_save_regs is now needed for all 64s builds
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging risc-v/for-linux-next (fbe934d69eb7 RISC-V: Build Infrastructure)
Merging s390/features (30e8eb867122 s390/qdio: sanitize put_indicator)
CONFLICT (modify/delete): arch/s390/include/asm/rwsem.h deleted in s390/features and modified in HEAD. Version HEAD of arch/s390/include/asm/rwsem.h left in tree.
$ git rm -f arch/s390/include/asm/rwsem.h
Merging sparc-next/master (9cd6681cb116 Merge branch 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (777a45b45866 arch/tile: Implement ->set_state_oneshot_stopped())
Merging uml/linux-next (6d20e6b235aa um: return negative in tuntap_open_tramp())
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
CONFLICT (modify/delete): include/linux/fscrypt_common.h deleted in fscrypt/master and modified in HEAD. Version HEAD of include/linux/fscrypt_common.h left in tree.
$ git rm -f include/linux/fscrypt_common.h
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (cfdd4c2552b6 Merge branch 'for-next-next-v4.15-20171101' into for-next-20171101)
Merging ceph/master (6c2838fbdedb ceph: unlock dangling spinlock in try_flush_caps())
Merging cifs/for-next (4f2ba5dc183b Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (80b9230b8819 Pull isofs signed char fixes and quota writeback fix.)
Merging ext4/dev (05b0a19805bf ext4: mention noload when recovering on read-only device)
CONFLICT (content): Merge conflict in fs/ext4/inode.c
Merging f2fs/dev (d7cf341a2381 f2fs: don't bother with inode->i_version)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (88a96fa84186 jfs: Add missing NULL pointer check in __get_metapage)
Merging nfs/linux-next (2d6349944d96 Merge branch 'fixes' of git://git.armlinux.org.uk/~rmk/linux-arm)
Merging nfsd/nfsd-next (5f04ab40748f svcrdma: Preserve CB send buffer across retransmits)
Merging orangefs/for-next (0b08273c8ab7 orangefs: Adjust three checks for null pointers)
Merging overlayfs/overlayfs-next (fa0096e3bad6 ovl: do not cleanup unsupported index entries)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (89b68cd92663 UBI: Fix two typos in comments)
Merging xfs/for-next (0dca060c2a5a xfs: scrub: avoid uninitialized return code)
Merging file-locks/locks-next (3b9f8ed25dbe Merge branch 'for-4.14' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata)
Merging vfs/for-next (f8340cc34799 mips: switch to {get,put}_compat_sigset())
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (9afe77ed849d added new line symbol after warning about dropped messages)
Merging pci/next (b2e209f8b6dd Merge branch 'pci/host-v3-semi' into next)
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-tango.c
Merging pstore/for-next/pstore (e19b205be43d Linux 4.14-rc2)
Merging hid/for-next (3d375a75caae Merge branch 'for-4.15/logitech' into for-next)
Merging i2c/i2c/for-next (43eda8a5cdb0 Merge branch 'i2c/for-4.15' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (4d420a6a9ddd pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller)
Merging jc_docs/docs-next (45653c845b0c scripts: Add a script to find unused documentation)
CONFLICT (content): Merge conflict in Documentation/process/index.rst
Merging v4l-dvb/master (9917fbcfa20a media: camss-vfe: always initialize reg at vfe_set_xbar_cfg())
CONFLICT (modify/delete): drivers/staging/media/atomisp/platform/intel-mid/intel_mid_pcihelpers.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/platform/intel-mid/intel_mid_pcihelpers.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/include/asm/intel_mid_pcihelpers.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/include/asm/intel_mid_pcihelpers.h left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/i2c/ov5693/Makefile
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/imx227.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/imx227.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/imx219.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/imx219.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/imx175.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/imx175.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/imx134.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/imx134.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/dw9714.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/dw9714.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/dw9714.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/dw9714.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/drv201.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/drv201.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/drv201.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/drv201.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/common.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/common.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/ad5816g.h deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/ad5816g.h left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/ad5816g.c deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/ad5816g.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/atomisp/i2c/imx/Makefile deleted in v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/media/atomisp/i2c/imx/Makefile left in tree.
$ git rm -f drivers/staging/media/atomisp/i2c/imx/Makefile drivers/staging/media/atomisp/i2c/imx/ad5816g.c drivers/staging/media/atomisp/i2c/imx/ad5816g.h drivers/staging/media/atomisp/i2c/imx/common.h drivers/staging/media/atomisp/i2c/imx/drv201.c drivers/staging/media/atomisp/i2c/imx/drv201.h drivers/staging/media/atomisp/i2c/imx/dw9714.c drivers/staging/media/atomisp/i2c/imx/dw9714.h drivers/staging/media/atomisp/i2c/imx/imx134.h drivers/staging/media/atomisp/i2c/imx/imx175.h drivers/staging/media/atomisp/i2c/imx/imx219.h drivers/staging/media/atomisp/i2c/imx/imx227.h drivers/staging/media/atomisp/include/asm/intel_mid_pcihelpers.h drivers/staging/media/atomisp/platform/intel-mid/intel_mid_pcihelpers.c
Merging v4l-dvb-next/master (db6321a1af84 media: platform: VIDEO_QCOM_CAMSS should depend on HAS_DMA)
Merging fbdev/fbdev-for-next (cb6bc3ff59e3 video: sa1100fb: move pseudo palette into sa1100fb_info structure)
Merging pm/linux-next (efe4e10cf142 Merge branch 'pm-devfreq' into linux-next)
Merging cpupower/cpupower (88ab08cc8dfe tools/power/cpupower: add libcpupower.so.0.0.1 to .gitignore)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (9e66317d3c92 Linux 4.14-rc3)
Merging thermal/next (dbac386afa1f Merge branches 'thermal-core', 'thermal-intel', 'thermal-tool' and 'imx-nvmem' into next)
CONFLICT (content): Merge conflict in tools/thermal/tmon/Makefile
Merging thermal-soc/next (b2fd708ffa7f thermal: cpu_cooling: pr_err() strings should end with newlines)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (2798b80b3853 Merge branch 'eBPF-based-device-cgroup-controller')
Merging ipsec-next/master (2a171788ba7b Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging netfilter-next/master (e8daf27c2fea netfilter: nf_ct_h323: Out Of Bound Read in Netfilter Conntrack)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (e226fb5affcc Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (a990d91d3754 Bluetooth: Remove myself from the MAINTAINERS file)
Merging mac80211-next/master (7c0c5c0ba731 cfg80211: initialize regulatory keys/database later)
Merging rdma/for-next (5455e73a76a3 bnxt_re: Implement the shutdown hook of the L2-RoCE driver interface)
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx4/catas.c
Merging gfs2/for-next (d0920a9cd7e7 gfs2: Allow gfs2_xattr_set to be called with the glock held)
Merging mtd/master (36de80740008 mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user)
Merging l2-mtd/master (16271224bcf0 Merge tag 'nand/for-4.15' of git://git.infradead.org/l2-mtd)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
Merging nand/nand/next (30863e38ebeb mtd: nand: Fix writing mtdoops to nand flash.)
Merging spi-nor/spi-nor/next (ec0a9f62b393 mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID)
Merging crypto/master (7a373fd74a8d crypto: atmel-aes - Reset the controller before each use)
CONFLICT (modify/delete): drivers/crypto/mv_cesa.h deleted in crypto/master and modified in HEAD. Version HEAD of drivers/crypto/mv_cesa.h left in tree.
$ git rm -f drivers/crypto/mv_cesa.h
$ git reset --hard HEAD^
Merging next-20171103 version of crypto
Merging drm/drm-next (36a5fdf76d32 Merge tag 'drm-intel-next-2017-10-23' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/sun4i/Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/pl111/Makefile
CONFLICT (modify/delete): drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.h deleted in drm/drm-next and modified in HEAD. Version HEAD of drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.h left in tree.
$ git rm -f drivers/gpu/drm/nouveau/nvkm/subdev/mmu/nv04.h
Merging drm-amd-dc/drm-next-amd-dc-staging (26c860d55796 Merge branch 'drm-next-4.15-dc' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (136109c67f67 drm/i915: Set up mocs tables before restarting the engines)
Merging drm-tegra/drm/tegra/for-next (fb83be887390 drm/tegra: hdmi: Add cec-notifier support)
Merging drm-misc/for-linux-next (e073db5c5d7a drm/vc4: Fix wrong printk format in vc4_bo_stats_debugfs())
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (f5fc2e1173a3 drm/msm: fix msm_rd_dump_submit prototype)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (a593a185218e drm: gem_cma_helper.c: Allow importing of contiguous scatterlists with nents > 1)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (e64b9189bfd5 gpu: ipu-v3: ipu-dc: Remove unused 'di' variable)
Merging etnaviv/etnaviv/next (330b52bd9bba drm/etnaviv: short-circuit perfmon ioctls)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (c60b17521664 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/hwspinlock' into regmap-next)
Merging sound/for-next (727dede0ba8a sound: Retire OSS)
CONFLICT (modify/delete): sound/oss/waveartist.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/waveartist.h left in tree.
CONFLICT (modify/delete): sound/oss/v_midi.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/v_midi.h left in tree.
CONFLICT (modify/delete): sound/oss/ulaw.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/ulaw.h left in tree.
CONFLICT (modify/delete): sound/oss/tuning.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/tuning.h left in tree.
CONFLICT (modify/delete): sound/oss/sound_firmware.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sound_firmware.h left in tree.
CONFLICT (modify/delete): sound/oss/sound_calls.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sound_calls.h left in tree.
CONFLICT (modify/delete): sound/oss/sleep.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sleep.h left in tree.
CONFLICT (modify/delete): sound/oss/sb_ess.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sb_ess.h left in tree.
CONFLICT (modify/delete): sound/oss/sb_ess.c deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sb_ess.c left in tree.
CONFLICT (modify/delete): sound/oss/sb.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/sb.h left in tree.
CONFLICT (modify/delete): sound/oss/pas2.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/pas2.h left in tree.
CONFLICT (modify/delete): sound/oss/os.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/os.h left in tree.
CONFLICT (modify/delete): sound/oss/mpu401.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/mpu401.h left in tree.
CONFLICT (modify/delete): sound/oss/midi_synth.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/midi_synth.h left in tree.
CONFLICT (modify/delete): sound/oss/midi_ctrl.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/midi_ctrl.h left in tree.
CONFLICT (modify/delete): sound/oss/hex2hex.c deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/hex2hex.c left in tree.
CONFLICT (modify/delete): sound/oss/bin2hex.c deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/bin2hex.c left in tree.
CONFLICT (modify/delete): sound/oss/ad1848.h deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/ad1848.h left in tree.
CONFLICT (modify/delete): sound/oss/Makefile deleted in sound/for-next and modified in HEAD. Version HEAD of sound/oss/Makefile left in tree.
$ git rm -f sound/oss/Makefile sound/oss/ad1848.h sound/oss/bin2hex.c sound/oss/hex2hex.c sound/oss/midi_ctrl.h sound/oss/midi_synth.h sound/oss/mpu401.h sound/oss/os.h sound/oss/pas2.h sound/oss/sb.h sound/oss/sb_ess.c sound/oss/sb_ess.h sound/oss/sleep.h sound/oss/sound_calls.h sound/oss/sound_firmware.h sound/oss/tuning.h sound/oss/ulaw.h sound/oss/v_midi.h sound/oss/waveartist.h
Merging sound-asoc/for-next (7392f77f14e6 Merge remote-tracking branches 'asoc/topic/wm8741', 'asoc/topic/wm97xx' and 'asoc/topic/zte' into asoc-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/include/amd_shared.h
Merging modules/modules-next (ece1996a21ee module: Do not paper over type mismatches in module_param_call())
Merging input/next (4e974c120039 Input: convert autorepeat timer to use timer_setup())
Merging block/for-next (7770c264640b Merge branch 'for-4.15/block' into for-next)
CONFLICT (content): Merge conflict in drivers/cdrom/Makefile
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (3282fe675b95 dm zoned: ignore last smaller runt zone)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (379777297cb1 mmc: dw_mmc: Convert timers to use timer_setup())
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (ae33a97e9227 md: be cautious about using ->curr_resync_completed for ->recovery_offset)
Merging mfd/for-mfd-next (9a43206bffe8 mfd: axp20x: Add axp20x-regulator cell for AXP813)
Merging backlight/for-backlight-next (5158cc2d4eca backlight: tps65217_bl: Remove unnecessary default brightness check)
Merging battery/for-next (0b07194bb55e Linux 4.14-rc7)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f9f5357f6bdc Merge remote-tracking branches 'regulator/topic/da9211' and 'regulator/topic/pfuze100' into regulator-next)
Merging security/next-testing (d6d80cb57be4 Smack: Base support for overlayfs)
Merging integrity/next (e87dafe70acc ima: Remove redundant conditional operator)
CONFLICT (content): Merge conflict in Documentation/ABI/testing/evm
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (5794ed762ac2 selinux: remove extraneous initialization of slots_used and max_chain_len)
Merging tpmdd/next (9dd0ff974241 tpm: Update MAINTAINERS for Jason Gunthorpe)
CONFLICT (content): Merge conflict in include/linux/tpm_eventlog.h
Merging watchdog/master (4cb30b044a8f watchdog: mei_wdt: constify mei_cl_device_id)
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (537b559a6114 Merge branches 'vfio/fixes', 'vfio/platform', 'iommu/arm/smmu' and 'iommu/updates' into next-20171025)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (7dfecd0a6b9f Audit: remove unused audit_log_secctx function)
Merging devicetree/for-next (e45fe7f788dd scripts/dtc: Update to upstream version v1.4.5-6-gc1e55a5513e9)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
Merging mailbox/mailbox-for-next (22d28b0ffcf4 mailbox: Build Broadcom FlexRM driver as loadable module for iProc SOCs)
Merging spi/for-next (4acc94f2fdaa Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/slave', 'spi/topic/spreadtrum' and 'spi/topic/tegra114' into spi-next)
Merging tip/auto-latest (4f0aa3f0c451 Merge branch 'linus')
CONFLICT (modify/delete): sound/oss/uart6850.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of sound/oss/uart6850.c left in tree.
CONFLICT (modify/delete): sound/oss/sys_timer.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of sound/oss/sys_timer.c left in tree.
CONFLICT (modify/delete): sound/oss/soundcard.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of sound/oss/soundcard.c left in tree.
CONFLICT (modify/delete): sound/oss/midibuf.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of sound/oss/midibuf.c left in tree.
CONFLICT (content): Merge conflict in net/ipv4/tcp_output.c
CONFLICT (content): Merge conflict in kernel/trace/bpf_trace.c
CONFLICT (content): Merge conflict in kernel/events/core.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/hfi1/file_ops.c
CONFLICT (content): Merge conflict in drivers/idle/intel_idle.c
CONFLICT (content): Merge conflict in drivers/block/amiflop.c
CONFLICT (content): Merge conflict in arch/s390/lib/spinlock.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/spinlock.h
CONFLICT (modify/delete): arch/s390/include/asm/rwsem.h deleted in HEAD and modified in tip/auto-latest. Version tip/auto-latest of arch/s390/include/asm/rwsem.h left in tree.
CONFLICT (content): Merge conflict in arch/powerpc/mm/numa.c
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
$ git rm -f arch/s390/include/asm/rwsem.h sound/oss/midibuf.c sound/oss/soundcard.c sound/oss/sys_timer.c sound/oss/uart6850.c
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (a8e9b186f153 EDAC, sb_edac: Fix missing break in switch)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a96a5037ed0f tracing, thermal: Hide cpu cooling trace events when not in use)
Merging rcu/rcu/next (e8c9900b339c rcu: Account for rcu_all_qs() in cond_resched())
Merging kvm/linux-next (6d6ab940dc8b Merge branch 'kvm-ppc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (abf14ccc8fb4 KVM: arm/arm64: fix the incompatible matching for external abort)
CONFLICT (content): Merge conflict in drivers/irqchip/irq-gic.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/inject_fault.c
CONFLICT (content): Merge conflict in arch/arm/kvm/emulate.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (c01015091a77 KVM: PPC: Book3S HV: Run HPT guests on POWER9 radix hosts)
Merging kvms390/next (8a3175a917cf KVM: s390: vsie: use common code functions for pinning)
Merging xen-tip/linux-next (6f0e8bf16730 xen: support 52 bit physical addresses in pv guests)
Merging percpu/for-next (438a50618095 percpu: don't forget to free the temporary struct pcpu_alloc_info)
Merging workqueues/for-next (2ce4badf4315 Merge branch 'for-4.15' into for-next)
Merging drivers-x86/for-next (d45eedd5c006 platform/x86: intel_pmc_ipc: Use spin_lock to protect GCR updates)
CONFLICT (content): Merge conflict in Documentation/admin-guide/thunderbolt.rst
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (8635d6b3afe6 dt-bindings: hsi: add omap4 hsi controller bindings)
Merging leds/for-next (f2ea85d760fb leds: lp55xx: fix spelling mistake: 'cound' -> 'could')
Merging ipmi/for-next (71c07ce42ccc ipmi_si_platform: Fix typo in parameter description)
Merging driver-core/driver-core-next (2ec161501798 driver core: Move device_links_purge() after bus_remove_device())
Merging usb/usb-next (a0fea6027f19 USB: Add delay-init quirk for Corsair K70 LUX keyboards)
Merging usb-gadget/next (ce2b21a4e5ce usb: dwc2: Fix UDC state tracking)
Merging usb-serial/usb-next (7c36e6e14da5 USB: serial: f81534: implement break control)
Merging usb-chipidea-next/ci-for-usb-next (2a53e060a053 usb: chipidea: fix trivial typo in Kconfig)
Merging phy-next/next (36914111e682 drivers: phy: add calibrate method)
Merging tty/tty-next (9ce99a3a9284 tty: serial: imx: remove dead code imx_dma_rxint)
Merging char-misc/char-misc-next (e9c16affe064 drivers/pcmcia: omap1: Fix error in automated timer conversion)
CONFLICT (content): Merge conflict in drivers/pcmcia/omap_cf.c
CONFLICT (content): Merge conflict in drivers/misc/lkdtm_core.c
Merging extcon/extcon-next (4a4a87146a07 extcon: max77843: Add support for SmartDock accessory)
Merging staging/staging-next (4b2d9fe87950 staging: fsl-dpaa2/eth: Extra headroom in RX buffers)
CONFLICT (modify/delete): drivers/staging/vme/devices/vme_pio2.h deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/vme/devices/vme_pio2.h left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
CONFLICT (content): Merge conflict in drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c
$ git rm -f drivers/staging/vme/devices/vme_pio2.h
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (cb6a84d840b1 Merge branch 'for-linus' into next)
Merging cgroup/for-next (7674045b516f Merge branch 'for-4.15' into for-next)
CONFLICT (modify/delete): kernel/sched/cpuacct.h deleted in cgroup/for-next and modified in HEAD. Version HEAD of kernel/sched/cpuacct.h left in tree.
CONFLICT (content): Merge conflict in kernel/cgroup/cgroup.c
CONFLICT (content): Merge conflict in kernel/cgroup/Makefile
$ git rm -f kernel/sched/cpuacct.h
Merging scsi/for-next (1c356ec5e932 scsi: lpfc: fix kzalloc-simple.cocci warnings)
CONFLICT (content): Merge conflict in include/scsi/scsi_devinfo.h
Merging scsi-mkp/for-next (1c356ec5e932 scsi: lpfc: fix kzalloc-simple.cocci warnings)
Merging target-updates/for-next (17c45b90061a iSCSI-target: Use common error handling code in iscsi_decode_text_input())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (844a47c82baa Merge branch 'for-4.15' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ac7380709f65 vhost: fix end of range for access_ok)
Merging rpmsg/for-next (cad7f2afe66c Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b53b8300bf8e pinctrl: armada-37xx: remove unused variable)
CONFLICT (content): Merge conflict in MAINTAINERS
Applying: gpio: uniphier: merge fix for "Update irq_domain_ops.activate() signature"
Merging pinctrl/for-next (09299176b141 pinctrl: qcom: spmi-gpio: Add pmi8994 gpio support)
Applying: Revert "regmap: Add a config option for hwspinlock"
Applying: Revert "regmap: Clean up hwspinlock on regmap exit"
Applying: Revert "regmap: Also protect hwspinlock in error handling path"
Applying: Revert "regmap: Add hardware spinlock support"
Merging pinctrl-samsung/for-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging pwm/for-next (7755daf5e7e8 Merge branch 'for-4.14/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (3fda0e737e90 userns: Simplify insert_extent)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (2329c02eed5a selftests/ftrace: Introduce exit_pass and exit_fail)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (3602b15a20a6 Merge branch 'for-4.15/callbacks' into for-next)
Merging coresight/next (9a937c2f634e doc: coresight: correct usage for disabling idle states)
Merging rtc/rtc-next (afcaf5e02910 rtc: add support for NXP PCF85363 real-time clock)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (25e7798f20e6 Merge branch 'for-4.15/mapsync' into libnvdimm-for-next)
CONFLICT (content): Merge conflict in include/linux/iomap.h
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/dax.c
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (5b45b18ecf90 lkdtm: Update usercopy tests for whitelisting)
CONFLICT (content): Merge conflict in virt/kvm/kvm_main.c
Merging akpm-current/current (c72ff29931d5 sysvipc-make-get_maxid-o1-again-checkpatch-fixes)
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in mm/slab.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in include/uapi/linux/prctl.h
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/net/inet_sock.h
CONFLICT (content): Merge conflict in include/linux/slab.h
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/netronome/nfp/nfp_net_common.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
CONFLICT (content): Merge conflict in arch/x86/mm/kasan_init_64.c
CONFLICT (content): Merge conflict in Makefile
$ git checkout -b akpm remotes/origin/akpm/master
Applying: lib: optimize cpumask_next_and()
Applying: mm: add infrastructure for get_user_pages_fast() benchmarking
Applying: drivers/pcmcia/sa1111_badge4.c: avoid unused function warning
Applying: arch/ia64/include/asm/topology.h: remove unused parent_node() macro
Applying: arch/sh/include/asm/topology.h: remove unused parent_node() macro
Applying: arch/sparc/include/asm/topology_64.h: remove unused parent_node() macro
Applying: arch/tile/include/asm/topology.h: remove unused parent_node() macro  
Applying: include/asm-generic/topology.h: remove unused parent_node() macro
Applying: EXPERT Kconfig menu: fix broken EXPERT menu
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (ac238248abd0 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
Applying: Revert "lib: optimize cpumask_next_and()"
