From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Missing next-$date git-tag when pulled-in linux-next.git on top
 of linus.git
Date: Tue, 3 Feb 2015 21:59:59 +0100
Message-ID: <CA+icZUWBm3rDHG2v--5BCSWHs8un31AxtQRGiH++dFySxN_Vjg@mail.gmail.com>
References: <CA+icZUVVPe68VGwRcc5ztxGwHi83wHJVeiJMUuBynm2LypoaZA@mail.gmail.com>
	<20150107212439.7254d389@canb.auug.org.au>
	<CA+icZUVYu2uaAG-sSf5pf_rzGU+BSBAwu9mhBDrCXZ0a2nw1sA@mail.gmail.com>
	<20150108075201.042f9126@canb.auug.org.au>
	<CA+icZUUL6pT9L8omUuvOfs4biYgOu6sE11n2o7v8F3fVXoLf+w@mail.gmail.com>
	<20150204074732.041c6198@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:51239 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755915AbbBCVAB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 16:00:01 -0500
In-Reply-To: <20150204074732.041c6198@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 3, 2015 at 9:47 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Sedat,
>
> On Tue, 3 Feb 2015 21:06:45 +0100 Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>>
>> $ git fetch linux-next next-20150203
>> remote: Counting objects: 62716, done.
>> remote: Compressing objects: 100% (14620/14620), done.
>> remote: Total 62716 (delta 53326), reused 57198 (delta 47960)
>> Empfange Objekte: 100% (62716/62716), 12.84 MiB | 217.00 KiB/s, Fert=
ig.
>> L=C3=B6se Unterschiede auf: 100% (53326/53326), abgeschlossen mit 70=
64
>> lokalen Objekten.
>> Von git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next
>>  * tag                         next-20150203 -> FETCH_HEAD
>
> sorry about that, try
>
> $ git fetch linux-next tag next-20150203
>

Thanks, that worked!

$ LC_ALL=3DC git checkout Linux-v3.19-rc7

$ LC_ALL=3DC git fetch linux-next tag next-20150203

$ LC_ALL=3DC git checkout -b Linux-next-20150203 next-20150203

- Sedat -
