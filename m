From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c + autofs4)
Date: Sat, 15 Jan 2011 12:23:57 +0100
Message-ID: <AANLkTikkEFf4Ubp=joAHfbOF-OVbK3_npgnks494EfRh@mail.gmail.com>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
	<AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
	<20110115075723.GJ19804@ZenIV.linux.org.uk>
	<20110115090702.GK19804@ZenIV.linux.org.uk>
	<AANLkTinPs5toSudLXuu3=a0RoGHUqYvF8YyhdrXgckXY@mail.gmail.com>
	<20110115110848.GL19804@ZenIV.linux.org.uk>
	<AANLkTinXPgfkcLq6LsQ=dsFZgQK5JG4f4GQW92r95J5C@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:52581 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275Ab1AOLX7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2011 06:23:59 -0500
In-Reply-To: <AANLkTinXPgfkcLq6LsQ=dsFZgQK5JG4f4GQW92r95J5C@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Sat, Jan 15, 2011 at 12:16 PM, Sedat Dilek
<sedat.dilek@googlemail.com> wrote:
> On Sat, Jan 15, 2011 at 12:08 PM, Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>> On Sat, Jan 15, 2011 at 12:00:54PM +0100, Sedat Dilek wrote:
>>
>>> > Argh... ??In __do_follow_link() replace
>>> >
>>> > ?? ?? ?? ??if (link->mnt !=3D nd->path.mnt)
>>> > with
>>> > ?? ?? ?? ??if (link->mnt =3D=3D nd->path.mnt)
>>> >
>>> > Mismerge yesterday ;-/ ??I've pushed fix for that in for-next, wi=
ll fold
>>> > shortly. ??As for autofs4 breakage, I've a preliminary fix, testi=
ng it
>>> > now.
>>> >
>>>
>>> Hey, cool and thanks.
>>>
>>> Not sure if you catched them all, I have noticed on my latest
>>> ("buggy") linux-next kernel these Call Traces when doing an
>>> update-grub.
>>
>> That might be vfsmount being dropped when it shouldn't or dentry lea=
ked.
>> And seeing that it's umount(8), I would suspect the latter...
>>
>> Anyway, with the latest from dhowells we probably should have
>> d_set_d_op() mess on autofs4 under control (in #for-next). =C2=A0Whe=
ther
>> it's enough to actually fix the sucker is a separate question, of
>> course - there might very well be more crap.
>>
>> I've instrumented mntput() et.al. here; hopefully that'll make catch=
ing
>> the remaining turds easier. =C2=A0As for dcache leaks... ouch. =C2=A0=
Could you
>> try to reproduce that one on the mainline kernel? =C2=A0At least tha=
t'd
>> isolate things a bit.
>>
>
> Which version do you mean by "mainline"? 2.6.37-git12?
> And with "[mismerge][foldme] breakage in __do_follow_link()" patch [1=
]?
> I have to look by pulling-in(to) Linus-tree (linux-next) which patche=
s
> are not merged already.
>
> - Sedat -
>
> [1] http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs-2.6.git;a=3D=
commit;h=3D2f3740b3a80bc19498b3ec9b86a25d5941545436
>

OK, I will try with these two patches and report later.

- Sedat -

P.S.:

sd@tbox:~/src/linux-2.6/linux-2.6.37/debian/patches$ ls -l vfs-2.6-for-=
next/
insgesamt 28
-rw-r--r-- 1 sd sd  737 15. Jan 12:21
0001-mismerge-foldme-breakage-in-__do_follow_link.patch
-rw-r--r-- 1 sd sd 4446 15. Jan 12:21
0002-autofs4-Merge-the-remaining-dentry-ops-tables.patch
-rw-r--r-- 1 sd sd  201 15. Jan 12:21 diffstat
-rw-r--r-- 1 sd sd  232 15. Jan 12:21 Shortlog
-rw-r--r-- 1 sd sd 4417 15. Jan 12:21 vfs-2.6-for-next.patch
