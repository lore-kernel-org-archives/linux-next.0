From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] usb: xhci depends on PCI.
Date: Thu, 30 Apr 2009 09:13:14 -0700
Message-ID: <20090430161314.GB18495@kroah.com>
References: <20090430083002.GA11456@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:52219 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752901AbZD3QQp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 12:16:45 -0400
Content-Disposition: inline
In-Reply-To: <20090430083002.GA11456@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Apr 30, 2009 at 05:30:02PM +0900, Paul Mundt wrote:
> While it looks like xhci was written with both PCI and non-PCI in mind,
> apparently only the former has seen any testing. xhci-mem.o can be "fixed"
> with a linux/dmapool.h include, but there are still parts of the code that
> make use of struct pci_dev directly. So, at least more work is needed before
> this can be turned on for non-PCI builds:

Thanks, you are correct.  I'll apply your Kconfig fix, thanks for making
it up.

greg k-h
