From: Evan Green <evgreen@chromium.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Date: Thu, 26 Apr 2018 16:42:17 +0000
Message-ID: <CAE=gft625-cWjBQXcNRumFRGrmF6nJDf0pAjBbG+gAAS_YXtWg@mail.gmail.com>
References: <20180426084041.5cf81918@canb.auug.org.au> <CAE=gft6e6wo1nj+Rw5=f+UXxhx3Hof7Nt=E9+-OAzvvv8Gct1g@mail.gmail.com>
 <20180426145255.0141300e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426145255.0141300e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: agross@codeaurora.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>, groeck@chromium.org
List-Id: linux-next.vger.kernel.org

On Wed, Apr 25, 2018 at 9:54 PM Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi Evan,

> On Thu, 26 Apr 2018 03:39:25 +0000 Evan Green <evgreen@chromium.org>
wrote:
> >
> > Guenter and I had a fix for compile test here, which had failures that
> > looked similar:
> >
> > https://lkml.org/lkml/2018/4/18/752

> That looks like it could very well be the problem/solution.

> > I was hoping to verify myself whether or not this fixed allmodconfig,
but
> > my machine at home is not so fast, and I must be missing something,
either
> > in the configuration or the tree. Which tree exactly are you building?

> I was attempting to compile my partial linux-next for today after
> merging the qcom tree.  So once I release linux-next, it will be commit
> a72d0aa48d2e ("Merge remote-tracking branch 'omap/for-next'") plus a
> merge of the qcom tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git#for-next
> - which today meant commit c78d6951a806 ("Merge branch 'soc-for-4.18'
> into all-for-4.18")).

> I suspect that just Linus' tree merged with the qcom tree would have
> been enough to cause the failure.

> --
> Cheers,
> Stephen Rothwell

I've verified that the patch listed above fixes the issue for me. Andy, if
it looks okay to you, go ahead an pull it in. Apologies for the trouble,
and thanks Guenter for having builders that notice this stuff early!
-Evan
