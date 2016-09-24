From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Sep 21
Date: Sat, 24 Sep 2016 10:42:45 +1000
Message-ID: <20160924104245.0d6429c1@canb.auug.org.au>
References: <20160921160838.71395247@canb.auug.org.au>
        <CA+55aFwS6i_N3nUrEiD8aRt_1HjScKG7S8a2sREs0Sv1eJsrAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwS6i_N3nUrEiD8aRt_1HjScKG7S8a2sREs0Sv1eJsrAQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

On Fri, 23 Sep 2016 11:24:04 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 20, 2016 at 11:08 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Changes since 20160920:
> > [...]
> > Non-merge commits (relative to Linus' tree): 11180
> >  8424 files changed, 456474 insertions(+), 237951 deletions(-)  
> 
> What happened here? The previous linux-next tree was much smaller. The
> "changes since" part doesn't actually talk about the almost 3000 new
> non-merge commits that very suddenly showed up.

That was Greg's (cc'd) greybus stuff entering the staging tree:

$ git rev-list --count --no-merges origin/master..2bbadafbe4ea
2363

> I wonder if your automation could add some notes on things like this
> when clearly one of the trees changes radically. Back in 20160920,
> linux-next looked fairly small compared to previous releases. And then
> the next day it suddenly looked quite big.

I will have a look at what can be done.  Normally trees do not grow in
large leaps, this was exceptional.  Most often such an increase would
be caused by one tree merging in another (both of which are often in
linux-next) e.g. the drm tree merges 8 other trees that I have and the
net-next tree also merges 8 others.

> I get the feeling that several thousand new commits just before the
> merge window opens is not a good sign. Of course, I'm planning an rc8
> this time around anyway, but even so this is pretty surprising.

-- 
Cheers,
Stephen Rothwell
