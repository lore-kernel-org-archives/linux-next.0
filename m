From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 1
Date: Mon, 1 May 2017 16:44:13 +1000
Message-ID: <20170501164413.0a220678@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752312AbdEAGoR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 02:44:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Please do not add any v4.13 destined material in your linux-next
included branches until after v4.12-rc1 has been released.

Changes since 20170428:

The spi tree gained a conflict against the pm tree.

The rcu tree gained a conflict against the ftrace tree.

The staging tree gained a conflict against the usb tree and a build
failure due to an interaction with the mac80211-next tree for which I
applied a merge fix patch.

Non-merge commits (relative to Linus' tree): 12193
 11126 files changed, 1247850 insertions(+), 227602 deletions(-)

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
and pseries_le_defconfig and i386, sparc and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 258 trees (counting Linus' and 37 trees of bug
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
Merging origin/master (97ce89f8a4eb Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (9be3213b14d4 gconfig: remove misleading parentheses around a condition)
Merging arc-current/for-curr (36b5a5152119 arc: axs10x: Fix ARC PGU default clock frequency)
Merging arm-current/fixes (6d8059493691 ARM: 8670/1: V7M: Do not corrupt vector table around v7m_invalidate_l1 call)
Merging m68k-current/for-linus (e3b1ebd67387 m68k: Wire up statx)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (be5c5e843c4a powerpc/64: Fix HMI exception on LE with CONFIG_RELOCATABLE=y)
Merging sparc/master (f83246089ca0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (0060e79a1f52 Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux)
Merging ipsec/master (cfcf99f987ba xfrm: fix GRO for !CONFIG_NETFILTER)
Merging netfilter/master (1519fccb3437 netfilter: update MAINTAINERS file)
Merging ipvs/master (1442f6f7c1b7 ipvs: explicitly forbid ipv6 service/dest creation if ipv6 mod is disabled)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (f83246089ca0 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc)
Merging sound-current/for-linus (d4a2fbcee0c8 Merge tag 'asoc-fix-v4.11-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging pci-current/for-linus (b9c1153f7a9c PCI: hisi: Fix DT binding (hisi-pcie-almost-ecam))
Merging driver-core.current/driver-core-linus (39da7c509acf Linux 4.11-rc6)
Merging tty.current/tty-linus (4f7d029b9bf0 Linux 4.11-rc7)
Merging usb.current/usb-linus (a71c9a1c779f Linux 4.11-rc5)
Merging usb-gadget-fixes/fixes (25cd9721c2b1 usb: gadget: f_hid: fix: Don't access hidg->req without spinlock held)
Merging usb-serial-fixes/usb-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (1a09b6a7c10e phy: qcom-usb-hs: Add depends on EXTCON)
Merging staging.current/staging-linus (39da7c509acf Linux 4.11-rc6)
Merging char-misc.current/char-misc-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging input-current/for-linus (7c5bb4ac2b76 Input: i8042 - add Clevo P650RS to the i8042 reset list)
Merging crypto-current/master (e6534aebb26e crypto: algif_aead - Fix bogus request dereference in completion function)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (5a7ad1146caa Linux 4.11-rc8)
Merging drm-misc-fixes/for-linux-next-fixes (0c45b36f8acc drm/udl: Fix unaligned memory access in udl_render_hline)
Merging kbuild/for-next (5a692d46f61b Merge branches 'kbuild' and 'misc' into for-next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (c92a90a5060a Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f00fa5f4163b arm64: pmuv3: use arm_pmu ACPI framework)
Merging arm-soc/for-next (47ee9017f4d1 Merge branches 'next/arm64', 'next/drivers', 'next/dt' and 'next/dt64' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r7s72100.dtsi
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (715dcd206041 Merge branch 'v4.12/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (ce60fdaa7e9e Merge remote-tracking branch 'alex_korg/at91-dt' into at91-next)
Merging bcm2835/for-next (7ea6e490ba7f Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (990df0480610 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (4495c08e8472 Linux 4.11-rc2)
Merging mvebu/for-next (4cfb1f480e35 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (5a0bbcf7ab0f Merge branch 'omap-for-v4.12/defconfig' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (9f514b0f9cf3 Merge branch 'drivers-for-4.12' into all-for-4.12)
Merging renesas/next (c8906b237adf Merge branch 'fixes-for-v4.12' into next)
Merging rockchip/for-next (b1e842489772 Merge branch 'v4.12-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (f4fcaa6cec04 Merge branch 'next/dt64' into for-next)
Merging sunxi/sunxi/for-next (5675caea945d Merge branches 'sunxi/clk-for-4.12', 'sunxi/dt-for-4.12' and 'sunxi/fixes-for-4.11' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (2f9a0bec6597 arm64: Print DT machine model in setup_machine_fdt())
Merging clk/clk-next (f792c7ee65a5 clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging m68knommu/for-next (99a2c395541f m68k/coldfire/pit: set ->min_delta_ticks and ->max_delta_ticks)
Merging metag/for-next (d3ba2e922d4d metag/usercopy: Add 64-bit get_user support)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (b153c82756e9 Merge branch '4.11-fixes' into mips-for-linux-next)
Merging nios2/for-next (d8f347ba35cf nios2: enable earlycon support)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (4f7d029b9bf0 Linux 4.11-rc7)
Merging powerpc/next (096ff2ddba83 powerpc/ftrace/64: Split further based on -mprofile-kernel)
Merging fsl/next (e21c7316d8dd soc/fsl/qbman: Disable IRQs for deferred QBMan work)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (d0790fb6e5bc Merge branch 's390forkvm' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into features)
CONFLICT (content): Merge conflict in arch/s390/include/uapi/asm/Kbuild
Merging sparc-next/master (94836ecf1e73 Merge tag 'nfsd-4.11-2' of git://linux-nfs.org/~bfields/linux)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (07d93a3b6ddc Merge branch 'xtensa-sim-params' into xtensa-for-next)
Merging fscrypt/master (382b06261081 MAINTAINERS: fscrypt: update mailing list, patchwork, and git)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (953a8bf6cedd Merge branch 'for-next-next-v4.12-20170425' into for-next-20170425)
Merging ceph/master (8179a101eb5f ceph: fix recursion between ceph_set_acl() and __ceph_setattr())
Merging cifs/for-next (a6f74e80f271 cifs: don't check for failure from mempool_alloc())
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (07f7e3135e58 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (d3fd65482702 ext4: preload block group descriptors)
Merging f2fs/dev (4a764c5502cc f2fs: introduce CP_TRIMMED_FLAG to avoid unneeded discard)
CONFLICT (content): Merge conflict in fs/f2fs/inline.c
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0b6e9ea041e6 fuse: Add support for pid namespaces)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (1f18b82c3437 pNFS: Ensure we commit the layout if it has been invalidated)
Merging nfsd/nfsd-next (ed6473ddc704 NFSv4: Fix callback server shutdown)
Merging orangefs/for-next (907bfcd8d8a6 orangefs: handle zero size write in debugfs)
Merging overlayfs/overlayfs-next (4a99f3c83dc4 ovl: do not set overlay.opaque on non-dir create)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (32fe905c17f0 ubifs: Fix O_TMPFILE corner case in ubifs_link())
Merging xfs/for-next (c4cf1acdb186 xfs: better log intent item refcount checking)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (92a7c98c86d3 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in arch/sparc/Kconfig
CONFLICT (content): Merge conflict in arch/s390/Kconfig
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (cf39bf58afda printk: fix double printing with earlycon)
Merging pci/next (3146c8f4de9b Merge branch 'pci/remove' into next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
Merging pstore/for-next/pstore (3a7d2fd16c57 pstore: Solve lockdep warning by moving inode locks)
Merging hid/for-next (38c81b5434ac Merge branch 'for-4.11/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f49ee0593cde Merge branch 'i2c/for-4.12' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (09d9d8274580 hwmon: (twl4030-madc) drop driver)
Merging jc_docs/docs-next (9bb0e9cb04c8 docs: Fix a couple typos)
Merging v4l-dvb/master (3622d3e77ece [media] ov2640: print error if devm_*_optional*() fails)
Merging v4l-dvb-next/master (6d95b3f24881 Merge branch 'TTT' into to_next)
Merging fbdev/fbdev-for-next (3bbb5b823416 video: console: Remove reference to CONFIG_8xx)
Merging pm/linux-next (e89f8d4c4c2a Merge branches 'acpi-pmic', 'powercap' and 'pm-cpuidle' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (f7b553c688c3 Merge branches 'for-rc' and 'thermal-core' into next)
Merging thermal-soc/next (19fd1783c24e Merge branch 'work-linus' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/Makefile
CONFLICT (content): Merge conflict in drivers/thermal/Kconfig
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (5b36d8f5e514 Merge branch '1GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
CONFLICT (content): Merge conflict in include/linux/pci.h
CONFLICT (content): Merge conflict in drivers/pci/msi.c
Merging ipsec-next/master (e892d2d40445 esp: Fix misplaced spin_unlock_bh.)
Merging netfilter-next/master (9a08ecfe74d7 netfilter: don't attach a nat extension by default)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (47d272f0f988 Merge tag 'iwlwifi-next-for-kalle-2017-04-26' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (71653eb64bcc Bluetooth: Add selftest for ECDH key generation)
Merging mac80211-next/master (cec381919818 Merge tag 'mac80211-next-for-davem-2017-04-28' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next)
Merging rdma/for-next (2196f2716292 IB/SA: Add support to query opa classport info.)
Merging gfs2/for-next (d552a2b9b33e GFS2: Non-recursive delete)
Merging mtd/master (c1ae3cfa0e89 Linux 4.11-rc1)
Merging l2-mtd/master (da4b1caa49cb mtd: physmap_of: use OF helpers for reading strings)
Merging nand/nand/next (9d2ee0a60b8b mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program)
Merging spi-nor/next (cc34efbfb797 mtd: spi-nor: introduce Octo SPI protocols)
Merging crypto/master (929562b14478 crypto: stm32 - Fix OF module alias information)
CONFLICT (content): Merge conflict in include/linux/crypto.h
CONFLICT (content): Merge conflict in drivers/char/hw_random/Makefile
CONFLICT (content): Merge conflict in drivers/char/hw_random/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stm32746g-eval.dts
Applying: crypto: merge fix for CRYPTO_MAX_ALG_NAME move
Merging drm/drm-next (73ba2d5c2bd4 Merge tag 'drm-intel-next-fixes-2017-04-27' of git://anongit.freedesktop.org/git/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_hdmi.c
Applying: tee: merge fix for dma-ops field name changes
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (88326ef05b26 drm/i915: Confirm the request is still active before adding it to the await)
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/drm.c
Merging drm-misc/for-linux-next (f9b67f0014cb dma-buf: Rename dma-ops to prevent conflict with kunmap_atomic macro)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (763656d30b3d drm: mali-dp: use div_u64 for expensive 64-bit divisions)
Merging sunxi-drm/sunxi-drm/for-next (2da042ac05e9 MAINTAINERS: Add sun4i-drm git repo)
Merging imx-drm/imx-drm/next (3d1df96ad468 drm/imx: merge imx-drm-core and ipuv3-crtc in one module)
Merging etnaviv/etnaviv/next (78ec187f64fa drm/etnaviv: submit support for out-fences)
Merging kspp/for-next/kspp (62111ab351b8 Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (0997e378be1d ALSA: ali5451: fix spelling mistake in "ali_capture_preapre")
Merging sound-asoc/for-next (20d5c84bef06 Merge remote-tracking branches 'asoc/topic/wm8960', 'asoc/topic/wm8978' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (175861882769 kallsyms: Use bounded strnchr() when parsing string)
Merging input/next (21d3827e8ce1 Input: twl4030-pwrbutton - use input_set_capability() helper)
CONFLICT (content): Merge conflict in Documentation/input/ff.rst
Merging block/for-next (4d1ee100af58 Merge branch 'for-4.12/block' into for-next)
Applying: nbd: fix up for nla_parse_nested() API change
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (187afc515353 dm: introduce a new DM_MAPIO_KILL return value)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (a627f025eb05 mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (43ac9b84a399 md/raid1: Use a new variable to count flighting sync requests)
CONFLICT (content): Merge conflict in drivers/md/raid5.h
CONFLICT (content): Merge conflict in drivers/md/raid5.c
CONFLICT (content): Merge conflict in drivers/md/raid0.c
CONFLICT (content): Merge conflict in drivers/md/md.h
CONFLICT (content): Merge conflict in drivers/md/linear.c
Merging mfd/for-mfd-next (ab6241ae07c3 input: touchscreen: mxs-lradc: || vs && typos)
Merging backlight/for-backlight-next (e739c5bb20be backlight: Add support for Arctic Sand LED backlight driver chips)
Merging battery/for-next (6c381663bb3b power: supply: bq24190_charger: Use new extcon_register_notifier_all())
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f123e7b2a6e3 Merge remote-tracking branch 'regulator/topic/vctrl' into regulator-next)
Merging security/next (8979b02aaf1d tpm: Fix reference count to main device)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (b5895237b035 KEYS: sanitize key structs before freeing)
Merging selinux/next (cae303df3f37 selinux: Fix an uninitialized variable bug)
Merging tpmdd/next (8979b02aaf1d tpm: Fix reference count to main device)
Merging watchdog/master (0a7472cbf212 Merge branch 'watchdog-next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
Merging iommu/next (4c03b2929434 Merge branches 'arm/exynos', 'arm/omap', 'arm/rockchip', 'arm/mediatek', 'arm/smmu', 'arm/core', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (4acdad9bab28 audit: use kmem_cache to manage the audit_buffer cache)
Merging devicetree/for-next (5d4dd65b1e98 of: fix unittest build without CONFIG_OF_OVERLAY)
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (282ec0ea65da Merge remote-tracking branches 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
CONFLICT (content): Merge conflict in drivers/acpi/acpi_apd.c
Merging tip/auto-latest (8bdf6aaa7f6b Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in kernel/kprobes.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi-pstore.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/bug.h
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3188.dtsi
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging clockevents/clockevents/next (6f9c89000c3f Merge tag 'arch-timer-errata' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into clockevents/4.12)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (f8d5549df25e EDAC, ghes: Do not enable it by default)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (f96d18dee6f0 Merge branch 'trace/ftrace/core' into trace/ftrace/next)
Merging rcu/rcu/next (2ca573d94b18 rcu: Use timer as backstop for NOCB deferred wakeups)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (bd17117bb2af Merge tag 'kvm-s390-next-4.12-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (1edb632133ef ARM: KVM: Fix idmap stub entry when running Thumb-2 code)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic.h
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic-v2.c
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (fb7dcf723dd2 Merge remote-tracking branch 'remotes/powerpc/topic/xive' into kvm-ppc-next)
Applying: powerpc: merge fix for powerpc_debugfs_root move.
Merging kvms390/next (e000b8e0968d s390: kvm: Cpu model support for msa6, msa7 and msa8)
Merging xen-tip/linux-next (acff05b64c57 xen/x86: Call xen_smp_intr_init_pv() on BSP)
CONFLICT (content): Merge conflict in arch/x86/xen/mmu.c
CONFLICT (content): Merge conflict in arch/x86/xen/enlighten.c
Applying: x86/xen: merge fix up for arch/x86/xen/mmu.c code movement
Applying: x86/xen: merge fix for arch/x86/xen/enlighten.c code movement
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (58688a7525b6 platform/x86: INT33FE: add i2c dependency)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (3026050179a3 HSI: ssi_protocol: double free in ssip_pn_xmit())
Merging leds/for-next (28c5fe99016d leds: pca9532: Extend pca9532 device tree support)
Merging ipmi/for-next (2c1175c2e8e5 ipmi/watchdog: fix wdog hang on panic waiting for ipmi response)
Merging driver-core/driver-core-next (523aa3586ffb Merge 4.11-rc6 into driver-core-next)
Merging usb/usb-next (c034a43e72dd staging: typec: Fairchild FUSB302 Type-c chip driver)
CONFLICT (content): Merge conflict in Documentation/media/v4l-drivers/philips.rst
Merging usb-gadget/next (48eab1f28d49 usb: gadget: udc: atmel: Update Kconfig help for fifo_mode = 0)
Merging usb-serial/usb-next (31c5d1922b90 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit)
Merging usb-chipidea-next/ci-for-usb-next (a932a8041ff9 usb: chipidea: core: add sysfs group)
Merging phy-next/next (6239879b415e phy: qcom-qusb2: add NVMEM dependency)
Merging tty/tty-next (15a065485138 Merge 4.11-rc7 into tty-next)
CONFLICT (content): Merge conflict in include/linux/serdev.h
Merging char-misc/char-misc-next (2a76f89fa58c firmware: google memconsole: Fix return value check in platform_memconsole_init())
CONFLICT (content): Merge conflict in drivers/misc/Makefile
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Applying: firmware: google memconsole: merge fix for e820.h move
Merging extcon/extcon-next (70641a0a84e1 extcon: Use BIT() macro for the left-shift operation)
Merging staging/staging-next (11270059e8d0 staging: fsl-mc/dpio: add cpu <--> LE conversion for dpaa2_fd)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sir.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sir.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sasem.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sasem.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/Kconfig
CONFLICT (content): Merge conflict in drivers/staging/Makefile
$ git rm -f drivers/staging/media/lirc/lirc_sasem.c drivers/staging/media/lirc/lirc_sir.c
Applying: staging: merge fix for add/change_virtual-intf API change
Applying: staging: merge fix for "nl80211: allow multiple active scheduled scan requests"
Applying: staging: rtl8723bs: fix up for cfg80211_roamed() API change
Merging mux/for-next (7816ffe4dcb6 mux: adg792a: add mux controller driver for ADG792A/G)
CONFLICT (content): Merge conflict in drivers/i2c/muxes/Makefile
CONFLICT (content): Merge conflict in drivers/i2c/muxes/Kconfig
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging slave-dma/next (068c69a2b43f Merge branch 'for-linus' into next)
Merging cgroup/for-next (b7897aee1a40 Merge branch 'for-4.12' into for-next)
Merging scsi/for-next (e83d14310c40 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/sd.c
CONFLICT (content): Merge conflict in drivers/scsi/osd/osd_uld.c
Applying: scsi: osd_uld: fix mismerge
Merging scsi-mkp/for-next (e7731da36f10 scsi: qla4xxx: fix spelling mistake: "Tempalate" -> "Template")
Merging target-updates/for-next (9f7ebfc64d2c tcm: make pi data verification configurable)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (6b0778cd8a78 Merge branch 'for-4.12' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (d635daaa99c6 ptr_ring: batched ring producer)
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (da1376ff1f02 gpio: gpio-wcove: fix GPIO IRQ status mask)
CONFLICT (content): Merge conflict in drivers/input/misc/soc_button_array.c
Merging pinctrl/for-next (a5bf5fc060b0 pinctrl: artpec6: Remove .owner field for driver)
Merging pinctrl-samsung/for-next (c8dd100397f3 Merge branch 'pinctrl-next' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (d66bb1607e2d proc: Fix unbalanced hard link numbers)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (83896c68fd32 selftests: create cpufreq kconfig fragments)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (608822c0f7af Merge branch 'for-4.12/upstream' into for-next)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/init_task.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.h
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
CONFLICT (content): Merge conflict in arch/s390/include/asm/thread_info.h
Merging coresight/next (5a99899065da coresight: tmc: minor fix for output log)
Merging rtc/rtc-next (5d05e81516cf rtc: sh: mark PM functions as unused)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (957b7471fc49 Merge branch 'for-4.12/dax' into libnvdimm-for-next)
CONFLICT (content): Merge conflict in fs/dax.c
CONFLICT (content): Merge conflict in drivers/block/brd.c
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (5aca360fdf57 sysv,ipc: cacheline align kern_ipc_perm)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/run_vmtests
$ git checkout -b akpm remotes/origin/akpm/master
Applying: imx7: fix Kconfig warning and build errors
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: zero hash tables in allocator
Applying: mm: update callers to use HASH_ZERO flag
Applying: mm: adaptive hash table scaling
Applying: mm: introduce kv[mz]alloc helpers
Applying: mm: introduce kv[mz]alloc helpers - f2fs fix up
Applying: mm: support __GFP_REPEAT in kvmalloc_node for >32kB
Applying: lib/rhashtable.c: simplify a strange allocation pattern
Applying: net/ipv6/ila/ila_xlat.c: simplify a strange allocation pattern
Applying: fs/xattr.c: zero out memory copied to userspace in getxattr
Applying: treewide: use kv[mz]alloc* rather than opencoded variants
Applying: net: use kvmalloc with __GFP_REPEAT rather than open coded variant
Applying: drivers/md/dm-ioctl.c: use kvmalloc rather than opencoded variant
Applying: drivers/md/bcache/super.c: use kvmalloc
Applying: mm, swap: use kvzalloc to allocate some swap data structures
Applying: mm, vmalloc: use __GFP_HIGHMEM implicitly
Applying: scripts/spelling.txt: add "memory" pattern and fix typos
Applying: scripts/spelling.txt: Add regsiter -> register spelling mistake
Applying: scripts/spelling.txt: add "intialise(d)" pattern and fix typo instances
Applying: treewide: spelling: correct diffrent[iate] and banlance typos
Applying: treewide: move set_memory_* functions away from cacheflush.h
Applying: arm: use set_memory.h header
Applying: arm64: use set_memory.h header
Applying: s390: use set_memory.h header
Applying: x86: use set_memory.h header
Applying: agp: use set_memory.h header
Applying: drm: use set_memory.h header
Applying: drm-use-set_memoryh-header-fix
Applying: drivers/hwtracing/intel_th/msu.c: use set_memory.h header
Applying: drivers/watchdog/hpwdt.c: use set_memory.h header
Applying: include/linux/filter.h: use set_memory.h header
Applying: kernel/module.c: use set_memory.h header
Applying: kernel/power/snapshot.c: use set_memory.h header
Applying: alsa: use set_memory.h header
Applying: drivers/misc/sram-exec.c: use set_memory.h header
Applying: drivers/video/fbdev/vermilion/vermilion.c: use set_memory.h header
Applying: drivers/staging/media/atomisp/pci/atomisp2: use set_memory.h
Applying: treewide: decouple cacheflush.h and set_memory.h
Applying: kprobes/x86: merge fix for set_memory.h decoupling
Applying: kref: remove WARN_ON for NULL release functions
Applying: drivers/scsi/megaraid: remove expensive inline from megasas_return_cmd
Applying: include/linux/uaccess.h: remove expensive WARN_ON in pagefault_disabled_dec
Applying: fs: semove set but not checked AOP_FLAG_UNINTERRUPTIBLE flag
Applying: Documentation/vm/transhuge.txt: fix trivial typos
Applying: docs-vm-transhuge-fix-few-trivial-typos-fix
Applying: format-security: move static strings to const
Applying: fs: f2fs: use ktime_get_real_seconds for sit_info times
Applying: trace: make trace_hwlat timestamp y2038 safe
Applying: fs: cifs: replace CURRENT_TIME by other appropriate apis
Applying: fs: ceph: CURRENT_TIME with ktime_get_real_ts()
Applying: fs: ufs: use ktime_get_real_ts64() for birthtime
Applying: fs: ubifs: replace CURRENT_TIME_SEC with current_time
Applying: lustre: replace CURRENT_TIME macro
Applying: apparmorfs: replace CURRENT_TIME with current_time()
Applying: gfs2: replace CURRENT_TIME with current_time
Applying: time: delete CURRENT_TIME_SEC and CURRENT_TIME
Applying: time: delete current_fs_time()
Applying: mm/huge_memory.c.c: use zap_deposited_table() more
Applying: mm/huge_memory.c: deposit a pgtable for DAX PMD faults when required
Applying: mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
Applying: mm: introduce memalloc_noreclaim_{save,restore}
Applying: treewide: convert PF_MEMALLOC manipulations to new helpers
Applying: treewide-convert-pf_memalloc-manipulations-to-new-helpers-fix
Applying: mtd: nand: nandsim: convert to memalloc_noreclaim_*()
Applying: dax: add tracepoints to dax_iomap_pte_fault()
Applying: dax: add tracepoints to dax_pfn_mkwrite()
Applying: dax: add tracepoints to dax_load_hole()
Applying: dax: add tracepoints to dax_writeback_mapping_range()
Applying: dax: fix regression in dax_writeback_mapping_range()
Applying: dax: add tracepoint to dax_writeback_one()
Applying: dax-add-tracepoint-to-dax_writeback_one-fix
Applying: dax: add tracepoint to dax_insert_mapping()
Applying: selftests/vm: add a test for virtual address range mapping
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (a1117a57fad3 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
