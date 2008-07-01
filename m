From: Oliver Neukum <oliver@neukum.org>
Subject: Re: linux-next: Tree for June 30 (USB: cdc-acm)
Date: Tue, 1 Jul 2008 14:22:45 +0200
Message-ID: <200807011422.46604.oliver@neukum.org>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <20080630114332.b797e5e4.randy.dunlap@oracle.com> <20080630190125.GA3553@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out003.kontent.com ([81.88.40.217]:48398 "EHLO
	smtp-out003.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756801AbYGAMW0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 08:22:26 -0400
In-Reply-To: <20080630190125.GA3553@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Alan Stern <stern@rowland.harvard.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Montag 30 Juni 2008 21:01:25 schrieb Greg KH:
> On Mon, Jun 30, 2008 at 11:43:32AM -0700, Randy Dunlap wrote:
> > cdc-acm fails to build when CONFIG_PM=n:
> > 
> > linux-next-20080630/drivers/usb/class/cdc-acm.c: In function 'acm_suspend':
> > linux-next-20080630/drivers/usb/class/cdc-acm.c:1263: error: 'struct usb_device' has no member named 'auto_pm'
> > make[4]: *** [drivers/usb/class/cdc-acm.o] Error 1
> 
> Yeah, known issue due to the pm and usb trees conflicting here.  It will
> be fixed up at the merge time with Linus.
> 
> Or so Alan promises :)

No, I caused this. It'll require some #ifdefs. A patch is compiling.

	Regards
		Oliver
