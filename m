From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 24
Date: Tue, 24 Mar 2015 18:29:33 +1100
Message-ID: <20150324182933.6061dcce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D_z2eScWhg584ruJY7cuIxg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57054 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751240AbbCXH3l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2015 03:29:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/D_z2eScWhg584ruJY7cuIxg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150323:

The vfs tree still had its build failure for which I applied a patch.

The thermal-soc tree gained a conflict against the thermal tree.

The net-next tree gained a build failure due to an interaction with the
vfs tree for which I applied a merge fix patch.

The staging tree gained a conflict against the v4l-dvb tree.

The kselftest tree gained a conflict against the powerpc-mpe tree.

Non-merge commits (relative to Linus' tree): 5903
 5519 files changed, 249714 insertions(+), 114615 deletions(-)

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

I am currently merging 210 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (90a5a895cc8b Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/davem/net)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (526299ce4eab ARM: 8313/1: Use read_cpuid_ext() m=
acro instead of inline asm)
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-merge-mpe/fixes (44d5f6f5901e powerpc/book3s: Fix the MCE c=
ode to use CONFIG_KVM_BOOK3S_64_HANDLER)
Merging sparc/master (90a5a895cc8b Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (90a5a895cc8b Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/davem/net)
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (80b311d31188 ALSA: hda - Add dock support =
for Thinkpad T450s (17aa:5036))
Merging pci-current/for-linus (bc3b5b47c80d PCI: cpcihp: Add missing curly =
braces in cpci_configure_slot())
Merging wireless-drivers/master (6ae4ccfee09e Merge tag 'iwlwifi-for-kalle-=
2014-03-22' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (d5e7cafd69da LZ4 : fix the d=
ata abort issue)
Merging tty.current/tty-linus (7fd6f640f2dd serial: 8250_dw: Fix deadlock i=
n LCR workaround)
Merging usb.current/usb-linus (227a4fd801c8 usb: xhci: apply XHCI_AVOID_BEI=
 quirk to all Intel xHCI controllers)
Merging usb-gadget-fixes/fixes (bc465aa9d045 Linux 4.0-rc5)
Merging usb-serial-fixes/usb-linus (5e71fc8629ce USB: keyspan_pda: add new =
device id)
Merging staging.current/staging-linus (1f51d5801859 vt6655: Fix late settin=
g of byRFType.)
Merging char-misc.current/char-misc-linus (3d7a8278fdfd Revert "pcmcia: add=
 a new resource manager for non ISA systems")
Merging input-current/for-linus (a736775db683 Input: add MT_TOOL_PALM)
Merging crypto-current/master (ccfe8c3f7e52 crypto: aesni - fix memory usag=
e in GCM decryption)
Merging ide/master (b314acaccd7e Merge branch 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/dtor/input)
Merging devicetree-current/devicetree/merge (6b1271de3723 of/unittest: Over=
lays with sub-devices tests)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (ec76f4007079 vfio-pci: Add missing break to e=
nable VFIO_PCI_ERR_IRQ_INDEX)
Merging kselftest-fixes/fixes (67d8712dcc70 selftests: Fix build failures w=
hen invoked from kselftest target)
Merging drm-intel-fixes/for-linux-next-fixes (bc465aa9d045 Linux 4.0-rc5)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (9eccca084320 Linux 4.0-rc3)
Merging arm/for-next (0c3e4b0d9f18 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm-perf/for-next/perf (45a8c8bf9d35 Merge branches 'perf/updates' =
and 'perf/cci' into for-next/perf)
Merging arm-soc/for-next (faa21ad5f889 arm-soc: document merges)
CONFLICT (content): Merge conflict in drivers/bus/Kconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (d14fc2681e93 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (9c4fb3c9f240 Merge branch 'mvebu/dt' into mvebu/for=
-next)
Merging omap/for-next (2f99e23ebcc9 Merge branch 'omap-for-v4.0/fixes' into=
 for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
Merging renesas/next (53a6e5250291 Merge branch 'heads/soc-cleanup-for-v4.1=
' into next)
Merging samsung/for-next (77105c882ba6 Merge branch 'v4.0-samsung-fixes-2' =
into for-next)
Merging sunxi/sunxi/for-next (0d63d060aa18 Merge branch 'sunxi/dt-for-4.1' =
into sunxi/for-next)
Merging tegra/for-next (51a626076025 Merge branch for-4.1/dt into for-next)
Merging arm64/for-next/core (e4c5a6851058 arm64: KVM: use ID map with incre=
ased VA range if required)
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
Merging c6x/for-linux-next (3591276d16f8 c6x: kernel: setup: Include "linux=
/console.h")
Merging cris/for-next (a38ecbbd0be0 Merge branch 'x86-urgent-for-linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging hexagon/linux-next (8914d7e85780 Hexagon: fix signal delivery for d=
ebug traps)
Merging ia64/next (62f269ef8191 pstore: Fix the ramoops module parameters u=
pdate)
Merging m68k/for-next (79bf442c79d6 m68k/pci: Remove a superflous KERN_ERR)
Merging m68knommu/for-next (5f5f8cf61c2b m68knommu: ColdFire 5271 only has =
a single FEC controller)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (e9809bc3fa72 Merge branch '4.0-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/net/can/usb/kvaser_usb.c
CONFLICT (content): Merge conflict in drivers/bus/Makefile
CONFLICT (content): Merge conflict in arch/nios2/include/uapi/asm/Kbuild
Merging nios2/nios2-next (6347e2a10f70 nios2: mm: do not invoke OOM killer =
on kernel fault OOM)
Merging parisc-hd/for-next (2e3f0ab2bb48 parisc: Fix pmd code to depend on =
PT_NLEVELS value, not on CONFIG_64BIT)
Merging powerpc/next (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-mpe/next (6eca8933d3ff powerpc/kernel: Rename copy_thread()=
 'arg' argument to 'kthread_arg')
Merging fsl/next (0dc294f717d4 powerpc/mm: bail out early when flushing TLB=
 page)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (6fbfcc3fd01f s390/dasd: remove setting of scheduler =
from driver)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (0631818c4f64 arch: tile: fix null pointer dereference =
on pt_regs pointer)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (0372c1abdd0d Merge tag 'xtensa-for-next-20150304' =
of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging btrfs/next (a742994aa2e2 Btrfs: don't remove extents and xattrs whe=
n logging new names)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/ceph_common.c
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in include/linux/ceph/libceph.h
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
CONFLICT (content): Merge conflict in fs/ceph/inode.c
Merging cifs/for-next (121672682b23 cifs: fix use-after-free bug in find_wr=
itable_file)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (5ce1aca81435 reiserfs: fix __RASSERT format string)
Merging ext4/dev (6f30b7e37a82 ext4: fix indirect punch hole corruption)
Merging f2fs/dev (0c9a32ced4ad f2fs: set SBI_NEED_FSCK when encountering ex=
ception in recovery)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (d9be0cda774e gfs2: allow fallocate to max out quotas=
/fs efficiently)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (95e2d8455193 nfsd: remove unused status arg to nfsd=
4_cleanup_open_state)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f569d3ef8254 net/9p: add a privport option for RDMA =
transport.)
Merging ubifs/linux-next (b388e6a7a6ba UBI: fix missing brace control flow)
Merging xfs/for-next (88e8fda99a4c Merge branch 'xfs-mmap-lock' into for-ne=
xt)
Merging file-locks/linux-next (65782c7629bd locks: use cmpxchg to assign i_=
flctx pointer)
Merging vfs/for-next (074def59bce4 dcache: return -ESTALE not -EBUSY on dis=
tributed fs race)
CONFLICT (content): Merge conflict in fs/udf/file.c
Applying: ext4: iov_iter_count needs linux/uio.h
Merging pci/next (8e795840e4d8 Merge branches 'pci/enumeration' and 'pci/vi=
rtualization' into next)
Merging hid/for-next (b86e721df3ba Merge branch 'for-4.0/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (4a7a08226dd5 i2c: add support for the Digicolor I=
2C controller)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (d720acace4d7 hwmon: (pwm-fan, vexpress) C=
onstify of_device_id array)
Merging v4l-dvb/master (65ec78ae2f91 Merge branch 'v4l_for_linus' into to_n=
ext)
Merging kbuild/for-next (94100b52d1c0 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (06db673f0fef Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (03c7ae737d27 Merge branch 'pm-domains' into linux-ne=
xt)
Merging idle/next (210109f4a19a Merge branches 'turbostat', 'sfi' and 'cpui=
dle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (db4dd1e5d196 Thermal: do thermal zone update after a =
cooling device registered)
Merging thermal-soc/next (3d1b493e9886 Merge branch 'work-fixes' into work-=
next)
CONFLICT (content): Merge conflict in include/linux/thermal.h
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (ebb3abd4042e Merge branch 'for-linus' into next)
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-mackerel.c deleted i=
n HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/m=
ach-shmobile/board-mackerel.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-ape6evm.c deleted in=
 HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/ma=
ch-shmobile/board-ape6evm.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-mackerel.c arch/arm/mach-shmobile/=
board-ape6evm.c
Merging net-next/master (24c0e6838cb4 vxlan: simplify if clause in dev_clos=
e)
CONFLICT (content): Merge conflict in net/socket.c
CONFLICT (content): Merge conflict in net/netfilter/nf_tables_core.c
Applying: crypto: algif - cope with aio_complete() going away
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (44a89c82feca ath9k: Fix AIC compilati=
on error)
Merging bluetooth/master (17b2772b8fe3 Bluetooth: Read Broadcom chip info f=
or Apple Bluetooth devices)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (7234bea69de2 mtd: clean up whitespace in linux/mtd/m=
ap.h)
Merging crypto/master (a83034f5cb13 crypto: img-hash - shift wrapping bug i=
n img_hash_hw_init())
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (ae10c2248593 Merge branch 'drm/next/rcar-du' of git:/=
/linuxtv.org/pinchartl/fbdev into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (9848de082ff4 drm/i915: Use usleep_range()=
 in wait_for())
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (07d05cbf60ed drm/tegra: dc: Move more=
 code into ->init())
Merging drm-misc/topic/drm-misc (c60618af77ea drm: atomic: Allow setting CR=
TC active property)
Merging drm-exynos/exynos-drm/for-next (e7b30d56abc3 drm/exynos: fix the in=
itialization order in FIMD)
Merging sound/for-next (77008b70fe0a ALSA: echoaudio: read past end of arra=
y)
Merging sound-asoc/for-next (35cf8b598f9f Merge remote-tracking branches 'a=
soc/topic/wm2200', 'asoc/topic/wm5100', 'asoc/topic/wm8731', 'asoc/topic/wm=
8804' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (c58616580ea5 Merge branch 'x86-urgent-for-lin=
us' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging virtio/virtio-next (88ad1a147e2c lguest: fix pending interrupt test=
.)
Merging input/next (68c581d5e7d8 Input: add Qualcomm PM8941 power key drive=
r)
CONFLICT (content): Merge conflict in drivers/input/mouse/synaptics.c
Merging block/for-next (bfd343aa1718 blk-mq: don't wait in blk_mq_queue_ent=
er() if __GFP_WAIT isn't set)
Merging device-mapper/for-next (fc102391aa7d Merge branch 'dm-for-4.0' into=
 dm-for-next)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (2530fd732528 mmc: constify of_device_id array)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (c3d8e47547b9 md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (5c850c8f8c7e mfd: sec-core: Enable RTC on S2MPS11=
 PMIC)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (8fb0885504cc power: constify of_device_id array)
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/wacom.h
Applying: HID: wacom: merge fix for "Change ownership from driver to core"
Applying: HID: wacom: merge fix 2 for "Change ownership from driver to core"
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (396282477a1a Merge remote-tracking branches 're=
gulator/topic/stw481x' and 'regulator/topic/wm8350' into regulator-next)
Merging security/next (6b37729bd184 tpm/tpm_infineon: Use struct dev_pm_ops=
 for power management)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (1cad16744b21 selinux: remove unnecessary pointer reas=
signment in avc_has_perm_noaudit())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (c517d838eb7d Linux 4.0-rc1)
Merging iommu/next (eccd732182ce Merge branches 'iommu/fixes', 'x86/vt-d' a=
nd 'x86/amd' into next)
Merging dwmw2-iommu/master (1860e379875d Linux 3.15)
Merging vfio/next (71be3423a62b vfio: Split virqfd into a separate module f=
or vfio bus drivers)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (1913c6f4488e README: Change gzip/bzip2 to xz com=
pression format)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (724e7bfcc566 audit: Remove condition which always evalu=
ates to false)
Merging devicetree/devicetree/next (fca8ba4ee24d of/unittest: Remove obsole=
te code)
Merging dt-rh/for-next (f64255b5072d Revert "of: Fix premature bootconsole =
disable with 'stdout-path'")
Merging mailbox/mailbox-for-next (ee23d66af921 mailbox: arm_mhu: add driver=
 for ARM MHU controller)
Merging spi/for-next (2e399ca1af1c Merge remote-tracking branches 'spi/topi=
c/spidev' and 'spi/topic/spidev-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (414ea576f3dc Merge branch 'x86/ras')
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (960f889bfb53 Merge branch 'irqchip/stacke=
d-irq_set_wake' into irqchip/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/irq.c
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c19565fc83e6 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (0c87731f0cf6 rcu: Force wakeup of rcu_gp_kthread at g=
race-period end)
Merging kvm/linux-next (4ff6f8e61eb7 KVM: emulate: fix CMPXCHG8B on 32-bit =
hosts)
Merging kvm-arm/next (1a74847885cc arm/arm64: KVM: Fix migration race in th=
e arch timer)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic.c
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (18280d8b4bcd KVM: s390: represent SIMD cap in kvm fac=
ility)
Merging xen-tip/linux-next (278edfc07875 xen-pciback: also support disablin=
g of bus-mastering and memory-write-invalidate)
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (3494fc30846d workqueue: dump workqueues on sys=
rq-t)
Merging drivers-x86/for-next (0a63ca11b42b MAINTAINERS: Add missing Toshiba=
 devices and add myself as maintainer)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (5e83a0463ac0 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (3bbfb37a3520 dt-binding: leds: Add common LED DT bin=
dings macros)
Merging ipmi/for-next (3a31f945b709 ipmi: Remove incorrect use of seq_has_o=
verflowed)
Merging driver-core/driver-core-next (06e5801b8cb3 Linux 4.0-rc4)
Merging tty/tty-next (caa445d808d2 Merge 4.0-rc5 into tty-next)
Merging usb/usb-next (cd0e075784f4 Merge 4.0-rc5 into usb-next)
Merging usb-gadget/next (a3dd3befd7cb usb: gadget: atmel_usba: use endian a=
gnostic IO on ARM)
Merging usb-serial/usb-next (394a10331a9e USB: ch341: remove redundant clos=
e from open error path)
Merging staging/staging-next (807dc0668e7a Merge 4.0-rc5 into staging-testi=
ng)
CONFLICT (content): Merge conflict in drivers/staging/media/mn88473/mn88473=
.c
Merging char-misc/char-misc-next (a087146c72ba uio: Request/free irq separa=
te from dev lifecycle)
Merging extcon/extcon-next (66bee35f2968 extcon: Fix missing locking when [=
un]registering notifiers)
Merging kdbus/kdbus (ac30e5255c12 kdbus: connection: fix handling of failed=
 fget())
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (4a44b7a98b7f Merge branch 'misc' into for-next)
Merging target-updates/for-next (5bc6510f919b iscsi-target: don't export st=
atic symbol)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (a0cdc72095fc Merge branch 'devel' into for-next)
Merging vhost/linux-next (1179c21e8917 virtio_blk: fix comment for virtio 1=
.0)
Merging remoteproc/for-next (315491e5d6ee remoteproc: add IOMMU hardware ca=
pability flag)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (ff2b564112f8 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (6da89312a39b pwm: samsung: Fix output race on disabli=
ng)
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (0833b5ae6902 Merge tag 'mvebu-clk-4.1' of git://git.i=
nfradead.org/linux-mvebu into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (84f887bfb930 selftests: Set CC using CROSS_COMPILE =
once in lib.mk)
CONFLICT (content): Merge conflict in tools/testing/selftests/powerpc/Makef=
ile
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (c5b19946eb76 kernel: Fix sparse warning for=
 ACCESS_ONCE)
Merging livepatching/for-next (9b9467011449 Merge branch 'for-4.0/upstream-=
fixes' into for-next)
Merging akpm-current/current (62dadaf807ab x86: switch to using asm-generic=
 for seccomp.h)
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in README
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: mips: ip32: add platform data hooks to use DS1685 driver
Applying: oprofile: reduce mmap_sem hold for mm->exe_file
Applying: powerpc/oprofile: reduce mmap_sem hold for exe_file
Applying: oprofile-reduce-mmap_sem-hold-for-mm-exe_file-fix
Applying: tomoyo: reduce mmap_sem hold for mm->exe_file
Applying: tomoyo-reduce-mmap_sem-hold-for-mm-exe_file-checkpatch-fixes
Applying: MAINTAINERS: add Mediatek SoC mailing list
Applying: .gitignore: ignore *.tar
Applying: drivers/rtc/rtc-s5m.c: allow usage on device type different than =
main MFD type
Applying: Documentation/spi/spidev_test.c: fix warning
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (d334e897fb8e mm: add strictlimit knob)

--Sig_/D_z2eScWhg584ruJY7cuIxg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVERJiAAoJEMDTa8Ir7ZwV8UgP/0MCbQnRkuMG1gRrZJYpkBQx
9sCJD20PMC7ZBiMzyNOxz526qvsE40Ql1CXD6nE+4yrpXBq9pP4tRW9pWG8gjRc+
SK70A4KjnQlARYZutZZBXfrLRKM3HUb1sdp3UgIn19ietOh4c+9H9siObRWY80pZ
d8+fNr1J0yVa5l2k6qMxcMKxMfJ0MplPJiZaFAhpkZfiniDT9ijg2AkS0NeDx8sv
NAvqC6qoyIXPFJ9sbpAt0HTSjpxghOl/Q8DMO1tF04hiYr7nAKu/Hv6ANMoJO99J
oOVLPutbtNH2dP+v7Lqvvq8LOAGVRDn+m0D1aT2MT7ZIuvBkDQaIG9lh2WS844rY
pX3MWZEgCNNvWzjxFaSEOJ5+cVtij7XhLAJB2tN6dPcbdjO1EDrC7xG0zaBXeePF
rQHdbAkwnETq3jmo4dmNj7fjMsntrGWaLSDL/cTLbSq1yuYgCJVMg0WLhbXjWnkE
btR3IrEx1TxRJTKbXFPTxbVjpGh5Selm3TtA3tSuAPokK0rZ1/N/8/xACKen/ZSr
x8NOHtdUW4E6C9A0/SBd15nLCm2e/L+nzMMvws+bi73DweLtAvBM4gUFSfm9RUa2
SKCifx5N4zPMppObwHOkWCrKYiFR3PugiYCVfCDO2JewWfO7Zpp/XJBcNockTYhm
pDi4UsYDViZQtwNL70hA
=0SJ2
-----END PGP SIGNATURE-----

--Sig_/D_z2eScWhg584ruJY7cuIxg--
