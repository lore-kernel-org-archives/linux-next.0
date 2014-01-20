From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 20 Jan 2014 09:42:55 +0100
Message-ID: <CA+icZUVNdEkE0uR2gn0iY790sKKFzG7Py2mPqqJN+pUNiuYXDw@mail.gmail.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>
	<20140116121955.GQ31570@twins.programming.kicks-ass.net>
	<20140117074628.88698f59939c9002b7c12968@canb.auug.org.au>
	<20140116222536.GX30183@twins.programming.kicks-ass.net>
	<20140117093426.ee8e3d1bb2e95c9f67ec625b@canb.auug.org.au>
	<52D8625C.1000902@zytor.com>
	<20140117144518.231fa4bccb16a8d7edd36662@canb.auug.org.au>
	<1390038366.5676.10.camel@marge.simpson.net>
	<20140120145122.a95b3e3a17d20117214098ca@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:34506 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbaATIm5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jan 2014 03:42:57 -0500
In-Reply-To: <20140120145122.a95b3e3a17d20117214098ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Galbraith <bitbucket@online.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Len Brown <lenb@kernel.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Jan 20, 2014 at 4:51 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Sat, 18 Jan 2014 10:46:06 +0100 Mike Galbraith <bitbucket@online.de> wrote:
>>
>> I hope it doesn't look quite like that, next-20140117 is -ENOBOOT on
>> Q6600 box.  See below for an alternative.
>>
>> idle: kill unnecessary mwait_idle() resched IPIs
>
> OK, so despite even further discussion, I have applied this as a merge
> fix patch for today.  Let me know when it is all sorted out.
>

Where is this fix?
( Browsing Linux-next remote GIT repository online. )
2x NOPE for me.

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/log/?id=next-20140120&qt=grep&q=mwait_idle
[2] http://git.kernel.org/cgit/linux/kernel/git/sfr/next-fixes.git

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
