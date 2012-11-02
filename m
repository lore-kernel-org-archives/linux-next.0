From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: linux-next: Tree for Oct 31 (ehci, dbgp)
Date: Fri, 02 Nov 2012 14:03:59 +0000
Message-ID: <5093E0DF02000078000A6102@nat28.tlf.novell.com>
References: <5092E058020000780008EBA2@nat28.tlf.novell.com>
 <Pine.LNX.4.44L0.1211021001060.1356-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:55309 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762804Ab2KBODV convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-next@vger.kernel.org:5:2>);
	Fri, 2 Nov 2012 10:03:21 -0400
In-Reply-To: <Pine.LNX.4.44L0.1211021001060.1356-100000@iolanthe.rowland.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: sfr@canb.auug.org.au, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

>>> On 02.11.12 at 15:01, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Thu, 1 Nov 2012, Jan Beulich wrote:
> 
>> >>> Alan Stern <stern@rowland.harvard.edu> 11/01/12 9:39 PM >>>
>> >On Thu, 1 Nov 2012, Jan Beulich wrote:
>> >> >>> Alan Stern <stern@rowland.harvard.edu> 11/01/12 4:28 PM >>>
>> >> >Evidently we need to change your new test in
>> >> >drivers/usb/early/ehci-dbgp.c to:
>> >> >
>> >> >#if IS_ENABLED(CONFIG_USB_HCD_EHCI) || defined(CONFIG_USB_CHIPIDEA_HOST)
>> >> >
>> >> >Upcoming changes to ehci-hcd will make this unnecessary in 3.8, but for 
>> >> >now we need it.
>> >> 
>> >> Which tells me that the CONFIG_USB_SUPPORT version would have been
>> >> the better one  (and I would favor that over the ugly variant you suggest
>> >> above).
>> >
>> >I also suggested IS_ENABLED(CONFIG_USB), which is no uglier than what 
>> >you submitted and would also fix this build error.  How about using it 
>> >instead?
>> 
>> Yes, that's better. Question then is - updated original patch or incremental 
> one?
> 
> Greg will probably want an incremental patch, because the original has 
> already been merged.

I actually sent both (the incremental as attachment - I hope that's
going to be acceptable to him) in a submission earlier today.

Jan
