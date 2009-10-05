From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 5 (comedi)
Date: Mon, 5 Oct 2009 16:41:54 -0700
Message-ID: <20091005234154.GB13211@kroah.com>
References: <20091005190324.7013a4bb.sfr@canb.auug.org.au>
 <20091005162115.8ac01e9f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41204 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755399AbZJEXnA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2009 19:43:00 -0400
Content-Disposition: inline
In-Reply-To: <20091005162115.8ac01e9f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 05, 2009 at 04:21:15PM -0700, Randy Dunlap wrote:
> On Mon, 5 Oct 2009 19:03:24 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091002:
> 
> 
> 
> drivers/staging/comedi/drivers/serial2002.c: In function 'tty_read':
> drivers/staging/comedi/drivers/serial2002.c:201: error: implicit declaration of function 'set_current_state'
> drivers/staging/comedi/drivers/serial2002.c:201: error: 'TASK_INTERRUPTIBLE' undeclared (first use in this function)
> drivers/staging/comedi/drivers/serial2002.c:201: error: (Each undeclared identifier is reported only once
> drivers/staging/comedi/drivers/serial2002.c:201: error: for each function it appears in.)
> drivers/staging/comedi/drivers/serial2002.c:202: error: implicit declaration of function 'schedule_timeout'
> make[5]: *** [drivers/staging/comedi/drivers/serial2002.o] Error 1

I have a patch for this in my tree right now, will show up in linux-next
tomorrow.

thanks,

greg k-h
