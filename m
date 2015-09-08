From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Tue, 8 Sep 2015 11:11:25 -0700
Message-ID: <CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
	<20150908093524.507a19d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:33602 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751864AbbIHSL0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2015 14:11:26 -0400
In-Reply-To: <20150908093524.507a19d8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Mon, Sep 7, 2015 at 4:35 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The below patch was missed when the userfaultfd stuff and the x86 changes
> were merged.  I have repeated the patch in the clear below.

When forwarding patches, please add your sign-off. I can see (and
apply) the original in this thread, so I guess it doesn't matter in
this particular case, but in general that's what you should be doing
so that I don't then have to find the other email just to apply the
patch from the original author.

Also, this wasn't actually a real merge error. This was just a bug in
the whole process. Andrew's patches sent to me had been updated with
the right number for all the other cases, why hadn't this been folded
into the series too? Apparently Andrew's series has simply been buggy
for the last month or more, and that was true even before it was sent
to me and while it was cooking in -next.. Tssk.

            Linus
