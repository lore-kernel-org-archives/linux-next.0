From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [bloat] Measuring header file bloat effects on kernel build
	performance: a more than 2x slowdown ...
Date: Mon, 23 May 2011 18:19:14 +0200
Message-ID: <20110523161914.GA15464@merkur.ravnborg.org>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au> <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com> <20110523090918.GA5474@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110523090918.GA5474@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>, Christopher Li <sparse@chrisli.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

> 
> Such thing happen due to:
> 
>  - header files only get added, almost never removed
> 
> The key thing was that the build did not break when prefetch.h was kept 
> dangling. Not sure what to do about that - for humans a dangling header is 
> absolutely non-obvious to find - we'd need tooling help.

Long time ago I discussed this briefly with Christopher Li,
and he hacked support for this in sparse.

The branch is still around:

http://git.kernel.org/?p=devel/sparse/chrisl/sparse.git;a=shortlog;h=unused-include-files

I never got around to play with it for various reasons.
IIRC it will list include files not used in _current_ configuration,
so use if CONFIG_ etc. may give different results.

	Sam
