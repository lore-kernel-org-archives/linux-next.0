From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jun 9
Date: Wed, 10 Jun 2015 00:44:28 +1000
Message-ID: <20150610004428.1342e544@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y8_pXDhZCrY+TI+B61K7RUo"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54940 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753268AbbFIOoh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 10:44:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/y8_pXDhZCrY+TI+B61K7RUo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150605:

The vfs tree gained a conflict against the ext4 tree.

I added a couple of supplied patches to the crypto tree for overnight
build problems.

The drm tree gained a build failures for which I disabled a new feature.

The tip tree gained conflicts against the iommu tree.

The akpm tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 9378
 8268 files changed, 888343 insertions(+), 185413 deletions(-)

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

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (056537c686e1 Merge tag 'for_linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/mst/vhost)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (0bbe6b5a73c0 ARM: 8388/1: tcm: Don't crash when =
TCM banks are protected by TrustZone)
Merging m68k-current/for-linus (b24f670b7f5b m68k/mac: Fix out-of-bounds ar=
ray index in OSS IRQ source initialization)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge-mpe/fixes (c65b99f04684 Linux 4.1-rc6)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging sparc/master (c46a024ea5eb Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (bbbf2df0039d net: replace last open coded skb_orphan_fr=
ags with function call)
Merging ipsec/master (31a418986a58 xen: netback: read hotplug script once a=
t start of day.)
Merging sound-current/for-linus (3b7e5c7e36ed ALSA: usb-audio: add native D=
SD support for JLsounds I2SoverUSB)
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
Merging usb-serial-fixes/usb-linus (df72d588c54d USB: cp210x: add ID for Hu=
bZ dual ZigBee and Z-Wave dongle)
Merging staging.current/staging-linus (d4a4f75cd8f2 Linux 4.1-rc7)
Merging char-misc.current/char-misc-linus (e26081808eda Linux 4.1-rc4)
Merging input-current/for-linus (7f2ca8b55aef Input: synaptics - add min/ma=
x quirk for Lenovo S540)
Merging crypto-current/master (f858c7bcca8c crypto: algif_aead - Disable AE=
AD user-space for now)
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
Merging drm-intel-fixes/for-linux-next-fixes (8ce7da474f30 drm/i915: Proper=
ly initialize SDVO analog connectors)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (e25ed94cd3dd ARC: [axs101] Add missing __init annotat=
ions)
Merging arm/for-next (0271c4d252ee Merge branch 'for-arm-soc' into for-next)
Merging arm-perf/for-next/perf (74cf0bc75f16 arm: perf: unify perf_event{,_=
cpu}.c)
Merging arm-soc/for-next (52acc11e9482 Merge branch 'fixes' into for-next)
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
Merging keystone/next (a6ba4234e474 ARM: dts: k2l: fix the netcp range size)
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
Merging samsung/for-next (7585f44e561e Merge branch 'v4.2-next/dt64-samsung=
' into for-next)
Merging sunxi/sunxi/for-next (11f9fb71e172 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
Merging tegra/for-next (a9460d4a7ed1 Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (04d7e098f541 arm64: fix missing syscall trace =
exit)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (7a7c68de60cf CRISv10: delete unused lib/dmacopy.c)
Merging h8300/h8300-next (2ced81d35808 h8300: fix typo.)
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
Merging microblaze/next (c4fa9a6ae285 microblaze/PCI: Remove unnecessary st=
ruct pci_dev declaration)
Merging mips/mips-for-linux-next (b2f8c2da7141 MIPS: Replace smp_mb with re=
lease barrier function in unlocks.)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/clk/Makefile
Merging nios2/nios2-next (1a70db49a735 nios2: rework cache)
Merging parisc-hd/for-next (4b470f120817 Merge branch 'parisc-4.1-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging powerpc-mpe/next (809fac67c853 selftests/powerpc: Add gitignore fil=
e for the new DSCR tests)
Merging powerpc/next (65e7bb2a34fe Merge branch 'next-sriov' into next)
Merging fsl/next (f1b3b4450dcb powerpc/85xx: Replace CONFIG_USB_ISP1760_HCD=
 by CONFIG_USB_ISP1760)
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
Merging ext4/dev (562bef4565ef jbd2: speedup jbd2_journal_dirty_metadata())
Merging f2fs/dev (f56aa1c57ea9 f2fs: fix to return exact trimmed size)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's prim=
ary_index if registering failed)
Merging fuse/for-next (780e2a3f06e7 fuse: update MAINTAINERS entry)
Merging gfs2/for-next (1bdf45352e18 gfs2: s64 cast for negative quota value)
Merging jfs/jfs-next (f7f31adf07d1 jfs: fix indentation on if statement)
Merging nfs/linux-next (0d2a970d0ae5 SUNRPC: Fix a backchannel race)
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
Merging hwmon-staging/hwmon-next (f6725ae2f1ae hwmon: (ntc_thermistor) Impr=
ove precision of resistance calculation)
Merging v4l-dvb/master (e3645d485fd0 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (f412fabbc164 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (dbff2006689f Merge branch 'for-4.1-fixes' into for=
-next)
Merging pm/linux-next (45423299db3a Merge branches 'pnp' and 'pm-tools')
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
Merging swiotlb/linux-next (023600f192be swiotlb: do not export map_single =
function)
Merging slave-dma/next (ef1993bee00d Merge branches 'topic/core', 'topic/om=
ap', 'topic/pxa' and 'topic/xdmac' into next)
Merging net-next/master (ac7ba51c215d net: phy: dp83867: Fix device tree en=
tries)
Merging ipsec-next/master (493be55ac3d8 xen-netfront: Use setup_timer)
Merging wireless-drivers-next/master (49280625eb82 bcma: lower dependency o=
f BCMA_DRIVER_PCI_HOSTMODE)
Merging bluetooth/master (2eeac871697a Bluetooth: btusb: Correct typo in Ro=
per Class 1 Bluetooth Dongle)
Merging rdma/for-next (ec08a8158de2 Merge branch 'for-4.2-misc' into k.o/fo=
r-4.2)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (e5babdf928e5 mtd: dc21285: use raw spinlock function=
s for nw_gpio_lock)
Merging crypto/master (12f7c14aa602 crypto: doc - Fix typo in crypto-API.xm=
l)
CONFLICT (content): Merge conflict in net/ipv6/esp6.c
CONFLICT (content): Merge conflict in net/ipv4/esp4.c
Merging drm/drm-next (ae45577324d1 virtgpu: include linux/types.h to avoid =
warning.)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_ringbuffer=
.c
Merging drm-panel/drm/panel/for-next (7351148e2f36 drm/panel: simple: Add b=
us format for HannStar HSD100PXN1)
Merging drm-intel/for-linux-next (bf546f8158e2 drm/i915/skl: Fix DMC API ve=
rsion in firmware file name)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0f5c41dbe96a Documentation/drm: Update rot=
ation property)
Merging drm-exynos/exynos-drm/for-next (7abddcd65bc0 drm/exynos: split exyn=
os_crtc->dpms in enable() and disable())
Merging drm-msm/msm-next (d22855673f2e drm/msm: restart queued submits afte=
r hang)
Merging sound/for-next (01ec65c812ef ASoC: intel: Remove unused variable hs=
w)
Merging sound-asoc/for-next (fbdcc35f0cf4 Merge remote-tracking branch 'aso=
c/topic/wm8741' into asoc-next)
Merging modules/modules-next (6727bb9c6abe kernel/module.c: avoid ifdefs fo=
r sig_enforce declaration)
Merging input/next (7b9f1830745c Input: elan_i2c - add product IDs FW names)
Merging block/for-next (e2f4ef972c1c Merge branch 'for-4.2/writeback' into =
for-next)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/backing-dev.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
Merging device-mapper/for-next (1cb7b8b67a44 dm stats: fix divide by zero i=
f 'number_of_areas' arg is zero)
Merging pcmcia/master (f2e6cf76751d pcmcia: Convert dev_printk to dev_<leve=
l>)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (5fd26c7ecb32 mmc: sdhci: Restore behavior while creati=
ng OCR mask)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (38f31b94147c md/raid5: ignore released_stripes check)
Merging mfd/for-mfd-next (79a1726fd29c mfd: mt6397-core: Add GPIO sub-modul=
e support)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging backlight/for-backlight-next (a7f6d4571393 backlight: pwm_bl: Simpl=
ify usage of devm_gpiod_get_optional)
Merging battery/master (fb323eccbcaf power_supply: rt9455_charger: Check if=
 CONFIG_USB_PHY is enabled)
Merging omap_dss2/for-next (8dc0a56529f5 Merge branch 'ti-dra7-dss' into 4.=
2/fbdev)
Merging regulator/for-next (7331b63a30df Merge remote-tracking branches 're=
gulator/topic/max14577', 'regulator/topic/max77693', 'regulator/topic/max77=
843', 'regulator/topic/max8973' and 'regulator/topic/of' into regulator-nex=
t)
Merging security/next (42a9699a9fa1 selinux: Remove unused permission defin=
itions)
CONFLICT (content): Merge conflict in security/security.c
CONFLICT (modify/delete): security/capability.c deleted in security/next an=
d modified in HEAD. Version HEAD of security/capability.c left in tree.
CONFLICT (content): Merge conflict in include/linux/security.h
$ git rm -f security/capability.c
Applying: LSM: merge fix for follow_link API changes
Merging integrity/next (8d94eb9b5cff ima: pass iint to ima_add_violation())
Merging selinux/next (9fc2b4b436cf selinux: fix setting of security labels =
on NFS)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (32e263fc42c8 watchdog: imx2_wdt: set watchdog pare=
nt device)
CONFLICT (add/add): Merge conflict in drivers/watchdog/st_lpc_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/Kconfig
Merging iommu/next (d2ff9e6f425a Merge branches 'arm/rockchip', 'arm/exynos=
', 'arm/smmu', 'x86/vt-d', 'x86/amd', 'default-domains' and 'core' into nex=
t)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (f8785d94fc4e Merge branch 'doc/4.2' into docs-ne=
xt)
Merging trivial/for-next (79ce48df755e lpfc: Grammar s/an negative/a negati=
ve/)
Merging audit/next (5c1390c9ffda audit: obsolete audit_context check is rem=
oved in audit_filter_rules())
CONFLICT (content): Merge conflict in security/lsm_audit.c
Merging devicetree/devicetree/next (ce32f859646b of/fdt: fix argument name =
and add comments of unflatten_dt_node())
Merging dt-rh/for-next (63a4aea55670 of: clean-up unnecessary libfdt includ=
e paths)
Merging mailbox/mailbox-for-next (4c0f74bf82e8 mailbox: Enable BCM2835 mail=
box support)
Merging spi/for-next (9de3418b41fb Merge remote-tracking branches 'spi/topi=
c/rspi', 'spi/topic/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/sirf' and 's=
pi/topic/spidev' into spi-next)
Merging tip/auto-latest (06ac2a7e6cd8 Merge branch 'x86/mm')
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
CONFLICT (content): Merge conflict in include/linux/intel-iommu.h
CONFLICT (content): Merge conflict in drivers/iommu/intel_irq_remapping.c
CONFLICT (content): Merge conflict in drivers/iommu/dmar.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Applying: rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and WRITE=
_ONCE()
Applying: iommu.vt-d: fix mismerge
Merging clockevents/clockevents/next (645d558b1cd5 Merge branch 'clockevent=
s/4.2' into clockevents/next)
CONFLICT (add/add): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/Makefile
Merging edac/linux_next (fa2ce64f85be sb_edac: support for Broadwell -EP an=
d -EX)
Merging edac-amd/for-next (31fec261002e EDAC, altera: Do not allow suspend =
when EDAC is enabled)
CONFLICT (content): Merge conflict in arch/x86/Kconfig
CONFLICT (content): Merge conflict in arch/tile/Kconfig
Merging irqchip/irqchip/for-next (a8bcdc32fafb Merge branch 'irqchip/core' =
into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (a497adb45b86 ring-buffer: Add enum names for the c=
ontext levels)
Merging rcu/rcu/next (d254f32b7c03 rcu: Deinline rcu_read_lock_sched_held()=
 if DEBUG_LOCK_ALLOC)
Merging kvm/linux-next (e80a4a9426ad KVM: x86: mark legacy PCI device assig=
nment as deprecated)
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
Merging drivers-x86/for-next (9330dcdd918a samsung-laptop: Use acpi_video_u=
nregister_backlight instead of acpi_video_unregister)
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
Merging driver-core/driver-core-next (987aec39a743 Merge 4.1-rc7 into drive=
r-core-next)
Merging tty/tty-next (00fda1682efd Merge 4.1-rc7 into tty-next)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Makefile
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Kconfig
Merging usb/usb-next (19915e623458 Merge 4.1-rc7 into usb-next)
CONFLICT (content): Merge conflict in drivers/phy/Makefile
Merging usb-gadget/next (e18b7975c885 usb: dwc3: gadget: don't clear EP_BUS=
Y too early)
Merging usb-serial/usb-next (f05b7cb6f2be USB: serial: mos7840: Use setup_t=
imer)
Merging staging/staging-next (6394d6d01bf0 Merge 4.1-rc7 into staging-testi=
ng)
CONFLICT (content): Merge conflict in tools/Makefile
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
Merging extcon/extcon-next (f8df88081183 extcon: Remove optional print_name=
() function pointer of extcon_dev)
Merging kdbus/kdbus (cf15adc8b481 kdbus: use FIELD_SIZEOF in kdbus_member_s=
et_user macro)
Merging cgroup/for-next (818c292c6807 cgroup, block: implement task_get_css=
() and use it in bio_associate_current())
Merging scsi/for-next (641c43cc6909 lpfc: Update driver version for upstrea=
m patch set 10.6.0.1.)
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
Merging userns/for-next (c97648cb2f34 mnt: Update fs_fully_visible to test =
for permanently empty directories)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in fs/libfs.c
CONFLICT (content): Merge conflict in drivers/firmware/efi/efi.c
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (761d3e328c50 clk: socfpga: make use of of_clk_parent_=
fill helper function)
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
Merging rtc/rtc-next (ce7ffc74836c rtc: palmas: Initialise bb_charging flag=
 before using it)
Merging init/init-v4.1-rc6 (e2c786fdde1f module: relocate module_init from =
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
Applying: crypto: drbg - use pragmas for disabling optimization
Applying: nios2: Export get_cycles
Applying: power: axp288_charger: fix for API change
Applying: drm/amdgpu: disable CIK parts for now
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
CONFLICT (content): Merge conflict in arch/x86/entry/entry_64_compat.S
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Merging akpm/master (55c8198129dc drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/y8_pXDhZCrY+TI+B61K7RUo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdvvRAAoJEMDTa8Ir7ZwV6r0P/0+I4B6YKzAw4N/7HLomRZeR
shzIf9+BdAQhSb5dAgBNdKkvnJ5Jt8JQnpCkrMgkccUHhf8qoCiRN9YhfdonXZMj
CZxvirA968zqodSULuAb/l+8etldRwe0/+RxtmTwqnmoUAk4ImtlXeNxfluKCsZd
5KML/GH/BhdekynYTTCaM5wCxdfeD0Jz+socKKdQ+7B6xa0ALhvHuaV98857vYid
vst3G8pSsZf0DqWRUusa2xeWTgZ8OHbAtMLKbcgKTMc+TrKQ0DOzkK4JHnU7jr3N
HF7bqUKQywhyit/wJxK/CO5wxvuC62bjdN14/7ZWRKdeG4SUA/qnHMthMeBYDgCd
NsDTGwaUUt1/rs1suyFnrDc76aUDZU5WbXKpMw84VQIPiREkYbL1j0xg7NdOuDBv
KSRfc1oeKpZRmwdJ8GONfv4lQ5LlG3BkkXGr80WeVVyKc2POwJEDqp63+4b4UXc5
OMDxmJ+hb5HyLnUwwHFXjCHNVe9gtrMkHA739ccbyBpKJ04SresOjuXlpd+mHSNk
YnyiWhvyqOUg09EeCsq5Ti4jC7eY+z6K7ROZ7H+btCe2dv4Qnj3GGuP/FPu9Sgq8
gXwHI93XEPAqahiADZuavKxdeYYnyLfmVoHH5+y0+c+ISyduj7mZ+K0lZudIw0jZ
CSvrcPKnft0eG5k+BV3L
=Ya5C
-----END PGP SIGNATURE-----

--Sig_/y8_pXDhZCrY+TI+B61K7RUo--
