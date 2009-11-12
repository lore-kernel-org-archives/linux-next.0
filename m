From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: -next: Nov 12 - kernel BUG at kernel/sched.c:7359!
Date: Thu, 12 Nov 2009 13:27:11 +0100
Message-ID: <1258028831.4039.152.camel@laptop>
References: <20091112195101.63263490.sfr@canb.auug.org.au>
	 <4AFBF73B.5040500@in.ibm.com> <1258027820.4039.129.camel@laptop>
	 <4AFBFE3D.80507@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41204 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259AbZKLM1P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2009 07:27:15 -0500
In-Reply-To: <4AFBFE3D.80507@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Thu, 2009-11-12 at 17:53 +0530, Sachin Sant wrote:
> > How reproducable is this?
> >   
> I was able to recreate this once out of three tries.
> 
> When i was able to recreate this bug, the box had been
> running for a while and i had executed series of tests
> (kernbench, hackbench, hugetlbfs) before cpu_hotplug.

OK good, its easier to test patches when the thing is relatively easy to
reproduce. I'll send you something to test once I've got a handle on it.

Thanks!
