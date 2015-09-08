From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Tue, 8 Sep 2015 16:21:15 -0700
Message-ID: <20150908162115.fc494463.akpm@linux-foundation.org>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
	<20150908093524.507a19d8@canb.auug.org.au>
	<CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
	<20150909085603.0173ac4e@canb.auug.org.au>
	<CA+55aFzNTO-VRD25QyopovfbVN3m3XMogruRE0L7G51AKOAb2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35344 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912AbbIHXUQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2015 19:20:16 -0400
In-Reply-To: <CA+55aFzNTO-VRD25QyopovfbVN3m3XMogruRE0L7G51AKOAb2g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrea Arcangeli <aarcange@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Tue, 8 Sep 2015 16:03:23 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, Sep 8, 2015 at 3:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I have been applying that patch I sent to you to -next for some time.
> > I guess I expected Andrew to pick it up when he rebased his patch
> > series before submitting it to you.  These things sometimes slip
> > through the cracks.
> 
> I suspect Andrew saw that patch, and thought it was a merge fixup like
> you sometimes send out, and didn't realize that it actually applied
> directly to his series.

I've had it all the time, as a post-linux-next fixup - the idea being
that I send it to you after its linux-next preconditions have been
merged up.

However I failed to put that patch inside the stephen-take-these-bits
markers, so it never went from -mm into -next.

New syscalls are rather a pain, both from the patch-monkeying POV and
also because nobody knows what the syscall numbers will be until
everything lands in mainline.  Oh well, it doesn't happen often and
it's easy stuff.
