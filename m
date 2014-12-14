From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: question about the luto-misc tree
Date: Sat, 13 Dec 2014 23:26:36 -0800
Message-ID: <CALCETrXu19aHhudTfPAr5PM05FR0xKBiSHgbubVhh6QUrHCADw@mail.gmail.com>
References: <20141214175747.2e6c506e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:49878 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883AbaLNH06 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Dec 2014 02:26:58 -0500
Received: by mail-lb0-f175.google.com with SMTP id u10so7589084lbd.20
        for <linux-next@vger.kernel.org>; Sat, 13 Dec 2014 23:26:57 -0800 (PST)
In-Reply-To: <20141214175747.2e6c506e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Dec 13, 2014 10:58 PM, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
>
> Hi Andy,
>
> The luto-misc tree seems to have a whole series of commits in it that
> have just bee removed from the rcu tree ...  You really have to be very
> careful if you base your work on a tree that is regularly rebased.

Hmm.  They were there a couple days ago.  Paul, what should I do about
this?  I only need the one NMI nesting change for the stuff in
luto/next.

>
> I also wonder if the other commits in that tree are destined for
> v3.19?  If they are for v3.20, then they should not be in linux-next
> until after v3.19-rc1 has been released.

They're for 3.20.  I'll drop the whole series from the next branch for now.

--Andy

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
