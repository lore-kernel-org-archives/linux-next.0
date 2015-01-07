From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Missing next-$date git-tag when pulled-in linux-next.git on top
 of linus.git
Date: Wed, 7 Jan 2015 14:47:53 +0100
Message-ID: <CA+icZUVYu2uaAG-sSf5pf_rzGU+BSBAwu9mhBDrCXZ0a2nw1sA@mail.gmail.com>
References: <CA+icZUVVPe68VGwRcc5ztxGwHi83wHJVeiJMUuBynm2LypoaZA@mail.gmail.com>
	<20150107212439.7254d389@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:63227 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753310AbbAGNr4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2015 08:47:56 -0500
In-Reply-To: <20150107212439.7254d389@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 7, 2015 at 11:24 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Sedat,
>
> On Wed, 7 Jan 2015 09:24:57 +0100 Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>
>> My workflow looks like this
>>
>> # Get mainline Git tree
>> $ git clone $LINUS_GIT_URL
>>
>> # Checkout latest mainline (rc) tag (aka -next's "origin" commit-id)
>> $ git checkout -b Linux-v3.19-rc3 v3.19-rc3
>>
>> # Base to pull in current -next
>> $ git checkout -b Linux-next-20150107
>>
>> # Pull in stuff from next-20150107
>> $ git pull git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> tags/next-20150107
>
> Just do
>
> $ git pull git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> That should also fetch the next- tag.
>

For current -next this is OK.
Sometimes I needed to test against a specific next-version.
Any idea?

- Sedat -
