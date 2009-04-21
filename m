From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: comedi: Remove useless code
Date: Tue, 21 Apr 2009 15:11:37 -0700
Message-ID: <20090421221137.GA10477@kroah.com>
References: <1237921281-5462-1-git-send-email-abogani@texware.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36032 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756208AbZDUWb4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 18:31:56 -0400
Content-Disposition: inline
In-Reply-To: <1237921281-5462-1-git-send-email-abogani@texware.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alessio Igor Bogani <abogani@texware.it>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, LNML <linux-next@vger.kernel.org>

On Tue, Mar 24, 2009 at 08:01:21PM +0100, Alessio Igor Bogani wrote:
> Remove all code contained into CONFIG_COMEDI_RTAI, CONFIG_COMEDI_RTL,
> CONFIG_COMEDI_RTL_V1, CONFIG_COMEDI_FUSION and CONFIG_COMEDI_RT
> ifdef/endif preprocessor directives. Which all referred to 
> method called "dual kernel approach" (where both a micro kernel OS
> and Linux running on same machine and IRQ dispatching is under the
> control of the first one) for achieve real-time behavior.
> 
> I take notice that:
> 
> 1) Those are all completely undocumented.
> 2) No one express interest in keep those in sync so are unsupported.
> 3) As far I know, and at least for CONFIG_COMEDI_FUSION, are obsolete
>    (FUSION was replaced by Xenomai long time ago).
> 4) Should be  better to let respectively authors make a separate patch
>    against Linux source and comedi drivers.
> 5) Removing those should do avoid confusion in Linux kernel developers.
> 6) Keep those in don't let us chance to break/change the interfaces.
> 7) Those aren't integrated with Kbuild so are useless in any case.
> 8) Removing those make the code more simple.

Can you run this by the other comedi developers?  I think that there is
some useful code in here, I don't want to just dump it all.

thanks,

greg k-h
