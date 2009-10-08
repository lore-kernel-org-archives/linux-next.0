From: Greg KH <greg@kroah.com>
Subject: Changes to gregkh's kernel trees
Date: Thu, 8 Oct 2009 11:41:50 -0700
Message-ID: <20091008184150.GA20399@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56831 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439AbZJHSpD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Oct 2009 14:45:03 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen.

I've added a new tree to my kernel trees, the "staging.current" one.  It
works like the other "usb.current", "tty.current" and others in that it
contains patches from the staging tree that are going to be sent to
Linus for the "current" kernel release.

I've adjusted all of the NEXT_BASE tags in the series files to pull
from, and as always, it can all be found at:
	http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/

If you have any problems with this, please let me know.

thanks, and keep up the great work, it is much appreciated.

greg k-h
