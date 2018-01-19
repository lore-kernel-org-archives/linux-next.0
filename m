From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Jan 19
Date: Fri, 19 Jan 2018 17:55:19 +1100
Message-ID: <20180119175519.1dce79c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P1XH2HDqc6K8b57vfYGe9bA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51837 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753841AbeASGzW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jan 2018 01:55:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--Sig_/P1XH2HDqc6K8b57vfYGe9bA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will probably be very few, if any, releases next week as LCA
is on (unfortunate clash with the merge window).

Changes since 20180118:

The powerpc tree gained a build failure due to an interaction with Linus'
tree, so I applied a merge fix patch.  It gained another for which I
applied a supplied fix patch.

The f2fs tree gained a build failure due to an interaction with the
btrfs tree for which I reverted a commit.

The net-next tree gained a conflict against the net tree.

Non-merge commits (relative to Linus' tree): 9833
 9793 files changed, 406830 insertions(+), 263432 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 256 trees (counting Linus' and 44 trees of bug
fix patches pending for the current merge release).

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
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (dda3e15231b3 Merge branch 'fixes' of git://git.armli=
nux.org.uk/~rmk/linux-arm)
Merging fixes/master (820bf5c419e4 Merge tag 'scsi-fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging kbuild-current/fixes (36c1681678b5 genksyms: drop *.hash.c from .gi=
tignore)
Merging arc-current/for-curr (8ff3afc159f2 ARC: Enable fatal signals on boo=
t for dev platforms)
Merging arm-current/fixes (091f02483df7 ARM: net: bpf: clarify tail_call in=
dex)
Merging m68k-current/for-linus (5e387199c17c m68k/defconfig: Update defconf=
igs for v4.14-rc7)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (1b689a95ce74 powerpc/pseries: include linux/ty=
pes.h in asm/hvcall.h)
Merging sparc/master (59585b4be9ae sparc64: repair calling incorrect hweigh=
t function from stubs)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (b200bfd6112a fm10k: mark PM functions as __maybe_unused)
Merging bpf/master (7155f8f39157 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (ad9294dbc227 bpf: fix cls_bpf on filter replace)
Merging netfilter/master (889c604fd0b5 netfilter: x_tables: fix int overflo=
w in xt_alloc_table_info())
Merging ipvs/master (f7fb77fc1235 netfilter: nft_compat: check extension ho=
ok mask only if set)
Merging wireless-drivers/master (cc124d5cc8d8 brcmfmac: fix CLM load error =
for legacy chips when user helper is enabled)
Merging mac80211/master (59b179b48ce2 cfg80211: check dev_set_name() return=
 value)
Merging rdma-fixes/for-rc (ae59c3f0b6cf RDMA/mlx5: Fix out-of-bound access =
while querying AH)
Merging sound-current/for-linus (b3defb791b26 ALSA: seq: Make ioctls race-f=
ree)
Merging pci-current/for-linus (d6c1efecd1e1 x86/PCI: Enable AMD 64-bit wind=
ow on resume)
Merging driver-core.current/driver-core-linus (30a7acd57389 Linux 4.15-rc6)
Merging tty.current/tty-linus (30a7acd57389 Linux 4.15-rc6)
Merging usb.current/usb-linus (a8750ddca918 Linux 4.15-rc8)
Merging usb-gadget-fixes/fixes (b2cd1df66037 Linux 4.15-rc7)
Merging usb-serial-fixes/usb-linus (d14ac576d10f USB: serial: cp210x: add n=
ew device ID ELV ALC 8xxx)
Merging usb-chipidea-fixes/ci-for-usb-stable (964728f9f407 USB: chipidea: m=
sm: fix ulpi-node lookup)
Merging phy/fixes (2b88212c4cc6 phy: rcar-gen3-usb2: select USB_COMMON)
Merging staging.current/staging-linus (a8750ddca918 Linux 4.15-rc8)
Merging char-misc.current/char-misc-linus (a8750ddca918 Linux 4.15-rc8)
Merging input-current/for-linus (55edde9fff1a Input: synaptics-rmi4 - preve=
nt UAF reported by KASAN)
Merging crypto-current/master (9a00674213a3 crypto: algapi - fix NULL deref=
erence in crypto_remove_spawns())
Merging ide/master (0c86a6bd85ff Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging vfio-fixes/for-linus (563b5cbe334e iommu/arm-smmu-v3: Cope with dup=
licated Stream IDs)
Merging kselftest-fixes/fixes (ae64f9bd1d36 Linux 4.15-rc2)
Merging backlight-fixes/for-backlight-fixes (8ff5cbc6e3c5 backlight: as3711=
_bl: fix device-tree node leaks)
Merging nand-fixes/nand/fixes (ee02f73e04c0 mtd: nand: atmel: Fix EDO mode =
check)
Merging spi-nor-fixes/spi-nor/fixes (10a6a6975691 Revert "dt-bindings: mtd:=
 add sst25wf040b and en25s64 to sip-nor list")
Merging mfd-fixes/for-mfd-fixes (107b7d9fa94c mfd: rtsx: Release IRQ during=
 shutdown)
Merging v4l-dvb-fixes/fixes (781b045baefd media: imx274: Fix error handling=
, add MAINTAINERS entry)
Merging reset-fixes/reset/fixes (f450f28e70a2 reset: socfpga: fix for 64-bi=
t compilation)
Merging mips-fixes/mips-fixes (7f6a6847c3fd MIPS: ralink: Fix platform_get_=
irq's error checking)
Merging kvm-fixes/master (37b95951c58f KVM/x86: Fix wrong macro references =
of X86_CR0_PG_BIT and X86_CR4_PAE_BIT in kvm_valid_sregs())
Merging kvms390-fixes/master (c2cf265d8608 KVM: s390: prevent buffer overru=
n on memory hotplug during migration)
Merging drm-intel-fixes/for-linux-next-fixes (4488496d5820 drm/i915: Fix de=
adlock in i830_disable_pipe())
Merging drm-misc-fixes/for-linux-next-fixes (17b11b76b87a drm/vc4: Fix NULL=
 pointer dereference in vc4_save_hang_state())
Merging kbuild/for-next (fbc7a35b3d40 Merge branches 'kconfig' and 'misc' i=
nto for-next)
Merging uuid/for-next (c0020756315e efi: switch to use new generic UUID API)
Merging dma-mapping/for-next (0d8488ac1b68 arm64: use swiotlb_alloc and swi=
otlb_free)
Merging asm-generic/master (a351e9b9fc24 Linux 4.11)
Merging arc/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging arm/for-next (3d7352b79292 Merge branches 'fixes', 'misc', 'sa1111'=
 and 'sa1100-for-next' into for-next)
Merging arm-perf/for-next/perf (7520fa99246d perf: ARM DynamIQ Shared Unit =
PMU support)
Merging arm-soc/for-next (46b4ed792f51 Merge branches 'next/dt' and 'next/d=
rivers' into for-next)
Merging actions/for-next (61862a89e6ac Merge branch 'v4.16/drivers' into ne=
xt)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid cl=
ock-frequency values)
Merging amlogic/for-next (ee2b83f117e8 Merge branch 'v4.16/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (8203ca9789bc Merge branch 'dt-for-v4.16' into for-=
next)
Merging at91/at91-next (fa4cf68ab4b1 Merge tag 'at91-ab-4.16-dt' into at91-=
next)
Merging bcm2835/for-next (a6189bcc0012 Merge branch anholt/bcm2835-drivers-=
next into for-next)
Merging imx-mxs/for-next (824162aa1454 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a29b8b93e158 Merge branch 'for_4.16/keystone-config'=
 into next)
Merging mvebu/for-next (91cbd0893d7d Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a2ef0751a548 Merge branch 'omap-for-v4.16/dt-clk' in=
to for-next)
Merging reset/reset/next (70d2f16a6289 reset: meson: enable level reset sup=
port on Meson8b)
Merging qcom/for-next (f5788d2f2929 Merge tag 'qcom-arm64-defconfig-for-4.1=
6' into tagged-for-4.16)
Merging realtek/for-next (2b6286eb7ab8 Merge branch 'v4.15/dt64' into next)
Merging renesas/next (b214f9f550fd Merge branches 'fixes-for-v4.15' and 'dt=
-for-v4.16' into next)
Merging rockchip/for-next (273cddbe1912 Merge branch 'v4.16-armsoc/dts64' i=
nto for-next)
Merging samsung/for-next (bebc6082da0a Linux 4.14)
Merging samsung-krzk/for-next (3b6327365aba Merge branch 'next/dt' into for=
-next)
Merging sunxi/sunxi/for-next (d7ec2c507677 Merge branch 'sunxi/fixes-for-4.=
15' into sunxi/for-next)
Merging tegra/for-next (983371acdeda Merge branch for-4.16/arm64/dt into fo=
r-next)
Merging arm64/for-next/core (6b88a32c7af6 arm64: kpti: Fix the interaction =
between ASID switching and software PAN)
CONFLICT (content): Merge conflict in arch/arm64/kernel/fpsimd.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cputype.h
Merging clk/clk-next (34459c0de1ec Merge branch 'clk-allwinner' into clk-ne=
xt)
Merging clk-samsung/for-next (7685570f2ae2 clk: samsung: s3c: Remove unneed=
ed enumeration)
Merging c6x/for-linux-next (62016565bb04 c6x: remove unused KTHREAD_SIZE de=
finition)
Merging cris/for-next (fd989db807a0 cris: Fix conflicting types for _etext,=
 _edata, _end)
Merging m68k/for-next (2334b1ac1235 MAINTAINERS: Add NuBus subsystem entry)
Merging m68knommu/for-next (a8750ddca918 Linux 4.15-rc8)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (2c957902b17b microblaze: fix iounmap prototype)
Merging mips/mips-next (132939062a32 Merge branches '4.15-fixes', '4.16-fea=
tures' and 'octeon-3-net-mips-bits' into mips-next)
Merging mips-james/mips-next (e0c5f36b2a63 MIPS: Add iomem resource for ker=
nel bss section.)
Merging nios2/for-next (65d1e3ddeae1 nios2: time: Read timer in get_cycles =
only if initialized)
Merging openrisc/for-next (73acae67e363 openrisc: Fix conflicting types for=
 _exext and _stext)
Merging parisc-hd/for-next (bebc6082da0a Linux 4.14)
Merging powerpc/next (f2ac428e0eda powerpc/pseries/cpuidle: add polling idl=
e for shared processor guests)
CONFLICT (content): Merge conflict in arch/powerpc/kernel/setup-common.c
Applying: powerpc: fix up for safe_stack_limit rename
Merging fsl/next (a4e89ffb5923 powerpc/e6500: Update machine check for L1D =
cache err)
Merging risc-v/for-linux-next (b60cbabb1c79 automerging branch "github.com-=
riscv/next-tlb" into "for-linux-next")
Merging s390/features (7bceec4e58ee s390/vdso: revise CFI annotations of vD=
SO functions)
Merging sparc-next/master (1deab8ce2c91 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/davem/sparc)
Merging sh/for-next (6e2fbfdd585f sh: fix futex FUTEX_OP_SET op on userspac=
e addresses)
Merging uml/linux-next (02eb0b11eab5 um: Add missing EXPORT for free_irq_by=
_fd())
Merging xtensa/xtensa-for-next (73b37067623c xtensa: fix futex_atomic_cmpxc=
hg_inatomic)
CONFLICT (content): Merge conflict in Documentation/features/debug/KASAN/ar=
ch-support.txt
Merging fscrypt/master (3d204e24d452 fscrypt: remove 'ci' parameter from fs=
crypt_put_encryption_info())
Merging befs/for-next (55d945e2e4aa fs: befs: btree: Fixed some coding stan=
dard issues)
Merging btrfs/next (7c9a09f56a91 btrfs: don't use async helpers for crcs wh=
en under IO limits)
Merging btrfs-kdave/for-next (c405d4786ec4 Merge branch 'misc-next' into fo=
r-next-20180118)
Merging ceph/master (21acdf45f495 rbd: set max_segments to USHRT_MAX)
Merging cifs/for-next (7c78f05b3e8a cifs: remove redundant duplicated assig=
nment of pointer 'node')
Merging configfs/for-next (6ace4f6bbcfd RDMA/cma: make config_item_type con=
st)
Merging ecryptfs/next (4670269faba7 eCryptfs: constify attribute_group stru=
ctures.)
Merging ext3/for_next (f463589a7cd2 ext2: drop unneeded newline)
Merging ext4/dev (a6c927bb894f ext4: create ext4_kset dynamically)
Merging f2fs/dev (dfaa191015e7 f2fs: fix to drop all inmem pages correctly)
CONFLICT (content): Merge conflict in fs/f2fs/namei.c
Applying: Revert "f2fs: implement cgroup writeback support"
Merging fuse/for-next (c6cdd51404b7 fuse: fix READDIRPLUS skipping an entry)
Merging jfs/jfs-next (86313903430d MAINTAINERS: fix jfs tree location)
Merging nfs/linux-next (cbebc6ef4fc8 nfs: Do not convert nfs_idmap_cache_ti=
meout to jiffies)
Merging nfs-anna/linux-next (c54c14ba000d xprtrdma: Spread reply processing=
 over more CPUs)
CONFLICT (content): Merge conflict in net/sunrpc/xprt.c
Merging nfsd/nfsd-next (71ee2a31310c nfsd: return RESOURCE not GARBAGE_ARGS=
 on too many ops)
Merging orangefs/for-next (db0267e7afc7 orangefs: call op_release sooner wh=
en creating inodes)
Merging overlayfs/overlayfs-next (da2e6b7eeda8 ovl: fix overlay: warning pr=
efix)
Merging ubifs/linux-next (01f196945a21 ubi: Fix copy/paste error in functio=
n documentation)
Merging xfs/for-next (75d4a13b1f61 xfs: fix non-debug build compiler warnin=
gs)
Merging file-locks/locks-next (1deab8ce2c91 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/davem/sparc)
Merging vfs/for-next (418bb8b3ff50 Merge branch 'misc.netdrv' into for-next)
CONFLICT (content): Merge conflict in arch/score/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/mn10300/include/uapi/asm/Kbuild
CONFLICT (content): Merge conflict in arch/alpha/include/uapi/asm/Kbuild
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsy=
nc())
Merging iversion/iversion-next (2c22da552727 fs: handle inode->i_version mo=
re efficiently)
Merging printk/for-next (c256f0617941 Merge branch 'for-4.16-console-waiter=
-logic' into for-4.16)
CONFLICT (content): Merge conflict in scripts/checkpatch.pl
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
Merging pci/next (8c34b2032441 Merge remote-tracking branch 'lorenzo/pci/xg=
ene' into next)
Merging pstore/for-next/pstore (a99f41a1b441 fs: pstore: remove unused hard=
irq.h)
Merging hid/for-next (421f664d5eb4 Merge branch 'for-4.16/hid-quirks-cleanu=
p/pixart' into for-next)
Merging i2c/i2c/for-next (dc2fe9b783eb Merge branch 'i2c/for-4.16' into i2c=
/for-next)
Merging dmi/master (0bcea5c474d1 firmware: dmi: handle missing DMI data gra=
cefully)
Merging hwmon-staging/hwmon-next (0c4c5860e998 hwmon: (ina2xx) Fix access t=
o uninitialized mutex)
Merging jc_docs/docs-next (ae17a87dd7c7 linux-next: docs-rst: Fix typos in =
kfigure.py)
CONFLICT (content): Merge conflict in Documentation/core-api/printk-formats=
.rst
Merging v4l-dvb/master (e3ee691dbf24 media: ov5640: add support of RGB565 a=
nd YUYV formats)
CONFLICT (modify/delete): include/media/lirc_dev.h deleted in v4l-dvb/maste=
r and modified in HEAD. Version HEAD of include/media/lirc_dev.h left in tr=
ee.
CONFLICT (modify/delete): drivers/staging/media/lirc/lirc_zilog.c deleted i=
n v4l-dvb/master and modified in HEAD. Version HEAD of drivers/staging/medi=
a/lirc/lirc_zilog.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/rc/lirc_dev.c
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dmxdev.c
$ git rm -f include/media/lirc_dev.h drivers/staging/media/lirc/lirc_zilog.c
Applying: media: videobuf2: fix up for "media: annotate ->poll() instances"
Merging v4l-dvb-next/master (c6b73bfcead9 media: RC docs: add enum rc_proto=
 description at the docs)
Merging fbdev/fbdev-for-next (5865889fe431 video: udlfb: Switch from the pr=
_*() to the dev_*() logging functions)
Merging pm/linux-next (6926258048ca Merge branch 'pm-pci' into linux-next)
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-pla=
tdrv.c
Merging cpupower/cpupower (0e96a0c83f08 cpupower: Remove FSF address)
Merging idle/next (8a5776a5f498 Linux 4.14-rc4)
Merging opp/opp/linux-next (e856f078bcf1 OPP: Introduce "required-opp" prop=
erty)
Merging thermal/next (134f4010799a Merge branches 'thermal-core', 'thermal-=
intel' and 'thermal-soc' into next)
Merging thermal-soc/next (d0ecbbbe518e thermal/drivers/hisi: Remove bogus c=
onst from function return type)
Merging ieee1394/for-next (188775181bc0 firewire-ohci: work around oversize=
d DMA reads on JMicron controllers)
Merging dlm/next (9250e523592a dlm: remove dlm_send_rcom_lookup_dump)
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb=
_get_sgtable callback)
Merging net-next/master (89290b831ec1 flow_netlink: Remove unneeded semicol=
ons)
CONFLICT (content): Merge conflict in net/tipc/socket.c
CONFLICT (content): Merge conflict in net/smc/smc_clc.c
CONFLICT (content): Merge conflict in kernel/bpf/verifier.c
CONFLICT (content): Merge conflict in drivers/net/tun.c
Merging bpf-next/master (15e541edd47a Merge branch 'bpf-array-map-offload-a=
nd-tests')
Merging ipsec-next/master (79d891c1bbb6 Merge tag 'linux-can-next-for-4.16-=
20180105' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mkl/linux-c=
an-next)
Merging netfilter-next/master (41e4b391157f netfilter: nf_defrag: move NF_C=
ONNTRACK bits into #ifdef)
Merging nfc-next/master (4d63adfe12dd NFC: Add NFC_CMD_DEACTIVATE_TARGET su=
pport)
Merging ipvs-next/master (a910d20aa007 netfilter: ipvs: Fix space before '[=
' error.)
Merging wireless-drivers-next/master (5f9066930b5d rtlwifi: Support A-MSDU =
in A-MPDU capability)
Merging bluetooth/master (d456f678a074 Bluetooth: btbcm: Add entry for BCM4=
343A0 UART bluetooth)
Merging mac80211-next/master (6e3d6ca16319 mac80211_hwsim: add hwsim_tx_rat=
e_flags to netlink attributes)
CONFLICT (content): Merge conflict in drivers/net/wireless/mac80211_hwsim.c
Merging rdma/for-next (f20d429511af i40iw: Free IEQ resources)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/qp.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
Merging gfs2/for-next (88b65ce5fdd9 gfs2: Minor gfs2_page_add_databufs clea=
nup)
Merging mtd/master (fee4380f368e mtd: nand: pxa3xx: Fix READOOB implementat=
ion)
Merging l2-mtd/mtd/next (0aede42e98e0 mtd: Remove duplicate checks on mtd_o=
ob_ops parameter)
Merging nand/nand/next (82cea533aed4 mtd: onenand: omap2: print resource us=
ing %pR format string)
Merging spi-nor/spi-nor/next (23bae78e8a57 mtd: mtk-nor: modify functions' =
name more generally)
Merging crypto/master (20b04c02bcb2 crypto: arm64/sha1-ce - get rid of lite=
ral pool)
Merging drm/drm-next (4a6cc7a44e98 BackMerge tag 'v4.15-rc8' into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add s=
upport for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (0b8a77f5a6eb drm/i915: Only attempt to sc=
an the requested number of shrinker slabs)
Merging drm-tegra/drm/tegra/for-next (8f62142e490d drm/tegra: dc: Properly =
cleanup overlay planes)
Merging drm-misc/for-linux-next (341a0ffceaa4 drm: Fix PANEL_ORIENTATION_QU=
IRKS breaking the Kconfig DRM menuconfig)
Merging drm-msm/msm-next (1822cb02975b drm/msm/dsi: correct DSI id bounds c=
heck during registration)
Merging hdlcd/for-upstream/hdlcd (f73e8b825315 drm/arm: Replace instances o=
f drm_dev_unref with drm_dev_put.)
Merging mali-dp/for-upstream/mali-dp (54243016ae35 drm: mali-dp: Disable pl=
anes when their CRTC gets disabled.)
Merging sunxi-drm/sunxi-drm/for-next (7dafb83edd32 Merge branches 'sunxi/dr=
m-fixes-for-4.13' and 'sunxi/drm-for-4.14' into sunxi-drm/for-next)
Merging imx-drm/imx-drm/next (4cfea3c1f271 gpu: ipu-v3: allow to build with=
 COMPILE_TEST)
Merging etnaviv/etnaviv/next (4c93867aeb26 drm/etnaviv: replace hangcheck w=
ith scheduler timeout)
Merging kconfig/for-next (bebc6082da0a Linux 4.14)
Merging regmap/for-next (a75de7721184 Merge remote-tracking branches 'regma=
p/topic/soundwire' and 'regmap/topic/zero' into regmap-next)
Merging sound/for-next (388fdb8f882a ALSA: usb-audio: Support changing inpu=
t on Sound Blaster E1)
Merging sound-asoc/for-next (8f05b9c65d81 Merge remote-tracking branches 'a=
soc/topic/wm8400', 'asoc/topic/wm8903', 'asoc/topic/wm8994', 'asoc/topic/wm=
8997' and 'asoc/topic/wm8998' into asoc-next)
Merging modules/modules-next (0cad61d7a3d5 modpost: Remove trailing semicol=
on)
Merging input/next (deb106beb7ef Input: cyapa - remove redundant assignment=
 to 'pwr_cmd')
Merging block/for-next (191522e89f84 Merge branch 'for-4.16/block' into for=
-next)
CONFLICT (content): Merge conflict in lib/Kconfig
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pb=
lk-init.c)
Merging device-mapper/for-next (7d089f987302 Merge branch 'dm-4.16' into bl=
ock-4.16_dm-4.16)
Merging mmc/next (2a9d6c806089 mmc: mmci: Add STM32 variant)
Merging kgdb/kgdb-next (fe8421c318f6 misc: kgdbts: Display progress of asyn=
chronous tests)
Merging md/for-next (1532d9e87e8b raid5-ppl: PPL support for disks with wri=
te-back cache enabled)
Merging mfd/for-mfd-next (0f89ffefa4e1 mfd: lpc_ich: Do not touch SPI-NOR w=
rite protection bit on Apollo Lake)
Merging backlight/for-backlight-next (2023b0524a63 backlight: tdo24m: Fix t=
he SPI CS between transfers)
Merging battery/for-next (8be4c3667cf1 MAINTAINERS: Add AXP288 PMIC entry)
Merging regulator/for-next (3343a02a5e89 Merge remote-tracking branches 're=
gulator/topic/doc', 'regulator/topic/sc2731', 'regulator/topic/suspend' and=
 'regulator/topic/tps65218' into regulator-next)
Merging security/next-testing (429262d70af8 Merge branch 'smack-for-4.16' o=
f git://github.com/cschaufler/next-smack into next-testing)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
Merging integrity/next-integrity (36447456e1cc ima/policy: fix parsing of f=
suuid)
Merging keys/keys-next (1e684d3820d8 pkcs7: Set the module licence to preve=
nt tainting)
Merging selinux/next (4b14752ec4e0 selinux: skip bounded transition process=
ing if the policy isn't loaded)
Merging tpmdd/next (68021bf4734d tpm: remove unused variables)
Merging watchdog/master (38a1222ae4f3 watchdog: core: make sure the watchdo=
g worker always works)
Merging iommu/next (fedbd940d1c2 Merge branches 'arm/renesas', 'arm/omap', =
'arm/exynos', 'x86/amd', 'x86/vt-d' and 'core' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table alloca=
tion)
Merging vfio/next (46ed90f157f4 vfio: mdev: make a couple of functions and =
structure vfio_mdev_driver static)
Merging trivial/for-next (1972d6c0c86d MAINTAINERS: relinquish kconfig)
Merging audit/next (42d5e37654e4 audit: filter PATH records keyed on filesy=
stem magic)
Merging devicetree/for-next (5fbd55d21e56 libfdt: remove unnecessary includ=
e directive from <linux/libfdt.h>)
Merging mailbox/mailbox-for-next (ca64af43924f mailbox: ti-msgmgr: Use %zu =
for size_t print format)
Merging spi/for-next (ed369c0c6cd9 Merge remote-tracking branches 'spi/topi=
c/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/sirf', 'spi/topic/sun6i' and '=
spi/topic/xilinx' into spi-next)
Merging tip/auto-latest (7e8c4dc5f75e Merge branch 'x86/urgent')
Merging clockevents/clockevents/next (322fd24f5e67 clocksource/drivers/stm3=
2: Start the timer's counter sooner)
CONFLICT (content): Merge conflict in drivers/clocksource/timer-stm32.c
CONFLICT (content): Merge conflict in drivers/clocksource/timer-of.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (68fa24f9121c EDAC, mv64x60: Fix an error handlin=
g path)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (4397f04575c4 tracing: Fix possible double free on =
failure of allocating trace buffer)
Merging rcu/rcu/next (1dfa55e01987 Merge branches 'cond_resched.2017.12.04a=
', 'dyntick.2017.11.28a', 'fixes.2017.12.11a', 'srbd.2017.12.05a' and 'tort=
ure.2017.12.11a' into HEAD)
Merging kvm/linux-next (7cd918047a8b Merge tag 'kvm-s390-next-4.16-1' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux)
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
Applying: KVM: x86: don't forget vcpu_put() in kvm_arch_vcpu_ioctl_set_sreg=
s()
Merging kvm-arm/next (0482b50546b1 arm64: mm: Add additional parameter to u=
access_ttbr0_disable)
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement T=
LBR for T&E)
Merging kvm-ppc/kvm-ppc-next (9b9b13a6d153 KVM: PPC: Book3S HV: Keep XIVE e=
scalation interrupt masked unless ceded)
Merging kvms390/next (5cb26c36bb47 KVM: s390: introduce the format-1 GISA)
Merging xen-tip/linux-next (cf2acf66ad43 xen/gntdev: Fix partial gntdev_mma=
p() cleanup)
Merging percpu/for-next (85dcbba3b8b1 percpu: percpu_counter_initialized ca=
n be boolean)
Merging workqueues/for-next (a10eb37ccf1d Merge branch 'for-4.15-fixes' int=
o for-next)
Merging drivers-x86/for-next (9a1a62591847 platform/x86: wmi: Call acpi_wmi=
_init() later)
CONFLICT (content): Merge conflict in drivers/platform/x86/dell-laptop.c
Merging chrome-platform/for-next (d48b8c58c57f platform/chrome: Use proper =
protocol transfer function)
Merging hsi/for-next (b6dc80dbe6cd HSI: cmt_speech: use timespec64 instead =
of timespec)
Merging leds/for-next (6a836631e303 leds: ledtrig-transient: Add SPDX licen=
se identifiers)
Merging ipmi/for-next (d260a055379e ipmi_ssif: Remove duplicate NULL check)
Merging driver-core/driver-core-next (a9afc573dbe6 firmware: Fix a typo in =
fallback-mechanisms.rst)
Merging usb/usb-next (26c502701c52 usb: uhci: Add clk support to uhci-platf=
orm)
Merging usb-gadget/next (8ada211d0383 usb: renesas_usbhs: add extcon notifi=
er to set mode for non-otg channel)
Merging usb-serial/usb-next (d1c48227d7c4 USB: serial: f81534: fix tx error=
 on some baud rate)
Merging usb-chipidea-next/ci-for-usb-next (061e20e9899e usb: chipidea: tegr=
a: Use aligned DMA on Tegra30)
Merging phy-next/next (e4b227c1ca70 phy: phy-mtk-tphy: use of_device_get_ma=
tch_data())
Merging tty/tty-next (e397824bf095 gpio: serial: max310x: Support open-drai=
n configuration for GPIOs)
Merging char-misc/char-misc-next (d6088e9a89f7 uio_hv_generic: fix new type=
 mismatch warnings)
Merging extcon/extcon-next (ca90a64dc671 extcon: axp288: Handle reserved ch=
arger-type values better)
Merging staging/staging-next (197ecafc874d staging: wilc1000: rename strSta=
tistics & tenuAuth_type to avoid camelCase)
CONFLICT (content): Merge conflict in drivers/staging/most/video/video.c
CONFLICT (content): Merge conflict in drivers/staging/most/cdev/cdev.c
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in drivers/Kconfig
Merging mux/for-next (6cd361c99ef2 mux: add SPDX identifiers to all mux sou=
rce files)
Merging slave-dma/next (546951e077cf Merge branch 'topic/sprd' into next)
Merging cgroup/for-next (1baf8ca0ecab Merge branch 'for-4.16' into for-next)
Merging scsi/for-next (da2cd3bcb27f Merge branch 'postmerge' into for-next)
Merging scsi-mkp/for-next (810bd27df169 scsi: fas216: fix sense buffer init=
ialization)
Merging target-updates/for-next (85fae482a9dd tcmu: Fix trailing semicolon)
Merging target-bva/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging libata/for-next (6363899d56cb Merge branch 'for-4.16' into for-next)
Merging vhost/linux-next (20677394b78e Merge branch 'vhost' into vhost-next)
Merging rpmsg/for-next (2ddfa3fbb0ba Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (33293ff3ac16 Merge branch 'devel' into for-next)
Merging pinctrl/for-next (8668693769bb Merge branch 'devel' into for-next)
Merging pinctrl-samsung/for-next (4fbd8d194f06 Linux 4.15-rc1)
Merging pwm/for-next (bccaa3f917c9 pwm: meson: Add clock source configurati=
on for Meson-AXG)
Merging userns/for-next (9bcb9a017add Merge my siginfo and userns trees for=
 testing in linux-next)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does h=
onor the timeout)
Merging random/dev (9e66317d3c92 Linux 4.14-rc3)
Merging aio/master (2a8a98673c13 fs: aio: fix the increment of aio-nr and c=
ounting against aio-max-nr)
Merging kselftest/next (14f1889fd4d7 selftests: Fix loss of test output in =
run_kselftests.sh)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging livepatching/for-next (d13f5d84ca27 Merge branch 'for-4.16/signal-s=
ysfs-force-v2' into for-next)
Merging coresight/next (1443f5b4fb45 MAINTAINERS: Add SoundWire entry)
Merging rtc/rtc-next (796c0ad79ee6 Documentation: rtc: move iotcl interface=
 documentation to ABI)
Merging nvdimm/libnvdimm-for-next (24e3a7fb60a9 libnvdimm, btt: Fix an inco=
mpatibility in the log layout)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in L=
DFLAGS too)
Merging at24/at24/for-next (0f30aca72c3b eeprom: at24: extend the list of c=
hips supported in DT)
Merging ntb/ntb-next (0f79bddeeb1d NTB: ntb_hw_idt: Set NTB_TOPO_SWITCH top=
ology)
Merging kspp/for-next/kspp (e47e311843de lkdtm: Update usercopy tests for w=
hitelisting)
CONFLICT (content): Merge conflict in net/sctp/socket.c
Merging init_task/init_task (e1e871aff3de Expand INIT_STRUCT_PID and remove)
Applying: powerpc: temporary fix for tlbiel_all() and not CONFIG_PPC_NATIVE
Merging akpm-current/current (f5263a6beab9 ipc/mqueue.c: have RT tasks queu=
e in by priority in wq_add())
$ git checkout -b akpm remotes/origin/akpm/master
Applying: ipc/mqueue: add missing error code in init_mqueue_fs()
Applying: fs/crypto/hooks.c: fix build with gcc-4.4.4
Applying: include/linux/mtd/rawnand.h: fix build with gcc-4.4.4
Applying: net/sched/sch_prio.c: work around gcc-4.4.4 union initializer iss=
ues
Applying: arch/score/kernel/setup.c: combine two seq_printf() calls into on=
e call in show_cpuinfo()
Applying: vfs: remove might_sleep() from clear_inode()
Applying: mm/userfaultfd.c: remove duplicate include
Applying: mm: remove unneeded kallsyms include
Applying: hrtimer: remove unneeded kallsyms include
Applying: genirq: remove unneeded kallsyms include
Applying: mm/memblock: memblock_is_map/region_memory can be boolean
Applying: lib/lockref: __lockref_is_dead can be boolean
Applying: kernel/cpuset: current_cpuset_is_being_rebound can be boolean
Applying: kernel/resource: iomem_is_exclusive can be boolean
Applying: kernel/module: module_is_live can be boolean
Applying: kernel/mutex: mutex_is_locked can be boolean
Applying: crash_dump: is_kdump_kernel can be boolean
Applying: certs/blacklist_nohashes.c: fix const confusion in certs blacklist
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Applying: kasan: rework Kconfig settings
Applying: sparc64: NG4 memset 32 bits overflow
Applying: pipe, sysctl: drop 'min' parameter from pipe-max-size converter
Applying: pipe, sysctl: remove pipe_proc_fn()
Applying: pipe: actually allow root to exceed the pipe buffer limits
Applying: pipe: fix off-by-one error when checking buffer limits
Applying: pipe: reject F_SETPIPE_SZ with size over UINT_MAX
Applying: pipe: simplify round_pipe_size()
Applying: pipe: read buffer limits atomically
Merging akpm/master (adf77d065042 pipe: read buffer limits atomically)

--Sig_/P1XH2HDqc6K8b57vfYGe9bA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlphllcACgkQAVBC80lX
0Gx/0Qf+PyeOZLpJkK6Lr43QpZiQYVqxAqrXSZ0br0GiFOrwCrijpXIgXq/Qj5uw
UHLAJna27XqIoA4Ax85xXeQu0eSOHiIVSn1G39h2dNiDN7lYDLXJmgDZgQp+nsch
qZIjwofxcwJd7sBWn+XHDERcjMhFAcN8vTi5bCQO8oVH0GGw9W3Vbx3VGWjttkkB
Ii4MFx4Y8QStB2o/SvlBDSm9u0FQUSCjZu5QgQSXE1aggZ7KupPOXrka0LQCDuCV
vSwI2F9Okh/bQy/M5Jir9MUGtMxswC5ZiZgi/HpSv6cyhEXGNPztvCMjHPIT2YnE
bDcPcgDVm9fEIhtaTXNZkSKuS+rkPg==
=sE8g
-----END PGP SIGNATURE-----

--Sig_/P1XH2HDqc6K8b57vfYGe9bA--
