From: Rich Felker <dalias@libc.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 25 Jul 2016 13:54:34 -0400
Message-ID: <20160725175434.GU15995@brightrain.aerifal.cx>
References: <20160724153233.49f1574d@canb.auug.org.au>
 <alpine.DEB.2.11.1607250915160.5629@nanos>
 <57961014.7030902@linaro.org>
 <20160725145337.GT15995@brightrain.aerifal.cx>
 <20160725164209.GF11806@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160725164209.GF11806@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <Marc.Zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 25, 2016 at 05:42:09PM +0100, Mark Brown wrote:
> On Mon, Jul 25, 2016 at 10:53:37AM -0400, Rich Felker wrote:
> > On Mon, Jul 25, 2016 at 03:11:48PM +0200, Daniel Lezcano wrote:
> 
> > > I don't know the goal of adding those patches in linux-next via your
> > > tree, may be you misunderstood how linux-next works and you should
> > > remove them. But if the purpose was to merge the patches, I remind you
> > > that being an arch maintainer does not give you the right to apply any
> > > patches, everywhere, at all cost, without review, because you want them
> > > in, you must follow the process, otherwise you take the risk to upset a
> > > lot of people and to be kicked out.
> 
> > If this is upsetting people I can remove them. Last time I got
> > feedback from at least one (driver) subsystem maintainer that (if I
> > understood it correctly) indicated they would like to have seen the
> > patch in linux-next without problems before upstreaming it through
> 
> I think that was me and you've very much misunderstood what I was
> saying.  A that time you were sending new drivers during the merge
> window with the apparent expectation that they would be merged during
> that merge window.  That's not going to happen, things need to go into
> -next before the merge window.  This means that you need to submit your
> patches well in advance of the merge window so they can be reviewed and
> ideally applied to maintainer trees before the merge window opens.
> 
> It does not mean that you should include unreviewed code for other trees
> in your -next tree, that's not the purpose of -next.  What goes into
> -next from each maintainer tree should be what is currently intended to
> go to Linus for that tree in the next merge window.

OK, thanks for the clarification. I'll remove the drivers from my
for-next branch.

Rich
