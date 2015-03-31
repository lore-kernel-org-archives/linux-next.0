From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Mar 31
Date: Wed, 1 Apr 2015 00:02:21 +1100
Message-ID: <20150401000221.21961ecd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_tOM/ADN998hixrMVSGrFYV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/_tOM/ADN998hixrMVSGrFYV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150330:

The arm64 tree gained a conflict against the arm-soc tree.

The idle tree gained a build failure so I used the version from
next-20150327.

The tip tree gained conflicts against the pm tree.

The akpm tree gained a conflict against the mips tree.

Non-merge commits (relative to Linus' tree): 7277
 6623 files changed, 304342 insertions(+), 138111 deletions(-)

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

I am currently merging 212 trees (counting Linus' and 30 trees of patches
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
Merging origin/master (6c310bc1acdd Merge tag 'locks-v4.0-5' of git://git.s=
amba.org/jlayton/linux)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (8defb3367fcd ARM: 8320/1: fix integer overflow i=
n ELF_ET_DYN_BASE)
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
Merging net/master (63c607321492 net: fec: setup right value for mdio hold =
time)
Merging ipsec/master (ac37e2515c1a xfrm: release dst_orig in case of error =
in xfrm_lookup())
Merging sound-current/for-linus (af95b41426e0 ALSA: hda - Add one more node=
 in the EAPD supporting candidate list)
Merging pci-current/for-linus (bc3b5b47c80d PCI: cpcihp: Add missing curly =
braces in cpci_configure_slot())
Merging wireless-drivers/master (69628cd0652a Merge tag 'iwlwifi-for-kalle-=
2015-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (bc465aa9d045 Linux 4.0-rc5)
Merging tty.current/tty-linus (8e4934c6d6c6 tty: serial: fsl_lpuart: clear =
receive flag on FIFO flush)
Merging usb.current/usb-linus (baf7a6c72668 Merge tag 'fixes-for-v4.0-rc6' =
of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (65582a7f4ce5 usb: isp1760: fix spin unlock =
in the error path of isp1760_udc_start)
Merging usb-serial-fixes/usb-linus (b229a0f840f7 USB: ftdi_sio: Use jtag qu=
irk for SNAP Connect E10)
Merging staging.current/staging-linus (3d8bbe243dc7 Merge tag 'iio-fixes-fo=
r-4.0c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into sta=
ging-linus)
Merging char-misc.current/char-misc-linus (bc465aa9d045 Linux 4.0-rc5)
Merging input-current/for-linus (98dc0703735d Input: synaptics - add quirk =
for Thinkpad E440)
Merging crypto-current/master (ccfe8c3f7e52 crypto: aesni - fix memory usag=
e in GCM decryption)
Merging ide/master (b314acaccd7e Merge branch 'for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/dtor/input)
Merging devicetree-current/devicetree/merge (41d9489319f2 drivers/of: Add e=
mpty ranges quirk for PA-Semi)
Merging rr-fixes/fixes (f47689345931 lguest: update help text.)
Merging vfio-fixes/for-linus (ec76f4007079 vfio-pci: Add missing break to e=
nable VFIO_PCI_ERR_IRQ_INDEX)
Merging kselftest-fixes/fixes (67d8712dcc70 selftests: Fix build failures w=
hen invoked from kselftest target)
Merging drm-intel-fixes/for-linux-next-fixes (ee73c61c0af5 drm/i915: Skip a=
llocating shadow batch for 0-length batches)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (1ea72f5aad56 arc: copy_thread(): rename 'arg' argumen=
t to 'kthread_arg')
Merging arm/for-next (3ebe15e18a14 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (82d31a990fa4 Merge branches 'perf/updates' =
and 'perf/cci' into for-next/perf)
Merging arm-soc/for-next (1e16d247349c Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/bus/Kconfig
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (33e156f34c26 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (2afa4f248a76 Merge branch 'mvebu/fixes' into mvebu/=
for-next)
Merging omap/for-next (65457af22add Merge tag 'v4.1-soc' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (53a6e5250291 Merge branch 'heads/soc-cleanup-for-v4.1=
' into next)
Merging samsung/for-next (5d5443b9c3ba Merge branch 'v4.1-next/mach-samsung=
' into for-next)
Merging sunxi/sunxi/for-next (952934e18fef Merge branch 'sunxi/dt-for-4.1' =
into sunxi/for-next)
Merging tegra/for-next (66f0f096bd24 Merge branch for-4.1/dt into for-next)
Merging arm64/for-next/core (475bfd3d67fa arm64: defconfig: updates for 4.1)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging arm64-acpi/for-next/acpi (e441986ea317 ARM64 / ACPI: make acpi_map_=
gic_cpu_interface() as void function)
Merging blackfin/for-linus (275f5a8573e7 blackfin: defconfigs: cleanup unus=
ed CONFIG_MTD_CHAR, add MTD_SPI_NOR for BF537-STAMP)
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
Merging m68knommu/for-next (6e4206136faa m68knommu: fix fec setup warning f=
or ColdFire 5271 builds)
Merging metag/for-next (40346a0327fe metag: copy_thread(): rename 'arg' arg=
ument to 'kthread_arg')
Merging microblaze/next (c2219eda5478 microblaze: Fix syscall error recover=
y for invalid syscall IDs)
Merging mips/mips-for-linux-next (f3ea2040ad04 Merge branches '4.1-fp' and =
'4.0-fixes' into mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/bus/Makefile
Merging nios2/nios2-next (6347e2a10f70 nios2: mm: do not invoke OOM killer =
on kernel fault OOM)
Merging parisc-hd/for-next (476840458128 parisc: Eliminate sg_virt_addr() a=
nd private scatterlist.h)
Merging powerpc/next (910681de70b7 Merge branch 'next-misc' into next)
Merging powerpc-mpe/next (4cd968ef4249 selftests/powerpc: Add a test of the=
 switch_endian() syscall)
Merging fsl/next (0dc294f717d4 powerpc/mm: bail out early when flushing TLB=
 page)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (1a327ffd3d6a s390/syscalls: simplify syscall_get_arc=
h())
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (0631818c4f64 arch: tile: fix null pointer dereference =
on pt_regs pointer)
Merging uml/linux-next (b98b91029cf8 hostfs: No need to box and later unbox=
 the file mode)
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
Merging cifs/for-next (37e6cb185d75 Fix warning on impossible comparison)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (5ce1aca81435 reiserfs: fix __RASSERT format string)
Merging ext4/dev (6f30b7e37a82 ext4: fix indirect punch hole corruption)
Merging f2fs/dev (fc655b4ed0a1 f2fs: fix sparse warnings)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (7b4ddfa7c952 gfs2: incorrect check for debugfs retur=
ns)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (68591ae555be nfsd: allow setting acls with unenforc=
eable DENYs)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f569d3ef8254 net/9p: add a privport option for RDMA =
transport.)
Merging ubifs/linux-next (3527a86b7ae1 Merge tag 'v4.0-rc5' into linux-next)
Merging xfs/for-next (a448f8f1b744 Merge branch 'fallocate-insert-range' in=
to for-next)
Merging file-locks/linux-next (15323f0c6a8d locks: use cmpxchg to assign i_=
flctx pointer)
Merging net-next/master (d482994fca82 tipc: fix two bugs in secondary desti=
nation lookup)
CONFLICT (content): Merge conflict in net/ipv6/tcp_ipv6.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_ipv4.c
CONFLICT (content): Merge conflict in include/linux/usb/usbnet.h
CONFLICT (content): Merge conflict in drivers/net/usb/usbnet.c
CONFLICT (content): Merge conflict in drivers/net/usb/sr9800.c
CONFLICT (content): Merge conflict in drivers/net/usb/asix_common.c
Applying: usbnet: fix bad merge in cdc_ncm.c
Merging vfs/for-next (8ec7e485327a Merge branch 'for-davem' into for-next)
CONFLICT (content): Merge conflict in fs/udf/file.c
Merging pci/next (8e795840e4d8 Merge branches 'pci/enumeration' and 'pci/vi=
rtualization' into next)
Merging hid/for-next (10dcaf31233a Merge branch 'for-4.1/upstream' into for=
-next)
Merging i2c/i2c/for-next (3b10db23c041 i2c: dln2: set the device tree node =
of the adapter)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (fcaf57b67dd0 hwmon: (ibmpowernv) do not u=
se the OPAL index for hwmon attribute names)
Merging v4l-dvb/master (65ec78ae2f91 Merge branch 'v4l_for_linus' into to_n=
ext)
Merging kbuild/for-next (4ee14ab5a132 Merge branches 'kbuild/kbuild' and 'k=
build/kconfig' into kbuild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (e672f666d8b0 Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (14a5fa0f140e Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging idle/next (d913ce4cdc9c Merge branch 'turbostat' into release)
$ git reset --hard HEAD^
Merging next-20150327 version of idle
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (c0c01971b43f Thermal: do thermal zone update after a =
cooling device registered)
Merging thermal-soc/next (65a7db8371d1 thermal: cpu_cooling: Check memory a=
llocation of power_table)
CONFLICT (content): Merge conflict in include/linux/thermal.h
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (739e9c81155e Merge branch 'fixes' into next)
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-mackerel.c deleted i=
n HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/m=
ach-shmobile/board-mackerel.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-shmobile/board-ape6evm.c deleted in=
 HEAD and modified in slave-dma/next. Version slave-dma/next of arch/arm/ma=
ch-shmobile/board-ape6evm.c left in tree.
$ git rm -f arch/arm/mach-shmobile/board-mackerel.c arch/arm/mach-shmobile/=
board-ape6evm.c
Merging ipsec-next/master (74005991b78a xfrm: Do not parse 32bits compiled =
xfrm netlink msg on 64bits host)
Merging wireless-drivers-next/master (9374e7d2fdca rtlwifi: rtl8192cu: Add =
new device ID)
Merging bluetooth/master (db6e3e8d0168 Bluetooth: Refactor HCI request vari=
ables into own struct)
Merging infiniband/for-next (147d1da951cf Merge branches 'core', 'cxgb4', '=
iser', 'mlx4', 'mlx5', 'ocrdma', 'odp', 'qib' and 'srp' into for-next)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (8cc7f33aadc8 mtd: spi-nor: factor out replace-able f=
lash_{lock,unlock})
Merging crypto/master (fa50d7ee45bf crypto: arm/ghash - fix big-endian bug =
in ghash)
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (ae10c2248593 Merge branch 'drm/next/rcar-du' of git:/=
/linuxtv.org/pinchartl/fbdev into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-panel/drm/panel/for-next (94cfcae97787 drm/panel: Add display t=
iming for HannStar HSD070PWW1)
Merging drm-intel/for-linux-next (1ff27a3443ad drm/i915: Update DRIVER_DATE=
 to 20150327)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
Merging drm-tegra/drm/tegra/for-next (13a7a6ac0a11 Linux 4.0-rc2)
Merging drm-misc/topic/drm-misc (a0211bb482c3 drm/atomic: Don't try to free=
 a NULL state)
Merging drm-exynos/exynos-drm/for-next (e7b30d56abc3 drm/exynos: fix the in=
itialization order in FIMD)
Merging sound/for-next (4738465c3729 ALSA: hda/via - Add beep controls to V=
IA codecs)
Merging sound-asoc/for-next (dc6dce0f7e18 Merge remote-tracking branch 'aso=
c/topic/wm8996' into asoc-next)
Merging modules/modules-next (cc9e605dc6cb module: do not print allocation-=
fail warning on bogus user buffer size)
Merging virtio/virtio-next (2f921b5bb051 lguest: suppress interrupts for si=
ngle insn, not range.)
Merging input/next (709583e894af Input: edt-ft5x06 - remove EV_SYN event re=
port)
Merging block/for-next (ce29e701fae9 Merge branch 'for-4.1/core' into for-n=
ext)
Merging device-mapper/for-next (0cb2ea0a659c dm table: use bool function re=
turn values of true/false not 1/0)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (9c8ad606ec33 mmc: omap_hsmmc: use generic slot-gpio is=
r to manage card detect pin)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (4bbe5e27f0c6 md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (ba867bc60a44 mfd: twl6040: Remove wrong and unnee=
ded "platform:twl6040" modalias)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (7be5ac2c32bd power/reset: at91: big endian fixes fo=
r atsama5d3x)
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/wacom.h
Applying: HID: wacom: merge fix for "Change ownership from driver to core"
Applying: HID: wacom: merge fix 2 for "Change ownership from driver to core"
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (f3f39490c294 Merge remote-tracking branches 're=
gulator/topic/notifier', 'regulator/topic/palmas', 'regulator/topic/stw481x=
' and 'regulator/topic/wm8350' into regulator-next)
Merging security/next (1018bc268864 tpm/st33zp24/spi: Add missing device ta=
ble for spi phy.)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (9959049e4400 selinux: increase avtab max buckets)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (b0409b703b92 Merge branches 'iommu/fixes', 'x86/vt-d' a=
nd 'x86/amd' into next)
Merging dwmw2-iommu/master (03ecc32c5274 iommu/vt-d: support extended root =
and context entries)
Merging vfio/next (71be3423a62b vfio: Split virqfd into a separate module f=
or vfio bus drivers)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (b1544e392e86 Documentation:Update Documentation/=
zh_CN/arm64/memory.txt)
Merging trivial/for-next (0e4f93e5017d goldfish: goldfish_tty_probe() is no=
t using 'i' any more)
Merging audit/next (724e7bfcc566 audit: Remove condition which always evalu=
ates to false)
Merging devicetree/devicetree/next (a2166ca5f320 Merge remote-tracking bran=
ch 'robh/for-next' into devicetree/next)
CONFLICT (rename/delete): Documentation/devicetree/bindings/mips/brcm/brcm,=
cm-dsl.txt deleted in HEAD and renamed in devicetree/devicetree/next. Versi=
on devicetree/devicetree/next of Documentation/devicetree/bindings/mips/brc=
m/brcm,cm-dsl.txt left in tree.
CONFLICT (rename/delete): Documentation/devicetree/bindings/mips/brcm/brcm,=
bcm3384-intc.txt deleted in HEAD and renamed in devicetree/devicetree/next.=
 Version devicetree/devicetree/next of Documentation/devicetree/bindings/mi=
ps/brcm/brcm,bcm3384-intc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/mips/brcm/brcm,bcm3384-intc.t=
xt Documentation/devicetree/bindings/mips/brcm/brcm,cm-dsl.txt
Merging dt-rh/for-next (01218bf14ee6 of: Explicitly include linux/types.h i=
n of_graph.h)
Merging mailbox/mailbox-for-next (ee23d66af921 mailbox: arm_mhu: add driver=
 for ARM MHU controller)
Merging spi/for-next (4ac9064e11ed Merge remote-tracking branches 'spi/topi=
c/s3c64xx', 'spi/topic/sc18is602', 'spi/topic/spidev' and 'spi/topic/spidev=
-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (8ec333a4b91f Merge branch 'x86/ras')
CONFLICT (content): Merge conflict in kernel/time/tick-internal.h
CONFLICT (content): Merge conflict in kernel/time/tick-common.c
CONFLICT (content): Merge conflict in kernel/time/tick-broadcast.c
CONFLICT (content): Merge conflict in include/linux/clockchips.h
CONFLICT (content): Merge conflict in arch/arm/common/bL_switcher.c
Applying: ARM: VDSO: rename tkr to tkr_mono
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (19392ad5ebab Merge branch 'irqchip/stacke=
d-irq_set_wake' into irqchip/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (acf3df95ae92 Merge branch 'for-next/trace/tracefs'=
 into trace/for-next)
Merging rcu/rcu/next (2484a8290184 rculist: Fix another sparse warning)
Merging kvm/linux-next (4ff6f8e61eb7 KVM: emulate: fix CMPXCHG8B on 32-bit =
hosts)
Merging kvm-arm/next (d44758c0dfc5 KVM: arm/arm64: enable KVM_CAP_IOEVENTFD)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic.c
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (18280d8b4bcd KVM: s390: represent SIMD cap in kvm fac=
ility)
Merging xen-tip/linux-next (278edfc07875 xen-pciback: also support disablin=
g of bus-mastering and memory-write-invalidate)
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (bffc4375897e percpu: Fix trivial typos in comm=
ents)
Merging drivers-x86/for-next (5d3fc1d54e5a toshiba_bluetooth: Fix enabling/=
disabling loop on recent devices)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (5e83a0463ac0 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (f034125dfdae HSI: nokia-modem: fix error return code)
Merging leds/for-next (ccdc45075aea leds: Don't treat the LED name as a for=
mat string)
Merging ipmi/for-next (3a31f945b709 ipmi: Remove incorrect use of seq_has_o=
verflowed)
Merging driver-core/driver-core-next (fdc81b7910ad stable_kernel_rules: Add=
 clause about specification of kernel versions to patch.)
Merging tty/tty-next (da29169e7692 serial: 8250_dw: fix 'cts-override')
Merging usb/usb-next (1c41a9570a02 Merge tag 'usb-for-v4.1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next)
Merging usb-gadget/next (3e457371f436 usb: musb: Fix fifo reads for dm816x =
with musb_dsps)
Merging usb-serial/usb-next (65dd82ae453f USB: f81232: fix some minor style=
 issues)
Merging staging/staging-next (153fe946412b staging: fbtft: Do not use binar=
y constants)
CONFLICT (content): Merge conflict in drivers/staging/media/mn88473/mn88473=
.c
Merging char-misc/char-misc-next (3a267d3b22f5 i8k: Remove use of seq_print=
f return value)
Merging extcon/extcon-next (66bee35f2968 extcon: Fix missing locking when [=
un]registering notifiers)
Merging kdbus/kdbus (1e951b699ad9 kdbus: Fix CONFIG_KDBUS help text)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (4a44b7a98b7f Merge branch 'misc' into for-next)
Merging target-updates/for-next (377c757b7d86 iser-target: Bump version to =
1.0)
Merging target-merge/for-next-merge (b28a960c42fc Linux 3.14-rc2)
Merging pinctrl/for-next (bef6ff0b15ef Merge branch 'devel' into for-next)
Merging vhost/linux-next (1179c21e8917 virtio_blk: fix comment for virtio 1=
.0)
Merging remoteproc/for-next (315491e5d6ee remoteproc: add IOMMU hardware ca=
pability flag)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings ar=
e small)
Merging gpio/for-next (e03f967e2bd6 Merge branch 'devel' into for-next)
Merging dma-mapping/dma-mapping-next (04abab698285 include/dma-mapping: Cla=
rify output of dma_map_sg)
Merging pwm/for-next (71d54bfabb28 drivers/pwm: Remove __init initializer f=
or pwm_add_table)
Merging dma-buf/for-next (56a4d3e2e2d4 staging: android: ion: fix wrong ini=
t of dma_buf_export_info)
Merging userns/for-next (db86da7cb76f userns: Unbreak the unprivileged remo=
unt tests)
Merging ktest/for-next (7c2c49eceb79 ktest: Place quotes around item variab=
le)
Merging clk/clk-next (045ecad0fdb2 clk: samsung: exynos3250: Add driver for=
 CMU_ISP clock domain)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (0b63accf8722 tools, update rtctest.c to verify pass=
age of time)
CONFLICT (content): Merge conflict in tools/testing/selftests/powerpc/Makef=
ile
Merging y2038/y2038 (ed8c2241c1ae coredump: Use 64bit time for unix time of=
 coredump)
CONFLICT (content): Merge conflict in drivers/staging/media/lirc/lirc_paral=
lel.c
Merging luto-misc/next (a6c5170d1ede Merge branch 'for-4.0' of git://linux-=
nfs.org/~bfields/linux)
Merging access_once/linux-next (bc465aa9d045 Linux 4.0-rc5)
Merging livepatching/for-next (075b759be1bb Merge branch 'for-4.1/core-s390=
' into for-next)
CONFLICT (content): Merge conflict in arch/s390/Kconfig
Merging akpm-current/current (e38d2ff606af zsmalloc: remove extra cond_resc=
hed() in __zs_compact)
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Documentation/printk-formats.txt
$ git checkout -b akpm remotes/origin/akpm/master
Applying: arch/unicore32/kernel/fpu-ucf64.c: remove unnecessary KERN_ERR
Applying: lib/Kconfig: fix up HAVE_ARCH_BITREVERSE help text
Applying: mips: ip32: add platform data hooks to use DS1685 driver
CONFLICT (content): Merge conflict in arch/mips/sgi-ip32/ip32-platform.c
Applying: oprofile: reduce mmap_sem hold for mm->exe_file
Applying: powerpc/oprofile: reduce mmap_sem hold for exe_file
Applying: oprofile-reduce-mmap_sem-hold-for-mm-exe_file-fix
Applying: tomoyo: reduce mmap_sem hold for mm->exe_file
Applying: tomoyo-reduce-mmap_sem-hold-for-mm-exe_file-checkpatch-fixes
Applying: MAINTAINERS: add Mediatek SoC mailing list
Applying: .gitignore: ignore *.tar
Applying: drivers/rtc/rtc-s5m.c: allow usage on device type different than =
main MFD type
Applying: rtc-s5m-allow-usage-on-device-type-different-than-main-mfd-type-v2
Applying: Documentation/spi/spidev_test.c: fix warning
Applying: drivers/rtc/rtc-at91rm9200.c: make IO endian agnostic
Applying: mm, x86: document return values of mapping funcs
Applying: mtrr, x86: fix MTRR lookup to handle inclusive entry
Applying: mtrr, x86: remove a wrong address check in __mtrr_type_lookup()
Applying: mtrr, x86: fix MTRR state checks in mtrr_type_lookup()
Applying: mtrr, x86: define MTRR_TYPE_INVALID for mtrr_type_lookup()
Applying: mtrr, x86: clean up mtrr_type_lookup()
Applying: mtrr, mm, x86: enhance MTRR checks for KVA huge page mapping
Applying: drivers/w1/w1_int.c: call put_device if device_register fails
Applying: mm: add strictlimit knob
Merging akpm/master (d9a3d732ac6d mm: add strictlimit knob)

--Sig_/_tOM/ADN998hixrMVSGrFYV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGprlAAoJEMDTa8Ir7ZwVbEAP/2yemdBvBjFFGLfmHkWpRgoT
/+qRX9j2lb/FHNmHLYrYYsN3pRUYt3SQ1QIGm7gKmUEJd36+xDXiqvba5r6VF6Yg
VRWgipiJoTN82HE8wOlNS7092ducHz+gERE46wBM5oZYUF1rjrcyzK4Nrd0Nic7+
nxW+qGXxTsLyk+5HQ1clpsx17qEcNhfS0eGfcesDRLFaVypVqXVmlRhwHx4oHqWL
CDkWKX3RZkKUpG4fbcyKoAS/b4xNfAOgW0CVRrj/yUS3UkhkEwkijxing727sitE
O1F8cSRMYOcg0I6GbJTW6j1Y0WqMJIS3LxgCybVofnFgPUD21cWMLzw7FMM+h3vv
cb2eJTfCOdv0oi1zOroLDfga6iD/X8gKn0q+29/Qp58TMtIm0nm8fUzkRSHLM7n0
aDkBe4ENW/p86Rq3NFod1Q+hpyDo1EgsIurG6/lbGp9VqSuoMmN7Fa/C+HyHVbYH
lWjCFpt/0IoR/ujNUyPpF4DH+yAAytmWs4ilVDCnZTf6baWdOSU1jokeM/lnpRhs
vh1AhZCJKTvHOD6iz46QHgX80sDS9644Kp3Yl3FR58nL7ZJ2JJjOugvA2ODyQ2M2
u3s/O6Nw/Pv72JkHlDVzbFeaxfucofTZDTiGhIPF3pYyKA3hg4nBoo8EX8TAvic4
3q/eJc8MyNdrB+U2BafA
=CO+u
-----END PGP SIGNATURE-----

--Sig_/_tOM/ADN998hixrMVSGrFYV--
