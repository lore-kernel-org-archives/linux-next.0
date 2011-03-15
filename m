From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: Tree for March 15 (xen/events.c)
Date: Tue, 15 Mar 2011 16:45:07 -0400
Message-ID: <20110315204507.GA11472@dumpdata.com>
References: <20110315194543.a5d56c0c.sfr@canb.auug.org.au>
 <20110315084429.465cea61.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110315084429.465cea61.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 15, 2011 at 08:44:29AM -0700, Randy Dunlap wrote:
> On Tue, 15 Mar 2011 19:45:43 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110314:
> > 
> > Dropped tree: xen
> 
> 
> Hm, maybe this is already fixed in the dropped tree?

Nope..
> 
> linux-next-20110315/drivers/xen/events.c:396: error: 'struct irq_data' has no member named 'affinity'
> 
> when CONFIG_SMP is not enabled.

but I got a fixed queue up in xen-two. Thanks for pointing this out!
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
