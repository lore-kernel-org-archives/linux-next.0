From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 29
Date: Mon, 29 Jun 2015 14:09:58 +1000
Message-ID: <20150629140958.4b7567c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/r0sufvJGbUR3z+rL3OMF8Us"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57221 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751376AbbF2EKG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2015 00:10:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/r0sufvJGbUR3z+rL3OMF8Us
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150626:

Undropped tree: edac-amd

The modules tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1821
 1683 files changed, 111393 insertions(+), 26077 deletions(-)

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
Merging origin/master (4a10a91756ef Merge branch 'upstream' of git://git.in=
fradead.org/users/pcmoore/audit)
Merging fixes/master (e0dd880a545c Merge branch 'for-4.2' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tj/wq)
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
Merging sparc/master (f01cae4e1a9b Merge branch 'sparc-perf-stack')
Merging net/master (011cb197a84e Merge branch 'bnx2x')
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (831bfdf9520e ALSA: hda - restore the MIC F=
IXUP for some Dell machines)
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
Merging staging.current/staging-linus (2a298679b411 Merge tag 'usb-4.2-rc1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging char-misc.current/char-misc-linus (2a298679b411 Merge tag 'usb-4.2-=
rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging input-current/for-linus (f7ebc4dcdeb1 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (44a17ef872fa crypto: rsa - add .gitignore fo=
r crypto/*.-asn1.[ch] files)
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
CONFLICT (content): Merge conflict in include/asm-generic/barrier.h
CONFLICT (content): Merge conflict in MAINTAINERS
Merging arm/for-next (002af195a8c7 ARM: Fix build if CLKDEV_LOOKUP is not c=
onfigured)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
Merging arm-soc/for-next (797fb3dd0df1 Merge tag 'v4.1' into for-next)
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
Merging arm64/for-next/core (d63903bbc30c arm64: bpf: fix endianness conver=
sion bugs)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (960a2741d5fd c67: irq: Use __handle_domain_irq(=
))
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-mod=
ular core eeprom.c code)
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging h8300/h8300-next (07834743f42b h8300: fix typo.)
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
Merging mips/mips-for-linux-next (9ff897c4e8d5 MIPS: spinlock: Adjust arch_=
spin_lock back-off time)
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
Merging s390/features (7fa4a3508e2d s390/oprofile: fix compile error)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (5316a64ce518 tile: avoid a "label not used" warning in=
 do_page_fault())
CONFLICT (content): Merge conflict in arch/tile/Kconfig
Merging uml/linux-next (da028d5e5463 um: Don't pollute kernel namespace wit=
h uapi)
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in uml/linux-next and mo=
dified in HEAD. Version HEAD of fs/hppfs/hppfs.c left in tree.
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
$ git rm -f fs/hppfs/hppfs.c
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (5a5003df98d5 btrfs: delayed-ref: double free in btrfs_a=
dd_delayed_tree_ref())
Merging ceph/master (64c1797a9371 libceph: Remove spurious kunmap() of the =
zero page)
Merging cifs/for-next (8180e0066d6b Update negotiate protocol for SMB3.11 d=
ialect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (a2fd66d069d8 ext4: set lazytime on remount if MS_LAZYTIME=
 is set by mount)
Merging f2fs/dev (3c4541452748 f2fs: do not trim preallocated blocks when t=
runcating after i_size)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (39b0f1e92908 GFS2: Don't brelse rgrp buffer_heads ev=
ery allocation)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (6c5a0d891543 NFSv4.2: LAYOUTSTATS is optional to im=
plement)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/verbs.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
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
Merging v4l-dvb/master (3a8ddb3f08a3 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (fad6f9d58c07 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (132c242d9506 Merge branches 'acpi-video', 'device-pr=
operties', 'pm-sleep' and 'pm-cpuidle')
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
Merging drm-intel/for-linux-next (00245266b4be drm/i915/ppgtt: Break loop i=
n gen8_ppgtt_clear_range failure path)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Regist=
ers are 32-bit)
Merging drm-misc/topic/drm-misc (1ba140a04d06 drm/vgem: Set unique to "vgem=
")
Merging drm-exynos/exynos-drm/for-next (e0456717e483 Merge git://git.kernel=
.org/pub/scm/linux/kernel/git/davem/net-next)
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits afte=
r hang)
Merging sound/for-next (831bfdf9520e ALSA: hda - restore the MIC FIXUP for =
some Dell machines)
Merging sound-asoc/for-next (ac16743bf2c5 Merge remote-tracking branch 'aso=
c/fix/mediatek' into asoc-linus)
Merging modules/modules-next (20bdc2cfdbc4 modules: only use mod->param_loc=
k if CONFIG_MODULES)
CONFLICT (content): Merge conflict in include/linux/seqlock.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Merging input/next (7c494375b773 Input: improve parsing OF parameters for t=
ouchscreens)
Merging block/for-next (81bf3582e7aa Merge branch 'for-4.2/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in block/blk-cgroup.c
Merging device-mapper/for-next (b5451e456840 dm cache policy smq: fix "defa=
ult" version to be 1.4.0)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic whe=
n handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEM=
PT=3Dn)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (ab16bfc732c4 md: clear Blocked flag on failed devices =
when array is read-only.)
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
Merging watchdog/master (b349ebf5c51b watchdog: gpio_wdt: Add option for ea=
rly registration)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (5ffde2f67181 Merge branches 'arm/rockchip', 'arm/exynos=
', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'default-domains' and 'core' into nex=
t)
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
Merging devicetree/devicetree/next (ce32f859646b of/fdt: fix argument name =
and add comments of unflatten_dt_node())
Merging dt-rh/for-next (0b34c1a489f6 Documentation: DT: Fix a typo in the f=
ilename "lantiq,<chip>-pinumx.txt")
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.txt
Merging mailbox/mailbox-for-next (7d641938aa2a mailbox/bcm2835: Fix mailbox=
 full detection.)
Merging spi/for-next (cc03a6ead72e Merge remote-tracking branch 'spi/fix/mg=
-spfi' into spi-linus)
Merging tip/auto-latest (f90b212c061b Merge branch 'x86/boot')
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevent=
s/4.2' into clockevents/next)
CONFLICT (add/add): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
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
Merging drivers-x86/for-next (b8830a4e71b1 dell-laptop: Fix allocating & fr=
eeing SMI buffer page)
CONFLICT (content): Merge conflict in drivers/platform/x86/samsung-laptop.c
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
CONFLICT (content): Merge conflict in drivers/platform/x86/asus-wmi.c
CONFLICT (content): Merge conflict in drivers/platform/x86/apple-gmux.c
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (970284e6d6f5 Merge remote-tracking branches 'regma=
p/topic/defaults', 'regmap/topic/irq' and 'regmap/topic/reg-params' into re=
gmap-next)
Merging hsi/for-next (f451e76f8969 HSI: nokia-modem: use flags argument of =
devm_gpiod_get to set direction)
Merging leds/for-next (8a687719d031 leds: aat1290: pass flags parameter to =
devm_gpiod_get)
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
Merging staging/staging-next (2a298679b411 Merge tag 'usb-4.2-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Merging char-misc/char-misc-next (2a298679b411 Merge tag 'usb-4.2-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name=
() function pointer of extcon_dev)
Merging kdbus/kdbus (337faaf05f04 Merge 4.1 into branch 'kdbus')
Merging cgroup/for-next (8a0792ef8e01 cgroup: add delegation section to uni=
fied hierarchy documentation)
Merging scsi/for-next (c8806b6c9e82 snic: driver for Cisco SCSI HBA)
Merging target-updates/for-next (2ec1e9e20701 target: Bump core version to =
v5.0)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (daecdc66968f pinctrl: rockchip: add support for t=
he rk3368)
Merging vhost/linux-next (d348c509a78e vhost: add ioctl to query nregions u=
pper limit)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build =
breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (38e003f4b5dc gpio: Fix checkpatch.pl issues)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton =
platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (81909cb33502 mnt: Avoid unnecessary regressions in=
 fs_fully_visible)
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (358bdf892f6b clk: stm32: Add clock driver for STM32F4=
[23]xxx devices)
CONFLICT (content): Merge conflict in drivers/clk/Makefile
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
Merging rtc/rtc-next (3783055ef4cf rtc: remove useless I2C dependencies)
Merging init/init-v4.1-rc6 (bc3e452003d0 module: relocate module_init from =
init.h to module.h)
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and =
modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach=
-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Merging hwspinlock/for-next (b97cadee805e DT: hwspinlock: add the CSR atlas=
7 hwspinlock bindings document)
Merging nvdimm/libnvdimm-for-next (0ba1c634892b libnvdimm: write blk label =
set)
CONFLICT (content): Merge conflict in drivers/block/Kconfig
Merging akpm-current/current (d74235fc3a7f scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in mm/nobootmem.c
CONFLICT (content): Merge conflict in mm/memblock.c
CONFLICT (content): Merge conflict in fs/ocfs2/journal.c
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/s390/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/s390/include/asm/page.h
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/nvme-core.c: fix build with gcc-4.4.4
Applying: drivers/gpu/drm/i915/intel_sprite.c: fix build
Applying: drivers/gpu/drm/i915/intel_tv.c: fix build
Applying: net/netfilter/ipset: work around gcc-4.4.4 initializer bug
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
Applying: MAINTAINERS: remove website for paride
Applying: MAINTAINERS: update sound soc intel patterns
Applying: MAINTAINERS: update brcm dts pattern
Applying: MAINTAINERS: update brcm gpio filename pattern
Applying: MAINTAINERS: remove unused nbd.h pattern
Applying: MAINTAINERS: move Jens Osterkamp to CREDITS
Applying: MAINTAINERS: BCACHE: Kent Overstreet has changed email address
Applying: MAINTAINERS: add zpool
Applying: x86: opt into HAVE_COPY_THREAD_TLS, for both 32-bit and 64-bit
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
Applying: genalloc: rename dev_get_gen_pool() to gen_pool_get()
Applying: genalloc: rename of_get_named_gen_pool() to of_gen_pool_get()
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: crypto: marvell/cesa - fix up for of_get_named_gen_pool() rename
Applying: crypto: marvell/cesa - another fix up for of_get_named_gen_pool()=
 rename
Applying: nsfs: fix for seq_printf() API change
Merging akpm/master (9721a37df0e9 nsfs: fix for seq_printf() API change)

--Sig_/r0sufvJGbUR3z+rL3OMF8Us
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVkMUbAAoJEMDTa8Ir7ZwVjcAP/R7jERtUxs8Ht04AEYbyW1xb
NCcSfDzmD+lT8TnWghma0ZPv0FepDLNwGwojXZxHUHdDNWd7gAQCdIXRakLjaX0a
VyZ8X4lmcipL1SyKEjk4QF9ZdXGTbMUEddgTbibox1k98I4vSI8svZ6/3OuXsMID
aDDwlZUfcvPLdDiZE8i0RYdwHBmLG11Bc+7X9XZ+qSlhvTwOytpkhunzUpiQhRZ2
zbItRMG7xeGY1leWfqIXkkkMBaZ//BAdI01cw4YVcg+L+gSvAcQCJwZCof7JMYvx
g2JLjpyfW7C3DmtzTlMzj7zGx58PFZ6rwHdrseVSqjVtmT7fgEGPuPXKK4Iillrx
b3LIWsiAF8Zt/HN48EpsAZeQ4zqo6eYolmw+xgWjqBcHgxJbaCAbgMuhBhbVGdSr
ED53+GALt+2SUMc5GhtTcJO+d0fAqVeYA+nwblC2PK6bRLDK9FVaw8mUWluO0Y+T
++oCJp5GnjyVtmpeGGAW8iB3MqKjhHKNtq0xlbxkNuoPher/IZosk3nR9EnzjSth
S5pj+4F+Gl1fjnRMO6kKFrb7ANChFRneHp8LX153+UOg3pUDHRzJKOHGkhWj6/xA
SrMY65yMp0gZvion/tGAjq0Xd8Ham59KXTSjdSiMSkEulMsis/tEvcV6oindY/o5
2I5GBDLTIstUTd7TSVVR
=OoW6
-----END PGP SIGNATURE-----

--Sig_/r0sufvJGbUR3z+rL3OMF8Us--
