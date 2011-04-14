From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Thu, 14 Apr 2011 11:02:50 +0200
Message-ID: <1302771770.2388.131.camel@twins>
References: <20110414131440.fb8dc3ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53141 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932181Ab1DNJDO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2011 05:03:14 -0400
In-Reply-To: <20110414131440.fb8dc3ad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2011-04-14 at 13:14 +1000, Stephen Rothwell wrote:
> 
> Today's linux-next merge of the tip tree got a conflict in kernel/sched.c
> between commit 6631e635c65d ("block: don't flush plugged IO on forced
> preemtion scheduling") from Linus' tree and commits 098247b90a9e ("sched:
> Provide p->on_rq") and a3380736e4b3 ("sched: Also serialize ttwu_local()
> with p->pi_lock") from the tip tree.
> 
> I fixed them up (hopefully - see below) and can carry the fix as
> necessary. 

It looks like Ingo accidentially published an older version of these
patches because I also got a UP build error from Tony yesterday.

A new series was merged this morning which should hopefully address both
problems.
