From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 18
Date: Tue, 18 Apr 2017 18:26:26 +1000
Message-ID: <20170418182626.2a8f428a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20170413:

The thermal-soc tree gained a conflict against the pm tree.

The net-next tree gained a conflict against the net tree.

The block tree gained a build failure due to an interaction with the
net-next tree for which I applied a merge fix patch.

The staging tree gained build failures so I used the version from
next-20170413 and applied a merge fix patch.

The mux tree gained a conflict against the i2c tree.

The rtc tree lost its build failure.

The akpm-current tree gained a conflict against the kselftest tree.

The akpm tree lost a patch that turned up elsewhere and gained a build
failure due to an interaction with the tip tree for which I applied a
merge fix patch.

Non-merge commits (relative to Linus' tree): 9553
 9232 files changed, 1110364 insertions(+), 189483 deletions(-)

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
Merging origin/master (4f7d029b9bf0 Linux 4.11-rc7)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (9be3213b14d4 gconfig: remove misleading parentheses around a condition)
Merging arc-current/for-curr (6492f09e8644 ARC: [plat-eznps] Fix build error)
Merging arm-current/fixes (3872fe83a2fb Merge branch 'kprobe-fixes' of https://git.linaro.org/people/tixy/kernel into fixes)
Merging m68k-current/for-linus (e3b1ebd67387 m68k: Wire up statx)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (4749228f0228 powerpc/crypto/crc32c-vpmsum: Fix missing preempt_disable())
Merging sparc/master (78d91a75b40f Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (acf167f3f249 Merge branch 'bpf-fixes')
Merging ipsec/master (89e357d83c06 af_key: Add lock to key dump)
Merging netfilter/master (fe50543c194e netfilter: ipt_CLUSTERIP: Fix wrong conntrack netns refcnt usage)
Merging ipvs/master (0b9aefea8600 tcp: minimize false-positives on TCP/GRO check)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (fc9c89b19c56 Merge branch 'bridge-register-netdev-before-changelink')
Merging sound-current/for-linus (dfb00a569351 ALSA: firewire-lib: fix inappropriate assignment between signed/unsigned type)
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
Merging input-current/for-linus (537636688625 Input: xpad - add support for Razer Wildcat gamepad)
Merging crypto-current/master (e6534aebb26e crypto: algif_aead - Fix bogus request dereference in completion function)
Merging ide/master (96297aee8bce ide: palm_bk3710: add __initdata to palm_bk3710_port_info)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (c053b5a506d3 drm/i915: Don't call synchronize_rcu_expedited under struct_mutex)
Merging drm-misc-fixes/for-linux-next-fixes (0c45b36f8acc drm/udl: Fix unaligned memory access in udl_render_hline)
Merging kbuild/for-next (d74b34980684 Merge branch 'kbuild' into for-next)
CONFLICT (content): Merge conflict in include/uapi/linux/Kbuild
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (3306dc6d9ac1 Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f00fa5f4163b arm64: pmuv3: use arm_pmu ACPI framework)
Merging arm-soc/for-next (2b31ad3e57b2 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r7s72100.dtsi
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (715dcd206041 Merge branch 'v4.12/drivers' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (fabfb0f29bb5 Merge branch 'at91-dt' into at91-next)
Merging bcm2835/for-next (7ea6e490ba7f Merge branch anholt/bcm2835-defconfig-64-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (990df0480610 Merge branch 'zte/dt64' into for-next)
Merging keystone/next (9abf3e9b9cc8 Merge branch 'for_4.12/soc-pmdomain' into next)
Merging mvebu/for-next (4242642c21aa Merge branch 'mvebu/dt64' into mvebu/for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging omap/for-next (5a0bbcf7ab0f Merge branch 'omap-for-v4.12/defconfig' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (9f514b0f9cf3 Merge branch 'drivers-for-4.12' into all-for-4.12)
Merging renesas/next (410c0b62ddfa Merge branches 'arm64-dt-for-v4.12', 'dt-for-v4.12' and 'sysc-for-v4.12' into next)
Merging rockchip/for-next (b1e842489772 Merge branch 'v4.12-armsoc/dts64' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (835ca0530460 Merge branch 'next/dt' into for-next)
Merging sunxi/sunxi/for-next (5675caea945d Merge branches 'sunxi/clk-for-4.12', 'sunxi/dt-for-4.12' and 'sunxi/fixes-for-4.11' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (494bc3cd3dd0 Merge branch 'will/for-next/perf' into for-next/core)
Merging clk/clk-next (e609f9f23e57 Merge branch 'clk-fixes' into clk-next)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (3dfe33020ca8 m68k/sun3: Remove dead code in paging_init())
Merging m68knommu/for-next (db31b7bc89c8 m68k/coldfire/pit: set ->min_delta_ticks and ->max_delta_ticks)
Merging metag/for-next (d3ba2e922d4d metag/usercopy: Add 64-bit get_user support)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (39ac8e500cb5 Merge branch '4.11-fixes' into mips-for-linux-next)
Merging nios2/for-next (d8f347ba35cf nios2: enable earlycon support)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (4f7d029b9bf0 Linux 4.11-rc7)
Merging powerpc/next (9e4114b3913c powerpc/mm: Fix hash table dump when memory is not contiguous)
Merging fsl/next (75b824727680 powerpc/8xx: Perf events on PPC 8xx)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (b13de4b7adeb s390/spinlock: remove compare and delay instruction)
CONFLICT (content): Merge conflict in arch/s390/include/uapi/asm/Kbuild
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (f88f0bdfc32f um: UBD Improvements)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (d0c32cdc395c Merge branch 'xtensa-dma-map-fix' into xtensa-for-next)
Merging fscrypt/master (94840e3c802d fscrypt: eliminate ->prepare_context() operation)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (9565b21e556e Merge branch 'for-next-next-v4.12-20170413' into for-next-20170413)
Merging ceph/master (633ee407b9d1 libceph: force GFP_NOIO for socket allocations)
Merging cifs/for-next (62a6cfddcc0a cifs: Do not send echoes before Negotiate is complete)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (baefa6a937c3 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (d67d64f42314 ext4: fix two spelling nits)
Merging f2fs/dev (d29fd1721851 f2fs: fix not to set fsync/dentry mark)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (9a87ad3da905 fuse: release: private_data cannot be NULL)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (a71c9a1c779f Linux 4.11-rc5)
Merging nfsd/nfsd-next (7b68a2dc706d svcrdma: Clean out old XDR encoders)
Merging orangefs/for-next (96c641bc68a3 orangefs: move features validation to fix filesystem hang)
Merging overlayfs/overlayfs-next (b1eaa950f7e9 ovl: lockdep annotate of nested stacked overlayfs inode lock)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (1cb51a15b576 ubifs: Fix journal replay wrt. xattr nodes)
Merging xfs/for-next (4c934c7dd60c xfs: report realtime space information via the rtbitmap)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (28fa21828dbd HAVE_ARCH_HARDENED_USERCOPY is unconditional now)
CONFLICT (content): Merge conflict in arch/s390/Kconfig
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (cf39bf58afda printk: fix double printing with earlycon)
Merging pci/next (9c5579a1a10f Merge branch 'pci/host-mvebu' into next)
Merging pstore/for-next/pstore (eec50d76a6ee pstore: Drop needless inode lock during population)
Merging hid/for-next (4d734b7e99eb Merge branch 'for-4.12/asus' into for-next)
Merging i2c/i2c/for-next (7ed61a9b25df Merge branch 'i2c/for-4.12' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (a02c24a32158 hwmon: (lm87) Add OF device ID table)
Merging jc_docs/docs-next (e1c3e6e1ca99 docs-rst: fix usb cross-references)
Merging v4l-dvb/master (495ab569d084 [media] em28xx: add support for V4L2_PIX_FMT_SRGGB8)
Merging v4l-dvb-next/master (6d95b3f24881 Merge branch 'TTT' into to_next)
Merging fbdev/fbdev-for-next (0cb51f653263 drivers/video/fbdev: Fixing coding guidelines in acornfb.c)
Merging pm/linux-next (8f506e0faf4e Merge branch 'pm-devfreq' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (f7b553c688c3 Merge branches 'for-rc' and 'thermal-core' into next)
Merging thermal-soc/next (7609b2d3fa2f Merge branch 'work-linus' into work-next)
CONFLICT (content): Merge conflict in drivers/thermal/Makefile
CONFLICT (content): Merge conflict in drivers/thermal/Kconfig
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (b89f04c61efe bonding: deliver link-local packets with skb->dev set to link that packets arrived on)
CONFLICT (content): Merge conflict in kernel/bpf/syscall.c
CONFLICT (content): Merge conflict in include/linux/pci.h
CONFLICT (content): Merge conflict in drivers/pci/msi.c
Applying: bpf: merge fix for move of fixup_bpf_calls()
Merging ipsec-next/master (bcd1f8a45e7d xfrm: Prepare the GRO codepath for hardware offloading.)
Merging netfilter-next/master (ab8bc7ed864b netfilter: remove nf_ct_is_untracked)
Merging ipvs-next/master (da98415cb6b2 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (1f242a3de702 rt2x00: reverse external PA capability flag logic)
Merging bluetooth/master (297c3fb207ef Bluetooth: hci_ll: Fix NULL pointer deref on FW upload failure)
Merging mac80211-next/master (1d5e9f80ab02 mac80211_hwsim: use per-interface power level)
Merging rdma/for-next (b58fc8049790 IB/hfi1: Eliminate synchronize_rcu() in mr delete)
Merging gfs2/for-next (d4d7fc12b642 gfs2: Re-enable fallocate for the rindex)
Merging mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging l2-mtd/master (d91f6cee98b6 mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe())
Merging nand/nand/next (62f6e49c2bcc mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program)
Merging spi-nor/next (d3848f3a4c21 mtd: mtk-nor: set controller's address width according to nor flash)
Merging crypto/master (cd15f1020fd6 crypto: lz4 - fixed decompress function to return error code)
CONFLICT (content): Merge conflict in include/linux/crypto.h
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
Applying: crypto: merge fix for CRYPTO_MAX_ALG_NAME move
Merging drm/drm-next (ab6eb211b07a Merge tag 'drm/panel/for-4.12-rc1' of git://anongit.freedesktop.org/tegra/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/vgpu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_hdmi.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (b0fd47adc623 drm/i915: Copy user requested buffers into the error state)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/drm.c
Merging drm-misc/for-linux-next (2f410f88c0a1 drm/sti: fix GDP size to support up to UHD resolution)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (cda0c3ce3297 drm: mali-dp: remove unused variable)
Merging sunxi-drm/sunxi-drm/for-next (2da042ac05e9 MAINTAINERS: Add sun4i-drm git repo)
Merging imx-drm/imx-drm/next (3d1df96ad468 drm/imx: merge imx-drm-core and ipuv3-crtc in one module)
Merging etnaviv/etnaviv/next (78ec187f64fa drm/etnaviv: submit support for out-fences)
Merging kspp/for-next/kspp (517e1fbeb65f mm/usercopy: Drop extra is_vmalloc_or_module() check)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (ae369e559f16 ALSA: firewire-tascam: support drain callback for MIDI playback substream)
Merging sound-asoc/for-next (929477a5151b Merge remote-tracking branches 'asoc/topic/ux500', 'asoc/topic/wm8903', 'asoc/topic/wm8960', 'asoc/topic/wm8978' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (5bd933fe4481 module: set .init_array alignment to 8)
Merging input/next (a6869e3a76f4 Input: synaptics-rmi4 - enable IRQ operation in F34 V7)
CONFLICT (content): Merge conflict in Documentation/input/ff.rst
Merging block/for-next (263bcf7ce09b Merge branch 'for-4.12/block' into for-next)
Applying: nbd: fix up for nla_parse_nested() API change
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (3591b6613c18 Merge branch 'dm-4.11' into dm-next)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (c4fdc3bc38e3 mmc: meson-gx: add basic tuning for rx clock phase)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (835d89e92fa7 md-cluster: Fix a memleak in an error handling path)
CONFLICT (content): Merge conflict in drivers/md/raid5.h
CONFLICT (content): Merge conflict in drivers/md/raid5.c
CONFLICT (content): Merge conflict in drivers/md/raid0.c
CONFLICT (content): Merge conflict in drivers/md/md.h
CONFLICT (content): Merge conflict in drivers/md/linear.c
Merging mfd/for-mfd-next (4500081c1032 mfd: cpcap: Fix bad use of IRQ sense register)
Merging backlight/for-backlight-next (80e5d455339a MAINTAINERS: Rework entry for Backlight)
Merging battery/for-next (6c381663bb3b power: supply: bq24190_charger: Use new extcon_register_notifier_all())
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (a0115ed44aac Merge remote-tracking branches 'regulator/topic/pfuze100', 'regulator/topic/settle', 'regulator/topic/tps65132', 'regulator/topic/twl6030' and 'regulator/topic/vctrl' into regulator-next)
Merging security/next (30a83251dd8b Merge tag 'keys-next-20170412' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (4cd4ca7cc848 keys: select CONFIG_CRYPTO when selecting DH / KDF)
Merging selinux/next (cae303df3f37 selinux: Fix an uninitialized variable bug)
Merging tpmdd/next (668a82705718 tpm: fix handling of the TPM 2.0 event logs)
Merging watchdog/master (00ea1ceebe0d ipv6: release dst on error in ip6_dst_lookup_tail)
Merging iommu/next (04ab2c657fb6 Merge branches 'arm/exynos', 'arm/rockchip', 'arm/mediatek', 'arm/smmu', 'arm/core', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (3393af24b665 vfio/spapr_tce: Check kzalloc() return when preregistering memory)
Merging trivial/for-next (4f6cce39105e Fix dead URLs to ftp.kernel.org)
Merging audit/next (4acdad9bab28 audit: use kmem_cache to manage the audit_buffer cache)
Merging devicetree/for-next (ac37f761ce80 of: Add vendor prefix for Nordic Semiconductor)
Merging mailbox/mailbox-for-next (73874913d504 mailbox: Remove depends on COMPILE_TEST for BCM_FLEXRM_MBOX)
Merging spi/for-next (0b9a3d691889 Merge remote-tracking branches 'spi/topic/spidev-test', 'spi/topic/sunxi', 'spi/topic/test', 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (08ea580603e9 Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi-pstore.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/bug.h
Merging clockevents/clockevents/next (6f9c89000c3f Merge tag 'arch-timer-errata' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into clockevents/4.12)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3188.dtsi
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (bffc7dece92e EDAC: Rename report status accessors)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (d54b6eeb553c tracing: Make sure rcu_irq_enter() can work for trace_*_rcuidle() trace events)
Merging rcu/rcu/next (9d2d3dedb1c8 rcuperf: Add a Kconfig-fragment file for Classic SRCU)
Applying: drm/i915: merge fix for "mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU"
Merging kvm/linux-next (f7b1a77d3bfb Merge tag 'kvm-s390-next-4.12-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux)
Merging kvm-arm/next (5f6e00709c16 Merge remote-tracking branch 'rutland/kvm/common-sysreg' into next-fix)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic.h
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic/vgic-v2.c
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
CONFLICT (content): Merge conflict in Documentation/virtual/kvm/api.txt
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (538eaa212a8c KVM: PPC: Book3S PR: Fix build when PR KVM is built in)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvms390/next (80248559992a KVM: s390: fix stale machine check data for guarded storage)
Merging xen-tip/linux-next (e27c533dc4d0 xen/displif: add ABI for para-virtual display)
CONFLICT (content): Merge conflict in arch/x86/xen/mmu.c
CONFLICT (content): Merge conflict in arch/x86/xen/enlighten.c
Applying: x86/xen: merge fix up for arch/x86/xen/mmu.c code movement
Applying: x86/xen: merge fix for arch/x86/xen/enlighten.c code movement
Merging percpu/for-next (8a1df543de8a percpu: remove unused chunk_alloc parameter from pcpu_get_pages())
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (298747b7579f platform/x86: hp-wmi: Fix detection for dock and tablet mode)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (7ac5d7b1a125 HSI: hsi_char.h: use __u32 from linux/types.h)
Merging leds/for-next (cd3b0b05328e leds: cpcap: new driver)
Merging ipmi/for-next (3f724c408a7b ipmi_si: use smi_num for init_name)
Merging driver-core/driver-core-next (523aa3586ffb Merge 4.11-rc6 into driver-core-next)
Merging usb/usb-next (ba7756d08212 Merge tag 'usb-for-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next)
Merging usb-gadget/next (48eab1f28d49 usb: gadget: udc: atmel: Update Kconfig help for fifo_mode = 0)
Merging usb-serial/usb-next (185fcb3fbe6d USB: serial: quatech2: drop redundant tty_buffer_request_room)
Merging usb-chipidea-next/ci-for-usb-next (a932a8041ff9 usb: chipidea: core: add sysfs group)
Merging phy-next/next (6239879b415e phy: qcom-qusb2: add NVMEM dependency)
Merging tty/tty-next (15a065485138 Merge 4.11-rc7 into tty-next)
CONFLICT (content): Merge conflict in include/linux/serdev.h
Merging char-misc/char-misc-next (073a457d9ef4 Merge tag 'extcon-next-for-4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-next)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Applying: firmware: google memconsole: merge fix for e820.h move
Merging extcon/extcon-next (70641a0a84e1 extcon: Use BIT() macro for the left-shift operation)
Merging staging/staging-next (4f22b8954b13 staging: ks7010: remove unused spin_lock)
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sir.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sir.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sasem.c deleted in HEAD and modified in staging/staging-next. Version staging/staging-next of drivers/staging/media/lirc/lirc_sasem.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/Kconfig
$ git rm -f drivers/staging/media/lirc/lirc_sasem.c drivers/staging/media/lirc/lirc_sir.c
$ git reset --hard HEAD^
Merging next-20170413 version of staging
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sir.c deleted in HEAD and modified in d317d054b14df4cbce5324454925dc6c9858a8c4. Version d317d054b14df4cbce5324454925dc6c9858a8c4 of drivers/staging/media/lirc/lirc_sir.c left in tree.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_sasem.c deleted in HEAD and modified in d317d054b14df4cbce5324454925dc6c9858a8c4. Version d317d054b14df4cbce5324454925dc6c9858a8c4 of drivers/staging/media/lirc/lirc_sasem.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/Makefile
CONFLICT (content): Merge conflict in drivers/staging/media/Kconfig
$ git rm -f drivers/staging/media/lirc/lirc_sasem.c drivers/staging/media/lirc/lirc_sir.c
[master 55ca2a1f1798] next-20170413/staging
Applying: staging: merge fix for add/change_virtual-intf API change
[master 24357fe591dd] next-20170413/staging
Merging mux/for-next (3a64ea95221d mux: adg792a: add mux controller driver for ADG792A/G)
CONFLICT (content): Merge conflict in drivers/i2c/muxes/Makefile
CONFLICT (content): Merge conflict in drivers/i2c/muxes/Kconfig
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging slave-dma/next (cb220e16013c Merge branch 'topic/cppi' into next)
Merging cgroup/for-next (8673d8769243 Merge branch 'for-4.11-fixes' into for-next)
Merging scsi/for-next (c1826b6b5b1b Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/osd/osd_uld.c
Merging scsi-mkp/for-next (8d4208c1a73a scsi: storvsc: remove return at end of void function)
Merging target-updates/for-next (9f7ebfc64d2c tcm: make pi data verification configurable)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (762b6f00a995 uapi: fix linux/target_core_user.h userspace compilation errors)
Merging libata/for-next (b09754f570fa Merge branch 'for-4.11-fixes' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (a91562ced78a virtio_net: tidy a couple debug statements)
CONFLICT (content): Merge conflict in drivers/virtio/virtio_pci_common.c
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (d85f6bb30759 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/input/misc/soc_button_array.c
Merging pinctrl/for-next (85a51c355d21 Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (c8dd100397f3 Merge branch 'pinctrl-next' into for-next)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (040757f738e1 ucount: Remove the atomicity from ucount->count)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (2b8713e14be5 selftests/vm/run_vmtests: Polish output text)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (608822c0f7af Merge branch 'for-4.12/upstream' into for-next)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/init_task.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/thread_info.h
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
CONFLICT (content): Merge conflict in arch/s390/include/asm/thread_info.h
Merging coresight/next (02e5b98ecc97 coresight: etm_perf: Fix using uninitialised work)
Merging rtc/rtc-next (db2f814194eb rtc: ds1307: Add m41t0 to OF device ID table)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (efebc711180f device-dax, tools/testing/nvdimm: enable device-dax with mock resources)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (02dff0ef2e7f sysv,ipc: cacheline align kern_ipc_perm)
CONFLICT (content): Merge conflict in tools/testing/selftests/vm/run_vmtests
CONFLICT (content): Merge conflict in drivers/block/zram/zram_drv.c
Applying: linux-next-rejects
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
Applying: time: delete CURRENT_TIME_SEC and CURRENT_TIME
Applying: time: delete current_fs_time()
Applying: mm/huge_memory.c.c: use zap_deposited_table() more
Applying: mm/huge_memory.c: deposit a pgtable for DAX PMD faults when required
Applying: mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
Applying: mm: introduce memalloc_noreclaim_{save,restore}
Applying: treewide: convert PF_MEMALLOC manipulations to new helpers
Applying: treewide-convert-pf_memalloc-manipulations-to-new-helpers-fix
Applying: mtd: nand: nandsim: convert to memalloc_noreclaim_*()
Applying: cpumask: add helper cpumask_available()
Applying: kernel/irq/manage.c: use cpumask_available() for check of cpumask variable
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (6d1c75983595 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
Applying: kprobes/x86: merge fix for set_memory.h decoupling
