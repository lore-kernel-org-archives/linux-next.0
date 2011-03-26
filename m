From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Sat, 26 Mar 2011 08:53:16 -0700
Message-ID: <20110326155316.GY2322@linux.vnet.ibm.com>
References: <AANLkTimg-DVXUOrrRZCggZiaajSJWi=onWUxUrnnGXQB@mail.gmail.com>
 <AANLkTima-bYDkHDfSSAGJFmeRedBQ-VyaAdE7gfhHb3J@mail.gmail.com>
 <20110325155516.GA27484@feather>
 <20110325164236.GP2322@linux.vnet.ibm.com>
 <AANLkTim08Ff==7mY9fuU8tUJrTmEhZ+PrsJSQO5PKOH6@mail.gmail.com>
 <AANLkTi=N6Z0bDg1YXVFkUbv7phM8XvQ5U3=vS6Ej8Af5@mail.gmail.com>
 <20110325174855.GR2322@linux.vnet.ibm.com>
 <AANLkTin9HxOTwavbtbsMd0quYsEvhDNmuO5kOpquqoF=@mail.gmail.com>
 <20110326034210.GX2322@linux.vnet.ibm.com>
 <AANLkTimnx27HCKKKv8Le5x7j096VzLgJ70bXM8Rki=9a@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:35851 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888Ab1CZPx1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 Mar 2011 11:53:27 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimnx27HCKKKv8Le5x7j096VzLgJ70bXM8Rki=9a@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Sat, Mar 26, 2011 at 09:11:29AM +0100, Sedat Dilek wrote:
> On Sat, Mar 26, 2011 at 4:42 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Fri, Mar 25, 2011 at 08:42:14PM +0100, Sedat Dilek wrote:
> >> On Fri, Mar 25, 2011 at 6:48 PM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> > On Fri, Mar 25, 2011 at 06:40:38PM +0100, Sedat Dilek wrote:
> >> >> On Fri, Mar 25, 2011 at 5:51 PM, Sedat Dilek <sedat.dilek@googl=
email.com> wrote:
> >> >> > On Fri, Mar 25, 2011 at 5:42 PM, Paul E. McKenney
> >> >> > <paulmck@linux.vnet.ibm.com> wrote:
> >> >> >> On Fri, Mar 25, 2011 at 08:55:16AM -0700, Josh Triplett wrot=
e:
> >> >> >>> On Fri, Mar 25, 2011 at 02:05:33PM +0100, Sedat Dilek wrote=
:
> >> >> >>> > On Fri, Mar 25, 2011 at 11:16 AM, Sedat Dilek
> >> >> >>> > <sedat.dilek@googlemail.com> wrote:
> >> >> >>> > > right after I have finished building a new linux-next k=
ernel, booting
> >> >> >>> > > into desktop and archiving my build-tree (ext4) as tarb=
all to an
> >> >> >>> > > external USB harddisk (partition there is ext3).
> >> >> >>> > > ( Yesterday, I have seen similiar call-traces in my log=
s, but it was
> >> >> >>> > > hard to reproduce [1]. )
> >> >> >>> > > I am unsure from where the problem aroses, if you have =
a hint, let me know.
> >> >> >>> > >
> >> >> >>> > > Regards,
> >> >> >>> > > - Sedat -
> >> >> >>> > >
> >> >> >>> > > [1] http://lkml.org/lkml/2011/3/24/268
> >> >> >>> > >
> >> >> >>> > > P.S.: Attached are the dmesg outputs and my kernel-conf=
ig
> >> >> >>> > >
> >> >> >>> >
> >> >> >>> > I turned off the notebook for about 2hrs to avoid thermal=
 problems and
> >> >> >>> > hoax reports.
> >> >> >>> > Jumped into desktop and started an archive job as 1st job=
 while doing daily job.
> >> >> >>> > Yeah, it is reproducible.
> >> >> >>> [...]
> >> >> >>> > [ =A0212.453822] EXT3-fs (sdb5): mounted filesystem with =
ordered data mode
> >> >> >>> > [ =A0273.224044] INFO: rcu_sched_state detected stall on =
CPU 0 (t=3D15000 jiffies)
> >> >> >>>
> >> >> >>> 15000 jiffies matches this 60-second gap, assuming you use =
HZ=3D250.
> >> >> >>>
> >> >> >>> > [ =A0273.224059] sending NMI to all CPUs:
> >> >> >>> > [ =A0273.224074] NMI backtrace for cpu 0
> >> >> >>> > [ =A0273.224081] Modules linked in: ext3 jbd bnep rfcomm =
bluetooth aes_i586 aes_generic binfmt_misc ppdev acpi_cpufreq mperf cpu=
freq_powersave cpufreq_userspace lp cpufreq_stats cpufreq_conservative =
fuse snd_intel8x0 snd_intel8x0m snd_ac97_codec ac97_bus snd_pcm_oss snd=
_mixer_oss snd_pcm radeon thinkpad_acpi snd_seq_midi pcmcia ttm snd_raw=
midi snd_seq_midi_event drm_kms_helper yenta_socket snd_seq pcmcia_rsrc=
 drm pcmcia_core joydev snd_timer snd_seq_device snd i2c_algo_bit tpm_t=
is shpchp i2c_i801 tpm nsc_ircc irda snd_page_alloc soundcore pci_hotpl=
ug rng_core i2c_core tpm_bios psmouse crc_ccitt nvram parport_pc pcspkr=
 parport evdev battery video ac processor power_supply serio_raw button=
 arc4 ecb ath5k ath mac80211 cfg80211 rfkill autofs4 ext4 mbcache jbd2 =
crc16 dm_mod usbhid hid usb_storage uas sg sd_mod sr_mod crc_t10dif cdr=
om ata_generic ata_piix libata uhci_hcd ehci_hcd usbcore scsi_mod therm=
al e1000 thermal_sys floppy [last unloaded: scsi_wait_scan]
> >> >> >>> > [ =A0273.224367]
> >> >> >>> > [ =A0273.224377] Pid: 0, comm: swapper Not tainted 2.6.38=
-next20110325-2-686-iniza #1 IBM 2374SG6/2374SG6
> >> >> >>> > [ =A0273.224397] EIP: 0060:[<c11514f0>] EFLAGS: 00000807 =
CPU: 0
> >> >> >>> > [ =A0273.224414] EIP is at delay_tsc+0x16/0x5e
> >> >> >>> > [ =A0273.224424] EAX: 00090d42 EBX: 00002710 ECX: c133faf=
5 EDX: 00090d41
> >> >> >>> > [ =A0273.224435] ESI: 00000000 EDI: 00090d42 EBP: f5819e9=
c ESP: f5819e8c
> >> >> >>> > [ =A0273.224445] =A0DS: 007b ES: 007b FS: 00d8 GS: 00e0 S=
S: 0068
> >> >> >>> > [ =A0273.224458] Process swapper (pid: 0, ti=3Df5818000 t=
ask=3Dc13e3fa0 task.ti=3Dc13b6000)
> >> >> >>> > [ =A0273.224466] Stack:
> >> >> >>> > [ =A0273.224472] =A000090d41 00002710 c13ee580 c13ee600 f=
5819ea4 c115149f f5819eac c11514bb
> >> >> >>> > [ =A0273.224497] =A0f5819eb8 c1016532 c13ee580 f5819ed4 c=
1078dc1 c134e61e c134e6c2 00000000
> >> >> >>> > [ =A0273.224520] =A000003a98 f5c03488 f5819ee8 c1078e36 0=
0000000 00000000 c13e3fa0 f5819ef4
> >> >> >>> > [ =A0273.224544] Call Trace:
> >> >> >>> > [ =A0273.224559] =A0[<c115149f>] __delay+0x9/0xb
> >> >> >>> > [ =A0273.224571] =A0[<c11514bb>] __const_udelay+0x1a/0x1c
> >> >> >>> > [ =A0273.224590] =A0[<c1016532>] arch_trigger_all_cpu_bac=
ktrace+0x50/0x62
> >> >> >>> > [ =A0273.224608] =A0[<c1078dc1>] check_cpu_stall+0x58/0xb=
8
> >> >> >>> > [ =A0273.224622] =A0[<c1078e36>] __rcu_pending+0x15/0xc4
> >> >> >>> > [ =A0273.224637] =A0[<c10791df>] rcu_check_callbacks+0x6d=
/0x93
> >> >> >>> > [ =A0273.224652] =A0[<c1039c6c>] update_process_times+0x2=
d/0x58
> >> >> >>> > [ =A0273.224666] =A0[<c10509e9>] tick_sched_timer+0x6b/0x=
9a
> >> >> >>> > [ =A0273.224682] =A0[<c1047196>] __run_hrtimer+0x9c/0x111
> >> >> >>> > [ =A0273.224694] =A0[<c105097e>] ? tick_sched_timer+0x0/0=
x9a
> >> >> >>> > [ =A0273.224708] =A0[<c1047b38>] hrtimer_interrupt+0xd6/0=
x1bb
> >> >> >>> > [ =A0273.224727] =A0[<c104fca1>] tick_do_broadcast.constp=
rop.4+0x38/0x6a
> >> >> >>> > [ =A0273.224741] =A0[<c104fd80>] tick_handle_oneshot_broa=
dcast+0xad/0xe1
> >> >> >>> > [ =A0273.224757] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.224772] =A0[<c1004215>] timer_interrupt+0x15/0x1=
c
> >> >> >>> > [ =A0273.224785] =A0[<c107536d>] handle_irq_event_percpu+=
0x4e/0x164
> >> >> >>> > [ =A0273.224799] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.224811] =A0[<c10754b9>] handle_irq_event+0x36/0x=
51
> >> >> >>> > [ =A0273.224824] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.224837] =A0[<c1076d0f>] handle_level_irq+0x4d/0x=
63
> >> >> >>> > [ =A0273.224845] =A0<IRQ>
> >> >> >>> > [ =A0273.224857] =A0[<c1003b8d>] ? do_IRQ+0x35/0x80
> >> >> >>> > [ =A0273.224871] =A0[<c12ac0f0>] ? common_interrupt+0x30/=
0x38
> >> >> >>> > [ =A0273.224886] =A0[<c10400d8>] ? destroy_worker+0x52/0x=
6c
> >> >> >>> > [ =A0273.224922] =A0[<f87b730f>] ? arch_local_irq_enable+=
0x5/0xb [processor]
> >> >> >>> > [ =A0273.224947] =A0[<f87b7ef5>] ? acpi_idle_enter_simple=
+0x100/0x138 [processor]
> >> >> >>> > [ =A0273.224964] =A0[<c11ebd92>] ? cpuidle_idle_call+0xc2=
/0x137
> >> >> >>> > [ =A0273.224978] =A0[<c1001da3>] ? cpu_idle+0x89/0xa3
> >> >> >>> > [ =A0273.224995] =A0[<c128c26c>] ? rest_init+0x58/0x5a
> >> >> >>> > [ =A0273.225008] =A0[<c1418722>] ? start_kernel+0x315/0x3=
1a
> >> >> >>> > [ =A0273.225022] =A0[<c14180a2>] ? i386_start_kernel+0xa2=
/0xaa
> >> >> >>> > [ =A0273.225029] Code: e5 e8 d6 ff ff ff 5d c3 55 89 e5 8=
d 04 80 e8 c9 ff ff ff 5d c3 55 89 e5 57 89 c7 56 53 52 64 8b 35 04 20 =
47 c1 8d 76 00 0f ae e8 <e8> 6b ff ff ff 89 c3 8d 76 00 0f ae e8 e8 5e =
ff ff ff 89 c2 29
> >> >> >>> > [ =A0273.225154] Call Trace:
> >> >> >>> > [ =A0273.225166] =A0[<c115149f>] __delay+0x9/0xb
> >> >> >>> > [ =A0273.225178] =A0[<c11514bb>] __const_udelay+0x1a/0x1c
> >> >> >>> > [ =A0273.225192] =A0[<c1016532>] arch_trigger_all_cpu_bac=
ktrace+0x50/0x62
> >> >> >>> > [ =A0273.225207] =A0[<c1078dc1>] check_cpu_stall+0x58/0xb=
8
> >> >> >>> > [ =A0273.225220] =A0[<c1078e36>] __rcu_pending+0x15/0xc4
> >> >> >>> > [ =A0273.225234] =A0[<c10791df>] rcu_check_callbacks+0x6d=
/0x93
> >> >> >>> > [ =A0273.225247] =A0[<c1039c6c>] update_process_times+0x2=
d/0x58
> >> >> >>> > [ =A0273.225260] =A0[<c10509e9>] tick_sched_timer+0x6b/0x=
9a
> >> >> >>> > [ =A0273.225274] =A0[<c1047196>] __run_hrtimer+0x9c/0x111
> >> >> >>> > [ =A0273.225286] =A0[<c105097e>] ? tick_sched_timer+0x0/0=
x9a
> >> >> >>> > [ =A0273.225300] =A0[<c1047b38>] hrtimer_interrupt+0xd6/0=
x1bb
> >> >> >>> > [ =A0273.225316] =A0[<c104fca1>] tick_do_broadcast.constp=
rop.4+0x38/0x6a
> >> >> >>> > [ =A0273.225330] =A0[<c104fd80>] tick_handle_oneshot_broa=
dcast+0xad/0xe1
> >> >> >>> > [ =A0273.225345] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.225358] =A0[<c1004215>] timer_interrupt+0x15/0x1=
c
> >> >> >>> > [ =A0273.225370] =A0[<c107536d>] handle_irq_event_percpu+=
0x4e/0x164
> >> >> >>> > [ =A0273.225384] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.225396] =A0[<c10754b9>] handle_irq_event+0x36/0x=
51
> >> >> >>> > [ =A0273.225409] =A0[<c1076cc2>] ? handle_level_irq+0x0/0=
x63
> >> >> >>> > [ =A0273.225421] =A0[<c1076d0f>] handle_level_irq+0x4d/0x=
63
> >> >> >>> > [ =A0273.225429] =A0<IRQ> =A0[<c1003b8d>] ? do_IRQ+0x35/0=
x80
> >> >> >>> > [ =A0273.225450] =A0[<c12ac0f0>] ? common_interrupt+0x30/=
0x38
> >> >> >>> > [ =A0273.225464] =A0[<c10400d8>] ? destroy_worker+0x52/0x=
6c
> >> >> >>> > [ =A0273.225493] =A0[<f87b730f>] ? arch_local_irq_enable+=
0x5/0xb [processor]
> >> >> >>> > [ =A0273.225517] =A0[<f87b7ef5>] ? acpi_idle_enter_simple=
+0x100/0x138 [processor]
> >> >> >>> > [ =A0273.225532] =A0[<c11ebd92>] ? cpuidle_idle_call+0xc2=
/0x137
> >> >> >>> > [ =A0273.225545] =A0[<c1001da3>] ? cpu_idle+0x89/0xa3
> >> >> >>> > [ =A0273.225559] =A0[<c128c26c>] ? rest_init+0x58/0x5a
> >> >> >>> > [ =A0273.225571] =A0[<c1418722>] ? start_kernel+0x315/0x3=
1a
> >> >> >>> > [ =A0273.225584] =A0[<c14180a2>] ? i386_start_kernel+0xa2=
/0xaa
> >> >> >>>
> >> >> >>> Interesting. =A0Looks like RCU detected a stall while the C=
PU sits in
> >> >> >>> cpu_idle. =A0That *shouldn't* happen...
> >> >> >>
> >> >> >> There have been a few of these things recently that turned o=
ut to
> >> >> >> be BIOS misconfigurations, though that would not be the firs=
t thing
> >> >> >> I would suspect if the system had run other versions success=
fully.
> >> >> >> Another possibility is that the CPU spent the full time in i=
nterrupt.
> >> >> >> Get an interrupt from the idle loop, stay in interrupt for 6=
0 seconds,
> >> >> >> get an RCU CPU stall warning.
> >> >> >>
> >> >> >> Or I could have somehow inserted a bug in RCU. =A0But I am n=
ot seeing
> >> >> >> this in my testing.
> >> >> >>
> >> >> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >> >>
> >> >> >
> >> >> > The problems started when I first saw CONFIG_RCU_CPU_STALL_TI=
MEOUT=3D60
> >> >> > in my configs.
> >> >> >
> >> >> > This an old IBM T40p notebook with Pentium-M (Banias) UP proc=
essor.
> >> >> > IIRC I have flashed the latest BIOS available for this notebo=
ok.
> >> >> >
> >> >> > [ =A0 11.786073] thinkpad_acpi: ThinkPad BIOS 1RETDRWW (3.23 =
), EC 1RHT71WW-3.04
> >> >> > [ =A0 11.786111] thinkpad_acpi: IBM ThinkPad T40p, model 2374=
SG6
> >> >> >
> >> >> > As I am still sitting in the dark, it would be very helpful t=
o know if
> >> >> > I can play with HZ or RCU kernel-config parameters.
> >> >> > Can I change RCU behaviour from user-space?
> >> >> >
> >> >> > - Sedat -
> >> >> >
> >> >> > P.S.: Note to myself: Read Documentation/RCU/stallwarn.txt & =
check
> >> >> > possible values in lib/Kconfig.debug
> >> >> >
> >> >>
> >> >> OK, I had a deeper look at the RCU (STALL) kernel-configs.
> >> >>
> >> >> $ grep RCU /boot/config-2.6.38-next20110323-3-686-iniza | grep =
STALL
> >> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> >> >>
> >> >> $ grep RCU /boot/config-2.6.38-next20110324-2-686-iniza | grep =
STALL
> >> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> >> >>
> >> >> $ grep RCU /boot/config-2.6.38-next20110325-2-686-iniza | grep =
STALL
> >> >> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> >> >
> >> > Yep, you moved from a kernel version that had the stall detected=
 disabled
> >> > by default to one that enables it by default.
> >> >
> >> > But -next has had stall detection enabled by default for a good
> >> > long time now.
> >> >
> >> >> With my todays (next-20110325) linux-next kernel I cannot work!
> >> >> The yesterday call-traces could be indeed a different issue (I =
am
> >> >> currently testing with the 2 patches from block-tree [1]).
> >> >>
> >> >> Now, I am building a new linux-next kernel with CONFIG_TREE_RCU=
=3Dy as
> >> >> recommended in Documentation/RCU/stallwarn.txt file.
> >> >
> >> > You had CONFIG_TREE_PREEMPT_RCU=3Dy earlier? =A0Tiny RCU does no=
t have
> >> > a stall detector.
> >> >
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >
> >> >> - Sedat -
> >> >>
> >> >> [1] http://lkml.org/lkml/2011/3/25/326
> >> >
> >>
> >> No, and I have here SMP configured.
> >> Yesterday's RCU and SMP kernel config settings:
> >>
> >> # egrep '_RCU|RCU_|_SMP' /boot/config-2.6.38-next20110324-2-686-in=
iza
> >> CONFIG_X86_32_SMP=3Dy
> >> CONFIG_TREE_RCU=3Dy
> >> # CONFIG_PREEMPT_RCU is not set
> >> # CONFIG_RCU_TRACE is not set
> >> CONFIG_RCU_FANOUT=3D32
> >> # CONFIG_RCU_FANOUT_EXACT is not set
> >> CONFIG_RCU_FAST_NO_HZ=3Dy
> >> # CONFIG_TREE_RCU_TRACE is not set
> >> CONFIG_USE_GENERIC_SMP_HELPERS=3Dy
> >> CONFIG_SMP=3Dy
> >> CONFIG_PM_SLEEP_SMP=3Dy
> >> CONFIG_HAVE_TEXT_POKE_SMP=3Dy
> >> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> >> # CONFIG_SPARSE_RCU_POINTER is not set
> >> # CONFIG_RCU_TORTURE_TEST is not set
> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> >>
> >> IIRC Tiny RCU and SMP bite each other?
> >> So, what do you recommend for an UP processor machine?
> >
> > If you want RCU stall warnings, or if you are building an SMP kerne=
l, it
> > has to be either TREE_RCU or TREE_PREEMPT_RCU. =A0If you are on UP =
and don't
> > care about RCU stall warnings, then either TINY_RCU or TINY_PREEMPT=
_RCU
> > will work fine.
> >
> > I just saw your "Now, I am building a new linux-next kernel with
> > CONFIG_TREE_RCU=3Dy" and thought that you were hinting that you had
> > been running with something other than TREE_RCU.
> >
>=20
> I could suppress RCU STALL warning via sysfs, but the complete system
> is just freaky.
> With doing a simple tar (without compression!) job, I can't use my we=
bbrowser.

Then it does sound like the RCU stall warnings really are locating a
legitimate problem, despite the strange stack trace.

> Selecting TINY_RCU means no CONFIG_SMP!
> (OK, I can hack the Kconfig dependency to change this.)

Yes, TINY_RCU is designed to be UP-only.  Please do not try it in an
SMP kernel.  It will break badly.

> I am thinking of distributions, shall they offer another linux-kernel
> binary especially for UP machines?
> Somehow ridiculuous.

No, they should continue to do what they are currently doing.  TINY_RCU
is primarily for embedded systems.

> I still haven't get some hints to play with the timeouts, so I tried
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D120 (default according to Kconfig entr=
y
> is 60).
> Can this really help here. Why?
> I had a closer look into my logs, there I saw a max jiffies of
> t=3D780510 (six digits!)

Yow!  That is a very long stall.

> /var/log/syslog.1:Mar 25 18:09:15 tbox kernel: [ 3221.112034] INFO:
> rcu_sched_state detected stall on CPU 0 (t=3D780510 jiffies)
> And I asked for the common play between HZ and RCU values in
> kernel-config parameters.
> Currently, I have CONFIG_HZ_250=3Dy.
> Can you enlighten me. please.

CONFIG_HZ_250 is entirely reasonable.

> I have the impression that even I could disable "old"
> CONFIG_RCU_CPU_STALL_DETECTOR value, this stalling here has other
> reasons.

The stall detector used to be disabled by default. =20

You were running something that worked -- what exactly was that?

> BROKEN ACPI? Might be... But what about supporting such systems (with
> quirks or whatever)?

Or a messed up commit.

							Thanx, Paul

> - Sedat -
>=20
> P.S.: I have attached all jiffies values from my today's and
> yesterday's syslogs and my last used kernel-config.
>=20
> >> - Sedat -
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-ke=
rnel" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
> >> Please read the FAQ at =A0http://www.tux.org/lkml/
> >

> /var/log/syslog:Mar 26 00:36:55 tbox kernel: [  589.064031] INFO: rcu=
_sched_state detected stall on CPU 0 (t=3D120030 jiffies)
> /var/log/syslog:Mar 26 00:42:55 tbox kernel: [  949.184032] INFO: rcu=
_sched_state detected stall on CPU 0 (t=3D210060 jiffies)
> /var/log/syslog:Mar 26 00:48:55 tbox kernel: [ 1309.304033] INFO: rcu=
_sched_state detected stall on CPU 0 (t=3D300090 jiffies)
> /var/log/syslog:Mar 26 01:11:09 tbox kernel: [  208.416034] INFO: rcu=
_sched_state detected stall on CPU 0 (t=3D30000 jiffies)
> /var/log/syslog:Mar 26 01:16:30 tbox kernel: [  154.532013] INFO: rcu=
_sched_state detected stall on CPU 0 (t=3D30000 jiffies)
> /var/log/syslog.1:Mar 25 10:57:04 tbox kernel: [  157.340021] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D15000 jiffies)
> /var/log/syslog.1:Mar 25 11:00:04 tbox kernel: [  337.460033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D60030 jiffies)
> /var/log/syslog.1:Mar 25 11:03:05 tbox kernel: [  517.580032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D105060 jiffies)
> /var/log/syslog.1:Mar 25 11:06:05 tbox kernel: [  697.700033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D150090 jiffies)
> /var/log/syslog.1:Mar 25 11:09:05 tbox kernel: [  877.820034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D195120 jiffies)
> /var/log/syslog.1:Mar 25 11:12:05 tbox kernel: [ 1057.940032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D240150 jiffies)
> /var/log/syslog.1:Mar 25 11:15:05 tbox kernel: [ 1238.060029] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D285180 jiffies)
> /var/log/syslog.1:Mar 25 11:18:05 tbox kernel: [ 1418.180033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D330210 jiffies)
> /var/log/syslog.1:Mar 25 11:21:05 tbox kernel: [ 1598.300034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D375240 jiffies)
> /var/log/syslog.1:Mar 25 11:24:05 tbox kernel: [ 1778.420018] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D420270 jiffies)
> /var/log/syslog.1:Mar 25 11:27:06 tbox kernel: [ 1958.540024] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D465300 jiffies)
> /var/log/syslog.1:Mar 25 11:30:06 tbox kernel: [ 2138.660008] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D510330 jiffies)
> /var/log/syslog.1:Mar 25 11:33:06 tbox kernel: [ 2318.780033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D555360 jiffies)
> /var/log/syslog.1:Mar 25 13:54:55 tbox kernel: [  273.224044] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D15000 jiffies)
> /var/log/syslog.1:Mar 25 13:57:56 tbox kernel: [  453.344036] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D60030 jiffies)
> /var/log/syslog.1:Mar 25 14:00:56 tbox kernel: [  633.464043] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D105060 jiffies)
> /var/log/syslog.1:Mar 25 14:03:56 tbox kernel: [  813.584031] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D150090 jiffies)
> /var/log/syslog.1:Mar 25 14:06:56 tbox kernel: [  993.704031] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D195120 jiffies)
> /var/log/syslog.1:Mar 25 14:09:56 tbox kernel: [ 1173.824042] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D240150 jiffies)
> /var/log/syslog.1:Mar 25 14:12:56 tbox kernel: [ 1353.944020] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D285180 jiffies)
> /var/log/syslog.1:Mar 25 14:15:56 tbox kernel: [ 1534.064033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D330210 jiffies)
> /var/log/syslog.1:Mar 25 14:18:56 tbox kernel: [ 1714.184033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D375240 jiffies)
> /var/log/syslog.1:Mar 25 14:21:56 tbox kernel: [ 1894.304038] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D420270 jiffies)
> /var/log/syslog.1:Mar 25 14:24:57 tbox kernel: [ 2074.424033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D465300 jiffies)
> /var/log/syslog.1:Mar 25 17:18:13 tbox kernel: [  159.072032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D15000 jiffies)
> /var/log/syslog.1:Mar 25 17:21:13 tbox kernel: [  339.192034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D60030 jiffies)
> /var/log/syslog.1:Mar 25 17:24:13 tbox kernel: [  519.312032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D105060 jiffies)
> /var/log/syslog.1:Mar 25 17:27:13 tbox kernel: [  699.432033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D150090 jiffies)
> /var/log/syslog.1:Mar 25 17:30:14 tbox kernel: [  879.552031] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D195120 jiffies)
> /var/log/syslog.1:Mar 25 17:33:14 tbox kernel: [ 1059.672035] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D240150 jiffies)
> /var/log/syslog.1:Mar 25 17:36:14 tbox kernel: [ 1239.792026] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D285180 jiffies)
> /var/log/syslog.1:Mar 25 17:39:14 tbox kernel: [ 1419.912036] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D330210 jiffies)
> /var/log/syslog.1:Mar 25 17:42:14 tbox kernel: [ 1600.032035] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D375240 jiffies)
> /var/log/syslog.1:Mar 25 17:45:14 tbox kernel: [ 1780.152033] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D420270 jiffies)
> /var/log/syslog.1:Mar 25 17:48:14 tbox kernel: [ 1960.272034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D465300 jiffies)
> /var/log/syslog.1:Mar 25 17:51:14 tbox kernel: [ 2140.392012] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D510330 jiffies)
> /var/log/syslog.1:Mar 25 17:54:15 tbox kernel: [ 2320.512031] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D555360 jiffies)
> /var/log/syslog.1:Mar 25 17:57:15 tbox kernel: [ 2500.632036] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D600390 jiffies)
> /var/log/syslog.1:Mar 25 18:00:15 tbox kernel: [ 2680.751704] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D645420 jiffies)
> /var/log/syslog.1:Mar 25 18:03:15 tbox kernel: [ 2860.872032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D690450 jiffies)
> /var/log/syslog.1:Mar 25 18:06:15 tbox kernel: [ 3040.992034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D735480 jiffies)
> /var/log/syslog.1:Mar 25 18:09:15 tbox kernel: [ 3221.112034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D780510 jiffies)
> /var/log/syslog.1:Mar 25 20:37:17 tbox kernel: [  162.424039] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D15000 jiffies)
> /var/log/syslog.1:Mar 25 20:40:17 tbox kernel: [  342.544034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D60030 jiffies)
> /var/log/syslog.1:Mar 25 20:43:17 tbox kernel: [  522.664036] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D105060 jiffies)
> /var/log/syslog.1:Mar 25 20:46:17 tbox kernel: [  702.784032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D150090 jiffies)
> /var/log/syslog.1:Mar 25 20:49:17 tbox kernel: [  882.904036] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D195120 jiffies)
> /var/log/syslog.1:Mar 25 20:52:17 tbox kernel: [ 1063.024052] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D240150 jiffies)
> /var/log/syslog.1:Mar 25 20:55:17 tbox kernel: [ 1243.144034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D285180 jiffies)
> /var/log/syslog.1:Mar 25 20:58:17 tbox kernel: [ 1423.264034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D330210 jiffies)
> /var/log/syslog.1:Mar 25 21:01:18 tbox kernel: [ 1603.384032] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D375240 jiffies)
> /var/log/syslog.1:Mar 25 21:04:18 tbox kernel: [ 1783.504018] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D420270 jiffies)
> /var/log/syslog.1:Mar 25 21:07:18 tbox kernel: [ 1963.624034] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D465300 jiffies)
> /var/log/syslog.1:Mar 25 21:10:19 tbox kernel: [ 2143.744028] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D510330 jiffies)
> /var/log/syslog.1:Mar 26 00:30:55 tbox kernel: [  228.944029] INFO: r=
cu_sched_state detected stall on CPU 0 (t=3D30000 jiffies)
