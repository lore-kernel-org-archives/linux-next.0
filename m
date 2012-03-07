From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: triage for March 6, 2012
Date: Tue, 6 Mar 2012 21:50:55 -0800
Message-ID: <20120307055055.GA8193@kroah.com>
References: <20120307024306.GA18493@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54643 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751806Ab2CGGBC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Mar 2012 01:01:02 -0500
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id D5B532121A
	for <linux-next@vger.kernel.org>; Wed,  7 Mar 2012 01:01:01 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120307024306.GA18493@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 06, 2012 at 09:43:07PM -0500, Paul Gortmaker wrote:
> 
> sparc:allmodconfig
> 	when:	Mar 2, 17:53
> 	why:	drivers/usb/gadget/pch_udc.c: implicit declaration of function 'irq_set_irq_type'
> 	status:	reported by PaulG, WIP by Tomoya MORINAGA 
> 	fix:	
> 	ref:	http://comments.gmane.org/gmane.linux.kernel.next/21060
> ------------------
> 
> sparc64:allmodconfig
> 	when:	Mar 2, 18:51
> 	why:	drivers/usb/gadget/pch_udc.c: implicit declaration of function 'irq_set_irq_type'
> 	status:	reported by PaulG, WIP by Tomoya MORINAGA 
> 	fix:	
> 	ref:	http://comments.gmane.org/gmane.linux.kernel.next/21060

These should both be fixed now, in the next linux-next release, if not,
please let me know.

thanks,

greg k-h
