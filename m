From: Greg KH <gregkh@suse.de>
Subject: Re: next-20081103: oxu210hp-hcd.c:3849: error: implicit
	declaration of function 'set_irq_type'
Date: Tue, 4 Nov 2008 10:43:34 -0800
Message-ID: <20081104184334.GA1840@suse.de>
References: <20081103183214.aac32543.sfr@canb.auug.org.au> <20081103155047.GA14489@x200.localdomain> <20081104163038.GF32133@tekkaman>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35583 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753952AbYKDTHA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 14:07:00 -0500
Content-Disposition: inline
In-Reply-To: <20081104163038.GF32133@tekkaman>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, Nov 04, 2008 at 05:30:38PM +0100, Rodolfo Giometti wrote:
> On Mon, Nov 03, 2008 at 06:50:47PM +0300, Alexey Dobriyan wrote:
> > On sparc:
> > 
> > drivers/usb/host/oxu210hp-hcd.c:3849: error: implicit declaration of function 'set_irq_type'
> > 
> > and including linux/irq.h doesn't cut it CONFIG_GENERIC_HARDIRQS aren't set.
> 
> Should I force CONFIG_GENERIC_HARDIRQS selection?

Can this hardware work on SPARC?

thanks,

greg k-h
