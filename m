From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c + autofs4)
Date: Sat, 15 Jan 2011 12:44:19 +0100
Message-ID: <AANLkTim3RoeW4bmNjcdC3-6Y-ngZpm9w2qaDFxHsP8=h@mail.gmail.com>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
	<AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
	<20110115075723.GJ19804@ZenIV.linux.org.uk>
	<20110115090702.GK19804@ZenIV.linux.org.uk>
	<AANLkTinPs5toSudLXuu3=a0RoGHUqYvF8YyhdrXgckXY@mail.gmail.com>
	<20110115110848.GL19804@ZenIV.linux.org.uk>
	<AANLkTinXPgfkcLq6LsQ=dsFZgQK5JG4f4GQW92r95J5C@mail.gmail.com>
	<20110115113445.GM19804@ZenIV.linux.org.uk>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:38415 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483Ab1AOLoU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2011 06:44:20 -0500
In-Reply-To: <20110115113445.GM19804@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Sat, Jan 15, 2011 at 12:34 PM, Al Viro <viro@zeniv.linux.org.uk> wro=
te:
> On Sat, Jan 15, 2011 at 12:16:29PM +0100, Sedat Dilek wrote:
>
>> Which version do you mean by "mainline"? 2.6.37-git12?
>> And with "[mismerge][foldme] breakage in __do_follow_link()" patch [=
1]?
>> I have to look by pulling-in(to) Linus-tree (linux-next) which patch=
es
>> are not merged already.
>
> -git12 would do. =C2=A0Without any extra patches. =C2=A0Can you repro=
duce the
> ext3 oops on that alone?
>

Just a short answer (on the go... weekend shopping)...
Currently, I am on a lame IBM T40p (Pentium-M) and doing a "full" build=
=2E
Unfortunately, I started a next linux-next build with the two patches
from vfs-2.6#for-next.
When I return I will try this kernel.
If things aren't OK, I do a mainline build afterwards (w/o any patches)=
=2E

- Sedat -
