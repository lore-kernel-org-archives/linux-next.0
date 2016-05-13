From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 13
Date: Fri, 13 May 2016 15:44:22 +1000
Message-ID: <20160513154422.43fb10fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34348 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751160AbcEMFo0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 May 2016 01:44:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,

Changes since 20160512:

Dropped tree: rdma-leon (bad build and conflicts)

The rdma-leon tree gained a build failure so I dropped it for today.

The staging tree gained a build failure for which I applied a merge
fix patch.

The pinctrl tree lost its build failure.

Non-merge commits (relative to Linus' tree): 9975
 8496 files changed, 436478 insertions(+), 184404 deletions(-)

-----------------------------------------------------------------------=
-----

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pul=
l"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc and an allmodconfig (with
CONFIG_BUILD_DOCSRC=3Dn) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(this fails its final link) and pseries_le_defconfig and i386, sparc
and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 235 trees (counting Linus' and 35 trees of patch=
es
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to a=
dd
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (02c9c0e9b9d9 Merge tag 'keys-fixes-20160512' of =
git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging fixes/master (b507146bb6b9 Merge branch 'linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and =
xz on module install)
Merging arc-current/for-curr (44549e8f5eea Linux 4.6-rc7)
Merging arm-current/fixes (ec953b70f368 ARM: 8573/1: domain: move {set,=
get}_domain under config guard)
Merging m68k-current/for-linus (7b8ba82ad4ad m68k/defconfig: Update def=
configs for v4.6-rc2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_c=
ached build errors)
Merging powerpc-fixes/fixes (b4c112114aab powerpc: Fix bad inline asm c=
onstraint in create_zero_mask())
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (33656a1f2ee5 Merge branch 'for_linus' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)
Merging net/master (2073dbad172f net: mvneta: bm: fix dependencies agai=
n)
Merging ipsec/master (d6af1a31cc72 vti: Add pmtu handling to vti_xmit.)
Merging ipvs/master (f28f20da704d Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/davem/net)
Merging wireless-drivers/master (cbbba30f1ac9 Merge tag 'iwlwifi-for-ka=
lle-2016-05-04' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlw=
ifi/iwlwifi-fixes)
Merging mac80211/master (e6436be21e77 mac80211: fix statistics leak if =
dev_alloc_name() fails)
Merging sound-current/for-linus (84add303ef95 ALSA: usb-audio: Yet anot=
her Phoneix Audio device quirk)
Merging pci-current/for-linus (9a2a5a638f8e PCI: Do not treat EPROBE_DE=
=46ER as device attach failure)
Merging driver-core.current/driver-core-linus (c3b46c73264b Linux 4.6-r=
c4)
Merging tty.current/tty-linus (44549e8f5eea Linux 4.6-rc7)
Merging usb.current/usb-linus (44549e8f5eea Linux 4.6-rc7)
Merging usb-gadget-fixes/fixes (38740a5b87d5 usb: gadget: f_fs: Fix use=
-after-free)
Merging usb-serial-fixes/usb-linus (74d2a91aec97 USB: serial: option: a=
dd even more ZTE device ids)
Merging usb-chipidea-fixes/ci-for-usb-stable (d144dfea8af7 usb: chipide=
a: otg: change workqueue ci_otg as freezable)
Merging staging.current/staging-linus (44549e8f5eea Linux 4.6-rc7)
Merging char-misc.current/char-misc-linus (44549e8f5eea Linux 4.6-rc7)
Merging input-current/for-linus (c52c545ead97 Input: twl6040-vibra - fi=
x DT node memory management)
Merging crypto-current/master (df27b26f04ed crypto: testmgr - Use kmall=
oc memory for RSA input)
Merging ide/master (1993b176a822 Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: F=
ix test for PPC_PSERIES)
Merging rr-fixes/fixes (8244062ef1e5 modules: fix longstanding /proc/ka=
llsyms vs module insertion race.)
Merging vfio-fixes/for-linus (8160c4e45582 vfio: fix ioctl error handli=
ng)
Merging kselftest-fixes/fixes (505ce68c6da3 selftest/seccomp: Fix the s=
eccomp(2) signature)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pw=
m: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch=
 tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max778=
43_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (2700818ac9f9 drm/i915: Ba=
il out of pipe config compute loop on LPT)
Merging asm-generic/master (b0da6d44157a asm-generic: Drop renameat sys=
call from default list)
Merging arc/for-next (966657890e87 ARC: Add eznps platform to Kconfig a=
nd Makefile)
Merging arm/for-next (b6810489fa29 Merge branch 'devel-stable' into for=
-next)
Merging arm-perf/for-next/perf (4ba2578fa7b5 arm64: perf: don't expose =
CHAIN event in sysfs)
Merging arm-soc/for-next (83e0a1672eb5 Merge branch 'next/defconfig' in=
to for-next)
Merging at91/at91-next (5a0d7c6a48ae Merge branch 'at91-4.7-defconfig' =
into at91-next)
Merging bcm2835-dt/bcm2835-dt-next (896ad420db8d dt/bindings: bcm2835: =
correct description for DMA-int)
Merging bcm2835-soc/bcm2835-soc-next (92e963f50fc7 Linux 4.5-rc1)
Merging bcm2835-drivers/bcm2835-drivers-next (92e963f50fc7 Linux 4.5-rc=
1)
Merging bcm2835-defconfig/bcm2835-defconfig-next (3652bb35abf6 ARM: bcm=
2835: Enable NFS root support.)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes=
' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,de=
vice compatible strings)
Merging imx-mxs/for-next (63b44471754b Merge branch 'imx/defconfig64' i=
nto for-next)
Merging keystone/next (02e15d234006 Merge branch 'for_4.7/kesytone' int=
o next)
Merging mvebu/for-next (01316cded75b Merge branch 'mvebu/defconfig' int=
o mvebu/for-next)
Merging omap/for-next (5c66191b5c76 Merge branch 'omap-for-v4.7/dt' int=
o for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _id=
le() hwmod state sanity check sequence)
Merging qcom/for-next (100b83d52f51 ARM: dts: msm8974: Add SCM firmware=
 node)
Merging renesas/next (e5c640c6f9cc Merge branches 'heads/arm64-defconfi=
g-for-v4.7', 'heads/arm64-dt-pm-domain-for-v4.7', 'heads/dt-for-v4.7' a=
nd 'heads/pci-defconfig-for-v4.7' into next)
Merging rockchip/for-next (f6ec4147adc3 Merge branch 'v4.7-clk/next' in=
to for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (92e963f50fc7 Linux 4.5-rc1)
Merging samsung-krzk/for-next (05e8e9a8696c Merge branch 'fixes' into f=
or-next)
Merging tegra/for-next (5c282bc9d0a3 Merge branch for-4.7/defconfig int=
o for-next)
Merging arm64/for-next/core (e6d9a5254333 arm64: do not enforce strict =
16 byte alignment to stack pointer)
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
Merging blackfin/for-linus (391e74a51ea2 eth: bf609 eth clock: add pclk=
 clock for stmmac driver probe)
CONFLICT (content): Merge conflict in arch/blackfin/mach-common/pm.c
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h head=
er)
Merging cris/for-next (f9f3f864b5e8 cris: Fix section mismatches in arc=
hitecture startup code)
Merging h8300/h8300-next (8cad489261c5 h8300: switch EARLYCON)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c =
compile error")
Merging ia64/next (787ca32dc704 ia64/unaligned: Silence another GCC war=
ning about an uninitialised variable)
Merging m68k/for-next (9a6462763b17 m68k/mvme16x: Include generic <linu=
x/rtc.h>)
Merging m68knommu/for-next (44156affd184 m68k: change m68knommu maintai=
ner email address)
Merging metag/for-next (096a8b6d5e7a metag: Fix atomic_*_return inline =
asm constraints)
Merging microblaze/next (10f4b26deb41 microblaze/PCI: export isa_io_bas=
e to fix link errors)
Merging mips/mips-for-linux-next (9ca0b767b011 Merge branch '4.6-fixes'=
 into mips-for-linux-next)
Merging nios2/for-next (a8950e49bd24 nios2: memset: use the right const=
raint modifier for the %4 output operand)
Merging parisc-hd/for-next (695499920489 parisc: Add native high-resolu=
tion sched_clock() implementation)
Merging powerpc/next (1d4e89cf0a4e powerpc/powernv/npu: Add PE to PHB's=
 list)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/prom.c
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (fba4e9f9898a powerpc/fsl/dts: Add "jedec,spi-nor" fla=
sh compatible)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the ma=
naged version of kzalloc)
Merging s390/features (c53db5222b92 s390/vmem: remove unused function p=
arameter)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (4ef00aa30a3f tile: sort the "select" lines in the =
TILE/TILEGX configs)
Merging uml/linux-next (ad32a1f3c36b um: use %lx format specifiers for =
unsigned longs)
Merging unicore32/unicore32 (c83d8b2fc986 unicore32: mm: Add missing pa=
rameter to arch_vma_access_permitted)
Merging xtensa/for_next (9da8320bb977 xtensa: add test_kc705_hifi varia=
nt)
Merging btrfs/next (bb7ab3b92e46 btrfs: Fix misspellings in comments.)
Merging btrfs-kdave/for-next (a3a7fdf24a89 Merge branch 'for-next-next-=
4.7-20160512' into for-next-20160512)
Merging ceph/master (d3767f0faeda rbd: report unsupported features to s=
yslog)
Merging cifs/for-next (004482ae9e6d Update cifs.ko version to 2.09)
Merging configfs/for-next (96c22a329351 configfs: fix CONFIGFS_BIN_ATTR=
_[RW]O definitions)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before des=
troy functions)
Merging ext3/for_next (2a28900be206 udf: Export superblock magic to use=
rspace)
Merging ext4/dev (816cd71b0c72 ext4: remove unmeetable inconsisteny che=
ck from ext4_find_extent())
Merging f2fs/dev (90e24cefa03c ext4 crypto: migrate into vfs's crypto e=
ngine)
CONFLICT (content): Merge conflict in fs/ext4/ext4.h
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's =
primary_index if registering failed)
Merging fuse/for-next (4441f63ab7e5 fuse: update mailing list in MAINTA=
INERS)
Merging gfs2/for-next (68cd4ce2caf2 GFS2: Refactor gfs2_remove_from_jou=
rnal)
Merging jfs/jfs-next (6ed71e9819ac jfs: Coalesce some formats)
Merging nfs/linux-next (44549e8f5eea Linux 4.6-rc7)
Merging nfsd/nfsd-next (ac503e4a309a nfsd: use short read as well as i_=
size to set eof)
Merging orangefs/for-next (e56f49814250 orangefs: remove unused variabl=
e)
Merging overlayfs/overlayfs-next (bbb5d7fb1bb8 ovl: override creds with=
 the ones from the superblock mounter)
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather tha=
n spinlock)
Merging ubifs/linux-next (c27cb97218b3 ubifs: Remove unused header)
Merging xfs/for-next (d8bdd04e309b Merge branch 'xfs-4.7-misc-fixes' in=
to for-next)
Merging file-locks/linux-next (5af9c2e19da6 Merge branch 'akpm' (patche=
s from Andrew))
Merging vfs/for-next (e09c58296624 Merge branch 'work.lookups' into for=
-next)
CONFLICT (content): Merge conflict in fs/f2fs/data.c
Merging pci/next (d9322d226f91 Merge branches 'pci/dpc', 'pci/resource'=
 and 'pci/thunderbolt' into next)
Applying: iommu/amd: fix up for aliases API change
Merging hid/for-next (185a9cac5b1e Merge branch 'for-4.6/upstream-fixes=
' into for-next)
Merging i2c/i2c/for-next (95174f8a958c Merge branch 'i2c/for-4.7' into =
i2c/for-next)
Merging jdelvare-hwmon/master (f02de116250d Documentation/hwmon: Update=
 links in max34440)
Merging dmi/master (c3db05ecf8ac firmware: dmi_scan: Save SMBIOS Type 9=
 System Slots)
Merging hwmon-staging/hwmon-next (71a9c23246fe hwmon: (it87) Add suppor=
t for IT8628E)
Merging v4l-dvb/master (73dfb701d254 Merge branch 'v4l_for_linus' into =
to_next)
Merging pm/linux-next (aff0d48680f1 Merge branch 'pm-cpufreq' into linu=
x-next)
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/Makefile
CONFLICT (content): Merge conflict in MAINTAINERS
Merging idle/next (f55532a0c0b8 Linux 4.6-rc1)
Merging thermal/next (f1ba9eb85b5e thermal: int340x: processor_thermal:=
 support acpi notification)
Merging thermal-soc/next (ddc8fdc6e2f0 Merge branch 'work-fixes' into w=
ork-next)
Merging ieee1394/for-next (384fbb96f926 firewire: nosy: Replace timeval=
 with timespec64)
Merging dlm/next (82c7d823cc31 dlm: config: Fix ENOMEM failures in make=
_cluster())
Merging swiotlb/linux-next (386744425e35 swiotlb: Make linux/swiotlb.h =
standalone includible)
Merging slave-dma/next (7a9aa46f6f63 Merge branch 'topic/xilinx' into n=
ext)
Merging net-next/master (e7142c341c9c tipc: eliminate risk of double li=
nk_up events)
CONFLICT (content): Merge conflict in net/netfilter/nf_conntrack_core.c
CONFLICT (content): Merge conflict in net/ipv4/ip_gre.c
CONFLICT (content): Merge conflict in include/linux/soc/qcom/smd.h
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwif=
i/mvm/tx.c
Applying: soc: qcom: smd: fix for Qualcomm IPC router and callback API =
change
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic count=
er on inner mode error)
Merging ipvs-next/master (698e2a8dca98 ipvs: make drop_entry protection=
 effective for SIP-pe)
Merging wireless-drivers-next/master (52776a700b53 Merge ath-next from =
ath.git)
Merging bluetooth/master (908578e7d5f6 Merge branch 'sh_eth-sw-reset')
Merging mac80211-next/master (4f45bb3e8a8f mac80211_hwsim: Allow managi=
ng radios from non-initial namespaces)
Merging rdma/for-next (94d7f1a255db Merge branches 'hfi1' and 'iw_cxgb4=
' into k.o/for-4.7)
Merging rdma-leon/rdma-next (bd62b6b2deb3 Merge branch 'topic/srp' into=
 rdma-next)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/i40iw/i40iw=
_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/cxgb4/cm.c
$ git reset --hard HEAD^
Merging rdma-leon-test/testing/rdma-next (d9233ad6ef2f Merge branch 'to=
pic/srp' into testing/rdma-next)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/i40iw/i40iw=
_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/cxgb4/cm.c
Merging mtd/master (20c07a5bf094 mtd: nand: Drop mtd.owner requirement =
in nand_scan)
Merging l2-mtd/master (e5366a266a8c mtd: spi-nor: support GigaDevice gd=
25lq64c)
Merging nand/nand/next (666b65683dad mtd: brcmnand: respect ECC algorit=
hm set by NAND subsystem)
Merging crypto/master (e930c765ca5c crypto: caam - fix caam_jr_alloc() =
ret code)
Merging drm/drm-next (95306975e9dd Merge tag 'drm/tegra/for-4.7-rc1' of=
 git://anongit.freedesktop.org/tegra/linux into drm-next)
Merging drm-panel/drm/panel/for-next (227e4f4079e1 drm/panel: simple: A=
dd support for TPK U.S.A. LLC Fusion 7" and 10.1" panels)
Merging drm-intel/for-linux-next (5b4fd5b1111b drm/i915: Update DRIVER_=
DATE to 20160425)
Merging drm-tegra/drm/tegra/for-next (057eab2013ec MAINTAINERS: Remove =
Terje Bergstr=C3=B6m as Tegra DRM maintainer)
Merging drm-misc/topic/drm-misc (9ecb549867d7 drm/atomic: Add drm_atomi=
c_helper_best_encoder())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-=
linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2b669875332f drm/msm: Drop load/unload drm_dr=
iver ops)
Merging hdlcd/for-upstream/hdlcd (69c2565a3cca drm: ARM HDLCD - fix an =
error code)
Merging drm-vc4/drm-vc4-next (efea172891fc drm/vc4: Return -EBUSY if th=
ere's already a pending flip event.)
Merging sunxi/sunxi/for-next (ed490b3ebfa4 Merge branches 'sunxi/drm-fi=
xes-for-4.7' and 'sunxi/dt-for-4.7' into sunxi/for-next)
Merging kbuild/for-next (d99c8a9355cf Merge branch 'kbuild/kbuild' into=
 kbuild/for-next)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace r=
epeat count after "tristate")
Merging regmap/for-next (8eabbbb9c0c9 Merge remote-tracking branches 'r=
egmap/topic/doc' and 'regmap/topic/flat' into regmap-next)
Merging sound/for-next (639db5961657 ALSA: au88x0: Fix zero clear of st=
ream->resources)
Merging sound-asoc/for-next (cf65f00f8a97 Merge remote-tracking branche=
s 'asoc/topic/twl6040', 'asoc/topic/wm8960' and 'asoc/topic/wm8962' int=
o asoc-next)
Merging modules/modules-next (e2d1248432c4 module: Disable MODULE_FORCE=
_LOAD when MODULE_SIG_FORCE is enabled)
Merging input/next (d96caf8c33ca Input: rotary-encoder - fix bare use o=
f 'unsigned')
Merging block/for-next (133582264100 Merge branch 'for-4.7/drivers' int=
o for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
Merging lightnvm/for-next (2a65aee4011b lightnvm: reserved space calcul=
ation incorrect)
Merging device-mapper/for-next (bf4ae7b44e64 dm thin: unroll issue_disc=
ard() to create longer discard bio chains)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic=
 when handling anonymous cards)
Merging mmc-uh/next (9140be54ab6e mmc: mmc: Fix partition switch timeou=
t for some eMMCs)
Merging md/for-next (1fa9a1ad0a9d md-cluster: check the return value of=
 process_recvd_msg)
Merging mfd/for-mfd-next (68b21094ef9b mfd: ab8500-debugfs: Trivial fix=
 of spelling mistake on "between")
Merging backlight/for-backlight-next (60d613d6aef4 backlight: pwm_bl: F=
ree PWM requested by legacy API on error path)
Merging battery/master (4a99fa06a8ca sbs-battery: fix power status when=
 battery charging near dry)
Merging omap_dss2/for-next (ffe1b6c453ef video: AMBA CLCD: Remove unnce=
ssary include in amba-clcd.c)
Merging regulator/for-next (d4b122b5953e Merge remote-tracking branches=
 'regulator/topic/tps6524x' and 'regulator/topic/twl' into regulator-ne=
xt)
Merging security/next (a6926cc989eb Merge branch 'stable-4.7' of git://=
git.infradead.org/users/pcmoore/selinux into next)
CONFLICT (content): Merge conflict in crypto/asymmetric_keys/pkcs7_pars=
er.c
Merging integrity/next (05d1a717ec04 ima: add support for creating file=
s using the mknodat syscall)
Merging keys/keys-next (75aeddd12f20 MAINTAINERS: Update keyrings recor=
d and add asymmetric keys record)
Merging selinux/next (c2316dbf1242 selinux: apply execstack check on th=
read stacks)
Merging tpmdd/next (e8f2f45a4402 tpm: Fix suspend regression)
Merging watchdog/master (44549e8f5eea Linux 4.6-rc7)
Merging iommu/next (6c0b43df74f9 Merge branches 'arm/io-pgtable', 'arm/=
rockchip', 'arm/omap', 'x86/vt-d', 'ppc/pamu', 'core' and 'x86/amd' int=
o next)
Merging dwmw2-iommu/master (22e2f9fa63b0 iommu/vt-d: Use per-cpu IOVA c=
aching)
Merging vfio/next (5ed4aba1265f vfio_iommu_spapr_tce: Remove unneeded i=
ommu_group_get_iommudata)
Merging jc_docs/docs-next (2fd872bd84b3 Doc: correct the location of sy=
srq.c)
CONFLICT (content): Merge conflict in samples/Makefile
Merging trivial/for-next (52bbe141f37f gitignore: fix wording)
Merging audit/next (188e3c5cd2b6 tty: provide tty_name() even without C=
ONFIG_TTY)
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_d=
esc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (b6010770f332 drivers/of: Export of_detach_node(=
))
CONFLICT (content): Merge conflict in drivers/iommu/arm-smmu.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings=
/gpu/nvidia,gk20a.txt
Merging mailbox/mailbox-for-next (c430cf376fee mailbox: Fix devm_iorema=
p_resource error detection code)
Merging spi/for-next (3072e1e712df Merge remote-tracking branches 'spi/=
topic/st-ssc4', 'spi/topic/xlp' and 'spi/topic/zynqmp' into spi-next)
Merging tip/auto-latest (0bf7ee3ef4a7 Merge branch 'perf/urgent')
CONFLICT (content): Merge conflict in drivers/irqchip/irq-gic.c
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
CONFLICT (content): Merge conflict in drivers/firmware/efi/arm-init.c
CONFLICT (content): Merge conflict in drivers/cpufreq/longhaul.c
Merging clockevents/clockevents/next (cee77c2c5b57 clocksource/drivers/=
tango-xtal: Fix incorrect test)
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM wid=
th on Ivy Bridge and Haswell)
Merging edac-amd/for-next (3f37a36b6282 EDAC, amd64_edac: Drop pci_regi=
ster_driver() use)
Merging irqchip/irqchip/for-next (a66ce4b7d9d2 Merge branch 'irqchip/mv=
ebu' into irqchip/for-next)
Merging ftrace/for-next (0fc1b09ff1ff tracing: Use temp buffer when fil=
tering events)
Merging rcu/rcu/next (2ba259ab67a8 fixup! rcu: Make call_rcu_tasks() to=
lerate first call with irqs disabled)
Merging kvm/linux-next (14717e203186 kvm: Conditionally register IRQ by=
pass consumer)
CONFLICT (content): Merge conflict in drivers/irqchip/irq-gic.c
CONFLICT (content): Merge conflict in drivers/irqchip/irq-gic-v3.c
Merging kvm-arm/next (064850532444 kvm: arm64: Enable hardware updates =
of the Access Flag for Stage 2 page tables)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct wi=
dth in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (b1a4286b8f33 KVM: PPC: Book3S HV: =
Re-enable XICS fast path for irqfd-generated interrupts)
Merging kvms390/next (60a37709ce60 KVM: s390: Populate mask of non-hype=
rvisor managed facility bits)
Merging xen-tip/linux-next (51c2a7526e54 xen/gntdev: reduce copy batch =
size to 16)
CONFLICT (content): Merge conflict in drivers/xen/efi.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/setup.c
Applying: xen: efi: merge fix patch
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM=
 which is stale definition)
Merging workqueues/for-next (f1e89a8f3358 Merge branch 'for-4.6-fixes' =
into for-next)
Merging drivers-x86/for-next (9a73a6895fc5 surfacepro3_button: Add a wa=
rning when switching to tablet mode)
Merging chrome-platform/for-next (9e96aa70e9ac platform/chrome: chromeo=
s_laptop - Add Elan touchpad for Wolf)
Merging hsi/for-next (c2f90a465df7 HSI: omap-ssi: move omap_ssi_port_up=
date_fclk)
Merging leds/for-next (80d6737b27bb leds: gpio: Support the "panic-indi=
cator" firmware property)
Merging ipmi/for-next (a1b4e31bfabb IPMI: reserve memio regions separat=
ely)
Merging driver-core/driver-core-next (c6e360a0d9d2 Revert "base: dd: do=
n't remove driver_data in -EPROBE_DEFER case")
Merging tty/tty-next (d20bb59af646 MAINTAINERS: 8250: remove website re=
ference)
CONFLICT (content): Merge conflict in include/uapi/linux/serial_core.h
CONFLICT (content): Merge conflict in drivers/tty/serial/Makefile
Merging usb/usb-next (13069bd94d55 usb: Remove unnecessary space before=
 operator ','.)
Merging usb-gadget/next (2a58f9c12bb3 usb: dwc3: gadget: disable automa=
tic calculation of ACK TP NUMP)
Merging usb-serial/usb-next (b923c6c62981 USB: serial: ti_usb_3410_5052=
: add MOXA UPORT 11x0 support)
Merging usb-chipidea-next/ci-for-usb-next (764763f0a0c8 doc: usb: chipi=
dea: update the doc for OTG FSM)
Merging staging/staging-next (ffc83a79b44e Staging: emxx_udc: emxx_udc:=
 fixed coding style issue)
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/lli=
te/rw26.c
Applying: staging: lustre: o2iblnd: fix for ib_map_mr_sg() API changes
Merging char-misc/char-misc-next (725d0123dfff Merge 4.6-rc7 into char-=
misc-testing)
Merging extcon/extcon-next (453fc627c7b5 extcon: usb-gpio: add support =
for ACPI gpio interface)
Merging cgroup/for-next (a6b18f07bc86 Merge branch 'for-4.6-fixes' into=
 for-next)
Merging scsi/for-next (02714f2c73a6 Merge branch 'misc' into for-next)
Merging target-updates/for-next (54a5e73f4d6e tcm_qla2xxx Add SCSI comm=
and jammer/discard capability)
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig=
 and Makefile)
Merging libata/for-next (f0d4e2af15c1 Merge branch 'for-4.7-dw' into fo=
r-next)
Merging pinctrl/for-next (58d73d264a02 Merge branch 'devel' into for-ne=
xt)
Merging vhost/linux-next (e00f7bd22129 virtio: Silence uninitialized va=
riable warning)
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODUL=
E_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (0259cd1b6496 Merge remote-tracking branches 're=
moteproc/rpmsg-next' and 'remoteproc/rproc-next' into for-next)
Merging gpio/for-next (d30a2b47d4c2 MIPS: do away with ARCH_[WANT_OPTIO=
NAL|REQUIRE]_GPIOLIB)
CONFLICT (content): Merge conflict in arch/mips/Kconfig
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (4295ada2fe87 Merge branch 'for-4.7/pwm-atomic' in=
to for-next)
Merging dma-buf/for-next (12566cc35d0e Merge tag 'pci-v4.6-fixes-2' of =
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FO=
WNER in userns)
Merging ktest/for-next (f55532a0c0b8 Linux 4.6-rc1)
Merging clk/clk-next (9ffee1c4be7c clk: qcom: mmcc-8996: Remove clocks =
that should be controlled by RPM)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (f55532a0c0b8 Linux 4.6-rc1)
Merging y2038/y2038 (4b277763c5b3 vfs: Add support to document max and =
min inode times)
Merging luto-misc/next (afd2ff9b7e1b Linux 4.4)
Merging borntraeger/linux-next (b47d6130232c KVM: halt_polling: provide=
 a way to qualify wakeups during poll)
Merging livepatching/for-next (6d9122078097 Merge branch 'for-4.7/core'=
 into for-next)
Merging coresight/next (545a6c33f4a8 coresight: Handle build path error=
)
Merging rtc/rtc-next (854ec813cc23 rtc: rename so the tps6586x-rtc modu=
le can be autoloaded at boot)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb=
 in regmap_field)
Merging nvdimm/libnvdimm-for-next (e53f09825156 Merge branch 'for-4.7/a=
cpi6.1' into libnvdimm-for-next)
Merging akpm-current/current (a758ba862244 ipc/msg.c: use freezable blo=
cking call)
CONFLICT (content): Merge conflict in include/linux/efi.h
CONFLICT (content): Merge conflict in arch/tile/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/book3s/6=
4/pgtable.h
CONFLICT (content): Merge conflict in arch/mips/kernel/process.c
CONFLICT (content): Merge conflict in arch/mips/Kconfig
CONFLICT (content): Merge conflict in arch/cris/Kconfig
Applying: mm-rename-_count-field-of-the-struct-page-to-_refcount-fix6
$ git checkout -b akpm remotes/origin/akpm/master
Applying: mm: make optimistic check for swapin readahead fix
Applying: drivers/net/wireless/intel/iwlwifi/dvm/calib.c: simplfy min()=
 expression
Applying: mm: make mmap_sem for write waits killable for mm syscalls
Applying: mm: make vm_mmap killable
Applying: mm: make vm_munmap killable
Applying: mm, aout: handle vm_brk failures
Applying: mm, elf: handle vm_brk error
Applying: mm: make vm_brk killable
Applying: mm, proc: make clear_refs killable
Applying: mm, fork: make dup_mmap wait for mmap_sem for write killable
Applying: ipc, shm: make shmem attach/detach wait for mmap_sem killable
Applying: vdso: make arch_setup_additional_pages wait for mmap_sem for =
write killable
Applying: coredump: make coredump_wait wait for mmap_sem for write kill=
able
Applying: aio: make aio_setup_ring killable
Applying: exec: make exec path waiting for mmap_sem killable
Applying: prctl: make PR_SET_THP_DISABLE wait for mmap_sem killable
Applying: uprobes: wait for mmap_sem for write killable
Applying: drm/i915: make i915_gem_mmap_ioctl wait for mmap_sem killable
Applying: drm/radeon: make radeon_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: make amdgpu_mn_get wait for mmap_sem killable
Applying: drm/amdgpu: use ERR_PTR() to return from amdgpu_mn_get
Applying: kgdb: depends on VT
Merging akpm/master (35b44485a382 kgdb: depends on VT)
