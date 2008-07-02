From: Greg KH <greg@kroah.com>
Subject: Re: dev_name, dev_set_name conversions
Date: Wed, 2 Jul 2008 08:52:14 -0700
Message-ID: <20080702155214.GB29583@kroah.com>
References: <20080626160328.8ec34a28.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:51015 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757970AbYGBPyO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 11:54:14 -0400
Content-Disposition: inline
In-Reply-To: <20080626160328.8ec34a28.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org

On Thu, Jun 26, 2008 at 04:03:28PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Given that simple implementations of dev_name and dev_set_name now exist
> in Linus' tree, is there any reason that these conversion patches cannot
> go via the respective subsystem trees?  This would reduce the number of
> conflicts in the linux-next tree (and presumably in the next merge window
> for Linus).
> 
> Even if they were in both your tree and the subsystem trees, I think the
> conflicts would be less.

I agree, I've just now sent all of the ones that I had left in my tree
to the respective subsystem maintainers.

thanks,

greg k-h
