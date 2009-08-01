From: Greg KH <greg@kroah.com>
Subject: tty tree change for linux-next
Date: Fri, 31 Jul 2009 21:39:05 -0700
Message-ID: <20090801043905.GA12779@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40702 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbZHAEkZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 1 Aug 2009 00:40:25 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

I've now merged Alan's tty tree into my patch trees, and I'd like to ask
for linux-next to pick them up.

They are contained within the same directory as my other trees (staging,
usb, driver-core), and conviently named "tty.current" and "tty", and can
be found at:
	http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/
As you can see by the nameing in the above directory, the usb and
staging trees changed names by virtue of putting the tty tree ahead of
them.  Your scripts might need adjusting for this.

If there are any problems with the trees, please let me know.

thanks,

greg k-h
