From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: Tree for January 22 (staging/android)
Date: Thu, 22 Jan 2009 14:18:49 -0800
Message-ID: <20090122221849.GA30477@suse.de>
References: <20090122180543.1ab0baa6.sfr@canb.auug.org.au> <4978A9D0.2050103@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54864 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752571AbZAVWsF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 17:48:05 -0500
Content-Disposition: inline
In-Reply-To: <4978A9D0.2050103@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Jan 22, 2009 at 09:16:00AM -0800, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090121:
> 
> drivers/staging/android/timed_gpio.c: In function 'gpio_enable_show':
> drivers/staging/android/timed_gpio.c:52: error: 'ktime_t' has no member named 'tv'
> drivers/staging/android/timed_gpio.c:52: error: 'ktime_t' has no member named 'tv'

Is this due to a change in -next?  I see 'tv' as a valid field in
kime_t in Linus's tree.

confused,

greg k-h
