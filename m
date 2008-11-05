From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: next-20081103: oxu210hp-hcd.c:3849: error: implicit
	declaration of function 'set_irq_type'
Date: Wed, 5 Nov 2008 11:50:24 +0300
Message-ID: <20081105085024.GA3570@x200.localdomain>
References: <20081103183214.aac32543.sfr@canb.auug.org.au> <20081103155047.GA14489@x200.localdomain> <20081104163038.GF32133@tekkaman>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:57283 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753865AbYKEIrP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 03:47:15 -0500
Content-Disposition: inline
In-Reply-To: <20081104163038.GF32133@tekkaman>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@suse.de

On Tue, Nov 04, 2008 at 05:30:38PM +0100, Rodolfo Giometti wrote:
> On Mon, Nov 03, 2008 at 06:50:47PM +0300, Alexey Dobriyan wrote:
> > On sparc:
> > 
> > drivers/usb/host/oxu210hp-hcd.c:3849: error: implicit declaration of function 'set_irq_type'
> > 
> > and including linux/irq.h doesn't cut it CONFIG_GENERIC_HARDIRQS aren't set.
> 
> Should I force CONFIG_GENERIC_HARDIRQS selection?

Of course, no!
