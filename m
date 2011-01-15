From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c + autofs4)
Date: Sat, 15 Jan 2011 08:46:20 +0100
Message-ID: <AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:36837 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab1AOHqV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2011 02:46:21 -0500
In-Reply-To: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Sat, Jan 15, 2011 at 8:39 AM, Sedat Dilek <sedat.dilek@googlemail.co=
m> wrote:
> On Sat, Jan 15, 2011 at 3:44 AM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> Hi all,
>>
>> Reminder: do not add any v2.6.39 material to your linux-next include=
d
>> trees until after v2.6.38-rc1 is released.
>>
>> Changes since 20110114:
>>
>
> Just reporting as I see this Call Trace in my dmesg, not sure which o=
f
> the trees is causing it.
>
> - Sedat -
>
> [ =C2=A0 =C2=A05.324728] ------------[ cut here ]------------
> [ =C2=A0 =C2=A05.324779] WARNING: at
> /home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/fs/=
dcache.c:1360
> d_set_d_op+0x27/0x8f()
> [ =C2=A0 =C2=A05.324830] Hardware name: 2374SG6
> [ =C2=A0 =C2=A05.324863] Modules linked in: autofs4 ext4 mbcache jbd2=
 crc16
> dm_mod usbhid hid uas usb_storage sg sd_mod sr_mod cdrom crc_t10dif
> ata_generic ata_piix libata uhci_hcd ehci_hcd usbcore scsi_mod therma=
l
> e1000 thermal_sys floppy nls_base [last unloaded: scsi_wait_scan]
> [ =C2=A0 =C2=A05.325555] Pid: 1, comm: systemd Not tainted
> 2.6.37-next20110115.dileks.1-686-iniza #1
> [ =C2=A0 =C2=A05.325602] Call Trace:
> [ =C2=A0 =C2=A05.325641] =C2=A0[<c1031327>] ? warn_slowpath_common+0x=
65/0x7a
> [ =C2=A0 =C2=A05.325679] =C2=A0[<c10d45a1>] ? d_set_d_op+0x27/0x8f
> [ =C2=A0 =C2=A05.325716] =C2=A0[<c103134b>] ? warn_slowpath_null+0xf/=
0x13
> [ =C2=A0 =C2=A05.325753] =C2=A0[<c10d45a1>] ? d_set_d_op+0x27/0x8f
> [ =C2=A0 =C2=A05.325794] =C2=A0[<f86dc5ff>] ? autofs4_fill_super+0x1a=
5/0x292 [autofs4]
> [ =C2=A0 =C2=A05.325834] =C2=A0[<c10c8d70>] ? sget+0x131/0x142
> [ =C2=A0 =C2=A05.325870] =C2=A0[<c10c8dbb>] ? mount_nodev+0x3a/0x62
> [ =C2=A0 =C2=A05.325908] =C2=A0[<f86dc000>] ? autofs_mount+0x0/0x14 [=
autofs4]
> [ =C2=A0 =C2=A05.325946] =C2=A0[<f86dc010>] ? autofs_mount+0x10/0x14 =
[autofs4]
> [ =C2=A0 =C2=A05.325984] =C2=A0[<f86dc45a>] ? autofs4_fill_super+0x0/=
0x292 [autofs4]
> [ =C2=A0 =C2=A05.326023] =C2=A0[<c10c8a83>] ? vfs_kern_mount+0x99/0x1=
93
> [ =C2=A0 =C2=A05.326060] =C2=A0[<c10c8bbe>] ? do_kern_mount+0x2f/0xb0
> [ =C2=A0 =C2=A05.326097] =C2=A0[<c10db5bb>] ? do_mount+0x1ab/0x1d1
> [ =C2=A0 =C2=A05.326134] =C2=A0[<c10db67f>] ? sys_mount+0x61/0x8f
> [ =C2=A0 =C2=A05.326173] =C2=A0[<c1002fdf>] ? sysenter_do_call+0x12/0=
x28
> [ =C2=A0 =C2=A05.326209] ---[ end trace 425b18696c1ee13e ]---
>
> - EOT -
>

Will try the patch from [1] as there was no feedback yet.

- Sedat -

[1] https://lkml.org/lkml/2011/1/12/394
