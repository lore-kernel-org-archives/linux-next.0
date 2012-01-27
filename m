From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Fri, 27 Jan 2012 14:36:28 -0800
Message-ID: <20120127223628.GA4358@kroah.com>
References: <20120127135912.e5f45bf1c4a99b114c18bf72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43816 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751688Ab2A0Wgr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jan 2012 17:36:47 -0500
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id F1A562069F
	for <linux-next@vger.kernel.org>; Fri, 27 Jan 2012 17:36:46 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120127135912.e5f45bf1c4a99b114c18bf72@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, "David S. Miller" <davem@davemloft.net>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Michael Buesch <m@bues.ch>, Joerg Roedel <joerg.roedel@amd.com>

On Fri, Jan 27, 2012 at 01:59:12PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/pci/xen-pcifront.c: In function 'pcifront_common_process':
> drivers/pci/xen-pcifront.c:596:6: error: used struct type value where scalar is required
> 
> Caused by commit f3ff9247088a ("Remove useless get_driver()/put_driver()
> calls").
> 
> Please build test this stuff ...

Sorry, I do build test this, but I didn't have Xen enabled in that
.config as I never run Xen :)

I'll queue up Alan's patch so all should be good now.

thanks,

greg k-h
