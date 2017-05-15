From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 15
Date: Mon, 15 May 2017 12:58:34 +1000
Message-ID: <20170515125834.77a9b64d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757090AbdEOC6h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 May 2017 22:58:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170512:

Non-merge commits (relative to Linus' tree): 508
 569 files changed, 13787 insertions(+), 5574 deletions(-)

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
Merging origin/master (2ea659a9ef48 Linux 4.12-rc1)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging arc-current/for-curr (cf4100d1cddc Revert "ARCv2: Allow enabling PAE40 w/o HIGHMEM")
Merging arm-current/fixes (6d8059493691 ARM: 8670/1: V7M: Do not corrupt vector table around v7m_invalidate_l1 call)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (be5c5e843c4a powerpc/64: Fix HMI exception on LE with CONFIG_RELOCATABLE=y)
Merging sparc/master (3c7f62212018 sparc64: fix fault handling in NGbzero.S and GENbzero.S)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (1c4d5f51a812 vmxnet3: ensure that adapter is in proper state during force_close)
Merging ipsec/master (2c1497bbc8fd xfrm: Fix NETDEV_DOWN with IPSec offload)
Merging netfilter/master (f411af682218 Merge branch 'ibmvnic-Updated-reset-handler-andcode-fixes')
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (29cee56c0be4 Merge tag 'mac80211-for-davem-2017-05-08' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging sound-current/for-linus (31cbee6a5611 sound: Disable the build of OSS drivers)
Merging pci-current/for-linus (b9c1153f7a9c PCI: hisi: Fix DT binding (hisi-pcie-almost-ecam))
Merging driver-core.current/driver-core-linus (af82455f7dbd Merge tag 'char-misc-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging tty.current/tty-linus (4f7d029b9bf0 Linux 4.11-rc7)
Merging usb.current/usb-linus (a71c9a1c779f Linux 4.11-rc5)
Merging usb-gadget-fixes/fixes (a351e9b9fc24 Linux 4.11)
Merging usb-serial-fixes/usb-linus (c02ed2e75ef4 Linux 4.11-rc4)
Merging usb-chipidea-fixes/ci-for-usb-stable (c7fbb09b2ea1 usb: chipidea: move the lock initialization to core file)
Merging phy/fixes (1a09b6a7c10e phy: qcom-usb-hs: Add depends on EXTCON)
Merging staging.current/staging-linus (09d79d103371 Merge tag 'docs-4.12-2' of git://git.lwn.net/linux)
Merging char-misc.current/char-misc-linus (af82455f7dbd Merge tag 'char-misc-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging input-current/for-linus (3af9256150b3 Input: cros_ec_keyb - remove extraneous 'const')
Merging crypto-current/master (929562b14478 crypto: stm32 - Fix OF module alias information)
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (c1ae3cfa0e89 Linux 4.11-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (24a47426066c [media] exynos-gsc: Do not swap cb/cr for semi planar formats)
Merging drm-intel-fixes/for-linux-next-fixes (a351e9b9fc24 Linux 4.11)
Merging drm-misc-fixes/for-linux-next-fixes (0c45b36f8acc drm/udl: Fix unaligned memory access in udl_render_hline)
Merging kbuild/for-next (cb77f0d623ff scripts: Switch to more portable Perl shebang)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (c92a90a5060a Merge branches 'fixes' and 'misc' into for-next)
Merging arm-perf/for-next/perf (f00fa5f4163b arm64: pmuv3: use arm_pmu ACPI framework)
Merging arm-soc/for-next (e3ec06d4bc1e arm-soc: document merges)
CONFLICT (content): Merge conflict in drivers/tee/tee_shm.c
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
Merging rockchip/for-next (b8c322bd1c56 Merge branch 'v4.13-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (1001354ca341 Linux 4.9-rc1)
Merging samsung-krzk/for-next (c62e288fcc00 Merge branch 'fixes' into for-next)
Merging sunxi/sunxi/for-next (9bff96266476 Merge branches 'sunxi/clk-fixes-for-4.12', 'sunxi/dt-for-4.13', 'sunxi/dt64-for-4.13' and 'sunxi/fixes-for-4.12' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (0c2cf6d9487c arm64: Silence first allocation with CONFIG_ARM64_MODULE_PLTS=y)
Merging clk/clk-next (0119dc6132d2 clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (1072734a2c63 m68k/defconfig: Update defconfigs for v4.12-rc1)
Merging m68knommu/for-next (99a2c395541f m68k/coldfire/pit: set ->min_delta_ticks and ->max_delta_ticks)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (19e816573612 MIPS: mm: adjust PKMAP location)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (5aa2aabff1ce parisc: Stop CPUs via PAT firmware before system halt or reboot.)
Merging powerpc/next (5a61ef74f269 powerpc/64s: Support new device tree binding for discovering CPU features)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (05aa5114d050 s390/pkey: add missing __user annotations)
Merging sparc-next/master (94836ecf1e73 Merge tag 'nfsd-4.11-2' of git://linux-nfs.org/~bfields/linux)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6fad04b7585d Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (24f8acd362fc Merge branch 'for-next-next-v4.13-20170512' into for-next-20170512)
Merging ceph/master (eeca958dce0a ceph: fix memory leak in __ceph_setxattr())
Merging cifs/for-next (67b4c889cc83 [CIFS] Minor cleanup of xattr query function)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (07f7e3135e58 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (17f423b51607 jbd2: cleanup write flags handling from jbd2_write_superblock())
Merging f2fs/dev (2d3e4866dea9 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0b6e9ea041e6 fuse: Add support for pid namespaces)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (76b2a303384e pNFS/flexfiles: Always attempt to call layoutstats when flexfiles is enabled)
Merging nfsd/nfsd-next (b26b78cb7260 nfsd: Fix up the "supattr_exclcreat" attributes)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (65f2673832d4 ovl: update documentation w.r.t. constant inode numbers)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (7bccd12d27b7 ubi: Add debugfs file for tracking PEB state)
Merging xfs/for-next (161f55efba5d xfs: fix use-after-free in xfs_finish_page_writeback)
Merging file-locks/linux-next (07d9a380680d Linux 4.9-rc2)
Merging vfs/for-next (919bb328b020 Merge branch 'work.misc' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (cf39bf58afda printk: fix double printing with earlycon)
Merging pci/next (3146c8f4de9b Merge branch 'pci/remove' into next)
Merging pstore/for-next/pstore (d123ad328124 efi-pstore: Fix read iter after pstore API refactor)
Merging hid/for-next (edb2a51c6fbb Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (f49ee0593cde Merge branch 'i2c/for-4.12' into i2c/for-next)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (6eaaea144dc5 hwmon: (pmbus) Add client driver for IR35221)
Merging jc_docs/docs-next (25a0da73f24c doc: replace FTP URL to kernel.org with HTTPS one)
Merging v4l-dvb/master (3622d3e77ece [media] ov2640: print error if devm_*_optional*() fails)
Merging v4l-dvb-next/master (6d95b3f24881 Merge branch 'TTT' into to_next)
Merging fbdev/fbdev-for-next (34bf129a7f06 fbdev: sti: don't select CONFIG_VT)
Merging pm/linux-next (eac94524b023 Merge branches 'acpi-tools' and 'acpi-button' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (19fd1783c24e Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (c0ae14857677 dlm: Fix kernel memory disclosure)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (89c9fea3c803 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging ipsec-next/master (e892d2d40445 esp: Fix misplaced spin_unlock_bh.)
Merging netfilter-next/master (89c9fea3c803 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (47d272f0f988 Merge tag 'iwlwifi-next-for-kalle-2017-04-26' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next)
Merging bluetooth/master (2a25b3faef44 Bluetooth: hci_ldisc: Use rwlocking to avoid closing proto races)
Merging mac80211-next/master (89c9fea3c803 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial)
Merging rdma/for-next (67cf3623e097 rxe: expose num_possible_cpus() cnum_comp_vectors)
Merging gfs2/for-next (3ef2bc099d1c Merge tag 'devicetree-for-4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging mtd/master (a9402889f41c MAINTAINERS: Update NAND subsystem git repositories)
Merging l2-mtd/master (a9402889f41c MAINTAINERS: Update NAND subsystem git repositories)
Merging nand/nand/next (9d2ee0a60b8b mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program)
Merging spi-nor/spi-nor/next (b67166569698 mtd: spi-nor: Potential oops on error path in quad_enable())
Merging crypto/master (929562b14478 crypto: stm32 - Fix OF module alias information)
Merging drm/drm-next (7b8cd3363e8a drm/i915: Make vblank evade warnings optional)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (88326ef05b26 drm/i915: Confirm the request is still active before adding it to the await)
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
Merging drm-misc/for-linux-next (e345da82bd6b drm/edid: Add 10 bpc quirk for LGD 764 panel in HP zBook 17 G2)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (763656d30b3d drm: mali-dp: use div_u64 for expensive 64-bit divisions)
Merging sunxi-drm/sunxi-drm/for-next (cf80aeef958f drm/sun4i: backend: Clarify sun4i_backend_layer_enable debug message)
Merging imx-drm/imx-drm/next (1465dc794b00 gpu: ipu-v3: prg: remove counter load enable)
Merging etnaviv/etnaviv/next (d79fd1ccf2cd drm/etnaviv: implement cooling support for new GPU cores)
Merging kspp/for-next/kspp (62111ab351b8 Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (037ea61a9241 ALSA: usb-audio: fix Amanero Combo384 quirk on big-endian hosts)
Merging sound-asoc/for-next (20d5c84bef06 Merge remote-tracking branches 'asoc/topic/wm8960', 'asoc/topic/wm8978' and 'asoc/topic/zte-tdm' into asoc-next)
Merging modules/modules-next (175861882769 kallsyms: Use bounded strnchr() when parsing string)
Merging input/next (d899520b0431 Input: elantech - force relative mode on a certain module)
Merging block/for-next (0789bd7bdb5b Merge branch 'for-linus' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (0e8a4f1a22f4 dm ioctl: report event number in DM_LIST_DEVICES)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (a627f025eb05 mmc: sdhci-of-esdhc: limit SD clock for ls1012a/ls1046a)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (d82dd0e34d03 raid1: prefer disk without bad blocks)
Merging mfd/for-mfd-next (ab6241ae07c3 input: touchscreen: mxs-lradc: || vs && typos)
Merging backlight/for-backlight-next (e739c5bb20be backlight: Add support for Arctic Sand LED backlight driver chips)
Merging battery/for-next (70c9fc9a5605 power: supply: cpcap-charger: Fix charger voltages based on ADC values)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (f123e7b2a6e3 Merge remote-tracking branch 'regulator/topic/vctrl' into regulator-next)
Merging security/next (99c55fb18fc4 security: Grammar s/allocates/allocated/)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (e36484b5ac31 crypto : asymmetric_keys : verify_pefile:zero memory content before freeing)
Merging selinux/next (cae303df3f37 selinux: Fix an uninitialized variable bug)
Merging tpmdd/next (da4cee99ca6d tpm_tis: Consolidate the platform and acpi probe flow)
Merging watchdog/master (00078cff73db Merge branch 'watchdog-next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
CONFLICT (content): Merge conflict in drivers/watchdog/iTCO_wdt.c
Merging iommu/next (2c0248d68880 Merge branches 'arm/exynos', 'arm/omap', 'arm/rockchip', 'arm/mediatek', 'arm/smmu', 'arm/core', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (48d0e023af97 audit: fix the RCU locking for the auditd_connection structure)
Merging devicetree/for-next (df3ed9323944 Partially Revert "of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (282ec0ea65da Merge remote-tracking branches 'spi/topic/ti-qspi' and 'spi/topic/xlp' into spi-next)
Merging tip/auto-latest (30e2fc1b448b Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (6f9c89000c3f Merge tag 'arch-timer-errata' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into clockevents/4.12)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (f8d5549df25e EDAC, ghes: Do not enable it by default)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4dbbe2d8e95c tracing: Use cpumask_available() to check if cpumask variable may be used)
Merging rcu/rcu/next (933dfbd7c437 rcu: Open-code the rcu_cblist_n_lazy_cbs() function)
Merging kvm/linux-next (36c344f3f1ff Merge tag 'kvm-arm-for-v4.12-round2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (a2b19e6e2d4b KVM: arm/arm64: vgic-its: Cleanup after failed ITT restore)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (76d837a4c0f9 KVM: PPC: Book3S PR: Don't include SPAPR TCE code on non-pseries platforms)
Merging kvms390/next (e000b8e0968d s390: kvm: Cpu model support for msa6, msa7 and msa8)
Merging xen-tip/linux-next (69861e0a52f8 xen: adjust early dom0 p2m handling to xen hypervisor behavior)
Merging percpu/for-next (1328710b8ec3 mark most percpu globals as __ro_after_init)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (6df97f85611c platform/x86: Make SILEAD_DMI depend on TOUCHSCREEN_SILEAD)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (3026050179a3 HSI: ssi_protocol: double free in ssip_pn_xmit())
Merging leds/for-next (7678da8ee6de leds: Delete obsolete Versatile driver)
Merging ipmi/for-next (2c1175c2e8e5 ipmi/watchdog: fix wdog hang on panic waiting for ipmi response)
Merging driver-core/driver-core-next (af82455f7dbd Merge tag 'char-misc-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging usb/usb-next (c034a43e72dd staging: typec: Fairchild FUSB302 Type-c chip driver)
Merging usb-gadget/next (2868b2513aa7 Merge tag 'linux-kselftest-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging usb-serial/usb-next (31c5d1922b90 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit)
Merging usb-chipidea-next/ci-for-usb-next (a932a8041ff9 usb: chipidea: core: add sysfs group)
Merging phy-next/next (6239879b415e phy: qcom-qusb2: add NVMEM dependency)
Merging tty/tty-next (8e1c21f48694 serial: small Makefile reordering)
Merging char-misc/char-misc-next (af82455f7dbd Merge tag 'char-misc-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging extcon/extcon-next (2ea659a9ef48 Linux 4.12-rc1)
Merging staging/staging-next (09d79d103371 Merge tag 'docs-4.12-2' of git://git.lwn.net/linux)
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (7f3b465b8127 Merge branch 'topic/dw' into next)
Merging cgroup/for-next (0948307b3a5d Merge branch 'for-4.12' into for-next)
Merging scsi/for-next (b77b36cb7272 scsi: pmcraid: remove redundant check to see if request_size is less than zero)
Merging scsi-mkp/for-next (dad9410b2454 scsi: smartpqi: bump driver version)
Merging target-updates/for-next (984a9d4c40be Revert "target: Fix VERIFY and WRITE VERIFY command parsing")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (a351e9b9fc24 Linux 4.11)
Merging libata/for-next (b4dd60a5ddbc ata: sata_rcar: Handle return value of clk_prepare_enable)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c8b0d7290657 s390/virtio: change maintainership)
Merging rpmsg/for-next (5e78de7eee74 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b86c86aa9805 gpio: f7188x: Add a missing break)
Merging pinctrl/for-next (1aa2faf52f76 pinctrl: mediatek: Add missing pinctrl bindings for mt7623)
Merging pinctrl-samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (3fd372262166 pid_ns: Fix race between setns'ed fork() and zap_pid_ns_processes())
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (945f8f5f8633 selftests: x86: add missing executables to .gitignore)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (608822c0f7af Merge branch 'for-4.12/upstream' into for-next)
Merging coresight/next (8b3fa19142e8 coresight: tmc: minor fix for output log)
Merging rtc/rtc-next (332e0d13d3c7 rtc: gemini: add return value validation)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (e84b83b9ee21 filesystem-dax: fix broken __dax_zero_page_range() conversion)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (907c16c9686e ipc/sem: avoid indexing past end of sem_array)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: imx7: fix Kconfig warning and build errors
Applying: sparc64: NG4 memset 32 bits overflow
Applying: mm: zero hash tables in allocator
Applying: mm: update callers to use HASH_ZERO flag
Applying: mm: adaptive hash table scaling
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (21cbbde7333a lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
