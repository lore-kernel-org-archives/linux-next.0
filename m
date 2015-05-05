From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 5
Date: Tue, 5 May 2015 14:53:28 +1000
Message-ID: <20150505145328.0d3192c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vcfCd_Ksc+3kb50Js6yoYLa"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57947 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751200AbbEEExh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2015 00:53:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/vcfCd_Ksc+3kb50Js6yoYLa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150504:

New tree: coresight

Non-merge commits (relative to Linus' tree): 1771
 1812 files changed, 92548 insertions(+), 38087 deletions(-)

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

I am currently merging 214 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (5ebe6afaf005 Linux 4.1-rc2)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (3b8786ff7a1b ARM: 8352/1: perf: Fix the pmu node=
 name in warning message)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (0aab3747091d powerpc/powernv: Restore non-=
volatile CRs after nap)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (acc455cffa75 sparc64: Setup sysfs to mark LDOM socket=
s, cores and threads correctly)
Merging net/master (b7ba7b469a4f Merge tag 'mac80211-for-davem-2015-05-04' =
of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging ipsec/master (bdddbf6996c0 xfrm: fix a race in xfrm_state_lookup_by=
spi)
Merging sound-current/for-linus (ec6bfca835b6 ALSA: hda/realtek - Fix typo =
for ALC286/ALC288)
Merging pci-current/for-linus (b787f68c36d4 Linux 4.1-rc1)
Merging wireless-drivers/master (f67382186489 ath9k: fix per-packet tx powe=
r configuration)
Merging driver-core.current/driver-core-linus (b787f68c36d4 Linux 4.1-rc1)
Merging tty.current/tty-linus (96a5d18bc133 serial: 8250_pci: Add support f=
or 16 port Exar boards)
Merging usb.current/usb-linus (0d3bba0287d4 cdc-acm: prevent infinite loop =
when parsing CDC headers.)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (82ee3aeb9295 USB: visor: Match I330 pho=
ne more precisely)
Merging staging.current/staging-linus (b787f68c36d4 Linux 4.1-rc1)
Merging char-misc.current/char-misc-linus (f26443a8ab76 Merge tag 'extcon-f=
ixes-for-4.1-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/=
extcon into char-misc-linus)
Merging input-current/for-linus (48853389f206 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (f440c4ee3e53 hwrng: bcm63xx - Fix driver com=
pilation)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (b787f68c36d4 Linux 4.1-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (5ebe6afaf005 Linux 4.1-rc2)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging arm/for-next (3b8786ff7a1b ARM: 8352/1: perf: Fix the pmu node name=
 in warning message)
Merging arm-perf/for-next/perf (b787f68c36d4 Linux 4.1-rc1)
Merging arm-soc/for-next (0f0175702e2e arm-soc: document merges)
CONFLICT (content): Merge conflict in drivers/bus/Makefile
CONFLICT (content): Merge conflict in MAINTAINERS
Merging at91/at91-next (da80a9f204eb Merge branch 'at91-4.2-dt' into at91-n=
ext)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (31fd7fe00b0d ARM: bcm2835: Drop the init_irq() ho=
ok)
Merging berlin/berlin/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (4df4d2a00e9c Merge branch 'imx/clk-move' into for=
-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (ae142bd99765 ARM: mvebu: Fix the main PLL frequency=
 on Armada 375, 38x and 39x SoCs)
Merging omap/for-next (e7309c2673a3 bus: omap_l3_noc: Fix master id address=
 decoding for OMAP5)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (572fe7d849ce Merge branches 'heads/fixes-for-v4.1', '=
heads/dt-for-v4.2' and 'heads/defconfig-for-v4.2' into next)
Merging samsung/for-next (5d5443b9c3ba Merge branch 'v4.1-next/mach-samsung=
' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/platsmp.c
Merging sunxi/sunxi/for-next (4ab66f83f824 Merge branch 'sunxi/defconfig-fo=
r-4.2' into sunxi/for-next)
Merging tegra/for-next (4bee32322bec Merge branch for-4.2/dt into for-next)
Merging arm64/for-next/core (6d1966dfd6e0 arm64: fix midr range for Cortex-=
A57 erratum 832075)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (d939b52abe0c cris: fix integer overflow in ELF_ET_DY=
N_BASE)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (62f269ef8191 pstore: Fix the ramoops module parameters u=
pdate)
Merging m68k/for-next (84a38337207f m68k: use for_each_sg())
Merging m68knommu/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (3e20a26b02bd Merge branch '4.0-fixes' int=
o mips-for-linux-next)
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (5fec97d0e3d9 parisc: copy_thread(): rename 'arg=
' argument to 'kthread_arg')
Merging powerpc-mpe/next (b787f68c36d4 Linux 4.1-rc1)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (6f469dae3aac zcrypt: fixed ap poll timer behavior)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (627ae54854ed tile: use READ_ONCE() in arch_spin_is_loc=
ked())
Merging uml/linux-next (fe205bdd1321 um: Print minimum physical memory requ=
irement)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (2ba9268dd603 Merge tag 'xtensa-for-next-20150413' =
of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (be4a8e38d68f Update negotiate protocol for SMB3.1 di=
alect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (3adc12e96482 udf: Update ctime and mtime when direct=
ory is modified)
Merging ext4/dev (2c869b262a10 ext4: fix growing of tiny filesystems)
Merging f2fs/dev (68def41a3fde f2fs: don not re-lookup nat cache with same =
nid)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (86fbca4923f9 GFS2: inode.c: indent with TABs, not sp=
aces)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (b787f68c36d4 Linux 4.1-rc1)
Merging nfsd/nfsd-next (72faedae8bc3 Documentation: remove overloads-avoide=
d counter from knfsd-stats.txt)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (502690674281 UBI: power cut emulation for testing)
Merging xfs/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (6d3b3d3367cb direct-io: only inc/dec inode->i_dio_cou=
nt for file systems)
Merging pci/next (b787f68c36d4 Linux 4.1-rc1)
Merging hid/for-next (daa19c2afa6d Merge branch 'for-4.2/wacom' into for-ne=
xt)
Merging i2c/i2c/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
Merging hwmon-staging/hwmon-next (a95d7600d9c4 hwmon: Update the location o=
f my quilt tree)
Merging v4l-dvb/master (e7f8fd8aa7f2 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (a1d375f9a7e3 Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (edfd02d0c2ad Merge branch 'for-4.1-fixes' into for=
-next)
Merging pm/linux-next (331ba19d80e2 Merge branch 'acpi-enumeration')
Merging idle/next (64887b6882de Merge branch 'for-linus-4.1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (b787f68c36d4 Linux 4.1-rc1)
Merging thermal-soc/next (488c7455d74c thermal: exynos: Add the support for=
 Exynos5433 TMU)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (428d96e91ee2 dmaengine: s3c24xx: Constify platform_=
device_id)
Merging net-next/master (fcba67c94abe net: fix two sparse warnings introduc=
ed by IGMP/MLD parsing exports)
Merging ipsec-next/master (dc0565ce6e34 xfrm: slightly optimise xfrm_input)
Merging wireless-drivers-next/master (73b25f66dcae Merge ath-next from ath.=
git)
Merging bluetooth/master (1add15646672 ieee802154: trace: fix endian conver=
tion)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging mtd/master (b787f68c36d4 Linux 4.1-rc1)
Merging l2-mtd/master (b787f68c36d4 Linux 4.1-rc1)
Merging crypto/master (09e217844a2e crypto: testmgr - Wrap the LHS in expre=
ssions of the form !x =3D=3D y)
Merging drm/drm-next (cec32a470106 media-bus: Fixup RGB444_1X12, RGB565_1X1=
6, and YUV8_1X24 media bus format)
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (dcdaab3ad151 drm/i915: Remove incorrect r=
estriction on 32bit offsets in ppGTT backend)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (337eb43c8d00 drm/qxl: Fix qxl_noop_get_vbl=
ank_counter())
Merging drm-exynos/exynos-drm/for-next (7b025c687af7 drm/exynos: mixer: Con=
stify platform_device_id)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (f526990738be ALSA:hda - reset display codec when po=
wer on)
Merging sound-asoc/for-next (723eb2c848c2 Merge remote-tracking branches 'a=
soc/topic/ssm2518', 'asoc/topic/ssm2602', 'asoc/topic/ssm4567' and 'asoc/to=
pic/tas751x' into asoc-next)
Merging modules/modules-next (4a3893d069b7 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging input/next (c9eeb5084b27 Input: lm8333 - fix broken email address)
Merging block/for-next (889fa31f00b2 blk-mq: reduce unnecessary software qu=
eue looping)
Merging device-mapper/for-next (aa6df8dd28c0 dm: fix free_rq_clone() NULL p=
ointer when requeueing unmapped request)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (184af16b0936 mmc: core: add missing pm event in mmc_pm=
_notify to fix hib restore)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (9ffc8f7cb964 md/raid5: don't do chunk aligned read on =
degraded array.)
Merging mfd/for-mfd-next (f4ed1f14b7c9 mfd: documentation: dt: max77686: Fi=
x typo)
Merging backlight/for-backlight-next (b1f85c0fec20 backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (b787f68c36d4 Linux 4.1-rc1)
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (6b857431b641 Merge remote-tracking branches 're=
gulator/topic/max77843' and 'regulator/topic/max8973' into regulator-next)
Merging security/next (b787f68c36d4 Linux 4.1-rc1)
Merging integrity/next (0ce8300ef0d4 KEYS: fix "ca_keys=3D" partial key mat=
ching)
Merging selinux/next (6a878464e21a signals: don't abuse __flush_signals() i=
n selinux_bprm_committed_creds())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (7f65ef01e131 Merge branches 'iommu/fixes', 'x86/vt-d', =
'x86/amd', 'arm/smmu', 'arm/tegra' and 'core' into next)
Merging dwmw2-iommu/master (03ecc32c5274 iommu/vt-d: support extended root =
and context entries)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (197175427a22 Documentation/memcg: update memcg/k=
mem status)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (39a8804455fb Linux 4.0)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (4760597116e3 scripts/dtc: Update to upstream versio=
n 9d3649bd3be245c9)
Merging mailbox/mailbox-for-next (ee23d66af921 mailbox: arm_mhu: add driver=
 for ARM MHU controller)
Merging spi/for-next (a53ba4726214 Merge remote-tracking branches 'spi/topi=
c/rspi', 'spi/topic/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/sirf' and 's=
pi/topic/spidev' into spi-next)
Merging tip/auto-latest (88256d924879 Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (7e52a03646af EDAC, altera: Do not build it as a =
module)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c4b00d27e405 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (7182f6825ff2 netfilter: Fix list_entry_rcu usage.)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (816c7667ea97 KVM: s390: migrate vcpu interrupt state)
Merging xen-tip/linux-next (0b97b03d88b4 xen/pci: Try harder to get PXM inf=
ormation for Xen)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (042f7df15a4f workqueue: Allow modifying low le=
vel unbound workqueue cpumask)
Merging drivers-x86/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (e6917c890d27 Merge remote-tracking branch 'regmap/=
topic/irq' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (a221e5c87ae2 Documentation: leds: Add description of=
 v4l2-flash sub-device)
Merging ipmi/for-next (d0acf734d886 ipmi_ssif: Use interruptible completion=
 for waiting in the thread)
Merging driver-core/driver-core-next (b787f68c36d4 Linux 4.1-rc1)
Merging tty/tty-next (b787f68c36d4 Linux 4.1-rc1)
Merging usb/usb-next (b787f68c36d4 Linux 4.1-rc1)
Merging usb-gadget/next (b787f68c36d4 Linux 4.1-rc1)
Merging usb-serial/usb-next (b787f68c36d4 Linux 4.1-rc1)
Merging staging/staging-next (fd5e2fd053e1 staging: lustre: llite: fix ifnu=
llfree.cocci warnings)
Merging char-misc/char-misc-next (b787f68c36d4 Linux 4.1-rc1)
Merging extcon/extcon-next (2bfc82f84b2d extcon: adc-jack: Remove the unnee=
ded num_cables field)
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (d0f702e648dc cgroup: fix some comment typos)
Merging scsi/for-next (118c855b5623 3w-9xxx: fix command completion race)
Merging target-updates/for-next (cce0b8f8b7cf target: target_core_configfs.=
h is not needed in fabric drivers)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging vhost/linux-next (f4aaa799cf9a tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (03daa6f82f2b Revert "gpio: sch: use uapi/linux/pci_i=
ds.h directly")
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (c264f1110d27 pwm: Remove __init initializer for pwm_a=
dd_table())
Merging dma-buf/for-next (5ebe6afaf005 Linux 4.1-rc2)
Merging userns/for-next (e0c9c0afd2fc mnt: Update detach_mounts to leave mo=
unts connected)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (c02f699e22fa Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (b787f68c36d4 Linux 4.1-rc1)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (fd683e86d17e Merge branch 'for-4.2/kaslr' in=
to for-next)
Merging coresight/next (48582dcacc6b coresight: fix typo in of_coresight.c)
Merging akpm-current/current (ca1572c6e189 mm: meminit: Reduce number of ti=
mes pageblocks are set during struct page init -fix)
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (3ecbc6396a86 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/vcfCd_Ksc+3kb50Js6yoYLa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSEzOAAoJEMDTa8Ir7ZwVtwwP/17D+72fjsf6qIiFBDCZCAhS
dFRg3RVEM9RjD/HQMnTQTZjcMVggBBmHNpwf7sFjuVto0okjLOOWos4oq71OuDJB
4xcjbL/4u/7VtQoFSADOiHSj4Ngw1r97RLd2T+2wgec7dPCO1Igpq4xN9LZI5XHR
uaUwx67ymMLaEt6Vhs21tV8tEMETaALmzuzCasK2n6On7WfNOKcOWBTpPQJI1d+Y
wuFeCItAT8BU2wRK7tN+epjLC6O3EuZ7RHbUyKb4xwxE0hCvwXlAYIC4o54ET7Z2
SCXWTSoYKPshuZawirc4qZKEEZRYuteBAa9Hg3ZR6gfDqfbL9QzYEB0flSyxmRnM
L+DD6fNnzbJNQeaqRglA+F0kwh6oQg9Hq9WpyPeqcOM656STZ2qZvx3zCBggaXAd
a/gNDq71CwlaOkoHM2TMBjKGIZ8+GO4D34SoeNdNzaWe5q/JjpB9IwFJlN0IoMP6
4ZyoDwDQq4o/gxhXZ8wUeEVx3XRN+QMgfdBJHDDgKRUKgFY7S1qs2Qwv0/esQ1bm
7wcvEUhwYnDOi3hZHO7WJ5jteQ9F/gNnki6FV0BdcrCIhpDGtX9HhSNPgLkEptrq
+e72hJ6BGQoHBLZ5s8Le4RTo9HHMnVQiKNo8AybISOi5noNJYGoMQjScMKHNLDCO
YKCUdhfiCzM4WVl2HB2v
=E+Br
-----END PGP SIGNATURE-----

--Sig_/vcfCd_Ksc+3kb50Js6yoYLa--
