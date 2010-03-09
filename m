From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH] i2c: update for semaphore to mutex conversion of
 devices
Date: Tue, 9 Mar 2010 11:39:50 +0100
Message-ID: <20100309113950.48be08a1@hyperion.delvare>
References: <20100309102828.18351564.sfr@canb.auug.org.au>
	<20100309092508.02b7b2e8@hyperion.delvare>
	<20100309213650.e22c9908.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:62152 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751320Ab0CIKjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Mar 2010 05:39:53 -0500
In-Reply-To: <20100309213650.e22c9908.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Tue, 9 Mar 2010 21:36:50 +1100, Stephen Rothwell wrote:
> Hi Jean,
> 
> On Tue, 9 Mar 2010 09:25:08 +0100 Jean Delvare <khali@linux-fr.org> wrote:
> >
> > Thanks for the reminder Stephen. I was only waiting for device_lock()
> > to become usable in mainline. Now that it happened, I will take the
> > patch above in my i2c tree, and send it to Linus in my next batch.
> 
> Thanks.  The include of mutex.h is not actually needed yet as Greg didn't
> send the semaphore to mutex change to Linus due to other issues.

It will never be needed, and I also removed the include of semaphore.h.
The beauty of the new API is that it hides the implementation details
from the caller!

>  The
> device_lock/unlock part would be useful, though for when the change does
> happen.

Of course.

-- 
Jean Delvare
