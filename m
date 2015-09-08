From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Wed, 9 Sep 2015 08:56:03 +1000
Message-ID: <20150909085603.0173ac4e@canb.auug.org.au>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
	<20150908093524.507a19d8@canb.auug.org.au>
	<CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44342 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752264AbbIHW4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Sep 2015 18:56:05 -0400
In-Reply-To: <CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi Linus,

On Tue, 8 Sep 2015 11:11:25 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> On Mon, Sep 7, 2015 at 4:35 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The below patch was missed when the userfaultfd stuff and the x86 changes
> > were merged.  I have repeated the patch in the clear below.
> 
> When forwarding patches, please add your sign-off. I can see (and
> apply) the original in this thread, so I guess it doesn't matter in
> this particular case, but in general that's what you should be doing
> so that I don't then have to find the other email just to apply the
> patch from the original author.

Ooops, sorry about that.  I really should know better.

> Also, this wasn't actually a real merge error. This was just a bug in
> the whole process. Andrew's patches sent to me had been updated with
> the right number for all the other cases, why hadn't this been folded
> into the series too? Apparently Andrew's series has simply been buggy
> for the last month or more, and that was true even before it was sent
> to me and while it was cooking in -next.. Tssk.

I have been applying that patch I sent to you to -next for some time.
I guess I expected Andrew to pick it up when he rebased his patch
series before submitting it to you.  These things sometimes slip
through the cracks.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
