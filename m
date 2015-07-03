From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jul 3
Date: Fri, 3 Jul 2015 14:08:52 +1000
Message-ID: <20150703140852.63a36c15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Huz8ShbCS16f6hvV=0MTWu0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57571 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753352AbbGCEJA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jul 2015 00:09:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/Huz8ShbCS16f6hvV=0MTWu0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any v4.3 related material to your linux-next included
branches until after v4.2-rc1 is released.

Changes since 20150702:

The akpm tree lost several patches that turned up elsewhere.

Non-merge commits (relative to Linus' tree): 1055
 876 files changed, 57060 insertions(+), 11965 deletions(-)

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

I am currently merging 221 trees (counting Linus' and 31 trees of patches
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
Merging origin/master (e965b8ce4215 Merge branch 'kbuild' of git://git.kern=
el.org/pub/scm/linux/kernel/git/mmarek/kbuild)
Merging fixes/master (6ac15baacb6e Merge branch 'timers-urgent-for-linus' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (0bbe6b5a73c0 ARM: 8388/1: tcm: Don't crash when =
TCM banks are protected by TrustZone)
Merging m68k-current/for-linus (1214c525484c m68k: Use for_each_sg())
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (b953c0d234bc Linux 4.1)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (4a10a91756ef Merge branch 'upstream' of git://git.inf=
radead.org/users/pcmoore/audit)
Merging net/master (462e1ead9296 bridge: vlan: fix usage of vlan 0 and 4095=
 again)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (0689a86ae814 ALSA: usb-audio: Add MIDI sup=
port for Steinberg MI2/MI4)
Merging pci-current/for-linus (552bc94ebeeb PCI: Preserve resource size dur=
ing alignment reordering)
Merging wireless-drivers/master (38fe44e61a89 Merge tag 'iwlwifi-for-kalle-=
2015-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging tty.current/tty-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb.current/usb-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (0f57d86787d8 Linux 4.1-rc8)
Merging staging.current/staging-linus (6aaf0da8728c Merge tag 'md/4.2' of g=
it://neil.brown.name/md)
Merging char-misc.current/char-misc-linus (2a298679b411 Merge tag 'usb-4.2-=
rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging input-current/for-linus (f7ebc4dcdeb1 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (0fbafd06bdde crypto: aesni - fix failing set=
key for rfc4106-gcm-aesni)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix t=
est for PPC_PSERIES)
Merging rr-fixes/fixes (f36963c9d3f6 cpumask_set_cpu_local_first =3D> cpuma=
sk_local_spread, lament)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: H=
andle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (b953c0d234bc Linux 4.1)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (40b8ad8f762c ARC: Fix build failures for ARCompact in=
 linux-next after ARCv2 support)
Merging arm/for-next (002af195a8c7 ARM: Fix build if CLKDEV_LOOKUP is not c=
onfigured)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
Merging arm-soc/for-next (f4017fed0e23 Merge branch 'next/late' into for-ne=
xt)
Merging at91/at91-next (dd1f58f398fb Merge branch 'at91-4.2-dt' into at91-n=
ext)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' an=
d 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (7f8ad9c26be9 Merge branch 'berlin/simple-mf=
d' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (5bfaa924477b Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (4ecfa690bcf6 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (8e638875387f Merge tag 'omap-for-v4.2/wakeirq-driver=
s-v2' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_da=
ta.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (7585f44e561e Merge branch 'v4.2-next/dt64-samsung=
' into for-next)
Merging sunxi/sunxi/for-next (11f9fb71e172 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (ea389daa7fd9 arm64: cpuidle: add __init sectio=
n marker to arm_cpuidle_init)
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
Merging m68knommu/for-next (e1632fa24712 m68k: improve m68knommu MAINTAINER=
S entry)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary st=
ruct pci_dev declaration)
Merging mips/mips-for-linux-next (c63f887bdae8 Merge branch 'for-next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu)
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (6096f8845154 Merge branch 'next' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/scottwood/linux into next)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD=
 by CONFIG_USB_ISP1760)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (c819ca91a659 s390/sclp: Change SCLP console default =
buffer-full behavior)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (5316a64ce518 tile: avoid a "label not used" warning in=
 do_page_fault())
Merging uml/linux-next (da028d5e5463 um: Don't pollute kernel namespace wit=
h uapi)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_a=
dd_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the =
zero page)
Merging cifs/for-next (1dfd18d05712 cifs: Unset CIFS_MOUNT_POSIX_PATHS flag=
 when following dfs mounts)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (a2fd66d069d8 ext4: set lazytime on remount if MS_LAZYTIME=
 is set by mount)
Merging f2fs/dev (6aaf0da8728c Merge tag 'md/4.2' of git://neil.brown.name/=
md)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (0a30f612d6cf fuse: update MAINTAINERS entry)
Merging gfs2/for-next (c63f887bdae8 Merge branch 'for-next' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/gerg/m68knommu)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (b4839ebe21fc nfs: Remove invalid tk_pid from debug =
message)
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
Merging vfs/for-next (dc3f4198eac1 make simple_positive() public)
CONFLICT (content): Merge conflict in fs/ceph/dir.c
Merging pci/next (207b074f82c6 Merge branches 'pci/host-xgene' and 'pci/hot=
plug' into next)
Merging hid/for-next (c0f37da04b5b Merge branch 'for-4.2/upstream' into for=
-next)
Merging i2c/i2c/for-next (cae30642c6f9 Merge branch 'i2c/for-4.2' into i2c/=
for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addre=
sses can be probed)
Merging dmi/master (6d962cb2f674 firmware: dmi: struct dmi_header should be=
 packed)
Merging hwmon-staging/hwmon-next (761c1770f2bf hwmon: add driver for Microc=
hip TC74)
Merging v4l-dvb/master (5bab86243d94 [media] media/pci/cobalt: fix Kconfig =
and build when SND is not enabled)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (fad6f9d58c07 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (1a89e36f45a9 Merge branch 'acpica')
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
Merging slave-dma/next (8b5de2c2df45 Merge branch 'for-linus' into next)
Merging net-next/master (aefbef10e3ae Merge branch 'akpm' (patches from And=
rew))
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (40b503c76481 brcmfmac: make brcmf_p2p=
_detach() call conditional)
Merging bluetooth/master (4aa7cafd145b Bluetooth: hidp: Initialize list hea=
der of hidp session user)
CONFLICT (content): Merge conflict in net/mac802154/llsec.c
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
Merging mtd/master (0eb8618bd075 mtd: docg3: Fix kasprintf() usage)
Merging l2-mtd/master (0eb8618bd075 mtd: docg3: Fix kasprintf() usage)
Merging crypto/master (7eac7144dd1e crypto: sahara - propagate the error on=
 clk_disable_unprepare() failure)
Merging drm/drm-next (c5fd936e992d drm/nouveau: Pause between setting gpu t=
o D3hot and cutting the power)
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add b=
us format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (ee46f3c7d79c drm/i915: Clear pipe's pll h=
w state in hsw_dp_set_ddi_pll_sel())
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Regist=
ers are 32-bit)
Merging drm-misc/topic/drm-misc (a9cc54eeba63 drm/atomic: Update old_fb aft=
er setting a property.)
Merging drm-exynos/exynos-drm/for-next (e0456717e483 Merge git://git.kernel=
.org/pub/scm/linux/kernel/git/davem/net-next)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits afte=
r hang)
Merging sound/for-next (0689a86ae814 ALSA: usb-audio: Add MIDI support for =
Steinberg MI2/MI4)
Merging sound-asoc/for-next (e2674b63d1bd Merge remote-tracking branches 'a=
soc/fix/mediatek' and 'asoc/fix/topology' into asoc-linus)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_loc=
k if CONFIG_MODULES)
Merging input/next (d55d0b56b9c3 Input: wdt87xx_i2c - add a scaling factor =
for TOUCH_MAJOR event)
Merging block/for-next (81bf3582e7aa Merge branch 'for-4.2/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in block/blk-cgroup.c
Merging device-mapper/for-next (d358340dc3e5 dm cache policy smq: change th=
e mutex to a spinlock)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic whe=
n handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEM=
PT=3Dn)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (195c018eefad Fix read-balancing during node failure)
Merging mfd/for-mfd-next (1abf25a25b86 mfd: lpc_ich: Assign subdevice ids a=
utomatically)
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the re=
turn type of backlight_update_status() to int)
Merging battery/master (43df61051ab9 power_supply: Correct kerneldoc copy p=
aste errors)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (42ee0cd81999 Merge remote-tracking branch 'regu=
lator/fix/s2mps11' into regulator-linus)
Merging security/next (b3bddffd35a0 Merge branch 'next' of git://git.kernel=
.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels =
on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (f8da79312a80 watchdog: omap_wdt: early_enable modu=
le parameter)
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
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
Merging spi/for-next (cc03a6ead72e Merge remote-tracking branch 'spi/fix/mg=
-spfi' into spi-linus)
Merging tip/auto-latest (c7ea10a7907d Merge branch 'x86/urgent')
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
Merging kvm/linux-next (aefbef10e3ae Merge branch 'akpm' (patches from Andr=
ew))
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
Merging drivers-x86/for-next (0a8b83530b6f intel_pmc_ipc: Add Intel Apollo =
Lake PMC IPC driver)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (970284e6d6f5 Merge remote-tracking branches 'regma=
p/topic/defaults', 'regmap/topic/irq' and 'regmap/topic/reg-params' into re=
gmap-next)
Merging hsi/for-next (f451e76f8969 HSI: nokia-modem: use flags argument of =
devm_gpiod_get to set direction)
Merging leds/for-next (b67893206fc0 leds:lp55xx: fix firmware loading error)
Merging ipmi/for-next (cc5c8d2cc014 ipmi: Make some data const that was onl=
y read)
Merging driver-core/driver-core-next (0e6c861f73ec Revert "base/platform: O=
nly insert MEM and IO resources")
Merging tty/tty-next (71206b9f8120 Doc: serial-rs485.txt: update RS485 driv=
er interface)
Merging usb/usb-next (50641056d833 usb: dwc3: Use ASCII space in Kconfig)
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUS=
Y too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_t=
imer)
Merging staging/staging-next (6aaf0da8728c Merge tag 'md/4.2' of git://neil=
.brown.name/md)
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Merging char-misc/char-misc-next (2a298679b411 Merge tag 'usb-4.2-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging extcon/extcon-next (00f734019663 extcon: arizona: Simplify pdata sy=
mantics for micd_dbtime)
Merging kdbus/kdbus (337faaf05f04 Merge 4.1 into branch 'kdbus')
Merging cgroup/for-next (8a0792ef8e01 cgroup: add delegation section to uni=
fied hierarchy documentation)
Merging scsi/for-next (c8806b6c9e82 snic: driver for Cisco SCSI HBA)
Merging target-updates/for-next (2ec1e9e20701 target: Bump core version to =
v5.0)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (daecdc66968f pinctrl: rockchip: add support for t=
he rk3368)
Merging vhost/linux-next (fe8a5a662665 virtio scsi: fix unused variable war=
ning)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build =
breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (38e003f4b5dc gpio: Fix checkpatch.pl issues)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton =
platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (93e3bce6287e vfs: Remove incorrect debugging WARN =
in prepend_path)
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (358bdf892f6b clk: stm32: Add clock driver for STM32F4=
[23]xxx devices)
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
Merging coresight/next (486ea46dfc88 coresight-etm3x: Add Qualcomm PTM v1.1=
 peripheral ID)
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight=
-replicator-qcom.c
CONFLICT (add/add): Merge conflict in drivers/hwtracing/coresight/coresight=
-etm4x.c
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight=
-etm3x.c
Merging rtc/rtc-next (6fc462f8c5b1 rtc: ds1307: Support optional wakeup int=
errupt source)
Merging init/init-v4.1-rc6 (bc3e452003d0 module: relocate module_init from =
init.h to module.h)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in =
regmap_field)
Merging nvdimm/libnvdimm-for-next (193ccca43850 nfit: fix smatch "use after=
 null check" report)
Merging akpm-current/current (d74235fc3a7f scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in mm/memblock.c
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in fs/ocfs2/journal.c
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/s390/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/page.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
Applying: fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to =
void
Applying: mm: provide new get_vaddr_frames() helper
Applying: mm-provide-new-get_vaddr_frames-helper-fix
Applying: media: omap_vout: convert omap_vout_uservirt_to_phys() to use get=
_vaddr_pfns()
Applying: vb2: provide helpers for mapping virtual addresses
Applying: media: vb2: convert vb2_dma_sg_get_userptr() to use frame vector
Applying: media: vb2: Convert vb2_vmalloc_get_userptr() to use frame vector
Applying: media: vb2: convert vb2_dc_get_userptr() to use frame vector
Applying: media: vb2: remove unused functions
Applying: drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_f=
rames()
Applying: mm: move get_vaddr_frames() behind a config option
Applying: mm-move-get_vaddr_frames-behind-a-config-option-fix
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: crypto: marvell/cesa - another fix up for of_get_named_gen_pool()=
 rename
Merging akpm/master (7e6ce3db5329 crypto: marvell/cesa - another fix up for=
 of_get_named_gen_pool() rename)

--Sig_/Huz8ShbCS16f6hvV=0MTWu0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVlgrYAAoJEMDTa8Ir7ZwV69sP/iGkcC9liTm4vceQxK8m5lGk
7nBEotKY0AXtVyjAEXbqhFWnnH17ndZhQV3oRqA6h3dbbyQOKGQSi+1mIrbg7CXz
jQUiix7HOMhnAHYdVpWmTlxlcNG/c3wDNYviFW5gWWW73eW7Oa2uuD7S7sZjH5Xg
6hYJekeK31XnNGoxYWJDT4SZTNBuoZojXUa9CJuEJQMPr02WSmrcMqHIfdiqYOgD
6eLj5j3hQRvuZ15jJfi/KIEYuS8T+Cm/xeE6huIB8tYwGg7Zd4wmwE9+SaSSAGs0
U4S/aEvmLzuXXhjwE2RoxXv9gJDLGyFs0tzNt93EQYsOTsm2m4PBprk6qG3Nzvly
K0iz03grSLLH5xH4cgS2VaYDG4iGXIcPjdlyjWFLIMpcEuspRwFGx6YkqAI/mHvC
LYLpBzOc10dZ8d/HnmY9jQMXowOh2yU1Hp8w33lyXbN4bA8+RTku44z7MrnnbzP8
oE5cRlNOpR5WT2Klfo0bcALejEoNSuSPpd59jKvuQBpQZzsNboq/AoJqT1spJ5pD
wT3JdDJ+KgzINr/1f0d6fhZ9wrKWhaJesjbzg1r7dnP/vcSYd70ACkJzichROCnF
lBXF8OvQmP5CkbNrvDB5x+qvnHjJzBll5gNKi9Gx5u3jyxyUvWUA8BeQFmxRVbYS
joOIFmC6uAl2wDa+lm6k
=k/L+
-----END PGP SIGNATURE-----

--Sig_/Huz8ShbCS16f6hvV=0MTWu0--
