From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86 tree
Date: Wed, 2 Aug 2017 18:06:20 -0700
Message-ID: <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
References: <20170803063743.1d50a5d2@canb.auug.org.au> <20170802235740.GB27974@fury>
 <20170803102810.37f7c6b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170803102810.37f7c6b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I would say that if you rebase someone's commit(s), then you are on the
> "patch's delivery path" and so should add a Signed-off-by tag.

Yeah, I agree. Rebasing really is pretty much the exact same thing as
applying a patch.

> "git rebase" does have a "--signoff" option.

I think you end up signing off twice using that. I don't think it's
smart enough to say "oh, you already did it once".

But I didn't check. Sometimes git is a lot smarter than I remember it
being, simply because I don't worry about it. Junio does a good job.

And in general, you simply should never rebase commits that have
already been publicized. And the fact that you didn't commit them in
the first place definitely means that they've been public somewhere.

So I would definitely suggest against the "git rebase --signoff"
model, even if git were to do the "right thing". It's simply
fundamentally the wrong thing to do. Either you already committed them
(and hopefully signed off correctly the first time), or you didn't
(and you shouldn't be rebasing). So in neither case is "git rebase
--signoff" sensible.

              Linus
