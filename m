From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 31
Date: Thu, 31 Aug 2017 19:01:11 +1000
Message-ID: <20170831190111.008cf3cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20170829:

The nfsd tree still had its build failure so I used the version from
next-20170824.

The pm tree gained a conflict against the dmi tree.

The sound-asoc tree lost its build failure.

The tip tree gained a conflict against the net-next tree.

The rcu tree lost its build failure.

The xen-tip tree gained conflicts against the tip tree.

The rpmsg tree gained a build failure so I used the version from
next-20170829.

The akpm-current tree gained a build failure due to an interaction with
the block tree for which I applied a merge fix patch.

The akpm tree lost 3 patches that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 10308
 10029 files changed, 529793 insertions(+), 189196 deletions(-)

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
and pseries_le_defconfig and i386, sparc and sparc64 defconfig. And
finally, a simple boot test of the powerpc pseries_le_defconfig kernel
in qemu.

Below is a summary of the state of the merge.

I am currently merging 268 trees (counting Linus' and 41 trees of bug
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
Merging origin/master (36fde05f3fb5 Merge branch 'for-4.13-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (64236e315955 kbuild: update comments of Makefile.asm-generic)
Merging arc-current/for-curr (e926d8fa5b68 ARC: Show fault information passed to show_kernel_fault_diag())
Merging arm-current/fixes (746a272e4414 ARM: 8692/1: mm: abort uaccess retries upon fatal signal)
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (1a92a80ad386 powerpc/mm: Ensure cpumask update is ordered)
Merging sparc/master (6470812e2226 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (183db4812794 drivers: net: xgene: Correct probe sequence handling)
Merging ipsec/master (931e79d7a7dd xfrm_user: fix info leak in build_aevent())
Merging netfilter/master (f63ae01d890c Merge tag 'wireless-drivers-for-davem-2017-08-25' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (10a54d8196d1 iwlwifi: pcie: move rx workqueue initialization to iwl_trans_pcie_alloc())
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (bcab3a6e64a9 ALSA: pcm: Fix power lock unbalance via OSS emulation)
Merging pci-current/for-linus (8e1101d25164 PCI/MSI: Don't warn when irq_create_affinity_masks() returns NULL)
Merging driver-core.current/driver-core-linus (ef954844c7ac Linux 4.13-rc5)
Merging tty.current/tty-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb.current/usb-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb-gadget-fixes/fixes (b7d44c36a6f6 usb: renesas_usbhs: gadget: fix unused-but-set-variable warning)
Merging usb-serial-fixes/usb-linus (fd1b8668af59 USB: serial: option: add D-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (cc4a41fe5541 Linux 4.13-rc7)
Merging char-misc.current/char-misc-linus (cc4a41fe5541 Linux 4.13-rc7)
Merging input-current/for-linus (3f9db52dc87b Input: synaptics - fix device info appearing different on reconnect)
Merging crypto-current/master (445a582738de crypto: algif_skcipher - only call put_page on referenced and used pages)
Merging ide/master (b671e1703394 PNP: ide: constify pnp_device_id)
Merging vfio-fixes/for-linus (796b755066dd vfio/pci: Fix handling of RC integrated endpoint PCIe capability size)
Merging kselftest-fixes/fixes (622b2fbe625b selftests: timers: freq-step: fix compile error)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode check)
Merging spi-nor-fixes/spi-nor/fixes (5771a8c08880 Linux v4.13-rc1)
Merging mfd-fixes/for-mfd-fixes (0f0fc5c09005 Revert "mfd: da9061: Fix to remove BBAT_CONT register from chip model")
Merging v4l-dvb-fixes/fixes (42b884edd6fa media: Revert "[media] v4l: async: make v4l2 coexist with devicetree nodes in a dt overlay")
Merging reset-fixes/reset/fixes (4497a224f759 reset: hi6220: Set module license so that it can be loaded)
Merging drm-intel-fixes/for-linux-next-fixes (cc4a41fe5541 Linux 4.13-rc7)
Merging drm-misc-fixes/for-linux-next-fixes (79964dbaf662 drm/bridge/sii8620: Fix memory corruption)
Merging kbuild/for-next (64236e315955 kbuild: update comments of Makefile.asm-generic)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (2fd523c57e52 dma-mapping: remove dma_alloc_noncoherent and dma_free_noncoherent)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (cc4a41fe5541 Linux 4.13-rc7)
Merging arm/for-next (67715a8964fc Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (e884f80cf2a7 arm64: perf: add support for Cortex-A35)
Merging arm-soc/for-next (7d55654e45a9 ARM: SoC: Document merges)
Merging actions/for-next (253d192bc4aa Merge branch 'v4.14/dt' into next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (b951316e2f33 Merge branch 'v4.14/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (0eead81e7847 Merge branches 'dt-for-v4.14' and 'defconfig-for-v4.14' into for-next)
Merging at91/at91-next (01c1fe77824e Merge branch 'at91-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (e83e7335d059 Merge branch anholt/bcm2835-defconfig-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (b90b6c45ff6b Merge branch 'zte/dt64' into for-next)
Merging keystone/next (f922ce7bbcf5 Merge branch 'for_4.14/keystone_dts' into next)
Merging mvebu/for-next (b9d2ea8a7107 Merge branch 'mvebu/dt' into mvebu/for-next)
Merging omap/for-next (a70cb93b6c2f Merge branch 'omap-for-v4.14/dt-v3' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging reset/reset/next (ac0c735ac3dd reset: uniphier: add analog amplifiers reset control)
Merging qcom/for-next (b212aba8f7bf Merge tag 'qcom-drivers-for-4.14' into final-for-sure-4.14)
Merging realtek/for-next (932a3d80019d Merge branch 'v4.14/dt64' into next)
Merging renesas/next (e6bf13206283 Merge branches 'arm64-dt-for-v4.14', 'dt-bindings-for-v4.14' and 'dt-for-v4.14' into next)
Merging rockchip/for-next (23b856f7af3c Merge branch 'v4.14-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (e6f2efc1a7da Merge branch 'next/soc' into for-next)
Merging sunxi/sunxi/for-next (edec428a0cd6 Merge branch 'sunxi/clk-for-4.14' into sunxi/for-next)
Merging tegra/for-next (b4aed883ebbe Merge branch for-4.14/arm/defconfig into for-next)
Merging arm64/for-next/core (d1be5c99a034 arm64: cleanup {COMPAT_,}SET_PERSONALITY() macro)
CONFLICT (content): Merge conflict in arch/arm64/kernel/fpsimd.c
Merging clk/clk-next (69a6beab0852 clk: msm8996-gcc: add missing smmu clks)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging clk-samsung/for-next (599cebea93e6 clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL)
Merging c6x/for-linux-next (636d42117800 c6x: Convert to using %pOF instead of full_name)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (558d5ad276c9 m68k/mac: Avoid soft-lockup warning after mach_power_off)
Merging m68knommu/for-next (8a1943492bd6 m68knommu: remove dead code)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (c775dffa004e Merge branches '4.13-fixes' and '4.14-features' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (fd46cd55fbc5 printk-formats.txt: Add examples for %pF and %pS usage)
Merging powerpc/next (d1d0d5ffb300 powerpc/64: Optimise set/clear of CTRL[RUN] (runlatch))
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D cache err)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (fa41ba0d08de s390/mm: avoid empty zero pages for KVM guests to avoid postcopy hangs)
Merging sparc-next/master (5bd0ea9107dc sparc64: vcc: make ktermios const)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspace addresses)
Merging tile/master (637f23abca87 tile: array underflow in setup_maxnodemem())
Merging uml/linux-next (2fb44600fe78 um: Fix check for _xstate for older hosts)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
CONFLICT (content): Merge conflict in arch/unicore32/include/asm/Kbuild
Merging xtensa/xtensa-for-next (271335b9726e Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (c250b7dd8e73 fscrypt: make ->dummy_context() return bool)
Merging befs/for-next (5771a8c08880 Linux v4.13-rc1)
Merging btrfs/next (ff108ad6692a crypto: Add zstd support)
Merging btrfs-kdave/for-next (d112b114021d Merge branch 'for-next-next-v4.14-20170822' into for-next-20170822)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/compression.h
Merging ceph/master (326547a91b3f ceph: fix readpage from fscache)
Merging cifs/for-next (6e3c1529c39e CIFS: remove endian related sparse warning)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (9b8d51f53833 Merge dnotify cleanup from branch 'for_next_testing' into for_next.)
Merging ext4/dev (42d4a99b09cb ext4: fix fault handling when mounted with -o dax,ro)
Merging f2fs/dev (774e1b78a0f9 f2fs: trigger fdatasync for non-atomic_write file)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9183976ef1c8 fuse: set mapping error in writepage_locked when it fails)
Merging jfs/jfs-next (f070e5ac9bc7 jfs: preserve i_mode if __jfs_set_acl() fails)
Merging nfs/linux-next (7af7a5963c40 Merge branch 'bugfixes')
Merging nfsd/nfsd-next (cafad00a8202 svcrdma: Clean up svc_rdma_build_read_chunk())
$ git reset --hard HEAD^
Merging next-20170824 version of nfsd
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (4edb83bb1041 ovl: constant d_ino for non-merge dirs)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (a6664433d383 ubifs: Set double hash cookie also for RENAME_EXCHANGE)
Merging xfs/for-next (538547735d0d xfs: replace xfs_qm_get_rtblks with a direct call to xfs_bmap_count_leaves)
Merging file-locks/locks-next (3953704fde7e locks: restore a warn for leaked locks on close)
Merging wberr/wberr-next (6d4b51241394 ecryptfs: convert to file_write_and_wait in ->fsync)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (077a1cc06f72 printk: Clean up do_syslog() error handling)
Merging pci/next (03e3e6914f44 Merge branch 'pci/virtualization' into next)
CONFLICT (content): Merge conflict in drivers/pci/probe.c
Merging pstore/for-next/pstore (c71b02e4d207 Revert "pstore: Honor dmesg_restrict sysctl on dmesg dumps")
Merging hid/for-next (abbc4db7a3a0 Merge branch 'for-4.14/upstream' into for-next)
Merging i2c/i2c/for-next (60999e2bb4ed Merge branch 'i2c/for-current' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (f996c4155d0d dmi: Mark all struct dmi_system_id instances const)
Merging hwmon-staging/hwmon-next (4e6fe29fb80b Merge remote-tracking branch 'lee/ib-mfd-hwmon-4.14' into hwmon-next)
Merging jc_docs/docs-next (7ee8adcf271a doc: Add documentation for the genalloc subsystem)
Merging v4l-dvb/master (9a45bf28bc39 media: max2175: Propagate the real error on devm_clk_get() failure)
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (aa55457d26ec omapfb: constify omap_video_timings structures)
Merging pm/linux-next (7f8122a4e8c8 Merge branch 'acpi-apei' into linux-next)
CONFLICT (content): Merge conflict in drivers/acpi/sbs.c
CONFLICT (content): Merge conflict in drivers/acpi/blacklist.c
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (1ef4bd4b47f3 Merge branch 'rockchip-rk3328' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (1c2428537241 dlm: use sock_create_lite inside tcp_accept_from_sock)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (d35d6e92caa0 hv_netvsc: Fix typos in the document of UDP hashing)
CONFLICT (content): Merge conflict in net/ipv6/ip6_fib.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/marvell/mvpp2.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328-evb.dts
Merging ipsec-next/master (901c5d2fbfcd ARM: dts: rk3228-evb: Fix the compiling error)
Merging netfilter-next/master (1aff64715edb netfilter: rt: account for tcp header size too)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (66a3479e1217 rsi: remove memset before memcpy)
Merging bluetooth/master (dbbccdc4ced0 Bluetooth: Add option for disabling legacy ioctl interfaces)
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (ea61e5a1c0bd Merge branch 'k.o/for-next' into k.o/for-next-merged)
Merging gfs2/for-next (d296b15ed582 gfs2: constify rhashtable_params)
Merging mtd/master (be3e83e3471c mtd: nand: atmel: Relax tADL_min constraint)
Merging l2-mtd/master (5ffa70b2a38b Merge tag 'v4.13-rc7' into mtd/next)
Merging nand/nand/next (2d2a2b8c080a mtd: nand: complain loudly when chip->bits_per_cell is not correctly initialized)
Merging spi-nor/spi-nor/next (18f7ce2f4495 mtd: spi-nor: add support for Microchip sst26vf064b QSPI memory)
Merging crypto/master (2d45a7e89833 crypto: af_alg - get_page upon reassignment to TX SGL)
Merging drm/drm-next (7846b12fe0b5 Merge branch 'drm-vmwgfx-next' of git://people.freedesktop.org/~syeh/repos_linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (fa3722f64966 drm/i915: Ignore duplicate VMA stored within the per-object handle LUT)
Merging drm-tegra/drm/tegra/for-next (65d5d30ccebd drm/tegra: trace: Fix path to include)
Merging drm-misc/for-linux-next (f44d85389e17 drm: rename u32 in __u32 in uapi)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (0502a625c2ee drm/msm: fix error path cleanup)
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (9303519985ed drm/imx: parallel-display: use correct connector enum)
Merging etnaviv/etnaviv/next (65375b873cb5 drm/etnaviv: switch GEM allocations to __GFP_RETRY_MAYFAIL)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (1874021ec3a8 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (0be04a695b8c ALSA: aoa: Convert to using %pOF instead of full_name)
Merging sound-asoc/for-next (e0cc95fab030 Merge remote-tracking branches 'asoc/topic/ux500', 'asoc/topic/wm8523', 'asoc/topic/wm8524', 'asoc/topic/wm8804' and 'asoc/topic/zte' into asoc-next)
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (9ee0a0558819 Input: PS/2 gpio bit banging driver for serio bus)
Merging block/for-next (67a0881c2598 Merge branch 'for-4.14/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (a027b2c5fed7 mmc: sdhci-xenon: add runtime pm support and reimplement standby)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (675dc2ccc27c raid5-ppl: Recovery support for multiple partial parity logs)
CONFLICT (content): Merge conflict in drivers/md/raid5-ppl.c
Merging mfd/for-mfd-next (f7e889c747eb mfd: Add ROHM BD9571MWV-M PMIC DT bindings)
Merging backlight/for-backlight-next (2606706e4d7b backlight: gpio_backlight: Delete pdata inversion)
Merging battery/for-next (18f8e6f695ac power: supply: bq24190_charger: Get input_current_limit from our supplier)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (fc8f93bdb1a0 Merge remote-tracking branches 'regulator/topic/qcom', 'regulator/topic/rc5t619' and 'regulator/topic/stm32-vref' into regulator-next)
Merging security/next (b6fd397b9008 apparmor: fix build failure on sparc caused by undeclared, signals)
Merging integrity/next (ed301d2614d2 ima: define "fs_unsafe" builtin policy)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (0c3014f22dec selinux: constify nf_hook_ops)
Merging tpmdd/next (05e79b68dfac tpm: migrate pubek_show to struct tpm_buf)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (78a74f034e5b Merge branches 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'arm/omap', 'arm/mediatek', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/vt-d', 'x86/amd', 's390' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (417fb50d5516 vfio: platform: constify amba_id)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (4070ad3e8ffa audit: update the function comments)
Merging devicetree/for-next (55e18b183351 virt: Convert to using %pOF instead of full_name)
Merging mailbox/mailbox-for-next (30e871dc417e mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll)
Merging spi/for-next (8273871c2979 Merge remote-tracking branches 'spi/topic/stm32', 'spi/topic/sunxi', 'spi/topic/tegra', 'spi/topic/tools' and 'spi/topic/xlp' into spi-next)
CONFLICT (content): Merge conflict in drivers/spi/spi.c
Merging tip/auto-latest (287945d1272e Merge branch 'perf/core' into auto-latest)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (content): Merge conflict in kernel/sched/fair.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbmem.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/cavium/liquidio/lio_main.c
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_types.h
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_proto.h
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_init.c
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/arm64-stub.c
Applying: liquidio: fix for merge with "smp: Avoid using two cache lines for struct call_single_data"
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (398443471f16 EDAC, mce_amd: Get rid of local var in amd_filter_mce())
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a7e52ad7ed82 ring-buffer: Have ring_buffer_alloc_read_page() return error on offline CPU)
Merging rcu/rcu/next (f95a66ebd95e torture: Provide TMPDIR environment variable to specify tmpdir)
CONFLICT (content): Merge conflict in arch/x86/mm/tlb.c
Merging kvm/linux-next (712b12d72451 kvm: nVMX: Validate the virtual-APIC address on nested VM-entry)
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging kvm-arm/next (012834a6cb74 KVM: arm/arm64: vgic: constify seq_operations and file_operations)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (4dafecde443a Merge remote-tracking branch 'remotes/powerpc/topic/ppc-kvm' into kvm-ppc-next)
Merging kvms390/next (1935222dc2f2 KVM: s390: we are always in czam mode)
Merging xen-tip/linux-next (9e0bbe46ce10 xen/mmu: set MMU_NORMAL_PT_UPDATE in remap_area_mfn_pte_fn)
CONFLICT (content): Merge conflict in arch/x86/xen/xen-asm_64.S
CONFLICT (content): Merge conflict in arch/x86/xen/xen-asm.S
CONFLICT (content): Merge conflict in arch/x86/xen/enlighten_pv.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/traps.h
CONFLICT (content): Merge conflict in arch/x86/entry/entry_64.S
Applying: xen: fix for "x86/traps: Simplify pagefault tracing logic"
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (f7db01f6cbac Merge branch 'for-4.14' into for-next)
Merging drivers-x86/for-next (c801603e6d0c platform/x86: intel-vbtn: match power button on press rather than release)
Merging chrome-platform/for-next (69237e85ece7 platform/chrome: cros_ec: register shutdown function for debugfs)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (1591caf2d5ea leds: pca955x: check for I2C errors)
Merging ipmi/for-next (7605d9cda4cc IPMI: make ipmi_poweroff_handler const)
Merging driver-core/driver-core-next (7521621e600a Do not disable driver and bus shutdown hook when class shutdown hook is set.)
Merging usb/usb-next (aa75936544fa usb: core: usbport: fix "BUG: key not in .data" when lockdep is enabled)
Merging usb-gadget/next (0852659ef071 usb: gadget: f_ncm/u_ether: Move 'SKB reserve' quirk setup to u_ether)
Merging usb-serial/usb-next (b5fdde28d4b7 USB: serial: option: simplify 3 D-Link device entries)
Merging usb-chipidea-next/ci-for-usb-next (dfebb5f43a78 usb: chipidea: Add support for Tegra20/30/114/124)
Merging phy-next/next (d9c51f4c53ae phy: brcm-sata: fix a timeout test in init)
Merging tty/tty-next (6ec6e80d1178 tty: hvcs: make ktermios const)
CONFLICT (content): Merge conflict in drivers/tty/serial/mux.c
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_gsc.c
Merging char-misc/char-misc-next (a49c3feeb84e mux: make device_type const)
Merging extcon/extcon-next (4243c408f740 extcon: max77693: Allow MHL attach notifier)
Merging staging/staging-next (423a8a6eac24 staging: comedi: coding style fixes found by checkpatch.pl)
CONFLICT (content): Merge conflict in tools/Makefile
Merging mux/for-next (aae4e7a8bc44 Linux 4.13-rc4)
Merging slave-dma/next (87f6b650718e Merge branch 'topic/altera' into next)
Merging cgroup/for-next (9c3bace4684b Merge branch 'for-4.13-fixes' into for-next)
Merging scsi/for-next (404ce00c072c Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/staging/unisys/visorhba/visorhba_main.c
Applying: Revert "scsi: qlogicpti: move bus reset to host reset"
Merging scsi-mkp/for-next (3515832cc614 scsi: qla2xxx: Reset the logo flag, after target re-login.)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (1a82b6650f30 Merge branch 'for-4.13-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ba74b6f7fcc0 virtio_pci: fix cpu affinity support)
Merging rpmsg/for-next (9fc1e9900f7b Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
$ git reset --hard HEAD^
Merging next-20170829 version of rpmsg
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
[master 132378b7ec0f] next-20170829/rpmsg
Merging gpio/for-next (2b40aada2e0c Merge branch 'devel' into for-next)
Merging pinctrl/for-next (e480b745386e pinctrl: intel: Add Intel Lewisburg GPIO support)
Merging pinctrl-samsung/for-next (bbed85f45b2b pinctrl: samsung: Remove unneeded local variable initialization)
Merging pwm/for-next (7755daf5e7e8 Merge branch 'for-4.14/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (64a76d0d64be signal: Fix sending signals with siginfo)
CONFLICT (content): Merge conflict in arch/mips/kernel/traps.c
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (72e5c740f633 random: reorder READ_ONCE() in get_random_uXX)
Merging aio/master (4c1d69950da4 fs: aio: fix the increment of aio-nr and counting against aio-max-nr)
Merging kselftest/next (4fecd0c8de50 selftest: Enhance kselftest_harness.h with a step mechanism)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (817ee52788a5 coresight: Extend the PIDR mask to cover relevant bits in PIDR2)
Merging rtc/rtc-next (888f94dcb76a rtc: sun6i: Add support for the external oscillator gate)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bbb3be170ac2 device-dax: fix sysfs duplicate warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb624a11ecd5 Merge branch 'for-next/secureexec' into for-next/kspp)
Merging akpm-current/current (0193a5e75472 ipc: optimize semget/shmget/msgget for lots of keys)
CONFLICT (content): Merge conflict in arch/parisc/include/uapi/asm/mman.h
Applying: zram-mm-vs-block
Applying: mm/hmm: struct hmm is only use by HMM mirror functionality v2 fix
Applying: fortify: use WARN instead of BUG for now fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/media/cec/cec-adap.c: fix build with gcc-4.4.4
Applying: fscache: fix fscache_objlist_show format processing
Applying: IB/mlx4: fix sprintf format warning
Applying: iopoll: avoid -Wint-in-bool-context warning
Applying: select: use get/put_timespec64
Applying: io_getevents: use timespec64 to represent timeouts
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: treewide: remove GFP_TEMPORARY allocation flag
Applying: treewide-remove-gfp_temporary-allocation-flag-fix
Applying: treewide-remove-gfp_temporary-allocation-flag-checkpatch-fixes
Applying: drm/i915: fix up for mm: treewide: remove GFP_TEMPORARY allocation flag
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (a804ca71d565 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
