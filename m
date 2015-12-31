From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for Dec 31
Date: Thu, 31 Dec 2015 23:30:08 +1100
Message-ID: <20151231233008.41fc8451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Changes since 20151223:

New tree: hdlcd

Dropped tree: rdma (complex conflicts)

The i2c tree still had its build failure for which I applied a patch.

The libata tree contains a bad commit so I used the version from
next-20151223.

The thermal-soc tree gained a build failure for which I applied a merge
fix patch.

The rdma tree gained considerabel conflicts against the nfsd tree,
so I dropped the rdma tree for today.

The drm tree gained 2 build failures for which I added a fix patches.

The block tree gained a conflict against Linus' tree.

The mmc-uh tree gained a build failure for which I applied a merge
fix patch.

The security tree gained a conflict against the vfs tree.

The cgroup tree gained a conflict against the net-next tree.

The target-updates tree gained conflicts against the nfsd tree.

The vhost tree gained conflicts against the tip tree.

The akpm-current tree gained conflicts against the jc_docs and nvdimm
trees and a build failure in the perf build that I just left broken.

The akpm tree lost a few patches that turned up elsewhere and a build
failure that I just left broken for now.

Non-merge commits (relative to Linus' tree): 8479
 8264 files changed, 408132 insertions(+), 152411 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After the
final fixups (if any), I do an x86_64 modules_install followed by builds
for powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
(this fails its final link) and pseries_le_defconfig and i386, sparc,
sparc64 and arm defconfig.

Below is a summary of the state of the merge.

I am currently merging 232 trees (counting Linus' and 36 trees of patches
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
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

$ git checkout master
$ git reset --hard stable
Merging origin/master (c6169202e408 Merge branch 'for-linus' of git://git.kernel.dk/linux-block)
Merging fixes/master (25cb62b76430 Linux 4.3-rc5)
Merging kbuild-current/rc-fixes (3d1450d54a4f Makefile: Force gzip and xz on module install)
Merging arc-current/for-curr (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm-current/fixes (34bfbae33ae8 ARM: 8475/1: SWP emulation: Restore original *data when failed)
Merging m68k-current/for-linus (21d380e54c30 m68k: Wire up mlock2)
Merging metag-fixes/fixes (0164a711c97b metag: Fix ioremap_wc/ioremap_cached build errors)
Merging mips-fixes/mips-fixes (1795cd9b3a91 Linux 3.16-rc5)
Merging powerpc-fixes/fixes (036592fbbe75 powerpc/opal-irqchip: Fix deadlock introduced by "Fix double endian conversion")
Merging powerpc-merge-mpe/fixes (bc0195aad0da Linux 4.2-rc2)
Merging sparc/master (8db7b3c54401 Merge branch 'parisc-4.4-4' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux)
Merging net/master (068d8bd338e8 sctp: sctp should release assoc when sctp_make_abort_user return NULL in sctp_close)
Merging ipsec/master (a8a572a6b5f2 xfrm: dst_entries_init() per-net dst_ops)
Merging ipvs/master (8e662164abb4 netfilter: nfnetlink_queue: avoid harmless unnitialized variable warnings)
Merging wireless-drivers/master (01d85b9b2b6b Merge tag 'iwlwifi-for-kalle-2015-12-16' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes)
Merging mac80211/master (cf1e05c63642 mac80211: handle width changes from opmode notification IE in beacon)
Merging sound-current/for-linus (c7b60a89516b ALSA: hda - Add keycode map for alc input device)
Merging pci-current/for-linus (1dbe162d53e1 PCI: hisi: Fix hisi_pcie_cfg_read() 32-bit reads)
Merging driver-core.current/driver-core-linus (4ef7675344d6 Linux 4.4-rc6)
Merging tty.current/tty-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb.current/usb-linus (4ef7675344d6 Linux 4.4-rc6)
Merging usb-gadget-fixes/fixes (7d32cdef5356 usb: musb: fail with error when no DMA controller set)
Merging usb-serial-fixes/usb-linus (f7d7f59ab124 USB: cp210x: add ID for ELV Marble Sound Board 1)
Merging usb-chipidea-fixes/ci-for-usb-stable (6f51bc340d2a usb: chipidea: imx: fix a possible NULL dereference)
Merging staging.current/staging-linus (f744c423cacf Merge tag 'iio-fixes-for-4.4c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-linus)
Merging char-misc.current/char-misc-linus (9f9499ae8e64 Linux 4.4-rc5)
Merging input-current/for-linus (478e5ed1c3f6 Input: elants_i2c - fix wake-on-touch)
Merging crypto-current/master (9f47e11b9e31 crypto: algif_skcipher - Require setkey before accept(2))
Merging ide/master (1b1050cdc5cd Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide)
Merging devicetree-current/devicetree/merge (f76502aa9140 of/dynamic: Fix test for PPC_PSERIES)
Merging rr-fixes/fixes (275d7d44d802 module: Fix locking in symbol_put_addr())
Merging vfio-fixes/for-linus (ae5515d66362 Revert: "vfio: Include No-IOMMU mode")
Merging kselftest-fixes/fixes (2ce47b44b25d selftests/seccomp: Get page size from sysconf)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging mfd-fixes/for-mfd-fixes (1b52e50f2a40 mfd: max77843: Fix max77843_chg_init() return on error)
Merging drm-intel-fixes/for-linux-next-fixes (3d8acd1f667b drm/i915: increase the tries for HDMI hotplug live status checking)
Merging asm-generic/master (795291732663 asm-generic: page.h: Remove useless get_user_page and free_user_page)
Merging arc/for-next (74bf8efb5fa6 Linux 4.4-rc7)
Merging arm/for-next (cf19d2e9463a Merge branch 'misc-rc6' into for-next)
Merging arm-perf/for-next/perf (5d7ee87708d4 arm64: perf: add support for Cortex-A72)
Merging arm-soc/for-next (7ab0b82fe6bc ARM: SoC: document merges)
Merging at91/at91-next (f2837af0c89d Merge branch 'at91-4.5-defconfig' into at91-next)
Merging bcm2835/for-next (b2776bf7149b Linux 3.18)
Merging berlin/berlin/for-next (9a7e06833249 Merge branch 'berlin/fixes' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (c6abe665c94f Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (99d59777c089 Merge branch 'for_4.4-rcx/drivers-soc' into next)
Merging mvebu/for-next (12bd4032ea2f Merge branch 'mvebu/defconfig' into mvebu/for-next)
Merging omap/for-next (06cdbbe9902d Merge tag 'omap-for-v4.5/81xx-fix-signed' into for-next)
Merging omap-pending/for-next (30aa18d3bea5 MAINTAINERS: add maintainer for OMAP hwmod data)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_43xx_data.c
Merging qcom/for-next (e654927c5ff7 ARM: qcom: Drop ARCH_MSM* configs)
Merging renesas/next (c546828f1614 Merge branches 'heads/arm64-defconfig-for-v4.5', 'heads/arm64-dt-for-v4.5', 'heads/defconfig-for-v4.5', 'heads/dt-for-v4.5' and 'heads/gic-cleanup-for-v4.5' into next)
Merging rockchip/for-next (755651cf0f31 Merge tag 'v4.4-rc5' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (8005c49d9aea Linux 4.4-rc1)
Merging samsung-krzk/for-next (94c286811b3b Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (97dd53d76893 Merge branches 'sunxi/clocks-for-4.5' and 'sunxi/dt-for-4.5' into sunxi/for-next)
Merging tegra/for-next (f4dc1ae37415 Merge branch for-4.5/defconfig into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-tegra/Kconfig
Merging arm64/for-next/core (c9cd0ed925c0 arm64: traps: address fallout from printk -> pr_* conversion)
Merging blackfin/for-linus (d91e14b3b9e1 eth: bf609 eth clock: add pclk clock for stmmac driver probe)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (918fc2ee791e cris: Drop reference to get_cmos_time())
Merging h8300/h8300-next (82271533321d irqchip: renesas-h8s: Replace ctrl_outw/ctrl_inw with writew/readw)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (7e26e9ff0a93 pstore: Fix return type of pstore_is_mounted())
Merging m68k/for-next (ea8d65ad6958 m68k/defconfig: Update defconfigs for v4.4-rc1)
Merging m68knommu/for-next (4e30bce03142 m68k: coldfire/gpio: Be sure to clamp return value)
Merging metag/for-next (f23d0e2468bc MAINTAINERS: Change Meta arch port status to Odd Fixes)
Merging microblaze/next (b14132797d80 elf-em.h: move EM_MICROBLAZE to the common header)
Merging mips/mips-for-linux-next (7635e531b101 Merge branch '4.4-fixes' into mips-for-linux-next)
Merging nios2/for-next (8e3d7c834ba0 nios2: fix cache coherency)
Merging parisc-hd/for-next (6a13feb9c828 Linux 4.3)
Merging powerpc/next (e9d764f80396 powerpc/pseries: Enable kernel CPU dlpar from sysfs)
Merging powerpc-mpe/next (bc0195aad0da Linux 4.2-rc2)
Merging fsl/next (e1f580e8ced5 powerpc/e6500: hw tablewalk: make sure we invalidate and write to the same tlb entry)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (9236b4dd6bfa s390: get rid of CONFIG_SCHED_MC and CONFIG_SCHED_BOOK)
Merging sparc-next/master (9f935675d41a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging tile/master (06c42332222d tile: fix bug in setting PT_FLAGS_DISABLE_IRQ on kernel entry)
Merging uml/linux-next (887a9853092c um: fix returns without va_end)
Merging unicore32/unicore32 (d670878e2c9a unicore32: Remove ARCH_HAS_CPUFREQ config option)
Merging xtensa/for_next (afaa7c542cc9 Merge tag 'xtensa-for-next-20151109' of git://github.com/jcmvbkbc/linux-xtensa)
Merging btrfs/next (511711af91f2 btrfs: don't run delayed references while we are creating the free space tree)
Merging ceph/master (583d0fef756a libceph: clear msg->con in ceph_msg_release() only)
Merging cifs/for-next (181a15048df3 [SMB3] Prepare for encryption support (first part). Add decryption and encryption key generation. Thanks to Metze for helping with this.)
Merging ecryptfs/next (933c32fe0e42 ecryptfs: drop null test before destroy functions)
Merging ext3/for_next (6c37157874aa udf: Fix lost indirect extent block)
Merging ext4/dev (374431bae296 ext4 crypto: add ioctls to allow backup of encryption metadata)
Merging f2fs/dev (4cf185379b75 f2fs: add a tracepoint for sync_dirty_inodes)
Merging fscache/fscache (b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed)
Merging fuse/for-next (0b5da8db145b fuse: add support for SEEK_HOLE and SEEK_DATA in lseek)
Merging gfs2/for-next (a93a99838248 gfs2: fix flock panic issue)
Merging jfs/jfs-next (26456955719b jfs: clean up jfs_rename and fix out of order unlock)
Merging nfs/linux-next (0559db5c62cb Merge branch 'bugfixes')
Merging nfsd/nfsd-next (eb57be60eca9 svcrdma: Add class for RDMA backwards direction transport)
Merging orangefs/for-next (4f20854bf736 Orangefs: don't change EXTRAVERSION)
Merging overlayfs/overlayfs-next (84889d493356 ovl: check dentry positiveness in ovl_cleanup_whiteouts())
Merging squashfs/master (62421645bb70 Squashfs: Add LZ4 compression configuration option)
Merging v9fs/for-next (3053600ed4f7 9p: trans_fd, bail out if recv fcall if missing)
Merging ubifs/linux-next (6b238de189f6 mtd: ubi: don't leak e if schedule_erase() fails)
Merging xfs/for-next (4e14e49a91e1 Merge branch 'xfs-misc-fixes-for-4.4-3' into for-next)
Merging file-locks/linux-next (9189922675ec fs: make locks.c explicitly non-modular)
Merging vfs/for-next (d7451d073a84 Merge branches 'work.misc', 'work.iov_iter', 'work.copy_file_range', 'work.xattr' and 'work.symlinks' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in drivers/s390/char/zcore.c
Applying: orangfs: update for follow_link to get_link change
Merging pci/next (c6123e06042d Merge branches 'pci/host-generic', 'pci/host-imx6', 'pci/host-iproc' and 'pci/host-rcar' into next)
Merging hid/for-next (817b1df9945e Merge branch 'for-4.4/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (5e9b06f45e1d Merge branch 'i2c/for-4.5' into i2c/for-next)
Applying: ii2c: rename i2c_timings struct due to clash with generic version
Merging jdelvare-hwmon/master (69bb8a38c5a9 hwmon: (k10temp) Remove duplicate pci-id define)
Merging dmi/master (072151bb0154 firmware: dmi_scan: Save SMBIOS Type 9 System Slots)
Merging hwmon-staging/hwmon-next (c60fdf8587ae hwmon: (nct6683,nct6775) constify sensor_template_group structures)
Merging v4l-dvb/master (e27bc2ab8e77 Merge ../mc_dvb into to_next)
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmz72.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtreo.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/mioa701.c
Merging kbuild/for-next (45538834d1f5 Merge branch 'kbuild/kbuild' into kbuild/for-next)
Merging kconfig/for-next (c0ddc8c745b7 localmodconfig: Use Kbuild files too)
Merging libata/for-next (28f40c063256 Merge branch 'for-4.5' into for-next)
CONFLICT (content): Merge conflict in virt/kvm/arm/vgic.c
CONFLICT (content): Merge conflict in virt/kvm/arm/arch_timer.c
CONFLICT (content): Merge conflict in tools/testing/selftests/seccomp/seccomp_bpf.c
CONFLICT (content): Merge conflict in tools/testing/selftests/powerpc/pmu/ebb/ebb.c
CONFLICT (modify/delete): tools/testing/selftests/powerpc/benchmarks/Makefile deleted in libata/for-next and modified in HEAD. Version HEAD of tools/testing/selftests/powerpc/benchmarks/Makefile left in tree.
CONFLICT (modify/delete): tools/testing/selftests/powerpc/benchmarks/.gitignore deleted in libata/for-next and modified in HEAD. Version HEAD of tools/testing/selftests/powerpc/benchmarks/.gitignore left in tree.
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
CONFLICT (content): Merge conflict in tools/perf/util/symbol.c
CONFLICT (content): Merge conflict in tools/perf/ui/browsers/hists.c
CONFLICT (content): Merge conflict in sound/usb/mixer_maps.c
CONFLICT (modify/delete): sound/soc/sunxi/sun4i-codec.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/sunxi/sun4i-codec.c left in tree.
CONFLICT (modify/delete): sound/soc/sti/uniperif_reader.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/sti/uniperif_reader.c left in tree.
CONFLICT (modify/delete): sound/soc/sti/uniperif_player.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/sti/uniperif_player.c left in tree.
CONFLICT (content): Merge conflict in sound/soc/soc-topology.c
CONFLICT (content): Merge conflict in sound/soc/soc-dapm.c
CONFLICT (content): Merge conflict in sound/soc/sh/rcar/src.c
CONFLICT (modify/delete): sound/soc/rockchip/rockchip_spdif.h deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/rockchip/rockchip_spdif.h left in tree.
CONFLICT (modify/delete): sound/soc/rockchip/rockchip_spdif.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/rockchip/rockchip_spdif.c left in tree.
CONFLICT (modify/delete): sound/soc/intel/skylake/skl-topology.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/intel/skylake/skl-topology.c left in tree.
CONFLICT (content): Merge conflict in sound/soc/intel/Kconfig
CONFLICT (content): Merge conflict in sound/soc/davinci/davinci-mcasp.c
CONFLICT (content): Merge conflict in sound/soc/codecs/rt5645.c
CONFLICT (content): Merge conflict in sound/soc/codecs/rl6231.c
CONFLICT (modify/delete): sound/soc/codecs/nau8825.c deleted in libata/for-next and modified in HEAD. Version HEAD of sound/soc/codecs/nau8825.c left in tree.
CONFLICT (content): Merge conflict in sound/pci/hda/patch_realtek.c
CONFLICT (content): Merge conflict in sound/pci/hda/patch_hdmi.c
CONFLICT (content): Merge conflict in sound/pci/hda/patch_conexant.c
CONFLICT (content): Merge conflict in security/smack/smackfs.c
CONFLICT (content): Merge conflict in security/selinux/ss/conditional.c
CONFLICT (content): Merge conflict in security/keys/user_defined.c
CONFLICT (content): Merge conflict in security/keys/trusted.c
CONFLICT (content): Merge conflict in scripts/tags.sh
CONFLICT (content): Merge conflict in scripts/kernel-doc
CONFLICT (content): Merge conflict in scripts/Makefile.modpost
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in net/unix/af_unix.c
CONFLICT (content): Merge conflict in net/tipc/udp_media.c
CONFLICT (content): Merge conflict in net/tipc/link.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/xprt_rdma.h
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/verbs.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/transport.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/svc_rdma_transport.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
CONFLICT (modify/delete): net/sunrpc/xprtrdma/backchannel.c deleted in libata/for-next and modified in HEAD. Version HEAD of net/sunrpc/xprtrdma/backchannel.c left in tree.
CONFLICT (content): Merge conflict in net/sched/sch_generic.c
CONFLICT (content): Merge conflict in net/rds/ib.c
CONFLICT (content): Merge conflict in net/packet/af_packet.c
CONFLICT (content): Merge conflict in net/openvswitch/vport.h
CONFLICT (content): Merge conflict in net/openvswitch/vport-netdev.c
CONFLICT (content): Merge conflict in net/openvswitch/vport-gre.c
CONFLICT (content): Merge conflict in net/openvswitch/vport-geneve.c
CONFLICT (content): Merge conflict in net/openvswitch/flow_netlink.c
CONFLICT (content): Merge conflict in net/openvswitch/dp_notify.c
CONFLICT (modify/delete): net/openvswitch/conntrack.c deleted in libata/for-next and modified in HEAD. Version HEAD of net/openvswitch/conntrack.c left in tree.
CONFLICT (content): Merge conflict in net/netfilter/nft_counter.c
CONFLICT (content): Merge conflict in net/netfilter/nfnetlink_queue_core.c
CONFLICT (content): Merge conflict in net/netfilter/nfnetlink_log.c
CONFLICT (content): Merge conflict in net/netfilter/Kconfig
CONFLICT (modify/delete): net/mpls/mpls_iptunnel.c deleted in libata/for-next and modified in HEAD. Version HEAD of net/mpls/mpls_iptunnel.c left in tree.
CONFLICT (content): Merge conflict in net/mpls/af_mpls.c
CONFLICT (content): Merge conflict in net/ipv6/tcp_ipv6.c
CONFLICT (content): Merge conflict in net/ipv6/route.c
CONFLICT (content): Merge conflict in net/ipv6/netfilter/Kconfig
CONFLICT (content): Merge conflict in net/ipv6/ndisc.c
CONFLICT (content): Merge conflict in net/ipv6/ip6_tunnel.c
CONFLICT (content): Merge conflict in net/ipv6/addrconf.c
CONFLICT (content): Merge conflict in net/ipv4/netfilter/Kconfig
CONFLICT (content): Merge conflict in net/ipv4/inet_connection_sock.c
CONFLICT (content): Merge conflict in net/dccp/ipv6.c
CONFLICT (content): Merge conflict in net/core/sock.c
CONFLICT (content): Merge conflict in net/core/rtnetlink.c
CONFLICT (content): Merge conflict in net/bridge/br_stp_if.c
CONFLICT (content): Merge conflict in mm/zswap.c
CONFLICT (content): Merge conflict in mm/vmstat.c
CONFLICT (content): Merge conflict in mm/slub.c
CONFLICT (content): Merge conflict in mm/slob.c
CONFLICT (content): Merge conflict in mm/slab_common.c
CONFLICT (content): Merge conflict in mm/slab.h
CONFLICT (content): Merge conflict in mm/slab.c
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in mm/oom_kill.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/hugetlb.c
CONFLICT (content): Merge conflict in kernel/trace/trace_events.c
CONFLICT (content): Merge conflict in kernel/trace/ring_buffer.c
CONFLICT (content): Merge conflict in kernel/sched/sched.h
CONFLICT (content): Merge conflict in kernel/panic.c
CONFLICT (content): Merge conflict in kernel/locking/osq_lock.c
CONFLICT (content): Merge conflict in kernel/fork.c
CONFLICT (content): Merge conflict in kernel/events/core.c
CONFLICT (content): Merge conflict in kernel/cpuset.c
CONFLICT (modify/delete): kernel/cgroup_pids.c deleted in libata/for-next and modified in HEAD. Version HEAD of kernel/cgroup_pids.c left in tree.
CONFLICT (content): Merge conflict in kernel/cgroup.c
CONFLICT (content): Merge conflict in kernel/bpf/syscall.c
CONFLICT (modify/delete): kernel/bpf/inode.c deleted in libata/for-next and modified in HEAD. Version HEAD of kernel/bpf/inode.c left in tree.
CONFLICT (content): Merge conflict in kernel/bpf/hashtab.c
CONFLICT (content): Merge conflict in include/uapi/linux/openvswitch.h
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (modify/delete): include/trace/events/vb2.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/trace/events/vb2.h left in tree.
CONFLICT (content): Merge conflict in include/trace/events/v4l2.h
CONFLICT (content): Merge conflict in include/sound/soc-dapm.h
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/net/ndisc.h
CONFLICT (content): Merge conflict in include/net/inetpeer.h
CONFLICT (content): Merge conflict in include/net/inet_sock.h
CONFLICT (modify/delete): include/media/videobuf2-v4l2.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/media/videobuf2-v4l2.h left in tree.
CONFLICT (content): Merge conflict in include/media/videobuf2-core.h
CONFLICT (content): Merge conflict in include/media/v4l2-dv-timings.h
CONFLICT (content): Merge conflict in include/media/rc-map.h
CONFLICT (content): Merge conflict in include/media/media-entity.h
CONFLICT (content): Merge conflict in include/media/media-devnode.h
CONFLICT (rename/delete): include/media/i2c/tc358743.h deleted in libata/for-next and renamed in HEAD. Version HEAD of include/media/i2c/tc358743.h left in tree.
CONFLICT (content): Merge conflict in include/linux/xattr.h
CONFLICT (content): Merge conflict in include/linux/usb/cdc_ncm.h
CONFLICT (content): Merge conflict in include/linux/syscalls.h
CONFLICT (content): Merge conflict in include/linux/sunrpc/svc_rdma.h
CONFLICT (content): Merge conflict in include/linux/stop_machine.h
CONFLICT (modify/delete): include/linux/soc/dove/pmu.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/linux/soc/dove/pmu.h left in tree.
CONFLICT (content): Merge conflict in include/linux/slab.h
CONFLICT (modify/delete): include/linux/scpi_protocol.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/linux/scpi_protocol.h left in tree.
CONFLICT (modify/delete): include/linux/qed/qed_chain.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/linux/qed/qed_chain.h left in tree.
CONFLICT (modify/delete): include/linux/qed/common_hsi.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/linux/qed/common_hsi.h left in tree.
CONFLICT (content): Merge conflict in include/linux/platform_data/edma.h
CONFLICT (content): Merge conflict in include/linux/pci.h
CONFLICT (content): Merge conflict in include/linux/of_irq.h
CONFLICT (content): Merge conflict in include/linux/netfilter_ingress.h
CONFLICT (content): Merge conflict in include/linux/netdevice.h
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
CONFLICT (modify/delete): include/linux/lightnvm.h deleted in libata/for-next and modified in HEAD. Version HEAD of include/linux/lightnvm.h left in tree.
CONFLICT (content): Merge conflict in include/linux/i2c.h
CONFLICT (content): Merge conflict in include/linux/gfp.h
CONFLICT (content): Merge conflict in include/linux/fs.h
CONFLICT (content): Merge conflict in include/linux/cgroup.h
CONFLICT (content): Merge conflict in include/linux/cgroup-defs.h
CONFLICT (content): Merge conflict in include/linux/bpf.h
CONFLICT (content): Merge conflict in include/linux/acpi.h
CONFLICT (content): Merge conflict in include/kvm/arm_vgic.h
CONFLICT (content): Merge conflict in include/dt-bindings/clock/imx7d-clock.h
CONFLICT (content): Merge conflict in include/drm/drmP.h
CONFLICT (content): Merge conflict in fs/xattr.c
CONFLICT (content): Merge conflict in fs/ufs/ufs.h
CONFLICT (content): Merge conflict in fs/ufs/Makefile
CONFLICT (content): Merge conflict in fs/squashfs/xattr.c
CONFLICT (content): Merge conflict in fs/reiserfs/xattr_user.c
CONFLICT (content): Merge conflict in fs/reiserfs/xattr_trusted.c
CONFLICT (content): Merge conflict in fs/reiserfs/xattr_security.c
CONFLICT (content): Merge conflict in fs/reiserfs/xattr.c
CONFLICT (content): Merge conflict in fs/proc/base.c
CONFLICT (content): Merge conflict in fs/posix_acl.c
CONFLICT (content): Merge conflict in fs/ocfs2/xattr.c
CONFLICT (content): Merge conflict in fs/ocfs2/locks.c
CONFLICT (content): Merge conflict in fs/nfsd/nfs4layouts.c
CONFLICT (content): Merge conflict in fs/nfs/write.c
CONFLICT (content): Merge conflict in fs/nfs/pnfs.h
CONFLICT (content): Merge conflict in fs/nfs/pnfs.c
CONFLICT (content): Merge conflict in fs/nfs/nfs4trace.h
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
CONFLICT (content): Merge conflict in fs/nfs/nfs4file.c
CONFLICT (content): Merge conflict in fs/nfs/nfs42proc.c
CONFLICT (content): Merge conflict in fs/nfs/inode.c
CONFLICT (content): Merge conflict in fs/nfs/flexfilelayout/flexfilelayout.c
CONFLICT (content): Merge conflict in fs/nfs/callback_proc.c
CONFLICT (content): Merge conflict in fs/jffs2/xattr_user.c
CONFLICT (content): Merge conflict in fs/jffs2/xattr_trusted.c
CONFLICT (content): Merge conflict in fs/jffs2/xattr.c
CONFLICT (content): Merge conflict in fs/jffs2/security.c
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
CONFLICT (content): Merge conflict in fs/gfs2/meta_io.c
CONFLICT (content): Merge conflict in fs/gfs2/glock.c
CONFLICT (content): Merge conflict in fs/gfs2/file.c
CONFLICT (content): Merge conflict in fs/f2fs/xattr.c
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/segment.c
CONFLICT (content): Merge conflict in fs/f2fs/node.c
CONFLICT (content): Merge conflict in fs/f2fs/inode.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (modify/delete): fs/f2fs/extent_cache.c deleted in libata/for-next and modified in HEAD. Version HEAD of fs/f2fs/extent_cache.c left in tree.
CONFLICT (content): Merge conflict in fs/f2fs/dir.c
CONFLICT (content): Merge conflict in fs/f2fs/data.c
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in fs/ext4/xattr_user.c
CONFLICT (content): Merge conflict in fs/ext4/xattr_trusted.c
CONFLICT (content): Merge conflict in fs/ext4/xattr_security.c
CONFLICT (content): Merge conflict in fs/ext4/xattr.c
CONFLICT (modify/delete): fs/ext4/sysfs.c deleted in libata/for-next and modified in HEAD. Version HEAD of fs/ext4/sysfs.c left in tree.
CONFLICT (content): Merge conflict in fs/ext4/super.c
CONFLICT (content): Merge conflict in fs/ext4/namei.c
CONFLICT (content): Merge conflict in fs/ext4/inode.c
CONFLICT (content): Merge conflict in fs/ext4/file.c
CONFLICT (content): Merge conflict in fs/ext4/ext4.h
CONFLICT (content): Merge conflict in fs/ext4/crypto_key.c
CONFLICT (content): Merge conflict in fs/ext4/crypto.c
CONFLICT (content): Merge conflict in fs/ext2/xattr_user.c
CONFLICT (content): Merge conflict in fs/ext2/xattr_trusted.c
CONFLICT (content): Merge conflict in fs/ext2/xattr_security.c
CONFLICT (content): Merge conflict in fs/ext2/xattr.c
CONFLICT (content): Merge conflict in fs/dax.c
CONFLICT (content): Merge conflict in fs/cifs/smb2ops.c
CONFLICT (content): Merge conflict in fs/cifs/ioctl.c
CONFLICT (content): Merge conflict in fs/cifs/cifsfs.c
CONFLICT (content): Merge conflict in fs/btrfs/volumes.h
CONFLICT (content): Merge conflict in fs/btrfs/volumes.c
CONFLICT (content): Merge conflict in fs/btrfs/transaction.h
CONFLICT (content): Merge conflict in fs/btrfs/transaction.c
CONFLICT (content): Merge conflict in fs/btrfs/tests/free-space-tests.c
CONFLICT (content): Merge conflict in fs/btrfs/scrub.c
CONFLICT (content): Merge conflict in fs/btrfs/ioctl.c
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.h
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/extent-tree.c
CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in fs/9p/xattr.c
CONFLICT (content): Merge conflict in fs/9p/acl.c
CONFLICT (content): Merge conflict in drivers/vfio/vfio.c
CONFLICT (content): Merge conflict in drivers/vfio/platform/vfio_platform_common.c
CONFLICT (content): Merge conflict in drivers/usb/host/xhci-ring.c
CONFLICT (content): Merge conflict in drivers/usb/host/xhci-pci.c
CONFLICT (content): Merge conflict in drivers/usb/host/xhci-hub.c
CONFLICT (content): Merge conflict in drivers/usb/host/ohci-at91.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/uvc_queue.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/uvc_configfs.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/f_midi.c
CONFLICT (content): Merge conflict in drivers/usb/gadget/function/f_loopback.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-pci.c
CONFLICT (content): Merge conflict in drivers/usb/dwc2/platform.c
CONFLICT (content): Merge conflict in drivers/usb/chipidea/debug.c
CONFLICT (content): Merge conflict in drivers/tty/serial/sh-sci.c
CONFLICT (content): Merge conflict in drivers/tty/serial/etraxfs-uart.c
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/Kconfig
CONFLICT (content): Merge conflict in drivers/thermal/rockchip_thermal.c
CONFLICT (content): Merge conflict in drivers/thermal/power_allocator.c
CONFLICT (content): Merge conflict in drivers/thermal/imx_thermal.c
CONFLICT (content): Merge conflict in drivers/target/iscsi/iscsi_target_nego.c
CONFLICT (content): Merge conflict in drivers/target/iscsi/iscsi_target.c
CONFLICT (content): Merge conflict in drivers/staging/wilc1000/coreconfigurator.c
CONFLICT (modify/delete): drivers/staging/rdma/hfi1/verbs.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/staging/rdma/hfi1/verbs.c left in tree.
CONFLICT (content): Merge conflict in drivers/staging/media/omap4iss/iss_video.c
CONFLICT (content): Merge conflict in drivers/staging/media/omap4iss/iss.c
CONFLICT (content): Merge conflict in drivers/staging/media/omap4iss/Kconfig
CONFLICT (content): Merge conflict in drivers/staging/media/davinci_vpfe/vpfe_video.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/obdecho/echo_client.c
CONFLICT (content): Merge conflict in drivers/staging/lustre/lustre/llite/llite_internal.h
CONFLICT (content): Merge conflict in drivers/staging/iio/iio_simple_dummy_events.c
CONFLICT (content): Merge conflict in drivers/spi/spidev.c
CONFLICT (content): Merge conflict in drivers/spi/spi.c
CONFLICT (modify/delete): drivers/spi/spi-mt65xx.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/spi/spi-mt65xx.c left in tree.
CONFLICT (content): Merge conflict in drivers/soc/ti/knav_qmss_queue.c
CONFLICT (modify/delete): drivers/soc/qcom/smd-rpm.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/soc/qcom/smd-rpm.c left in tree.
CONFLICT (content): Merge conflict in drivers/soc/qcom/Makefile
CONFLICT (content): Merge conflict in drivers/soc/qcom/Kconfig
CONFLICT (modify/delete): drivers/soc/mediatek/mtk-scpsys.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/soc/mediatek/mtk-scpsys.c left in tree.
CONFLICT (content): Merge conflict in drivers/soc/mediatek/Kconfig
CONFLICT (modify/delete): drivers/soc/dove/pmu.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/soc/dove/pmu.c left in tree.
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/sh/pm_runtime.c
CONFLICT (content): Merge conflict in drivers/scsi/sd.c
CONFLICT (content): Merge conflict in drivers/scsi/scsi_sysfs.c
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/tcm_qla2xxx.c
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_nx.c
CONFLICT (content): Merge conflict in drivers/scsi/mpt3sas/mpt3sas_scsih.c
CONFLICT (content): Merge conflict in drivers/scsi/mpt3sas/Kconfig
CONFLICT (content): Merge conflict in drivers/scsi/hpsa.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/ap_bus.c
CONFLICT (content): Merge conflict in drivers/s390/crypto/Makefile
CONFLICT (content): Merge conflict in drivers/rtc/rtc-ds1307.c
CONFLICT (content): Merge conflict in drivers/rtc/rtc-da9063.c
CONFLICT (modify/delete): drivers/reset/reset-zynq.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/reset/reset-zynq.c left in tree.
CONFLICT (modify/delete): drivers/reset/reset-ath79.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/reset/reset-ath79.c left in tree.
CONFLICT (content): Merge conflict in drivers/reset/Makefile
CONFLICT (modify/delete): drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c left in tree.
CONFLICT (modify/delete): drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c left in tree.
CONFLICT (content): Merge conflict in drivers/pinctrl/mediatek/pinctrl-mtk-common.c
CONFLICT (modify/delete): drivers/pinctrl/intel/pinctrl-broxton.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/pinctrl/intel/pinctrl-broxton.c left in tree.
CONFLICT (content): Merge conflict in drivers/phy/phy-rockchip-usb.c
CONFLICT (modify/delete): drivers/phy/phy-mt65xx-usb3.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/phy/phy-mt65xx-usb3.c left in tree.
CONFLICT (modify/delete): drivers/phy/phy-bcm-cygnus-pcie.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/phy/phy-bcm-cygnus-pcie.c left in tree.
CONFLICT (content): Merge conflict in drivers/pci/probe.c
CONFLICT (content): Merge conflict in drivers/pci/pci-sysfs.c
CONFLICT (content): Merge conflict in drivers/pci/msi.c
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-rcar.c
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-iproc.h
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-iproc.c
CONFLICT (modify/delete): drivers/pci/host/pcie-hisi.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/pci/host/pcie-hisi.c left in tree.
CONFLICT (content): Merge conflict in drivers/pci/host/pcie-designware.c
CONFLICT (modify/delete): drivers/pci/host/pcie-altera.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/pci/host/pcie-altera.c left in tree.
CONFLICT (content): Merge conflict in drivers/pci/host/Kconfig
CONFLICT (content): Merge conflict in drivers/of/of_reserved_mem.c
CONFLICT (modify/delete): drivers/nvme/host/nvme.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/nvme/host/nvme.h left in tree.
CONFLICT (modify/delete): drivers/nvme/host/lightnvm.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/nvme/host/lightnvm.c left in tree.
CONFLICT (modify/delete): drivers/nvme/host/Makefile deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/nvme/host/Makefile left in tree.
CONFLICT (content): Merge conflict in drivers/net/wireless/rtlwifi/rtl8821ae/sw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/rtlwifi/rtl8821ae/hw.c
CONFLICT (content): Merge conflict in drivers/net/wireless/iwlwifi/iwl-8000.c
CONFLICT (content): Merge conflict in drivers/net/wireless/iwlwifi/iwl-7000.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/pci.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/hw.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/core.c
CONFLICT (content): Merge conflict in drivers/net/vxlan.c
CONFLICT (modify/delete): drivers/net/vrf.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/vrf.c left in tree.
CONFLICT (content): Merge conflict in drivers/net/vmxnet3/vmxnet3_int.h
CONFLICT (content): Merge conflict in drivers/net/usb/cdc_ncm.c
CONFLICT (content): Merge conflict in drivers/net/usb/cdc_mbim.c
CONFLICT (content): Merge conflict in drivers/net/phy/vitesse.c
CONFLICT (content): Merge conflict in drivers/net/geneve.c
CONFLICT (modify/delete): drivers/net/fjes/fjes_hw.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/fjes/fjes_hw.c left in tree.
CONFLICT (content): Merge conflict in drivers/net/ethernet/ti/cpsw.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/ti/cpsw-common.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/sfc/ef10.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/renesas/sh_eth.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/renesas/ravb_main.c
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_spq.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_spq.c left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_sp.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_sp.h left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_reg_addr.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_reg_addr.h left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_main.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_main.c left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_int.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_int.h left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_int.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_int.c left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed_dev.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed_dev.c left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/qlogic/qed/qed.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/qlogic/qed/qed.h left in tree.
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/en_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/marvell/mvpp2.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/marvell/mvneta.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/i40evf/i40e_adminq.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/intel/i40e/i40e_adminq.c
CONFLICT (modify/delete): drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/hisilicon/hns/hns_dsaf_reg.h left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c left in tree.
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/gianfar.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/freescale/fsl_pq_mdio.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/emulex/benet/be_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/cavium/thunder/nicvf_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/cavium/thunder/nic_main.c
CONFLICT (modify/delete): drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/broadcom/bnxt/bnxt.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/broadcom/bnxt/bnxt.h left in tree.
CONFLICT (modify/delete): drivers/net/ethernet/broadcom/bnxt/bnxt.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/ethernet/broadcom/bnxt/bnxt.c left in tree.
CONFLICT (content): Merge conflict in drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/apm/xgene/xgene_enet_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/amd/pcnet32.c
CONFLICT (modify/delete): drivers/net/can/sun4i_can.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/net/can/sun4i_can.c left in tree.
CONFLICT (content): Merge conflict in drivers/mtd/ofpart.c
CONFLICT (content): Merge conflict in drivers/mmc/host/pxamci.c
CONFLICT (content): Merge conflict in drivers/mmc/host/mtk-sd.c
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
CONFLICT (content): Merge conflict in drivers/misc/cxl/api.c
CONFLICT (modify/delete): drivers/media/v4l2-core/videobuf2-v4l2.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/v4l2-core/videobuf2-v4l2.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/v4l2-core/videobuf2-core.c
CONFLICT (content): Merge conflict in drivers/media/v4l2-core/v4l2-compat-ioctl32.c
CONFLICT (content): Merge conflict in drivers/media/usb/uvc/uvc_video.c
CONFLICT (content): Merge conflict in drivers/media/usb/uvc/uvc_queue.c
CONFLICT (content): Merge conflict in drivers/media/usb/usbtv/usbtv-video.c
CONFLICT (content): Merge conflict in drivers/media/usb/stk1160/stk1160-video.c
CONFLICT (content): Merge conflict in drivers/media/usb/stk1160/stk1160-v4l.c
CONFLICT (content): Merge conflict in drivers/media/usb/s2255/s2255drv.c
CONFLICT (content): Merge conflict in drivers/media/usb/pwc/pwc-if.c
CONFLICT (content): Merge conflict in drivers/media/usb/msi2500/msi2500.c
CONFLICT (content): Merge conflict in drivers/media/usb/hackrf/hackrf.c
CONFLICT (content): Merge conflict in drivers/media/usb/go7007/go7007-v4l2.c
CONFLICT (content): Merge conflict in drivers/media/usb/go7007/go7007-driver.c
CONFLICT (content): Merge conflict in drivers/media/usb/em28xx/em28xx-video.c
CONFLICT (content): Merge conflict in drivers/media/usb/em28xx/em28xx-vbi.c
CONFLICT (content): Merge conflict in drivers/media/usb/au0828/au0828-video.c
CONFLICT (content): Merge conflict in drivers/media/usb/au0828/au0828-vbi.c
CONFLICT (content): Merge conflict in drivers/media/usb/airspy/airspy.c
CONFLICT (content): Merge conflict in drivers/media/tuners/si2157.c
CONFLICT (content): Merge conflict in drivers/media/rc/rc-main.c
CONFLICT (content): Merge conflict in drivers/media/rc/rc-ir-raw.c
CONFLICT (content): Merge conflict in drivers/media/platform/xilinx/xilinx-dma.c
CONFLICT (content): Merge conflict in drivers/media/platform/vsp1/vsp1_video.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-vid-out.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-vid-cap.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-vbi-out.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-vbi-cap.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-sdr-cap.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-kthread-out.c
CONFLICT (content): Merge conflict in drivers/media/platform/vivid/vivid-kthread-cap.c
CONFLICT (content): Merge conflict in drivers/media/platform/vim2m.c
CONFLICT (content): Merge conflict in drivers/media/platform/ti-vpe/vpe.c
CONFLICT (modify/delete): drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c left in tree.
CONFLICT (modify/delete): drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/platform/sti/bdisp/bdisp-v4l2.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/soc_camera.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/rcar_vin.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/mx3_camera.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/mx2_camera.c
CONFLICT (content): Merge conflict in drivers/media/platform/soc_camera/atmel-isi.c
CONFLICT (content): Merge conflict in drivers/media/platform/sh_vou.c
CONFLICT (content): Merge conflict in drivers/media/platform/sh_veu.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-tv/mixer_video.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-mfc/s5p_mfc.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-jpeg/jpeg-core.c
CONFLICT (content): Merge conflict in drivers/media/platform/s5p-g2d/g2d.c
CONFLICT (content): Merge conflict in drivers/media/platform/s3c-camif/camif-core.h
CONFLICT (content): Merge conflict in drivers/media/platform/s3c-camif/camif-capture.c
CONFLICT (modify/delete): drivers/media/platform/rcar_jpu.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/platform/rcar_jpu.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/platform/omap3isp/ispvideo.c
CONFLICT (content): Merge conflict in drivers/media/platform/omap3isp/isp.h
CONFLICT (content): Merge conflict in drivers/media/platform/omap3isp/isp.c
CONFLICT (content): Merge conflict in drivers/media/platform/mx2_emmaprp.c
CONFLICT (content): Merge conflict in drivers/media/platform/marvell-ccic/mcam-core.c
CONFLICT (content): Merge conflict in drivers/media/platform/m2m-deinterlace.c
CONFLICT (content): Merge conflict in drivers/media/platform/exynos4-is/fimc-m2m.c
CONFLICT (content): Merge conflict in drivers/media/platform/exynos4-is/fimc-lite.c
CONFLICT (content): Merge conflict in drivers/media/platform/exynos4-is/fimc-isp-video.c
CONFLICT (content): Merge conflict in drivers/media/platform/exynos4-is/fimc-capture.c
CONFLICT (content): Merge conflict in drivers/media/platform/exynos-gsc/gsc-m2m.c
CONFLICT (content): Merge conflict in drivers/media/platform/davinci/vpif_display.c
CONFLICT (content): Merge conflict in drivers/media/platform/davinci/vpif_capture.c
CONFLICT (content): Merge conflict in drivers/media/platform/davinci/vpbe_display.c
CONFLICT (content): Merge conflict in drivers/media/platform/coda/coda-jpeg.c
CONFLICT (content): Merge conflict in drivers/media/platform/coda/coda-common.c
CONFLICT (content): Merge conflict in drivers/media/platform/coda/coda-bit.c
CONFLICT (content): Merge conflict in drivers/media/platform/blackfin/bfin_capture.c
CONFLICT (content): Merge conflict in drivers/media/platform/am437x/am437x-vpfe.c
CONFLICT (content): Merge conflict in drivers/media/pci/tw68/tw68-video.c
CONFLICT (content): Merge conflict in drivers/media/pci/tw68/tw68-core.c
CONFLICT (content): Merge conflict in drivers/media/pci/sta2x11/sta2x11_vip.c
CONFLICT (content): Merge conflict in drivers/media/pci/solo6x10/solo6x10-v4l2.c
CONFLICT (content): Merge conflict in drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
CONFLICT (content): Merge conflict in drivers/media/pci/saa7164/saa7164-core.c
CONFLICT (content): Merge conflict in drivers/media/pci/saa7134/saa7134.h
CONFLICT (content): Merge conflict in drivers/media/pci/saa7134/saa7134-video.c
CONFLICT (content): Merge conflict in drivers/media/pci/saa7134/saa7134-vbi.c
CONFLICT (content): Merge conflict in drivers/media/pci/saa7134/saa7134-ts.c
CONFLICT (content): Merge conflict in drivers/media/pci/saa7134/saa7134-core.c
CONFLICT (modify/delete): drivers/media/pci/netup_unidvb/netup_unidvb_core.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/pci/netup_unidvb/netup_unidvb_core.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/pci/dt3155/dt3155.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-video.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-vbi.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-mpeg.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-dvb.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-core.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-blackbird.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx88/cx88-alsa.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx25821/cx25821-video.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx25821/cx25821-core.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx23885/cx23885-video.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx23885/cx23885-vbi.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx23885/cx23885-dvb.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx23885/cx23885-core.c
CONFLICT (content): Merge conflict in drivers/media/pci/cx23885/cx23885-417.c
CONFLICT (content): Merge conflict in drivers/media/pci/cobalt/cobalt-v4l2.c
CONFLICT (content): Merge conflict in drivers/media/pci/cobalt/cobalt-irq.c
CONFLICT (content): Merge conflict in drivers/media/media-entity.c
CONFLICT (modify/delete): drivers/media/i2c/tc358743.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/media/i2c/tc358743.c left in tree.
CONFLICT (content): Merge conflict in drivers/media/dvb-frontends/rtl2832_sdr.c
CONFLICT (content): Merge conflict in drivers/media/dvb-frontends/Kconfig
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dvbdev.h
CONFLICT (content): Merge conflict in drivers/media/dvb-core/dvb_frontend.h
CONFLICT (content): Merge conflict in drivers/media/dvb-core/demux.h
CONFLICT (content): Merge conflict in drivers/md/md.c
CONFLICT (content): Merge conflict in drivers/md/dm.c
CONFLICT (content): Merge conflict in drivers/md/dm-thin.c
CONFLICT (content): Merge conflict in drivers/md/dm-mpath.c
CONFLICT (modify/delete): drivers/lightnvm/rrpc.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/lightnvm/rrpc.c left in tree.
CONFLICT (modify/delete): drivers/lightnvm/gennvm.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/lightnvm/gennvm.h left in tree.
CONFLICT (modify/delete): drivers/lightnvm/gennvm.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/lightnvm/gennvm.c left in tree.
CONFLICT (modify/delete): drivers/lightnvm/core.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/lightnvm/core.c left in tree.
CONFLICT (modify/delete): drivers/lightnvm/Kconfig deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/lightnvm/Kconfig left in tree.
CONFLICT (modify/delete): drivers/iommu/s390-iommu.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/iommu/s390-iommu.c left in tree.
CONFLICT (modify/delete): drivers/iommu/intel-svm.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/iommu/intel-svm.c left in tree.
CONFLICT (content): Merge conflict in drivers/iommu/amd_iommu_v2.c
CONFLICT (content): Merge conflict in drivers/input/touchscreen/sur40.c
CONFLICT (content): Merge conflict in drivers/input/touchscreen/elants_i2c.c
CONFLICT (content): Merge conflict in drivers/input/serio/parkbd.c
CONFLICT (content): Merge conflict in drivers/input/mouse/elan_i2c_core.c
CONFLICT (content): Merge conflict in drivers/input/joystick/walkera0701.c
CONFLICT (content): Merge conflict in drivers/input/joystick/turbografx.c
CONFLICT (content): Merge conflict in drivers/input/joystick/gamecon.c
CONFLICT (content): Merge conflict in drivers/input/joystick/db9.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/srpt/ib_srpt.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/srp/ib_srp.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iser_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iser_memory.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iscsi_iser.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/qib/qib_verbs.h
CONFLICT (content): Merge conflict in drivers/infiniband/hw/qib/qib_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/ocrdma/ocrdma_hw.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mthca/mthca_provider.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx4/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/ipath/ipath_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/uverbs_cmd.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/sa_query.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/cma.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/cm.c
CONFLICT (modify/delete): drivers/iio/proximity/pulsedlight-lidar-lite-v2.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/iio/proximity/pulsedlight-lidar-lite-v2.c left in tree.
CONFLICT (modify/delete): drivers/iio/light/apds9960.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/iio/light/apds9960.c left in tree.
CONFLICT (content): Merge conflict in drivers/iio/adc/vf610_adc.c
CONFLICT (content): Merge conflict in drivers/i2c/i2c-core.c
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-xiic.c
CONFLICT (modify/delete): drivers/i2c/busses/i2c-uniphier.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/i2c/busses/i2c-uniphier.c left in tree.
CONFLICT (modify/delete): drivers/i2c/busses/i2c-uniphier-f.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/i2c/busses/i2c-uniphier-f.c left in tree.
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-rcar.c
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-imx.c
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-i801.c
CONFLICT (modify/delete): drivers/i2c/busses/i2c-emev2.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/i2c/busses/i2c-emev2.c left in tree.
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-designware-platdrv.c
CONFLICT (content): Merge conflict in drivers/i2c/busses/i2c-cadence.c
CONFLICT (content): Merge conflict in drivers/i2c/busses/Kconfig
CONFLICT (modify/delete): drivers/hwmon/scpi-hwmon.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/hwmon/scpi-hwmon.c left in tree.
CONFLICT (content): Merge conflict in drivers/hwmon/fam15h_power.c
CONFLICT (content): Merge conflict in drivers/hwmon/Kconfig
CONFLICT (content): Merge conflict in drivers/hid/wacom_wac.c
CONFLICT (content): Merge conflict in drivers/hid/wacom_sys.c
CONFLICT (content): Merge conflict in drivers/hid/usbhid/hid-quirks.c
CONFLICT (content): Merge conflict in drivers/hid/i2c-hid/i2c-hid.c
CONFLICT (content): Merge conflict in drivers/hid/hid-logitech-hidpp.c
CONFLICT (content): Merge conflict in drivers/hid/hid-lg.c
CONFLICT (content): Merge conflict in drivers/hid/hid-ids.h
CONFLICT (modify/delete): drivers/hid/hid-corsair.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/hid/hid-corsair.c left in tree.
CONFLICT (content): Merge conflict in drivers/hid/hid-core.c
CONFLICT (modify/delete): drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
CONFLICT (modify/delete): drivers/gpu/drm/vc4/vc4_plane.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/vc4/vc4_plane.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/vc4/vc4_hvs.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/vc4/vc4_hvs.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/vc4/vc4_drv.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/vc4/vc4_drv.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/vc4/vc4_crtc.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/vc4/vc4_crtc.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/rockchip/rockchip_drm_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/si_dpm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_display.c
CONFLICT (modify/delete): drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk104.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
CONFLICT (modify/delete): drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/include/nvkm/core/device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/mgag200/mgag200_cursor.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_runtime_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_hdmi.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_stolen.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
CONFLICT (modify/delete): drivers/gpu/drm/i915/i915_gem_fence.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/i915/i915_gem_fence.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_context.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/exynos/exynos_drm_crtc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_fb_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_atomic_helper.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_atomic.c
CONFLICT (modify/delete): drivers/gpu/drm/amd/scheduler/sched_fence.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/amd/scheduler/sched_fence.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/amd/scheduler/gpu_scheduler.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/amd/scheduler/gpu_scheduler.h left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/amd/scheduler/gpu_scheduler.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/amd/scheduler/gpu_scheduler.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/amd/scheduler/gpu_sched_trace.h deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/amd/scheduler/gpu_sched_trace.h left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
CONFLICT (modify/delete): drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/Makefile
CONFLICT (content): Merge conflict in drivers/gpio/gpiolib.c
CONFLICT (modify/delete): drivers/gpio/gpio-ath79.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/gpio/gpio-ath79.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpio/Kconfig
CONFLICT (modify/delete): drivers/fpga/fpga-mgr.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/fpga/fpga-mgr.c left in tree.
CONFLICT (modify/delete): drivers/firmware/qcom_scm-64.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/firmware/qcom_scm-64.c left in tree.
CONFLICT (content): Merge conflict in drivers/firmware/efi/Makefile
CONFLICT (content): Merge conflict in drivers/dma/imx-sdma.c
CONFLICT (content): Merge conflict in drivers/dma/edma.c
CONFLICT (content): Merge conflict in drivers/dma/at_xdmac.c
CONFLICT (content): Merge conflict in drivers/dma/at_hdmac.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/ghash.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/aes_ctr.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/aes_cbc.c
CONFLICT (content): Merge conflict in drivers/crypto/vmx/aes.c
CONFLICT (content): Merge conflict in drivers/crypto/talitos.c
CONFLICT (modify/delete): drivers/cpufreq/scpi-cpufreq.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/cpufreq/scpi-cpufreq.c left in tree.
CONFLICT (content): Merge conflict in drivers/cpufreq/intel_pstate.c
CONFLICT (content): Merge conflict in drivers/cpufreq/cpufreq.c
CONFLICT (modify/delete): drivers/cpufreq/cppc_cpufreq.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/cpufreq/cppc_cpufreq.c left in tree.
CONFLICT (content): Merge conflict in drivers/cpufreq/Kconfig.arm
CONFLICT (content): Merge conflict in drivers/clk/versatile/Kconfig
CONFLICT (modify/delete): drivers/clk/ti/clk-814x.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/ti/clk-814x.c left in tree.
CONFLICT (content): Merge conflict in drivers/clk/tegra/clk.h
CONFLICT (content): Merge conflict in drivers/clk/tegra/clk-pll.c
CONFLICT (content): Merge conflict in drivers/clk/tegra/Makefile
CONFLICT (content): Merge conflict in drivers/clk/sunxi/clk-sunxi.c
CONFLICT (modify/delete): drivers/clk/sunxi/clk-simple-gates.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/sunxi/clk-simple-gates.c left in tree.
CONFLICT (modify/delete): drivers/clk/sunxi/clk-a10-pll2.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/sunxi/clk-a10-pll2.c left in tree.
CONFLICT (content): Merge conflict in drivers/clk/sunxi/Makefile
CONFLICT (content): Merge conflict in drivers/clk/rockchip/clk.h
CONFLICT (modify/delete): drivers/clk/rockchip/clk-rk3368.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/rockchip/clk-rk3368.c left in tree.
CONFLICT (content): Merge conflict in drivers/clk/rockchip/clk-pll.c
CONFLICT (modify/delete): drivers/clk/imx/clk-imx6ul.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/imx/clk-imx6ul.c left in tree.
CONFLICT (content): Merge conflict in drivers/clk/imx/clk-imx25.c
CONFLICT (modify/delete): drivers/clk/clk-scpi.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/clk-scpi.c left in tree.
CONFLICT (content): Merge conflict in drivers/clk/clk-qoriq.c
CONFLICT (modify/delete): drivers/clk/clk-gpio.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/clk/clk-gpio.c left in tree.
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_si_intf.c
CONFLICT (modify/delete): drivers/bus/sunxi-rsb.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/bus/sunxi-rsb.c left in tree.
CONFLICT (content): Merge conflict in drivers/bus/Kconfig
CONFLICT (content): Merge conflict in drivers/block/xen-blkback/blkback.c
CONFLICT (content): Merge conflict in drivers/block/nvme-core.c
CONFLICT (content): Merge conflict in drivers/block/null_blk.c
CONFLICT (content): Merge conflict in drivers/base/power/domain.c
CONFLICT (content): Merge conflict in drivers/acpi/processor_driver.c
CONFLICT (content): Merge conflict in drivers/acpi/pci_root.c
CONFLICT (content): Merge conflict in drivers/acpi/nfit.c
CONFLICT (content): Merge conflict in drivers/acpi/ec.c
CONFLICT (modify/delete): drivers/acpi/cppc_acpi.c deleted in libata/for-next and modified in HEAD. Version HEAD of drivers/acpi/cppc_acpi.c left in tree.
CONFLICT (content): Merge conflict in drivers/acpi/Kconfig
CONFLICT (content): Merge conflict in drivers/Makefile
CONFLICT (content): Merge conflict in block/blk.h
CONFLICT (content): Merge conflict in block/blk-settings.c
CONFLICT (content): Merge conflict in block/blk-mq.c
CONFLICT (content): Merge conflict in block/blk-merge.c
CONFLICT (content): Merge conflict in arch/x86/xen/suspend.c
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
CONFLICT (content): Merge conflict in arch/x86/kvm/vmx.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mtrr.c
CONFLICT (content): Merge conflict in arch/x86/kernel/smpboot.c
CONFLICT (content): Merge conflict in arch/x86/kernel/pmem.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/perf_event_intel_lbr.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/perf_event.h
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/microcode/core.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/pgtable_types.h
CONFLICT (content): Merge conflict in arch/x86/include/asm/page_types.h
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/entry_64.S
CONFLICT (content): Merge conflict in arch/tile/kernel/time.c
CONFLICT (content): Merge conflict in arch/sparc/kernel/systbls_64.S
CONFLICT (content): Merge conflict in arch/sparc/kernel/systbls_32.S
CONFLICT (content): Merge conflict in arch/sparc/include/uapi/asm/unistd.h
CONFLICT (content): Merge conflict in arch/s390/pci/pci_dma.c
CONFLICT (content): Merge conflict in arch/s390/kvm/kvm-s390.c
CONFLICT (content): Merge conflict in arch/s390/kernel/traps.c
CONFLICT (modify/delete): arch/s390/kernel/trace.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/s390/kernel/trace.c left in tree.
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls.S
CONFLICT (content): Merge conflict in arch/s390/kernel/smp.c
CONFLICT (modify/delete): arch/s390/kernel/sclp.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/s390/kernel/sclp.c left in tree.
CONFLICT (content): Merge conflict in arch/s390/kernel/head64.S
CONFLICT (content): Merge conflict in arch/s390/kernel/head.S
CONFLICT (content): Merge conflict in arch/s390/kernel/entry.S
CONFLICT (content): Merge conflict in arch/s390/kernel/early.c
CONFLICT (content): Merge conflict in arch/s390/kernel/diag.c
CONFLICT (content): Merge conflict in arch/s390/kernel/crash_dump.c
CONFLICT (content): Merge conflict in arch/s390/kernel/compat_wrapper.c
CONFLICT (content): Merge conflict in arch/s390/kernel/asm-offsets.c
CONFLICT (content): Merge conflict in arch/s390/kernel/Makefile
CONFLICT (content): Merge conflict in arch/s390/include/uapi/asm/unistd.h
CONFLICT (modify/delete): arch/s390/include/asm/trace/diag.h deleted in libata/for-next and modified in HEAD. Version HEAD of arch/s390/include/asm/trace/diag.h left in tree.
CONFLICT (content): Merge conflict in arch/s390/include/asm/setup.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/sclp.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/processor.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/pci_dma.h
CONFLICT (modify/delete): arch/s390/include/asm/fpu/internal.h deleted in libata/for-next and modified in HEAD. Version HEAD of arch/s390/include/asm/fpu/internal.h left in tree.
CONFLICT (content): Merge conflict in arch/s390/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/dlpar.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/powernv/eeh-powernv.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/cell/Kconfig
CONFLICT (content): Merge conflict in arch/powerpc/mm/hugetlbpage.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/hash_utils_64.c
CONFLICT (modify/delete): arch/powerpc/mm/hash_low_64.S deleted in HEAD and modified in libata/for-next. Version libata/for-next of arch/powerpc/mm/hash_low_64.S left in tree.
CONFLICT (content): Merge conflict in arch/powerpc/kernel/process.c
CONFLICT (content): Merge conflict in arch/powerpc/include/uapi/asm/unistd.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/systbl.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/switch_to.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/reg.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/page.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/nohash/64/pgtable.h
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscall_table.S
CONFLICT (content): Merge conflict in arch/parisc/include/uapi/asm/unistd.h
CONFLICT (modify/delete): arch/mips/vdso/Makefile deleted in libata/for-next and modified in HEAD. Version HEAD of arch/mips/vdso/Makefile left in tree.
CONFLICT (content): Merge conflict in arch/mips/kernel/cps-vec.S
CONFLICT (content): Merge conflict in arch/mips/ath79/irq.c
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalltable.S
CONFLICT (content): Merge conflict in arch/m68k/include/uapi/asm/unistd.h
CONFLICT (content): Merge conflict in arch/m68k/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/m68k/configs/sun3x_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/sun3_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/q40_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/mvme16x_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/mvme147_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/multi_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/mac_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/hp300_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/bvme6000_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/atari_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/apollo_defconfig
CONFLICT (content): Merge conflict in arch/m68k/configs/amiga_defconfig
CONFLICT (content): Merge conflict in arch/m68k/coldfire/m54xx.c
CONFLICT (content): Merge conflict in arch/m32r/include/asm/io.h
CONFLICT (content): Merge conflict in arch/ia64/kernel/entry.S
CONFLICT (content): Merge conflict in arch/ia64/include/uapi/asm/unistd.h
CONFLICT (content): Merge conflict in arch/ia64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/mm/proc.S
CONFLICT (content): Merge conflict in arch/arm64/mm/dma-mapping.c
CONFLICT (content): Merge conflict in arch/arm64/mm/context.c
CONFLICT (content): Merge conflict in arch/arm64/kvm/sys_regs.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/vmlinux.lds.S
CONFLICT (content): Merge conflict in arch/arm64/kernel/traps.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/perf_event.c
CONFLICT (modify/delete): arch/arm64/kernel/perf_callchain.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/kernel/perf_callchain.c left in tree.
CONFLICT (content): Merge conflict in arch/arm64/kernel/efi.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpuinfo.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/cpufeature.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/pgtable-hwdef.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/mmu_context.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/irq.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/hw_breakpoint.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/assembler.h
CONFLICT (modify/delete): arch/arm64/include/asm/arch_gicv3.h deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/include/asm/arch_gicv3.h left in tree.
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
CONFLICT (modify/delete): arch/arm64/boot/dts/rockchip/rk3368.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/rockchip/rk3368.dtsi left in tree.
CONFLICT (modify/delete): arch/arm64/boot/dts/rockchip/rk3368-r88.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/rockchip/rk3368-r88.dts left in tree.
CONFLICT (modify/delete): arch/arm64/boot/dts/rockchip/Makefile deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/rockchip/Makefile left in tree.
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/msm8916.dtsi
CONFLICT (modify/delete): arch/arm64/boot/dts/qcom/msm8916-pins.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/qcom/msm8916-pins.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8173-evb.dts
CONFLICT (modify/delete): arch/arm64/boot/dts/marvell/berlin4ct.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/marvell/berlin4ct.dtsi left in tree.
CONFLICT (modify/delete): arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/Makefile
CONFLICT (modify/delete): arch/arm64/boot/dts/broadcom/ns2.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/broadcom/ns2.dtsi left in tree.
CONFLICT (modify/delete): arch/arm64/boot/dts/broadcom/ns2-svk.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/broadcom/ns2-svk.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/juno.dts
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/arm/juno-r1.dts
CONFLICT (modify/delete): arch/arm64/boot/dts/apm/apm-shadowcat.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/apm/apm-shadowcat.dtsi left in tree.
CONFLICT (modify/delete): arch/arm64/boot/dts/apm/apm-merlin.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/boot/dts/apm/apm-merlin.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/Makefile
CONFLICT (modify/delete): arch/arm64/Kconfig.platforms deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm64/Kconfig.platforms left in tree.
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in arch/arm/plat-samsung/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mm/proc-v7.S
CONFLICT (modify/delete): arch/arm/mm/cache-uniphier.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/mm/cache-uniphier.c left in tree.
CONFLICT (content): Merge conflict in arch/arm/mm/cache-l2x0.c
CONFLICT (content): Merge conflict in arch/arm/mach-zx/Kconfig
CONFLICT (modify/delete): arch/arm/mach-ux500/timer.c deleted in HEAD and modified in libata/for-next. Version libata/for-next of arch/arm/mach-ux500/timer.c left in tree.
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/setup.h
CONFLICT (content): Merge conflict in arch/arm/mach-ux500/platsmp.c
CONFLICT (content): Merge conflict in arch/arm/mach-uniphier/platsmp.c
CONFLICT (content): Merge conflict in arch/arm/mach-socfpga/platsmp.c
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/sh73a0.h
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/setup-r8a7778.c
CONFLICT (content): Merge conflict in arch/arm/mach-shmobile/console.c
CONFLICT (content): Merge conflict in arch/arm/mach-rockchip/platsmp.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palmtc.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/palm27x.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/magician.c
CONFLICT (content): Merge conflict in arch/arm/mach-pxa/ezx.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/powerdomains3xxx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/pdata-quirks.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_81xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_7xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
CONFLICT (modify/delete): arch/arm/mach-omap2/omap-iommu.c deleted in HEAD and modified in libata/for-next. Version libata/for-next of arch/arm/mach-omap2/omap-iommu.c left in tree.
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/io.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/clockdomains81xx_data.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/clkt_dpll.c
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/Makefile
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-mmp/pm-pxa910.c
CONFLICT (modify/delete): arch/arm/mach-mediatek/platsmp.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/mach-mediatek/platsmp.c left in tree.
CONFLICT (content): Merge conflict in arch/arm/mach-imx/mach-imx7d.c
CONFLICT (modify/delete): arch/arm/mach-imx/mach-imx6ul.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/mach-imx/mach-imx6ul.c left in tree.
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/pmu.c
CONFLICT (content): Merge conflict in arch/arm/mach-dove/irq.c
CONFLICT (content): Merge conflict in arch/arm/mach-berlin/platsmp.c
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/Makefile
CONFLICT (content): Merge conflict in arch/arm/mach-bcm/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-at91/Kconfig
CONFLICT (content): Merge conflict in arch/arm/kvm/psci.c
CONFLICT (content): Merge conflict in arch/arm/kvm/arm.c
CONFLICT (content): Merge conflict in arch/arm/kernel/smp.c
CONFLICT (content): Merge conflict in arch/arm/kernel/process.c
CONFLICT (content): Merge conflict in arch/arm/kernel/calls.S
CONFLICT (content): Merge conflict in arch/arm/kernel/bios32.c
CONFLICT (content): Merge conflict in arch/arm/include/uapi/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/include/asm/uaccess.h
CONFLICT (content): Merge conflict in arch/arm/include/asm/psci.h
CONFLICT (content): Merge conflict in arch/arm/include/asm/irq.h
CONFLICT (modify/delete): arch/arm/include/asm/arch_gicv3.h deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/include/asm/arch_gicv3.h left in tree.
CONFLICT (content): Merge conflict in arch/arm/configs/sama5_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/qcom_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/lpc18xx_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/imx_v6_v7_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/exynos_defconfig
CONFLICT (content): Merge conflict in arch/arm/configs/at91_dt_defconfig
CONFLICT (content): Merge conflict in arch/arm/boot/dts/zynq-zc702.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/vfxxx.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/uniphier-proxstream2.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/uniphier-proxstream2.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/uniphier-ph1-pro5.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/uniphier-ph1-pro5.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/tegra124-nyan.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-pcduino3.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
CONFLICT (modify/delete): arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun7i-a20-bananapi.dts
CONFLICT (modify/delete): arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/sun6i-a31s-primo81.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun6i-a31s-primo81.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun4i-a10.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/sun4i-a10-inet1.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sun4i-a10-inet1.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/stihxxx-b2120.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/ste-hrefv60plus.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
CONFLICT (modify/delete): arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/sama5d2.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/sama5d2.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-veyron.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-veyron.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-veyron-speedy.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-veyron-speedy.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-veyron-minnie.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-veyron-minnie.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-rock2-square.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-rock2-square.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-rock2-som.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-rock2-som.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/rk3288-r89.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/rk3288-r89.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/rk3188.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7794.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/r8a7794-silk.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/r8a7794-silk.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/r8a7793.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/r8a7793.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/r8a7793-gose.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/r8a7793-gose.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7791.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/r8a7791-porter.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/r8a7791-porter.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/r8a7790.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-msm8974.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8084-mtp.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8064.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/omap5-uevm.dts
CONFLICT (modify/delete): arch/arm/boot/dts/omap5-board-common.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/omap5-board-common.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/omap3-overo-palo35-common.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/omap3-overo-palo35-common.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/omap3-devkit8000-common.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/omap3-devkit8000-common.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/omap3-beagle.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/mt8135.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/ls1021a-twr.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/ls1021a-qds.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
CONFLICT (modify/delete): arch/arm/boot/dts/lpc4337-ciaa.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/lpc4337-ciaa.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/lpc18xx.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx7d.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/imx6ul.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/imx6ul.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6sl.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5422-odroidxu3.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
CONFLICT (modify/delete): arch/arm/boot/dts/exynos5250-snow-common.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/exynos5250-snow-common.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/exynos4210-universal_c210.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/dra72-evm.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/dra7.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/dra7-evm.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/dove.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/dm814x.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/dm814x.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/dm814x-clocks.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/dm814x-clocks.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/dm8148-t410.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/dm8148-t410.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/dm8148-evm.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/dm8148-evm.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/bcm958625k.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/bcm958625k.dts left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/bcm-nsp.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/bcm-nsp.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm-cygnus.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/at91-sama5d2_xplained.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/at91-sama5d2_xplained.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/armada-388-gp.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am57xx-beagle-x15.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am43x-epos-evm.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am437x-sk-evm.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am437x-gp-evm.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am4372.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am33xx.dtsi
CONFLICT (modify/delete): arch/arm/boot/dts/am335x-wega.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/am335x-wega.dtsi left in tree.
CONFLICT (modify/delete): arch/arm/boot/dts/am335x-phycore-som.dtsi deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/am335x-phycore-som.dtsi left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am335x-evmsk.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/am335x-evm.dts
CONFLICT (modify/delete): arch/arm/boot/dts/am335x-bonegreen.dts deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arm/boot/dts/am335x-bonegreen.dts left in tree.
CONFLICT (content): Merge conflict in arch/arm/boot/dts/Makefile
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in arch/arc/mm/init.c
CONFLICT (modify/delete): arch/arc/mm/highmem.c deleted in libata/for-next and modified in HEAD. Version HEAD of arch/arc/mm/highmem.c left in tree.
CONFLICT (content): Merge conflict in arch/arc/kernel/smp.c
CONFLICT (content): Merge conflict in arch/arc/kernel/perf_event.c
CONFLICT (content): Merge conflict in arch/arc/kernel/mcip.c
CONFLICT (content): Merge conflict in arch/arc/kernel/irq.c
CONFLICT (content): Merge conflict in arch/arc/include/asm/smp.h
CONFLICT (content): Merge conflict in arch/arc/include/asm/mach_desc.h
CONFLICT (content): Merge conflict in arch/arc/include/asm/cache.h
CONFLICT (content): Merge conflict in arch/arc/boot/dts/nsim_hs.dts
CONFLICT (content): Merge conflict in Makefile
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/video4linux/v4l2-pci-skeleton.c
CONFLICT (content): Merge conflict in Documentation/i2c/busses/i2c-i801
CONFLICT (content): Merge conflict in Documentation/filesystems/f2fs.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
CONFLICT (modify/delete): Documentation/devicetree/bindings/soc/mediatek/scpsys.txt deleted in libata/for-next and modified in HEAD. Version HEAD of Documentation/devicetree/bindings/soc/mediatek/scpsys.txt left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/serial/mtk-uart.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net/cpsw.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/mtd/partition.txt
CONFLICT (modify/delete): Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt deleted in libata/for-next and modified in HEAD. Version HEAD of Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt left in tree.
CONFLICT (modify/delete): Documentation/devicetree/bindings/i2c/i2c.txt deleted in libata/for-next and modified in HEAD. Version HEAD of Documentation/devicetree/bindings/i2c/i2c.txt left in tree.
CONFLICT (modify/delete): Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt deleted in libata/for-next and modified in HEAD. Version HEAD of Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/dma/ti-edma.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/shmobile.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/rockchip.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/pmu.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/omap/omap.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/mediatek.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/l2c2x0.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm/fsl.txt
CONFLICT (modify/delete): Documentation/arm/keystone/Overview.txt deleted in libata/for-next and modified in HEAD. Version HEAD of Documentation/arm/keystone/Overview.txt left in tree.
CONFLICT (content): Merge conflict in Documentation/DocBook/media/v4l/v4l2.xml
CONFLICT (content): Merge conflict in Documentation/DocBook/media/Makefile
CONFLICT (content): Merge conflict in Documentation/DocBook/device-drivers.tmpl
$ git reset --hard HEAD^
Merging next-20151223 version of libata
Merging pm/linux-next (8fff2d94bfa8 Merge branch 'pm-cpufreq' into linux-next)
Merging idle/next (31ade3b83e18 Linux 4.4-rc3)
Merging apm/for-next (53675abbd1e5 x86, apm: Remove unused variable)
Merging thermal/next (1d296eb7260a Merge branches 'thermal-core' and 'thermal-intel' of .git into next)
Merging thermal-soc/next (ce0265dd6f8e thermal: trip_point_temp_store() calls thermal_zone_device_update())
Applying: thermal: fix for thermal_zone_device_update() API change
Merging ieee1394/for-next (100ceb66d5c4 firewire: ohci: fix JMicron JMB38x IT context discovery)
Merging dlm/next (a6b1533e9a57 dlm: make posix locks interruptible)
Merging swiotlb/linux-next (9d99c7123c9a swiotlb: Enable it under x86 PAE)
Merging slave-dma/next (f9166b3aaff0 Merge branch 'topic/univ_api' into next)
Merging net-next/master (a3748a9c7fc0 Merge branch '10GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in include/linux/pci_ids.h
Merging ipsec-next/master (cb866e3298cd xfrm: Increment statistic counter on inner mode error)
Merging ipvs-next/master (4c50a8ce2b63 netfilter: ipvs: avoid unused variable warning)
Merging wireless-drivers-next/master (f99551a2d39d rtlwifi: rtl_pci: Fix kernel panic)
Merging bluetooth/master (7ddb69222d0f Bluetooth: bfusb: Fix the return error code)
Merging mac80211-next/master (c45932df5612 regulatory: fix world regulatory domain data)
Merging rdma/for-next (59caaed7a72a IB/iser: Support the remote invalidation exception)
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/verbs.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/svc_rdma_transport.c
CONFLICT (content): Merge conflict in net/sunrpc/xprtrdma/frwr_ops.c
CONFLICT (content): Merge conflict in net/rds/iw.c
CONFLICT (content): Merge conflict in net/rds/ib.c
CONFLICT (content): Merge conflict in include/linux/mlx5/vport.h
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
CONFLICT (content): Merge conflict in drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/core/vport.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/srpt/ib_srpt.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/srp/ib_srp.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/isert/ib_isert.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iser_verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iser_memory.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iscsi_iser.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/ipoib/ipoib_main.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/ipoib/ipoib_ethtool.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/ipoib/ipoib_cm.c
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/main.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/verbs.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/uverbs_cmd.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/sysfs.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/fmr_pool.c
CONFLICT (content): Merge conflict in drivers/infiniband/core/cm.c
$ git reset --hard
Merging mtd/master (e488ca9f8d4f doc: dt: mtd: partitions: add compatible property to "partitions" node)
Merging l2-mtd/master (1873315fb156 mtd: sh_flctl: pass FIFO as physical address)
Applying: mtd: nand: fix for drop unnecessary partition parser data
Merging crypto/master (48d627648141 crypto: hifn_795x, picoxcell - use ablkcipher_request_cast)
Merging drm/drm-next (df83690ec2af Merge branch 'drm-rockchip-next-2015-12-28' of https://github.com/markyzq/kernel-drm-rockchip into drm-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/vendor-prefixes.txt
Applying: drm/rockchip: vop: export vop_component_ops to modules
Merging drm-panel/drm/panel/for-next (abf08d5efee4 dt-bindings: Move panel bindings to correct location)
Merging drm-intel/for-linux-next (d5f384de5bf1 drm/i915: Move Braswell stop_machine GGTT insertion workaround)
Merging drm-tegra/drm/tegra/for-next (ad906599c191 drm/tegra: Advertise DRIVER_ATOMIC)
Merging drm-misc/topic/drm-misc (e112e593b215 drm: use dev_name as default unique name in drm_dev_alloc())
Merging drm-exynos/exynos-drm/for-next (25364a9e54fb Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid)
Merging drm-msm/msm-next (2abd1c88345e drm/msm/mdp: fix a problematic usage of WARN_ON())
Merging hdlcd/for-upstream/hdlcd (2651f437261f MAINTAINERS: Add Liviu Dudau as maintainer for ARM HDLCD driver.)
Merging sound/for-next (d8c5ed752e5b ALSA: dummy: constify dummy_timer_ops structures)
Merging sound-asoc/for-next (5787aed27c76 Merge remote-tracking branch 'asoc/topic/wm8960' into asoc-next)
Merging modules/modules-next (b3212ec77dd1 module: keep percpu symbols in module's symtab)
Merging input/next (8dcb3c7628f1 Input: egalax_ts_serial - fix potential NULL dereference on error)
Merging block/for-next (377328479032 Merge branch 'for-4.5/drivers' into for-next)
CONFLICT (content): Merge conflict in drivers/nvme/host/pci.c
CONFLICT (content): Merge conflict in drivers/nvme/host/lightnvm.c
CONFLICT (content): Merge conflict in drivers/nvme/host/Makefile
Applying: nvme: merge fix up for ns code movement
Merging device-mapper/for-next (18d03e8c25f1 dm thin: fix race condition when destroying thin pool workqueue)
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/mmc-next (11bc9381b277 mmc: sdhci-s3c: use mmc_of_parse and remove the card_tasklet)
Merging mmc-uh/next (25cc20daff0f mmc: dw_mmc: remove the unused quirks)
Applying: mmc: tegra: fix bad merge
Merging kgdb/kgdb-next (2d289f14f00a kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (4734eb989638 async_tx: use GFP_NOWAIT rather than GFP_IO)
Merging mfd/for-mfd-next (526c0ab13672 mfd: syscon: Add a DT property to set value width)
Merging backlight/for-backlight-next (ee65ad0e2a9e backlight: pwm_bl: Avoid backlight flicker when probed from DT)
Merging battery/master (f96576bd63e5 power: Fix unmet dependency on POWER_SUPPLY by POWER_RESET by uncoupling them)
Merging omap_dss2/for-next (caf05780f6ed Merge omapdss split between omapdrm and omapfb)
Merging regulator/for-next (e1eadd8e89ae Merge remote-tracking branches 'regulator/topic/qcom-smd', 'regulator/topic/tps6105x', 'regulator/topic/tps65086', 'regulator/topic/tps65218' and 'regulator/topic/wm831x' into regulator-next)
Merging security/next (aa98b942cbf3 Merge branch 'smack-for-4.5' of https://github.com/cschaufler/smack-next into next)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_fs.c
Merging integrity/next (0112721df4ed IMA: policy can be updated zero times)
Merging selinux/next (92f190d2a1ec selinux: rate-limit netlink message warnings in selinux_nlmsg_perm())
Merging lblnet/next (b2776bf7149b Linux 3.18)
Merging watchdog/master (3b8d058cfe6a hwmon: (sch56xx) Drop watchdog driver data reference count callbacks)
Merging iommu/next (d5ffaf1db92c Merge branches 'iommu/fixes', 's390', 'arm/renesas', 'arm/msm', 'arm/shmobile', 'arm/smmu' and 'x86/amd' into next)
Merging dwmw2-iommu/master (0bdec95ce52d iommu/vt-d: Fix rwxp flags in SVM device fault callback)
Merging vfio/next (03a76b60f8ba vfio: Include No-IOMMU mode)
Merging jc_docs/docs-next (9daacf51b428 Documentation/kernel-parameters: update KMG units)
Merging trivial/for-next (bcf4299e6215 floppy: make local variable non-static)
Merging audit/next (09eccd1da92b audit: always enable syscall auditing when supported and audit is enabled)
CONFLICT (content): Merge conflict in kernel/audit.c
Merging devicetree/devicetree/next (48a9b733e644 of/irq: Rename "intc_desc" to "of_intc_desc" to fix OF on sh)
Merging dt-rh/for-next (fcd71d9cc6e3 of: fix declaration of of_io_request_and_map)
Merging mailbox/mailbox-for-next (bfbcfa770b1c mailbox: constify mbox_chan_ops structure)
Merging spi/for-next (990be9f9c955 Merge remote-tracking branches 'spi/topic/sh-msiof', 'spi/topic/spidev', 'spi/topic/sun4i' and 'spi/topic/topcliff-pch' into spi-next)
Merging tip/auto-latest (f29c2e03f0b3 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/h8300/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-exynos/Kconfig
Merging clockevents/clockevents/next (1ddca16cc5b3 clocksource/drivers/h8300: Use ioread / iowrite)
CONFLICT (content): Merge conflict in drivers/clocksource/h8300_timer16.c
Merging edac/linux_next (12f0721c5a70 sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell)
Merging edac-amd/for-next (07cd6bf5f382 MAINTAINERS: Fix EDAC repo URLs format)
Merging irqchip/irqchip/for-next (f290917dc209 Merge branch 'irqchip/sunxi' into irqchip/for-next)
Merging tiny/tiny/next (f114040e3ea6 Linux 3.18-rc1)
Merging ftrace/for-next (05a724bd44a6 tracing: Fix comment to use tracing_on over tracing_enable)
Merging rcu/rcu/next (b162be2dc2a2 documentation: Fix control dependency and identical stores)
Merging kvm/linux-next (da3f7ca3e856 Merge tag 'kvm-s390-next-4.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvm-arm/next (c7da6fa43cb1 arm/arm64: KVM: Detect vGIC presence at runtime)
Merging kvm-ppc/kvm-ppc-next (c63517c2e381 KVM: PPC: Book3S: correct width in XER handling)
Merging kvm-ppc-paulus/kvm-ppc-next (696066f875bc KVM: PPC: Increase memslots to 512)
Merging kvms390/next (32e6b236d269 KVM: s390: consider system MHA for guest storage)
Merging xen-tip/linux-next (b9fcbcf55dc4 xen/time: use READ_ONCE)
Merging percpu/for-next (18fc93fd6412 percpu: remove PERCPU_ENOUGH_ROOM which is stale definition)
Merging workqueues/for-next (82607adcf9cd workqueue: implement lockup detector)
Merging drivers-x86/for-next (615e897884d5 asus-wmi: drop to_platform_driver macro)
Merging chrome-platform/for-next (ebaf31c46cce platform/chrome: Fix i2c-designware adapter name)
Merging regmap/for-next (027617b52003 Merge remote-tracking branches 'regmap/topic/64bit', 'regmap/topic/mmio' and 'regmap/topic/rbtree' into regmap-next)
Merging hsi/for-next (403c5c065081 HSI: Remove struct hsi_client private fields from kernel-doc)
Merging leds/for-next (376886d44f4c leds: bcm6358: remove unneeded busy status check)
Merging ipmi/for-next (4193fcd31624 ipmi: Remove unnecessary pci_disable_device.)
Merging driver-core/driver-core-next (4ef7675344d6 Linux 4.4-rc6)
Merging tty/tty-next (462a1196a578 Merge 4.4-rc6 into tty-next)
Merging usb/usb-next (daf273350d96 Merge tag 'phy-for-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy into usb-next)
Merging usb-gadget/next (5072cfc40a80 usb: dwc3: of-simple: fix build warning on !PM)
Merging usb-serial/usb-next (6ff9d2761b86 USB: mxu11x0: drop redundant function name from error messages)
Merging usb-chipidea-next/ci-for-usb-next (d0c40d9fda12 usb: chipidea: debug: use list_for_each_entry)
Merging staging/staging-next (02c34ccc1d2d Merge tag 'iio-for-4.5c' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging char-misc/char-misc-next (d7a26beb6fe6 Merge tag 'extcon-next-for-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon into char-misc-next)
Merging extcon/extcon-next (f78bf950aec3 extcon: arizona: Use DAPM mutex helper functions)
Merging cgroup/for-next (f203f9a1d8ad Merge branch 'for-4.5' into for-next)
CONFLICT (content): Merge conflict in kernel/cgroup.c
CONFLICT (content): Merge conflict in init/Kconfig
CONFLICT (content): Merge conflict in include/linux/cgroup_subsys.h
CONFLICT (content): Merge conflict in include/linux/cgroup.h
Merging scsi/for-next (3196a8641050 Merge branch 'fixes' into for-next)
Merging target-updates/for-next (beccdd6ac780 qla2xxx: Check for online flag instead of active reset when transmitting responses)
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/isert/ib_isert.c
CONFLICT (content): Merge conflict in drivers/infiniband/ulp/iser/iser_memory.c
Merging target-merge/for-next-merge (bc0195aad0da Linux 4.2-rc2)
Merging pinctrl/for-next (bda7c4c2b976 pinctrl: qcom: make PMIC drivers bool)
Merging vhost/linux-next (a40c6c366c64 virtio_ring: use __smp_store_mb)
CONFLICT (content): Merge conflict in include/asm-generic/barrier.h
CONFLICT (content): Merge conflict in arch/s390/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/barrier.h
CONFLICT (content): Merge conflict in arch/ia64/include/asm/barrier.h
Merging remoteproc/for-next (7a6271a80cae remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to export alias)
Merging rpmsg/for-next (b1b9891441fa rpmsg: use less buffers when vrings are small)
Merging gpio/for-next (e28ecca6eac4 gpio: fix warning about iterator)
Merging dma-mapping/dma-mapping-next (d770e558e219 Linux 4.2-rc1)
Merging pwm/for-next (6604c6556db9 pwm: Add PWM driver for OMAP using dual-mode timers)
Merging dma-buf/for-next (86ea07ca846a Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging userns/for-next (f2ca379642d7 namei: permit linking with CAP_FOWNER in userns)
Merging ktest/for-next (b953c0d234bc Linux 4.1)
Merging clk/clk-next (82d0f8bc4b57 Merge branch 'clk-bcm2835' into clk-next)
Merging random/dev (7185ad2672a7 crypto: memzero_explicit - make sure to clear out sensitive data)
Merging aio/master (6ff33f3902c3 Linux 4.3-rc1)
Merging llvmlinux/for-next (25d4aee23af2 arm: LLVMLinux: Use global stack register variable for percpu)
Merging kselftest/next (ed2d26d7cbcc tools, testing, add test for intel_pstate driver)
Merging y2038/y2038 (477b8541b31f qla2xxx: Remove use of 'struct timeval')
Merging luto-misc/next (8735f8e16a70 selftests/x86: Add tests for UC_SIGCONTEXT_SS and UC_STRICT_RESTORE_SS)
Merging borntraeger/linux-next (fc7f9754db6c s390/dma: Allow per device dma ops)
Merging livepatching/for-next (5dc5f4089332 Merge branch 'for-4.5/core' into for-next)
CONFLICT (content): Merge conflict in arch/x86/kernel/livepatch.c
Merging coresight/next (d2b29c2f35a2 coresight: Fix a typo in Kconfig)
Merging rtc/rtc-next (cab572b82c4b rtc: fix overflow and incorrect calculation in rtc_time64_to_tm)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (d23a0e707dd6 Merge branch 'for-4.5/pfn' into for-4.5/libnvdimm)
Applying: drm/amdgpu/powerplay: include asm/div64.h for do_div()
Merging akpm-current/current (3bfa11253ece ipc/msg.c: use freezable blocking call)
CONFLICT (content): Merge conflict in net/mac80211/debugfs.c
CONFLICT (content): Merge conflict in net/ipv4/tcp_ipv4.c
CONFLICT (content): Merge conflict in mm/page_alloc.c
CONFLICT (content): Merge conflict in lib/Kconfig.debug
CONFLICT (content): Merge conflict in include/net/sock.h
CONFLICT (content): Merge conflict in include/linux/memblock.h
CONFLICT (content): Merge conflict in fs/block_dev.c
CONFLICT (content): Merge conflict in arch/x86/mm/pgtable.c
CONFLICT (content): Merge conflict in arch/x86/kvm/mmu.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable_64.c
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/nohash/64/pgtable.h
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in Makefile
CONFLICT (content): Merge conflict in Documentation/kernel-parameters.txt
Applying: mm, dax, gpu: merge fix for convert vm_insert_mixed to pfn_t
Applying: mm, dax: convert vmf_insert_pfn_pmd() to pfn_t fix
Applying: fix up for bad merge of arch/powerpc/include/asm/pgtable-ppc64.h: add pmd_[dirty|mkclean] for THP
$ git checkout -b akpm remotes/origin/akpm/master
Applying: include/linux/property.h: fix build issues with gcc-4.4.4
Applying: fs/overlayfs/super.c needs pagemap.h
Applying: fs/adfs/adfs.h: tidy up comments
Applying: iio: core: fix ptr_ret.cocci warnings
Applying: dma-mapping: make the generic coherent dma mmap implementation optional
Applying: arc: convert to dma_map_ops
Applying: arc: dma mapping fixes
Applying: ARC: dma mapping fixes #2
Applying: avr32: convert to dma_map_ops
Applying: blackfin: convert to dma_map_ops
Applying: c6x: convert to dma_map_ops
Applying: C6X: fix build breakage
Applying: c6x: dma mapping fixes
Applying: cris: convert to dma_map_ops
Applying: nios2: convert to dma_map_ops
Applying: nios2: dma mapping fixes
Applying: frv: convert to dma_map_ops
Applying: parisc: convert to dma_map_ops
Applying: mn10300: convert to dma_map_ops
Applying: m68k: convert to dma_map_ops
Applying: metag: convert to dma_map_ops
Applying: sparc: use generic dma_set_mask
Applying: tile: uninline dma_set_mask
Applying: dma-mapping: always provide the dma_map_ops based implementation
Applying: HAVE_DMA_ATTRS: remove leftovers in Kconfig
Applying: dma-mapping: remove <asm-generic/dma-coherent.h>
Applying: dma-mapping: use offset_in_page macro
Applying: memstick: use sector_div instead of do_div
Applying: mm: memcontrol: drop unused @css argument in memcg_init_kmem
Applying: mm: memcontrol: remove double kmem page_counter init
Applying: mm: memcontrol: give the kmem states more descriptive names
Applying: mm: memcontrol: group kmem init and exit functions together
Applying: mm: memcontrol: separate kmem code from legacy tcp accounting code
Applying: mm: memcontrol: move kmem accounting code to CONFIG_MEMCG
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-v2
Applying: mm-memcontrol-move-kmem-accounting-code-to-config_memcg-fix
Applying: mm: memcontrol: account "kmem" consumers in cgroup2 memory controller
Applying: mm: memcontrol: allow to disable kmem accounting for cgroup2
Applying: mm: memcontrol: introduce CONFIG_MEMCG_LEGACY_KMEM
Applying: mm: memcontrol: only manage socket pressure for CONFIG_INET
Applying: net: drop tcp_memcontrol.c
Applying: net-drop-tcp_memcontrolc-fix
Applying: mm: memcontrol: rein in the CONFIG space madness
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix
Applying: mm-memcontrol-reign-in-the-config-space-madness-fix-fix
Applying: mm: memcontrol: flatten struct cg_proto
Applying: mm: memcontrol: clean up alloc, online, offline, free functions
Applying: mm: memcontrol: clean up alloc, online, offline, free functions fix
Applying: memcg: fix SLOB build regression
Applying: mm: memcontrol: charge swap to cgroup2
Applying: mm: vmscan: pass memcg to get_scan_count()
Applying: mm: memcontrol: replace mem_cgroup_lruvec_online with mem_cgroup_online
Applying: swap.h: move memcg related stuff to the end of the file
Applying: mm: vmscan: do not scan anon pages if memcg swap limit is hit
Applying: mm: free swap cache aggressively if memcg swap is full
Applying: Documentation: cgroup: add memory.swap.{current,max} description
Applying: MAINTAINERS: add git URL for APM driver
Applying: MAINTAINERS: add git URL for at91
Applying: MAINTAINERS: add git URL for Rockchip
Applying: MAINTAINERS: add git URL for ARM64
Applying: MAINTAINERS: update git URL for ath6kl
Applying: MAINTAINERS: add git URL for backlight
Applying: MAINTAINERS: add git URL for chrome
Applying: MAINTAINERS: add git URL for cris
Applying: MAINTAINERS: add git URL for cryptodev
Applying: MAINTAINERS: add git URL for devfreq
Applying: MAINTAINERS: update git URL for DLM
Applying: MAINTAINERS: add git URL for eCryptfs
Applying: MAINTAINERS: add git URL for ext4
Applying: MAINTAINERS: add git URL for hwspinlock
Applying: MAINTAINERS: add git URL for integrity
Applying: MAINTAINERS: add git URL for IPVS
Applying: MAINTAINERS: add git URL for nfsd
Applying: MAINTAINERS: add git URL for KVM/s390
Applying: MAINTAINERS: add git URL for kgdb
Applying: MAINTAINERS: add git URL for nvdimm
Applying: MAINTAINERS: add git URL for metag
Applying: MAINTAINERS: add git URL for wireless drivers
Applying: MAINTAINERS: add git URL for devicetree
Applying: MAINTAINERS: update git URL for PCMCIA
Applying: MAINTAINERS: update git URL for pstore
Applying: MAINTAINERS: update git URL for ath10k
Applying: MAINTAINERS: add git URL for hexagon
Applying: MAINTAINERS: add git URL for reset
Applying: MAINTAINERS: add git URL for s390
Applying: MAINTAINERS: fix tree format for SAMSUNG thermal
Applying: MAINTAINERS: add git URL for md
Applying: MAINTAINERS: add git URL for squashfs
Applying: MAINTAINERS: add git URL for swiotlb
Applying: MAINTAINERS: add git URL for xtensa
Applying: MAINTAINERS: fix tree format for TPM
Applying: MAINTAINERS: add git URL for UML
Applying: MAINTAINERS: add git URL for VFIO
Applying: MAINTAINERS: add git URL for vhost
Applying: MAINTAINERS: update git URL for XFS
Applying: pmem: add wb_cache_pmem() to the PMEM API
Applying: pmem-add-wb_cache_pmem-to-the-pmem-api-v6
Applying: dax: support dirty DAX entries in radix tree
Applying: dax-support-dirty-dax-entries-in-radix-tree-v6
Applying: mm: add find_get_entries_tag()
Applying: dax: add support for fsync/sync
Applying: dax-add-support-for-fsync-sync-v6
Applying: ext2: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: ext4: call dax_pfn_mkwrite() for DAX fsync/msync
Applying: xfs: call dax_pfn_mkwrite() for DAX fsync/msync
Merging akpm/master (3fef4fcab55d xfs: call dax_pfn_mkwrite() for DAX fsync/msync)
