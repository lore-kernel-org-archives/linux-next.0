From: Dave Hansen <dave@linux.vnet.ibm.com>
Subject: Re: OOM with hackbench against next 0708
Date: Wed, 08 Jul 2009 08:22:29 -0700
Message-ID: <1247066549.14309.1029.camel@nimitz>
References: <20090708173104.d39108bb.sfr@canb.auug.org.au>
	 <4A5499B4.5050007@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:45182 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231AbZGHPWg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2009 11:22:36 -0400
In-Reply-To: <4A5499B4.5050007@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 2009-07-08 at 18:35 +0530, Sachin Sant wrote:
> While executing hackbench against today's next on a 4 way
> power6 box (9117 MMA), the machine crawled within few seconds
> with lots of OOM messages. I captured a Crash dump and was
> able to extract the dmesg log which i have attached here.
> 
> This problem started with 0706 next release. 0703 worked fine.
> 
> Kernel is compiled with SLQB and 64K page size.
> 
> .config attached. Let me know what other information i can
> provide to find a solution for this problem.

This doesn't look like a kernel bug at all to me.  You're out of memory,
out of swap, and the thing that got killed was the thing allocating
memory.  You're also down to 65MB of pagecache, which is awfully low for
a 6GB machine.  That tells me it's also been effective in reclaiming
disk cache.

There are a couple of possibilities:
1. hackbench is broken, allocating too much memory and ooming, or it
   has been misconfigured by a user
2. hackbench broke because something the kernel is telling it is wrong
3. The kernel is leaking (or just plain using) some memory more than a
   few releases ago, and that caused the oom.

I'd go back and carefully examine how hackbench is being run and that it
is consistent.  You should also double-check your finding that the
several-day-old -next isn't seeing this issue.

-- Dave
