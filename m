From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 08:16:34 +0200
Message-ID: <20080707061634.GA23191@elte.hu>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au> <20080707060251.GA16144@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49199 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751380AbYGGGQy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:16:54 -0400
Content-Disposition: inline
In-Reply-To: <20080707060251.GA16144@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>


* Ingo Molnar <mingo@elte.hu> wrote:

> Well, it might have made sense a month or two ago, but now we are a 
> week before the merge window so all this does is extra merge 
> complications for me and others. So lets wait a week until 
> tip/core/rcu hits upstream and then all these complications are 
> resolved in one go, ok?

i.e. next time we see this pattern we should just do the header stub (or 
API stub) immediately, upstream.

	Ingo
