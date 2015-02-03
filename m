From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Missing next-$date git-tag when pulled-in linux-next.git on top
 of linus.git
Date: Tue, 3 Feb 2015 21:06:45 +0100
Message-ID: <CA+icZUUL6pT9L8omUuvOfs4biYgOu6sE11n2o7v8F3fVXoLf+w@mail.gmail.com>
References: <CA+icZUVVPe68VGwRcc5ztxGwHi83wHJVeiJMUuBynm2LypoaZA@mail.gmail.com>
	<20150107212439.7254d389@canb.auug.org.au>
	<CA+icZUVYu2uaAG-sSf5pf_rzGU+BSBAwu9mhBDrCXZ0a2nw1sA@mail.gmail.com>
	<20150108075201.042f9126@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:38428 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161093AbbBCUGq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 15:06:46 -0500
In-Reply-To: <20150108075201.042f9126@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 7, 2015 at 9:52 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Sedat,
>
> On Wed, 7 Jan 2015 14:47:53 +0100 Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>>
>> On Wed, Jan 7, 2015 at 11:24 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> > Hi Sedat,
>> >
>> > On Wed, 7 Jan 2015 09:24:57 +0100 Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
>> >>
>> >> My workflow looks like this
>> >>
>> >> # Get mainline Git tree
>> >> $ git clone $LINUS_GIT_URL
>> >>
>> >> # Checkout latest mainline (rc) tag (aka -next's "origin" commit-=
id)
>> >> $ git checkout -b Linux-v3.19-rc3 v3.19-rc3
>> >>
>> >> # Base to pull in current -next
>> >> $ git checkout -b Linux-next-20150107
>> >>
>> >> # Pull in stuff from next-20150107
>> >> $ git pull git://git.kernel.org/pub/scm/linux/kernel/git/next/lin=
ux-next.git
>> >> tags/next-20150107
>> >
>> > Just do
>> >
>> > $ git pull git://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git master
>> >
>> > That should also fetch the next- tag.
>>
>> For current -next this is OK.
>> Sometimes I needed to test against a specific next-version.
>> Any idea?
>
> $ git clone <Linus' tree> next
> $ cd next
> $ git fetch <Next URL> next-xxxxxxxx
> $ git checkout -b Linux-next-xxxxxxxx next-xxxxxxxx
>

Sorry for the late response, I wanted to test today's next-20150203...

My base is always linux.git...

$ cd linux/

$ git checkout -b Linux-v3.19-rc7 v3.19-rc7

$ git checkout Linux-v3.19-rc7
Zu Branch 'Linux-v3.19-rc7' gewechselt

$ git fetch linux-next next-20150203
remote: Counting objects: 62716, done.
remote: Compressing objects: 100% (14620/14620), done.
remote: Total 62716 (delta 53326), reused 57198 (delta 47960)
Empfange Objekte: 100% (62716/62716), 12.84 MiB | 217.00 KiB/s, Fertig.
L=C3=B6se Unterschiede auf: 100% (53326/53326), abgeschlossen mit 7064
lokalen Objekten.
Von git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next
 * tag                         next-20150203 -> FETCH_HEAD

$ LC_ALL=3DC git checkout -b Linux-next-20150203 next-20150203
fatal: Cannot update paths and switch to branch 'Linux-next-20150203'
at the same time.
Did you intend to checkout 'next-20150203' which can not be resolved as=
 commit?

$ LC_ALL=3DC git checkout -b Linux-next-20150203 tags/next-20150203
fatal: Cannot update paths and switch to branch 'Linux-next-20150203'
at the same time.
Did you intend to checkout 'tags/next-20150203' which can not be
resolved as commit?

- Sedat -
