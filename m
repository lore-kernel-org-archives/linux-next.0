From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for June 5
Date: Thu, 5 Jun 2008 20:46:02 -0700
Message-ID: <20080605204602.0703124f.akpm@linux-foundation.org>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au>
	<20080605195604.41623687.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38247 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754618AbYFFDqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jun 2008 23:46:22 -0400
In-Reply-To: <20080605195604.41623687.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On Thu, 5 Jun 2008 19:56:04 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Thu, 5 Jun 2008 17:52:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> 
> Instantly oopses on two x86_64 boxes with this config:
> http://userweb.kernel.org/~akpm/config-akpm2.txt
> 
> oops: http://userweb.kernel.org/~akpm/p6056454.jpg
> 
> At a guess I'd say the sched_domains code is calling into slab before
> slab is initalised.  Something like that.

With CONFIG_SLUB=y it dies differently:

http://userweb.kernel.org/~akpm/p6056455.jpg
