From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 00:47:43 -0700
Message-ID: <20080606004743.a78180c3.akpm@linux-foundation.org>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au>
	<20080605195604.41623687.akpm@linux-foundation.org>
	<20080606071707.GB9708@elte.hu>
	<20080606072536.GA19334@elte.hu>
	<20080606003327.9ac0e91b.akpm@linux-foundation.org>
	<20080606074137.GA28962@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:46180 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753842AbYFFHsd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 03:48:33 -0400
In-Reply-To: <20080606074137.GA28962@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Fri, 6 Jun 2008 09:41:37 +0200 Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > > > did SLUB change in linux-next? There is no such problem in -tip.
> > > 
> > > i just successfully booted your config on 4 separate 64-bit 
> > > test-systems with latest -tip. (two dual-core boxes, a quad and a 
> > > 16way box) Latest -tip includes sched-next and x86-next as well.
> > 
> > What's the point in testing a radically differenet kernel from the one 
> > which is known to be crashing?
> 
> well, you Cc:-ed me, so i wanted to exclude -tip's 750+ commits in this 
> area (scheduling, 64-bit x86) in the first step.
> 

What's the relationship between -tip and linux-next?

The crash seems to be due to sched_domains startup ordering, at a guess.

My third bisect iteration has hit this:

arch/x86/mm/kmmio.c: In function 'get_kmmio_probe':
arch/x86/mm/kmmio.c:85: error: implicit declaration of function 'list_for_each_entry_rcu'
arch/x86/mm/kmmio.c:85: error: 'list' undeclared (first use in this function)
arch/x86/mm/kmmio.c:85: error: (Each undeclared identifier is reported only once
arch/x86/mm/kmmio.c:85: error: for each function it appears in.)
arch/x86/mm/kmmio.c:85: error: syntax error before '{' token
arch/x86/mm/kmmio.c:88: warning: no return statement in function returning non-void
arch/x86/mm/kmmio.c: In function 'get_kmmio_fault_page':
arch/x86/mm/kmmio.c:100: error: 'list' undeclared (first use in this function)
arch/x86/mm/kmmio.c:100: error: syntax error before '{' token
arch/x86/mm/kmmio.c:103: warning: no return statement in function returning non-void
arch/x86/mm/kmmio.c: In function 'add_kmmio_fault_page':
arch/x86/mm/kmmio.c:328: error: implicit declaration of function 'list_add_rcu'
arch/x86/mm/kmmio.c: In function 'remove_kmmio_fault_pages':
arch/x86/mm/kmmio.c:420: error: implicit declaration of function 'list_del_rcu'

