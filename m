From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 9 Nov 2017 07:18:55 +0100
Message-ID: <20171109061855.f7fvo6e7iniekoym@gmail.com>
References: <20171108134717.578046db@canb.auug.org.au>
 <20171108030152.bd76eahiwjwjt3kp@treble>
 <20171108091827.pl3igqvpy56bvvn7@gmail.com>
 <20171108231426.3f2139de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:49766 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbdKIGS7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Nov 2017 01:18:59 -0500
Content-Disposition: inline
In-Reply-To: <20171108231426.3f2139de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Wed, 8 Nov 2017 10:18:28 +0100 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > Note, I created a commit out of this fix, with your SOB - let me know if you have 
> > any objections.
> 
> Only a small nit - I didn't bisect it, I just figured it out by
> inspection.  Unfortunately, I don't have time to do bisections while
> building linux-next. :-(
> 
> Not a biggie, though.  Thanks for sorting this out.

Yeah, so while I knew that you didn't do the bisection the usual way, you still 
got it right nevertheless, so the tag is well deserved! I'll add it as a 
"Commit-identified-by" tag next time perhaps.

Thanks,

	Ingo
