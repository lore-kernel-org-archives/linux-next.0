From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 25 (Call trace: RCU|workqueues|block|VFS|ext4
 related?)
Date: Fri, 25 Mar 2011 17:25:56 +0100
Message-ID: <AANLkTinLsS5kN+MfFzsBhPXA+xCkHNdvgxMOFD7SWwkb@mail.gmail.com>
References: <AANLkTimg-DVXUOrrRZCggZiaajSJWi=onWUxUrnnGXQB@mail.gmail.com>
	<AANLkTima-bYDkHDfSSAGJFmeRedBQ-VyaAdE7gfhHb3J@mail.gmail.com>
	<20110325155516.GA27484@feather>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:32772 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753998Ab1CYQZ6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Mar 2011 12:25:58 -0400
In-Reply-To: <20110325155516.GA27484@feather>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nick Piggin <npiggin@kernel.dk>

On Fri, Mar 25, 2011 at 4:55 PM, Josh Triplett <josh@joshtriplett.org> =
wrote:
> On Fri, Mar 25, 2011 at 02:05:33PM +0100, Sedat Dilek wrote:
>> On Fri, Mar 25, 2011 at 11:16 AM, Sedat Dilek
>> <sedat.dilek@googlemail.com> wrote:
>> > right after I have finished building a new linux-next kernel, boot=
ing
>> > into desktop and archiving my build-tree (ext4) as tarball to an
>> > external USB harddisk (partition there is ext3).
>> > ( Yesterday, I have seen similiar call-traces in my logs, but it w=
as
>> > hard to reproduce [1]. )
>> > I am unsure from where the problem aroses, if you have a hint, let=
 me know.
>> >
>> > Regards,
>> > - Sedat -
>> >
>> > [1] http://lkml.org/lkml/2011/3/24/268
>> >
>> > P.S.: Attached are the dmesg outputs and my kernel-config
>> >
>>
>> I turned off the notebook for about 2hrs to avoid thermal problems a=
nd
>> hoax reports.
>> Jumped into desktop and started an archive job as 1st job while doin=
g daily job.
>> Yeah, it is reproducible.
> [...]
>> [ =C2=A0212.453822] EXT3-fs (sdb5): mounted filesystem with ordered =
data mode
>> [ =C2=A0273.224044] INFO: rcu_sched_state detected stall on CPU 0 (t=
=3D15000 jiffies)
>
> 15000 jiffies matches this 60-second gap, assuming you use HZ=3D250.
>

Yeah, CONFIG_HZ_250=3Dy.
Change HZ value?

Might be worth to change (new) default CONFIG_RCU_CPU_STALL_TIMEOUT=3D6=
0 ?
Increase/Decrease?
Can I change the value from user-space? If yes, how?
Any other hints?

$ egrep -i '_HZ|_RCU' /boot/config-2.6.38-next20110325-2-686-iniza
CONFIG_TREE_RCU=3Dy
# CONFIG_PREEMPT_RCU is not set
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_FANOUT=3D32
# CONFIG_RCU_FANOUT_EXACT is not set
CONFIG_RCU_FAST_NO_HZ=3Dy
# CONFIG_TREE_RCU_TRACE is not set
CONFIG_NO_HZ=3Dy
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=3Dy
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D250
# CONFIG_SPARSE_RCU_POINTER is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=3D60


>> [ =C2=A0273.224059] sending NMI to all CPUs:
>> [ =C2=A0273.224074] NMI backtrace for cpu 0
>> [ =C2=A0273.224081] Modules linked in: ext3 jbd bnep rfcomm bluetoot=
h aes_i586 aes_generic binfmt_misc ppdev acpi_cpufreq mperf cpufreq_pow=
ersave cpufreq_userspace lp cpufreq_stats cpufreq_conservative fuse snd=
_intel8x0 snd_intel8x0m snd_ac97_codec ac97_bus snd_pcm_oss snd_mixer_o=
ss snd_pcm radeon thinkpad_acpi snd_seq_midi pcmcia ttm snd_rawmidi snd=
_seq_midi_event drm_kms_helper yenta_socket snd_seq pcmcia_rsrc drm pcm=
cia_core joydev snd_timer snd_seq_device snd i2c_algo_bit tpm_tis shpch=
p i2c_i801 tpm nsc_ircc irda snd_page_alloc soundcore pci_hotplug rng_c=
ore i2c_core tpm_bios psmouse crc_ccitt nvram parport_pc pcspkr parport=
 evdev battery video ac processor power_supply serio_raw button arc4 ec=
b ath5k ath mac80211 cfg80211 rfkill autofs4 ext4 mbcache jbd2 crc16 dm=
_mod usbhid hid usb_storage uas sg sd_mod sr_mod crc_t10dif cdrom ata_g=
eneric ata_piix libata uhci_hcd ehci_hcd usbcore scsi_mod thermal e1000=
 thermal_sys floppy [last unloaded: scsi_wait_scan]
>> [ =C2=A0273.224367]
>> [ =C2=A0273.224377] Pid: 0, comm: swapper Not tainted 2.6.38-next201=
10325-2-686-iniza #1 IBM 2374SG6/2374SG6
>> [ =C2=A0273.224397] EIP: 0060:[<c11514f0>] EFLAGS: 00000807 CPU: 0
>> [ =C2=A0273.224414] EIP is at delay_tsc+0x16/0x5e
>> [ =C2=A0273.224424] EAX: 00090d42 EBX: 00002710 ECX: c133faf5 EDX: 0=
0090d41
>> [ =C2=A0273.224435] ESI: 00000000 EDI: 00090d42 EBP: f5819e9c ESP: f=
5819e8c
>> [ =C2=A0273.224445] =C2=A0DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 00=
68
>> [ =C2=A0273.224458] Process swapper (pid: 0, ti=3Df5818000 task=3Dc1=
3e3fa0 task.ti=3Dc13b6000)
>> [ =C2=A0273.224466] Stack:
>> [ =C2=A0273.224472] =C2=A000090d41 00002710 c13ee580 c13ee600 f5819e=
a4 c115149f f5819eac c11514bb
>> [ =C2=A0273.224497] =C2=A0f5819eb8 c1016532 c13ee580 f5819ed4 c1078d=
c1 c134e61e c134e6c2 00000000
>> [ =C2=A0273.224520] =C2=A000003a98 f5c03488 f5819ee8 c1078e36 000000=
00 00000000 c13e3fa0 f5819ef4
>> [ =C2=A0273.224544] Call Trace:
>> [ =C2=A0273.224559] =C2=A0[<c115149f>] __delay+0x9/0xb
>> [ =C2=A0273.224571] =C2=A0[<c11514bb>] __const_udelay+0x1a/0x1c
>> [ =C2=A0273.224590] =C2=A0[<c1016532>] arch_trigger_all_cpu_backtrac=
e+0x50/0x62
>> [ =C2=A0273.224608] =C2=A0[<c1078dc1>] check_cpu_stall+0x58/0xb8
>> [ =C2=A0273.224622] =C2=A0[<c1078e36>] __rcu_pending+0x15/0xc4
>> [ =C2=A0273.224637] =C2=A0[<c10791df>] rcu_check_callbacks+0x6d/0x93
>> [ =C2=A0273.224652] =C2=A0[<c1039c6c>] update_process_times+0x2d/0x5=
8
>> [ =C2=A0273.224666] =C2=A0[<c10509e9>] tick_sched_timer+0x6b/0x9a
>> [ =C2=A0273.224682] =C2=A0[<c1047196>] __run_hrtimer+0x9c/0x111
>> [ =C2=A0273.224694] =C2=A0[<c105097e>] ? tick_sched_timer+0x0/0x9a
>> [ =C2=A0273.224708] =C2=A0[<c1047b38>] hrtimer_interrupt+0xd6/0x1bb
>> [ =C2=A0273.224727] =C2=A0[<c104fca1>] tick_do_broadcast.constprop.4=
+0x38/0x6a
>> [ =C2=A0273.224741] =C2=A0[<c104fd80>] tick_handle_oneshot_broadcast=
+0xad/0xe1
>> [ =C2=A0273.224757] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.224772] =C2=A0[<c1004215>] timer_interrupt+0x15/0x1c
>> [ =C2=A0273.224785] =C2=A0[<c107536d>] handle_irq_event_percpu+0x4e/=
0x164
>> [ =C2=A0273.224799] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.224811] =C2=A0[<c10754b9>] handle_irq_event+0x36/0x51
>> [ =C2=A0273.224824] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.224837] =C2=A0[<c1076d0f>] handle_level_irq+0x4d/0x63
>> [ =C2=A0273.224845] =C2=A0<IRQ>
>> [ =C2=A0273.224857] =C2=A0[<c1003b8d>] ? do_IRQ+0x35/0x80
>> [ =C2=A0273.224871] =C2=A0[<c12ac0f0>] ? common_interrupt+0x30/0x38
>> [ =C2=A0273.224886] =C2=A0[<c10400d8>] ? destroy_worker+0x52/0x6c
>> [ =C2=A0273.224922] =C2=A0[<f87b730f>] ? arch_local_irq_enable+0x5/0=
xb [processor]
>> [ =C2=A0273.224947] =C2=A0[<f87b7ef5>] ? acpi_idle_enter_simple+0x10=
0/0x138 [processor]
>> [ =C2=A0273.224964] =C2=A0[<c11ebd92>] ? cpuidle_idle_call+0xc2/0x13=
7
>> [ =C2=A0273.224978] =C2=A0[<c1001da3>] ? cpu_idle+0x89/0xa3
>> [ =C2=A0273.224995] =C2=A0[<c128c26c>] ? rest_init+0x58/0x5a
>> [ =C2=A0273.225008] =C2=A0[<c1418722>] ? start_kernel+0x315/0x31a
>> [ =C2=A0273.225022] =C2=A0[<c14180a2>] ? i386_start_kernel+0xa2/0xaa
>> [ =C2=A0273.225029] Code: e5 e8 d6 ff ff ff 5d c3 55 89 e5 8d 04 80 =
e8 c9 ff ff ff 5d c3 55 89 e5 57 89 c7 56 53 52 64 8b 35 04 20 47 c1 8d=
 76 00 0f ae e8 <e8> 6b ff ff ff 89 c3 8d 76 00 0f ae e8 e8 5e ff ff ff=
 89 c2 29
>> [ =C2=A0273.225154] Call Trace:
>> [ =C2=A0273.225166] =C2=A0[<c115149f>] __delay+0x9/0xb
>> [ =C2=A0273.225178] =C2=A0[<c11514bb>] __const_udelay+0x1a/0x1c
>> [ =C2=A0273.225192] =C2=A0[<c1016532>] arch_trigger_all_cpu_backtrac=
e+0x50/0x62
>> [ =C2=A0273.225207] =C2=A0[<c1078dc1>] check_cpu_stall+0x58/0xb8
>> [ =C2=A0273.225220] =C2=A0[<c1078e36>] __rcu_pending+0x15/0xc4
>> [ =C2=A0273.225234] =C2=A0[<c10791df>] rcu_check_callbacks+0x6d/0x93
>> [ =C2=A0273.225247] =C2=A0[<c1039c6c>] update_process_times+0x2d/0x5=
8
>> [ =C2=A0273.225260] =C2=A0[<c10509e9>] tick_sched_timer+0x6b/0x9a
>> [ =C2=A0273.225274] =C2=A0[<c1047196>] __run_hrtimer+0x9c/0x111
>> [ =C2=A0273.225286] =C2=A0[<c105097e>] ? tick_sched_timer+0x0/0x9a
>> [ =C2=A0273.225300] =C2=A0[<c1047b38>] hrtimer_interrupt+0xd6/0x1bb
>> [ =C2=A0273.225316] =C2=A0[<c104fca1>] tick_do_broadcast.constprop.4=
+0x38/0x6a
>> [ =C2=A0273.225330] =C2=A0[<c104fd80>] tick_handle_oneshot_broadcast=
+0xad/0xe1
>> [ =C2=A0273.225345] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.225358] =C2=A0[<c1004215>] timer_interrupt+0x15/0x1c
>> [ =C2=A0273.225370] =C2=A0[<c107536d>] handle_irq_event_percpu+0x4e/=
0x164
>> [ =C2=A0273.225384] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.225396] =C2=A0[<c10754b9>] handle_irq_event+0x36/0x51
>> [ =C2=A0273.225409] =C2=A0[<c1076cc2>] ? handle_level_irq+0x0/0x63
>> [ =C2=A0273.225421] =C2=A0[<c1076d0f>] handle_level_irq+0x4d/0x63
>> [ =C2=A0273.225429] =C2=A0<IRQ> =C2=A0[<c1003b8d>] ? do_IRQ+0x35/0x8=
0
>> [ =C2=A0273.225450] =C2=A0[<c12ac0f0>] ? common_interrupt+0x30/0x38
>> [ =C2=A0273.225464] =C2=A0[<c10400d8>] ? destroy_worker+0x52/0x6c
>> [ =C2=A0273.225493] =C2=A0[<f87b730f>] ? arch_local_irq_enable+0x5/0=
xb [processor]
>> [ =C2=A0273.225517] =C2=A0[<f87b7ef5>] ? acpi_idle_enter_simple+0x10=
0/0x138 [processor]
>> [ =C2=A0273.225532] =C2=A0[<c11ebd92>] ? cpuidle_idle_call+0xc2/0x13=
7
>> [ =C2=A0273.225545] =C2=A0[<c1001da3>] ? cpu_idle+0x89/0xa3
>> [ =C2=A0273.225559] =C2=A0[<c128c26c>] ? rest_init+0x58/0x5a
>> [ =C2=A0273.225571] =C2=A0[<c1418722>] ? start_kernel+0x315/0x31a
>> [ =C2=A0273.225584] =C2=A0[<c14180a2>] ? i386_start_kernel+0xa2/0xaa
>
> Interesting. =C2=A0Looks like RCU detected a stall while the CPU sits=
 in
> cpu_idle. =C2=A0That *shouldn't* happen...
>

The 2nd dmesg showed me (as there are no more VFS/EXT4 call traces)
the problem could occur from RCU stuff.

> - Josh Triplett
>

Regards,
- Sedat -
