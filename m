From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Nov 1
Date: Mon, 2 Nov 2015 03:53:40 +1100
Message-ID: <20151102035340.17310681@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57462 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751861AbbKAQxq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 11:53:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

I start again a day early, and this is how you all repay me? ;-)

Changes since 20151022:

New trees: usb-chipidea-fixes, usb-chipidea-next

Removed tree: kdbus (temporarily at the maintainer's request)

The mvebu tree gained a conflict against the arm-soc tree.

The arm64 tree gained a conflict against Linus' tree.

The pci tree gained a build failure for which I disabled a driver.

The pm tree gained a build failure for which I applied a merge fix patch.

The rdma tree gained a conflict against Linus' tree.

The drm tree gained a conflict against Linus' tree.

The modules tree gained a conflict against the kbuild tree.

The device-mapper tree gained a build failure so I used the version
from next-20151022.

The battery tree still had its build failure so I used the version from
next-20150925.

The security tree gained a conflict against the ext4 tree.

The iommu tree gained a build failure so I used the version from
next-20151022.

The mailbox tree gained a build failure so I used the version from
next-20151022.

The spi tree gained a conflict against the net-next tree.

The staging tree gained conflicts against the l2-mtd, spi and rdma trees.

The pinctrl tree gained a conflict against the at91 tree.

The clk tree gained a conflict against the fsl tree.

The y2038 tree gained a conflict against the staging tree.

The akpm-current tree gained conflicts against the arc, block and
file-locks trees and a build failure for which I applied a merge fix
patch.

The akpm tree lost a patch that turned up elsewhere and gained a build
failure for which I applied a merge fix patch.

Non-merge commits (relative to Linus' tree): 10716
 8781 files changed, 421038 insertions(+), 197374 deletions(-)

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
(32 and 64 bit), ppc44x_defconfig, allyesconfig (this fails its final
link) and pseries_le_defconfig and i386, sparc, sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 229 trees (counting Linus' and 35 trees of patches
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
Merging origin/master (523e13455ec9 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-client)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (049e6dde7e57 Linux 4.3-rc4)
Merging arm-current/fixes (38850d786a79 ARM: 8449/1: fix bug in vdsomunge swab32 macro)
Merging m68k-current/for-linus (95bc06ef049b m68k/defconfig: Update defconfigs for v4.3-rc1)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (977bf062bba3 powerpc/dma: dma_set_coherent_mask() should not be GPL only)
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (73958c651fbf sparc64: use ENTRY/ENDPROC in VISsave)
Merging net/master (89bc7848a91b ipv6: protect mtu calculation of wrap-around and infinite loop by rounding issues)
Merging ipsec/master (ca064bd89363 xfrm: Fix pmtu discovery for local generated packets.)
Merging ipvs/master (6ece90f9a13e netfilter: fix Kconfig dependencies for nf_dup_ipv{4,6})
Merging sound-current/for-linus (cadd16ea33a9 ALSA: hda - Disable 64bit address for Creative HDA controllers)
Merging pci-current/for-linus (1266963170f5 PCI: Prevent out of bounds access in numa_node override)
Merging wireless-drivers/master (de28a05ee28e Merge tag 'iwlwifi-for-kalle-2015-10-05' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging driver-core.current/driver-core-linus (9ffecb102835 Linux 4.3-rc3)
Merging tty.current/tty-linus (f235f664a8af fbcon: initialize blink interval before calling fb_set_par)
Merging usb.current/usb-linus (32b88194f71d Linux 4.3-rc7)
Merging usb-gadget-fixes/fixes (25cb62b76430 Linux 4.3-rc5)
Merging usb-serial-fixes/usb-linus (32b88194f71d Linux 4.3-rc7)
Merging usb-chipidea-fixes/ci-for-usb-stable (f256896afdb6 usb: chipidea: otg: gadget module load and unload support)
Merging staging.current/staging-linus (32b88194f71d Linux 4.3-rc7)
Merging char-misc.current/char-misc-linus (25cb62b76430 Linux 4.3-rc5)
Merging input-current/for-linus (195562194aad Input: alps - only the Dell Latitude D420/430/620/630 have separate stick button bits)
Merging crypto-current/master (3fc89adb9fa4 crypto: api - Only abort operations on fatal signal)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (4bc94d5dc95d vfio: Fix lockdep issue)
Merging kselftest-fixes/fixes (ae7858180510 selftests: exec: revert to default emit rule)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (1d337b286098 drm/i915/skl: Prevent unclaimed register writes on skylake.)
Merging asm-generic/master (4008cb3ad223 asm-generic: temporarily add back asm-generic/io-64-nonatomic*.h)
Merging arc/for-next (5a364c2a1762 ARC: mm: PAE40 support)
Merging arm/for-next (4f96dfc97367 Merge branches 'drm-dwhdmi-devel', 'drm-tda998x-devel2' and 'drm-armada-devel' into for-next)
Merging arm-perf/for-next/perf (6ff33f3902c3 Linux 4.3-rc1)
Merging arm-soc/for-next (cd676572bf18 ARM: SoC: document merges)
Merging at91/at91-next (c544ee640869 Merge tag 'at91-ab-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (27527ea5f2fd Merge branch 'berlin/soc' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (f843df81257a Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (4e91d7a20ccc Merge branch 'mvebu/config' into mvebu/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-mvebu/pmsu.c
Merging omap/for-next (f2a148747f11 Merge branch 'omap-for-v4.3/fixes' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/qcom/for-next (fcbba086b456 ARM: dts: msm8974: Add SCM firmware node)
CONFLICT (content): Merge conflict in drivers/soc/qcom/smd-rpm.c
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
Merging renesas/next (c7aba848d39f Merge branches 'heads/defconfig-for-v4.4' and 'heads/dt-for-v4.4' into next)
Merging rockchip/for-next (55e899c44d10 Merge branch 'v4.4-armsoc/drivers' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (4ccfae394061 Merge branch 'v4.4-samsung-defconfig' into for-next)
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/soc/Kconfig
Merging samsung-krzk/for-next (6ff33f3902c3 Linux 4.3-rc1)
Merging sunxi/sunxi/for-next (7022e5f74246 Merge branch 'sunxi/dt-for-4.4' into sunxi/for-next)
Merging tegra/for-next (2d37df587e3c Merge branch for-4.4/defconfig into for-next)
Merging arm64/for-next/core (aa644fa64c25 ARM64: Enable multi-core scheduler support by default)
CONFLICT (content): Merge conflict in arch/arm64/kernel/suspend.c
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (6829bca19fa4 h8300: Don't set CROSS_COMPILE unconditionally)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (bab84fa9cc09 m68k/sun3: Use %pM format specifier to print ethernet address)
Merging m68knommu/for-next (4ac313111018 fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU)
Merging metag/for-next (3dce23eb8878 metag: Turn irq_ctx_* macros into static inlines)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (4deb27263d5f Merge branch '4.3-fixes' into mips-for-linux-next)
Merging nios2/for-next (8840da98bfec nios2: Switch to generic __xchg())
Merging parisc-hd/for-next (a01fece2e418 parisc: Change L1_CACHE_BYTES to 16)
Merging powerpc/next (353169acf185 powerpc/eeh: Fix recursive fenced PHB on Broadcom shiner adapter)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (ef12cb904e09 s390/cio: move ccw_device_stlck functions)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (09745f38a74e arch/tile: turn off timer tick for oneshot_stopped state)
Merging uml/linux-next (56b88a3bf97a um: Fix kernel mode fault condition)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (895fb3159280 xtensa: improve vmlinux.lds.S sed post-processing)
Merging btrfs/next (3a9508b0221d btrfs: fix compile when block cgroups are not enabled)
Merging ceph/master (8dbd263de1cb ceph: improve readahead for file holes)
Merging cifs/for-next (8a28d67457b6 Merge tag 'powerpc-4.3-6' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (d4eb6dee4712 ext4: Update EXT4_USE_FOR_EXT2 description)
Merging ext4/dev (1a70ea8d47aa ext4: fix abs() usage in ext4_mb_check_group_pa)
Merging f2fs/dev (f96999c35f46 f2fs: refactor __find_rev_next_{zero}_bit)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (f3dd1649122b gfs2: Remove gl_spin define)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (a85240d2543e Merge branch 'bugfixes')
Merging nfsd/nfsd-next (1bc483f959c8 SUNRPC: drop stale comment in svc_setup_socket())
Merging orangefs/for-next (548049495cb4 Orangefs: fix some checkpatch.pl complaints that had creeped in.)
Merging overlayfs/overlayfs-next (8d3095f4ad47 ovl: default permissions)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (46cfbe8e037a 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (1cb8f9776c7d ubi: fastmap: Implement produce_free_peb())
Merging xfs/for-next (fcd8a399a9d4 Merge branch 'xfs-stats-fixes' into for-next)
Merging file-locks/linux-next (616fb38fa7a9 locks: cleanup posix_lock_inode_wait and flock_lock_inode_wait)
Merging vfs/for-next (397d425dc26d vfs: Test for and handle paths that are unreachable from their mnt_root)
Merging pci/next (92034b73a1aa Merge branch 'pci/host-rcar' into next)
Merging hid/for-next (a34ab1fb2bb1 Merge branch 'for-4.4/upstream' into for-next)
Merging i2c/i2c/for-next (121c7794864c Merge branch 'i2c/for-4.4' into i2c/for-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging jdelvare-hwmon/master (902fd32b7711 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (50224f4d0959 hwmon: (nct6775) Introduce separate temperature labels for NCT6792 and NCT6793)
Merging v4l-dvb/master (8132ccfb864a Merge branch 'v4l_for_linus' into to_next)
Merging kbuild/for-next (bc036b590fd1 Merge branch 'kbuild/misc' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (f0ae0dfa91b0 Merge branch 'for-4.4' into for-next)
Merging pm/linux-next (ed8daa4024ff Merge branches 'acpi-processor' and 'acpi-assorted' into linux-next)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/timer.c
Applying: ARM: mediatek: fixup for clocksource_of_init API change
Merging idle/next (f05bd12f0e9c Merge branch 'cpuidle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (a353d85dc365 Merge branches 'thermal-core' and 'thermal-intel' of .git into next)
Merging thermal-soc/next (8fb2b9ac2aad thermal: underflow bug in imx_set_trip_temp())
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/model IDs)
Merging dlm/next (b3a5bbfd780d dlm: print error from kernel_sendpage)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (6782af4b4071 Merge branch 'for-linus' into next)
Merging net-next/master (e7b63ff115f2 Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next)
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (92240e8dc0d1 ipvs: Remove possibly unused variables from ip_vs_conn_net_{init,cleanup})
Merging wireless-drivers-next/master (8aaa878de83a Merge ath-next from ath.git)
Merging bluetooth/master (84b632def179 Bluetooth: Fix possible deadlock in btusb)
Merging rdma/for-next (39bfc271bd68 IB/core: Remove old fast registration API)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
Merging mtd/master (e5a5d92d9dc3 mxc_nand: fix copy_spare)
Merging l2-mtd/master (f3c63795e90f mtd: blkdevs: fix potential deadlock + lockdep warnings)
Merging crypto/master (271817a3e92c crypto: asymmetric_keys - Fix unaligned access in x509_get_sig_params())
Merging drm/drm-next (a76edb8cec0c Merge tag 'topic/drm-misc-2015-10-22' of git://anongit.freedesktop.org/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
Merging drm-panel/drm/panel/for-next (f1811a8a6413 drm/bridge: ptn3460: Fix coccinelle warnings)
Merging drm-intel/for-linux-next (6675bce251b6 drm/i915: disable CPU PWM also on LPT/SPT backlight disable)
Merging drm-tegra/drm/tegra/for-next (2bcdcbfae289 drm/tegra: dc: Request/free syncpoint at init/exit)
Merging drm-misc/topic/drm-misc (364b19868ecd drm/dp: add eDP DPCD backlight control bit definitions)
Merging drm-exynos/exynos-drm/for-next (7d9071a09502 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging drm-msm/msm-next (a9ee34b70e07 drm/msm: Remove local fbdev emulation Kconfig option)
Merging sound/for-next (d1482fb335b8 ALSA: firewire-digi00x: add another rawmidi character device for MIDI control ports)
Merging sound-asoc/for-next (053940a66b99 Merge remote-tracking branch 'asoc/topic/wm8962' into asoc-next)
Merging modules/modules-next (d1189c63ea5e scripts: [modpost] add new sections to white list)
CONFLICT (content): Merge conflict in scripts/Makefile.modpost
Merging input/next (bf5f18d70880 Input: evdev - fix bug in checking duplicate clock change request)
Merging block/for-next (7c06c5a6bee7 Merge branch 'for-4.4/core' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging device-mapper/for-next (9e6562330255 dm: add support for passing through persistent reservations)
$ git reset --hard HEAD^
Merging next-20151022 version of device-mapper
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (7cc8d580228c mmc: dw_mmc: fix the wrong setting for UHS-DDR50 mode)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (88babdb76422 raid5-cache: use crc32c checksum)
Merging mfd/for-mfd-next (0b8431c65b01 mfd: sec-core: Remove unused s2mpu02-rtc and s2mpu02-clk children)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mfd/s2mps11.txt
Merging backlight/for-backlight-next (9d6c243502b7 backlight: pm8941-wled: Add default-brightness property)
Merging battery/master (6bd03ce3c12a power: bq27xxx_battery: Remove unneeded dependency in Kconfig)
$ git reset --hard HEAD^
Merging next-20150925 version of battery
Merging omap_dss2/for-next (08bfb453f045 radeonfb: Deinline large functions)
Merging regulator/for-next (fa75190bb576 Merge remote-tracking branches 'regulator/topic/supply', 'regulator/topic/tps6105x' and 'regulator/topic/tps65023' into regulator-next)
Merging security/next (ba94c3ff20c9 Merge tag 'keys-next-20151021' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs into next)
CONFLICT (content): Merge conflict in fs/ext4/crypto_key.c
Merging integrity/next (72e1eed8abb1 integrity: prevent loading untrusted certificates on the IMA trusted keyring)
Merging selinux/next (63205654c0e0 selinux: Use a kmem_cache for allocation struct file_security_struct)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (4f129bb912c4 watchdog: watchdog_dev: Use single variable name for struct watchdog_device)
Merging iommu/next (4e2d103e5a6f Merge branches 'x86/amd', 'x86/vt-d', 'arm/omap', 'arm/smmu', 'arm/renesas', 's390', 'core' and 'iommu/fixes' into next)
$ git reset --hard HEAD^
Merging next-20151022 version of iommu
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintainer)
Merging jc_docs/docs-next (334bb79c18eb doc: Clarify that nmi_watchdog param is for hardlockups)
CONFLICT (content): Merge conflict in Documentation/Changes
Merging trivial/for-next (0c6cac7ab444 hwmon: applesmc: fix comment typos)
Merging audit/next (a4416687e957 audit: make audit_log_common_recv_msg() a void function)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (25fff6aa3213 Merge branch 'all-dtbs-v2' into for-next)
Merging mailbox/mailbox-for-next (8e3c5952144f mailbox/omap: Add ti,mbox-send-noirq quirk to fix AM33xx CPU Idle)
$ git reset --hard HEAD^
Merging next-20151022 version of mailbox
Merging spi/for-next (9de608970f32 Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/ti-qspi' and 'spi/topic/txx9' into spi-next)
CONFLICT (content): Merge conflict in drivers/nfc/trf7970a.c
Merging tip/auto-latest (dd75c5bcff81 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in include/linux/of_irq.h
CONFLICT (content): Merge conflict in arch/x86/Makefile
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/acpi.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/atomic.h
CONFLICT (content): Merge conflict in Documentation/arm/uefi.txt
Merging clockevents/clockevents/next (0e4baaa9a11b clocksource/drivers/exynos_mct: Use container_of() instead of this_cpu_ptr())
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (990995bad13c EDAC: Fix PAGES_TO_MiB macro misuse)
Merging irqchip/irqchip/for-next (29bade08fb07 irqchip: armada-370-xp: Fix regression by clearing IRQ_NOAUTOEN)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (fb662288284e tracing: Fix sparse RCU warning)
Merging rcu/rcu/next (39cd2dd39a8b Merge branches 'doc.2015.10.06a', 'percpu-rwsem.2015.10.06a' and 'torture.2015.10.06a' into HEAD)
Merging kvm/linux-next (8c85ac1c0a1b KVM: x86: MMU: Initialize force_pt_level before calling mapping_level())
Merging kvm-arm/next (5fdf876d30ce KVM: arm: Do not indent the arguments of DECLARE_BITMAP)
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (70aa3961a196 KVM: PPC: Book3S HV: Handle H_DOORBELL on the guest exit path)
Merging kvms390/next (46b708ea875f KVM: s390: use simple switch statement as multiplexer)
Merging xen-tip/linux-next (914beb9fc26d x86/xen: add reschedule point when mapping foreign GFNs)
Merging percpu/for-next (5a928541585b kernel: Remove unneeded return from void function)
Merging workqueues/for-next (4fcfc3013144 Merge branch 'for-4.4' into for-next)
Merging drivers-x86/for-next (9d1d459bf52b intel_scu_ipc: Protect dev member assignment on ->remove())
Merging chrome-platform/for-next (18800fc7a04e platform/chrome: Support reading/writing the vboot context)
Merging regmap/for-next (231e7cb81625 Merge remote-tracking branches 'regmap/topic/rbtree' and 'regmap/topic/update-offload' into regmap-next)
Merging hsi/for-next (16bd5865cdb3 hsi: controllers:remove redundant code)
Merging leds/for-next (861497527cda leds: 88pm860x: add missing of_node_put)
Merging ipmi/for-next (d503e2fbbfea char: ipmi: ipmi_ssif: Replace timeval with timespec64)
Merging driver-core/driver-core-next (c23fe83138ed debugfs: Add debugfs_create_ulong())
Merging tty/tty-next (e052c6d15c61 tty: Use unbound workqueue for all input workers)
Merging usb/usb-next (0bbc367e21bf Merge 4.3-rc7 into usb-next)
Merging usb-gadget/next (81e9d14a53eb usb: gadget: net2280: restore ep_cfg after defect7374 workaround)
Merging usb-serial/usb-next (92944c4520ed USB: qcserial: update comment for Sierra Wireless MC7304/MC7354)
Merging usb-chipidea-next/ci-for-usb-next (2fb2884ed856 usb: chipidea: delete static debug support)
Merging staging/staging-next (e3cc3136df33 Staging: rtl8192u: ieee80211: added missing blank lines)
CONFLICT (content): Merge conflict in drivers/staging/mt29f_spinand/mt29f_spinand.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
CONFLICT (content): Merge conflict in drivers/iio/proximity/as3935.c
CONFLICT (content): Merge conflict in drivers/iio/frequency/adf4350.c
CONFLICT (content): Merge conflict in drivers/iio/dac/ad7303.c
CONFLICT (content): Merge conflict in drivers/iio/adc/ti-adc128s052.c
CONFLICT (content): Merge conflict in drivers/iio/adc/mcp320x.c
CONFLICT (content): Merge conflict in drivers/iio/adc/max1027.c
Merging char-misc/char-misc-next (e2d8680741ed fpga: socfpga: Fix check of return value of devm_request_irq)
Merging extcon/extcon-next (11eecf910bd8 extcon: Modify the id and name of external connector)
Merging cgroup/for-next (d57456753787 cgroup: fix race condition around termination check in css_task_iter_next())
CONFLICT (content): Merge conflict in kernel/sched/core.c
CONFLICT (content): Merge conflict in kernel/events/core.c
Applying: vmscan build fix
Merging scsi/for-next (5575a6ea316b Merge branch 'fixes' into for-next)
Merging target-updates/for-next (517982229f78 configfs: remove old API)
Applying: stm class: Use per-attribute show and store methods in configfs policy
Merging target-merge/for-next-merge (8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes)
Merging pinctrl/for-next (d94b986aa734 pinctrl: at91: add missing of_node_put)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sama5d2.dtsi
Merging vhost/linux-next (d629f2b585cb virtio: introduce avail cache)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (787dfbb294b2 gpio: zynq: Document interrupt-controller DT binding)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (7e3b7dc76c41 pwm: Add MediaTek display PWM driver support)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (e5bf1991ea62 clk: qcom: msm8960: Fix dsi1/2 halt bits)
CONFLICT (content): Merge conflict in drivers/clk/Kconfig
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (256d0afb11d6 selftests/seccomp: build and pass on arm64)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_parallel.c
CONFLICT (modify/delete): drivers/staging/ft1000/ft1000.h deleted in HEAD and modified in y2038/y2038. Version y2038/y2038 of drivers/staging/ft1000/ft1000.h left in tree.
CONFLICT (modify/delete): drivers/staging/ft1000/ft1000-usb/ft1000_hw.c deleted in HEAD and modified in y2038/y2038. Version y2038/y2038 of drivers/staging/ft1000/ft1000-usb/ft1000_hw.c left in tree.
CONFLICT (modify/delete): drivers/staging/ft1000/ft1000-usb/ft1000_debug.c deleted in HEAD and modified in y2038/y2038. Version y2038/y2038 of drivers/staging/ft1000/ft1000-usb/ft1000_debug.c left in tree.
CONFLICT (modify/delete): drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c deleted in HEAD and modified in y2038/y2038. Version y2038/y2038 of drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c left in tree.
$ git rm -f drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c drivers/staging/ft1000/ft1000-usb/ft1000_debug.c drivers/staging/ft1000/ft1000-usb/ft1000_hw.c drivers/staging/ft1000/ft1000.h
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-nfs.org/~bfields/linux)
Merging access_once/linux-next (c231afa3ccf1 compiler.h: cast away attributes in WRITE_ONCE magic)
Merging livepatching/for-next (07d42d41dfc4 Merge branch 'for-4.3/upstream' into for-next)
Merging coresight/next (c0d90ad7604a coresight: checking for NULL string in coresight_name_match())
Merging rtc/rtc-next (5078160c175f rtc: ds1307: Fix alarm programming for mcp794xx)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (538ea4aa4473 pmem, memremap: convert to numa aware allocations)
Applying: PCI: altera: disable MSI driver for now
Merging akpm-current/current (f1e1fabe6b48 ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in mm/pgtable-generic.c
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/huge_memory.c
CONFLICT (content): Merge conflict in mm/failslab.c
CONFLICT (content): Merge conflict in fs/proc/task_mmu.c
CONFLICT (content): Merge conflict in fs/9p/vfs_file.c
CONFLICT (content): Merge conflict in drivers/usb/host/u132-hcd.c
CONFLICT (content): Merge conflict in block/blk-mq.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/arc/mm/cache.c
Applying: mm-page_alloc-rename-__gfp_wait-to-__gfp_reclaim-arm-fix
Applying: mm-page_alloc-rename-__gfp_wait-to-__gfp_reclaim-arm-fix-fix
Applying: block: fixes for __GPF_WAIT changes
Applying: ndb: fix up for dequeue_signal_lock API change
$ git checkout -b akpm remotes/origin/akpm/master
Applying: net/ipv4/route.c: prevent oops
Applying: mips: add entry for new mlock2 syscall
Applying: sparc/sparc64: allocate sys_membarrier system call number
Applying: kernel.h: make abs() work with 64-bit types
Applying: Remove abs64()
Applying: remove-abs64-fix
Applying: remove-abs64-fix-fix
Applying: Documentation/sysctl/vm.txt: fix misleading code reference of overcommit_memory
Applying: pcnet32: use pci_set_dma_mask insted of pci_dma_supported
Applying: tw68-core: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7164: use pci_set_dma_mask insted of pci_dma_supported
Applying: saa7134: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx88: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx25821: use pci_set_dma_mask insted of pci_dma_supported
Applying: cx23885: use pci_set_dma_mask insted of pci_dma_supported
Applying: netup_unidvb: use pci_set_dma_mask insted of pci_dma_supported
Applying: nouveau: don't call pci_dma_supported
Applying: sfc: don't call dma_supported
Applying: kaweth: remove ifdefed out call to dma_supported
Applying: usbnet: remove ifdefed out call to dma_supported
Applying: pci: remove pci_dma_supported
Applying: dma: remove external references to dma_supported
Applying: drivers/scsi/cxgbi: fix build with EXTRA_CFLAGS
Applying: kmap_atomic_to_page() has no users, remove it
Applying: include/linux/kdev_t.h: remove unused huge_valid_dev()
Applying: include/linux/kdev_t.h: old/new_valid_dev() can return bool
Applying: fs/9p: remove unnecessary new_valid_dev() checks
Applying: fs/btrfs/inode.c: remove unnecessary new_valid_dev() check
Applying: fs/exofs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/ext2/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/ext4/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/f2fs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/hpfs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/jfs: remove unnecessary new_valid_dev() checks
Applying: fs/ncpfs/dir.c: remove unnecessary new_valid_dev() check
Applying: fs/nfs/dir.c: remove unnecessary new_valid_dev() check
Applying: fs/nilfs2/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/reiserfs/namei.c: remove unnecessary new_valid_dev() check
Applying: fs/stat.c: remove unnecessary new_valid_dev() check
Applying: fs/ubifs/: remove unnecessary new_valid_dev() checks
Applying: fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries
Merging akpm/master (fb3e4d832b0c fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries)
Applying: Revert "ext4: fix abs() usage in ext4_mb_check_group_pa"
