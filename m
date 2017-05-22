From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Tree for May 22
Date: Mon, 22 May 2017 16:04:27 +1000
Message-ID: <20170522160427.1679c0dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53749 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751318AbdEVGEa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 02:04:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Changes since 20170519:

The netfilter tree lost its build failure.

The net-next tree gained a build failure so I used the version from
next-20170519.

The selinux tree gained a conflict against Linus' tree and a build
failure for which I applied a fix patch.

The tip tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 2000
 2292 files changed, 77464 insertions(+), 46252 deletions(-)

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
with a ppc64_defconfig for powerpc and an allmodconfig (with
CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, sparc and sparc64 defconfig.

Below is a summary of the state of the merge.

I am currently merging 260 trees (counting Linus' and 40 trees of bug
fix patches pending for the current merge release).

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
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (f3926e4c2a4b Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fixes/master (97da3854c526 Linux 4.11-rc3)
Merging kbuild-current/fixes (05d8cba4a1e8 kbuild: skip install/check of headers right under uapi directories)
Merging arc-current/for-curr (2ea659a9ef48 Linux 4.12-rc1)
Merging arm-current/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging m68k-current/for-linus (f6ab4d59a5fe nubus: Add MVC and VSC video card definitions)
Merging metag-fixes/fixes (b884a190afce metag/usercopy: Add missing fixups)
Merging powerpc-fixes/fixes (e41e53cd4fe3 powerpc/mm: Fix virt_addr_valid() etc. on 64-bit hash)
Merging sparc/master (8b4822de59d5 Merge tag 'md/4.12-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/shli/md)
Merging fscrypt-current/for-stable (42d97eb0ade3 fscrypt: fix renaming and linking special files)
Merging net/master (6d18c732b95c bridge: start hello_timer when enabling KERNEL_STP in br_stp_start)
Merging ipsec/master (a486cd23661c xfrm: fix state migration copy replay sequence numbers)
Merging netfilter/master (6d18c732b95c bridge: start hello_timer when enabling KERNEL_STP in br_stp_start)
Merging ipvs/master (3c5ab3f395d6 ipvs: SNAT packet replies only for NATed connections)
Merging wireless-drivers/master (d77facb88448 brcmfmac: use local iftype avoiding use-after-free of virtual interface)
Merging mac80211/master (5667c86acf02 mac80211: strictly check mesh address extension mode)
Merging sound-current/for-linus (fa16b69f1299 ALSA: hda - No loopback on ALC299 codec)
Merging pci-current/for-linus (2ea659a9ef48 Linux 4.12-rc1)
Merging driver-core.current/driver-core-linus (56f410cf45a1 Merge tag 'trace-v4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging tty.current/tty-linus (da4c279942b0 serial: enable serdev support)
Merging usb.current/usb-linus (b51e0ceed1f9 Merge tag 'usb-serial-4.12-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus)
Merging usb-gadget-fixes/fixes (a351e9b9fc24 Linux 4.11)
Merging usb-serial-fixes/usb-linus (8d7a10dd3239 USB: serial: qcserial: add more Lenovo EM74xx device IDs)
Merging usb-chipidea-fixes/ci-for-usb-stable (aa1f058d7d92 usb: chipidea: udc: fix NULL pointer dereference if udc_start failed)
Merging phy/fixes (a380b78b799b phy: qualcomm: phy-qcom-qmp: fix application of sizeof to pointer)
Merging staging.current/staging-linus (56f410cf45a1 Merge tag 'trace-v4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging char-misc.current/char-misc-linus (56f410cf45a1 Merge tag 'trace-v4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging input-current/for-linus (3af9256150b3 Input: cros_ec_keyb - remove extraneous 'const')
Merging crypto-current/master (9933e113c2e8 crypto: skcipher - Add missing API setkey checks)
Merging ide/master (acfead32f3f9 ide: don't call memcpy with the same source and destination)
Merging vfio-fixes/for-linus (39da7c509acf Linux 4.11-rc6)
Merging kselftest-fixes/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging backlight-fixes/for-backlight-fixes (68feaca0b13e backlight: pwm: Handle EPROBE_DEFER while requesting the PWM)
Merging ftrace-fixes/for-next-urgent (6224beb12e19 tracing: Have branch tracer use recursive field of task struct)
Merging nand-fixes/nand/fixes (f7b7ad45f59d mtd: nand: make nand_ooblayout_lp_hamming_ops static)
Merging spi-nor-fixes/spi-nor/fixes (2ea659a9ef48 Linux 4.12-rc1)
Merging mfd-fixes/for-mfd-fixes (b2376407f989 mfd: cros-ec: Fix host command buffer size)
Merging v4l-dvb-fixes/fixes (dd8245f445f5 [media] atomisp: don't treat warnings as errors)
Merging drm-intel-fixes/for-linux-next-fixes (46cd902f6d9a drm/i915: set initialised only when init_context callback is NULL)
Merging drm-misc-fixes/for-linux-next-fixes (6bee9b78a7a5 drm/atmel-hlcdc: Fix output initialization)
Merging kbuild/for-next (547b9255cde5 Merge branch 'fixes' into for-next)
Merging asm-generic/master (de4be6b87b6b asm-generic: page.h: fix comment typo)
CONFLICT (content): Merge conflict in include/asm-generic/percpu.h
Merging arc/for-next (d5adbfcd5f7b Linux 4.10-rc7)
Merging arm/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging arm-perf/for-next/perf (2ea659a9ef48 Linux 4.12-rc1)
Merging arm-soc/for-next (7e54f6b647c1 Merge branch 'fixes' into for-next)
Merging alpine/alpine/for-next (a1144b2b1ec4 ARM: dts: alpine: add valid clock-frequency values)
Merging amlogic/for-next (15e858ec0c62 Merge branch 'v4.13/defconfig' into tmp/aml-rebuild)
Merging aspeed/for-next (4944e5dbb215 Merge branches 'dt-for-v4.12' and 'defconfig-for-v4.12' into for-next)
Merging at91/at91-next (7d9fb74454a7 Merge branch 'at91-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux into at91-next)
Merging bcm2835/for-next (c156bb73ae01 Merge branch anholt/bcm2835-dt-next into for-next)
Merging berlin/berlin/for-next (5153351425c9 Merge branch 'berlin/dt' into berlin/for-next)
Merging cortex-m/for-next (f719a0d6a854 ARM: efm32: switch to vendor,device compatible strings)
Merging imx-mxs/for-next (e13cc349a3c7 Merge branch 'imx/defconfig' into for-next)
Merging keystone/next (4495c08e8472 Linux 4.11-rc2)
Merging mvebu/for-next (4cfb1f480e35 Merge branch 'mvebu/dt64' into mvebu/for-next)
Merging omap/for-next (d0ee30d59b38 Merge branch 'omap-for-v4.13/dt' into for-next)
Merging omap-pending/for-next (c20c8f750d9f ARM: OMAP2+: hwmod: fix _idle() hwmod state sanity check sequence)
Merging qcom/for-next (9f514b0f9cf3 Merge branch 'drivers-for-4.12' into all-for-4.12)
Merging renesas/next (e7b4b5069b25 Merge branches 'arm64-dt-for-v4.13' and 'dt-for-v4.13' into next)
Merging rockchip/for-next (0b83ca4910ac Merge branch 'v4.13-armsoc/dts32' into for-next)
Merging rpi/for-rpi-next (bc0195aad0da Linux 4.2-rc2)
Merging samsung/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging samsung-krzk/for-next (64eaeaf32bc5 Merge branch 'next/defconfig' into for-next)
Merging sunxi/sunxi/for-next (f593eb7db856 Merge branches 'sunxi/dt-for-4.13' and 'sunxi/clk-for-4.13' into sunxi/for-next)
Merging tegra/for-next (29d04525797f Merge branch for-4.12/clk into for-next)
Merging arm64/for-next/core (0c2cf6d9487c arm64: Silence first allocation with CONFIG_ARM64_MODULE_PLTS=y)
Merging clk/clk-next (2ea659a9ef48 Linux 4.12-rc1)
Merging c6x/for-linux-next (ca3060d39ae7 c6x: Use generic clkdev.h header)
Merging cris/for-next (8f50f2a1b46a cris: No need to append -O2 and $(LINUXINCLUDE))
Merging h8300/h8300-next (58c57526711f h8300: Add missing include file to asm/io.h)
Merging hexagon/linux-next (02cc2ccfe771 Revert "Hexagon: fix signal.c compile error")
Merging ia64/next (fbb0e4da96f4 ia64: salinfo: use a waitqueue instead a sema down/up combo)
Merging m68k/for-next (1072734a2c63 m68k/defconfig: Update defconfigs for v4.12-rc1)
Merging m68knommu/for-next (2ea659a9ef48 Linux 4.12-rc1)
Merging metag/for-next (e3cd7f013bac metag/mm: Drop pointless increment)
Merging microblaze/next (3400606d8ffd microblaze: Add new fpga families)
Merging mips/mips-for-linux-next (50540f5b5dcc Merge branch '4.12-fixes' into mips-for-linux-next)
Merging nios2/for-next (e118c3fec9c0 nios2: remove custom early console implementation)
Merging openrisc/for-next (a4d442663580 openrisc: head: Init r0 to 0 on start)
Merging parisc-hd/for-next (5aa2aabff1ce parisc: Stop CPUs via PAT firmware before system halt or reboot.)
Merging powerpc/next (2ea659a9ef48 Linux 4.12-rc1)
Merging fsl/next (61baf1555512 powerpc/64e: Don't place the stack beyond TASK_SIZE)
Merging mpc5xxx/next (39e69f55f857 powerpc: Introduce the use of the managed version of kzalloc)
Merging s390/features (e9ae6b6e7a19 s390/hvc_iucv: fix broken Kconfig select statement)
Merging sparc-next/master (94836ecf1e73 Merge tag 'nfsd-4.11-2' of git://linux-nfs.org/~bfields/linux)
Merging sh/for-next (e61c10e468a4 sh: add device tree source for J2 FPGA on Mimas v2 board)
Merging tile/master (0af0bc38175d mm, tile: drop arch_{add,remove}_memory)
Merging uml/linux-next (ce4586063f1a um: Add missing NR_CPUS include)
Merging unicore32/unicore32 (bc27113620ca unicore32-oldabi: add oldabi syscall interface)
Merging xtensa/xtensa-for-next (6fad04b7585d Merge branch 'xtensa-fixes' into xtensa-for-next)
Merging fscrypt/master (6f9d696f016f fscrypt: correct collision claim for digested names)
Merging befs/for-next (0bbabf98dd76 befs: make export work with cold dcache)
Merging btrfs/next (8b8b08cbfb90 Btrfs: fix delalloc accounting after copy_from_user faults)
Merging btrfs-kdave/for-next (4b1370b4e34a Merge branch 'for-next-next-v4.13-20170517' into for-next-20170517)
Merging ceph/master (8a2d2b096d53 libceph: fix error handling in process_one_ticket())
Merging cifs/for-next (a95cfad947d5 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging configfs/for-next (e16769d4bca6 fs: configfs: don't return anything from drop_link)
Merging ecryptfs/next (be280b25c328 ecryptfs: remove private bin2hex implementation)
Merging ext3/for_next (07f7e3135e58 Merge branch 'fsnotify' into for_next)
Merging ext4/dev (17f423b51607 jbd2: cleanup write flags handling from jbd2_write_superblock())
Merging f2fs/dev (2d3e4866dea9 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm)
Merging freevxfs/for-next (bf1bb4b460c8 freevxfs: update Kconfig information)
Merging fscache/fscache (d52bd54db8be Merge branch 'akpm' (patches from Andrew))
Merging fuse/for-next (0b6e9ea041e6 fuse: Add support for pid namespaces)
Merging jfs/jfs-next (684666e51585 jfs: atomically read inode size)
Merging nfs/linux-next (76b2a303384e pNFS/flexfiles: Always attempt to call layoutstats when flexfiles is enabled)
Merging nfsd/nfsd-next (b26b78cb7260 nfsd: Fix up the "supattr_exclcreat" attributes)
Merging orangefs/for-next (2f713b5c7d2a orangefs: count directory pieces correctly)
Merging overlayfs/overlayfs-next (ee1d6d37b6b8 ovl: mark upper dir with type origin entries "impure")
Merging v9fs/for-next (a333e4bf2556 fs/9p: use fscache mutex rather than spinlock)
Merging ubifs/linux-next (7bccd12d27b7 ubi: Add debugfs file for tracking PEB state)
Merging xfs/for-next (161f55efba5d xfs: fix use-after-free in xfs_finish_page_writeback)
Merging file-locks/linux-next (b0756441db3a fs/locks: don't mess with the address limit in compat_fcntl64)
Merging vfs/for-next (919bb328b020 Merge branch 'work.misc' into for-next)
Merging vfs-jk/vfs (030b533c4fd4 fs: Avoid premature clearing of capabilities)
Merging vfs-miklos/next (0eb8af4916a5 vfs: use helper for calling f_op->fsync())
Merging printk/for-next (719f6a7040f1 printk: Use the main logbuf in NMI when logbuf_lock is available)
Merging pci/next (2ea659a9ef48 Linux 4.12-rc1)
Merging pstore/for-next/pstore (4f91d84f51b4 efi-pstore: Fix write/erase id tracking)
Merging hid/for-next (edb2a51c6fbb Merge branch 'for-4.12/upstream-fixes' into for-next)
Merging i2c/i2c/for-next (9d6408433019 i2c: designware: don't infer timings described by ACPI from clock rate)
Merging jdelvare-hwmon/master (08d27eb20666 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging dmi/master (b3398adc0da6 firmware: dmi_scan: Look for SMBIOS 3 entry point first)
Merging hwmon-staging/hwmon-next (08f2a3db3e50 hwmon: (adt7475) temperature smoothing)
Merging jc_docs/docs-next (6312811be26f Merge remote-tracking branch 'mauro-exp/docbook3' into death-to-docbook)
Merging v4l-dvb/master (36bcba973ad4 [media] mtk_vcodec_dec: return error at mtk_vdec_pic_info_update())
Merging v4l-dvb-next/master (791a9a666d1a Merge tag 'kbuild-uapi-v4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging fbdev/fbdev-for-next (34bf129a7f06 fbdev: sti: don't select CONFIG_VT)
Merging pm/linux-next (c549d04f0535 Merge branch 'pm-tools' into linux-next)
Merging idle/next (306899f94804 x86 tsc: Add the Intel Denverton Processor to native_calibrate_tsc())
Merging thermal/next (cb15c81a0c1c Merge branch 'thermal-soc' into next)
Merging thermal-soc/next (19fd1783c24e Merge branch 'work-linus' into work-next)
Merging ieee1394/for-next (72f3c27aa646 firewire: net: max MTU off by one)
Merging dlm/next (591c3beb86c4 dlm: Delete an unnecessary variable initialisation in dlm_ls_start())
Merging swiotlb/linux-next (69369f52d28a swiotlb-xen: implement xen_swiotlb_get_sgtable callback)
Merging net-next/master (4ab688793e08 tcp: fix tcp_probe_timer() for TCP_USER_TIMEOUT)
$ git reset --hard HEAD^
Merging next-20170519 version of net-next
Merging ipsec-next/master (67df58a3e553 ah: use crypto_memneq to check the ICV)
Merging netfilter-next/master (9ad098037db5 liquidio: use pcie_flr instead of duplicating it)
Merging ipvs-next/master (fb90e8dedb46 ipvs: change comparison on sync_refresh_period)
Merging wireless-drivers-next/master (fb53905cf2c3 Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (5bd425aa2b9c MAINTAINERS: update my mail address)
Merging mac80211-next/master (3b23782f7d00 mac80211: mark as action frame when parsing IEs of CSA action frames)
Merging rdma/for-next (67cf3623e097 rxe: expose num_possible_cpus() cnum_comp_vectors)
Merging gfs2/for-next (3ef2bc099d1c Merge tag 'devicetree-for-4.12' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging mtd/master (2ea659a9ef48 Linux 4.12-rc1)
Merging l2-mtd/master (c316cf670491 Merge 'v4.12-rc1' into MTD)
Merging nand/nand/next (6076fd1e9d87 mtd: nand: gpmi: Kill gpmi_nand_exit())
Merging spi-nor/spi-nor/next (05d090f00203 mtd: spi-nor: Potential oops on error path in quad_enable())
Merging crypto/master (cce2ea8d90fe crypto: aesni - add generic gcm(aes))
Merging drm/drm-next (e98c58e55f68 Merge tag 'drm-misc-next-2017-05-16' of git://anongit.freedesktop.org/git/drm-misc into drm-next)
Merging drm-panel/drm/panel/for-next (e4bac408b084 drm/panel: simple: Add support for Winstar WF35LTIACD)
Merging drm-intel/for-linux-next (010980814518 drm/i915: Check for allocation failure)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_dp_mst.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_shrinker.c
Merging drm-tegra/drm/tegra/for-next (b0d36daa0ab5 gpu: host1x: Fix host1x driver shutdown)
Merging drm-misc/for-linux-next (141518d23493 drm/pl111: Add a debugfs node to dump our registers.)
Merging drm-exynos/exynos-drm/for-next (7d1e04231461 Merge tag 'usercopy-v4.8-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging drm-msm/msm-next (98db803f6413 msm/drm: gpu: Dynamically locate the clocks from the device tree)
Merging hdlcd/for-upstream/hdlcd (1de3cd4fb49f drm: hdlcd: Fix the calculation of the scanout start address)
Merging mali-dp/for-upstream/mali-dp (763656d30b3d drm: mali-dp: use div_u64 for expensive 64-bit divisions)
Merging sunxi-drm/sunxi-drm/for-next (e6010f19497a drm/sun4i: tcon: add support for V3s TCON)
Merging imx-drm/imx-drm/next (b8f0951de854 gpu: ipu-v3: prg: remove counter load enable)
Merging etnaviv/etnaviv/next (d79fd1ccf2cd drm/etnaviv: implement cooling support for new GPU cores)
Merging kspp/for-next/kspp (62111ab351b8 Merge branch 'for-next/gcc-plugin-infrastructure' into for-next/kspp)
Merging kconfig/for-next (5bcba792bb30 localmodconfig: Fix whitespace repeat count after "tristate")
Merging regmap/for-next (bbbed1951704 Merge remote-tracking branches 'regmap/topic/doc' and 'regmap/topic/rbtree' into regmap-next)
Merging sound/for-next (665170f73101 ALSA: mixart: constify snd_kcontrol_new structures)
Merging sound-asoc/for-next (10f9d34d9501 Merge remote-tracking branches 'asoc/topic/sh', 'asoc/topic/stm32' and 'asoc/topic/tlv320dac31xx' into asoc-next)
Merging modules/modules-next (2ea659a9ef48 Linux 4.12-rc1)
Merging input/next (d899520b0431 Input: elantech - force relative mode on a certain module)
Merging block/for-next (0789bd7bdb5b Merge branch 'for-linus' into for-next)
Merging lightnvm/for-next (1c6286f26301 lightnvm: fix some error code in pblk-init.c)
Merging device-mapper/for-next (41ff9f8cc74f dm bio prison: use rb_entry() rather than container_of())
Merging pcmcia/master (e8e68fd86d22 pcmcia: do not break rsrc_nonstatic when handling anonymous cards)
Merging mmc/next (9c11a7cb3d17 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (7a6653fca500 kdb: Fix handling of kallsyms_symbol_next() return value)
Merging md/for-next (582e67954ef1 md-cluster: fix potential lock issue in add_new_disk)
Merging mfd/for-mfd-next (ab6241ae07c3 input: touchscreen: mxs-lradc: || vs && typos)
Merging backlight/for-backlight-next (e739c5bb20be backlight: Add support for Arctic Sand LED backlight driver chips)
Merging battery/for-next (b5910897b2ee power_supply: Add Apple Brick ID power supply type)
Merging omap_dss2/for-next (c456a2f30de5 video: smscufx: remove unused variable)
Merging regulator/for-next (6d92c391a0aa Merge remote-tracking branches 'regulator/topic/lp8755', 'regulator/topic/max8997' and 'regulator/topic/settle' into regulator-next)
Merging security/next (99c55fb18fc4 security: Grammar s/allocates/allocated/)
Merging integrity/next (3dd0c8d06511 ima: provide ">" and "<" operators for fowner/uid/euid rules.)
Merging keys/keys-next (e36484b5ac31 crypto : asymmetric_keys : verify_pefile:zero memory content before freeing)
Merging selinux/next (b76dd295790d selinux: Add a cache for quicker retreival of PKey SIDs)
CONFLICT (content): Merge conflict in include/rdma/ib_verbs.h
Applying: IB/core: fix up for create_qp label changes
Merging tpmdd/next (da4cee99ca6d tpm_tis: Consolidate the platform and acpi probe flow)
Merging watchdog/master (00078cff73db Merge branch 'watchdog-next' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging)
CONFLICT (content): Merge conflict in drivers/watchdog/sama5d4_wdt.c
CONFLICT (content): Merge conflict in drivers/watchdog/iTCO_wdt.c
Merging iommu/next (63cbe752d43e Merge branches 'iommu/fixes', 'arm/rockchip', 'arm/renesas', 'arm/core' and 'x86/vt-d' into next)
Merging dwmw2-iommu/master (910170442944 iommu/vt-d: Fix PASID table allocation)
Merging vfio/next (7cb671e7a34d vfio/type1: Reduce repetitive calls in vfio_pin_pages_remote())
Merging trivial/for-next (6fbc8798d946 tty: fix comment for __tty_alloc_driver())
Merging audit/next (48d0e023af97 audit: fix the RCU locking for the auditd_connection structure)
Merging devicetree/for-next (49e67dd17649 of: fdt: add missing allocation-failure check)
Merging mailbox/mailbox-for-next (cb710ab1d8a2 mailbox: handle empty message in tx_tick)
Merging spi/for-next (9c2ff0b50363 Merge remote-tracking branches 'spi/topic/imx' and 'spi/topic/spidev' into spi-next)
Merging tip/auto-latest (217dc52c43da Merge branch 'smp/hotplug')
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpufeature.h
Merging clockevents/clockevents/next (6f9c89000c3f Merge tag 'arch-timer-errata' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into clockevents/4.12)
Merging edac/linux_next (345fb0a9a634 Merge tag 'edac_for_4.11' of git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp)
Merging edac-amd/for-next (f8d5549df25e EDAC, ghes: Do not enable it by default)
Merging irqchip/irqchip/for-next (c1ae3cfa0e89 Linux 4.11-rc1)
Merging ftrace/for-next (a33d7d94eed9 tracing: Make sure RCU is watching before calling a stack trace)
Merging rcu/rcu/next (d73ec7f9d137 rcu: Use timer as backstop for NOCB deferred wakeups)
Merging kvm/linux-next (36c344f3f1ff Merge tag 'kvm-arm-for-v4.12-round2' of git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (a2b19e6e2d4b KVM: arm/arm64: vgic-its: Cleanup after failed ITT restore)
Merging kvm-mips/next (dc44abd6aad2 KVM: MIPS/Emulate: Properly implement TLBR for T&E)
Merging kvm-ppc/kvm-ppc-next (76d837a4c0f9 KVM: PPC: Book3S PR: Don't include SPAPR TCE code on non-pseries platforms)
Merging kvms390/next (a2bdbb2c7e70 KVM: s390: ioctls to get and set guest storage attributes)
Merging xen-tip/linux-next (c71e6d804c88 xen: make xen_flush_tlb_all() static)
Merging percpu/for-next (1328710b8ec3 mark most percpu globals as __ro_after_init)
Merging workqueues/for-next (bacb71fc9187 Merge branch 'for-4.12' into for-next)
Merging drivers-x86/for-next (23ccd0363c9b platform/x86: topstar-laptop: Add new device id)
Merging chrome-platform/for-next (31b764171cb5 Revert "platform/chrome: chromeos_laptop: Add Leon Touch")
Merging hsi/for-next (3026050179a3 HSI: ssi_protocol: double free in ssip_pn_xmit())
Merging leds/for-next (7678da8ee6de leds: Delete obsolete Versatile driver)
Merging ipmi/for-next (bf10ff69dd6e ipmi_ssif: remove redundant null check on array client->adapter->name)
Merging driver-core/driver-core-next (56f410cf45a1 Merge tag 'trace-v4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging usb/usb-next (5fcf93795e6b USB: ene_usb6250: turn off the Removable flag)
Merging usb-gadget/next (2868b2513aa7 Merge tag 'linux-kselftest-4.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest)
Merging usb-serial/usb-next (2ea659a9ef48 Linux 4.12-rc1)
Merging usb-chipidea-next/ci-for-usb-next (c4a0bbbdb7f6 usb: chipidea: properly handle host or gadget initialization failure)
Merging phy-next/next (2ea659a9ef48 Linux 4.12-rc1)
Merging tty/tty-next (d653c43aefed serial: xilinx_uartps: Fix the error path)
Merging char-misc/char-misc-next (34cfb106d1f8 misc: sram-exec: Use aligned fncpy instead of memcpy)
Merging extcon/extcon-next (2ea659a9ef48 Linux 4.12-rc1)
Merging staging/staging-next (0687090acf0d staging: greybus: mark PM functions as __maybe_unused)
Merging mux/for-next (a351e9b9fc24 Linux 4.11)
Merging slave-dma/next (1a35454b7589 Merge branch 'topic/bcm' into next)
Merging cgroup/for-next (0948307b3a5d Merge branch 'for-4.12' into for-next)
Merging scsi/for-next (6d2a299d9f10 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (31b583e7cf4d scsi: storvsc: remove unnecessary channel inbound lock)
Merging target-updates/for-next (984a9d4c40be Revert "target: Fix VERIFY and WRITE VERIFY command parsing")
Merging target-merge/for-next-merge (2994a7518317 cxgb4: update Kconfig and Makefile)
Merging target-bva/for-next (a351e9b9fc24 Linux 4.11)
Merging libata/for-next (f79e7febd5cd Merge branch 'for-4.13' into for-next)
Merging binfmt_misc/for-next (4af75df6a410 binfmt_misc: add F option description to documentation)
Merging vhost/linux-next (c8b0d7290657 s390/virtio: change maintainership)
Merging rpmsg/for-next (1224d580d353 Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (b86c86aa9805 gpio: f7188x: Add a missing break)
Merging pinctrl/for-next (1aa2faf52f76 pinctrl: mediatek: Add missing pinctrl bindings for mt7623)
Merging pinctrl-samsung/for-next (7ddaa43ee9fd pinctrl: samsung: Remove unneeded (void *) casts in of_match_table)
Merging dma-mapping/dma-mapping-next (1001354ca341 Linux 4.9-rc1)
Merging pwm/for-next (97512ceafaac Merge branch 'for-4.12/drivers' into for-next)
Merging dma-buf/for-next (194cad44c4e1 dma-buf/sync_file: improve Kconfig description for Sync Files)
CONFLICT (content): Merge conflict in drivers/dma-buf/Kconfig
Merging userns/for-next (02ca8ae14673 mnt: Make propagate_umount less slow for overlapping mount propagation trees)
Merging ktest/for-next (f7c6401ff84a ktest: Make sure wait_for_input does honor the timeout)
Merging random/dev (db61ffe3a71c random: move random_min_urandom_seed into CONFIG_SYSCTL ifdef block)
Merging aio/master (b562e44f507e Linux 4.5)
Merging kselftest/next (2ea659a9ef48 Linux 4.12-rc1)
Merging y2038/y2038 (69973b830859 Linux 4.9)
Merging luto-misc/next (2dcd0af568b0 Linux 4.6)
Merging borntraeger/linux-next (e76d21c40bd6 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net)
Merging livepatching/for-next (608822c0f7af Merge branch 'for-4.12/upstream' into for-next)
Merging coresight/next (196a00385bb8 coresight: etb10: Fix a typo in a comment line)
Merging rtc/rtc-next (2ea659a9ef48 Linux 4.12-rc1)
Merging hwspinlock/for-next (bd5717a4632c hwspinlock: qcom: Correct msb in regmap_field)
Merging nvdimm/libnvdimm-for-next (f5705aa8cfed dax, xfs, ext4: compile out iomap-dax paths in the FS_DAX=n case)
Merging dax-misc/dax-misc (4d9a2c874667 dax: Remove i_mmap_lock protection)
Merging idr/idr-4.11 (f0f3f2d0a3e0 radix tree test suite: Specify -m32 in LDFLAGS too)
Merging akpm-current/current (5910c3d7118b include/linux/sem.h: correctly document sem_ctime)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: sparc64: NG4 memset 32 bits overflow
Applying: powerpc/sequoia: fix NAND partitions not to overlap
Applying: lib/crc-ccitt: add CCITT-FALSE CRC16 variant
Merging akpm/master (d7f522135231 lib/crc-ccitt: add CCITT-FALSE CRC16 variant)
