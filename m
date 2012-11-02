From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: Tree for Oct 31 (ehci, dbgp)
Date: Fri, 2 Nov 2012 10:20:27 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1211021019450.1356-100000@iolanthe.rowland.org>
References: <5093E0DF02000078000A6102@nat28.tlf.novell.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:38654 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933602Ab2KBOU2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Nov 2012 10:20:28 -0400
In-Reply-To: <5093E0DF02000078000A6102@nat28.tlf.novell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: sfr@canb.auug.org.au, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

On Fri, 2 Nov 2012, Jan Beulich wrote:

> >>> On 02.11.12 at 15:01, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Thu, 1 Nov 2012, Jan Beulich wrote:
> > 
> >> >>> Alan Stern <stern@rowland.harvard.edu> 11/01/12 9:39 PM >>>
> >> >On Thu, 1 Nov 2012, Jan Beulich wrote:
> >> >> >>> Alan Stern <stern@rowland.harvard.edu> 11/01/12 4:28 PM >>>
> >> >> >Evidently we need to change your new test in
> >> >> >drivers/usb/early/ehci-dbgp.c to:
> >> >> >
> >> >> >#if IS_ENABLED(CONFIG_USB_HCD_EHCI) || defined(CONFIG_USB_CHIPIDEA_HOST)
> >> >> >
> >> >> >Upcoming changes to ehci-hcd will make this unnecessary in 3.8, but for 
> >> >> >now we need it.
> >> >> 
> >> >> Which tells me that the CONFIG_USB_SUPPORT version would have been
> >> >> the better one  (and I would favor that over the ugly variant you suggest
> >> >> above).
> >> >
> >> >I also suggested IS_ENABLED(CONFIG_USB), which is no uglier than what 
> >> >you submitted and would also fix this build error.  How about using it 
> >> >instead?
> >> 
> >> Yes, that's better. Question then is - updated original patch or incremental 
> > one?
> > 
> > Greg will probably want an incremental patch, because the original has 
> > already been merged.
> 
> I actually sent both (the incremental as attachment - I hope that's
> going to be acceptable to him) in a submission earlier today.

Ah, okay, good.

Greg, whichever version you take, you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>
