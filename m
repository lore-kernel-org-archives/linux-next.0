From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 09:41:37 +0200
Message-ID: <20080606074137.GA28962@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606072536.GA19334@elte.hu> <20080606003327.9ac0e91b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38115 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763504AbYFFHlz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 03:41:55 -0400
Content-Disposition: inline
In-Reply-To: <20080606003327.9ac0e91b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> > > did SLUB change in linux-next? There is no such problem in -tip.
> > 
> > i just successfully booted your config on 4 separate 64-bit 
> > test-systems with latest -tip. (two dual-core boxes, a quad and a 
> > 16way box) Latest -tip includes sched-next and x86-next as well.
> 
> What's the point in testing a radically differenet kernel from the one 
> which is known to be crashing?

well, you Cc:-ed me, so i wanted to exclude -tip's 750+ commits in this 
area (scheduling, 64-bit x86) in the first step.

	Ingo
