From: Davidlohr Bueso <davidlohr@hp.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 13 Jan 2014 21:04:07 -0800
Message-ID: <1389675847.4971.6.camel@buesod1.americas.hpqcorp.net>
References: <20140114155331.88d170d3c991b9465c23a537@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0027.austin.hp.com ([15.216.28.34]:4803 "EHLO
	g1t0027.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbaANFEX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2014 00:04:23 -0500
In-Reply-To: <20140114155331.88d170d3c991b9465c23a537@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, 2014-01-14 at 15:53 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> kernel/futex.c between commit a52b89ebb6d4 ("futexes: Increase hash table
> size for better performance") from the tip tree and commit 61beee6c76e5
> ("futex: switch to USER_DS for futex test") from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen. At least for my bits the fix seems ok. In the future,
though, changes to this evil file should be routed only through one
tree.

Thanks,
Davidlohr
