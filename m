From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 11:33:31 -0800
Message-ID: <20150205193331.GN5370@linux.vnet.ibm.com>
References: <20150205015144.GT5370@linux.vnet.ibm.com>
 <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
 <54D3186F.7030500@sr71.net>
 <20150205130343.6ac0eda9@gandalf.local.home>
 <20150205130802.289a8be0@gandalf.local.home>
 <54D3B253.3050000@sr71.net>
 <20150205183412.GI5370@linux.vnet.ibm.com>
 <54D3B7F5.9070209@sr71.net>
 <20150205184537.GJ5370@linux.vnet.ibm.com>
 <CA+icZUX_fi-O3kXymLCPfJ8Sx0yG=m5=pWzJDJpu-iHTyjM78Q@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUX_fi-O3kXymLCPfJ8Sx0yG=m5=pWzJDJpu-iHTyjM78Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Dave Hansen <dave@sr71.net>, Steven Rostedt <rostedt@goodmis.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 05, 2015 at 08:25:21PM +0100, Sedat Dilek wrote:
> On Thu, Feb 5, 2015 at 7:45 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Thu, Feb 05, 2015 at 10:35:33AM -0800, Dave Hansen wrote:
> >> On 02/05/2015 10:34 AM, Paul E. McKenney wrote:
> >> >> >                               Did I actually need to be
> >> >> > onlining/offlining CPUs to hit the splat that Sedat was reporting?
> >> > Yep, you do need to offline at least one CPU to hit that splat.
> >>
> >> Heh, do we need a debugging mode that will randomly offline/online CPUs? :)
> >
> > For that, kernel/rcu/rcutorture.c and kernel/locking/locktorture.c
> > are your friends.  ;-)
> >
> > The problem is that I only run RCU-relevant combinations of Kconfigs,
> > which means that I missed the ones that Sedat used to find this problem.
> > So I guess it is a good thing that others run -next testing.
> >
> 
> [ Revived by a voltaren resinat pill... ]
> 
> I reverted "x86/mm: Omit switch_mm() tracing for offline CPUs"
> ...and...
> applied "tlb: Don't do trace_tlb_flush() on offline CPUs"
> ...in my build-dir.
> ( I did not build from scratch but re-invoking make "updated" the
> files touched by Steven's patch, see attached build-log. )
> 
> Unfortunately, the call-trace remains when doing an offlining of cpu1.
> ( It's good to see it's reproducible. )
> 
> root# echo 0 > /sys/devices/system/cpu/cpu1/online
> 
> [  121.652796] intel_pstate CPU 1 exiting
> [  121.666272]
> [  121.666274] ===============================
> [  121.666274] [ INFO: suspicious RCU usage. ]
> [  121.666277] 3.19.0-rc7-next-20150204.7-iniza-small #4 Not tainted
> [  121.666278] -------------------------------
> [  121.666280] include/trace/events/tlb.h:37 suspicious
> rcu_dereference_check() usage!
> [  121.666281]
> [  121.666281] other info that might help us debug this:
> [  121.666281]
> [  121.666282]
> [  121.666282] RCU used illegally from offline CPU!
> [  121.666282] rcu_scheduler_active = 1, debug_locks = 0
> [  121.666283] no locks held by swapper/1/0.
> [  121.666284]
> [  121.666284] stack backtrace:
> [  121.666287] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 3.19.0-rc7-next-20150204.7-iniza-small #4
> [  121.666288] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
> 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
> [  121.666293]  0000000000000001 ffff88011a44fe18 ffffffff817e39cd
> 0000000000000011
> [  121.666296]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6af7
> ffff8800d3dfaac0
> [  121.666299]  0000000000000001 ffffffff81d32ce0 0000000000000005
> ffff88011a44fe78
> [  121.666300] Call Trace:
> [  121.666308]  [<ffffffff817e39cd>] dump_stack+0x4c/0x65
> [  121.666313]  [<ffffffff810d6af7>] lockdep_rcu_suspicious+0xe7/0x120
> [  121.666318]  [<ffffffff810b73f9>] idle_task_exit+0x1c9/0x260
> [  121.666322]  [<ffffffff81054c4e>] play_dead_common+0xe/0x50
> [  121.666325]  [<ffffffff81054ca5>] native_play_dead+0x15/0x140
> [  121.666330]  [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
> [  121.666333]  [<ffffffff810cdb4e>] cpu_startup_entry+0x37e/0x580
> [  121.666336]  [<ffffffff81053e20>] start_secondary+0x140/0x150
> [  121.666744] smpboot: CPU 1 is now offline
> 
> >From rcu point this is now safe?
> But another area (linux-pm?) is still affected?
> I will try to test "vanilla" pm-next if the problem exists with
> intel_pstate as suggested by Rafael.
> Hmmm, not sure how I can get the pm-next code which went into
> next-20150204 as linux-pm.git#linux-next was feeded with new stuff.

At this point, I am starting to think in terms of moving the new
CPU_DYING_IDLE notification later in the offline sequence.  This will
take me a bit to get set up correctly, but I hope to have a patch
some time tomorrow (Friday), Pacific time.

							Thanx, Paul

> - Sedat -

>   CHK     include/config/kernel.release
> make KBUILD_SRC=
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CC      arch/x86/mm/init.o
>   CC      arch/x86/mm/init_64.o
>   CC      mm/mmu_context.o
>   CC      kernel/fork.o
>   CC      arch/x86/kernel/process_64.o
>   CC      mm/mmap.o
>   CC      arch/x86/kernel/ldt.o
>   CC      arch/x86/mm/tlb.o
>   CC      arch/x86/kernel/setup.o
>   LD      arch/x86/mm/built-in.o
>   CC      kernel/exit.o
>   LD      mm/built-in.o
>   CC      arch/x86/xen/mmu.o
>   CC      arch/x86/kernel/apic/ipi.o
>   CC      fs/exec.o
>   LD      arch/x86/kernel/apic/built-in.o
>   CC      kernel/power/snapshot.o
>   CC      arch/x86/kernel/cpu/common.o
>   LD      kernel/power/built-in.o
>   LD      arch/x86/xen/built-in.o
>   CC      kernel/sched/core.o
>   LD      arch/x86/kernel/cpu/built-in.o
>   CC      arch/x86/kernel/smp.o
>   CC      arch/x86/kernel/machine_kexec_64.o
>   LD      arch/x86/kernel/built-in.o
>   LD      arch/x86/built-in.o
>   LD      kernel/sched/built-in.o
>   CC      kernel/module.o
>   CC      fs/compat.o
>   CHK     kernel/config_data.h
>   LD      kernel/built-in.o
>   CC      fs/coredump.o
>   LD      fs/built-in.o
>   LINK    vmlinux
>   LD      vmlinux.o
>   MODPOST vmlinux.o
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   KSYM    .tmp_kallsyms1.o
>   KSYM    .tmp_kallsyms2.o
>   LD      vmlinux
>   SORTEX  vmlinux
>   SYSMAP  System.map
>   Building modules, stage 2.
>   VOFFSET arch/x86/boot/voffset.h
>   CC      arch/x86/boot/version.o
>   MODPOST 115 modules
>   OBJCOPY arch/x86/boot/compressed/vmlinux.bin
>   XZKERN  arch/x86/boot/compressed/vmlinux.bin.xz
>   MKPIGGY arch/x86/boot/compressed/piggy.S
>   AS      arch/x86/boot/compressed/piggy.o
>   LD      arch/x86/boot/compressed/vmlinux
>   ZOFFSET arch/x86/boot/zoffset.h
>   OBJCOPY arch/x86/boot/vmlinux.bin
>   AS      arch/x86/boot/header.o
>   LD      arch/x86/boot/setup.elf
>   OBJCOPY arch/x86/boot/setup.bin
>   BUILD   arch/x86/boot/bzImage
> Setup is 17036 bytes (padded to 17408 bytes).
> System is 4437 kB
> CRC 20f24227
> Kernel: arch/x86/boot/bzImage is ready  (#4)
>   BUILDDEB
> make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
>   INSTALL crypto/arc4.ko
>   INSTALL crypto/ccm.ko
>   INSTALL crypto/cmac.ko
>   INSTALL crypto/ctr.ko
>   INSTALL crypto/lz4.ko
>   INSTALL crypto/lz4hc.ko
>   INSTALL crypto/seqiv.ko
>   INSTALL crypto/xor.ko
>   INSTALL drivers/acpi/video.ko
>   INSTALL drivers/bluetooth/btusb.ko
>   INSTALL drivers/char/lp.ko
>   INSTALL drivers/char/ppdev.ko
>   INSTALL drivers/gpu/drm/drm.ko
>   INSTALL drivers/gpu/drm/drm_kms_helper.ko
>   INSTALL drivers/gpu/drm/i915/i915.ko
>   INSTALL drivers/hid/hid-generic.ko
>   INSTALL drivers/hid/hid.ko
>   INSTALL drivers/hid/usbhid/usbhid.ko
>   INSTALL drivers/hid/usbhid/usbkbd.ko
>   INSTALL drivers/hid/usbhid/usbmouse.ko
>   INSTALL drivers/i2c/algos/i2c-algo-bit.ko
>   INSTALL drivers/i2c/i2c-mux.ko
>   INSTALL drivers/input/joydev.ko
>   INSTALL drivers/input/mouse/psmouse.ko
>   INSTALL drivers/input/serio/serio_raw.ko
>   INSTALL drivers/macintosh/mac_hid.ko
>   INSTALL drivers/media/dvb-core/dvb-core.ko
>   INSTALL drivers/media/i2c/ir-kbd-i2c.ko
>   INSTALL drivers/media/rc/rc-core.ko
>   INSTALL drivers/media/tuners/mc44s803.ko
>   INSTALL drivers/media/tuners/mt20xx.ko
>   INSTALL drivers/media/tuners/tda18271.ko
>   INSTALL drivers/media/tuners/tda827x.ko
>   INSTALL drivers/media/tuners/tda8290.ko
>   INSTALL drivers/media/tuners/tda9887.ko
>   INSTALL drivers/media/tuners/tea5761.ko
>   INSTALL drivers/media/tuners/tea5767.ko
>   INSTALL drivers/media/tuners/tuner-simple.ko
>   INSTALL drivers/media/tuners/tuner-types.ko
>   INSTALL drivers/media/tuners/tuner-xc2028.ko
>   INSTALL drivers/media/tuners/xc4000.ko
>   INSTALL drivers/media/tuners/xc5000.ko
>   INSTALL drivers/media/usb/uvc/uvcvideo.ko
>   INSTALL drivers/media/v4l2-core/v4l2-common.ko
>   INSTALL drivers/media/v4l2-core/v4l2-dv-timings.ko
>   INSTALL drivers/media/v4l2-core/videobuf2-core.ko
>   INSTALL drivers/media/v4l2-core/videobuf2-memops.ko
>   INSTALL drivers/media/v4l2-core/videobuf2-vmalloc.ko
>   INSTALL drivers/media/v4l2-core/videodev.ko
>   INSTALL drivers/mfd/lpc_ich.ko
>   INSTALL drivers/mmc/card/mmc_block.ko
>   INSTALL drivers/mmc/host/sdhci.ko
>   INSTALL drivers/net/ethernet/realtek/r8169.ko
>   INSTALL drivers/net/mii.ko
>   INSTALL drivers/net/ppp/bsd_comp.ko
>   INSTALL drivers/net/ppp/ppp_async.ko
>   INSTALL drivers/net/ppp/ppp_deflate.ko
>   INSTALL drivers/net/usb/cdc_ether.ko
>   INSTALL drivers/net/usb/usbnet.ko
>   INSTALL drivers/net/wireless/iwlwifi/dvm/iwldvm.ko
>   INSTALL drivers/net/wireless/iwlwifi/iwlwifi.ko
>   INSTALL drivers/parport/parport.ko
>   INSTALL drivers/parport/parport_pc.ko
>   INSTALL drivers/platform/x86/intel-rst.ko
>   INSTALL drivers/platform/x86/samsung-laptop.ko
>   INSTALL drivers/platform/x86/wmi.ko
>   INSTALL drivers/usb/class/usblp.ko
>   INSTALL drivers/usb/serial/option.ko
>   INSTALL drivers/usb/serial/usb_wwan.ko
>   INSTALL drivers/usb/serial/usbserial.ko
>   INSTALL drivers/usb/storage/usb-storage.ko
>   INSTALL drivers/xen/tmem.ko
>   INSTALL drivers/xen/xen-privcmd.ko
>   INSTALL fs/binfmt_misc.ko
>   INSTALL fs/btrfs/btrfs.ko
>   INSTALL fs/isofs/isofs.ko
>   INSTALL fs/nls/nls_iso8859-1.ko
>   INSTALL fs/ntfs/ntfs.ko
>   INSTALL fs/overlayfs/overlay.ko
>   INSTALL fs/squashfs/squashfs.ko
>   INSTALL fs/udf/udf.ko
>   INSTALL fs/xfs/xfs.ko
>   INSTALL kernel/configs.ko
>   INSTALL lib/crc-ccitt.ko
>   INSTALL lib/crc-itu-t.ko
>   INSTALL lib/libcrc32c.ko
>   INSTALL lib/lz4/lz4_compress.ko
>   INSTALL lib/lz4/lz4hc_compress.ko
>   INSTALL lib/raid6/raid6_pq.ko
>   INSTALL net/bluetooth/bluetooth.ko
>   INSTALL net/bluetooth/bnep/bnep.ko
>   INSTALL net/bluetooth/rfcomm/rfcomm.ko
>   INSTALL net/mac80211/mac80211.ko
>   INSTALL net/sched/sch_codel.ko
>   INSTALL net/sched/sch_fq_codel.ko
>   INSTALL net/sched/sch_htb.ko
>   INSTALL net/wireless/cfg80211.ko
>   INSTALL sound/core/seq/snd-seq-device.ko
>   INSTALL sound/core/seq/snd-seq-midi-event.ko
>   INSTALL sound/core/seq/snd-seq-midi.ko
>   INSTALL sound/core/seq/snd-seq-virmidi.ko
>   INSTALL sound/core/seq/snd-seq.ko
>   INSTALL sound/core/snd-hwdep.ko
>   INSTALL sound/core/snd-pcm.ko
>   INSTALL sound/core/snd-rawmidi.ko
>   INSTALL sound/core/snd-timer.ko
>   INSTALL sound/core/snd.ko
>   INSTALL sound/drivers/snd-virmidi.ko
>   INSTALL sound/pci/hda/snd-hda-codec-generic.ko
>   INSTALL sound/pci/hda/snd-hda-codec-hdmi.ko
>   INSTALL sound/pci/hda/snd-hda-codec-realtek.ko
>   INSTALL sound/pci/hda/snd-hda-codec.ko
>   INSTALL sound/pci/hda/snd-hda-controller.ko
>   INSTALL sound/pci/hda/snd-hda-intel.ko
>   INSTALL sound/soundcore.ko
>   DEPMOD  3.19.0-rc7-next-20150204.7-iniza-small
> make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
>   CHK     include/generated/uapi/linux/version.h
> make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
>   CHK     include/generated/uapi/linux/version.h
>   INSTALL debian/headertmp/usr/include/asm-generic/ (35 files)
>   INSTALL debian/headertmp/usr/include/drm/ (18 files)
>   INSTALL debian/headertmp/usr/include/linux/android/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/byteorder/ (2 files)
>   INSTALL debian/headertmp/usr/include/linux/caif/ (2 files)
>   INSTALL debian/headertmp/usr/include/linux/can/ (5 files)
>   INSTALL debian/headertmp/usr/include/linux/dvb/ (8 files)
>   INSTALL debian/headertmp/usr/include/linux/hdlc/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/hsi/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/isdn/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/mmc/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/netfilter/ipset/ (4 files)
>   INSTALL debian/headertmp/usr/include/linux/netfilter/ (85 files)
>   INSTALL debian/headertmp/usr/include/linux/netfilter_arp/ (2 files)
>   INSTALL debian/headertmp/usr/include/linux/netfilter_bridge/ (17 files)
>   INSTALL debian/headertmp/usr/include/linux/netfilter_ipv4/ (9 files)
>   INSTALL debian/headertmp/usr/include/linux/netfilter_ipv6/ (12 files)
>   INSTALL debian/headertmp/usr/include/linux/nfsd/ (5 files)
>   INSTALL debian/headertmp/usr/include/linux/raid/ (2 files)
>   INSTALL debian/headertmp/usr/include/linux/spi/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/sunrpc/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/tc_act/ (10 files)
>   INSTALL debian/headertmp/usr/include/linux/tc_ematch/ (4 files)
>   INSTALL debian/headertmp/usr/include/linux/usb/ (11 files)
>   INSTALL debian/headertmp/usr/include/linux/wimax/ (1 file)
>   INSTALL debian/headertmp/usr/include/linux/ (412 files)
>   INSTALL debian/headertmp/usr/include/misc/ (1 file)
>   INSTALL debian/headertmp/usr/include/mtd/ (5 files)
>   INSTALL debian/headertmp/usr/include/rdma/ (6 files)
>   INSTALL debian/headertmp/usr/include/scsi/fc/ (4 files)
>   INSTALL debian/headertmp/usr/include/scsi/ (3 files)
>   INSTALL debian/headertmp/usr/include/sound/ (11 files)
>   INSTALL debian/headertmp/usr/include/video/ (3 files)
>   INSTALL debian/headertmp/usr/include/xen/ (4 files)
>   INSTALL debian/headertmp/usr/include/uapi/ (0 file)
>   INSTALL debian/headertmp/usr/include/asm/ (65 files)
> dpkg-deb: building package `linux-headers-3.19.0-rc7-next-20150204.7-iniza-small' in `../linux-headers-3.19.0-rc7-next-20150204.7-iniza-small_3.19.0~rc7~next-20150204.7~precise+dileks1_amd64.deb'.
> dpkg-deb: building package `linux-libc-dev' in `../linux-libc-dev_3.19.0~rc7~next-20150204.7~precise+dileks1_amd64.deb'.
> dpkg-deb: building package `linux-image-3.19.0-rc7-next-20150204.7-iniza-small' in `../linux-image-3.19.0-rc7-next-20150204.7-iniza-small_3.19.0~rc7~next-20150204.7~precise+dileks1_amd64.deb'.
