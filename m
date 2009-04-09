From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 9 Apr 2009 07:53:56 +0200
Message-ID: <20090409055356.GJ5352@elte.hu>
References: <20090409052717.GF5352@elte.hu> <20090408.222845.176097923.davem@davemloft.net> <20090409053630.GH5352@elte.hu> <20090408.224021.72200654.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54670 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbZDIFyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 01:54:25 -0400
Content-Disposition: inline
In-Reply-To: <20090408.224021.72200654.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com


* David Miller <davem@davemloft.net> wrote:

> From: Ingo Molnar <mingo@elte.hu>
> Date: Thu, 9 Apr 2009 07:36:30 +0200
> 
> > Would it be possible for you to reserve the extra futex related 
> > pointer right now? (or is that not possible without changing the 
> > restart block in linux/thread_info.h?)
> 
> What are my real options?
> 
> No matter what, once you change the size of "struct restart_block" 
> the sparc64 build will fail, no matter what.
> 
> The only way around this is if you merge the thing that changes 
> the "struct restart_block"'s size to Linus now along with the 
> sparc64 change at the same time.
> 
> But then I have a merge issue I have to resolve in the sparc64 
> tree because I've already pushed out my dynamic per-cpu work
> :-/

We could create a standalone, .30-rc1 based topic for the 
linux/thread_info.h change only, and push it to Linus, and/or you 
could pull it into the Sparc tree?

	Ingo
