From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 20
Date: Fri, 20 Mar 2015 19:41:21 +1100
Message-ID: <20150320194121.2951443d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y+r7kYOhMEE5WsHBBJ7YXKv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/y+r7kYOhMEE5WsHBBJ7YXKv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150319:

The vfs tree still had its build failure for which I applied a patch.

The battery tree gained a conflict against the hid tree.

The spi tree gained a conflict against the jc_docs tree.

Non-merge commits (relative to Linus' tree): 5204
 4973 files changed, 225035 insertions(+), 106115 deletions(-)

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
Merging origin/master (b314acaccd7e Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (2ce7598c9a45 Linux 3.17-rc4)
Merging arm-current/fixes (6d021b724481 ARM: dump pgd, pmd and pte states o=
n unhandled data abort faults)
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (c2996cb29bfb metag: Fix KSTK_EIP() and KSTK_ESP(=
) macros)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-merge-mpe/fixes (06e5801b8cb3 Linux 4.0-rc4)
Merging sparc/master (3c08158e0ef5 sparc: Fix /proc/kcore)
Merging net/master (8d006e010597 Revert "net: cx82310_eth: use common match=
 macro")
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (3fc6c5a1cfb9 Merge tag 'asoc-fix-v4.0-rc4'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-li=
nus)
Merging pci-current/for-linus (bc3b5b47c80d PCI: cpcihp: Add missing curly =
braces in cpci_configure_slot())
Merging wireless-drivers/master (c09396eb8e5a ath9k: disable TPC support ag=
ain (for now))
Merging driver-core.current/driver-core-linus (d5e7cafd69da LZ4 : fix the d=
ata abort issue)
Merging tty.current/tty-linus (7fd6f640f2dd serial: 8250_dw: Fix deadlock i=
n LCR workaround)
Merging usb.current/usb-linus (a886bd92267c usb: common: otg-fsm: only sign=
al connect after switching to peripheral)
Merging usb-gadget-fixes/fixes (2c247804796b Revert "usb: gadget: zero: Add=
 support for interrupt EP")
Merging usb-serial-fixes/usb-linus (5e71fc8629ce USB: keyspan_pda: add new =
device id)
Merging staging.current/staging-linus (1f51d5801859 vt6655: Fix late settin=
g of byRFType.)
Merging char-misc.current/char-misc-linus (3d7a8278fdfd Revert "pcmcia: add=
 a new resource manager for non ISA systems")
Merging input-current/for-linus (09d042a2eb90 Revert "Input: synaptics - us=
e dmax in input_mt_assign_slots")
Merging crypto-current/master (ccfe8c3f7e52 crypto: aesni - fix memory usag=
e in GCM decryption)
Merging ide/master (842159640782 ide_tape: convert jiffies with jiffies_to_=
msecs)
Merging devicetree-current/devicetree/merge (6b1271de3723 of/unittest: Over=
lays with sub-devices tests)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (ec76f4007079 vfio-pci: Add missing break to e=
nable VFIO_PCI_ERR_IRQ_INDEX)
Merging kselftest-fixes/fixes (67d8712dcc70 selftests: Fix build failures w=
hen invoked from kselftest target)
Merging drm-intel-fixes/for-linux-next-fixes (7f0801e566cc drm/i915: Make s=
ure the primary plane is enabled before reading out the fb state)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (9eccca084320 Linux 4.0-rc3)
Merging arm/for-next (e163910f8e33 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm-perf/for-next/perf (97bf6af1f928 Linux 3.19-rc1)
Merging arm-soc/for-next (faa21ad5f889 arm-soc: document merges)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (bb4362858cc6 Merge branch 'imx/defconfig' into fo=
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
Merging tegra/for-next (7f2674cb733c Merge branch for-4.1/dt into for-next)
Merging arm64/for-next/core (06e5801b8cb3 Linux 4.0-rc4)
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
Merging m68knommu/for-next (f87d40974f62 m68k: Fix trivial typos in comment=
s)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (02df359ceb56 Merge branch '4.0-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/net/can/usb/kvaser_usb.c
CONFLICT (content): Merge conflict in arch/nios2/include/uapi/asm/Kbuild
Merging nios2/nios2-next (6347e2a10f70 nios2: mm: do not invoke OOM killer =
on kernel fault OOM)
Merging parisc-hd/for-next (64fa6213c716 parisc: Add compile-time check whe=
n adding new syscalls)
Merging powerpc/next (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-mpe/next (7f664cf9e422 powerpc/boot: don't clobber r6 and r=
7 in epapr boot)
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
Merging nfsd/nfsd-next (c517d838eb7d Linux 4.0-rc1)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f15844e0777f 9P: fix return value in v9fs_fid_xattr_=
set)
Merging ubifs/linux-next (b388e6a7a6ba UBI: fix missing brace control flow)
Merging xfs/for-next (88e8fda99a4c Merge branch 'xfs-mmap-lock' into for-ne=
xt)
Merging file-locks/linux-next (65782c7629bd locks: use cmpxchg to assign i_=
flctx pointer)
Merging vfs/for-next (074def59bce4 dcache: return -ESTALE not -EBUSY on dis=
tributed fs race)
CONFLICT (content): Merge conflict in fs/udf/file.c
Applying: ext4: iov_iter_count needs linux/uio.h
Merging pci/next (85e8a0af3740 Merge branches 'pci/iommu' and 'pci/resource=
' into next)
Merging hid/for-next (b86e721df3ba Merge branch 'for-4.0/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (b20d386485e2 i2c: designware: Suppress error mess=
age if platform_get_irq() < 0)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (d720acace4d7 hwmon: (pwm-fan, vexpress) C=
onstify of_device_id array)
Merging v4l-dvb/master (48b777c0833b Merge branch 'patchwork' into to_next)
Merging kbuild/for-next (94100b52d1c0 Merge branch 'kbuild/kconfig' into kb=
uild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (06db673f0fef Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (85674693de32 Merge branch 'pnp' into linux-next)
Merging idle/next (210109f4a19a Merge branches 'turbostat', 'sfi' and 'cpui=
dle' into release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (5912e264d9ee Merge branch 'tmon-fixes' of .git into n=
ext)
Merging thermal-soc/next (3d1b493e9886 Merge branch 'work-fixes' into work-=
next)
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
Merging net-next/master (91a0f9305601 i40e: add NVM update events to AQ cle=
an)
CONFLICT (content): Merge conflict in net/socket.c
CONFLICT (content): Merge conflict in net/ipv4/inet_diag.c
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (960d6d08e395 mwifiex: delay skb alloc=
ation for RX until cmd53 over)
Merging bluetooth/master (ea6edfbcefec mac802154: fix typo in header guard)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (7234bea69de2 mtd: clean up whitespace in linux/mtd/m=
ap.h)
Merging crypto/master (0b053c951829 lib: memzero_explicit: use barrier inst=
ead of OPTIMIZER_HIDE_VAR)
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (6b94aea01d4f Merge branch 'drm_next' of https://githu=
b.com/markyzq/kernel-drm-rockchip into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (23923ebaac52 drm: Remove unused DRM_M=
ODE_OBJECT_BRIDGE)
Merging drm-intel/for-linux-next (96be0adcf7e5 drm/i915: Send out the full =
AUX address)
Merging drm-tegra/drm/tegra/for-next (07d05cbf60ed drm/tegra: dc: Move more=
 code into ->init())
Merging drm-misc/topic/drm-misc (e12919ecd691 drm/dp: Print the number of b=
ytes processed for aux nacks)
Merging drm-exynos/exynos-drm/for-next (e7b30d56abc3 drm/exynos: fix the in=
itialization order in FIMD)
Merging sound/for-next (1aa9a4ea4fea ALSA: ice1724: ESI W192M: Add sampling=
 rate control of the ADC/DAC)
Merging sound-asoc/for-next (6cb59cf6a37a Merge remote-tracking branches 'a=
soc/topic/wm2200', 'asoc/topic/wm5100', 'asoc/topic/wm8731', 'asoc/topic/wm=
8804' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (c58616580ea5 Merge branch 'x86-urgent-for-lin=
us' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging virtio/virtio-next (c58616580ea5 Merge branch 'x86-urgent-for-linus=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging input/next (61c797d52dae Input: elan_i2c - fix typo in include head=
er guard)
CONFLICT (content): Merge conflict in drivers/input/mouse/synaptics.c
Merging block/for-next (bfd343aa1718 blk-mq: don't wait in blk_mq_queue_ent=
er() if __GFP_WAIT isn't set)
Merging device-mapper/for-next (cf987c1bc5d4 dm verity: add error handling =
modes for corrupted blocks)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (7ecdd4989479 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (4400755e356f md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (f2c23396d6e7 mfd: mc13xxx-core: %pF is only for f=
unction pointers)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (d3a6097b25e0 arm: mach-pxa: Decrement the power sup=
ply's device reference counter)
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/wacom.h
Applying: HID: wacom: merge fix for "Change ownership from driver to core"
Applying: HID: wacom: merge fix 2 for "Change ownership from driver to core"
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (66170b497fa2 Merge remote-tracking branches 're=
gulator/topic/palmas' and 'regulator/topic/wm8350' into regulator-next)
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
Merging vfio/next (2f51bf4be993 vfio: put off the allocation of "minor" in =
vfio_create_group)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (fb03ca8737be README: Change gzip/bzip2 to xz com=
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
Merging spi/for-next (8ffe649e5075 Merge remote-tracking branches 'spi/topi=
c/sc18is602', 'spi/topic/spidev' and 'spi/topic/spidev-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
CONFLICT (content): Merge conflict in Documentation/spi/spidev_test.c
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (eddeaa800c7c Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in drivers/usb/isp1760/isp1760-core.c
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (18b44b2b950a EDAC, i82443bxgx: Don't export stat=
ic symbol)
Merging irqchip/irqchip/for-next (6091267532da Merge branch 'irqchip/stacke=
d-irq_set_wake' into irqchip/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/irq.c
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (c19565fc83e6 Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (12c056600523 rcu: Associate quiescent-state reports w=
ith grace period)
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
Merging regmap/for-next (8658c6964b79 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (3bbfb37a3520 dt-binding: leds: Add common LED DT bin=
dings macros)
Merging ipmi/for-next (3a31f945b709 ipmi: Remove incorrect use of seq_has_o=
verflowed)
Merging driver-core/driver-core-next (06e5801b8cb3 Linux 4.0-rc4)
Merging tty/tty-next (48d7ff0eaacb drivers/tty: serial: remove info message)
Merging usb/usb-next (e9c585907f96 drivers: usb: storage: cypress_atacb.c: =
trivial checkpatch fixes)
Merging usb-gadget/next (46f5cace1cd0 usb: phy: msm: Remove dead code)
Merging usb-serial/usb-next (394a10331a9e USB: ch341: remove redundant clos=
e from open error path)
Merging staging/staging-next (5ec293650827 Staging: dgnc: release the lock =
before testing for nullity)
Merging char-misc/char-misc-next (208d51154c8d checkkconfigsymbols.py: filt=
er reports for tools/)
Merging extcon/extcon-next (34825e511971 extcon: Fix the checkpatch warning)
Merging kdbus/kdbus (ac30e5255c12 kdbus: connection: fix handling of failed=
 fget())
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (4a44b7a98b7f Merge branch 'misc' into for-next)
Merging target-updates/for-next (d23dbaaaa454 tcm_qla2xxx: Expose per endpo=
int dynamic_sessions attribute)
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
Merging clk/clk-next (5cf065f556cb Merge branch 'clk-fixes' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (84f887bfb930 selftests: Set CC using CROSS_COMPILE =
once in lib.mk)
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
Merging akpm-current/current (a524b75af003 x86: switch to using asm-generic=
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
Merging akpm/master (492b5d6d2083 mm: add strictlimit knob)

--Sig_/y+r7kYOhMEE5WsHBBJ7YXKv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVC902AAoJEMDTa8Ir7ZwVoyMP/0BF+QK0YYyR1O8EwAQa1amJ
sVHOQTef0cLWOJabm/1yJ8n58cbMNL2UDsSuNBDVWat9qXa0466lCf16swgKNW28
7q+HbJp++rraHDXh/y7zEf8wYYAIhaoRQ0u849Lv0s3NLAe6h95YfBDRAwId55lh
agawpELZdbHjleW2x16vqdFuK7+jm9y+EVdksyZlR/NQd70JQfv3LH6ueTrxLnrs
QxmOOTBQA3Kja7g3R4J2saF3bYWz3PQ86MigW5om7c+tOCE6woWintMR9ONp6yWh
qsShR0cwv71l9UURKmsUmRnETFQ46D1o9uUZSBoRGiP+rxBSx8ReB8zqIjpoDpjh
7GeHtkrPwM3jvNj4/iRtvCWoUlS8eleTwCTndvsRZD7DzwQc2ML+v30Vgq/25Hn2
RbjRtpKPix57E73zc4KQfaP2yK73zNJ3CxztvP+0RyFZ7t5CxkZWGGAJRWf0vxro
AqMFNRKBUCYKrfsd2nYm18FuYHf2Hme58UKKCVpPa6B6tJFLDSkdmRpYsKhuiZ/B
1SqKhc8KaeZqsTlFUIyZbKloCQ53v20pL3Vr8qGz4+IcjbxGdXXAxIIOXTN83f69
jD4bgK1PZObqdZCCX8xXPUZ/9ubsKjRsOxBohFErRIumcpSd1CzaKM62iWgZSwo+
o8po9cDDUVouwTVxKN8Y
=hp9R
-----END PGP SIGNATURE-----

--Sig_/y+r7kYOhMEE5WsHBBJ7YXKv--
