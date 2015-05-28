From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 28
Date: Thu, 28 May 2015 22:56:29 +1000
Message-ID: <20150528225629.1dcc82a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1t1z9aU7KKzbj+SsrtJnSEA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37789 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753417AbbE1M4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 08:56:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/1t1z9aU7KKzbj+SsrtJnSEA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150527:

New tree: rdma

The pci-current tree gained a conflict aginst Linus' tree.

The rr-fixes tree gained a build failure so I used the version from
next-20150527.

The wireless-drivers-next tree still had its build failure so I applied
a supplied patch.

The backlight tree lost its build failure.

The tip tree gained a conflict against the sparc tree.

The rcu tree gained conflicts against the modules and tip trees.

The usb-gadget tree gained a conflict against the usb.current tree.

The char-misc tree still had its build failure so I used a supplied patch.

The extcon tree gained a conflict against the mfd tree.

The crypto tree gained a build failure for which I reverted a commit.

Non-merge commits (relative to Linus' tree): 6620
 5813 files changed, 335964 insertions(+), 136199 deletions(-)

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

I am currently merging 218 trees (counting Linus' and 31 trees of patches
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
Merging origin/master (de182468d1bb Merge branch 'for-next' of git://git.sa=
mba.org/sfrench/cifs-2.6)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (1b97937246d8 ARM: fix missing syscall trace exit)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (5e95235ccd54 powerpc: Align TOC to 256 byt=
es)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (acc455cffa75 sparc64: Setup sysfs to mark LDOM socket=
s, cores and threads correctly)
Merging net/master (9302d7bb0c5c sctp: Fix mangled IPv4 addresses on a IPv6=
 listening socket)
Merging ipsec/master (407d34ef2947 xfrm: Always zero high-order sequence nu=
mber bits)
Merging sound-current/for-linus (c545f799c747 ALSA: hda - Disable power_sav=
e_node for IDT92HD71bxx)
Merging pci-current/for-linus (a6b65983dabc PCI: Fix IOV resource sorting b=
y alignment requirement)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging wireless-drivers/master (aefa441b1502 Merge tag 'iwlwifi-for-kalle-=
2015-05-21' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (194ec9368c0d drivers: of/bas=
e: move of_init to driver_init)
Merging tty.current/tty-linus (da555db6b063 n_tty: Fix calculation of size =
in canon_copy_from_read_buf)
Merging usb.current/usb-linus (13557b5d8477 Merge tag 'fixes-for-v4.1-rc5' =
of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (1df5b888f540 USB: serial: ftdi_sio: Add=
 support for a Motion Tracker Development Board)
Merging staging.current/staging-linus (a8acb4d33d47 Merge tag 'iio-fixes-fo=
r-4.1b' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-linus)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (77b071e7931d Input: smtpe-ts - wait 50mS u=
ntil polling for pen-up)
Merging crypto-current/master (f858c7bcca8c crypto: algif_aead - Disable AE=
AD user-space for now)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (8829fd02186d cpumask_set_cpu_local_first =3D> cpuma=
sk_local_spread, lament)
$ git reset --hard HEAD^
Merging next-20150527 version of rr-fixes
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: H=
andle EPROBE_DEFER while requesting the PWM)
Merging drm-intel-fixes/for-linux-next-fixes (ba155e2d21f6 Linux 4.1-rc5)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (e6cd8deb08e9 ARC: explicit'ify uboot support)
Merging arm/for-next (402d170ecb89 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (b787f68c36d4 Linux 4.1-rc1)
Merging arm-soc/for-next (ea590202213b arm-soc: document merges)
Merging at91/at91-next (8720dbd585f2 Merge tag 'at91-dt3' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' an=
d 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (7f8ad9c26be9 Merge branch 'berlin/simple-mf=
d' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (eb193d2bf19f Merge branch 'imx/defconfig' into fo=
r-next)
CONFLICT (content): Merge conflict in arch/arm/mach-imx/Kconfig
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (4c7675d00ca9 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (f044523a11ca Merge branch 'omap-for-v4.2/dt' into fo=
r-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (5c78bc1b4667 Merge branch 'samsung-defconfig-2nd'=
 into for-next)
Merging sunxi/sunxi/for-next (b2c3cb3cd658 Merge branches 'sunxi/core-for-4=
.2' and 'sunxi/dt-for-4.2' into sunxi/for-next)
Merging tegra/for-next (44bc5c1cf4c1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (05981277a4de arm64: Use common outgoing-CPU-no=
tification code)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (45f49276cd8a CRISv32: allow CONFIG_DEBUG_BUGVERBOSE)
Merging h8300/h8300-next (f9f46b624bf3 Merge branch 'master' into h8300-nex=
t)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (078550569eaf ramoops: make it possible to change mem_typ=
e param.)
Merging m68k/for-next (2b8520f1f256 m68k: Use for_each_sg())
Merging m68knommu/for-next (ba155e2d21f6 Linux 4.1-rc5)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (a11f54e209ec Merge branch '4.1-fixes' int=
o mips-for-linux-next)
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (c52c8ec5c703 powerpc/powernv: Move dma_set_mask()=
 from pnv_phb to pci_controller_ops)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (7c53fcb39fdd s390/dasd: Enable automatic loading of =
dasd_diag_mod)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (47ad7b9bbeaa tile: improve stack backtrace)
Merging uml/linux-next (fe205bdd1321 um: Print minimum physical memory requ=
irement)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (ba155e2d21f6 Linux 4.1-rc5)
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (4afe260bab50 CIFS: Fix race condition on RFC1002_NEG=
ATIVE_SESSION_RESPONSE)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (792352cb160e udf: fix udf_load_pvoldesc())
Merging ext4/dev (bee5863ea1b4 ext4 crypto: require CONFIG_CRYPTO_CTR if ex=
t4 encryption is enabled)
Merging f2fs/dev (af9f9b745b8c f2fs crypto: preallocate BIO_MAX_PAGES for w=
riteback)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (b2ad14a37387 fuse: separate pqueue for clones)
Merging gfs2/for-next (a3e3213676d8 gfs2: fix shadow warning in gfs2_rbm_fi=
nd())
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (feaff8e5b2cf nfs: take extra reference to fl->fl_fi=
le when running a setlk)
Merging nfsd/nfsd-next (fcc47efd5695 nfsd: Remove dead declarations)
Merging overlayfs/overlayfs-next (cc6f67bcafcb ovl: mount read-only if work=
dir can't be created)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushe=
s)
Merging xfs/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (b853a16176cf turn user_{path_at,path,lpath,path_dir}(=
) into static inlines)
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
Applying: f2fs: merge fix for follow_link changes
Merging pci/next (9b08ae0dde00 Merge branch 'pci/msi' into next)
Merging hid/for-next (8ff7efa2288c Merge branch 'for-4.2/upstream' into for=
-next)
Merging i2c/i2c/for-next (f6505fbabc42 i2c: add SLIMpro I2C device driver o=
n APM X-Gene platform)
Merging jdelvare-hwmon/master (3cc49e580f0f hwmon: (w83792d) Additional PWM=
 outputs support)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
CONFLICT (content): Merge conflict in drivers/firmware/dmi_scan.c
Merging hwmon-staging/hwmon-next (be89ea825123 hwmon: Allow compile test of=
 GPIO consumers if !GPIOLIB)
Merging v4l-dvb/master (e7f8fd8aa7f2 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (653ac63df358 Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (e5802d2554ff Merge branch 'for-4.1-fixes' into for=
-next)
Merging pm/linux-next (701401b85342 Merge branch 'pnp' into linux-next)
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
Merging slave-dma/next (a847a6d25f6d Merge branch 'topic/pxa' into next)
Merging net-next/master (ed2dfd900992 tcp/dccp: warn user for preferred ip_=
local_port_range)
CONFLICT (content): Merge conflict in drivers/net/wireless/iwlwifi/Kconfig
CONFLICT (modify/delete): drivers/net/phy/amd-xgbe-phy.c deleted in net-nex=
t/master and modified in HEAD. Version HEAD of drivers/net/phy/amd-xgbe-phy=
.c left in tree.
$ git rm -f drivers/net/phy/amd-xgbe-phy.c
Merging ipsec-next/master (8faf491e6420 xfrm: optimise to search the inexac=
t policy list)
Merging wireless-drivers-next/master (f3550aeb7fcd brcmfmac: add support fo=
r dma indices feature)
Applying: brcmfmac: fix invalid access to struct acpi_device fields
Merging bluetooth/master (b5a61c306b0d atusb: add support for at86rf230)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging rdma/for-next (175e8efe6997 Merge branches 'bart-srp', 'generic-err=
ors', 'ira-cleanups' and 'mwang-v8' into k.o/for-4.2)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (636fdbf88efe mtd: cfi_cmdset_0002: Initialize datum =
before calling map_word_load_partial)
Merging crypto/master (d725332208ef crypto: ccp - Remove unused structure f=
ield)
Merging drm/drm-next (c6e7e4bb7ff9 Merge branch 'drm/next/adv7511' of git:/=
/linuxtv.org/pinchartl/fbdev into drm-next)
Merging drm-panel/drm/panel/for-next (dd0150026901 drm/panel: simple: Add s=
upport for LG LB070WV8 800x480 7" panel)
Merging drm-intel/for-linux-next (99c044d7d5cc drm/i915/dsi: remove non-op =
hot plug callback)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (5ceecb2fa720 drm: Fix off-by-one in vblank=
 hardware counter wraparound handling)
Merging drm-exynos/exynos-drm/for-next (9aeb8acbf0a2 drm/exynos: dp: Lower =
level of EDID read success message)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (cd6a65036f0e ALSA: replace CONFIG_PROC_FS with CONF=
IG_SND_PROC_FS)
Merging sound-asoc/for-next (ebd5c5adfb88 Merge remote-tracking branches 'a=
soc/topic/wm8741', 'asoc/topic/wm8960', 'asoc/topic/wm8994' and 'asoc/topic=
/wm8996' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs fo=
r sig_enforce declaration)
Merging input/next (e002273b3782 Input: synaptics_i2c - use proper boolean =
values)
Merging block/for-next (cca58e6fe213 Merge branch 'for-4.2/core' into for-n=
ext)
Merging device-mapper/for-next (a3554ba000da dm thin: range discard support)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (26225be7aef4 mmc: sdhci-pci: Enable HS400 for some Int=
el host controllers)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (181effb6da11 md/raid5: break stripe-batches when the a=
rray has failed.)
Merging mfd/for-mfd-next (79a1726fd29c mfd: mt6397-core: Add GPIO sub-modul=
e support)
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simpl=
ify usage of devm_gpiod_get_optional)
Merging battery/master (843735b788a4 power: axp288_charger: axp288 charger =
driver)
Merging omap_dss2/for-next (36520841a443 video/console: use swap() in newpo=
rt_bmove())
Merging regulator/for-next (f114db4aa4da Merge remote-tracking branches 're=
gulator/topic/max8973' and 'regulator/topic/of' into regulator-next)
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
Merging watchdog/master (ba155e2d21f6 Linux 4.1-rc5)
Merging iommu/next (60dcc6f0bcf4 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/exynos' and 'core' into next)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (bde1b29420d7 stable: Update documentation to cla=
rify preferred procedure)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negati=
ve/)
Merging audit/next (39a8804455fb Linux 4.0)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (4760597116e3 scripts/dtc: Update to upstream versio=
n 9d3649bd3be245c9)
Merging mailbox/mailbox-for-next (4c0f74bf82e8 mailbox: Enable BCM2835 mail=
box support)
Merging spi/for-next (3f6d0d8e2000 Merge remote-tracking branches 'spi/topi=
c/sh-msiof', 'spi/topic/sirf' and 'spi/topic/spidev' into spi-next)
Merging tip/auto-latest (a079e986132b manual merge of x86/ras)
CONFLICT (content): Merge conflict in arch/sparc/include/asm/topology_64.h
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevent=
s/4.2' into clockevents/next)
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (30c7469ba6f5 MAINTAINERS: Change Johannes Thumsh=
irn's email address)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (d0ee8f4a1f5f tracing: Rename ftrace_get_offsets_##=
call() to trace_event_get_offsets_##call())
Merging rcu/rcu/next (d254f32b7c03 rcu: Deinline rcu_read_lock_sched_held()=
 if DEBUG_LOCK_ALLOC)
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
CONFLICT (content): Merge conflict in include/linux/rcutree.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
Merging kvm/linux-next (3520469d65f2 KVM: export __gfn_to_pfn_memslot, drop=
 gfn_to_pfn_async)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (06b36753a646 KVM: s390: drop handling of interception=
 code 12)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (5b7fedea8db6 kernel:workqueue - Fix typos in c=
omments.)
Merging drivers-x86/for-next (61104aa44529 dell-laptop: Use dell-rbtn inste=
ad i8042 filter when possible)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (67f2271e4cea Merge remote-tracking branches 'regma=
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
Merging usb/usb-next (2cfef79ddce4 cdc-acm: use swap() in acm_probe())
Merging usb-gadget/next (94a715ed5c57 usb: gadget: atmel: fix build warning=
s)
CONFLICT (content): Merge conflict in drivers/usb/musb/musb_core.c
Merging usb-serial/usb-next (e26081808eda Linux 4.1-rc4)
Merging staging/staging-next (f1a9983002cd staging: wilc1000: Include linux=
/gpio.h instead of asm/gpio.h)
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Merging char-misc/char-misc-next (039ae58503f3 hwmon: Allow to compile dell=
-smm-hwmon driver without /proc/i8k)
Applying: mei: fix up uuid matching
Merging extcon/extcon-next (046050f6e623 extcon: Update the prototype of ex=
tcon_register_notifier() with enum extcon)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
CONFLICT (content): Merge conflict in include/dt-bindings/mfd/arizona.h
Applying: power: axp288_charger: fix for AIP change
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (b5ba75b5fc0e cgroup: simplify threadgroup locking)
Merging scsi/for-next (d56dfb41f535 be2iscsi : Bump the driver version)
Merging target-updates/for-next (9cfc3ea41c4f loopback: Enable TFO->complet=
e_irq for fast-path ->scsi_done)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (bb1b6503dff1 Merge branch 'devel' into for-next)
Merging vhost/linux-next (f4aaa799cf9a tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (1ab4363bd9fb Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (cccb94543c82 pwm: samsung: Use MODULE_DEVICE_TABLE() =
to include OF modalias)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (14d419c079ab mnt: Update fs_fully_visible to test =
for permanently empty directories)
CONFLICT (content): Merge conflict in fs/libfs.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (5343325ff3dd clk: socfpga: add a clock driver for the=
 Arria 10 platform)
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
Merging livepatching/for-next (bc1cdfd17466 Merge branch 'for-4.2/upstream'=
 into for-next)
Merging coresight/next (486ea46dfc88 coresight-etm3x: Add Qualcomm PTM v1.1=
 peripheral ID)
CONFLICT (content): Merge conflict in drivers/hwtracing/coresight/coresight=
-etm3x.c
Merging rtc/rtc-next (f1644dff27ab rtc: rtc-v3020: use gpio_request_array())
[master c58f9783447d] Revert "crypto: jitterentropy - add jitterentropy RNG"
Applying: try putting the include of vmalloc.h back into inet_hashtables.h
Merging akpm-current/current (2201268393aa scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/x86/kvm/mmu.c: work around gcc-4.4.4 bug
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
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (a8d618f47f32 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/1t1z9aU7KKzbj+SsrtJnSEA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZxCDAAoJEMDTa8Ir7ZwVkkwP/1l2NMfxwfexBzM15C+wenSc
m/CZ6XkItp/D93EE86JZ9qGlkmEQyg6DToTRzXw5o/endinrps74w/YjE/TVW8cv
ELnP+8scRmosLEx226G33cYpDtMnMjvmlkIXxH50Pq/L3VRkgsHKD3yju/0q4RTV
bL3CTJQBZFTAHz4qGbf7HqVai9QR4Wcq7kUT4sK21+XTmmT8Jtlym/7DNbLkDm8R
VBEp2oEai8QU+zXIRlyJ6I6FZ6bNROeHNwKv51rFco8muc5WsgDU72t/CziVzuRk
fXmMfHoJOHLhJkOHlVdcQAYQMQQaZcOn+x1SiTnebjV9OyeLybti6gZrgNB/fahU
wQOabqctoGofDCJgMkTOnvIxvY8p2vMLfohNzxhDEpAdwugap4nEZo3aMrbS9n9X
ce/CtJ5z56ZIVZGp0y1vL0x25uYVjDcIzTenqyLofRuT9tFpANbdcRFppLsRt2Nz
p2wC6XvzOiZZPlGNB3jp7FlXYcV7ZQHtMocsfVZplpbpuNzkqGKVD8CQwuYCUrUp
KOWk4m+ZpsGdVLvdubb3v2/mOysGBlpEV0TxIvNmbg5cWifnwYpsckXYyFqyqU4D
WjLs7TIpycpC5D2hiOAp3H3B9LlojMuPyXasm5zGSXMZwie16ZxLvQr3HlskH4A7
Ciesz7aXL3+xOYEjbNCM
=8djv
-----END PGP SIGNATURE-----

--Sig_/1t1z9aU7KKzbj+SsrtJnSEA--
