From: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: linux-next: build failure after merge of the backlight tree
Date: Tue, 18 May 2010 08:54:24 -0700
Message-ID: <1274198064.24454.252.camel@rex>
References: <20100510124304.2249532c.sfr@canb.auug.org.au>
	 <20100517133239.8a30df8e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]:50136 "EHLO
	tim.rpsys.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754493Ab0ERPzw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 11:55:52 -0400
In-Reply-To: <20100517133239.8a30df8e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Michael Hennerich <michael.hennerich@analog.com>, Mike Frysinger <vapier@gentoo.org>

On Mon, 2010-05-17 at 13:32 +1000, Stephen Rothwell wrote:
> On Mon, 10 May 2010 12:43:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the backlight tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/video/backlight/adp8860_bl.c: In function 'adp8860_led_probe':
> > drivers/video/backlight/adp8860_bl.c:215: error: implicit declaration of function 'kzalloc'
> > drivers/video/backlight/adp8860_bl.c:215: warning: assignment makes pointer from integer without a cast
> > drivers/video/backlight/adp8860_bl.c:285: error: implicit declaration of function 'kfree'
> > drivers/video/backlight/adp8860_bl.c: In function 'adp8860_probe':
> > drivers/video/backlight/adp8860_bl.c:673: warning: assignment makes pointer from integer without a cast
> > drivers/video/backlight/adp8860_bl.c:689: error: too few arguments to function 'backlight_device_register'
> > 
> > Caused by commit 6f1a02240dba279a389fd4a4138445bd3f13f67f ("backlight:
> > new driver for the ADP8860 backlight parts").  Use of kzalloc or kfree
> > requires including linux/slab.h (see Rule 1 in
> > Documentation/SubmitChecklist) and the prototype of
> > backlight_device_register changed before v2.6.34-rc2.
> 
> I am still getting these build failures ...

Sorry about that. A bad combination of travel with limited internet
access followed by illness. I've pushed a fix, thanks.

Richard
