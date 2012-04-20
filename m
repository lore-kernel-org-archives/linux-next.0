From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Thu, 19 Apr 2012 19:19:18 -0700
Message-ID: <20120420021918.GA16697@kroah.com>
References: <20120419144815.50f7c3d30d88e6259665313d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41865 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751372Ab2DTCTV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Apr 2012 22:19:21 -0400
Content-Disposition: inline
In-Reply-To: <20120419144815.50f7c3d30d88e6259665313d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>

On Thu, Apr 19, 2012 at 02:48:15PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> lib/klist.c: In function 'klist_iter_init_node':
> lib/klist.c:287:4: error: too few arguments to function 'kref_put'
> include/linux/kref.h:92:19: note: declared here
> 
> Caused by commit a15d49fd3094 ("driver core: check start node in
> klist_iter_init_node").  That really hasn't been build tested, has it?
> 
> I have used the driver-core tree from next-20120418 for today.

Ok, that was just totally obviously broken, I have no idea how that
passed my testing, as it just failed right now.  So I've reverted it.

Hannes, care to fix this up and resend when it works?

thanks,

greg k-h
