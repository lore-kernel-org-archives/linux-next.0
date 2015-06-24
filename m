From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 24
Date: Wed, 24 Jun 2015 18:25:27 +1000
Message-ID: <20150624182527.0ad97788@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9LleK6FDzy0s9zMrS1kcrl1"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38787 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750770AbbFXIZg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2015 04:25:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/9LleK6FDzy0s9zMrS1kcrl1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150623:

The drm tree inherited the build failure from the drm-exynos tree for
which I applied a supplied patch.

The net-next tree gained a build failure for which I applied a patch.

The modules tree gained a build failure so I used the version from
next-20150623.

The dt-rh tree gained a conflict against the arm-soc tree.

Non-merge commits (relative to Linus' tree): 9910
 8604 files changed, 968756 insertions(+), 203228 deletions(-)

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
Merging origin/master (43c9fad942b5 Merge tag 'pm+acpi-4.2-rc1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
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
Merging sparc/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (a076e6bfe7fe rocker: call correct unregister function o=
n error)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (60b93030b44a ALSA: pcm: Fix pcm_class sysf=
s output)
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
Merging staging.current/staging-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (f7ebc4dcdeb1 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (fe55dfdcdfab crypto: marvell/cesa - remove C=
OMPILE_TEST dependency)
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
Merging arc/for-next (5793e273a134 ARC: intc: split into ARCompact ISA spec=
ific, common bits)
Merging arm/for-next (9ce93bdda7b7 ARM: fix new BSYM() usage introduced via=
 for-arm-soc branch)
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
Merging arm-soc/for-next (d1e876fe0fb5 Merge branch 'next/fixes-v4.2' into =
for-next)
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
Merging mvebu/for-next (efeda1519ed0 Merge branch 'mvebu/dt' into mvebu/for=
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
Merging arm64/for-next/core (86dca36e6ba0 arm64: use private ratelimit stat=
e along with show_unhandled_signals)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (1e4d6e13d050 cris: don't use module_init for non-mod=
ular core eeprom.c code)
Merging h8300/h8300-next (07834743f42b h8300: fix typo.)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
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
Merging mips/mips-for-linux-next (939bc40371c1 Merge branch '4.1-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Makefile
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Kconfig
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/clk/Makefile
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
Merging s390/features (7fc611ff3ff1 s390/pci: improve handling of hotplug e=
vent 0x301)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (5316a64ce518 tile: avoid a "label not used" warning in=
 do_page_fault())
Merging uml/linux-next (6c684465587a um: Fix warning in setup_signal_stack_=
si())
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in uml/linux-next and mo=
dified in HEAD. Version HEAD of fs/hppfs/hppfs.c left in tree.
$ git rm -f fs/hppfs/hppfs.c
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (37b8d27de5d0 Btrfs: use received_uuid of parent during =
send)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (98eea9f84c69 [CIFS] add struct FILE_STANDARD_INFO)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (0d209259066c ext4: only call ext4_truncate when size <=3D=
 isize)
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
Merging f2fs/dev (3c4541452748 f2fs: do not trim preallocated blocks when t=
runcating after i_size)
Applying: f2fs: merge fix for follow_link changes
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (39b0f1e92908 GFS2: Don't brelse rgrp buffer_heads ev=
ery allocation)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (1372a3130a3e Merge branch 'bugfixes')
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
Merging vfs/for-next (d95dd586e26d make simple_positive() public)
Merging pci/next (207b074f82c6 Merge branches 'pci/host-xgene' and 'pci/hot=
plug' into next)
Merging hid/for-next (c0f37da04b5b Merge branch 'for-4.2/upstream' into for=
-next)
Merging i2c/i2c/for-next (cae30642c6f9 Merge branch 'i2c/for-4.2' into i2c/=
for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addre=
sses can be probed)
Merging dmi/master (bec755ee1080 firmware: dmi: struct dmi_header should be=
 packed)
Merging hwmon-staging/hwmon-next (761c1770f2bf hwmon: add driver for Microc=
hip TC74)
Merging v4l-dvb/master (ba5062b88d21 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (31d61069530b Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (fad6f9d58c07 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (d461003574eb Merge branch 'pm-cpuidle')
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
Merging slave-dma/next (bcff3811ada0 Merge branch 'for-linus' into next)
Merging net-next/master (0a51f76e3c3e Merge branch 'xgene-next')
CONFLICT (content): Merge conflict in net/packet/af_packet.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx4/ma=
in.c
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (40b503c76481 brcmfmac: make brcmf_p2p=
_detach() call conditional)
Merging bluetooth/master (a60ae64e017d mac802154: remove unused macro)
CONFLICT (content): Merge conflict in net/mac802154/llsec.c
Merging rdma/for-next (8e4349d13f33 IB/mad: Add final OPA MAD processing)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/verbs.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/sg=
e.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/chelsio/cxgb4/cx=
gb4_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx4/mad.c
Merging mtd/master (0eb8618bd075 mtd: docg3: Fix kasprintf() usage)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging l2-mtd/master (0eb8618bd075 mtd: docg3: Fix kasprintf() usage)
Merging crypto/master (7eac7144dd1e crypto: sahara - propagate the error on=
 clk_disable_unprepare() failure)
Merging drm/drm-next (9eb1e57f564d drm/dp/mst: take lock around looking up =
the branch device on hpd irq)
CONFLICT (content): Merge conflict in include/uapi/drm/radeon_drm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_kms.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer=
.c
Applying: of: fix a build error to f_graph_get_endpoint_by_regs function
Merging drm-panel/drm/panel/for-next (4946b0430c69 drm/panel: simple: Add b=
us format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (9044a81d1be6 drm/i915: Silence compiler w=
arning)
Merging drm-tegra/drm/tegra/for-next (8a8005e3e199 drm/tegra: dpaux: Regist=
ers are 32-bit)
Merging drm-misc/topic/drm-misc (fc39201734da drm/vgem: Set unique to "vgem=
")
Merging drm-exynos/exynos-drm/for-next (06c22857b6f0 ARM: dts: rename the c=
lock of MIPI DSI 'pll_clk' to 'sclk_mipi')
CONFLICT (content): Merge conflict in include/linux/of_graph.h
CONFLICT (content): Merge conflict in drivers/of/base.c
Merging drm-msm/msm-next (1a370be9ac51 drm/msm: restart queued submits afte=
r hang)
Merging sound/for-next (60b93030b44a ALSA: pcm: Fix pcm_class sysfs output)
Merging sound-asoc/for-next (53663fa44cbb Merge remote-tracking branch 'aso=
c/fix/mediatek' into asoc-linus)
Merging modules/modules-next (b51d23e4e9fe module: add per-module param_loc=
k)
CONFLICT (content): Merge conflict in include/linux/seqlock.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
$ git reset --hard HEAD^
Merging next-20150623 version of modules
CONFLICT (content): Merge conflict in include/linux/seqlock.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
[master fe8ba68f1383] next-20150623/modules
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
[master e0f9b908043c] next-20150623/modules
Merging input/next (cae705baa40b Input: xpad - re-send LED command on prese=
nt event)
Merging block/for-next (e63576bf0ba7 Merge branch 'for-4.2/drivers' into fo=
r-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/backing-dev.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
CONFLICT (content): Merge conflict in MAINTAINERS
Merging device-mapper/for-next (e262f3474152 dm stats: add support for requ=
est-based DM devices)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic whe=
n handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (a8c27c0bea45 mmc: queue: prevent soft lockups on PREEM=
PT=3Dn)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (53f1d5b6f311 md: clear Blocked flag on failed devices =
when array is read-only.)
Merging mfd/for-mfd-next (1abf25a25b86 mfd: lpc_ich: Assign subdevice ids a=
utomatically)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging backlight/for-backlight-next (cca0ba2df3d4 backlight: Change the re=
turn type of backlight_update_status() to int)
Merging battery/master (43df61051ab9 power_supply: Correct kerneldoc copy p=
aste errors)
Merging omap_dss2/for-next (f778dad38a54 Merge omapdss scaling fixes)
Merging regulator/for-next (733ada000f2c Merge remote-tracking branches 're=
gulator/topic/of', 'regulator/topic/pwm', 'regulator/topic/qcom' and 'regul=
ator/topic/soft-start' into regulator-next)
Merging security/next (b3bddffd35a0 Merge branch 'next' of git://git.kernel=
.org/pub/scm/linux/kernel/git/zohar/linux-integrity into next)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next an=
d modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (24fd03c87695 ima: update builtin policies)
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels =
on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (d968c299f469 watchdog: hpwdt: Add support for WDIO=
C_SETOPTIONS)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (5ffde2f67181 Merge branches 'arm/rockchip', 'arm/exynos=
', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'default-domains' and 'core' into nex=
t)
CONFLICT (content): Merge conflict in drivers/iommu/intel_irq_remapping.c
CONFLICT (content): Merge conflict in drivers/iommu/dmar.c
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
CONFLICT (content): Merge conflict in security/lsm_audit.c
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
Merging edac-amd/for-next (0bbbe4c4da5a EDAC: Update Documentation/edac.txt)
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/tile/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/apm/apm-storm.dtsi
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (b44754d8262d ring_buffer: Allow to exit the ring b=
uffer benchmark immediately)
Merging rcu/rcu/next (0868aa22167d Merge branches 'array.2015.05.27a', 'doc=
.2015.05.27a', 'fixes.2015.05.27a', 'hotplug.2015.05.27a', 'init.2015.05.27=
a', 'tiny.2015.05.27a' and 'torture.2015.05.27a' into HEAD)
Merging kvm/linux-next (f2ae45edbca7 KVM: s390: clear floating interrupt bi=
tmap and parameters)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/x86/kvm/lapic.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Applying: kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
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
Merging drivers-x86/for-next (5ee7041e5bc0 MAINTAINERS: Orphan x86 driver m=
si-wmi)
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
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUS=
Y too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_t=
imer)
Merging staging/staging-next (6c6f95a9351b Staging: rts5208: fix CHANGE_LIN=
K_STATE value)
CONFLICT (content): Merge conflict in tools/Makefile
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/klnds/o2i=
blnd/o2iblnd.c
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Applying: staging: disable the WILC1000 driver
Merging char-misc/char-misc-next (3dc196eae1db mei: me: wait for power gati=
ng exit confirmation)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
CONFLICT (content): Merge conflict in include/dt-bindings/mfd/arizona.h
Applying: power: axp288_charger: fix for API change
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name=
() function pointer of extcon_dev)
Merging kdbus/kdbus (b69af624a0d1 kdbus: optimize if statements in kdbus_co=
nn_disconnect())
Merging cgroup/for-next (8a0792ef8e01 cgroup: add delegation section to uni=
fied hierarchy documentation)
Merging scsi/for-next (c8806b6c9e82 snic: driver for Cisco SCSI HBA)
CONFLICT (content): Merge conflict in drivers/target/target_core_user.c
Merging target-updates/for-next (2ec1e9e20701 target: Bump core version to =
v5.0)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (daecdc66968f pinctrl: rockchip: add support for t=
he rk3368)
Merging vhost/linux-next (fa5f6add30c7 tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (8de3dbd0895b remoteproc: fix !CONFIG_OF build =
breakage)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (38e003f4b5dc gpio: Fix checkpatch.pl issues)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (361c1066c939 pwm: lpss: pci: Add support for Broxton =
platform)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (c97648cb2f34 mnt: Update fs_fully_visible to test =
for permanently empty directories)
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
Merging rtc/rtc-next (1cdbb4ff62e4 rtc: remove useless I2C dependencies)
CONFLICT (content): Merge conflict in drivers/rtc/Makefile
Merging init/init-v4.1-rc6 (bc3e452003d0 module: relocate module_init from =
init.h to module.h)
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and =
modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach=
-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Merging hwspinlock/for-next (b97cadee805e DT: hwspinlock: add the CSR atlas=
7 hwspinlock bindings document)
Merging nvdimm/libnvdimm-for-next (b8ec33b9c412 block: introduce an ->rw_by=
tes() block device operation)
CONFLICT (content): Merge conflict in drivers/block/Kconfig
Applying: drivers: net: xgene: fix for ACPI support without ACPI
Merging akpm-current/current (d74235fc3a7f scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
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
Merging akpm/master (43194f58c2b8 crypto: marvell/cesa - fix up for of_get_=
named_gen_pool() rename)

--Sig_/9LleK6FDzy0s9zMrS1kcrl1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJViml8AAoJEMDTa8Ir7ZwVZWAP/3Z77vzNJoyBJ47xFw+19G7+
dyMVglLZpuu0N81pviNLjJ4Tv7vv3HRAz+S/V1Z6vK9wiGM5M4HV/0EMNFfptgmU
uMWalgH6TX1nsvvEtnv2m0VaCoeBQ8Wer8DE3M6HJyrAy9fWqY0LZIVUiE/RW2wo
Taf6anpliAT+vXaf9CHQ7Jk30EC9kucsUh+Z6i34cFTogmQ9isujLTdXCvrd3sCd
6dVyBbz9LiQxXMMyqlgBPQvEDNUQk3XkcNJ0HPN26TeaiMpPUE8QgvTmCVhfNCQZ
fOsZmAmZvWGAbfcf09dozgc8Z1Hi14hYyc78ZrqtdNZmNHmzJoa5s9js+p5MFTMu
cWKAsLD+B1QS6u5CS9QcBcozMuMHhMlLqxrzKED2d4kaKBHGyREwSld2HU+fe5h1
QpfAE0qvLfq/PNDO3KaLgrm4gXeIf7HVvjbR+mei5frc5WX9gSStdWL2wi5Y4m3b
vZ+OucvhauGtr2oIieO2p7euzRZdJEe/HEPuFNqg69mehZDnfx9WzFZGjlUCE+Gd
Na3cbV3m565KB4Bk27BDMGjzyIaSgdXxTexdFUaEFG7a2ys5G8s3RrFvgR83Dwfk
xQyOpf2XJjKPsheCcHPhY9tFxHr0lBIzbxL3Y6Gz5O1IbmKYjB1go6Dzff9Xl2f3
/7qUPavtWEQkV4EG/z7j
=SZR9
-----END PGP SIGNATURE-----

--Sig_/9LleK6FDzy0s9zMrS1kcrl1--
