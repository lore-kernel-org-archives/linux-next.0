From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Apr 8
Date: Wed, 8 Apr 2015 21:05:45 +1000
Message-ID: <20150408210545.1b021bbe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l/BFPFnZ4jkjodbK2oud5NB"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60379 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752729AbbDHLFz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2015 07:05:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

--Sig_/l/BFPFnZ4jkjodbK2oud5NB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20150407:

The arm-soc tree still had its build failure for which I reverted a commit.

The spi tree lost its build failure.

The tip tree's build failure was a semantic merge conflict so I applied
a supplied fix.

The akpm-current tree gained conflicts against the tip tree.

The akpm tree gained a conflict against the tip tree, and as a
consequence, lost a patch.

Non-merge commits (relative to Linus' tree): 9155
 8066 files changed, 376249 insertions(+), 183459 deletions(-)

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
Merging origin/master (f22e6e847115 Linux 4.0-rc7)
Merging fixes/master (b94d525e58dc Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging kbuild-current/rc-fixes (c517d838eb7d Linux 4.0-rc1)
Merging arc-current/for-curr (e4140819dadc ARC: signal handling robustify)
Merging arm-current/fixes (f6ac49ba2949 ARM: vexpress: fix CPU hotplug with=
 CT9x4 tile.)
Merging m68k-current/for-linus (4436820a98cd m68k/defconfig: Enable Etherne=
t bridging)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cache=
d build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-merge/merge (c517d838eb7d Linux 4.0-rc1)
Merging powerpc-merge-mpe/fixes (1cced5015b17 Merge branch 'for-linus' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging sparc/master (90a5a895cc8b Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/davem/net)
Merging net/master (0ad2a8365975 netem: Fixes byte backlog accounting for t=
he first of two chained netem instances)
Merging ipsec/master (092a29a40bab vti6: fix uninit when using x-netns)
Merging sound-current/for-linus (9fc88ad6fd86 ALSA: usb-audio: don't try to=
 get Benchmark DAC1 sample rate)
Merging pci-current/for-linus (72061d93de31 PCI: Don't look for ACPI hotplu=
g parameters if ACPI is disabled)
Merging wireless-drivers/master (69628cd0652a Merge tag 'iwlwifi-for-kalle-=
2015-03-30' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlw=
ifi-fixes)
Merging driver-core.current/driver-core-linus (bc465aa9d045 Linux 4.0-rc5)
Merging tty.current/tty-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb.current/usb-linus (f22e6e847115 Linux 4.0-rc7)
Merging usb-gadget-fixes/fixes (65582a7f4ce5 usb: isp1760: fix spin unlock =
in the error path of isp1760_udc_start)
Merging usb-serial-fixes/usb-linus (f22e6e847115 Linux 4.0-rc7)
Merging staging.current/staging-linus (f22e6e847115 Linux 4.0-rc7)
Merging char-misc.current/char-misc-linus (bc465aa9d045 Linux 4.0-rc5)
Merging input-current/for-linus (bd884149aca6 Input: elantech - fix absolut=
e mode setting on some ASUS laptops)
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
Merging drm-intel-fixes/for-linux-next-fixes (5df0582bf036 drm/i915/vlv: re=
move wait for previous GFX clk disable request)
Merging asm-generic/master (643165c8bbc8 Merge tag 'uaccess_for_upstream' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into asm-generic)
Merging arc/for-next (18e1d1b115f7 arc: copy_thread(): rename 'arg' argumen=
t to 'kthread_arg')
Merging arm/for-next (f40620630ac0 Merge branch 'devel-stable' into for-nex=
t)
Merging arm-perf/for-next/perf (874c571414d5 arm-cci: Fix CCI PMU event val=
idation)
Merging arm-soc/for-next (f12318bc515f ARM: SoC: document merges)
$ git am -3 ../patches/0001-Revert-ARM-dts-mt8135-Add-pinctrl-GPIO-EINT-nod=
e-for.patch
Applying: Revert "ARM: dts: mt8135: Add pinctrl/GPIO/EINT node for mt8135."
Merging at91/at91-next (d8a291a11778 Merge tag 'at91-dt2' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging rpi/for-rpi-next (9a5a3543e168 ARM: bcm2835: Fix i2c0 node name)
Merging berlin/berlin/for-next (c517d838eb7d Linux 4.0-rc1)
Merging cortex-m/for-next (e799b6f37e6c ARM: zImage: add support for ARMv7-=
M)
Merging imx-mxs/for-next (33e156f34c26 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b17275a4a6cc Merge branch 'for_3.19/soc' into next)
Merging mvebu/for-next (692763a6e674 Merge branch 'mvebu/leds-kirkwood' int=
o mvebu/for-next)
Merging omap/for-next (23aa6c6f4bed Merge branch 'omap-for-v4.0/fixes' into=
 for-next)
Applying: ARM: dts: omap3: fixup for merge conflict around omap3_scm_general
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for=
 OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_d=
ata.c
Merging renesas/next (53a6e5250291 Merge branch 'heads/soc-cleanup-for-v4.1=
' into next)
Merging samsung/for-next (5d5443b9c3ba Merge branch 'v4.1-next/mach-samsung=
' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/platsmp.c
Merging sunxi/sunxi/for-next (952934e18fef Merge branch 'sunxi/dt-for-4.1' =
into sunxi/for-next)
Merging tegra/for-next (47ee17a644f4 Merge branch for-4.1/dt into for-next)
Merging arm64/for-next/core (6d1966dfd6e0 arm64: fix midr range for Cortex-=
A57 erratum 832075)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging arm64-acpi/for-next/acpi (7676fa70feb2 ARM64 / ACPI: make acpi_map_=
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
Merging mips/mips-for-linux-next (3bb621412207 Merge branch '4.0-fixes' int=
o mips-for-linux-next)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/bus/Makefile
Merging nios2/nios2-next (6347e2a10f70 nios2: mm: do not invoke OOM killer =
on kernel fault OOM)
Merging parisc-hd/for-next (476840458128 parisc: Eliminate sg_virt_addr() a=
nd private scatterlist.h)
Merging powerpc/next (910681de70b7 Merge branch 'next-misc' into next)
Merging powerpc-mpe/next (6a840791182c powerpc32/chrp: fix section mismatch=
 warning)
Merging fsl/next (d41444daba1f powerpc/corenet: enable CONFIG_I2C_MUX and C=
ONFIG_I2C_MUX_PCA954x)
Merging mpc5xxx/next (9e813308a5c1 powerpc/thp: Add tracepoints to track hu=
gepage invalidate)
Merging s390/features (1a327ffd3d6a s390/syscalls: simplify syscall_get_arc=
h())
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (28d86a60ebad tile: nohz: warn if nohz_full uses hyperv=
isor shared cores)
Merging uml/linux-next (b98b91029cf8 hostfs: No need to box and later unbox=
 the file mode)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFRE=
Q config option)
Merging xtensa/for_next (0372c1abdd0d Merge tag 'xtensa-for-next-20150304' =
of git://github.com/jcmvbkbc/linux-xtensa into for_next)
Merging btrfs/next (4a3d1caf8a2c fs: btrfs: Add missing include file)
Merging ceph/master (388cfdc9bc19 libceph: require cephx message signature =
by default)
CONFLICT (content): Merge conflict in net/ceph/ceph_common.c
CONFLICT (content): Merge conflict in net/ceph/auth_x.c
CONFLICT (content): Merge conflict in include/linux/ceph/libceph.h
CONFLICT (content): Merge conflict in fs/ceph/super.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
CONFLICT (content): Merge conflict in fs/ceph/snap.c
CONFLICT (content): Merge conflict in fs/ceph/inode.c
Merging cifs/for-next (be4a8e38d68f Update negotiate protocol for SMB3.1 di=
alect)
Merging ecryptfs/next (6d65261a09ad eCryptfs: don't pass fs-specific ioctl =
commands through)
Merging ext3/for_next (5ce1aca81435 reiserfs: fix __RASSERT format string)
Merging ext4/dev (2f5baf845b0f ext4 crypto: enable encryption feature flag)
Merging f2fs/dev (d492701ff78c f2fs: do not recover wrong data index)
Merging fscache/fscache (1a8ed18fb7db cachefiles: remove two unused pagevec=
s.)
CONFLICT (content): Merge conflict in fs/fscache/object.c
Merging fuse/for-next (94e4fe2cab3d fuse: explicitly set /dev/fuse file's p=
rivate_data)
Merging gfs2/for-next (7b4ddfa7c952 gfs2: incorrect check for debugfs retur=
ns)
Merging jfs/jfs-next (7d2ac45611b0 jfs: %pf is only for function pointers)
Merging nfs/linux-next (9eccca084320 Linux 4.0-rc3)
Merging nfsd/nfsd-next (1ec8c0c47f63 nfsd: Remove duplicate macro define fo=
r max sec label length)
Merging overlayfs/overlayfs-next (71cbad7e694e ovl: upper fs should not be =
R/O)
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configu=
ration option)
Merging v9fs/for-next (f569d3ef8254 net/9p: add a privport option for RDMA =
transport.)
Merging ubifs/linux-next (3527a86b7ae1 Merge tag 'v4.0-rc5' into linux-next)
Merging xfs/for-next (a448f8f1b744 Merge branch 'fallocate-insert-range' in=
to for-next)
Merging file-locks/linux-next (0429c2b5c1c4 locks: use cmpxchg to assign i_=
flctx pointer)
Merging net-next/master (ee90b81203a9 hv_netvsc: Fix the packet free when i=
t is in skb headroom)
Merging vfs/for-next (d987f083c43b ntfs: move iov_iter_truncate() closer to=
 generic_write_checks())
CONFLICT (content): Merge conflict in net/9p/protocol.c
CONFLICT (content): Merge conflict in fs/udf/file.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
Merging pci/next (8e795840e4d8 Merge branches 'pci/enumeration' and 'pci/vi=
rtualization' into next)
Merging hid/for-next (9e17aa316bdd Merge branch 'for-4.1/upstream' into for=
-next)
Merging i2c/i2c/for-next (3b10db23c041 i2c: dln2: set the device tree node =
of the adapter)
Merging jdelvare-hwmon/master (26bc420b59a3 Linux 3.19-rc6)
Merging hwmon-staging/hwmon-next (e4e66eca68b6 hwmon: (ibmpowernv) add a la=
bel attribute)
Merging v4l-dvb/master (7e91bcc94ea9 Merge branch 'v4l_for_linus' into to_n=
ext)
Merging kbuild/for-next (d8d26a8d103a Merge branch 'kbuild/kbuild' into kbu=
ild/for-next)
Merging kconfig/for-next (bfa76d495765 Linux 3.19)
Merging libata/for-next (b4b681e73717 Merge branch 'for-4.1' into for-next)
Merging pm/linux-next (09d26e637a56 Merge branches 'pm-cpufreq-next' and 'p=
m-cpuidle-next' into linux-next)
Merging idle/next (ec9b792ef33e Merge branches 'cpuidle' and 'turbostat' in=
to release)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (c0c01971b43f Thermal: do thermal zone update after a =
cooling device registered)
Merging thermal-soc/next (96d927aa14de thermal: cpu_cooling: Fix power calc=
ulation when CPUs are offline)
CONFLICT (content): Merge conflict in include/linux/thermal.h
Merging ieee1394/for-next (d71e6a11737f firewire: core: use correct vendor/=
model IDs)
Merging dlm/next (2ab4bd8ea3a6 dlm: adopt orphan locks)
Merging swiotlb/linux-next (8e0629c1d4ce swiotlb: don't assume PA 0 is inva=
lid)
Merging slave-dma/next (733dbbd78164 Merge branch 'for-linus' into next)
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
Merging wireless-drivers-next/master (f56d9e23b78e ssb: add delay after PCI=
 reset to fix SoC reboots)
Merging bluetooth/master (40f66c05c360 Bluetooth: Add local SSP OOB data to=
 OOB ext data mgmt command)
Merging infiniband/for-next (8494057ab5e4 IB/uverbs: Prevent integer overfl=
ow in ib_umem_get address arithmetic)
Merging mtd/master (5e0899db69e2 mtd: nand: MTD_NAND_HISI504 should depend =
on HAS_DMA)
Merging l2-mtd/master (81a1209c9091 mtd: spi-nor: Add support for Macronix =
mx25u6435f serial flash)
Merging crypto/master (f2f770d74a8d crypto: arm/sha256 - Add optimized SHA-=
256/224)
CONFLICT (content): Merge conflict in crypto/Kconfig
Applying: crypto: fix for sendmsg/recvmsg API change
Merging drm/drm-next (502e95c66785 drm/vgem: implement virtual GEM)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_sprite.c
Merging drm-panel/drm/panel/for-next (1c550fa193d0 drm/panel: Add support f=
or Ampire AM-800480R3TMQW-A1H 800x480 7" panel)
Merging drm-intel/for-linux-next (6e0aa8018f9c Merge tag 'v4.0-rc6' into dr=
m-intel-next)
Merging drm-tegra/drm/tegra/for-next (535a65db484f drm/tegra: sor: Reset du=
ring initialization)
Merging drm-misc/topic/drm-misc (0578be680c66 drm: Use kref_put_mutex in dr=
m_gem_object_unreference_unlocked)
Merging drm-exynos/exynos-drm/for-next (377b8fc67dc3 drm/exynos: Enable DP =
clock to fix display on Exynos5250 and other)
Merging sound/for-next (2d846c740272 ALSA: hda_intel: add AZX_DCAPS_I915_PO=
WERWELL for SKL and BSW)
Merging sound-asoc/for-next (cbfa938ccf20 Merge remote-tracking branches 'a=
soc/topic/wm8804' and 'asoc/topic/wm8996' into asoc-next)
Merging modules/modules-next (cc9e605dc6cb module: do not print allocation-=
fail warning on bogus user buffer size)
Merging virtio/virtio-next (2f921b5bb051 lguest: suppress interrupts for si=
ngle insn, not range.)
Merging input/next (8d289842c8ab Input: ALPS - V7 devices can report 5-fing=
er taps)
Merging block/for-next (ddd4f001660c Merge branch 'for-4.1/drivers' into fo=
r-next)
Merging device-mapper/for-next (a9da1e30fce5 dm crypt: fix deadlock when al=
go returns -EBUSY)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and rem=
ove the card_tasklet)
Merging mmc-uh/next (81f8a7be6642 mmc: Add support for marking hpi as broke=
n through devicetree)
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_n=
ext() return value)
Merging md/for-next (4bbe5e27f0c6 md/raid5: allow the stripe_cache to grow =
and shrink.)
Merging mfd/for-mfd-next (ba867bc60a44 mfd: twl6040: Remove wrong and unnee=
ded "platform:twl6040" modalias)
Merging backlight/for-backlight-next (1926469377bb backlight: da9052_bl: Te=
rminate da9052_wled_ids array with empty element)
Merging battery/master (5939d9dfe440 power: twl4030_madc_battery: Add missi=
ng MODULE_ALIAS)
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/wacom.h
Applying: HID: wacom: merge fix for "Change ownership from driver to core"
Applying: HID: wacom: merge fix 2 for "Change ownership from driver to core"
Merging omap_dss2/for-next (72fc8b7187cd Merge branches '4.1/fbdev' and '4.=
1/omapdss' into for-next)
Merging regulator/for-next (15a51c696979 Merge remote-tracking branches 're=
gulator/topic/notifier', 'regulator/topic/palmas', 'regulator/topic/stw481x=
' and 'regulator/topic/wm8350' into regulator-next)
Merging security/next (4f9a60f5c7e7 Merge branch 'smack-for-4.1' of git://g=
ithub.com/cschaufler/smack-next into next)
CONFLICT (content): Merge conflict in drivers/char/tpm/tpm-chip.c
Merging integrity/next (7bea7ff67e0c ima: /proc/keys is now mandatory)
Merging selinux/next (cf7b6c0205f1 selinux: increase avtab max buckets)
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (fe92a2e35727 watchdog: octeon: use fixed length st=
ring for register names)
Merging iommu/next (7f65ef01e131 Merge branches 'iommu/fixes', 'x86/vt-d', =
'x86/amd', 'arm/smmu', 'arm/tegra' and 'core' into next)
Merging dwmw2-iommu/master (03ecc32c5274 iommu/vt-d: support extended root =
and context entries)
Merging vfio/next (6eb7018705de vfio-pci: Move idle devices to D3hot power =
state)
Merging osd/linux-next (1fa3a002b254 Boaz Harrosh - fix email in Documentat=
ion)
Merging jc_docs/docs-next (c8a329c777f5 doc: Add guest_nice column to examp=
le output of `cat /proc/stat')
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
Merging spi/for-next (8a8d1324c885 Merge remote-tracking branches 'spi/topi=
c/spidev' and 'spi/topic/spidev-test' into spi-next)
CONFLICT (modify/delete): drivers/dma/intel_mid_dma_regs.h deleted in spi/f=
or-next and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma_reg=
s.h left in tree.
CONFLICT (modify/delete): drivers/dma/intel_mid_dma.c deleted in spi/for-ne=
xt and modified in HEAD. Version HEAD of drivers/dma/intel_mid_dma.c left i=
n tree.
$ git rm -f drivers/dma/intel_mid_dma_regs.h drivers/dma/intel_mid_dma.c
Merging tip/auto-latest (05154531bcc3 Merge branch 'x86/vdso')
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in include/uapi/linux/bpf.h
CONFLICT (content): Merge conflict in include/linux/bpf.h
Applying: ARM: VDSO: rename tkr to tkr_mono
Applying: bpf: semantic merge conflict fix in kernel/events/core.c
Merging clockevents/clockevents/next (4c8305221193 clocksource: Driver for =
Conexant Digicolor SoC timer)
CONFLICT (add/add): Merge conflict in drivers/clocksource/rockchip_timer.c
CONFLICT (content): Merge conflict in drivers/clocksource/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/Kconfig
Merging edac/linux_next (fec53af531dd sb_edac: Fix typo computing number of=
 banks)
Merging edac-amd/for-next (1afaa0551521 EDAC: Constify of_device_id array)
Merging irqchip/irqchip/for-next (7ecc79901e08 Merge branch 'irqchip/stacke=
d-irq_set_wake' into irqchip/for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/suspend.c
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (e65e0516fb5f Merge branch 'for-next/ftrace/core' i=
nto trace/for-next)
Merging rcu/rcu/next (265f40690e3a locktorture: Change longdelay_us to long=
delay_ms)
Merging kvm/linux-next (1d804d079a92 x86: Use bool function return values o=
f true/false not 1/0)
CONFLICT (content): Merge conflict in arch/mips/kernel/genex.S
Merging kvm-arm/next (d44758c0dfc5 KVM: arm/arm64: enable KVM_CAP_IOEVENTFD)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic.c
Merging kvm-ppc/kvm-ppc-next (2c4aa55a6af0 Merge tag 'signed-kvm-ppc-next' =
of git://github.com/agraf/linux-2.6 into HEAD)
Merging kvms390/next (816c7667ea97 KVM: s390: migrate vcpu interrupt state)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging xen-tip/linux-next (278edfc07875 xen-pciback: also support disablin=
g of bus-mastering and memory-write-invalidate)
CONFLICT (content): Merge conflict in drivers/xen/Kconfig
Merging percpu/for-next (4c907baf36d8 percpu_ref: implement percpu_ref_is_d=
ying())
Merging workqueues/for-next (6ba94429c8e7 workqueue: Reorder sysfs code)
Merging drivers-x86/for-next (5d3fc1d54e5a toshiba_bluetooth: Fix enabling/=
disabling loop on recent devices)
Merging chrome-platform/for-next (8ce580932f8e platform/chrome: cros_ec_lpc=
 - Depend on X86 || COMPILE_TEST)
Merging regmap/for-next (5e83a0463ac0 Merge remote-tracking branch 'regmap/=
topic/trace' into regmap-next)
Merging hsi/for-next (265ef3ee9575 HSI: cmt_speech: fix error return code)
Merging leds/for-next (ccdc45075aea leds: Don't treat the LED name as a for=
mat string)
Merging ipmi/for-next (6a83ac6c005c ipmi:ssif: Ignore spaces when comparing=
 I2C adapter names)
Merging driver-core/driver-core-next (c9e15f25f514 debugfs: allow bad paren=
t pointers to be passed in)
Merging tty/tty-next (b3e3bf2ef2c7 Merge 4.0-rc7 into tty-next)
CONFLICT (content): Merge conflict in drivers/dma/Kconfig
Merging usb/usb-next (b7a4abb67416 Merge 4.0-rc7 into usb-next)
Merging usb-gadget/next (bbc78c07a51f usb: core: hub: use new USB_RESUME_TI=
MEOUT)
Merging usb-serial/usb-next (65dd82ae453f USB: f81232: fix some minor style=
 issues)
Merging staging/staging-next (c610f7f772aa Merge 4.0-rc7 into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/media/mn88473/mn88473=
.c
Merging char-misc/char-misc-next (1ac4e6fee41d DTS: ARM: OMAP3-N900: Add li=
s3lv02d support)
Merging extcon/extcon-next (731840c832bc extcon: Add manufactor name of eac=
h extcon device)
Merging kdbus/kdbus (98ecc663f3f9 selftest/kdbus: enable cross compilation)
CONFLICT (content): Merge conflict in Documentation/Makefile
Merging cgroup/for-next (34ebe933417e cpuset, isolcpus: document relationsh=
ip between cpusets & isolcpus)
Merging scsi/for-next (4a44b7a98b7f Merge branch 'misc' into for-next)
Merging target-updates/for-next (5089a08378fb iscsi-target: TargetAddress i=
n SendTargets should bracket ipv6 addresses)
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
Merging clk/clk-next (3937567ded41 clk: qcom: fix driver dependencies)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to cl=
ear out sensitive data)
Merging aio/master (5f785de58873 aio: Skip timer for io_getevents if timeou=
t=3D0)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack r=
egister variable for percpu)
Merging kselftest/next (2bfd4d1f8c2b ftracetest: Do not use usleep directly)
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
Merging akpm-current/current (5d77fd3b294b x86: switch to using asm-generic=
 for seccomp.h)
CONFLICT (content): Merge conflict in fs/fat/inode.c
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in fs/ext2/file.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-mc13xxx.c
CONFLICT (content): Merge conflict in drivers/rtc/class.c
CONFLICT (content): Merge conflict in arch/s390/mm/mmap.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
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
Applying: prctl: avoid using mmap_sem for exe_file serialization
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
Merging akpm/master (cb6b3207b28c mm: add strictlimit knob)

--Sig_/l/BFPFnZ4jkjodbK2oud5NB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJQuQAAoJEMDTa8Ir7ZwVmHgP/0sueYv0iIRtSoWiuA3Ilq4D
v0zhAPoVJCmXpQOqKKlfS+smUhurF3p/gK+TWZIcaI9A/80sBD01oZ6wMAvz/zAh
62p+K5NA0ZCAlyFCDzjpSaat4ABVCVmePZpOa12ttSo80+a81op2GhSAzfPiTJlv
DS+K8b3LXwctVOZR70MvxZ8vQ2LntA0iGCqw0aoeBi81OzQzSKztBZO7s0Rq4ujZ
0PGNd7+e5tVR8HnWvyqk15fLY0pdpJbEyqj3KwU9sA7Gj5AOfUWrL85/7q76y5Pj
ILDWsYbU0Xj+MC0NUpGZvhsze4BpadbOLW3IeAceXq/6TRQktfsnAvf7r2vwOwWd
3ncNS5JZqzYqgx9mvkH1j6J4VZhJcExU9yJooTaViUkhQDcrPyWiWSkEceJtcgyI
Hj8VECDsvq2XKtQforNWww5JH/JO+nHOzkUYhmwd4nEhTsOHygZzfECyaIh9W0wF
CGsHENLE7Gy6U55tbonn7r63V+VcdsfjzMc1uefDk4KOV6PMJKBOsT1VGtta0L9O
R0CFHosMBXqudOdSzpu4HvlEvbI2RhLeda65uL6gnYtQFhpv4AYSeB612fXMF5bh
/Yvs21Yv8bVy7QBjfnKzXMOepC48z/Qj7R9LztdyE3ol3bB8hy98PjxJW1QZX4Z7
4nAT+QvQ+Ej5CPI8roSm
=aE6f
-----END PGP SIGNATURE-----

--Sig_/l/BFPFnZ4jkjodbK2oud5NB--
