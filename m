From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 20
Date: Wed, 20 May 2015 18:14:15 +1000
Message-ID: <20150520181415.1650d946@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vn9Irwth4jgC_KC9Z=7Kab_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/vn9Irwth4jgC_KC9Z=7Kab_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150519:

The at91 tree gained a conflict against the arm-soc tree.

The samsung tree gained conflicts against the arm-soc and at91 trees.

The sunxi tree gained a conflict against the samsung tree.

The drm tree gained a build failure, so I used the version from
next-20150519.

Non-merge commits (relative to Linus' tree): 4950
 4429 files changed, 227552 insertions(+), 107140 deletions(-)

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

I am currently merging 216 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (1113cdfe7d2c Merge tag 'nfs-for-4.1-2' of git://git.=
linux-nfs.org/projects/trondmy/linux-nfs)
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
Merging net/master (892bd6291ac1 Merge tag 'mac80211-for-davem-2015-05-19' =
of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging ipsec/master (6d7258ca9370 esp6: Use high-order sequence number bit=
s for IV generation)
Merging sound-current/for-linus (fa94b0d72511 ALSA: usb-audio: Add quirk fo=
r MS LifeCam Studio)
Merging pci-current/for-linus (5ebe6afaf005 Linux 4.1-rc2)
Merging wireless-drivers/master (f67382186489 ath9k: fix per-packet tx powe=
r configuration)
Merging driver-core.current/driver-core-linus (e26081808eda Linux 4.1-rc4)
Merging tty.current/tty-linus (e26081808eda Linux 4.1-rc4)
Merging usb.current/usb-linus (e26081808eda Linux 4.1-rc4)
Merging usb-gadget-fixes/fixes (c94e289f195e usb: gadget: remove incorrect =
__init/__exit annotations)
Merging usb-serial-fixes/usb-linus (e26081808eda Linux 4.1-rc4)
Merging staging.current/staging-linus (e26081808eda Linux 4.1-rc4)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (3c0213d17a09 Input: elantech - fix semi-mt=
 protocol for v3 HW)
Merging crypto-current/master (7b2a18e05feb crypto: algif_aead - fix invali=
d sgl linking)
Merging ide/master (d681f1166919 ide: remove deprecated use of pci api)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (db7d4d7f4021 vfio: Fix runaway interruptible =
timeout)
Merging kselftest-fixes/fixes (e9886ace222e selftests, x86: Rework x86 targ=
et architecture detection)
Merging drm-intel-fixes/for-linux-next-fixes (54da691deb12 drm/i915: fix sc=
reen flickering)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (4a8a224570ad ARC: inline cache flush toggle helpers)
Merging arm/for-next (402d170ecb89 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (b787f68c36d4 Linux 4.1-rc1)
Merging arm-soc/for-next (c458f9171166 ARM: hisi: revert changes from hisi/=
hip04-dt branch)
Merging at91/at91-next (6d5c29b3994d Merge tag 'at91-dt2' into at91-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (50b674b89355 Merge branches 'for-rpi-next-soc' an=
d 'for-rpi-next-dt' into for-rpi-next)
Merging berlin/berlin/for-next (7f8ad9c26be9 Merge branch 'berlin/simple-mf=
d' into berlin/for-next)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (ccddd1f6adb1 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
Merging mvebu/for-next (689bc92a6492 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (8be7646999c7 Merge tag 'omap-for-v4.1/fixes-rc2' int=
o for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (19ab3cd76fc9 Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (f839a8773746 Merge branch 'samsung-defconfig' int=
o for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging sunxi/sunxi/for-next (a426b3379698 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging tegra/for-next (a4b484d8d187 Merge branch for-4.2/fuse into for-nex=
t)
Merging arm64/for-next/core (5b09a094f2fb arm64: perf: Fix callchain parse =
error with kernel tracepoint events)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (45f49276cd8a CRISv32: allow CONFIG_DEBUG_BUGVERBOSE)
Merging h8300/h8300-next (7c2b998ca350 Merge branch 'master' into h8300-nex=
t)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (62f269ef8191 pstore: Fix the ramoops module parameters u=
pdate)
Merging m68k/for-next (2b8520f1f256 m68k: Use for_each_sg())
Merging m68knommu/for-next (e26081808eda Linux 4.1-rc4)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (4e01f664d8a6 MIPS: cpu: Convert MIPS_CPU_=
* defs to (1ull << x))
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (38c048877098 powerpc/powernv: Silence SYSPARAM wa=
rning on boot)
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
Merging xtensa/for_next (06a631433460 xtensa: Provide dummy dma_alloc_attrs=
() and dma_free_attrs())
Merging btrfs/next (e082f56313f3 btrfs: quota: Update quota tree after qgro=
up relationship change.)
Merging ceph/master (84b54fefaa05 libceph: announce support for straw2 buck=
ets)
Merging cifs/for-next (bc8ebdc4f54c Fix that several functions handle incor=
rect value of mapchars)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (942d702e7196 udf: remove double err declaration in u=
df_file_write_iter())
Merging ext4/dev (bee5863ea1b4 ext4 crypto: require CONFIG_CRYPTO_CTR if ex=
t4 encryption is enabled)
Merging f2fs/dev (862d51324c8e f2fs crypto: add rwsem to avoid data races)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (d2c0616b0572 fuse: separate pqueue for clones)
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
Merging hid/for-next (4cdf21c9ad74 Merge branch 'for-4.2/upstream' into for=
-next)
Merging i2c/i2c/for-next (f6505fbabc42 i2c: add SLIMpro I2C device driver o=
n APM X-Gene platform)
Merging jdelvare-hwmon/master (3cc49e580f0f hwmon: (w83792d) Additional PWM=
 outputs support)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
CONFLICT (content): Merge conflict in drivers/firmware/dmi_scan.c
Merging hwmon-staging/hwmon-next (ce489d01004e hwmon: Allow compile test of=
 GPIO consumers if !GPIOLIB)
Merging v4l-dvb/master (e7f8fd8aa7f2 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (d1809fd6c20c Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (8b66171ef957 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (db2cb0798393 Merge branch 'pm-sleep' into linux-next)
Merging idle/next (64887b6882de Merge branch 'for-linus-4.1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs)
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
Merging slave-dma/next (4a5f3adeef59 Merge branch 'topic/omap' into next)
Merging net-next/master (06b2c61c92a9 ip: remove unused function prototype)
CONFLICT (content): Merge conflict in net/switchdev/switchdev.c
Merging ipsec-next/master (8faf491e6420 xfrm: optimise to search the inexac=
t policy list)
Merging wireless-drivers-next/master (6e65104504fe brcmfmac: check result o=
f USB firmware request)
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/mac.c
Merging bluetooth/master (011c391a090e Bluetooth: Add debug logs for legacy=
 SMP crypto functions)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (bcb83a19d3ac mtd: brcmnand: do not make local variab=
le static)
Merging crypto/master (eddca85b1a9a crypto: omap-sham - Add support for oma=
p3 devices)
Merging drm/drm-next (91d9f9856f91 Merge tag 'drm-amdkfd-next-2015-05-19' o=
f git://people.freedesktop.org/~gabbayo/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_irq.c
$ git reset --hard HEAD^
Merging next-20150519 version of drm
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_irq.c
[master 9d4119fc7111] next-20150519/drm
Merging drm-panel/drm/panel/for-next (c06ea0ada75b drm/bridge: ptn3460: Pas=
s flags to devm_gpiod_get())
Merging drm-intel/for-linux-next (75a27165ed8c drm/i915: Tighten the exposu=
re ARGB/ABGR 8888 formats)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (12008083be6d drm/atomic: add all affected =
planes in drm_atomic_helper_check_modeset)
Merging drm-exynos/exynos-drm/for-next (9aeb8acbf0a2 drm/exynos: dp: Lower =
level of EDID read success message)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (4214c5349c20 ALSA: hda - Fix NULL dereference from =
CA0132 DSP loader)
Merging sound-asoc/for-next (dfb252abf339 Merge remote-tracking branches 'a=
soc/topic/wm8994' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (4a3893d069b7 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging input/next (ca8ff6ac455d Input: wm831x-on - pass the IRQF_ONESHOT f=
lag)
Merging block/for-next (fad112603ac5 Merge branch 'for-4.2/core' into for-n=
ext)
Merging device-mapper/for-next (9a7eb85965cf dm stats: Use kvfree() in dm_k=
vfree())
CONFLICT (content): Merge conflict in include/linux/blk_types.h
CONFLICT (content): Merge conflict in drivers/md/dm-thin.c
CONFLICT (content): Merge conflict in drivers/md/dm-snap.c
CONFLICT (content): Merge conflict in drivers/md/dm-raid1.c
CONFLICT (content): Merge conflict in drivers/md/dm-cache-target.c
CONFLICT (content): Merge conflict in block/bio.c
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (bd2ae7c415cf RFC: mmc: core: Increase delay for voltag=
e to stabilize from 3.3V to 1.8V)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (bb27051f9fd7 md/raid5: fix handling of degraded stripe=
s in batches.)
Merging mfd/for-mfd-next (82f1e29aec9c Documentation: Add WM8998/WM1814 dev=
ice tree bindings)
Merging backlight/for-backlight-next (6d1238d838a1 backlight/lp855x: Don't =
clear level on suspend/blank)
Merging battery/master (8ebb7e9c1a50 power: bq27x00_battery: Add missing MO=
DULE_ALIAS)
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (acb466e8801a Merge remote-tracking branches 're=
gulator/topic/max14577', 'regulator/topic/max77693', 'regulator/topic/max77=
843', 'regulator/topic/max8973' and 'regulator/topic/of' into regulator-nex=
t)
Merging security/next (1ddd3b4e07a4 LSM: Remove unused capability.c)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next an=
d modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (88096f774d71 ima: pass iint to ima_add_violation())
Merging selinux/next (6a878464e21a signals: don't abuse __flush_signals() i=
n selinux_bprm_committed_creds())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (60dcc6f0bcf4 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/exynos' and 'core' into next)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (13696e0a735d Doc: Fix description of nomce in ke=
rnel-parameters.txt)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (39a8804455fb Linux 4.0)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (4760597116e3 scripts/dtc: Update to upstream versio=
n 9d3649bd3be245c9)
Merging mailbox/mailbox-for-next (4c0f74bf82e8 mailbox: Enable BCM2835 mail=
box support)
Merging spi/for-next (17258abbb56b Merge remote-tracking branches 'spi/topi=
c/sirf' and 'spi/topic/spidev' into spi-next)
Merging tip/auto-latest (982578dabcf0 Merge branch 'timers/core')
Merging clockevents/clockevents/next (d44c80d0cbb2 clocksource: exynos_mct:=
 Remove old platform mct_init())
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (30c7469ba6f5 MAINTAINERS: Change Johannes Thumsh=
irn's email address)
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (f267caab4445 tracing: Remove unused prototype ftra=
ce_event_define_field())
Merging rcu/rcu/next (75eedc2ba60a documentation: Fix spelling of "operator=
s")
CONFLICT (content): Merge conflict in net/netfilter/core.c
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in include/linux/rcutree.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Merging kvm/linux-next (3520469d65f2 KVM: export __gfn_to_pfn_memslot, drop=
 gfn_to_pfn_async)
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (06b36753a646 KVM: s390: drop handling of interception=
 code 12)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend())
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (d4d3e2579756 workqueue: ensure attrs changes a=
re properly synchronized)
Merging drivers-x86/for-next (61104aa44529 dell-laptop: Use dell-rbtn inste=
ad i8042 filter when possible)
Merging chrome-platform/for-next (96cba9b00e29 platform/chrome: chromeos_la=
ptop - instantiate Atmel at primary address)
Merging regmap/for-next (637733e01bd4 Merge remote-tracking branches 'regma=
p/topic/defaults' and 'regmap/topic/irq' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (ebb66c25577a Documentation: leds-lp5523: describe ma=
ster fader attributes)
Merging ipmi/for-next (c32e9840e96a ipmi: Add a comment in how messages are=
 delivered from the lower layer)
Merging driver-core/driver-core-next (e26081808eda Linux 4.1-rc4)
Merging tty/tty-next (02730d3c053a Merge 4.1-rc4 into tty-next)
Applying: serial/amba-pl011: fix mismerge
Merging usb/usb-next (909eacd748b3 Merge 4.1-rc4 into usb-next)
Merging usb-gadget/next (88a25e02f35e usb: renesas_usbhs: Add access contro=
l for INTSTS1 and INTENB1 register)
Merging usb-serial/usb-next (e26081808eda Linux 4.1-rc4)
Merging staging/staging-next (936a0cd52aa5 Merge 4.1-rc4 into staging-next)
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Merging char-misc/char-misc-next (f5da7cb24b78 coresight: etb10: Fix check =
for bogus buffer depth)
Merging extcon/extcon-next (d71aadda19f8 extcon: Remove the optional name o=
f extcon device)
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (8ab456ac3697 cgroup: switch to unsigned long for b=
itmasks)
Merging scsi/for-next (18308d4be6ae Merge branch 'misc' into for-next)
Merging target-updates/for-next (3a6e7fffe130 target: Convert se_lun->lun_s=
ep updater + readers to RCU)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (4fd30e726ed3 Merge branch 'devel' into for-next)
Merging vhost/linux-next (f4aaa799cf9a tun, macvtap: higher order allocatio=
ns for skbs)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (1ab4363bd9fb Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (efb0de55b6a2 pwm: Add support to remove registered co=
nsumer lookup tables)
Merging dma-buf/for-next (9abdffe286c1 dma-buf: add ref counting for module=
 as exporter)
Merging userns/for-next (7e96c1b0e0f4 mnt: Fix fs_fully_visible to verify t=
he root directory is visible)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (df5338d9fe5d clk: mmp: add PXA1928 clock support)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (36a4d1a9445e tools selftests: Fix 'clean' target wi=
th make 3.81)
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (01ca6f0d384f Merge branch 'for-4.2/upstream'=
 into for-next)
Merging coresight/next (086a4c07200f coresight: replicator: Add Qualcomm Co=
reSight Replicator driver)
Merging rtc/rtc-next (f1644dff27ab rtc: rtc-v3020: use gpio_request_array())
Merging akpm-current/current (ecc81b6b2f2e mm-thp-split-out-pmd-collpase-fl=
ush-into-a-separate-functions-fix-2)
CONFLICT (content): Merge conflict in kernel/watchdog.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: printk: improve the description of /dev/kmsg line format
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (ff0a3cc77c28 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/vn9Irwth4jgC_KC9Z=7Kab_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXEJdAAoJEMDTa8Ir7ZwV7zwP/iXsUZoHOc956z4yW449fY3u
wqhdOaq208QseTVBsLbUZMFwPKH1go3zEMMY6iCTjSGGmyTqpZzx4nM3+8ZIWObs
sGjbnn2VH+D7CsP25TXlSM6V56OE/bYnxE1N+55agKyzO4hUyi67gnIE9ixCndkn
WUDjDcgigarllTVXkrba6Kr1GXzn0brfEAt2y3n8T60w1VERrWjxFJbeN6buiU1O
S2/57dRE26KIhB0ZTju08q4SKfw1XpYCKvRJEFqVhl1sHOHQLHrU32uAmgiAlr0/
B1Jayv5uLlg4vI1P+q70eLxZndDu6FZz3hHHUqhZTyXXzLCbif1jeDvBok0neMwh
0lnf6jQCc19bpzoz69rwrqTTjPQZJOk9rHb2rQxlm8EsbEw6UPBdEmo3IAfZBYk9
8F99yX/vupUXTJCDuBqofeyl/0PHOrCHM7rds/zBs8E2xg8CEFfp93np9bqEe/gf
/VwgJLIsfEDgnnp70mXBwiVFZPVjThD7C68I13J/Laup+BdRao3Z8Y1b5YwPvZW/
xK6zA5opdaKNr91E03/goVBDx44nLXZs1pJPrLjta8fwbN55tB+BxjOT4Jn18TYZ
fe3IIRp7NBd3gih35ZLhlk46KW6sigwEtz4o5WEYU9c73rG924D9oDo8n7FJDRIn
6kuIdQfd4ErqT8fbStn1
=Pmg6
-----END PGP SIGNATURE-----

--Sig_/vn9Irwth4jgC_KC9Z=7Kab_--
