From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86 tree
Date: Fri, 04 Aug 2017 10:44:31 -0700
Message-ID: <xmqqmv7ftegw.fsf@gitster.mtv.corp.google.com>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
        <20170802235740.GB27974@fury>
        <20170803102810.37f7c6b0@canb.auug.org.au>
        <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwVBk2FQEp0pbF9Xx-YhexL19fCHgJex4JaOannXpCTOA@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 2 Aug 2017 18:06:20 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Darren Hart <dvhart@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-next.vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Aug 2, 2017 at 5:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> I would say that if you rebase someone's commit(s), then you are on the
>> "patch's delivery path" and so should add a Signed-off-by tag.
>
> Yeah, I agree. Rebasing really is pretty much the exact same thing as
> applying a patch.
>
>> "git rebase" does have a "--signoff" option.
>
> I think you end up signing off twice using that. I don't think it's
> smart enough to say "oh, you already did it once".

Git avoids duplication only when your SoB appears as the last
existing one, so that we can capture a flow of a patch which you
originally signed off, picked up and tweaked further by somebody
else, which comes back to you and you sign it off again.

We may drop yours even when yours is not the last in the existing
chain, but that would be a bug; at least the above is what we try to
do.

> And in general, you simply should never rebase commits that have
> already been publicized. And the fact that you didn't commit them in
> the first place definitely means that they've been public somewhere.
>
> So I would definitely suggest against the "git rebase --signoff"
> model, even if git were to do the "right thing". It's simply
> fundamentally the wrong thing to do.

When those involved are using push/pull as a replacement for
e-mailed patch exchange, then such a workflow should be OK.  There
needs to be a shared understanding that the branch(es) used for such
exchange are unstable and should not be built directly on to be
merged, of course.
