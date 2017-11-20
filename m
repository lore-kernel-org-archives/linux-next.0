From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 20
Date: Mon, 20 Nov 2017 14:45:02 +1100
Message-ID: <20171120144502.3ac817da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Please do not add any v4.16 material to your linux-next included trees
until v4.15-rc1 has been released.

Changes since 20171117:

The akpm-current tree gained a build failure for which I applied a
fix patch.

Non-merge commits (relative to Linus' tree): 771
 803 files changed, 14490 insertions(+), 7172 deletions(-)

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

I am currently merging 271 trees (counting Linus' and 42 trees of bug
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
Merging origin/master (ed30b147e1f6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (bb3f38c3c5b7 kbuild: clang: fix build failures with sparse check)
Merging arc-current/for-curr (f3156851616b ARCv2: boot log: updates for HS48: dual-issue, ECC, Loop Buffer)
Merging arm-current/fixes (b9dd05c7002e ARM: 8720/1: ensure dump_instr() checks addr_limit)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (7ecb37f62fe5 powerpc/perf: Fix core-imc hotplug callback failure during imc initialization)
Merging sparc/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (b399a3944d53 r8169: use same RTL8111EVL green settings as in vendor driver)
Merging ipsec/master (94802151894d Revert "xfrm: Fix stack-out-of-bounds read in xfrm_state_find.")
Merging netfilter/master (7400bb4b5800 netfilter: nf_reject_ipv4: Fix use-after-free in send_reset)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (a6127b4440d1 Merge tag 'iwlwifi-for-kalle-2017-10-06' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (b39545684a90 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging sound-current/for-linus (c2432466f583 ALSA: hda: Fix too short HDMI/DP chmap reporting)
Merging pci-current/for-linus (1b6115fbe3b3 Merge tag 'pci-v4.15-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging driver-core.current/driver-core-linus (cf9b0772f2e4 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging tty.current/tty-linus (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging usb.current/usb-linus (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging usb-gadget-fixes/fixes (7c80f9e4a588 usb: usbtest: fix NULL pointer dereference)
Merging usb-serial-fixes/usb-linus (0b07194bb55e Linux 4.14-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (2fb850092fd9 phy: rockchip-typec: Check for errors from tcphy_phy_init())
Merging staging.current/staging-linus (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging char-misc.current/char-misc-linus (cf9b0772f2e4 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging input-current/for-linus (c25141062a82 Merge branch 'next' into for-linus)
Merging crypto-current/master (1d9ddde12e3c lib/mpi: call cond_resched() from mpi_powm() loop)
Merging ide/master (b671e1703394 PNP: ide: constify pnp_device_id)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (a323335e62cc selftests: lib.mk: print individual test results to console by default)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (8a5776a5f498 Linux 4.14-rc4)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (30b4e122d71c media: rc: sir_ir: detect presence of port)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bit compilation)
Merging mips-fixes/mips-fixes (b084116f8587 MIPS: AR7: Ensure that serial ports are properly set up)
Merging drm-intel-fixes/for-linux-next-fixes (423a8a942e95 drm/i915: Deconstruct struct sgt_dma initialiser)
Merging drm-misc-fixes/for-linux-next-fixes (9271c0ca573e drm/edid: Don't send non-zero YQ in AVI infoframe for HDMI 1.x sinks)
Merging kbuild/for-next (bd6783fe25ee kbuild: clean up *.i and *.lst patterns by make clean)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (c9eb6172c328 dma-mapping: turn dma_cache_sync into a dma_map_ops method)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (64dd3a7c8202 Merge remote-tracking branch 'reset/reset/arc' into for-next)
Merging arm/for-next (02196144a0a0 Merge branch 'devel-stable' into for-next)
Merging arm-perf/for-next/perf (07141342149a arm64: MAINTAINERS: hisi: Add HiSilicon SoC PMU support)
Merging arm-soc/for-next (ec9acd01224f arm-soc: document merges)
Merging actions/for-next (12742bb85a73 Merge branch 'v4.16/drivers' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (5751276f6bbf Merge branch 'v4.15/drivers' into tmp/aml-rebuild)
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
Merging arm64/for-next/core (6cfa7cc46b1a arm64: Make ARMV8_DEPRECATED depend on SYSCTL)
Merging clk/clk-next (36331641eb42 Merge branch 'clk-cleanup' into clk-next)
Merging clk-samsung/for-next (a4f21e9ceb5c clk: samsung: Remove obsolete clkdev alias support)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE definition)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (5e387199c17c m68k/defconfig: Update defconfigs for v4.14-rc7)
Merging m68knommu/for-next (c8b61d508986 m68k: add Sysam stmark2 open board support)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (dfe390a6d844 microblaze: add missing include to mmu_context_mm.h)
Merging mips/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for kernel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles only if initialized)
Merging openrisc/for-next (610f01b9a88a openrisc: fix possible deadlock scenario during timer sync)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (3ffa9d9e2a7c powerpc/64s: Fix Power9 DD2.0 workarounds by adding DD2.1 feature)
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging risc-v/for-linux-next (f0b0655e9936 Merge tag 'v4.14-rc8' into for-linux-next)
Merging s390/features (ab35727eb879 s390: remove unused parameter from Makefile)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (777a45b45866 arch/tile: Implement ->set_state_oneshot_stopped())
Merging uml/linux-next (aad882d04387 um: Use POSIX ucontext_t instead of struct ucontext)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (a0b3bc855374 fscrypt: lock mutex before checking for bounce page pool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (5226fcac7841 squashfs: Add zstd support)
Merging btrfs-kdave/for-next (32a7ff6bee24 Merge branch 'for-next-next-v4.15-20171115' into for-next-20171115)
Merging ceph/master (3cfa3b16dd2f rbd: default to single-major device number scheme)
Merging cifs/for-next (bbdaedfe3268 cifs: remove rfc1002 header from smb2_tree_connect_req)
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type const)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group structures.)
Merging ext3/for_next (b8b099238223 Pull error handling fix in dquot_file_open().)
Merging ext4/dev (232530680290 ext4: improve smp scalability for inode generation)
Merging f2fs/dev (18c83d2c0390 Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (88a96fa84186 jfs: Add missing NULL pointer check in __get_metapage)
Merging nfs/linux-next (bebc6082da0a Linux 4.14)
Merging nfsd/nfsd-next (ade7340656f3 lockd: fix "list_add double add" caused by legacy signal interface)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner when creating inodes)
Merging overlayfs/overlayfs-next (d9768076068f ovl: remove unneeded arg from ovl_verify_origin())
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (15e5178339b9 ubi: fastmap: Clean up the initialization of pointer p)
Merging xfs/for-next (2015a63dce8d xfs: fix type usage)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (7d8c430e7e22 Merge branch 'work.mount' into for-next)
CONFLICT (content): Merge conflict in fs/overlayfs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in fs/ext2/super.c
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/afs/super.c
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (9afe77ed849d added new line symbol after warning about dropped messages)
Merging pci/next (1b6115fbe3b3 Merge tag 'pci-v4.15-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging pstore/for-next/pstore (e19b205be43d Linux 4.14-rc2)
Merging hid/for-next (55c25de30188 Merge branch 'for-4.15/upstream' into for-next)
Merging i2c/i2c/for-next (a7d4b13f2a0d Merge branch 'i2c/for-4.15' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gracefully)
Merging hwmon-staging/hwmon-next (7adce422dd90 hwmon: (w83793) Remove duplicate NULL check)
Merging jc_docs/docs-next (47427379ea80 documentation: fb: update list of available compiled-in fonts)
Merging v4l-dvb/master (30b4e122d71c media: rc: sir_ir: detect presence of port)
Merging v4l-dvb-next/master (db6321a1af84 media: platform: VIDEO_QCOM_CAMSS should depend on HAS_DMA)
Merging fbdev/fbdev-for-next (5f215d252496 OMAPFB: prevent buffer underflow in omapfb_parse_vram_param())
CONFLICT (modify/delete): include/video/iga.h deleted in fbdev/fbdev-for-next and modified in HEAD. Version HEAD of include/video/iga.h left in tree.
$ git rm -f include/video/iga.h
Merging pm/linux-next (190b10367b0d Merge tag 'acpi-fix-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging cpupower/cpupower (dbdc468f35ee cpupower : Fix cpupower working when cpu0 is offline)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (9e66317d3c92 Linux 4.14-rc3)
Merging thermal/next (1e032393d968 Merge branches 'thermal-core', 'thermal-tool', 'thermal-intel' and 'thermal-soc' into next)
Merging thermal-soc/next (b2fd708ffa7f thermal: cpu_cooling: pr_err() strings should end with newlines)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging ipsec-next/master (2a171788ba7b Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging netfilter-next/master (347fdfb20f3f netfilter: nf_ct_h323: Extend nf_h323_error_boundary to work on bits as well)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET support)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (fdd0bd88ceae brcmfmac: add CLM download support)
Merging bluetooth/master (07f80e93c097 Bluetooth: hci_serdev: Init hci_uart proto_lock to avoid oops)
Merging mac80211-next/master (5048a9c329af mac80211: make __ieee80211_start_rx_ba_session static)
Merging rdma/for-next (4190b4e96954 RDMA/core: Rename kernel modify_cq to better describe its usage)
Merging gfs2/for-next (37cb8e1f8e10 Merge tag 'devicetree-for-4.15' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging mtd/master (36de80740008 mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user)
Merging l2-mtd/master (1530578abdac mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
Merging nand/nand/next (30863e38ebeb mtd: nand: Fix writing mtdoops to nand flash.)
Merging spi-nor/spi-nor/next (ec0a9f62b393 mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID)
Merging crypto/master (1d9ddde12e3c lib/mpi: call cond_resched() from mpi_powm() loop)
Merging drm/drm-next (f150891fd987 Merge tag 'exynos-drm-next-for-v4.15' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next)
Merging drm-amd-dc/drm-next-amd-dc-staging (49e37ba07a3a Merge branch 'drm-next-4.15-dc' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (e8c49fa96838 drm/i915: Reorder context-close to avoid calling i915_vma_close() under RCU)
Merging drm-tegra/drm/tegra/for-next (fb83be887390 drm/tegra: hdmi: Add cec-notifier support)
Merging drm-misc/for-linux-next (a9386bb05193 Merge tag 'drm-misc-next-fixes-2017-11-08' of git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (ad9d50c79043 drm/msm: free kstrdup'd cmdline)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (a593a185218e drm: gem_cma_helper.c: Allow importing of contiguous scatterlists with nents > 1)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (e64b9189bfd5 gpu: ipu-v3: ipu-dc: Remove unused 'di' variable)
Merging etnaviv/etnaviv/next (330b52bd9bba drm/etnaviv: short-circuit perfmon ioctls)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (a15fdc340db1 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/hwspinlock' into regmap-next)
Merging sound/for-next (c2432466f583 ALSA: hda: Fix too short HDMI/DP chmap reporting)
Merging sound-asoc/for-next (f63b2d19ffc8 Merge remote-tracking branches 'asoc/topic/amd', 'asoc/topic/nau8540', 'asoc/topic/nau8824' and 'asoc/topic/rt5514' into asoc-next)
Merging modules/modules-next (ece1996a21ee module: Do not paper over type mismatches in module_param_call())
Merging input/next (c1b433e04ef9 Input: gamecon - mark expected switch fall-throughs)
Merging block/for-next (50da70ed9c48 Merge branch 'for-4.15/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (74d4108d9e68 dm bufio: fix integer overflow when limiting maximum cache size)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (37cb8e1f8e10 Merge tag 'devicetree-for-4.15' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (0868b99c214a md: free unused memory after bitmap resize)
Merging mfd/for-mfd-next (b2596d703513 dt-bindings: mfd: mc13xxx: Remove obsolete property)
Merging backlight/for-backlight-next (29fae2c1db24 backlight: ili922x: Remove redundant variable len)
Merging battery/for-next (838c8afa67f9 power: supply: cpcap-charger: fix incorrect return value check)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (deed79e96bf9 Merge remote-tracking branch 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (e5729f86a298 ima: Remove redundant conditional operator)
Merging integrity/next (e87dafe70acc ima: Remove redundant conditional operator)
CONFLICT (content): Merge conflict in Documentation/ABI/testing/evm
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to prevent tainting)
Merging selinux/next (5794ed762ac2 selinux: remove extraneous initialization of slots_used and max_chain_len)
Merging tpmdd/next (f8b73d394f91 tpm: parse TPM event logs based on EFI table)
CONFLICT (content): Merge conflict in include/linux/tpm_eventlog.h
Merging watchdog/master (14807b07a7d8 watchdog: pcwd_usb: remove unneeded DRIVER_LICENSE #define)
Merging iommu/next (a593472591a5 Merge branches 'iommu/fixes', 'arm/omap', 'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (d04222983379 Merge branches 'iommu/arm/smmu', 'iommu/updates', 'vfio/fixes', 'vfio/platform', 'iommu/vt-d', 'iommu/ipmmu-vmsa' and 'iommu/iova' into next)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesystem magic)
Merging devicetree/for-next (c00758387c3d of: unittest: disable interrupts_property warning)
CONFLICT (content): Merge conflict in drivers/of/unittest-data/Makefile
Merging mailbox/mailbox-for-next (1f90a2162fb3 mailbox/omap: unregister mbox class)
Merging spi/for-next (431f98e3867f Merge remote-tracking branches 'spi/topic/fsl-dspi' and 'spi/topic/imx' into spi-next)
Merging tip/auto-latest (3a8691b77f05 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (8a7507eea818 clocksource/drivers/mips-gic-timer: Add fastpath for local timer updates)
CONFLICT (content): Merge conflict in drivers/clocksource/mips-gic-timer.c
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (a8e9b186f153 EDAC, sb_edac: Fix missing break in switch)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a96a5037ed0f tracing, thermal: Hide cpu cooling trace events when not in use)
Merging rcu/rcu/next (ad4e25a3a1a5 Merge branches 'doc.2017.10.20a', 'fixes.2017.10.19a', 'stall.2017.10.09a' and 'torture.2017.10.09a' into HEAD)
Merging kvm/linux-next (95bc2c5eda50 KVM: lapic: Fixup LDR on load in x2apic)
Merging kvm-arm/next (95b110ab9a09 KVM: arm/arm64: Don't queue VLPIs on INV/INVALL)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (432953b4455d KVM: PPC: Book3S HV: Cosmetic post-merge cleanups)
Merging kvms390/next (da9a1446d248 KVM: s390: provide a capability for AIS state migration)
Merging xen-tip/linux-next (646d944c2ef5 xen/pvcalls: fix potential endless loop in pvcalls-front.c)
Merging percpu/for-next (438a50618095 percpu: don't forget to free the temporary struct pcpu_alloc_info)
Merging workqueues/for-next (56e87829c90f Merge branch 'for-4.15' into for-next)
Merging drivers-x86/for-next (aaa40965d234 platform/x86: silead_dmi: Add silead, home-button property to some tablets)
Merging chrome-platform/for-next (859eb05676f6 platform/chrome: Use proper protocol transfer function)
Merging hsi/for-next (8635d6b3afe6 dt-bindings: hsi: add omap4 hsi controller bindings)
Merging leds/for-next (3faee9423ce0 leds: Add driver for PC Engines APU/APU2 LEDs)
Merging ipmi/for-next (942e1563654c ipmi: Stop timers before cleaning up the module)
Merging driver-core/driver-core-next (cf9b0772f2e4 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging usb/usb-next (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging usb-gadget/next (ce2b21a4e5ce usb: dwc2: Fix UDC state tracking)
Merging usb-serial/usb-next (7c36e6e14da5 USB: serial: f81534: implement break control)
Merging usb-chipidea-next/ci-for-usb-next (2a53e060a053 usb: chipidea: fix trivial typo in Kconfig)
Merging phy-next/next (36914111e682 drivers: phy: add calibrate method)
Merging tty/tty-next (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging char-misc/char-misc-next (cf9b0772f2e4 Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
Merging extcon/extcon-next (d1ee96706144 extcon: max8997: Delete unneeded initialization in max8997_muic_set_path())
Merging staging/staging-next (894025f24bd0 Merge tag 'usb-4.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (97d7fc7575b7 Merge branch 'for-linus' into next)
Merging cgroup/for-next (cefe6851e890 Merge branch 'for-4.15' into for-next)
Merging scsi/for-next (5ebde4694e3b scsi: Use 'blist_flags_t' for scsi_devinfo flags)
Merging scsi-mkp/for-next (341b2aa83368 scsi: lpfc: Fix hard lock up NMI in els timeout handling.)
Merging target-updates/for-next (97488c73190b tcmu: Add a missing unlock on an error path)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (d9d72867f89b Merge branch 'for-4.15' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c1d0c3f623ad fw_cfg: fix the command line module name)
Merging rpmsg/for-next (536de58841d8 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (24f0966c3e3f gpio: tegra186: Remove tegra186_gpio_lock_class)
Merging pinctrl/for-next (eeb690bceb1e pinctrl: gemini: Fix missing pad descriptions)
Merging pinctrl-samsung/for-next (2bd6bf03f4c1 Linux 4.14-rc1)
Merging pwm/for-next (f83e2ae2606b pwm: stm32-lp: Remove pwm_is_enabled() check before calling pwm_disable())
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (3fda0e737e90 userns: Simplify insert_extent)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (c3e0d179bff5 selftests: firmware: skip unsupported custom firmware fallback tests)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (3602b15a20a6 Merge branch 'for-4.15/callbacks' into for-next)
Merging coresight/next (1b551764f971 doc: coresight: correct usage for disabling idle states)
Merging rtc/rtc-next (b64bfde0ef60 rtc: sprd: Add Spreadtrum RTC driver)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (4247f24c2358 Merge branch 'for-4.15/dax' into libnvdimm-for-next)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (3889a28c449c lkdtm: Update usercopy tests for whitelisting)
CONFLICT (content): Merge conflict in virt/kvm/kvm_main.c
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in mm/slab.h
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/slab.h
Merging akpm-current/current (8f6f5b79e956 uapi: fix linux/sysctl.h userspace compilation errors)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: tools/objtool/Makefile: don't assume sync-check.sh is executable
Applying: sparc64: NG4 memset 32 bits overflow
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (4299aef0fad8 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
Applying: mm: fix device-dax pud write-faults triggered by get_user_pages() fix
