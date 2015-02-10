From: Greg KH <gregkh@linuxfoundation.org>
Subject: Heads-up, last minutes changes in staging and tty trees.
Date: Tue, 10 Feb 2015 16:51:33 +0800
Message-ID: <20150210085133.GA12902@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35019 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730AbbBJIvi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2015 03:51:38 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

I just realized that I hadn't pushed two of my trees into the branches
that you pull from until right now.  So be prepared to see additional
staging and tty patches show up in the next linux-next.  These are all
patches that are just basic cleanups / coding style stuff (staging
tree), or a new stand-alone serial driver (tty tree) and will be going
to Linus for the 3.20-rc1 merge window.

These have survived the 0-day bot just fine, so I feel comfortable with
a lack of build issues, but I'll wait a week just to be sure.

Sorry about this,

greg k-h
