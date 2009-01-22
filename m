From: Greg KH <greg@kroah.com>
Subject: Re: linux-next:  driver-core.current tree build failure
Date: Thu, 22 Jan 2009 08:08:50 -0800
Message-ID: <20090122160850.GC9047@kroah.com>
References: <20090122173901.1828a3a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:34409 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753291AbZAVQKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 11:10:07 -0500
Content-Disposition: inline
In-Reply-To: <20090122173901.1828a3a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>, Linus <torvalds@linux-foundation.org>

On Thu, Jan 22, 2009 at 05:39:01PM +1100, Stephen Rothwell wrote:
> This has been submitted to Linus stating that it has been in at least one
> linux-next tree.  It has *not* been in linux-next until today (you do
> neither of us a favour by claiming otherwise) and I am reverting it from
> there.

My apologies, I thought it had been in one linux-next by virtue of when
I had checked it into my tree.

I'll go fix this up and kick Inaky the next time I see him for sending
me a untested patch :)

thanks,

greg k-h
