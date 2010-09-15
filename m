From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build warnings after merge of the final tree (tip
 treee related)
Date: Wed, 15 Sep 2010 11:25:32 +0200
Message-ID: <20100915092532.GH16593@elte.hu>
References: <20100913132721.5a02cfbc.sfr@canb.auug.org.au>
 <4C8DA517.9000603@kernel.org>
 <20100913143942.7344ada4.sfr@canb.auug.org.au>
 <4C8DDFB4.1020508@kernel.org>
 <20100914145025.977ec2a6.sfr@canb.auug.org.au>
 <4C8FFE76.8070801@kernel.org>
 <20100915150047.42551e34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54015 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752094Ab0IOJZt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Sep 2010 05:25:49 -0400
Content-Disposition: inline
In-Reply-To: <20100915150047.42551e34.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yinghai Lu <yinghai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Yinghai,
> 
> On Tue, 14 Sep 2010 16:00:06 -0700 Yinghai Lu <yinghai@kernel.org> wrote:
> >
> > Also, we may need to remove all extern and __init and __initdata etc in .h files.
> > 
> > please check
> > 
> > [PATCH -v3] memblock: Fix section mismatch warning
> > 
> > Use __init_memblock to replace __init, and remove __init in memblock.h
> > 
> > -v2: more with memblock_is_meory()
> > -v3: remove __init for function declaring in memblock.h. Pointed out by Stephen.
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Yinghai Lu <Yinghai@kernel.org>
> 
> This version fixes all the warnings for me.  So if you put the "extern"s
> back, you can add:
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

Yinghai, mind posting the final version of the patch as a standalone 
posting, with a proper changelog, and with the extern issue fixed as 
well, plus all Reported-by and Tested-by tags added?

Thanks,

	Ingo
