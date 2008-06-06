From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 01:01:49 -0700
Message-ID: <20080606010149.4d757b92.akpm@linux-foundation.org>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au>
	<20080605195604.41623687.akpm@linux-foundation.org>
	<20080606071707.GB9708@elte.hu>
	<20080606072536.GA19334@elte.hu>
	<20080606003327.9ac0e91b.akpm@linux-foundation.org>
	<20080606074137.GA28962@elte.hu>
	<20080606004743.a78180c3.akpm@linux-foundation.org>
	<20080606175358.a439d1bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:60236 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755472AbYFFICj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 04:02:39 -0400
In-Reply-To: <20080606175358.a439d1bb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Fri, 6 Jun 2008 17:53:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Fri, 6 Jun 2008 00:47:43 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > My third bisect iteration has hit this:
> > 
> > arch/x86/mm/kmmio.c: In function 'get_kmmio_probe':
> > arch/x86/mm/kmmio.c:85: error: implicit declaration of function 'list_for_each_entry_rcu'
> 
> You need the following patch from linux-next.  Which should be the commit
> immediately after the merge of the ftrace tree.

Well yes - I just bodged it by hand then unbodged it later.  But we
have a bisection break there.  Admittedly a minor one, unless the bug
you're bisecting for requires that kprobes be configured.  But it would
be nice to squish it.

I hope Ingo isn't following this
once-you've-checked-it-in-you-can't-fix-it stupidity :(

