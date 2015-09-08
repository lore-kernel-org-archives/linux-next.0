From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Tue, 8 Sep 2015 16:03:23 -0700
Message-ID: <CA+55aFzNTO-VRD25QyopovfbVN3m3XMogruRE0L7G51AKOAb2g@mail.gmail.com>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
	<20150908093524.507a19d8@canb.auug.org.au>
	<CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
	<20150909085603.0173ac4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:35634 "EHLO
	mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752180AbbIHXDY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2015 19:03:24 -0400
In-Reply-To: <20150909085603.0173ac4e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Tue, Sep 8, 2015 at 3:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I have been applying that patch I sent to you to -next for some time.
> I guess I expected Andrew to pick it up when he rebased his patch
> series before submitting it to you.  These things sometimes slip
> through the cracks.

I suspect Andrew saw that patch, and thought it was a merge fixup like
you sometimes send out, and didn't realize that it actually applied
directly to his series.

              Linus
