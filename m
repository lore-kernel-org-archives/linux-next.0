From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 20 Jul 2017 10:19:02 +0200
Message-ID: <20170720081902.GB11963@kroah.com>
References: <20170719130728.3adcae81@canb.auug.org.au>
 <20170719060702.GA9423@kroah.com>
 <1472208905.102271.1500453043823@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472208905.102271.1500453043823@ox.hosteurope.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 19, 2017 at 10:30:43AM +0200, Marcus Wolf wrote:
> Hi Greg,
>  
> I am surprised and happy about getting all the feedback and ideas how to
> improve. Wow!
>  
> Can you tell me, how this is going on? Do I need to collect all those patches,
> evaluate and test them or is it done automatically?

If you want to collect and test, that's great, otherwise I'll just take
them like any other staging patch and apply them to my tree.  If you can
review them and reply with a:
	Reviewed-by: your name <email@...>
I'll be glad to add that to the patches when I apply them.

> Concerning the error on M68k and the warning on sh I have an idea, but I am not
> 100% sure how to fix that. If I need to find a solution I would appreciate
> having the option to have a short discusion with someone a little bit more
> experienced....

I don't remember what the warning is, perhaps respond to the thread that
it showed up in?

thanks,

greg k-h
