From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 10:49:49 +0200
Message-ID: <20080606084949.GA28190@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606072536.GA19334@elte.hu> <20080606003327.9ac0e91b.akpm@linux-foundation.org> <20080606074137.GA28962@elte.hu> <20080606004743.a78180c3.akpm@linux-foundation.org> <20080606082325.GA10826@elte.hu> <20080606013835.8dfd838b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53105 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751252AbYFFIuG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 04:50:06 -0400
Content-Disposition: inline
In-Reply-To: <20080606013835.8dfd838b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> > most of the -tip topics (there are 75 of them currently) are present 
> > in linux-next - about ~70% of all -tip commits are in linux-next 
> > already. The stuff that is not in linux-next yet is either because 
> > it's: miscellany fixes (i.e. intentionally grabbed out-of-tree to 
> > make our tests work better), not cooked enough yet, or because we 
> > are still working it out - tip is less than a month old still.
> > 
> > in general the rule is that if there's anything we want to push 
> > upstream, it will show up in linux-next.
> 
> I don't think it's a good idea for you guys to be off working on 
> 2.6.28 material when we're trying to stabilise 2.6.25, 2.6.26 and 
> preparing for 2.6.27.
> 
> What's especially regrettable is that, afaik, you are expending 
> testing resources on a tree which nobody will ever run rather than 
> upon the tree which everyone _will_ run :( [...]

what do you mean? We are testing commits that everybody will run and are 
pre-filtering them for sanity and stability before they hit linux-next.

	Ingo
