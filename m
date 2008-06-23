From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: s390 build failure
Date: Mon, 23 Jun 2008 15:13:03 -0700
Message-ID: <20080623221303.GA16460@kroah.com>
References: <20080620135257.102f024c.sfr@canb.auug.org.au> <20080620095843.271c20e8@gondolin.boeblingen.de.ibm.com> <20080623172226.08baece9@gondolin.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:50026 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751948AbYFWWPO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 18:15:14 -0400
Content-Disposition: inline
In-Reply-To: <20080623172226.08baece9@gondolin.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, Jun 23, 2008 at 05:22:26PM +0200, Cornelia Huck wrote:
> On Fri, 20 Jun 2008 09:58:43 +0200,
> Cornelia Huck <cornelia.huck@de.ibm.com> wrote:
> 
> > I could also try to split out
> > dev_set_name() conversion from the init_name stuff, but I fear that
> > doesn't make much sense...
> 
> Well, so I did just that... I'll reply to this mail with two patches:
> 
> - "s390: bus_id -> dev_set_name() changes" should replace the patch of
> the same title. It removes the dependency on init_name.
> 
> - "s390: bus_id -> dev_set_name() for css and ccw busses" should go
> after "driver core: add init_name to struct device". It depends on
> init_name and consequently should be commented out until that patch is
> re-activated.
> 
> Greg: Could you please add these to your tree?

I've now done so, thanks for sending them to me.

greg k-h
