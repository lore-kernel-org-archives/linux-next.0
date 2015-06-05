From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: Tree for Jun 5
Date: Sat, 06 Jun 2015 00:07:33 +1000
Message-ID: <1433513253.8590.5.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-TrwJE9tZeUMF+k+zEFrB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next <linux-next@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org


--=-TrwJE9tZeUMF+k+zEFrB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

So as Stephen said in his earlier email I did the linux-next merge today as=
 a
test run for when he's on vacation.

It went OK to begin with though things got a little hairy toward the end. S=
o if
there's odd build breaks or bad merges that's my fault.

Also note the tree has moved, until I get permission on the official linux-=
next
repo, for today it's at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mpe/linux-next.git


Changes since 20150604:

The imx-mxs tree lost its build failure.

The vfs tree gained a conflict against the nfsd tree.

The drm tree gained a conflict against the drm-intel-fixes tree.

The tip tree gained a conflict against the iommu tree.

The drivers-x86 tree still has a build failure so I applied the fixup patch
from Radim Kr=C4=8Dm=C3=A1=C5=99.

Non-merge commits (relative to Linus' tree): 8825
 7811 files changed, 474723 insertions(+), 187945 deletions(-)

---------------------------------------------------------------------------=
-

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/mpe/linux-next.git

!! Note changed location                      ^^

I also don't have permission to upload the patch, so there is no patch toda=
y.

If you are tracking the linux-next tree using git, you should not use "git
pull" to do so as that will try to merge the new linux-next release with th=
e
old one.  You should use "git fetch" and checkout or reset to the new maste=
r.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log files
in the Next directory.  Between each merge, the tree was built with
a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
multi_v7_defconfig for arm. After the final fixups (if any), it is also
built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
allyesconfig (this fails its final link) and i386, sparc, sparc64 and arm
defconfig.

Below is a summary of the state of the merge.

I am currently merging 219 trees (counting Linus' and 31 trees of patches
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

cheers


$ git checkout master
$ git reset --hard stable
Merging origin/master (ff25ea8f4eee Merge branch 'fixes' of git://git.infra=
dead.org/users/vkoul/slave-dma)
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
Merging powerpc-merge-mpe/fixes (c65b99f04684 Linux 4.1-rc6)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (6e5403093261 ipv4/udp: Verify multicast group is ours i=
n upd_v4_early_demux())
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (ea114fc27dc0 ALSA: usb-audio: fix missing =
input volume controls in MAYA44 USB(+))
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
Merging usb-serial-fixes/usb-linus (df72d588c54d USB: cp210x: add ID for Hu=
bZ dual ZigBee and Z-Wave dongle)
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
Merging drm-intel-fixes/for-linux-next-fixes (4f47c99a9be7 drm/i915: Move W=
aBarrierPerformanceFixDisable:skl to skl code from chv code)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (a75b62a53fcd ARC: fix section mismatch with allyescon=
fig)
Merging arm/for-next (014139d62bc3 Merge branch 'for-arm-soc' into for-next=
)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
CONFLICT (modify/delete): arch/arm/kernel/perf_event_cpu.c deleted in arm-p=
erf/for-next/perf and modified in HEAD. Version HEAD of arch/arm/kernel/per=
f_event_cpu.c left in tree.
$ git rm -f arch/arm/kernel/perf_event_cpu.c
Merging arm-soc/for-next (77bdccab2043 arm-soc: temporarily work around qco=
m build error)
CONFLICT (content): Merge conflict in arch/arm/mach-socfpga/core.h
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
CONFLICT (content): Merge conflict in arch/arm/mach-imx/Kconfig
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size=
)
Merging mvebu/for-next (96a9fef8a7fa Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (b6d4b793e013 Merge branch 'omap-for-v4.2/fixes' into=
 for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_da=
ta.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (613915220fbc Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (1c07c562d9d5 Merge branch 'v4.2-next/dt-samsung-4=
th' into for-next)
Merging sunxi/sunxi/for-next (11f9fb71e172 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (8f6a30d3a5c1 arm64: alternative: Work around .=
inst assembler bugs)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (78ed75794276 CRISv10: delete unused lib/dmacopy.c)
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
Merging mips/mips-for-linux-next (8252fb2f022f Merge branch '4.1-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (0d7cd8550d30 powerpc/powernv: Add opal-prd channe=
l)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (31ea9d5dfd27 powerpc/85xx: p1025twr: add module condition=
al to fix QE-uart issue)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (7c53fcb39fdd s390/dasd: Enable automatic loading of =
dasd_diag_mod)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (5316a64ce518 tile: avoid a "label not used" warning in=
 do_page_fault())
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
Merging f2fs/dev (f56aa1c57ea9 f2fs: fix to return exact trimmed size)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (9cde2898d045 gfs2: limit quota log messages)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (13985b1f77d0 NFS: drop unneeded goto)
Merging nfsd/nfsd-next (185406191af5 nfsd: Allows user un-mounting filesyst=
em where nfsd exports base on)
Merging overlayfs/overlayfs-next (3ed6b3b4255d ovl: allow distributed fs as=
 lower layer)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (3d99e3fe13d4 Merge branch 'stable' of git://git.kern=
el.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile)
Merging ubifs/linux-next (98fb1ffd8154 UBI: block: Add missing cache flushe=
s)
Merging xfs/for-next (4ea79766168b Merge branch 'xfs-commit-cleanup' into f=
or-next)
Merging file-locks/linux-next (7505256626b0 Merge tag 'devicetree-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux)
Merging vfs/for-next (b853a16176cf turn user_{path_at,path,lpath,path_dir}(=
) into static inlines)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (modify/delete): fs/hppfs/hppfs.c deleted in HEAD and modified in =
vfs/for-next. Version vfs/for-next of fs/hppfs/hppfs.c left in tree.
CONFLICT (content): Merge conflict in fs/ext4/symlink.c
$ git rm -f fs/hppfs/hppfs.c
Applying: f2fs: merge fix for follow_link changes
Merging pci/next (ae397a1e6422 Merge branches 'pci/aspm', 'pci/enumeration'=
, 'pci/hotplug' and 'pci/virtualization' into next)
Merging hid/for-next (4d4c484d0c59 Merge branch 'for-4.2/sony' into for-nex=
t)
Merging i2c/i2c/for-next (e692877de578 Merge branch 'i2c/for-4.2' into i2c/=
for-next)
Merging jdelvare-hwmon/master (2b30464a2c87 hwmon: Document which I2C addre=
sses can be probed)
Merging dmi/master (bec755ee1080 firmware: dmi: struct dmi_header should be=
 packed)
Merging hwmon-staging/hwmon-next (e892b75ff579 hwmon: (atxp1) Drop auto-det=
ection)
Merging v4l-dvb/master (e3645d485fd0 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (f412fabbc164 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (e4a3656ebf34 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (e3e5e8cd0abd Merge branch 'pm-wakeirq' into linux-ne=
xt)
Merging idle/next (a576d08d4eb2 Merge branches 'cpuidle' and 'turbostat' in=
to release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (e27f74ae45b3 Merge branches 'for-rc' and 'release' of=
 .git into next)
Merging thermal-soc/next (b89384e9e8c0 Merge branch 'work-linus' into work-=
next)
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (36059b2e5694 Merge branches 'for-linus' and 'topic/=
pxa' into next)
Merging net-next/master (bb62f791f922 Merge branch 'mlx5-next')
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (1690faef645e Merge tag 'iwlwifi-next-=
for-kalle-2015-06-03' of https://git.kernel.org/pub/scm/linux/kernel/git/iw=
lwifi/iwlwifi-next)
Merging bluetooth/master (133be0264f28 nl802154: export supported commands)
Merging rdma/for-next (ec08a8158de2 Merge branch 'for-4.2-misc' into k.o/fo=
r-4.2)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (e5babdf928e5 mtd: dc21285: use raw spinlock function=
s for nw_gpio_lock)
Merging crypto/master (12f7c14aa602 crypto: doc - Fix typo in crypto-API.xm=
l)
CONFLICT (content): Merge conflict in net/ipv6/esp6.c
CONFLICT (content): Merge conflict in net/ipv4/esp4.c
Merging drm/drm-next (ef1316961048 drm/qxl: Propagate correctly errors from=
 qxlhw_handle_to_bo)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer=
.c
Merging drm-panel/drm/panel/for-next (dd0150026901 drm/panel: simple: Add s=
upport for LG LB070WV8 800x480 7" panel)
Merging drm-intel/for-linux-next (501fd70fcaeb drm/i915: limit PPGTT size t=
o 2GB in 32-bit platforms)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0f5c41dbe96a Documentation/drm: Update rot=
ation property)
Merging drm-exynos/exynos-drm/for-next (7abddcd65bc0 drm/exynos: split exyn=
os_crtc->dpms in enable() and disable())
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (83b0b677f90a ALSA: hda - add new HDA registers)
Merging sound-asoc/for-next (dac48b888243 Merge remote-tracking branches 'a=
soc/topic/wm8994', 'asoc/topic/wm8996' and 'asoc/topic/zx' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs fo=
r sig_enforce declaration)
Merging input/next (85919a00e55f Input: focaltech - report finger width to =
userspace)
Merging block/for-next (613a2e5fb8db Merge branch 'for-4.2/writeback' into =
for-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/backing-dev.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
CONFLICT (content): Merge conflict in arch/um/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/cris/include/asm/Kbuild
Merging device-mapper/for-next (cdf773cc77c1 dm thin: range discard support=
)
Merging pcmcia/master (f2e6cf76751d pcmcia: Convert dev_printk to dev_<leve=
l>)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (83dc9fecd5d4 mmc: sdhci-pxav3: fix device wakeup initi=
alization)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (38f31b94147c md/raid5: ignore released_stripes check)
Merging mfd/for-mfd-next (79a1726fd29c mfd: mt6397-core: Add GPIO sub-modul=
e support)
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simpl=
ify usage of devm_gpiod_get_optional)
Merging battery/master (fb323eccbcaf power_supply: rt9455_charger: Check if=
 CONFIG_USB_PHY is enabled)
Merging omap_dss2/for-next (c895891f0646 Merge branch 'ti-dra7-dss' into 4.=
2/fbdev)
Merging regulator/for-next (fcf558683fd6 Merge remote-tracking branches 're=
gulator/topic/max14577', 'regulator/topic/max77693', 'regulator/topic/max77=
843', 'regulator/topic/max8973' and 'regulator/topic/of' into regulator-nex=
t)
Merging security/next (e6e29a4eae33 Merge branch 'smack-for-4.2-stacked' of=
 https://github.com/cschaufler/smack-next into next)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next an=
d modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (8d94eb9b5cff ima: pass iint to ima_add_violation())
Merging selinux/next (4d5e1f14efcc selinux: Remove unused permission defini=
tions)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (32e263fc42c8 watchdog: imx2_wdt: set watchdog pare=
nt device)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (8e78783d4456 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/exynos', 'arm/smmu', 'x86/vt-d', 'x86/amd' and 'core' into next)
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
Merging tip/auto-latest (7a6a010964a6 Merge branch 'core/core')
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
CONFLICT (content): Merge conflict in include/linux/intel-iommu.h
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevent=
s/4.2' into clockevents/next)
CONFLICT (add/add): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP an=
d -EX)
Merging edac-amd/for-next (451bb7fbccdc EDAC, xgene: Fix cpuid abuse)
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/tile/Kconfig
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (a497adb45b86 ring-buffer: Add enum names for the c=
ontext levels)
Merging rcu/rcu/next (d254f32b7c03 rcu: Deinline rcu_read_lock_sched_held()=
 if DEBUG_LOCK_ALLOC)
Merging kvm/linux-next (e69fab5df45f KVM: x86: clear hidden CPU state at re=
set time)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/kvm_host.h
Applying: kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
Merging kvm-arm/next (2fa462f82621 Merge tag 'kvm-arm-for-4.1-take2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvm-ppc/kvm-ppc-next (b79013b2449c Merge tag 'staging-4.1-rc1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging kvms390/next (ea2cdd27dce6 KVM: s390: introduce KMSG_COMPONENT for =
kvm-s390)
Merging xen-tip/linux-next (ffb7dbed47da xen/arm: Define xen_arch_suspend()=
)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (402dd89d6cdb workqueue: fix typos in comments)
Merging drivers-x86/for-next (b8f8cf6b02b6 pvpanic: handle missing _STA cor=
rectly)
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
Merging usb/usb-next (b3d424e3dcbb Merge tag 'phy-for-v4.2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-next)
CONFLICT (content): Merge conflict in drivers/usb/musb/musb_core.c
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUS=
Y too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_t=
imer)
Merging staging/staging-next (084861124d00 staging: unisys: use schedule_ti=
meout_interruptible())
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Applying: staging: wilc1000: fix call to cfg80211_disconnecteddue to API ch=
ange
Applying: staging: disable the WILC1000 driver
Merging char-misc/char-misc-next (00465f4c8486 Merge tag 'extcon-next-for-4=
.2' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into ch=
ar-misc-next)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
CONFLICT (content): Merge conflict in include/dt-bindings/mfd/arizona.h
Applying: power: axp288_charger: fix for API change
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name=
() function pointer of extcon_dev)
Merging kdbus/kdbus (3451de5a838c kdbus: kdbus_conn_connect(): use `bus' in=
stead of `conn->ep->bus')
Merging cgroup/for-next (c80ef9e0c021 cgroup: add seq_file forward declarat=
ion for struct cftype)
Merging scsi/for-next (6546a02a571c target: explicitly include scsi_proto.h=
 in target_core_fabric_lib.c)
CONFLICT (content): Merge conflict in drivers/target/target_core_user.c
Merging target-updates/for-next (a6fd1b94e964 target: Drop duplicate + unus=
ed se_dev_check_wce)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (7164873e7c69 pinctrl: sunxi: Add allwinner A33 PI=
O controller support)
Merging vhost/linux-next (210d150e1f5d virtio_pci: Clear stale cpumask when=
 setting irq affinity)
Merging remoteproc/for-next (172e6ab1caff remoteproc: fix various checkpatc=
h warnings)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (e2bfba418598 fix documentation after renaming gpiod_=
set_array to gpiod_set_array_value)
Merging dma-mapping/dma-mapping-next (5ebe6afaf005 Linux 4.1-rc2)
Merging pwm/for-next (cccb94543c82 pwm: samsung: Use MODULE_DEVICE_TABLE() =
to include OF modalias)
Merging dma-buf/for-next (5136629dc5a1 dma-buf: Minor coding style fixes)
Merging userns/for-next (14d419c079ab mnt: Update fs_fully_visible to test =
for permanently empty directories)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (4a1caed3d0c2 clk: make several parent names const)
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
Merging init/init-v4.1-rc6 (1962ab4acf43 module: relocate module_init from =
init.h to module.h)
CONFLICT (content): Merge conflict in arch/mips/loongson64/common/serial.c
CONFLICT (content): Merge conflict in arch/arm/mach-keystone/platsmp.c
CONFLICT (modify/delete): arch/arm/mach-hisi/headsmp.S deleted in HEAD and =
modified in init/init-v4.1-rc6. Version init/init-v4.1-rc6 of arch/arm/mach=
-hisi/headsmp.S left in tree.
$ git rm -f arch/arm/mach-hisi/headsmp.S
Applying: drivers/hwtracing: fix coresight-replicator-qcom implicit <module=
.h> usage
Applying: drivers/hwtracing: fix coresight-etm4x implicit <module.h> usage
Merging akpm-current/current (45be0ab9ce2e scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
CONFLICT (content): Merge conflict in arch/x86/Kconfig
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
Applying: MAINTAINERS: remove website for paride
Applying: MAINTAINERS: update sound soc intel patterns
Applying: MAINTAINERS: update brcm dts pattern
Applying: MAINTAINERS: update brcm gpio filename pattern
Applying: MAINTAINERS: remove unused nbd.h pattern
Applying: MAINTAINERS: move Jens Osterkamp to CREDITS
Applying: MAINTAINERS: BCACHE: Kent Overstreet has changed email address
Applying: MAINTAINERS: add zpool
Applying: x86: opt into HAVE_COPY_THREAD_TLS, for both 32-bit and 64-bit
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (f23b2424ac49 drivers/w1/w1_int.c: call put_device if d=
evice_register fails)


--=-TrwJE9tZeUMF+k+zEFrB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABAgAGBQJVca0wAAoJEFHr6jzI4aWAm6oP/RDwT9VSmnx/vFBVtQoWkjXe
jngYa8ixSKDadbi83ZV8UoFye04Uy1B1xNWHzUbhmS8zZISrf55UXrhOYrcajkLy
ZN1buyKFtmxc+KxbirGU8Sgl8izjzPD2WsjOLC3fTBY7uT+DcQZHpHwDCuwxJSlL
x8KF1I8o+CmoyZ+y3loa/VzbnyIE+jY+yLywWFvrvxV7+xbTGaLITLkD+Ao6sX+4
r9sq0p5WUIvM4Wa0YuOPXT32Tk+DtM0A+PiY17aX5/65c/CM9J8Wp6M6fE4/0ICm
GBjhW7XwqoTUiUAtcgRhq+SoizOZo0pvyKCd8DsokYlFGE459082ZC1Xz92s/T8z
YGdxFoi9G7MWRXdwmo3cGt7Z//JqXkL0PlUobbty/U5EdE7iyNC6hlDwQmAtZzWA
XtPlXFv6WW71UO5o3699X+aRrsHEcH8uQ/G83AAqhoOex7nw0UamMr8aaU2NqyRi
3NAm6taYR6WuGApMgAdJty0NnaX3sSgoZWgBb0C2FsFF9CzuiTP1d/s1HQfIpNLw
bqWC0s4cKPRoiob1HlDtabv8iDI5uYXvLUmyKX1DW511+roPk8KOnGdV7ON1jwlm
MwETXejW1jcau34F8J8wStDNZmdwki9/jf6k0H+p5IccgAb93/VVS/ph7/KS+COC
V1cfHwgJQEVvLROfSnHQ
=TMPu
-----END PGP SIGNATURE-----

--=-TrwJE9tZeUMF+k+zEFrB--
