From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Dec 12
Date: Fri, 12 Dec 2014 13:57:19 -0800
Message-ID: <20141212135719.4c79bac46d43bfd8d7c8e6a6@linux-foundation.org>
References: <20141212183518.06e3803d@canb.auug.org.au>
	<1418377757.5756.24.camel@x220>
	<20141212210449.7f460bb1@canb.auug.org.au>
	<1418380316.5756.37.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418380316.5756.37.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Rothberg <valentinrothberg@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Josh Triplett <josh@joshtriplett.org>
List-Id: linux-next.vger.kernel.org

On Fri, 12 Dec 2014 11:31:56 +0100 Paul Bolle <pebolle@tiscali.nl> wrote:

> On Fri, 2014-12-12 at 21:04 +1100, Stephen Rothwell wrote:
> > That patch has been in linux-next since Dec 3 as commit 77a4494388ab in
> > Andrew's patch set (and maybe earlier).
> 
> Not earlier. Commit 77a4494388ab debuted in next-20141203:
>         $ git tag --contains 77a4494388ab
>         next-20141203
>         next-20141204
>         next-20141205
>         next-20141208
>         next-20141209
>         next-20141210
>         next-20141211
>         next-20141212
>         
> I missed that commit. But then again it never occurred to me that a
> Kconfig symbol would be added and removed in one series. And, obviously,
> grepping for INIT_FALLBACK didn't show anything in linux-next before
> today (the oldest tree I checked was next-20141201, after which I lost
> interest in going back any further). 

The plan is to change the kernel's handling of failures in "init="
command line processing.  We're a bit uncertain about the downstream
effects of this, so we make the new behaviour Kconfigurable in 3.19 and
if that's all OK, remove the Kconfigurability and switch to the new
behaviour in 3.20.  I queued the 3.20 patch at the same time so I
wouldn't forget about it.

> >   However, also in Adnrew's
> > patch set is another patch ("init: remove CONFIG_INIT_FALLBACK") that
> > then removes CONFIG_INIT_FALLBACK.  There is a conflict because the
> > first has gone into Linus' tree today (as commit 6ef4536e2f19), but the
> > second has not (I don't know why not).
> > 
> > Hmmm, I would have expected the Kconfig entry to be removed as well,
> > but either I missed that, or git is not as clever as I expect it to be.
> > 
> > > Anyhow, I'm sure this all will be sorted out in due time.
> > 
> > I hope so.
> 
> I won't be bothering (Andrew and) you again about this. Unless sorting
> this out takes rather long, that is.

Is there some problem with the current mainline 3.19 code?
