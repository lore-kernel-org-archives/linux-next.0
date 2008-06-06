From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 09:17:07 +0200
Message-ID: <20080606071707.GB9708@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54379 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754403AbYFFHR2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 03:17:28 -0400
Content-Disposition: inline
In-Reply-To: <20080605195604.41623687.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Andrew Morton <akpm@linux-foundation.org> wrote:

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

did SLUB change in linux-next? There no such problem in -tip.

> I had to do this:
> 
> --- a/arch/x86/kernel/traps_64.c~a
> +++ a/arch/x86/kernel/traps_64.c
> @@ -504,6 +504,7 @@ void show_registers(struct pt_regs *regs
>  		}
>  	}
>  	printk("\n");
> +	for (  ;; );
>  }	
>  
>  int is_valid_bugaddr(unsigned long ip)
> _
> 
> to collect that oops.  Otherwise it scrolled away due to "trying to 
> kill init" doing a dump_stack.  pause_on_oops seems to not be working 
> properly any more.  It used to.

hm, perhaps mdelay(1) does not loop for 1 msec anymore? You'll probably 
be able to work it around via pause_on_oops=5000000 or so.

	Ingo
