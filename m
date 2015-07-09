From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 9
Date: Thu, 9 Jul 2015 14:09:25 +1000
Message-ID: <20150709140925.4586cd10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eZ+4NaXY/yX_UkOq55PjDx."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55086 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751525AbbGIEJf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jul 2015 00:09:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/eZ+4NaXY/yX_UkOq55PjDx.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150708:

The drm-intel tree gained conflicts against Linus' and the drm-intel-fixes
trees.

The tip tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1275
 1128 files changed, 68969 insertions(+), 20637 deletions(-)

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

I am currently merging 223 trees (counting Linus' and 32 trees of patches
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
Merging origin/master (45820c294fe1 Fix broken audit tests for exec arg len)
Merging fixes/master (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (11b8b25ce4f8 ARM: fix lockdep unannotated irqs-o=
ff warning)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (9958084a5275 powerpc: Update MAINTAINERS to po=
int at shared tree)
Merging powerpc-merge-mpe/fixes (a8956a7b7232 powerpc/powernv: Fix opal-elo=
g interrupt handler)
Merging powerpc-merge-benh/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (4a10a91756ef Merge branch 'upstream' of git://git.inf=
radead.org/users/pcmoore/audit)
Merging net/master (142b942a75cb rhashtable: fix for resize events during t=
able walk)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (e828b23734bf ALSA: hda - add codec ID for =
Broxton display audio codec)
Merging pci-current/for-linus (552bc94ebeeb PCI: Preserve resource size dur=
ing alignment reordering)
Merging wireless-drivers/master (38fe44e61a89 Merge tag 'iwlwifi-for-kalle-=
2015-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (d770e558e219 Linux 4.2-rc1)
Merging tty.current/tty-linus (d770e558e219 Linux 4.2-rc1)
Merging usb.current/usb-linus (d4669bb1427c Merge tag 'fixes-for-v4.2-rc2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (b2e2c94b878b usb: gadget: f_midi: fix error=
 recovery path)
Merging usb-serial-fixes/usb-linus (f98a7aa81eee USB: cp210x: add ID for Ar=
uba Networks controllers)
Merging staging.current/staging-linus (cbe4f4434ded staging:lustre: remove =
irq.h from socklnd.h)
Merging char-misc.current/char-misc-linus (d770e558e219 Linux 4.2-rc1)
Merging input-current/for-linus (539c4b88146c Input: elan_i2c - change the =
hover event from MT to ST)
Merging crypto-current/master (030f4e968741 crypto: nx - Fix reentrancy bug=
s)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix t=
est for PPC_PSERIES)
Merging rr-fixes/fixes (758556bdc1c8 module: Fix load_module() error path)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: H=
andle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (dec4f799d0a4 drm/i915: Use cr=
tc_state->active in primary check_plane func)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (e9d7b0fd6d19 arc:irqchip: prepare for drivers/irqchip=
/irqchip.h removal)
Merging arm/for-next (820098eda19e Merge branches 'fixes' and 'ioremap' int=
o for-next)
Merging arm-perf/for-next/perf (d770e558e219 Linux 4.2-rc1)
Merging arm-soc/for-next (9ccd608070b6 arm64: dts: add device tree for ARM =
SMM-A53x2 on LogicTile Express 20MG)
Merging at91/at91-next (dd1f58f398fb Merge branch 'at91-4.2-dt' into at91-n=
ext)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' an=
d 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (d770e558e219 Linux 4.2-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (b19332285d2b Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (4ecfa690bcf6 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (ae745302c0a3 Merge branch 'fixes-rc1' into omap-for-=
v4.2/fixes)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_da=
ta.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (97a09c7c19af Merge branches 'heads/cleanup-for-v4.3',=
 'heads/defconfig-for-v4.3', 'heads/dt-for-v4.3', 'heads/pm-domain-for-v4.3=
' and 'heads/soc-for-v4.3' into next)
Merging samsung/for-next (7585f44e561e Merge branch 'v4.2-next/dt64-samsung=
' into for-next)
Merging sunxi/sunxi/for-next (2676ca3b2993 Merge branch 'sunxi/dt-for-4.3' =
into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (f871d2680707 arm64: Fix show_unhandled_signal_=
ratelimited usage)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq(=
))
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-mod=
ular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (25914cf22b72 clk: h8300: Remove "sh73a0-" part fr=
om compatible value)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (ae40b7e28752 Merge branch 'misc-4.2' into next)
Merging m68k/for-next (1214c525484c m68k: Use for_each_sg())
Merging m68knommu/for-next (955646792742 m68knommu: update defconfig for Co=
ldFire m5475evb)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary st=
ruct pci_dev declaration)
Merging mips/mips-for-linux-next (f9a629fd2ab7 Merge branch '4.2-fixes' int=
o mips-for-linux-next)
Merging nios2/nios2-next (a8955cc3a504 nios2: check number of timer instanc=
es)
Merging parisc-hd/for-next (5584d37564c3 stifb: Implement hardware accelera=
ted copyarea)
Merging powerpc/next (c7e9ad7da219 Merge branch 'perf-urgent-for-linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging powerpc-mpe/next (6096f8845154 Merge branch 'next' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc-benh/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD=
 by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (2f4104c6da8b s390/cio: Fix comma)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (d770e558e219 Linux 4.2-rc1)
Merging uml/linux-next (46acfb806813 um: Fix out-of-tree build)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (1203b34261e4 xtensa: fix threadptr reload on retur=
n to userspace)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_a=
dd_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the =
zero page)
Merging cifs/for-next (f482ca8c73ba Update cifs version number)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (7444a072c387 ext4: replace open coded nofail allocation i=
n ext4_free_blocks())
Merging f2fs/dev (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (c63f887bdae8 Merge branch 'for-next' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/gerg/m68knommu)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (b5872f0c67ed SUNRPC: Don't confuse ENOBUFS with a w=
rite_space issue)
Merging nfsd/nfsd-next (901f1379f6c9 sunrpc: use sg_init_one() in krb5_rc4_=
setup_enc/seq_key())
Merging overlayfs/overlayfs-next (cdb672795876 ovl: lookup whiteouts outsid=
e iterate_dir())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (669d3d123395 UBI: Remove unnecessary `\')
Merging xfs/for-next (de50e16ffabf Merge branch 'xfs-misc-fixes-for-4.2-3' =
into for-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (0f1db7dee200 9p: cope with bogus responses from serve=
r in p9_client_{read,write})
Merging pci/next (207b074f82c6 Merge branches 'pci/host-xgene' and 'pci/hot=
plug' into next)
Merging hid/for-next (adf6f7ae92d6 Merge branch 'for-4.3/i2c-hid' into for-=
next)
Merging i2c/i2c/for-next (d770e558e219 Linux 4.2-rc1)
Merging jdelvare-hwmon/master (1dc51b828800 Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (1dc51b828800 Merge branch 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging hwmon-staging/hwmon-next (1840cf8ac8dc hwmon: (f71882fg) Add suppor=
t for f81768d)
Merging v4l-dvb/master (5bab86243d94 [media] media/pci/cobalt: fix Kconfig =
and build when SND is not enabled)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (fad6f9d58c07 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (8076ca480f40 Merge branch 'acpi-scan')
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' in=
to release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (111b23cf895b Merge branches 'release' and 'thermal-so=
c' of .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single =
function)
Merging slave-dma/next (b15317e8a139 Merge branch 'topic/at_xdmac' into nex=
t)
Merging net-next/master (7baaa9092ded net: macb: Add SG support for Zynq SO=
C family)
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (40b503c76481 brcmfmac: make brcmf_p2p=
_detach() call conditional)
Merging bluetooth/master (c2f9286ad48e mac802154: fix ieee802154_rx handlin=
g)
CONFLICT (content): Merge conflict in net/mac802154/llsec.c
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (5f867db63473 mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag=
 conflict)
Merging l2-mtd/master (906b1f536d5b Merge MTD 4.2-rc fixes into MTD -next)
Merging crypto/master (1425d2d17f73 crypto: tcrypt - Fix AEAD speed tests)
Merging drm/drm-next (c5fd936e992d drm/nouveau: Pause between setting gpu t=
o D3hot and cutting the power)
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add b=
us format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (de152b627eb3 drm/i915: Add origin to fron=
tbuffer tracking flush)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Regist=
ers are 32-bit)
Merging drm-misc/topic/drm-misc (ec9f932ed416 drm/atomic: Cleanup on error =
properly in the atomic ioctl.)
Merging drm-exynos/exynos-drm/for-next (e0456717e483 Merge git://git.kernel=
.org/pub/scm/linux/kernel/git/davem/net-next)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits afte=
r hang)
Merging sound/for-next (e828b23734bf ALSA: hda - add codec ID for Broxton d=
isplay audio codec)
Merging sound-asoc/for-next (fdcc7e5ed16d Merge remote-tracking branches 'a=
soc/topic/wm8904' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_loc=
k if CONFIG_MODULES)
Merging input/next (b7e79329c4e3 Input: bma150 - use sign_extend32() for si=
gn extending)
Merging block/for-next (81bf3582e7aa Merge branch 'for-4.2/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in block/blk-cgroup.c
Merging device-mapper/for-next (bddd41c26b5c dm btree remove: remove unused=
 function get_nr_entries())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic whe=
n handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEM=
PT=3Dn)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (195c018eefad Fix read-balancing during node failure)
Merging mfd/for-mfd-next (46a0c045e80c mfd: wm8994-regmap: Constify reg_def=
ault tables)
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the re=
turn type of backlight_update_status() to int)
Merging battery/master (43df61051ab9 power_supply: Correct kerneldoc copy p=
aste errors)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (78a76e43a32a Merge remote-tracking branches 're=
gulator/topic/ltc3589', 'regulator/topic/max8973' and 'regulator/topic/pwm'=
 into regulator-next)
Merging security/next (b3bddffd35a0 Merge branch 'next' of git://git.kernel=
.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels =
on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (1c4c7159ed24 Merge tag 'ext4_for_linus_stable' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4)
Merging iommu/next (7a5a566eab48 iommu/amd: Introduce protection_domain_ini=
t() function)
Merging dwmw2-iommu/master (c83b2f20fdde iommu/vt-d: Only enable extended c=
ontext tables if PASID is supported)
Merging vfio/next (a714ea5fa416 MAINTAINERS: Add vfio-platform sub-maintain=
er)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (36f95a0b34cb doc:md: fix typo in md.txt.)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negati=
ve/)
Merging audit/next (0b08c5e59441 audit: Fix check of return value of strnle=
n_user())
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc"=
 to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (0b34c1a489f6 Documentation: DT: Fix a typo in the f=
ilename "lantiq,<chip>-pinumx.txt")
Merging mailbox/mailbox-for-next (7d641938aa2a mailbox/bcm2835: Fix mailbox=
 full detection.)
Merging spi/for-next (270b35879337 Merge remote-tracking branches 'spi/topi=
c/sh-msiof' and 'spi/topic/stats' into spi-next)
Merging tip/auto-latest (e87561b33d30 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (3a37ff02d338 clocksource: sh_cmt: Rem=
ove obsolete sh-cmt-48-gen2 platform_device_id entry)
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP an=
d -EX)
Merging edac-amd/for-next (c13c81006314 Merge tag 'rtc-v4.2-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring b=
uffer benchmark immediately)
Merging rcu/rcu/next (0868aa22167d Merge branches 'array.2015.05.27a', 'doc=
.2015.05.27a', 'fixes.2015.05.27a', 'hotplug.2015.05.27a', 'init.2015.05.27=
a', 'tiny.2015.05.27a' and 'torture.2015.05.27a' into HEAD)
Merging kvm/linux-next (a88464a8b0ff kvm: add hyper-v crash msrs values)
Merging kvm-arm/next (c62e631d4a8e KVM: arm/arm64: vgic: Remove useless arm=
-gic.h #include)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for =
kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (402dd89d6cdb workqueue: fix typos in comments)
Merging drivers-x86/for-next (d770e558e219 Linux 4.2-rc1)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (d770e558e219 Linux 4.2-rc1)
Merging hsi/for-next (f451e76f8969 HSI: nokia-modem: use flags argument of =
devm_gpiod_get to set direction)
Merging leds/for-next (b67893206fc0 leds:lp55xx: fix firmware loading error)
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was onl=
y read)
Merging driver-core/driver-core-next (d770e558e219 Linux 4.2-rc1)
Merging tty/tty-next (d770e558e219 Linux 4.2-rc1)
Merging usb/usb-next (d770e558e219 Linux 4.2-rc1)
Merging usb-gadget/next (d770e558e219 Linux 4.2-rc1)
Merging usb-serial/usb-next (d770e558e219 Linux 4.2-rc1)
Merging staging/staging-next (d770e558e219 Linux 4.2-rc1)
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Merging char-misc/char-misc-next (d770e558e219 Linux 4.2-rc1)
Merging extcon/extcon-next (00f734019663 extcon: arizona: Simplify pdata sy=
mantics for micd_dbtime)
Merging kdbus/kdbus (337faaf05f04 Merge 4.1 into branch 'kdbus')
Merging cgroup/for-next (8a0792ef8e01 cgroup: add delegation section to uni=
fied hierarchy documentation)
Merging scsi/for-next (c8806b6c9e82 snic: driver for Cisco SCSI HBA)
Merging target-updates/for-next (f8d2b3fdf5fe tcm_loop: Send I_T_NEXUS_LOSS=
_OCCURRED UA)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (daecdc66968f pinctrl: rockchip: add support for t=
he rk3368)
Merging vhost/linux-next (c9fa662385be PCI/MSI: Make pci_msi_shutdown(), pc=
i_msix_shutdown() static)
CONFLICT (modify/delete): drivers/ntb/ntb_hw.c deleted in HEAD and modified=
 in vhost/linux-next. Version vhost/linux-next of drivers/ntb/ntb_hw.c left=
 in tree.
CONFLICT (content): Merge conflict in MAINTAINERS
$ git rm -f drivers/ntb/ntb_hw.c
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build =
breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (38e003f4b5dc gpio: Fix checkpatch.pl issues)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton =
platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (93e3bce6287e vfs: Remove incorrect debugging WARN =
in prepend_path)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (cf121f18bce3 Merge branch 'clk-determine-rate-struct'=
 into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (2278e5ed9f36 selftests: add quicktest support)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (507a76d5f701 Merge branch 'for-4.1/upstream-=
fixes' into for-next)
Merging coresight/next (2dddb351a055 coresight-etm3x: Add Qualcomm PTM v1.1=
 peripheral ID)
Merging rtc/rtc-next (6fc462f8c5b1 rtc: ds1307: Support optional wakeup int=
errupt source)
Merging init/init-v4.1-rc6 (0fd972a7d91d module: relocate module_init from =
init.h to module.h)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in =
regmap_field)
Merging nvdimm/libnvdimm-for-next (193ccca43850 nfit: fix smatch "use after=
 null check" report)
Merging akpm-current/current (cf0e4cc63804 ipc/msg.c: use freezable blockin=
g call)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to =
void
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (62be40a7a173 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/eZ+4NaXY/yX_UkOq55PjDx.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVnfP9AAoJEMDTa8Ir7ZwV464QAIa9ggu1ToFt60zsJXy4FNvM
V18yRKCXHSPOshnnwjTv3Z6WYMW8QQ+GIX+TPqEak65EikbofH3EChi/1DX68DY0
UEVBIaxIvchE0+sKpypWQ9C3eciBGvtISyggrJq0b8dKWKbaerRE5WxCKfViTOIT
X/pe0Kl5rP4g2YojEqtqIW7wbuGu4vaA5yGOMw6Qrzn0dyovuTcpOcZklU211KAY
Y/SoTVlMJLsx2D6y9mlpToaNTsG/UvWYZ1Q2g5mNqzejLc1YLn8TNKRivt9mJQCS
2xSDxfm/zKlIrGLMuADiIwvz7eHykgE4bs7lvFqE34KHU5yWP/gqQXhTq4Oqcg3Q
RCuqHqp+AlLaANZKShLUl1wrR7b9u9ofxYLUaRheOrPXD593kqBpNPr0XsCx9GmB
I+RnLw3TRCVUL/QNYGoqr29scDihtbdXy2NRKMtDf0wk/VQQYo72aFHtoTEhxWjP
x5iUBFRUrrTlQUi7nt3GweiGaPsSyZFc/munFEyvVMikljWyL6ydkoqBwdx9hjlP
qAUKFSFuw1cYEx9dFsQ16Gxr+X/tLSMN4Bw+zDM/gsHtJ6nZlJyPvodSDS9eUTQE
NvzPThdkCFva+SNr/uxArbbBTRv/IcAFTwelU3N6H5kKWCyHhLWZyVZVQx8BlNDE
o0yK55jVWtRRhvuO5AED
=W7Ww
-----END PGP SIGNATURE-----

--Sig_/eZ+4NaXY/yX_UkOq55PjDx.--
