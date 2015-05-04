From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 4
Date: Mon, 4 May 2015 13:08:53 +1000
Message-ID: <20150504130853.24440b4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CB8/oH6eGVx=UhhL72njxPm"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52297 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751417AbbEDDJC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 May 2015 23:09:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/CB8/oH6eGVx=UhhL72njxPm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150501:

Removed tree: virtio (maintainer moved on)

The akpm-current tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1436
 1426 files changed, 81272 insertions(+), 32795 deletions(-)

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

I am currently merging 213 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (61f06db00e06 Merge tag 'scsi-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
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
Merging net/master (6c3c1eb3c35e Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging ipsec/master (bdddbf6996c0 xfrm: fix a race in xfrm_state_lookup_by=
spi)
Merging sound-current/for-linus (88776f366ede ALSA: hda - Add headphone qui=
rk for Lifebook E752)
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
Merging crypto-current/master (8c98ebd7a6ff crypto: img-hash - CRYPTO_DEV_I=
MGTEC_HASH should depend on HAS_DMA)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (82a0eaab980a vfio-pci: Log device requests mo=
re verbosely)
Merging kselftest-fixes/fixes (b787f68c36d4 Linux 4.1-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (a04f90a33fab drm/i915/chv: Im=
plement WaDisableShadowRegForCpd)
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
Merging omap/for-next (23aa6c6f4bed Merge branch 'omap-for-v4.0/fixes' into=
 for-next)
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
Merging tegra/for-next (3a3027f71204 Merge branch for-4.2/dt into for-next)
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
Merging m68k/for-next (b24f670b7f5b m68k/mac: Fix out-of-bounds array index=
 in OSS IRQ source initialization)
Merging m68knommu/for-next (b787f68c36d4 Linux 4.1-rc1)
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
Merging nfsd/nfsd-next (91d6fe247934 nfsd: skip CB_NULL probes for 4.1 or l=
ater)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (502690674281 UBI: power cut emulation for testing)
Merging xfs/for-next (542c311813d5 Merge branch 'xfs-dio-extend-fix' into f=
or-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (6d3b3d3367cb direct-io: only inc/dec inode->i_dio_cou=
nt for file systems)
Merging pci/next (b787f68c36d4 Linux 4.1-rc1)
Merging hid/for-next (28c1798485a3 Merge branch 'for-4.2/wacom' into for-ne=
xt)
Merging i2c/i2c/for-next (b787f68c36d4 Linux 4.1-rc1)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
Merging hwmon-staging/hwmon-next (a95d7600d9c4 hwmon: Update the location o=
f my quilt tree)
Merging v4l-dvb/master (bfb4e26f2532 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (a1d375f9a7e3 Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (3e6f0ab1313e Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (55737960ba15 Merge branch 'acpi-resources' into linu=
x-next)
Merging idle/next (64887b6882de Merge branch 'for-linus-4.1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (b787f68c36d4 Linux 4.1-rc1)
Merging thermal-soc/next (62d0817a0aca Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (63f89caad0e3 dmaengine: increment privatecnt when u=
sing dma_get_any_slave_channel)
Merging net-next/master (4749c3ef854e net: sched: remove TC_MUNGED bits)
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
Merging drm-intel/for-linux-next (75d04a3773ec drm/i915/gtt: Allocate va ra=
nge only if vma is not bound)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (a3c6d686443e DRM: Don't re-poll connector =
for disconnect)
Merging drm-exynos/exynos-drm/for-next (3cf711584d3e drm/exynos: Fix FIMD b=
uffer size calculation)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (bd5b2d440745 Merge branch 'topic/jack' into for-nex=
t)
Merging sound-asoc/for-next (bd715f24b7f6 Merge remote-tracking branches 'a=
soc/topic/rt5677', 'asoc/topic/samsung' and 'asoc/topic/sgtl5000' into asoc=
-next)
Merging modules/modules-next (4a3893d069b7 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging input/next (c9eeb5084b27 Input: lm8333 - fix broken email address)
Merging block/for-next (889fa31f00b2 blk-mq: reduce unnecessary software qu=
eue looping)
Merging device-mapper/for-next (aa6df8dd28c0 dm: fix free_rq_clone() NULL p=
ointer when requeueing unmapped request)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (e3207ccf7de3 mmc: core: add missing pm event in mmc_pm=
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
Merging regulator/for-next (0fd1e0101493 Merge remote-tracking branches 're=
gulator/topic/max77843' and 'regulator/topic/max8973' into regulator-next)
Merging security/next (b787f68c36d4 Linux 4.1-rc1)
Merging integrity/next (0ce8300ef0d4 KEYS: fix "ca_keys=3D" partial key mat=
ching)
Merging selinux/next (cf7b6c0205f1 selinux: increase avtab max buckets)
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
Merging spi/for-next (5248e646ceb8 Merge remote-tracking branches 'spi/topi=
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
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c4b00d27e405 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (7182f6825ff2 netfilter: Fix list_entry_rcu usage.)
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
Merging kvm/linux-next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-arm/next (fd1d0ddf2ae9 KVM: arm/arm64: check IRQ number on user=
land injection)
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
Merging regmap/for-next (77f5f3e9c86d regmap: Constify irq_domain_ops)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (78a435c5a484 leds: add BCM6328 LED driver)
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
Merging extcon/extcon-next (c9ca95d470be extcon: arizona: Apply HP clamps c=
orrectly for WM8280)
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (d0f702e648dc cgroup: fix some comment typos)
Merging scsi/for-next (118c855b5623 3w-9xxx: fix command completion race)
Merging target-updates/for-next (bc018a971392 target: Remove set-but-not-us=
ed-variables)
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
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (c264f1110d27 pwm: Remove __init initializer for pwm_a=
dd_table())
Merging dma-buf/for-next (72449cb47b01 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
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
Merging akpm-current/current (ca1572c6e189 mm: meminit: Reduce number of ti=
mes pageblocks are set during struct page init -fix)
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (105b72ac333d drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/CB8/oH6eGVx=UhhL72njxPm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVRuLKAAoJEMDTa8Ir7ZwV20EP/3+ddQiSKWGc2JJnM4dNOaV3
aKxylMqAOCyqSIPCwKkjG79MHoyiTPbQZGbo+qUVMjwswYzzYgfXiBuPR7dXzHun
HBgx8oC1I05/Eb2dUDWZj4nf8Oz6mxatBNfUvPKsypAHOH4Sy+B4WuOcvNNuavs0
CDK8zGCOGX30vJccYivtYbKPIeo5Y58n/gyLTTv3MRDQzHGX9pQATu03RSEWRy/I
VPILIkm9rTr5opl6cTkEP/K6mqHk6dlmmWP4gHP8TEYO6WY7HnldlSEibRcpjtw+
Z4IoshKBYLxPtBE7vbk0a9oWVaJmGXsN6QdivgdiSJTIC8AlnskWh2UnAtw+i+A3
NiosGTI5RvUqPKgFou4uWjgi4dd4AUpmUJLkTJbU4DvpOdF2lNFSxBh2qMYDZJWv
OCGcBG0fCzM/J8V2lJ8OVGQBaYbKs1VXXocRziuRw28aohCd8GLSb2LupamDisTF
ec+8qAg7fNzs7OJq9LEo4Eg9ze4lQqms8ByRTqk/tN/Al5ZnowK9jdE5JGGbsp7M
ATqeoF6oJBFni69xuTWtTtDUeB9UvA9EGCOkjm3/uH+fq6r2LHRHu4Lj5Kxw0NZr
5/TVye2HBS0WoUmxcQHBhDwIT4cvSo10aB/W+c7fi43AfLsLDCww/pmk4KY3bJjm
MFDcfq9yD4bXq98u2KLn
=rwPu
-----END PGP SIGNATURE-----

--Sig_/CB8/oH6eGVx=UhhL72njxPm--
