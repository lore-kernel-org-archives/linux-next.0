From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Aug 28
Date: Mon, 28 Aug 2017 19:31:12 +1000
Message-ID: <20170828193112.14b662ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20170825:

The nfsd tree still had its build failure so I used the version from
next-20170824.

The net-next tree lost its build failure but gained a conflict against
the rockchip tree.

The l2-mtd tree gained a build failure due to an interaction with Linus'
tree for which I applied a merge fix patch.

The drm tree gained a conflict against Linus' tree.

The sound-asoc tree still had its build failure for which I reverted
a commit.

The tip tree gained a conflict against the spi tree.

The rcu tree gained a build failure so I used the version from
next-20170825.

The kvm tree gained a conflict against the tip tree.

The xen-tip tree gained a conflict against the tip tree.

The scsi tree gained a conflict against the staging tree and a build
failure for which I reverted a commit.

The akmp-current tree lost its build failure.

Non-merge commits (relative to Linus' tree): 9354
 9219 files changed, 501866 insertions(+), 179100 deletions(-)

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
Merging origin/master (0cc3b0ec23ce Clarify (and fix) MAX_LFS_FILESIZE macros)
Merging fixes/master (b4b8cbf679c4 Cavium CNN55XX: fix broken default Kconfig entry)
Merging kbuild-current/fixes (64236e315955 kbuild: update comments of Makefile.asm-generic)
Merging arc-current/for-curr (a8ec3ee861b6 arc: Mask individual IRQ lines during core INTC init)
Merging arm-current/fixes (1abd35023763 ARM: align .data section)
Merging m68k-current/for-linus (204a2be30a7a m68k: Remove ptrace_signal_deliver)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (1a92a80ad386 powerpc/mm: Ensure cpumask update is ordered)
Merging sparc/master (6470812e2226 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (f63ae01d890c Merge tag 'wireless-drivers-for-davem-2017-08-25' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers)
Merging ipsec/master (8a4b5784fac2 net: xfrm: don't double-hold dst when sk_policy in use.)
Merging netfilter/master (c26844eda9d4 netfilter: nf_tables: Fix nft limit burst handling)
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension hook mask only if set)
Merging wireless-drivers/master (10a54d8196d1 iwlwifi: pcie: move rx workqueue initialization to iwl_trans_pcie_alloc())
Merging mac80211/master (d7f13f745036 cfg80211: Validate frequencies nested in NL80211_ATTR_SCAN_FREQUENCIES)
Merging sound-current/for-linus (9ce76511b67b ASoC: rt5677: Reintroduce I2C device IDs)
Merging pci-current/for-linus (8e1101d25164 PCI/MSI: Don't warn when irq_create_affinity_masks() returns NULL)
Merging driver-core.current/driver-core-linus (ef954844c7ac Linux 4.13-rc5)
Merging tty.current/tty-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb.current/usb-linus (ef954844c7ac Linux 4.13-rc5)
Merging usb-gadget-fixes/fixes (b7d44c36a6f6 usb: renesas_usbhs: gadget: fix unused-but-set-variable warning)
Merging usb-serial-fixes/usb-linus (fd1b8668af59 USB: serial: option: add D-Link DWM-222 device ID)
Merging usb-chipidea-fixes/ci-for-usb-stable (cbb22ebcfb99 usb: chipidea: core: check before accessing ci_role in ci_role_show)
Merging phy/fixes (5771a8c08880 Linux v4.13-rc1)
Merging staging.current/staging-linus (2c68888f1d76 Merge tag 'fixes-for-4.13b' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (b2a6d1b999a4 ANDROID: binder: fix proc->tsk check.)
Merging input-current/for-linus (4a646580f793 Input: ALPS - fix two-finger scroll breakage in right side on ALPS touchpad)
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
Merging drm-intel-fixes/for-linux-next-fixes (e7c50e1156b6 Merge tag 'gvt-fixes-2017-08-23' of https://github.com/01org/gvt-linux into drm-intel-fixes)
Merging drm-misc-fixes/for-linux-next-fixes (79964dbaf662 drm/bridge/sii8620: Fix memory corruption)
Merging kbuild/for-next (64236e315955 kbuild: update comments of Makefile.asm-generic)
Merging uuid/for-next (832e4c83abc5 uuid: remove uuid_be)
Merging dma-mapping/for-next (ee7b1f31200d of: fix DMA mask generation)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (dd6f7edfa2c1 ARC: [plat-eznps] handle extra aux regs #2: kernel/entry exit)
Merging arm/for-next (862f4c2c1e06 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (e884f80cf2a7 arm64: perf: add support for Cortex-A35)
Merging arm-soc/for-next (8c1dc6aa36fd arm-soc: document merges)
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
Merging mvebu/for-next (2ca6aa7f6960 Merge branch 'mvebu/dt' into mvebu/for-next)
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
Merging m68knommu/for-next (ac54c6a0f0ce m68knommu: remove dead code)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (14ef905bb2ee microblaze: Fix MSR flags when returning from exception)
Merging mips/mips-for-linux-next (47184d3d0797 Merge branches '4.13-fixes', '4.13-fp-fixes' and '4.14-features' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (9d15eb228b10 openrisc: defconfig: Cleanup from old Kconfig options)
Merging parisc-hd/for-next (fd46cd55fbc5 printk-formats.txt: Add examples for %pF and %pS usage)
Merging powerpc/next (d1d0d5ffb300 powerpc/64: Optimise set/clear of CTRL[RUN] (runlatch))
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (76b22affdf15 s390/uaccess: avoid mvcos jump label)
Merging sparc-next/master (cc324d1a3e35 Merge branch 'sparc64-16gb-hugepages')
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
Merging cifs/for-next (1758a3d2ba3b CIFS: remove endian related sparse warning)
Merging configfs/for-next (19e72d3abb63 configfs: Introduce config_item_get_unless_zero())
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (77405e51fa21 Merge quota scalability patches)
Merging ext4/dev (42d4a99b09cb ext4: fix fault handling when mounted with -o dax,ro)
Merging f2fs/dev (a36c106dffb6 f2fs: use printk_ratelimited for f2fs_msg)
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
Merging xfs/for-next (e255b13d466b xfs: evict all inodes involved with log redo item)
Merging file-locks/locks-next (3953704fde7e locks: restore a warn for leaked locks on close)
Merging wberr/wberr-next (6d4b51241394 ecryptfs: convert to file_write_and_wait in ->fsync)
Merging vfs/for-next (66bf97967726 annotate RWF_... flags)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (077a1cc06f72 printk: Clean up do_syslog() error handling)
Merging pci/next (4da046ce92e8 Merge branch 'pci/virtualization' into next)
CONFLICT (content): Merge conflict in drivers/pci/probe.c
Merging pstore/for-next/pstore (c71b02e4d207 Revert "pstore: Honor dmesg_restrict sysctl on dmesg dumps")
Merging hid/for-next (abbc4db7a3a0 Merge branch 'for-4.14/upstream' into for-next)
Merging i2c/i2c/for-next (264170d12d9c Merge branch 'i2c/for-4.14' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (f996c4155d0d dmi: Mark all struct dmi_system_id instances const)
Merging hwmon-staging/hwmon-next (d5553c26198f hwmon: (aspeed-pwm) add THERMAL dependency)
Merging jc_docs/docs-next (c1aa3871fa0f Documentation: stable-kernel-rules: fix broken git urls)
Merging v4l-dvb/master (9a45bf28bc39 media: max2175: Propagate the real error on devm_clk_get() failure)
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
Merging v4l-dvb-next/master (474dfccf3685 media: svg: avoid too long lines)
Merging fbdev/fbdev-for-next (aa55457d26ec omapfb: constify omap_video_timings structures)
Merging pm/linux-next (eeba01288a54 Merge branch 'acpi-properties-fix' into linux-next)
CONFLICT (content): Merge conflict in drivers/acpi/sbs.c
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (1ef4bd4b47f3 Merge branch 'rockchip-rk3328' into next)
Merging thermal-soc/next (aa647852c32a Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (1c2428537241 dlm: use sock_create_lite inside tcp_accept_from_sock)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (901c5d2fbfcd ARM: dts: rk3228-evb: Fix the compiling error)
CONFLICT (content): Merge conflict in net/ipv6/ip6_fib.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/rockchip/rk3328-evb.dts
Merging ipsec-next/master (60890e046081 gre: remove duplicated assignment of iph)
Merging netfilter-next/master (c816c2558ed4 netfilter: ebtables: fix indent on if statements)
Merging nfc-next/master (bd751808f9ff NFC: trf7970a: Correct register settings for 27MHz clock)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[' error.)
Merging wireless-drivers-next/master (5307eca13624 Merge git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git)
Merging bluetooth/master (96a1c173ea65 ieee802154: 6lowpan: make header_ops const)
Merging mac80211-next/master (3dc02251f43f Merge branch 'skb-accessor-cleanups')
Merging rdma/for-next (ea61e5a1c0bd Merge branch 'k.o/for-next' into k.o/for-next-merged)
Merging gfs2/for-next (27c3b415f6ff GFS2: Fix up some sparse warnings)
Merging mtd/master (be3e83e3471c mtd: nand: atmel: Relax tADL_min constraint)
Merging l2-mtd/master (75864b301c91 mtd: make device_type const)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Applying: fix merge of l2-mtd tree
Merging nand/nand/next (a75d6a4cebcc Merge branch 'nand/rename-header-file' of git://git.infradead.org/l2-mtd into nand/next)
Merging spi-nor/spi-nor/next (18f7ce2f4495 mtd: spi-nor: add support for Microchip sst26vf064b QSPI memory)
Merging crypto/master (2d45a7e89833 crypto: af_alg - get_page upon reassignment to TX SGL)
Merging drm/drm-next (7c0059dd832c Merge branch 'linux-4.14' of git://github.com/skeggsb/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (908b6e6e8ab4 drm/i915: Quietly cancel FBC activation if CRTC is turned off before worker)
Merging drm-tegra/drm/tegra/for-next (65d5d30ccebd drm/tegra: trace: Fix path to include)
Merging drm-misc/for-linux-next (f44d85389e17 drm: rename u32 in __u32 in uapi)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (0502a625c2ee drm/msm: fix error path cleanup)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
Merging hdlcd/for-upstream/hdlcd (fee4964f0a6c drm/arm: hdlcd: remove unused variables)
Merging mali-dp/for-upstream/mali-dp (e46477b8f23c drm: mali-dp: Restore commit_tail behaviour to the runtime_pm friendly version.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/drm-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (9303519985ed drm/imx: parallel-display: use correct connector enum)
Merging etnaviv/etnaviv/next (65375b873cb5 drm/etnaviv: switch GEM allocations to __GFP_RETRY_MAYFAIL)
Merging kconfig/for-next (6f7da290413b Linux 4.12)
Merging regmap/for-next (1874021ec3a8 Merge remote-tracking branches 'regmap/topic/const' and 'regmap/topic/namespace' into regmap-next)
Merging sound/for-next (e6b4c525d94e ALSA: pcm: Correct broken procfs set up)
Merging sound-asoc/for-next (cfc9a6b9fc1e Merge remote-tracking branches 'asoc/topic/wm8524', 'asoc/topic/wm8804' and 'asoc/topic/zte' into asoc-next)
Applying: Revert "ASoC: rt5514: expose Hotword Model control"
Merging modules/modules-next (0bf8bf50eddc module: Remove const attribute from alias for MODULE_DEVICE_TABLE)
Merging input/next (b54bf2fd156c Input: ambakmi - constify amba_id)
Merging block/for-next (9cc5e072cbf3 Merge branch 'for-4.14/block' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (2298b6212f1c dm ioctl: constify ioctl lookup table)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (93cbcc68719b mmc: meson-gx: clean up some constants)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (8a8e6f84ad10 md/raid0: attach correct cgroup info in bio)
Merging mfd/for-mfd-next (f7e889c747eb mfd: Add ROHM BD9571MWV-M PMIC DT bindings)
Merging backlight/for-backlight-next (2606706e4d7b backlight: gpio_backlight: Delete pdata inversion)
Merging battery/for-next (810e006a82c9 power: supply: lp8788: Make several arrays static const * const)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (90607532ac04 Merge remote-tracking branches 'regulator/topic/mtk', 'regulator/topic/pwm', 'regulator/topic/qcom' and 'regulator/topic/rc5t619' into regulator-next)
Merging security/next (b6fd397b9008 apparmor: fix build failure on sparc caused by undeclared, signals)
Merging integrity/next (ed301d2614d2 ima: define "fs_unsafe" builtin policy)
Merging keys/keys-next (8ab2a6905b28 KEYS: Add documentation for asymmetric keyring restrictions)
Merging selinux/next (901ef845fa24 selinux: allow per-file labeling for cgroupfs)
Merging tpmdd/next (05e79b68dfac tpm: migrate pubek_show to struct tpm_buf)
Merging watchdog/master (c013b65ad8a1 watchdog: introduce watchdog_worker_should_ping helper)
Merging iommu/next (b2f34dad02c7 Merge branches 'iommu/fixes', 'arm/exynos', 'arm/renesas', 'arm/rockchip', 'arm/omap', 'arm/mediatek', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/vt-d', 'x86/amd', 's390' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (f203f7f1dbb2 vfio/type1: Give hardware MSI regions precedence)
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (4070ad3e8ffa audit: update the function comments)
Merging devicetree/for-next (6d7e3bf8d12c of: Use PLATFORM_DEVID_NONE definition)
Merging mailbox/mailbox-for-next (25bfee16d5a3 mailbox: Introduce Qualcomm APCS IPC driver)
Merging spi/for-next (8273871c2979 Merge remote-tracking branches 'spi/topic/stm32', 'spi/topic/sunxi', 'spi/topic/tegra', 'spi/topic/tools' and 'spi/topic/xlp' into spi-next)
CONFLICT (content): Merge conflict in drivers/spi/spi.c
Merging tip/auto-latest (84472d8795bf Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in kernel/sched/fair.c
CONFLICT (content): Merge conflict in drivers/video/fbdev/core/fbmem.c
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_types.h
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_proto.h
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_init.c
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/libstub/arm64-stub.c
Merging clockevents/clockevents/next (2287d8664fe7 timers: Make the cpu base lock raw)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (398443471f16 EDAC, mce_amd: Get rid of local var in amd_filter_mce())
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a7e52ad7ed82 ring-buffer: Have ring_buffer_alloc_read_page() return error on offline CPU)
Merging rcu/rcu/next (f0909808dc46 rcutorture: Add interrupt-disable capability to stall-warning tests)
CONFLICT (content): Merge conflict in arch/x86/mm/tlb.c
$ git reset --hard HEAD^
Merging next-20170825 version of rcu
CONFLICT (content): Merge conflict in arch/x86/mm/tlb.c
[master 95de37d298de] next-20170825/rcu
Merging kvm/linux-next (712b12d72451 kvm: nVMX: Validate the virtual-APIC address on nested VM-entry)
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Merging kvm-arm/next (012834a6cb74 KVM: arm/arm64: vgic: constify seq_operations and file_operations)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (8b24e69fc47e KVM: PPC: Book3S HV: Close race with testing for signals on guest entry)
Merging kvms390/next (68e26083585b KVM: s390: sthyi: remove invalid guest write access)
Merging xen-tip/linux-next (fc0bf7ea44cf xen: Don't try to call xen_alloc_p2m_entry() on autotranslating guests)
CONFLICT (content): Merge conflict in arch/x86/xen/xen-asm_64.S
CONFLICT (content): Merge conflict in arch/x86/xen/xen-asm.S
CONFLICT (content): Merge conflict in arch/x86/entry/entry_64.S
Merging percpu/for-next (5e81ee3e6a79 percpu: update header to contain bitmap allocator explanation.)
Merging workqueues/for-next (f7db01f6cbac Merge branch 'for-4.14' into for-next)
Merging drivers-x86/for-next (c801603e6d0c platform/x86: intel-vbtn: match power button on press rather than release)
Merging chrome-platform/for-next (69237e85ece7 platform/chrome: cros_ec: register shutdown function for debugfs)
Merging hsi/for-next (67ddd75771b6 HSI: core: Use kcalloc() in two functions)
Merging leds/for-next (c97598467893 leds: lp8501: make several arrays static const)
Merging ipmi/for-next (1d51142219c3 ipmi: fix unsigned long underflow)
Merging driver-core/driver-core-next (f75f6ff2eaa6 Merge 4.13-rc5 into driver-core-next)
Merging usb/usb-next (e593beaf60e0 phy: ralink: fix 64-bit build warning)
Merging usb-gadget/next (0852659ef071 usb: gadget: f_ncm/u_ether: Move 'SKB reserve' quirk setup to u_ether)
Merging usb-serial/usb-next (5771a8c08880 Linux v4.13-rc1)
Merging usb-chipidea-next/ci-for-usb-next (dfebb5f43a78 usb: chipidea: Add support for Tegra20/30/114/124)
Merging phy-next/next (d9c51f4c53ae phy: brcm-sata: fix a timeout test in init)
Merging tty/tty-next (cf0a1579dda4 Merge 4.13-rc5 into tty-next)
Merging char-misc/char-misc-next (4f9adc8f91ba binder: fix incorrect cmd to binder_stat_br)
Merging extcon/extcon-next (4243c408f740 extcon: max77693: Allow MHL attach notifier)
Merging staging/staging-next (4d506758295a staging: rtl8723bs: remove null check before kfree)
CONFLICT (content): Merge conflict in tools/Makefile
Merging mux/for-next (fabf08a0cd63 i2c: mux: i2c-arb-gpio-challenge: allow compiling w/o OF support)
Merging slave-dma/next (70aae0b95256 Merge branch 'topic/dmatest' into next)
Merging cgroup/for-next (9c3bace4684b Merge branch 'for-4.13-fixes' into for-next)
Merging scsi/for-next (371e9fb677e2 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/staging/unisys/visorhba/visorhba_main.c
Merging scsi-mkp/for-next (5fe5a6c9acc0 scsi: lpfc: avoid false-positive gcc-8 warning)
Merging target-updates/for-next (04229774f692 tcmu: Oops in unmap_thread_fn())
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging libata/for-next (b82c949dbea2 Merge branch 'for-4.13-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (ba74b6f7fcc0 virtio_pci: fix cpu affinity support)
Merging rpmsg/for-next (3f3a62b28e7a Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
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
Merging kselftest/next (1f87c7c15d77 selftests: lib.mk: change RUN_TESTS to print messages in TAP13 format)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (26d8d1e9bb48 Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging coresight/next (6d34a5f3806d coresight: STM: Clean up __iomem type usage)
Merging rtc/rtc-next (888f94dcb76a rtc: sun6i: Add support for the external oscillator gate)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (bbb3be170ac2 device-dax: fix sysfs duplicate warnings)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging kspp/for-next/kspp (cb624a11ecd5 Merge branch 'for-next/secureexec' into for-next/kspp)
Applying: Revert "scsi: qlogicpti: move bus reset to host reset"
Merging akpm-current/current (0193a5e75472 ipc: optimize semget/shmget/msgget for lots of keys)
CONFLICT (content): Merge conflict in arch/parisc/include/uapi/asm/mman.h
Applying: zram-mm-vs-block
Applying: mm/hmm: struct hmm is only use by HMM mirror functionality v2 fix
$ git checkout -b akpm remotes/origin/akpm/master
Applying: fs/select.c: fix memory corruption in compat_get_fd_set()
Applying: drivers/acpi/nfit/core.c: fix the abuse of COMPLETION_INITIALIZER_ONSTACK()
Applying: include/linux/completion.h: avoid unnecessary stack allocation for COMPLETION_INITIALIZER_ONSTACK()
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
Merging akpm/master (ff34666b7124 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
