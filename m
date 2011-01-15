From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c + autofs4)
Date: Sat, 15 Jan 2011 08:39:48 +0100
Message-ID: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:48999 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986Ab1AOHjt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2011 02:39:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Sat, Jan 15, 2011 at 3:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Reminder: do not add any v2.6.39 material to your linux-next included
> trees until after v2.6.38-rc1 is released.
>
> Changes since 20110114:
>

Just reporting as I see this Call Trace in my dmesg, not sure which of
the trees is causing it.

- Sedat -

[    5.324728] ------------[ cut here ]------------
[    5.324779] WARNING: at
/home/sd/src/linux-2.6/linux-2.6.37/debian/build/source_i386_none/fs/dcache.c:1360
d_set_d_op+0x27/0x8f()
[    5.324830] Hardware name: 2374SG6
[    5.324863] Modules linked in: autofs4 ext4 mbcache jbd2 crc16
dm_mod usbhid hid uas usb_storage sg sd_mod sr_mod cdrom crc_t10dif
ata_generic ata_piix libata uhci_hcd ehci_hcd usbcore scsi_mod thermal
e1000 thermal_sys floppy nls_base [last unloaded: scsi_wait_scan]
[    5.325555] Pid: 1, comm: systemd Not tainted
2.6.37-next20110115.dileks.1-686-iniza #1
[    5.325602] Call Trace:
[    5.325641]  [<c1031327>] ? warn_slowpath_common+0x65/0x7a
[    5.325679]  [<c10d45a1>] ? d_set_d_op+0x27/0x8f
[    5.325716]  [<c103134b>] ? warn_slowpath_null+0xf/0x13
[    5.325753]  [<c10d45a1>] ? d_set_d_op+0x27/0x8f
[    5.325794]  [<f86dc5ff>] ? autofs4_fill_super+0x1a5/0x292 [autofs4]
[    5.325834]  [<c10c8d70>] ? sget+0x131/0x142
[    5.325870]  [<c10c8dbb>] ? mount_nodev+0x3a/0x62
[    5.325908]  [<f86dc000>] ? autofs_mount+0x0/0x14 [autofs4]
[    5.325946]  [<f86dc010>] ? autofs_mount+0x10/0x14 [autofs4]
[    5.325984]  [<f86dc45a>] ? autofs4_fill_super+0x0/0x292 [autofs4]
[    5.326023]  [<c10c8a83>] ? vfs_kern_mount+0x99/0x193
[    5.326060]  [<c10c8bbe>] ? do_kern_mount+0x2f/0xb0
[    5.326097]  [<c10db5bb>] ? do_mount+0x1ab/0x1d1
[    5.326134]  [<c10db67f>] ? sys_mount+0x61/0x8f
[    5.326173]  [<c1002fdf>] ? sysenter_do_call+0x12/0x28
[    5.326209] ---[ end trace 425b18696c1ee13e ]---

- EOT -
