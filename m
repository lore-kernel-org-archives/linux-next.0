From: Greg KH <greg@kroah.com>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Wed, 11 Jun 2008 09:26:39 -0700
Message-ID: <20080611162639.GE22134@kroah.com>
References: <20080610190540.GA25066@kroah.com> <87a5b0800806110345v77529fc8r591f2fb4c95b5bdf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57475 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760983AbYFKQ1v (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 12:27:51 -0400
Content-Disposition: inline
In-Reply-To: <87a5b0800806110345v77529fc8r591f2fb4c95b5bdf@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Newton <will.newton@gmail.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 11:45:55AM +0100, Will Newton wrote:
> 
> Would the linux-staging tree be an appropriate place to merge a new
> architecture? Or would that be too large a change and should go via
> its own tree?

That is probably too big to go into -staging and should deserve its own
tree based on the size of patches that have gone into creating a new
architecture in the past.

Do you have an example of one that is currently not included in the main
kernel tree right now?

thanks,

greg k-h
