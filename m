From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 25
Date: Mon, 25 May 2015 22:02:32 +1000
Message-ID: <20150525220232.2266685b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OC7gz8nvg4XfjCBPrIe5jVG"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54935 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751096AbbEYMCm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 08:02:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/OC7gz8nvg4XfjCBPrIe5jVG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150522:

The wireless-drivers-next tree gained a conflict against the
wireless-drivers tree.

The device-mapper tree lost its build failure.

The kvm tree gained a conflict against Linus' tree.

The driver-core tree still had its build failure for which I applied a fix
patch.

The tty tree gained a conflict against the tty.current tree.

The extcon tree gained a conflict against the battery tree and a build
failure for which I applied a merge fix patch.

The userns tree gained a conflict against the vfs tree and a build
failure for which I applied a fix patch.

The akpm-current tree gained a build failure for which I applied a
fix patch.

Non-merge commits (relative to Linus' tree): 5630
 5008 files changed, 265121 insertions(+), 118975 deletions(-)

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
Merging origin/master (5b13966693c5 Merge tag 'scsi-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
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
Merging net/master (cf539cbd8a81 Merge branch 'drm-fixes' of git://people.f=
reedesktop.org/~airlied/linux)
Merging ipsec/master (407d34ef2947 xfrm: Always zero high-order sequence nu=
mber bits)
Merging sound-current/for-linus (3530febb5c76 Revert "ALSA: hda - Add mute-=
LED mode control to Thinkpad")
Merging pci-current/for-linus (5ebe6afaf005 Linux 4.1-rc2)
Merging wireless-drivers/master (aefa441b1502 Merge tag 'iwlwifi-for-kalle-=
2015-05-21' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (e26081808eda Linux 4.1-rc4)
Merging tty.current/tty-linus (da555db6b063 n_tty: Fix calculation of size =
in canon_copy_from_read_buf)
Merging usb.current/usb-linus (4bc5d3bbdc94 Merge tag 'for-4.1-rc' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-linus)
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
Merging crypto-current/master (a1cae34e23b1 crypto: s390/ghash - Fix incorr=
ect ghash icv buffer handling.)
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
Merging mvebu/for-next (689bc92a6492 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (f044523a11ca Merge branch 'omap-for-v4.2/dt' into fo=
r-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (5ec9244638c7 Merge branch 'heads/dt-for-v4.2' into ne=
xt)
Merging samsung/for-next (5c78bc1b4667 Merge branch 'samsung-defconfig-2nd'=
 into for-next)
Merging sunxi/sunxi/for-next (a426b3379698 Merge branch 'sunxi/dt-for-4.2' =
into sunxi/for-next)
Merging tegra/for-next (32dadb2ecd7e Merge branch for-4.2/cpufreq into for-=
next)
Merging arm64/for-next/core (05981277a4de arm64: Use common outgoing-CPU-no=
tification code)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clo=
ck for stmmac driver probe)
Merging c6x/for-linux-next (3083ca2376a7 c6x: platforms: cache: Export symb=
ol L1P_cache_block_invalidate and L1D_cache_block_writeback)
Merging cris/for-next (45f49276cd8a CRISv32: allow CONFIG_DEBUG_BUGVERBOSE)
Merging h8300/h8300-next (b03feb8f1900 sh-sci: Get register size from platf=
orm device)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (078550569eaf ramoops: make it possible to change mem_typ=
e param.)
Merging m68k/for-next (2b8520f1f256 m68k: Use for_each_sg())
Merging m68knommu/for-next (e26081808eda Linux 4.1-rc4)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (efbf3f311692 Merge branch '4.1-fixes' int=
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
Merging xtensa/for_next (06a631433460 xtensa: Provide dummy dma_alloc_attrs=
() and dma_free_attrs())
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
Merging hid/for-next (5e8570698230 Merge branch 'for-4.2/wacom' into for-ne=
xt)
Merging i2c/i2c/for-next (f6505fbabc42 i2c: add SLIMpro I2C device driver o=
n APM X-Gene platform)
Merging jdelvare-hwmon/master (3cc49e580f0f hwmon: (w83792d) Additional PWM=
 outputs support)
Merging dmi/master (9432bf142f77 firmware: dmi: List my quilt tree)
CONFLICT (content): Merge conflict in drivers/firmware/dmi_scan.c
Merging hwmon-staging/hwmon-next (ce489d01004e hwmon: Allow compile test of=
 GPIO consumers if !GPIOLIB)
Merging v4l-dvb/master (e7f8fd8aa7f2 Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (653ac63df358 Merge branch 'kbuild/misc' into kbuil=
d/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (c583816d27d0 Merge branch 'for-4.2' into for-next)
Merging pm/linux-next (e0335aa62fbc Merge branches 'pm-clk' and 'pm-wakeirq=
' into linux-next)
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
Merging slave-dma/next (f93a566e8412 Merge branch 'topic/xdmac' into next)
Merging net-next/master (36583eb54d46 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/net)
Merging ipsec-next/master (8faf491e6420 xfrm: optimise to search the inexac=
t policy list)
Merging wireless-drivers-next/master (6e65104504fe brcmfmac: check result o=
f USB firmware request)
CONFLICT (content): Merge conflict in drivers/net/wireless/iwlwifi/Kconfig
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/mac.c
Merging bluetooth/master (c947f7e1e31a mac802154: remove mib lock)
Merging infiniband/for-next (c1c2fef6cfb0 Merge branches 'cve-fixup', 'ipoi=
b', 'iser', 'misc-4.1', 'or-mlx4' and 'srp' into for-4.1)
Merging mtd/master (e26081808eda Linux 4.1-rc4)
Merging l2-mtd/master (01d0afddf37c mtd: maps: Spelling s/reseved/reserved/)
Merging crypto/master (a10f554fa7e0 crypto: echainiv - Add encrypted chain =
IV generator)
Merging drm/drm-next (bdcddf95e82b Backmerge v4.1-rc4 into into drm-next)
Merging drm-panel/drm/panel/for-next (dd0150026901 drm/panel: simple: Add s=
upport for LG LB070WV8 800x480 7" panel)
Merging drm-intel/for-linux-next (d0bc54f2f012 drm/i915: Introduce DRM_I915=
_THROTTLE_JIFFIES)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (e2f5d2ea479b drm/mode: Add user blob-creat=
ion ioctl)
Merging drm-exynos/exynos-drm/for-next (9aeb8acbf0a2 drm/exynos: dp: Lower =
level of EDID read success message)
Merging drm-msm/msm-next (d5af49c92a8a drm/msm/mdp5: Enable DSI connector i=
n msm drm driver)
Merging sound/for-next (146a5e3c1ef9 ALSA: bebob: add Digidesign Mbox 2 Pro=
 support)
Merging sound-asoc/for-next (9af5c8ae2145 Merge remote-tracking branches 'a=
soc/topic/wm8994' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (4a3893d069b7 modpost: don't emit section mism=
atch warnings for compiler optimizations)
Merging input/next (f91a3f08b741 Input: stmpe-ts - fix automatic module loa=
ding)
Merging block/for-next (532ff9028420 Merge branch 'for-4.2/drivers' into fo=
r-next)
Merging device-mapper/for-next (e86dee2084d2 dm thin: range discard support)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (922e59416db2 mmc: sh_mmcif: calculate best clock with =
parent clock)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (181effb6da11 md/raid5: break stripe-batches when the a=
rray has failed.)
Merging mfd/for-mfd-next (82f1e29aec9c Documentation: Add WM8998/WM1814 dev=
ice tree bindings)
Merging backlight/for-backlight-next (6d1238d838a1 backlight/lp855x: Don't =
clear level on suspend/blank)
Merging battery/master (843735b788a4 power: axp288_charger: axp288 charger =
driver)
Merging omap_dss2/for-next (721bb00e1699 video: fbdev: geode gxfb: use iore=
map_wc() for framebuffer)
Merging regulator/for-next (fe2c60b3eded Merge remote-tracking branch 'regu=
lator/topic/of' into regulator-next)
Merging security/next (1ddd3b4e07a4 LSM: Remove unused capability.c)
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
Merging watchdog/master (c5db6a3bdeb7 Merge branch 'timers-urgent-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging iommu/next (60dcc6f0bcf4 Merge branches 'iommu/fixes', 'arm/rockchi=
p', 'arm/exynos' and 'core' into next)
Merging dwmw2-iommu/master (4ed6a540fab8 iommu/vt-d: Fix passthrough mode w=
ith translation-disabled devices)
Merging vfio/next (5a0ff17741c1 vfio-pci: Fix use after free)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (bde1b29420d7 stable: Update documentation to cla=
rify preferred procedure)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (39a8804455fb Linux 4.0)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
Merging dt-rh/for-next (4760597116e3 scripts/dtc: Update to upstream versio=
n 9d3649bd3be245c9)
Merging mailbox/mailbox-for-next (4c0f74bf82e8 mailbox: Enable BCM2835 mail=
box support)
Merging spi/for-next (619e7c8fb241 Merge remote-tracking branches 'spi/topi=
c/sirf' and 'spi/topic/spidev' into spi-next)
Merging tip/auto-latest (982578dabcf0 Merge branch 'timers/core')
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
Merging rcu/rcu/next (2aa14a6919b4 rcu: Provide more diagnostics for stalle=
d GP kthread)
CONFLICT (content): Merge conflict in kernel/rcu/tree_plugin.h
CONFLICT (content): Merge conflict in kernel/rcu/tree.c
CONFLICT (content): Merge conflict in include/linux/rcutree.h
CONFLICT (content): Merge conflict in include/linux/rcupdate.h
Merging kvm/linux-next (3520469d65f2 KVM: export __gfn_to_pfn_memslot, drop=
 gfn_to_pfn_async)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
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
Merging leds/for-next (c04629788f37 leds: add BCM6358 LED driver)
Merging ipmi/for-next (c32e9840e96a ipmi: Add a comment in how messages are=
 delivered from the lower layer)
Merging driver-core/driver-core-next (ec0ccc16a09f module: add core_param_u=
nsafe)
Applying: driver-core: add driver module asynchronous probe support fix
Merging tty/tty-next (fa8cd0f61fe1 serial/amba-pl011: Fix mismerge between =
v4.1-rc4 and tty-next)
CONFLICT (content): Merge conflict in drivers/tty/serial/amba-pl011.c
Merging usb/usb-next (909eacd748b3 Merge 4.1-rc4 into usb-next)
Merging usb-gadget/next (672bfdaa3100 usb: renesas_usbhs: avoid uninitializ=
ed variable use)
Merging usb-serial/usb-next (e26081808eda Linux 4.1-rc4)
Merging staging/staging-next (61e331202f1a Merge tag 'iio-for-v4.2b' of git=
://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (modify/delete): drivers/staging/media/dt3155v4l/dt3155v4l.c delet=
ed in HEAD and modified in staging/staging-next. Version staging/staging-ne=
xt of drivers/staging/media/dt3155v4l/dt3155v4l.c left in tree.
$ git rm -f drivers/staging/media/dt3155v4l/dt3155v4l.c
Merging char-misc/char-misc-next (f5da7cb24b78 coresight: etb10: Fix check =
for bogus buffer depth)
Merging extcon/extcon-next (046050f6e623 extcon: Update the prototype of ex=
tcon_register_notifier() with enum extcon)
CONFLICT (content): Merge conflict in include/linux/mfd/axp20x.h
Merging kdbus/kdbus (9fb9cd0f4434 kdbus: avoid the use of struct timespec)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (8ab456ac3697 cgroup: switch to unsigned long for b=
itmasks)
Merging scsi/for-next (18308d4be6ae Merge branch 'misc' into for-next)
Merging target-updates/for-next (85e57c7f936f target: Drop left-over se_lun=
->lun_status)
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
Merging userns/for-next (4159a971ed49 mnt: Update fs_fully_visible to test =
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
Applying: sysfs: void functions do not return values
Applying: power: axp288_charger: fix for AIP change
Merging akpm-current/current (4e5444138874 scsi-resolve-sg-buffer-const-nes=
s-issue-fix)
CONFLICT (content): Merge conflict in drivers/staging/android/lowmemorykill=
er.c
CONFLICT (content): Merge conflict in arch/x86/kernel/machine_kexec_64.c
Applying: userfaultfd: activate syscall fix
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
Merging akpm/master (efa4053e871b drivers/w1/w1_int.c: call put_device if d=
evice_register fails)

--Sig_/OC7gz8nvg4XfjCBPrIe5jVG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYw9fAAoJEMDTa8Ir7ZwVwvkQAJC3SdxcDbCKFjRpBnUJcAR2
AnWaXt8V3Q+Maq8MD9IuKbm5HKhwP0ykbqwf5Su4hU5XJKDVFwLNuwjYkpvcD37F
fNC7BY8knc1mCX8/s+PVWsktdINtembyS9hb1rzRTqaTwUqlE3rWIuUNoTGqMLja
GrQsTb/UsMivaI1/f0Bpw7GZbIFN6FVq/18eVNpwnIEpbFa0zYQ//5fe515ngL2v
4uRoThzfoH11/Iq5mZXXNdA3oA3c5uZL36vdGbZub2iK1pTZTXB6r4XSOZNabfmQ
pog1K5VmRIu/0I6duod1WoKlbF7LXzcoPDQfOi42BofFtOWmIdS6erMnjl4Go/JW
j7kJM5CZKRm7iLBetSQ4kF5/OcwxR3DcFDN4IamG0diVis/9d7pI+rWw8gdZXjdi
nz+r/xWK3sa7/GlVUdmJzfGCHsOtKD5tpddulf8WPvrq4xIEB7wHLys4o99mHex2
Kn2VuulP9mloJtjq4zKHgM028g+YceOBxaGZMjLlvLlmKqtv/FF5417r9xkt9oJK
4afAAcFdWhH/43wCPcFr095yZJtEhnzLlKqJaO1u85CSQQZYgH9AMF8hswKIfEo1
cW5LH/Cmmw5SF1equSbUfao92NVKUcZcz7SoCooVE4CgFLDrCwVqU8ylJfxx3jF5
A7aeBeKpeciFsuCnIPVw
=sN8S
-----END PGP SIGNATURE-----

--Sig_/OC7gz8nvg4XfjCBPrIe5jVG--
