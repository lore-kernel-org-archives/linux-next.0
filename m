From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: Tree for Sep 21
Date: Fri, 23 Sep 2016 11:24:04 -0700
Message-ID: <CA+55aFwS6i_N3nUrEiD8aRt_1HjScKG7S8a2sREs0Sv1eJsrAQ@mail.gmail.com>
References: <20160921160838.71395247@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:32956 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbcIWSYG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Sep 2016 14:24:06 -0400
In-Reply-To: <20160921160838.71395247@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Sep 20, 2016 at 11:08 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Changes since 20160920:
> [...]
> Non-merge commits (relative to Linus' tree): 11180
>  8424 files changed, 456474 insertions(+), 237951 deletions(-)

What happened here? The previous linux-next tree was much smaller. The
"changes since" part doesn't actually talk about the almost 3000 new
non-merge commits that very suddenly showed up.

I wonder if your automation could add some notes on things like this
when clearly one of the trees changes radically. Back in 20160920,
linux-next looked fairly small compared to previous releases. And then
the next day it suddenly looked quite big.

I get the feeling that several thousand new commits just before the
merge window opens is not a good sign. Of course, I'm planning an rc8
this time around anyway, but even so this is pretty surprising.

           Linus
