From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 3
Date: Wed, 3 Jun 2015 19:40:24 +1000
Message-ID: <20150603194024.67fed64b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ErC55f0U2iLgdh+E3FLxEgu"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52515 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751169AbbFCJkc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 05:40:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/ErC55f0U2iLgdh+E3FLxEgu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This tree was not build tested at the end (we had a major aircon
failure just after I merged the init tree), so there may be some
problems.

Changes since 20150602:

New tree: init

The imx-mxs tree still had its build failure for which I disabled a driver.

The sound-asoc tree lost its build failure.

The block tree gained conflicts against Linus' tree.

The edac-amd tree lost its build failure.

The usb tree gained a conflict against the mips tree.

The staging tree gained a build failure for which I applied a merge
fix patch.

The scsi tree lost its build failure.

The target-updates tree gained a build failure for which I applied a
merge fix patch.

The userns tree gained a conflict against the block tree

The init tree gained conflicts against the arm tree.

The akpm-current tree gained a coonflict against the mips tree.

Non-merge commits (relative to Linus' tree): 8266
 7315 files changed, 419741 insertions(+), 168232 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log files
in the Next directory.  Between each merge, the tree was built with
a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
multi_v7_defconfig for arm. After the final fixups (if any), it is also
built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
allyesconfig (this fails its final link) and i386, sparc, sparc64 and arm
defconfig.

Below is a summary of the state of the merge.

I am currently merging 220 trees (counting Linus' and 31 trees of patches
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (8cd9234c64c5 Merge tag 'please-pull-rusty' of git://=
git.kernel.org/pub/scm/linux/kernel/git/aegl/linux)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (8d2812849acb ARM: 8357/1: perf: fix memory leak =
when probing PMU PPIs)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (5e95235ccd54 powerpc: Align TOC to 256 byt=
es)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (b5d724b1add6 ALSA: hda/realtek - Add a fix=
up for another Acer Aspire 9420)
Merging pci-current/for-linus (552bc94ebeeb PCI: Preserve resource size dur=
ing alignment reordering)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging wireless-drivers/master (38fe44e61a89 Merge tag 'iwlwifi-for-kalle-=
2015-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (3370e13aa463 drivers/base: c=
acheinfo: handle absence of caches)
Merging tty.current/tty-linus (72586c6061ab n_tty: Fix auditing support for=
 cannonical mode)
Merging usb.current/usb-linus (13557b5d8477 Merge tag 'fixes-for-v4.1-rc5' =
of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (1df5b888f540 USB: serial: ftdi_sio: Add=
 support for a Motion Tracker Development Board)
Merging staging.current/staging-linus (39a6e7376af0 staging: rtl8712: fix s=
tack dump)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (5f0ee9d17aae Input: elantech - fix detecti=
on of touchpads where the revision matches a known rate)
Merging crypto-current/master (f858c7bcca8c crypto: algif_aead - Disable AE=
AD user-space for now)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f36963c9d3f6 cpumask_set_cpu_local_first =3D> cpuma=
sk_local_spread, lament)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: H=
andle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (0aedb1626566 drm/i915: Don't =
skip request retirement if the active list is empty)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (e6cd8deb08e9 ARC: explicit'ify uboot support)
Merging arm/for-next (081eaa31044f Merge branch 'for-arm-soc' into for-next)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
CONFLICT (modify/delete): arch/arm/kernel/perf_event_cpu.c deleted in arm-p=
erf/for-next/perf and modified in HEAD. Version HEAD of arch/arm/kernel/per=
f_event_cpu.c left in tree.
$ git rm -f arch/arm/kernel/perf_event_cpu.c
Merging arm-soc/for-next (77bdccab2043 arm-soc: temporarily work around qco=
m build error)
CONFLICT (content): Merge conflict in arch/arm/mach-socfpga/core.h
Merging at91/at91-next (8720dbd585f2 Merge tag 'at91-dt3' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' an=
d 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (7f8ad9c26be9 Merge branch 'berlin/simple-mf=
d' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (e95dc0944dea Merge branch 'imx/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm/mach-imx/Kconfig
Applying: ARM: imx: mark CLKSRC_IMX_GPT as BROKEN for now
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (96a9fef8a7fa Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (073c2e3b6d0b Merge tag 'omap-for-v4.2/o2_dc' into fo=
r-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_da=
ta.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (5c78bc1b4667 Merge branch 'samsung-defconfig-2nd'=
 into for-next)
Merging sunxi/sunxi/for-next (195d7a452ef7 Merge branches 'sunxi/core-for-4=
.2', 'sunxi/dt-for-4.2' and 'sunxi/clocks-for-4.2' into sunxi/for-next)
Merging tegra/for-next (44bc5c1cf4c1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (9acdc2af0c0b arm64: drop sleep_idmap_phys and =
clean up cpu_resume())
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (45f49276cd8a CRISv32: allow CONFIG_DEBUG_BUGVERBOSE)
Merging h8300/h8300-next (c35cd208e4e3 h8300: Always build dtb)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (078550569eaf ramoops: make it possible to change mem_typ=
e param.)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (ba155e2d21f6 Linux 4.1-rc5)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (404606c6cf65 Merge branch '4.1-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (989898b707f7 selftests/powerpc: Add install suppo=
rt to more powerpc tests)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (0b4e549bdaed powerpc/85xx: p1025twr: add module condition=
al to fix QE-uart issue)
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/msi.c
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (7c53fcb39fdd s390/dasd: Enable automatic loading of =
dasd_diag_mod)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (47ad7b9bbeaa tile: improve stack backtrace)
Merging uml/linux-next (6c684465587a um: Fix warning in setup_signal_stack_=
si())
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (843b06f1f0cb client MUST ignore EncryptionKeyLength =
if CAP_EXTENDED_SECURITY is set)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (bee5863ea1b4 ext4 crypto: require CONFIG_CRYPTO_CTR if ex=
t4 encryption is enabled)
Merging f2fs/dev (f62185d0e283 f2fs: support FALLOC_FL_INSERT_RANGE)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (9cde2898d045 gfs2: limit quota log messages)
Merging jfs/jfs-next (55a8d02bbb25 jfs: removed a prohibited space after op=
ening parenthesis)
Merging nfs/linux-next (13985b1f77d0 NFS: drop unneeded goto)
Merging nfsd/nfsd-next (3e91206adf8d nfsd: Pin to vfsmnt instead of mntget)
Merging overlayfs/overlayfs-next (c65b99f04684 Linux 4.1-rc6)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushe=
s)
Merging xfs/for-next (b9a350a1183e Merge branch 'xfs-sparse-inode' into for=
-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (b853a16176cf turn user_{path_at,path,lpath,path_dir}(=
) into static inlines)
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in HEAD and modified in =
vfs/for-next. Version vfs/for-next of fs/hppfs/hppfs.c left in tree.
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
$ git rm -f fs/hppfs/hppfs.c
Applying: f2fs: merge fix for follow_link changes
Merging pci/next (ae397a1e6422 Merge branches 'pci/aspm', 'pci/enumeration'=
, 'pci/hotplug' and 'pci/virtualization' into next)
Merging hid/for-next (be5f67ff9483 Merge branch 'for-4.2/upstream' into for=
-next)
Merging i2c/i2c/for-next (e692877de578 Merge branch 'i2c/for-4.2' into i2c/=
for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addre=
sses can be probed)
Merging dmi/master (bec755ee1080 firmware: dmi: struct dmi_header should be=
 packed)
Merging hwmon-staging/hwmon-next (e892b75ff579 hwmon: (atxp1) Drop auto-det=
ection)
Merging v4l-dvb/master (e3645d485fd0 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (117f34d39ff3 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (80b7caec6da6 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (e3e5e8cd0abd Merge branch 'pm-wakeirq' into linux-ne=
xt)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' in=
to release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (e27f74ae45b3 Merge branches 'for-rc' and 'release' of=
 .git into next)
Merging thermal-soc/next (bcacb3e5fd10 Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (36059b2e5694 Merge branches 'for-linus' and 'topic/=
pxa' into next)
Merging net-next/master (df905ceae388 Merge branch 'sfc-next')
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (fa2ab6971844 ray_cs: Change 1 to true=
 for bool type variable.)
Merging bluetooth/master (0ecc4e688b6e mac802154: add trace functionality f=
or driver ops)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging rdma/for-next (ec08a8158de2 Merge branch 'for-4.2-misc' into k.o/fo=
r-4.2)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (e5babdf928e5 mtd: dc21285: use raw spinlock function=
s for nw_gpio_lock)
Merging crypto/master (cf58fcb1bea9 crypto: jitterentropy - remove timekeep=
ing_valid_for_hres)
CONFLICT (content): Merge conflict in net/ipv6/esp6.c
CONFLICT (content): Merge conflict in net/ipv4/esp4.c
Merging drm/drm-next (3e8d222f2a95 Merge tag 'drm-intel-next-fixes-2015-05-=
29' of git://anongit.freedesktop.org/drm-intel into drm-next)
Merging drm-panel/drm/panel/for-next (dd0150026901 drm/panel: simple: Add s=
upport for LG LB070WV8 800x480 7" panel)
Merging drm-intel/for-linux-next (501fd70fcaeb drm/i915: limit PPGTT size t=
o 2GB in 32-bit platforms)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0f5c41dbe96a Documentation/drm: Update rot=
ation property)
Merging drm-exynos/exynos-drm/for-next (9aeb8acbf0a2 drm/exynos: dp: Lower =
level of EDID read success message)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (0cbf324e90ef sound/oss: use schedule_timeout_interr=
uptible())
Merging sound-asoc/for-next (d7b2d4a42053 Merge remote-tracking branches 'a=
soc/topic/wm5100', 'asoc/topic/wm8741', 'asoc/topic/wm8960', 'asoc/topic/wm=
8994' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs fo=
r sig_enforce declaration)
Merging input/next (85919a00e55f Input: focaltech - report finger width to =
userspace)
Merging block/for-next (829f3572b2b4 Merge branch 'for-4.2/writeback' into =
for-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
Merging device-mapper/for-next (08c140efcb25 dm cache: age and write back c=
ache entries even without active IO)
Merging pcmcia/master (f2e6cf76751d pcmcia: Convert dev_printk to dev_<leve=
l>)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (1e5a0a9a58e2 mmc: sdhci-bcm2835: Actually enable the c=
lock)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (38f31b94147c md/raid5: ignore released_stripes check)
Merging mfd/for-mfd-next (79a1726fd29c mfd: mt6397-core: Add GPIO sub-modul=
e support)
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simpl=
ify usage of devm_gpiod_get_optional)
Merging battery/master (bcd56fe1aa97 power: reset: gpio-restart: increase p=
riority slightly)
Merging omap_dss2/for-next (a1fdbbb6036f video: fbdev: geode gxfb: use iore=
map_wc() for framebuffer)
Merging regulator/for-next (89c375b9d89e Merge remote-tracking branches 're=
gulator/topic/max77693', 'regulator/topic/max77843', 'regulator/topic/max89=
73' and 'regulator/topic/of' into regulator-next)
Merging security/next (8d94eb9b5cff ima: pass iint to ima_add_violation())
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next an=
d modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (8d94eb9b5cff ima: pass iint to ima_add_violation())
Merging selinux/next (6f29997f4a31 selinux: enable per-file labeling for de=
bugfs files.)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (070927502e6e watchdog: dw_wdt: keepalive the watch=
dog at write time)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (5f88c894815d Merge branches 'arm/rockchip', 'arm/exynos=
', 'arm/smmu', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (bde1b29420d7 stable: Update documentation to cla=
rify preferred procedure)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negati=
ve/)
Merging audit/next (5c1390c9ffda audit: obsolete audit_context check is rem=
oved in audit_filter_rules())
CONFLICT (content): Merge conflict in security/lsm_audit.c
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (e7a9a5bbaa78 tps6507x.txt: Remove executable permis=
sion)
Merging mailbox/mailbox-for-next (4c0f74bf82e8 mailbox: Enable BCM2835 mail=
box support)
Merging spi/for-next (71495d786d86 Merge remote-tracking branches 'spi/topi=
c/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/sirf' and 'spi/topic/spidev' i=
nto spi-next)
Merging tip/auto-latest (4c03d8d942b3 manual merge of x86/urgent)
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevent=
s/4.2' into clockevents/next)
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (451bb7fbccdc EDAC, xgene: Fix cpuid abuse)
CONFLICT (content): Merge conflict in arch/tile/Kconfig
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (a497adb45b86 ring-buffer: Add enum names for the c=
ontext levels)
Merging rcu/rcu/next (d254f32b7c03 rcu: Deinline rcu_read_lock_sched_held()=
 if DEBUG_LOCK_ALLOC)
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
CONFLICT (content): Merge conflict in include/linux/rcutree.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
Merging kvm/linux-next (b7e60c5aedd2 KVM: x86: zero kvmclock_offset when vc=
pu0 initializes kvmclock system MSR)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Applying: kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for =
kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (402dd89d6cdb workqueue: fix typos in comments)
Merging drivers-x86/for-next (4fa9dabcffc8 ideapad_laptop: Lenovo G50-30 fi=
x rfkill reports wireless blocked)
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (f1c41264c91c Merge remote-tracking branches 'regma=
p/topic/defaults', 'regmap/topic/irq' and 'regmap/topic/reg-params' into re=
gmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (589fca16c14a leds: add BCM6358 LED driver)
Merging ipmi/for-next (c32e9840e96a ipmi: Add a comment in how messages are=
 delivered from the lower layer)
Merging driver-core/driver-core-next (e0fd9b1d9c44 firmware: use const for =
remaining firmware names)
Merging tty/tty-next (a5edce421848 fbcon: Avoid deleting a timer in IRQ con=
text)
CONFLICT (content): Merge conflict in drivers/tty/serial/amba-pl011.c
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_omap.c
Merging usb/usb-next (f50420223071 USB: usbtmc: add device quirk for Rigol =
DS6104)
CONFLICT (content): Merge conflict in drivers/usb/musb/musb_core.c
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUS=
Y too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_t=
imer)
Merging staging/staging-next (63d03e477308 staging: wilc1000: remove WILC_U=
int8)
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Applying: staging: disable the WILC1000 driver
Merging char-misc/char-misc-next (1f656ff3fddd Drivers: hv: vmbus: Implemen=
t NUMA aware CPU affinity for channels)
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name=
() function pointer of extcon_dev)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
CONFLICT (content): Merge conflict in include/dt-bindings/mfd/arizona.h
Applying: power: axp288_charger: fix for AIP change
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (c80ef9e0c021 cgroup: add seq_file forward declarat=
ion for struct cftype)
Merging scsi/for-next (45c44b5ff9ca ipr: Increase default adapter init stag=
e change timeout)
CONFLICT (content): Merge conflict in drivers/target/target_core_user.c
Merging target-updates/for-next (a6fd1b94e964 target: Drop duplicate + unus=
ed se_dev_check_wce)
Applying: target: explicitly include scsi_proto.h in target_core_fabric_lib=
.c
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (5b441eba3ab9 pinctrl: Spelling s/reseved/reserved=
/)
Merging vhost/linux-next (fa5f6add30c7 tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (7a781cac5c29 gpio-stp-xway: Use the of_property_read=
_u32 helper)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (cccb94543c82 pwm: samsung: Use MODULE_DEVICE_TABLE() =
to include OF modalias)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (14d419c079ab mnt: Update fs_fully_visible to test =
for permanently empty directories)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/libfs.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (20db7092e478 Merge branch 'clk-next-hi6220' into clk-=
next)
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (390db010c960 selftest, x86: fix incorrect comment)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (507a76d5f701 Merge branch 'for-4.1/upstream-=
fixes' into for-next)
Merging coresight/next (486ea46dfc88 coresight-etm3x: Add Qualcomm PTM v1.1=
 peripheral ID)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight=
-etm3x.c
Merging rtc/rtc-next (4b7fe085f084 rtc: pcf8563 fix: return -EINVAL if we r=
ead an invalid time.)
Merging init/init-v4.1-rc6 (c1032cc2ca77 Merge branch 'module-misc-4.1-rc6'=
 into init-v4.1-rc6)
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and =
modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach=
-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Merging akpm-current/current (8c169d94c31f scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in MAINTAINERS
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/nvme-core.c: fix build with gcc-4.4.4
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: kernel/relay.c: use kvfree() in relay_free_page_array()
Applying: cxgb3: use kvfree() in cxgb_free_mem()
Applying: cxgb4: use kvfree() in t4_free_mem()
Applying: drm: use kvfree() in drm_free_large()
Applying: drm/nouveau/gem: use kvfree() in u_free()
Applying: IB/ehca: use kvfree() in ipz_queue_{cd}tor()
Applying: target: use kvfree() in session alloc and free
Applying: libcxgbi: use kvfree() in cxgbi_free_big_mem()
Applying: bcache: use kvfree() in various places
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to =
void
Applying: MAINTAINERS: update Emulex ocrdma email addresses
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (2be407817a2a drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/ErC55f0U2iLgdh+E3FLxEgu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbsuMAAoJEMDTa8Ir7ZwVOCEP/AtIppHGoyLhkdkRqi871MEh
1M6yhYVagUu3YwRPaw95Swp95bxAcoD8R82NmTR8v5ezYWDy+BdFkOIWDP+3EX2Y
duWZy/EoSca0mme0a12FVKcX30Ntat/ub1zjBaaXEP4J+jKGDYa1dxqKaLwHpPHY
FgQUhXgxsydYKtHOWIpk4k80YveB82nXVswkFtnU6hh/5VyB5gb3XG7Z7/dlwdRu
AlNhG72PhdjGM4q20u7olPzLniGqDLQD3Xc00srWoGVfXpqLTrVxU0kv7TQlV7XO
L9ZdAMQ9vYQvar7qgmIY6K97wPqQomPCarM6Bcst2ojJhtm5xlCm4TTpQt2cA9bU
MkztCVAuf1m48pbUsq7UCr+WH/tVrZtIh8/jFULSl1OOHu5MYUV3YArysy9YsWf9
/tgHZDQ0MoHW567/BHzTtuCFv/140CaJNyUMddX/pRd3SPCnl6RwDeTJpf6sb18Z
hjM8Cgksbm5bYgqsoXYtOonw2idwuYmaHD/GP+iNA6ULw8vsa+GexHTdiE5bS2uw
JpsSTniIaBNc6XKBI08Q9b6Yaicn9rdTBInLFukN3H2uPBLjGZ1kCj9xMKwgS8Wc
8nXYVvSCPC6jLOwbS7Cyr1eTclCsFy9Y3pgPqRkkHrhT6FDpx8p+PZwyh8BpiNfK
VMavxVRyh75KGUzM++C7
=9n8O
-----END PGP SIGNATURE-----

--Sig_/ErC55f0U2iLgdh+E3FLxEgu--
