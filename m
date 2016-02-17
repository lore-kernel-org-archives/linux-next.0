From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Feb 17
Date: Wed, 17 Feb 2016 16:39:21 +1100
Message-ID: <20160217163921.42aeff6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20160216:

The net-next tree gained a conflict against the net tree.

The crypto tree gained a build failure so I used the version from
next-20160216.

The clockevents tree gained a conflict against Linus' tree.

The gpio tree lost its build failure.

The aio tree still had a build failure so I used the version from
next-20160111.

Non-merge commits (relative to Linus' tree): 5074
 4231 files changed, 179998 insertions(+), 81923 deletions(-)

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

I am currently merging 239 trees (counting Linus' and 36 trees of patches
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
Merging origin/master (65c23c65bee4 Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6)
Merging fixes/master (36f90b0a2ddd Linux 4.5-rc2)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (e972c37459c8 ARM: 8519/1: ICST: try other dividends than 1)
Merging m68k-current/for-linus (daf670bc9d36 m68k/defconfig: Update defconfigs for v4.5-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (c777e2a8b654 powerpc/mm: Fix Multi hit ERAT cause by recent THP update)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (ca0bb0798022 Add sun4v_wdt watchdog driver)
Merging net/master (372022830b06 tcp: do not set rtt_min to 1)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (848a21e064c1 netfilter: ipvs: handle ip_vs_fill_iph_skb_off failure)
Merging wireless-drivers/master (c699404db182 Merge tag 'iwlwifi-for-kalle-2016-02-15' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (212c5a5e6ba6 mac80211: minstrel: Change expected throughput unit back to Kbps)
Merging sound-current/for-linus (13d5e5d4725c ALSA: seq: Fix double port list deletion)
Merging pci-current/for-linus (0cf1337e0b83 PCI: rcar: Add device tree support for r8a7793)
Merging driver-core.current/driver-core-linus (18558cae0272 Linux 4.5-rc4)
Merging tty.current/tty-linus (18558cae0272 Linux 4.5-rc4)
Merging usb.current/usb-linus (18558cae0272 Linux 4.5-rc4)
Merging usb-gadget-fixes/fixes (6a4290cc28be usb: dwc3: gadget: set the OTG flag in dwc3 gadget driver.)
Merging usb-serial-fixes/usb-linus (18558cae0272 Linux 4.5-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (388f7b1d6e8c Linux 4.5-rc3)
Merging char-misc.current/char-misc-linus (18558cae0272 Linux 4.5-rc4)
Merging input-current/for-linus (ff84dabe3c6e Input: colibri-vf50-ts - add missing #include <linux/of.h>)
Merging crypto-current/master (8a3978ad55fb crypto: marvell/cesa - fix test in mv_cesa_dev_dma_init())
Merging ide/master (e04a2bd6d8c9 drivers/ide: make ide-scan-pci.c driver explicitly non-modular)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/kallsyms vs module insertion race.)
Merging vfio-fixes/for-linus (16ab8a5cbea4 vfio/noiommu: Don't use iommu_present() to track fake groups)
Merging kselftest-fixes/fixes (92e963f50fc7 Linux 4.5-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (631c0e84d941 Merge branch 'drm-fixes' of git://people.freedesktop.org/~airlied/linux)
Merging asm-generic/master (040b323b5012 ARM: asm/div64.h: adjust to generic codde)
Merging arc/for-next (59e164b8d2ea ARC: clockevent: Prepare for DT based probe)
Merging arm/for-next (9bf9dc709377 Merge branches 'component', 'fixes', 'misc' and 'tauros2' into for-next)
Merging arm-perf/for-next/perf (92e963f50fc7 Linux 4.5-rc1)
Merging arm-soc/for-next (ce4785b58783 ARM: SoC: document merges)
Merging at91/at91-next (8129febb508f ARM: dts: at91: at91sam9n12ek: fix panel compatible string)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging bcm2835-dt/bcm2835-dt-next (5ec6f2cd8ec4 ARM: bcm2835: Add the Raspberry Pi power domain driver to the DT.)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (92e963f50fc7 Linux 4.5-rc1)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (9519c91560f3 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (8fdbbde4a16c Merge branch 'for_4.6/keystone_dts' into next)
Merging mvebu/for-next (94bd511801b6 Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (28151408222a Merge branch 'omap-for-v4.6/dt' into for-next)
Merging omap-pending/for-next (8fe097a3d99e ARM: DRA7: hwmod: Add reset data for PCIe)
Merging qcom/for-next (305d0c411114 ARM: qcom: Drop ARCH_MSM* configs)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging renesas/next (e24005c0e7f0 Merge branches 'heads/arm64-dt-for-v4.6', 'heads/dt-for-v4.6' and 'heads/soc-for-v4.6' into next)
Merging rockchip/for-next (2def4fc4fc2d Merge branch 'v4.6-clk/next' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (e47aab925a76 Merge branch 'for-v4.6/non-critical-fixes' into for-next)
Merging sunxi/sunxi/for-next (5e04a6344023 Merge branches 'sunxi/clocks-for-4.6', 'sunxi/core-for-4.6', 'sunxi/drivers-for-4.6', 'sunxi/dt-for-4.6' and 'sunxi/defconfig-for-4.6' into sunxi/for-next)
Merging tegra/for-next (822a31bceba1 Merge branch for-4.6/arm64 into for-next)
Merging arm64/for-next/core (7abc7d833c9e arm64: use local label prefixes for __reg_num symbols)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in architecture startup code)
Merging h8300/h8300-next (11943fdd17d2 h8300: dts: Rename the serial port clock to fck)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (a9c9d9aca4e7 zorro: Use kobj_to_dev())
Merging m68knommu/for-next (cf5fa23ebbec m68knommu: fix FEC platform device registration when driver is modular)
Merging metag/for-next (c8b6ad8b3f87 metag: ftrace: remove the misleading comment for ftrace_dyn_arch_init)
Merging microblaze/next (c937adb7ec91 microblaze: Wire up userfaultfd, membarrier, mlock2 syscalls)
Merging mips/mips-for-linux-next (453195c962c6 Merge branch '4.5-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (afd2ff9b7e1b Linux 4.4)
Merging powerpc/next (388f7b1d6e8c Linux 4.5-rc3)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (44451d4d8f0e MAINTAINERS: Update Scott Wood's e-mail address)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (232f5dd78586 s390/oprofile: fix address range for asynchronous stack)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (f1c3418ed4e6 tile kgdb: fix bug in copy to gdb regs, and optimize memset)
Merging uml/linux-next (288b31a382d2 um: use %lx format specifiers for unsigned longs)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (bb2f3486041a Merge tag 'xtensa-for-next-20160111' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (988f1f576d4f Merge branch 'for-chris-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux into for-linus-4.5)
Merging btrfs-kdave/for-next (a64b4499dcba Merge branch 'for-next-4.6-20160216' into for-next-20160216)
Merging ceph/master (bbadd4529b09 libceph: MOSDOpReply v7 encoding)
Merging cifs/for-next (4b550af51985 cifs: fix erroneous return value)
Merging configfs/for-next (1609bac8af31 configfs: add myself as co-maintainer, updated git tree)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (5a9530e498ed ocfs2: Implement get_next_id())
Merging ext4/dev (c7e121edcdc4 ext4: fix memleak in ext4_readdir())
Merging f2fs/dev (9fa02d4ea5ec f2fs: avoid garbage lenghs in dentries)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (00bf5636b147 GFS2: Prevent delete work from occurring on glocks used for create)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (e0fa0d0189f6 pNFS: Always set NFS_LAYOUT_RETURN_REQUESTED with lo->plh_return_iomode)
Merging nfsd/nfsd-next (ee2bf98bbe90 NFSv4: fix getacl ERANGE for some ACL buffer sizes)
Merging orangefs/for-next (9b8217c8c2d8 Orangefs: remove vestigial ASYNC code)
Applying: orangfs: update for follow_link to get_link change
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (4fdd1d51ad5d ubifs: Use XATTR_*_PREFIX_LEN)
Merging xfs/for-next (e15c65b38461 Merge branch 'xfs-writepage-rework-4.6' into for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patches from Andrew))
Merging vfs/for-next (6f3925248b75 Merge branches 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
Merging pci/next (a314966fad61 Merge branches 'pci/host-designware', 'pci/host-imx6', 'pci/host-layerscape' and 'pci/host-rcar' into next)
Merging hid/for-next (465ea91916e1 Merge branch 'for-4.6/wacom' into for-next)
Merging i2c/i2c/for-next (61c18aeb05c3 i2c: uniphier: add COMPILE_TEST option)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (972d7d17b6bb hwmon: Add LTC2990 sensor driver)
Merging v4l-dvb/master (0d8f3357897d Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (f6f756ddd65f Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (a2127e400edd libata: support AHCI on OCTEON platform)
Merging pm/linux-next (a2f87e06b7b7 Merge branch 'pm-domains' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (98d94507e10c Merge branches 'thermal-intel', 'thermal-suspend-fix' and 'thermal-soc' into next)
Merging thermal-soc/next (a53b8394ec3c thermal: cpu_cooling: fix out of bounds access in time_in_idle)
Merging ieee1394/for-next (575913946989 firewire: ABI documentation: jujuutils were renamed to linux-firewire-utils)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h standalone includible)
Merging slave-dma/next (bc9f904086cc Merge branch 'topic/ioatdma' into next)
Merging net-next/master (4952cd3e7b47 tipc: refactor node xmit and fix memory leaks)
CONFLICT (content): Merge conflict in drivers/net/vxlan.c
CONFLICT (content): Merge conflict in drivers/net/phy/bcm7xxx.c
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (f87fc3ad6392 netfilter: ipvs: avoid unused variable warnings)
Merging wireless-drivers-next/master (11e70824e75f mwifiex: firmware dump support for w8997 chipset)
Merging bluetooth/master (9a6a1c77e1fc Bluetooth: Use managed version of led_trigger_register in LED trigger)
Merging mac80211-next/master (94106d26c380 mac80211: fix VHT MU-MIMO frame processing)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
Merging rdma/for-next (34356f64ac0d IB/mlx5: Unify CQ create flags check)
Merging mtd/master (38714fbd299f MAINTAINERS: update Han's email)
Merging l2-mtd/master (3b5394a3ccff mtd: spi-nor: remove micron_quad_enable())
Merging crypto/master (ba871e1d2991 crypto: doc - add skcipher API documentation)
$ git reset --hard HEAD^
Merging next-20160216 version of crypto
Merging drm/drm-next (5443ce86fa37 drm: virtio-gpu: set atomic flag)
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (ea49c9acf2db drm/i915: Lock mode_config.mutex in intel_display_resume.)
Merging drm-tegra/drm/tegra/for-next (d50bbe33efb5 gpu: host1x: Use a signed return type for do_relocs())
Merging drm-misc/topic/drm-misc (49f718c57bf5 drm: fixes crct set_mode when crtc mode_fixup is null.)
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (8bb912e606b7 arm64: Juno: Add HDLCD support to the Juno boards.)
Merging drm-vc4/drm-vc4-next (fc04023fafec drm/vc4: Add support for YUV planes.)
Merging sound/for-next (cbaaee80e151 Merge branch 'topic/core-fixes' into for-next)
Merging sound-asoc/for-next (7715cc83c05a Merge remote-tracking branches 'asoc/topic/rt5659', 'asoc/topic/samsung', 'asoc/topic/ssm4567', 'asoc/topic/topology' and 'asoc/topic/wm8974' into asoc-next)
Merging modules/modules-next (b37a05c083c8 Merge branch 'akpm' (patches from Andrew))
Merging input/next (1261d013daea Input: Allow compile test of Goodix and Colibri VF50 if !GPIOLIB)
Merging block/for-next (ab3d8b3ecf77 Merge branch 'for-4.6/core' into for-next)
Merging device-mapper/for-next (aa8c484be790 dm thin metadata: remove needless newline from subtree_dec() DMERR message)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (1ecc7d0bb6c6 mmc: mediatek: add SD write protect support)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (466b8b090e14 md/raid5: Compare apples to apples (or sectors to sectors))
Merging mfd/for-mfd-next (103d8a7bb8a2 mfd: tps65090: Set regmap config reg counts properly)
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: Free PWM requested by legacy API on error path)
Merging battery/master (6659b55dae09 power_supply: Add types for USB Type C and PD chargers)
Merging omap_dss2/for-next (f059c4b220b8 fbdev: exynos: fix IS_ERR_VALUE usage)
Merging regulator/for-next (f1ab493d3c1a Merge remote-tracking branches 'regulator/topic/qcom-saw' and 'regulator/topic/vexpress' into regulator-next)
Merging security/next (8e0ee3c9faed tpm: fix the cleanup of struct tpm_chip)
Merging integrity/next (70ded691640f ima: use "ima_hooks" enum as function argument)
Merging selinux/next (9090a2d5e3e6 selinux: use absolute path to include directory)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1926e54f1157 MAINTAINERS: Update mailing list for Renesas ARM64 SoC Development)
Merging iommu/next (fd6b6b40c17e Merge branches 'iommu/fixes' and 'arm/rockchip' into next)
Merging dwmw2-iommu/master (46924008273e iommu/vt-d: Clear PPR bit to ensure we get more page request interrupts)
Merging vfio/next (d4f50ee2f5b4 vfio/iommu_type1: make use of info.flags)
Merging jc_docs/docs-next (5645a717c6ee Documentation: HOWTO: remove obsolete info about regression postings)
Merging trivial/for-next (d00cd819d7df drivers/rtc: broken link fix)
Merging audit/next (fd97646b0595 audit: Fix typo in comment)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (6338b8a12d0a Merge branches 'dt/linus' and 'dt/next' into for-next)
Merging mailbox/mailbox-for-next (be9c09bcca03 arm64: dts: mailbox device tree node for APM X-Gene platform.)
Merging spi/for-next (21b3f8c97888 Merge remote-tracking branches 'spi/topic/rockchip' and 'spi/topic/ti-qspi' into spi-next)
Merging tip/auto-latest (240b2c974ce5 Merge branch 'x86/platform')
Merging clockevents/clockevents/next (23cb25d0f407 clocksource/drivers/arm_global_timer: Register delay timer)
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (7cc5a5d3cd4c ARM: socfpga: Enable OCRAM ECC on startup)
Merging irqchip/irqchip/for-next (cb49d86dbe7a ARM: mvebu: Use the ARMADA_370_XP_IRQ option)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (7fd13615992a tracing/dma-buf/fence: Fix timeline str value on fence_annotate_wait_on)
Merging rcu/rcu/next (0dd1befbc663 rcu: Remove expedited GP funnel-lock bypass)
Merging kvm/linux-next (efef127c30c5 Merge tag 'kvm-s390-next-4.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (1f4fa0c0e5bf arm/arm64: KVM: Handle out-of-RAM cache maintenance as a NOP)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (765bdb406de4 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging kvms390/next (1763f8d09d52 KVM: s390: bail out early on fatal signal in dirty logging)
Merging xen-tip/linux-next (a4cdb556cae0 xen/gntdev: add ioctl for grant copy)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (d6e022f1d207 workqueue: handle NUMA_NO_NODE for unbound pool_workqueue lookup)
Merging drivers-x86/for-next (b0c141b8f86b dell-led: use dell_smbios_send_request() for performing SMBIOS calls)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (d6a4b84e2d0e Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/irq' into regmap-next)
Merging hsi/for-next (87d99063be01 HSI: ssi-protocol: Use handshake logic from n950)
Merging leds/for-next (ee2e1c2d18a4 leds: leds-gpio: Fix return value check in create_gpio_led())
Merging ipmi/for-next (7f8df84ecba8 ipmi_si: Avoid a wrong long timeout on transaction done)
Merging driver-core/driver-core-next (112d125a8947 Revert "driver-core: platform: probe of-devices only using list of compatibles")
Merging tty/tty-next (a3f0b77f36ca sc16is7xx: implemented get_mctrl)
Merging usb/usb-next (264904ccc33c usb: retry reset if a device times out)
Merging usb-gadget/next (36f90b0a2ddd Linux 4.5-rc2)
Merging usb-serial/usb-next (18558cae0272 Linux 4.5-rc4)
Merging usb-chipidea-next/ci-for-usb-next (6b8bc9c6fb26 usb: chipidea: udc: remove unused value assignment)
Merging staging/staging-next (1d427da1d7f9 Platform: goldfish: goldfish_pipe.c: Add DMA support using managed version)
CONFLICT (modify/delete): drivers/staging/dgap/dgap.c deleted in staging/staging-next and modified in HEAD. Version HEAD of drivers/staging/dgap/dgap.c left in tree.
$ git rm -f drivers/staging/dgap/dgap.c
Merging char-misc/char-misc-next (396ec3dea3d8 ppdev: use dev_* macros)
CONFLICT (content): Merge conflict in drivers/staging/goldfish/goldfish_nand.c
CONFLICT (content): Merge conflict in drivers/platform/goldfish/goldfish_pipe.c
Merging extcon/extcon-next (0331966df0a2 arm: boot: beaglex15: pass correct interrupt)
Merging cgroup/for-next (363f5a7f6530 Merge branch 'for-4.6' into for-next)
Merging scsi/for-next (cef98052b16c Merge branch 'fixes' into for-next)
Merging target-updates/for-next (fab683eb12e7 scsi: qla2xxxx: avoid type mismatch in comparison)
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (683072c71ff1 Merge branch 'devel' into for-next)
Merging vhost/linux-next (481eaec37e91 tools/virtio: add ringtest utilities)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (8e3e4ad055ea Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/pinctrl/sunxi/pinctrl-sunxi.c
CONFLICT (content): Merge conflict in drivers/gpio/Makefile
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (ff01c944cfa9 pwm: Mark all devices as "might sleep")
Merging dma-buf/for-next (0cbb0b92689a Merge tag 'pci-v4.5-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (3aef66490d8e Merge branch 'clk-bcm2835' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (fb2e69217129 aio: Fix compile error due to unexpected use of cmpxchg())
$ git reset --hard HEAD^
Merging next-20160111 version of aio
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (92e963f50fc7 Linux 4.5-rc1)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (36f90b0a2ddd Linux 4.5-rc2)
Merging livepatching/for-next (03f726f415f5 Merge branch 'for-4.5/upstream-fixes' into for-next)
Merging coresight/next (37fe87dbde16 coresight: implementing 'cpu_id()' API)
Merging rtc/rtc-next (578bb1d82bdd rtc: rtc-ds1307: add clock provider support for DS3231)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (36f90b0a2ddd Linux 4.5-rc2)
Merging akpm-current/current (b424a3e227e8 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in fs/ocfs2/aops.c
CONFLICT (content): Merge conflict in arch/mips/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression
Merging akpm/master (cd97f1956dd7 drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min() expression)
