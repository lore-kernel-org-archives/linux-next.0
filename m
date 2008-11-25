From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the cputime tree
Date: Tue, 25 Nov 2008 12:00:24 +0100
Message-ID: <1227610824.30264.5.camel@localhost>
References: <20081125202105.2e80cf92.sfr@canb.auug.org.au>
	 <1227607612.4259.1428.camel@twins>  <1227608128.30264.2.camel@localhost>
	 <1227608880.4259.1451.camel@twins>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:32945 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752637AbYKYLD7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 06:03:59 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id mAPB3wWo226186
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 11:03:58 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAPB3vZj1630252
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 12:03:57 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAPB3vDY004420
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 12:03:57 +0100
In-Reply-To: <1227608880.4259.1451.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@elte.hu>

On Tue, 2008-11-25 at 11:28 +0100, Peter Zijlstra wrote:
> On Tue, 2008-11-25 at 11:15 +0100, Martin Schwidefsky wrote:
> > On Tue, 2008-11-25 at 11:06 +0100, Peter Zijlstra wrote:
> > > Why does s390 do its own cpu accounting?
> > 
> > Is that a trick question? I invented the cputime accounting specifically
> > for s390 because it is a virtual architecture and the standard cpu
> > accounting numbers are just useless.
> 
> Nah, just general ignorance brought on by the mondays on a tuesday ;-)

Ah, I usually have this on mondays ..

> Right, makes sense, is it shared with all other virt* folks out there?

Yes, the other virtual architectures have started to use the interface
as well.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
