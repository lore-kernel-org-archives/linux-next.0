From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ related?)
Date: Thu, 14 Apr 2011 12:19:07 +0200
Message-ID: <BANLkTimT9OhHLL5NaPOP30MdiMfmmmEcyQ@mail.gmail.com>
References: <BANLkTikd2MpRPF37R+vCwnb7Lzzd6EiS7A@mail.gmail.com>
	<BANLkTinq=mC9rs5R3U8FPLCp-GgCJris_g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTinq=mC9rs5R3U8FPLCp-GgCJris_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 14, 2011 at 11:16 AM, Sedat Dilek
<sedat.dilek@googlemail.com> wrote:
> [ Adding CC to RCU maintainer (Hi Paul :-)) ]
>
> Helping me for now with (see also Documentation/RCU/stallwarn.txt):
>
> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
> 0
>
> # echo "1" > /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
>
> # cat /sys/module/rcutree/parameters/rcu_cpu_stall_suppress
> 1
>
> - Sedat -
>

That workaround helped till a system-freeze when generating a tarball
from my current kernel-tree.
I switched back to my yesterday's linux-next kernel.

- Sedat -

> On Thu, Apr 14, 2011 at 10:59 AM, Sedat Dilek
> <sedat.dilek@googlemail.com> wrote:
>> On Thu, Apr 14, 2011 at 7:01 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>> Hi all,
>>>
>>> Changes since 20110413:
>>>
>>> Dropped tree: xen
>>>
>>> The gfs2 tree lost its conflict.
>>>
>>> The net tree lost its build failure.
>>>
>>> The wireless tree lost all but one conflict.
>>>
>>> The trivial tree lost its conflict.
>>>
>>> The tip tree gained a conflict against Linus' tree.
>>>
>>> The usb tree gained a conflict against the s5p tree.
>>>
>>> The staging tree lost its conflicts.
>>>
>>> -------------------------------------------------------------------=
---------
>>
>> Just a quick hello and an attached dmesg.
>> Yesterday's linux-next (next-20110413) with same kernel-config was O=
K.
>>
>> ( Also, I have seen a section-mismatch in x86 (IIRC mm) missing
>> __init... but that's another story. )
>>
>> - Sedat -
>>
>> P.S.: diff between today's and yesterday's kernel-config
>>
>> $ diff -uprN /boot/config-2.6.39-rc3-next20110413.2-686-small
>> /boot/config-2.6.39-rc3-next20110414.2-686-small
>> --- /boot/config-2.6.39-rc3-next20110413.2-686-small =C2=A0 =C2=A020=
11-04-13
>> 12:32:09.000000000 +0200
>> +++ /boot/config-2.6.39-rc3-next20110414.2-686-small =C2=A0 =C2=A020=
11-04-14
>> 10:23:25.000000000 +0200
>> @@ -1,7 +1,7 @@
>> =C2=A0#
>> =C2=A0# Automatically generated make config: don't edit
>> =C2=A0# Linux/x86 2.6.39-rc3 Kernel Configuration
>> -# Wed Apr 13 11:55:54 2011
>> +# Thu Apr 14 09:43:03 2011
>> =C2=A0#
>> =C2=A0# CONFIG_64BIT is not set
>> =C2=A0CONFIG_X86_32=3Dy
>> @@ -2602,6 +2602,7 @@ CONFIG_USB_UHCI_HCD=3Dm
>> =C2=A0#
>> =C2=A0# Enable Host or Gadget support to see Inventra options
>> =C2=A0#
>> +# CONFIG_USB_RENESAS_USBHS is not set
>>
>> =C2=A0#
>> =C2=A0# USB Device Class drivers
>>
>
