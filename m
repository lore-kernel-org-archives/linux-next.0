From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Date: Fri, 18 Jan 2019 10:41:27 -0700
Message-ID: <20190118174127.GA822@flashbox>
References: <20190116083440.11b6839c@canb.auug.org.au>
 <154767815973.169631.1738587342757192096@swboyd.mtv.corp.google.com>
 <CAOMZO5DSbVpha=1_s5K+-vodD+N1fGnj41_UKmvqxDOPhxXwfg@mail.gmail.com>
 <154775054438.169631.5111867106558251203@swboyd.mtv.corp.google.com>
 <878szi3zp6.fsf@concordia.ellerman.id.au>
 <154783304655.169631.12906027462791855701@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154783304655.169631.12906027462791855701@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Joe Perches <joe@perches.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 18, 2019 at 09:37:26AM -0800, Stephen Boyd wrote:
> Quoting Michael Ellerman (2019-01-18 04:41:41)
> > Stephen Boyd <sboyd@kernel.org> writes:
> > 
> > > Quoting Fabio Estevam (2019-01-16 17:25:21)
> > >> On Wed, Jan 16, 2019 at 10:44 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >> 
> > >> > Ok sure. Does this matter to scripts? Is it documented in
> > >> > Documentation/process/submitting-patches.rst? I've seen both types, one
> > >> 
> > >> From Documentation/process/submitting-patches.rst"
> > >> 
> > >> "If your patch fixes a bug in a specific commit, e.g. you found an issue using
> > >> ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
> > >> the SHA-1 ID, and the one line summary.  For example::
> > >> 
> > >> Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdata()")"
> > >
> > > Yes but 'one line summary' is not clear to me. Does it mean the summary
> > > line? Or the one line summary on one line regardless of commit message
> > > column wrapping? Sorry to be pedantic but I can see how this can be
> > > misunderstood.
> > 
> > Yeah "one line summary" is referring to the subject of the commit.
> > 
> > So it doesn't explicitly say not to split it across lines, it probably
> > should.
> > 
> > eg: ?
> 
> Yes, thanks!
> 
> > 
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index 30dc00a364e8..12a283ba3929 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -186,6 +186,8 @@ If your patch fixes a bug in a specific commit, e.g. you found an issue using
> >  
> >         Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdata()")
> >  
> > +To ease parsing of the 'Fixes:' tag please don't split it across multiple lines.
> > +
> >  The following ``git config`` settings can be used to add a pretty format for
> >  outputting the above style in the ``git log`` or ``git show`` commands::
> >  
> > 
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 
> Do you have a patch for checkpatch too? Maybe Joe can solve my problem.
> 

Joe posted a checkpatch diff in another thread: https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel@perches.com/

Nathan
