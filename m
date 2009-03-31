From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCHSET 0/8 version 4] exofs for kernel 2.6.30
Date: Tue, 31 Mar 2009 01:04:08 -0700
Message-ID: <20090331010408.fa43df98.akpm@linux-foundation.org>
References: <49C1331D.1080805@panasas.com>
	<20090330142200.af4b497c.akpm@linux-foundation.org>
	<49D1C44D.8060806@panasas.com>
	<49D1C929.4070403@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:56971 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753471AbZCaIOO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2009 04:14:14 -0400
In-Reply-To: <49D1C929.4070403@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, avishay@gmail.com, jeff@garzik.org, linux-fsdevel@vger.kernel.org, osd-dev@open-osd.org, James.Bottomley@HansenPartnership.com, linux-kernel@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp, linux-next@vger.kernel.org

On Tue, 31 Mar 2009 10:41:29 +0300 Boaz Harrosh <bharrosh@panasas.com> wrote:

> 
> I forgot to say. Some of the people that sent comments where:
>   Marcin Slusarz <marcin.slusarz@gmail.com>
>   Evgeniy Polyakov <zbr@ioremap.net>
>   Jeff Garzik <jeff@garzik.org>
>   Pavel Machek <pavel@suse.cz>
>   Benny Halevy <bhalevy@panasas.com>
>   Alan Cox <alan@lxorguk.ukuu.org.uk>
>   Andrew Morton <akpm@linux-foundation.org>
> 
> And then there was a long flame war about user-mode API, which I now
> have, and all in kernel utilities are gone.
> 
> To the best of my knowledge I have addressed all comments, at least
> no one complained.
> 

Let me take a quick look...

<quickly looks>

OK, I foud a few minor things, but the code looks fine to me.  However
I cannot speak to the overall design and to the actual desirability of
adding the feature to Linux.

I'd say that unless someone pipes up with a showstopper objection in
the next few days, please send the pull request to Linus near the end of
the week.
