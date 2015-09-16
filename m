From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Sep 16
Date: Wed, 16 Sep 2015 13:15:38 +1000
Message-ID: <20150916131538.658234b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34304 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751378AbbIPDPk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2015 23:15:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20150915:

Dropped tree: akpm-current (build conflict)

I used the h8300 tree from next-20150828 since the current tree has been
rebased onto something very old :-(

The net-next tree gained a build failure for which I applied a fix patch.

The bluetooth tree still had its build failure.

The tip tree gained a build failure so I used the version from
next-20150915.

The akpm-current tree still had its build failure so I dropped it again
for today.

Non-merge commits (relative to Linus' tree): 1179
 978 files changed, 65094 insertions(+), 13956 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64,
a multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), it is also built with powerpc allnoconfig
(32 and 64 bit), ppc44x_defconfig and allyesconfig (this fails its final
link) and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 226 trees (counting Linus' and 33 trees of patches
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
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (09a77a885233 modsign: Fix GPL/OpenSSL licence incompatibility)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (c2172ce23030 Merge branch 'uaccess' into fixes)
Merging m68k-current/for-linus (1ecb40643a9a m68k/bootinfo: Use kmemdup rather than duplicating its implementation)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (e297c939b745 powerpc/MSI: Fix race condition in tearing down MSI interrupts)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (892aa01df2ad net: stmmac: Use msleep rather then udelay for reset delay)
Merging ipsec/master (04a6b8bfee06 xfrm6: Fix ICMPv6 and MH header checks in _decode_session6)
Merging sound-current/for-linus (5ee20bc79246 ALSA: usb-audio: Change internal PCM order)
Merging pci-current/for-linus (d5da9d99d4d7 PCI: Revert "PCI: Call pci_read_bridge_bases() from core instead of arch code")
Merging wireless-drivers/master (741e3b9902d1 rtlwifi: rtl8723be: Add module parameter for MSI interrupts)
Merging driver-core.current/driver-core-linus (6ff33f3902c3 Linux 4.3-rc1)
Merging tty.current/tty-linus (6ff33f3902c3 Linux 4.3-rc1)
Merging usb.current/usb-linus (6ff33f3902c3 Linux 4.3-rc1)
Merging usb-gadget-fixes/fixes (762982db33b2 usb: phy: phy-generic: Fix reset behaviour on legacy boot)
Merging usb-serial-fixes/usb-linus (19ab6bc5674a USB: option: add ZTE PIDs)
Merging staging.current/staging-linus (8b5081c876bd staging: unisys: visornic: handle error return from device registration)
Merging char-misc.current/char-misc-linus (6ff33f3902c3 Linux 4.3-rc1)
Merging input-current/for-linus (53431d0a3534 Merge branch 'next' into for-linus)
Merging crypto-current/master (84cba178a3b8 crypto: testmgr - don't copy from source IV too much)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (fb9caeedafe6 mfd: Remove MFD_CROS_EC_SPI depends on OF)
Merging drm-intel-fixes/for-linux-next-fixes (c13dcf9f2d6f Linux 4.2-rc8)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging arm/for-next (4cd545806d3c Merge branch 'drm-dwhdmi-devel' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (f47c3594f854 Merge branch 'next/late' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/serial/mtk-uart.txt
Merging at91/at91-next (253ebd4df402 Merge branch 'at91-4.3-defconfig' into at91-next)
CONFLICT (content): Merge conflict in arch/arm/mach-at91/sama5.c
CONFLICT (content): Merge conflict in arch/arm/configs/at91_dt_defconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (c746ef1b64e9 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2l.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2hk.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/k2e.dtsi
Merging mvebu/for-next (adfc8c76d84a Merge branch 'mvebu/config' into mvebu/for-next)
Merging omap/for-next (7168e947291f Merge branch 'fixes-rc1' into omap-for-v4.3/fixes)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (37a7a47c0031 Merge tag 'qcom-fixes-for-4.3-rc1' into next-base)
Merging renesas/next (f8aff9669745 Merge branches 'heads/sh-drivers-for-v4.3', 'heads/defconfig-for-v4.4', 'heads/dt-for-v4.4' and 'heads/soc-for-v4.4' into next)
Merging rockchip/for-next (ed0450118b2f Merge branch 'v4.3-armsoc/soc' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (112129267f1a Merge branch 'v4.3-next/dt64-samsung' into for-next)
Merging samsung-krzk/for-next (245b6177eeff Merge branch 'defconfig-for-next' into for-next)
Merging sunxi/sunxi/for-next (9d73c13a139c Merge branches 'sunxi/dt-for-4.3' and 'sunxi/defconfig-for-4.3' into sunxi/for-next)
Merging tegra/for-next (bea5a17a8beb Merge branch for-4.3/defconfig into for-next)
Merging arm64/for-next/core (6ff33f3902c3 Linux 4.3-rc1)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq())
Merging cris/for-next (254a0f413548 CRISv10: delete unused lib/dmacopy.c)
Merging h8300/h8300-next (99bcfda85f66 Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time")
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (887ce682fb17 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3fe6942f0486 Documentation/features/vm: Meta2 is capable of THP)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (807249d3ada1 Merge branch 'upstream' of git://git.linux-mips.org/pub/scm/ralf/upstream-linus)
Merging nios2/for-next (08441d462ebd nios2: add Max10 defconfig)
Merging parisc-hd/for-next (64291f7db5bd Linux 4.2)
Merging powerpc/next (ff474e8ca854 Merge tag 'powerpc-4.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (4524cd093fa8 powerpc/t1023rdb/dts: set ifc nand chip select from 2 to 1)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hugepage invalidate)
Merging s390/features (0d764c637709 s390/dasd: mark DASD devices as non rotational)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (fa5d8f13afb8 tile: fix build failure)
Merging uml/linux-next (bdbac7d0e2b3 um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (eda2116f4ab6 [CIFS] mount option sec=none not displayed properly in /proc/mounts)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (9181f8bf5abf udf: Don't modify filesystem for read-only mounts)
Merging ext4/dev (bdfe0cbd746a Revert "ext4: remove block_device_ejected")
Merging f2fs/dev (51e771c0d25b Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (6ff33f3902c3 Linux 4.3-rc1)
Merging nfsd/nfsd-next (a909e9f9d73a nfsd: don't hold i_mutex over userspace upcalls)
Merging orangefs/for-next (600896a3b8b0 Orangefs: Swap order of include files)
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outside iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (071a1f837f72 UGIFS: fix a typo in comment of ubifs_budget_req)
Merging xfs/for-next (5d54b8cdeaf4 Merge branch 'xfs-misc-fixes-for-4.3-4' into for-next)
Merging file-locks/linux-next (ee296d7c5709 locks: inline posix_lock_file_wait and flock_lock_file_wait)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (6ff33f3902c3 Linux 4.3-rc1)
Merging hid/for-next (c5a0db1eed32 Merge branch 'for-4.3/wacom' into for-next)
Merging i2c/i2c/for-next (f5956abbe430 Merge branch 'i2c/for-4.3' into i2c/for-next)
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (1b1165fa06db hwmon: Driver for Maxim MAX31790)
Merging v4l-dvb/master (41a8f406dacd Merge branch 'missed' into to_next)
CONFLICT (content): Merge conflict in mm/Makefile
Merging kbuild/for-next (a8503631df45 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (88622d80af82 ata: pata_pxa: dmaengine conversion)
Merging pm/linux-next (6ff33f3902c3 Linux 4.3-rc1)
Merging idle/next (aba5686671dc Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (6ff33f3902c3 Linux 4.3-rc1)
Merging thermal-soc/next (a794b4f32921 Merge tag 'for-linus-4.3' of git://git.code.sf.net/p/openipmi/linux-ipmi)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single function)
Merging slave-dma/next (6ff33f3902c3 Linux 4.3-rc1)
Merging net-next/master (ad1e7b97b3ad cdc: Fix build warning.)
Merging ipsec-next/master (e69948a0a530 net: Document xfrm4_gc_thresh and xfrm6_gc_thresh)
Merging wireless-drivers-next/master (0ba3ac03c1f3 Merge ath-next from ath.git)
Merging bluetooth/master (c258b966b5d6 Bluetooth: bt3c_cs: clean up obsolete functions)
Applying: drivers/net/ieee802154/at86rf230.c: seq_printf() now returns NULL
Applying: drivers-net-ieee802154-at86rf230c-seq_printf-now-returns-null-fix
Merging rdma/for-next (64291f7db5bd Linux 4.2)
Merging mtd/master (6ff33f3902c3 Linux 4.3-rc1)
Merging l2-mtd/master (db66e32e0d2a Merge tag 'v4.3-rc1' into MTD -next development)
Merging crypto/master (bf433416e675 crypto: algif_aead - fix for multiple operations on AF_ALG sockets)
Merging drm/drm-next (73bf1b7be7aa Merge branch 'drm-next-4.3' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-panel/drm/panel/for-next (a33ee95f8f45 drm/bridge: Put Kconfig entries in a separate menu)
Merging drm-intel/for-linux-next (824257857fd8 drm/i915: Allow DSI dual link to be configured on any pipe)
Merging drm-tegra/drm/tegra/for-next (459cc2c6800b drm/tegra: sor: Add HDMI support)
Merging drm-misc/topic/drm-misc (216c59d65f99 drm/atomic-helper: Don't skip plane disabling on active CRTC)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (d248b61f6114 drm/msm/dsi: Introduce DSI configuration module)
Merging sound/for-next (0052b7dcf9d9 ALSA: pcm: remove structure member of 'struct snd_pcm_hwptr_log *' type because this structure had been removed)
Merging sound-asoc/for-next (26f4093b46b9 Merge remote-tracking branches 'asoc/topic/pxa', 'asoc/topic/rcar', 'asoc/topic/sh' and 'asoc/topic/ux500' into asoc-next)
Merging modules/modules-next (5cfb203a304d modpost: abort if a module symbol is too long)
Merging input/next (ade9c1a47c81 Input: imx_keypad - remove obsolete comment)
Merging block/for-next (3cb73014ad06 Merge branch 'for-4.3/core' into for-next)
Merging device-mapper/for-next (586b286b110e dm crypt: constrain crypt device's max_segment_size to PAGE_SIZE)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (552e7e6b679f mmc: sd: Remove superfluous error code assignment)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (e89c6fdf9e0e Merge linux-block/for-4.3/core into md/for-linux)
Merging mfd/for-mfd-next (5a688c455066 mfd: jz4740-adc: Init mask cache in generic IRQ chip)
Merging backlight/for-backlight-next (13d20b3b618a backlight: tosa: Export I2C module alias information)
Merging battery/master (9bdc0e5eee20 twl4030_charger: fix another compile error)
Merging omap_dss2/for-next (7b554088d56e video: fbdev: pxa168fb: Use devm_clk_get)
Merging regulator/for-next (bcdfb18ae2ac Merge remote-tracking branches 'regulator/topic/bcm590xx', 'regulator/topic/da9063' and 'regulator/topic/qcom-smd' into regulator-next)
Merging security/next (07f081fb5057 PKCS#7: Add OIDs for sha224, sha284 and sha512 hash algos and use them)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (fda4d578ed0a selinux: explicitly declare the role "base_r")
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (55f1dfb398d9 watchdog: iTCO: Fix dependencies on I2C)
Merging iommu/next (4ad79562577a Merge branches 'arm/omap', 'arm/msm', 'arm/smmu', 'arm/tegra', 'x86/vt-d', 'x86/amd', 'ppc/pamu' and 'core' into next)
Merging dwmw2-iommu/master (5dbaf90a6780 iommu/vt-d: Add initial shell of SVM support)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (4d73270192ec scripts/kernel-doc: Replacing highlights hash by an array)
Merging trivial/for-next (e5f6450c3f40 MAINTAINERS: update my e-mail address)
Merging audit/next (183434eefa74 audit: try harder to send to auditd upon netlink failure)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (c8fb70a3e8dd MAINTAINERS: Add Frank Rowand as DT maintainer)
Merging mailbox/mailbox-for-next (86e488adaab7 mailbox: arm_mhu: reduce txpoll_period from 10ms to 1 ms)
Merging spi/for-next (0c9c2fc26522 Merge remote-tracking branches 'spi/topic/bcm63xx' and 'spi/topic/s3c64xx' into spi-next)
Merging tip/auto-latest (0b2dd639ecdd Merge branch 'x86/urgent')
$ git reset --hard HEAD^
Merging next-20150915 version of tip
Applying: cdc: add header guards
[master e7d3b37fed11] next-20150915/tip
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (d5c268153978 x86/mce: Don't clear shared banks on Intel when offlining CPUs)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b7dc42fd7939 ring-buffer: Revert "ring-buffer: Get timestamp after event is allocated")
Merging rcu/rcu/next (dc3a04d551b5 security/device_cgroup: Fix RCU_LOCKDEP_WARN() condition)
Merging kvm/linux-next (81523aac01a7 KVM: make the declaration of functions within 80 characters)
Merging kvm-arm/next (43297dda0a51 KVM: arm64: add workaround for Cortex-A57 erratum #852523)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (4e33d1f0a145 KVM: PPC: Book3S: Fix typo in top comment about locking)
Merging kvms390/next (152b28392a8d KVM: s390: Fix assumption that kvm_set_irq_routing is always run successfully)
Merging xen-tip/linux-next (3e64472c1c74 xen: switch extra memory accounting to use pfns)
CONFLICT (content): Merge conflict in arch/x86/include/asm/xen/page.h
Merging percpu/for-next (292c24a073ee percpu: clean up of schunk->map[] assignment in pcpu_setup_first_chunk)
Merging workqueues/for-next (355c06633e23 workqueue: fix some docbook warnings)
Merging drivers-x86/for-next (85b4e4eb2f9a wmi: Remove private %pUL implementation)
Merging chrome-platform/for-next (1d95e6f10fd8 platform/chrome: cros_ec: Fix possible leak in led_rgb_store())
Merging regmap/for-next (b4a21fc275e9 regmap: Allocate buffers with GFP_ATOMIC when fast_io == true)
Applying: mfd: Fixup clients of multi_reg_write/register_patch
Merging hsi/for-next (d770e558e219 Linux 4.2-rc1)
Merging leds/for-next (b0ba362c611f leds:lp55xx: Correct Kconfig dependency for f/w user helper)
Merging ipmi/for-next (bf2d087749d9 ipmi:ssif: Add a module parm to specify that SMBus alerts don't work)
Merging driver-core/driver-core-next (6ff33f3902c3 Linux 4.3-rc1)
Merging tty/tty-next (6ff33f3902c3 Linux 4.3-rc1)
Merging usb/usb-next (6ff33f3902c3 Linux 4.3-rc1)
Merging usb-gadget/next (2f3cc24f07b8 usb: musb: gadget: fix build break by adding missing 'break')
Merging usb-serial/usb-next (6ff33f3902c3 Linux 4.3-rc1)
Merging staging/staging-next (6dd19f19a5e2 staging/rtl8188eu : Remove duplicated BIT() definitions)
Merging char-misc/char-misc-next (6ff33f3902c3 Linux 4.3-rc1)
Merging extcon/extcon-next (b3792ea45887 extcon: axp288: Convert to using managed resources)
Merging kdbus/kdbus (a36324913ff2 kdbus: selftests: add more name registry tests)
CONFLICT (content): Merge conflict in tools/testing/selftests/Makefile
Merging cgroup/for-next (eacb1e7d4bfa Merge branch 'for-4.3' into for-next)
Merging scsi/for-next (294ab783ad98 scsi_dh: fix randconfig build error)
Merging target-updates/for-next (ac64a2ce5091 target: use stringify.h instead of own definition)
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (fa84b52cb681 pinctrl: samsung: s3c24xx: fix syntax error)
Merging vhost/linux-next (997e120843e8 virtio_balloon: do not change memory amount visible via /proc/meminfo)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (46d4f7c25e1b gpio: omap: Fix GPIO numbering for deferred probe)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (7a5938201834 ARM: at91: pwm: atmel-hlcdc: Add at91sam9n12 errata)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (4b75de861505 fs: Set the size of empty dirs to 0.)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (6336dc3e33cd clk: divider: handle integer overflow when dividing large clock rates)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (6ff33f3902c3 Linux 4.3-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (8503d45d4f27 Coresight: ETMv4: Prevent TRCRSCTLR0&1 from being accessed)
Merging rtc/rtc-next (ec7fe80d5f9e rtc: pcf2127: make module license match the file header)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (004f1afbe199 libnvdimm, pmem: direct map legacy pmem by default)
Merging akpm-current/current (fadfe9f50067 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/syscalls.h
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
$ git reset --hard HEAD^
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (a1cdeb45ec62 drivers/w1/w1_int.c: call put_device if device_register fails)
