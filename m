From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Fri, 25 Mar 2011 10:48:55 -0700
Message-ID: <20110325174855.GR2322@linux.vnet.ibm.com>
References: <AANLkTimg-DVXUOrrRZCggZiaajSJWi=onWUxUrnnGXQB@mail.gmail.com>
 <AANLkTima-bYDkHDfSSAGJFmeRedBQ-VyaAdE7gfhHb3J@mail.gmail.com>
 <20110325155516.GA27484@feather>
 <20110325164236.GP2322@linux.vnet.ibm.com>
 <AANLkTim08Ff==7mY9fuU8tUJrTmEhZ+PrsJSQO5PKOH6@mail.gmail.com>
 <AANLkTi=N6Z0bDg1YXVFkUbv7phM8XvQ5U3=vS6Ej8Af5@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=N6Z0bDg1YXVFkUbv7phM8XvQ5U3=vS6Ej8Af5@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 25, 2011 at 06:40:38PM +0100, Sedat Dilek wrote:
> On Fri, Mar 25, 2011 at 5:51 PM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
> > On Fri, Mar 25, 2011 at 5:42 PM, Paul E. McKenney
> > <paulmck@linux.vnet.ibm.com> wrote:
> >> On Fri, Mar 25, 2011 at 08:55:16AM -0700, Josh Triplett wrote:
> >>> On Fri, Mar 25, 2011 at 02:05:33PM +0100, Sedat Dilek wrote:
> >>> > On Fri, Mar 25, 2011 at 11:16 AM, Sedat Dilek
> >>> > <sedat.dilek@googlemail.com> wrote:
> >>> > > right after I have finished building a new linux-next kernel,=
 booting
> >>> > > into desktop and archiving my build-tree (ext4) as tarball to=
 an
> >>> > > external USB harddisk (partition there is ext3).
> >>> > > ( Yesterday, I have seen similiar call-traces in my logs, but=
 it was
> >>> > > hard to reproduce [1]. )
> >>> > > I am unsure from where the problem aroses, if you have a hint=
, let me know.
> >>> > >
> >>> > > Regards,
> >>> > > - Sedat -
> >>> > >
> >>> > > [1] http://lkml.org/lkml/2011/3/24/268
> >>> > >
> >>> > > P.S.: Attached are the dmesg outputs and my kernel-config
> >>> > >
> >>> >
> >>> > I turned off the notebook for about 2hrs to avoid thermal probl=
ems and
> >>> > hoax reports.
> >>> > Jumped into desktop and started an archive job as 1st job while=
 doing daily job.
> >>> > Yeah, it is reproducible.
> >>> [...]
> >>> > [ =A0212.453822] EXT3-fs (sdb5): mounted filesystem with ordere=
d data mode
> >>> > [ =A0273.224044] INFO: rcu_sched_state detected stall on CPU 0 =
(t=3D15000 jiffies)
> >>>
> >>> 15000 jiffies matches this 60-second gap, assuming you use HZ=3D2=
50.
> >>>
> >>> > [ =A0273.224059] sending NMI to all CPUs:
> >>> > [ =A0273.224074] NMI backtrace for cpu 0
> >>> > [ =A0273.224081] Modules linked in: ext3 jbd bnep rfcomm blueto=
oth aes_i586 aes_generic binfmt_misc ppdev acpi_cpufreq mperf cpufreq_p=
owersave cpufreq_userspace lp cpufreq_stats cpufreq_conservative fuse s=
nd_intel8x0 snd_intel8x0m snd_ac97_codec ac97_bus snd_pcm_oss snd_mixer=
_oss snd_pcm radeon thinkpad_acpi snd_seq_midi pcmcia ttm snd_rawmidi s=
nd_seq_midi_event drm_kms_helper yenta_socket snd_seq pcmcia_rsrc drm p=
cmcia_core joydev snd_timer snd_seq_device snd i2c_algo_bit tpm_tis shp=
chp i2c_i801 tpm nsc_ircc irda snd_page_alloc soundcore pci_hotplug rng=
_core i2c_core tpm_bios psmouse crc_ccitt nvram parport_pc pcspkr parpo=
rt evdev battery video ac processor power_supply serio_raw button arc4 =
ecb ath5k ath mac80211 cfg80211 rfkill autofs4 ext4 mbcache jbd2 crc16 =
dm_mod usbhid hid usb_storage uas sg sd_mod sr_mod crc_t10dif cdrom ata=
_generic ata_piix libata uhci_hcd ehci_hcd usbcore scsi_mod thermal e10=
00 thermal_sys floppy [last unloaded: scsi_wait_scan]
> >>> > [ =A0273.224367]
> >>> > [ =A0273.224377] Pid: 0, comm: swapper Not tainted 2.6.38-next2=
0110325-2-686-iniza #1 IBM 2374SG6/2374SG6
> >>> > [ =A0273.224397] EIP: 0060:[<c11514f0>] EFLAGS: 00000807 CPU: 0
> >>> > [ =A0273.224414] EIP is at delay_tsc+0x16/0x5e
> >>> > [ =A0273.224424] EAX: 00090d42 EBX: 00002710 ECX: c133faf5 EDX:=
 00090d41
> >>> > [ =A0273.224435] ESI: 00000000 EDI: 00090d42 EBP: f5819e9c ESP:=
 f5819e8c
> >>> > [ =A0273.224445] =A0DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 006=
8
> >>> > [ =A0273.224458] Process swapper (pid: 0, ti=3Df5818000 task=3D=
c13e3fa0 task.ti=3Dc13b6000)
> >>> > [ =A0273.224466] Stack:
> >>> > [ =A0273.224472] =A000090d41 00002710 c13ee580 c13ee600 f5819ea=
4 c115149f f5819eac c11514bb
> >>> > [ =A0273.224497] =A0f5819eb8 c1016532 c13ee580 f5819ed4 c1078dc=
1 c134e61e c134e6c2 00000000
> >>> > [ =A0273.224520] =A000003a98 f5c03488 f5819ee8 c1078e36 0000000=
0 00000000 c13e3fa0 f5819ef4
> >>> > [ =A0273.224544] Call Trace:
> >>> > [ =A0273.224559] =A0[<c115149f>] __delay+0x9/0xb
> >>> > [ =A0273.224571] =A0[<c11514bb>] __const_udelay+0x1a/0x1c
> >>> > [ =A0273.224590] =A0[<c1016532>] arch_trigger_all_cpu_backtrace=
+0x50/0x62
> >>> > [ =A0273.224608] =A0[<c1078dc1>] check_cpu_stall+0x58/0xb8
> >>> > [ =A0273.224622] =A0[<c1078e36>] __rcu_pending+0x15/0xc4
> >>> > [ =A0273.224637] =A0[<c10791df>] rcu_check_callbacks+0x6d/0x93
> >>> > [ =A0273.224652] =A0[<c1039c6c>] update_process_times+0x2d/0x58
> >>> > [ =A0273.224666] =A0[<c10509e9>] tick_sched_timer+0x6b/0x9a
> >>> > [ =A0273.224682] =A0[<c1047196>] __run_hrtimer+0x9c/0x111
> >>> > [ =A0273.224694] =A0[<c105097e>] ? tick_sched_timer+0x0/0x9a
> >>> > [ =A0273.224708] =A0[<c1047b38>] hrtimer_interrupt+0xd6/0x1bb
> >>> > [ =A0273.224727] =A0[<c104fca1>] tick_do_broadcast.constprop.4+=
0x38/0x6a
> >>> > [ =A0273.224741] =A0[<c104fd80>] tick_handle_oneshot_broadcast+=
0xad/0xe1
> >>> > [ =A0273.224757] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.224772] =A0[<c1004215>] timer_interrupt+0x15/0x1c
> >>> > [ =A0273.224785] =A0[<c107536d>] handle_irq_event_percpu+0x4e/0=
x164
> >>> > [ =A0273.224799] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.224811] =A0[<c10754b9>] handle_irq_event+0x36/0x51
> >>> > [ =A0273.224824] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.224837] =A0[<c1076d0f>] handle_level_irq+0x4d/0x63
> >>> > [ =A0273.224845] =A0<IRQ>
> >>> > [ =A0273.224857] =A0[<c1003b8d>] ? do_IRQ+0x35/0x80
> >>> > [ =A0273.224871] =A0[<c12ac0f0>] ? common_interrupt+0x30/0x38
> >>> > [ =A0273.224886] =A0[<c10400d8>] ? destroy_worker+0x52/0x6c
> >>> > [ =A0273.224922] =A0[<f87b730f>] ? arch_local_irq_enable+0x5/0x=
b [processor]
> >>> > [ =A0273.224947] =A0[<f87b7ef5>] ? acpi_idle_enter_simple+0x100=
/0x138 [processor]
> >>> > [ =A0273.224964] =A0[<c11ebd92>] ? cpuidle_idle_call+0xc2/0x137
> >>> > [ =A0273.224978] =A0[<c1001da3>] ? cpu_idle+0x89/0xa3
> >>> > [ =A0273.224995] =A0[<c128c26c>] ? rest_init+0x58/0x5a
> >>> > [ =A0273.225008] =A0[<c1418722>] ? start_kernel+0x315/0x31a
> >>> > [ =A0273.225022] =A0[<c14180a2>] ? i386_start_kernel+0xa2/0xaa
> >>> > [ =A0273.225029] Code: e5 e8 d6 ff ff ff 5d c3 55 89 e5 8d 04 8=
0 e8 c9 ff ff ff 5d c3 55 89 e5 57 89 c7 56 53 52 64 8b 35 04 20 47 c1 =
8d 76 00 0f ae e8 <e8> 6b ff ff ff 89 c3 8d 76 00 0f ae e8 e8 5e ff ff =
ff 89 c2 29
> >>> > [ =A0273.225154] Call Trace:
> >>> > [ =A0273.225166] =A0[<c115149f>] __delay+0x9/0xb
> >>> > [ =A0273.225178] =A0[<c11514bb>] __const_udelay+0x1a/0x1c
> >>> > [ =A0273.225192] =A0[<c1016532>] arch_trigger_all_cpu_backtrace=
+0x50/0x62
> >>> > [ =A0273.225207] =A0[<c1078dc1>] check_cpu_stall+0x58/0xb8
> >>> > [ =A0273.225220] =A0[<c1078e36>] __rcu_pending+0x15/0xc4
> >>> > [ =A0273.225234] =A0[<c10791df>] rcu_check_callbacks+0x6d/0x93
> >>> > [ =A0273.225247] =A0[<c1039c6c>] update_process_times+0x2d/0x58
> >>> > [ =A0273.225260] =A0[<c10509e9>] tick_sched_timer+0x6b/0x9a
> >>> > [ =A0273.225274] =A0[<c1047196>] __run_hrtimer+0x9c/0x111
> >>> > [ =A0273.225286] =A0[<c105097e>] ? tick_sched_timer+0x0/0x9a
> >>> > [ =A0273.225300] =A0[<c1047b38>] hrtimer_interrupt+0xd6/0x1bb
> >>> > [ =A0273.225316] =A0[<c104fca1>] tick_do_broadcast.constprop.4+=
0x38/0x6a
> >>> > [ =A0273.225330] =A0[<c104fd80>] tick_handle_oneshot_broadcast+=
0xad/0xe1
> >>> > [ =A0273.225345] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.225358] =A0[<c1004215>] timer_interrupt+0x15/0x1c
> >>> > [ =A0273.225370] =A0[<c107536d>] handle_irq_event_percpu+0x4e/0=
x164
> >>> > [ =A0273.225384] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.225396] =A0[<c10754b9>] handle_irq_event+0x36/0x51
> >>> > [ =A0273.225409] =A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
> >>> > [ =A0273.225421] =A0[<c1076d0f>] handle_level_irq+0x4d/0x63
> >>> > [ =A0273.225429] =A0<IRQ> =A0[<c1003b8d>] ? do_IRQ+0x35/0x80
> >>> > [ =A0273.225450] =A0[<c12ac0f0>] ? common_interrupt+0x30/0x38
> >>> > [ =A0273.225464] =A0[<c10400d8>] ? destroy_worker+0x52/0x6c
> >>> > [ =A0273.225493] =A0[<f87b730f>] ? arch_local_irq_enable+0x5/0x=
b [processor]
> >>> > [ =A0273.225517] =A0[<f87b7ef5>] ? acpi_idle_enter_simple+0x100=
/0x138 [processor]
> >>> > [ =A0273.225532] =A0[<c11ebd92>] ? cpuidle_idle_call+0xc2/0x137
> >>> > [ =A0273.225545] =A0[<c1001da3>] ? cpu_idle+0x89/0xa3
> >>> > [ =A0273.225559] =A0[<c128c26c>] ? rest_init+0x58/0x5a
> >>> > [ =A0273.225571] =A0[<c1418722>] ? start_kernel+0x315/0x31a
> >>> > [ =A0273.225584] =A0[<c14180a2>] ? i386_start_kernel+0xa2/0xaa
> >>>
> >>> Interesting. =A0Looks like RCU detected a stall while the CPU sit=
s in
> >>> cpu_idle. =A0That *shouldn't* happen...
> >>
> >> There have been a few of these things recently that turned out to
> >> be BIOS misconfigurations, though that would not be the first thin=
g
> >> I would suspect if the system had run other versions successfully.
> >> Another possibility is that the CPU spent the full time in interru=
pt.
> >> Get an interrupt from the idle loop, stay in interrupt for 60 seco=
nds,
> >> get an RCU CPU stall warning.
> >>
> >> Or I could have somehow inserted a bug in RCU. =A0But I am not see=
ing
> >> this in my testing.
> >>
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >>
> >
> > The problems started when I first saw CONFIG_RCU_CPU_STALL_TIMEOUT=3D=
60
> > in my configs.
> >
> > This an old IBM T40p notebook with Pentium-M (Banias) UP processor.
> > IIRC I have flashed the latest BIOS available for this notebook.
> >
> > [ =A0 11.786073] thinkpad_acpi: ThinkPad BIOS 1RETDRWW (3.23 ), EC =
1RHT71WW-3.04
> > [ =A0 11.786111] thinkpad_acpi: IBM ThinkPad T40p, model 2374SG6
> >
> > As I am still sitting in the dark, it would be very helpful to know=
 if
> > I can play with HZ or RCU kernel-config parameters.
> > Can I change RCU behaviour from user-space?
> >
> > - Sedat -
> >
> > P.S.: Note to myself: Read Documentation/RCU/stallwarn.txt & check
> > possible values in lib/Kconfig.debug
> >
>=20
> OK, I had a deeper look at the RCU (STALL) kernel-configs.
>=20
> $ grep RCU /boot/config-2.6.38-next20110323-3-686-iniza | grep STALL
> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
>=20
> $ grep RCU /boot/config-2.6.38-next20110324-2-686-iniza | grep STALL
> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
>=20
> $ grep RCU /boot/config-2.6.38-next20110325-2-686-iniza | grep STALL
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60

Yep, you moved from a kernel version that had the stall detected disabl=
ed
by default to one that enables it by default.

But -next has had stall detection enabled by default for a good
long time now.

> With my todays (next-20110325) linux-next kernel I cannot work!
> The yesterday call-traces could be indeed a different issue (I am
> currently testing with the 2 patches from block-tree [1]).
>=20
> Now, I am building a new linux-next kernel with CONFIG_TREE_RCU=3Dy a=
s
> recommended in Documentation/RCU/stallwarn.txt file.

You had CONFIG_TREE_PREEMPT_RCU=3Dy earlier?  Tiny RCU does not have
a stall detector.

							Thanx, Paul

> - Sedat -
>=20
> [1] http://lkml.org/lkml/2011/3/25/326
