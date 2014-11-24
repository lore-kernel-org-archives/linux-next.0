From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [-next] cpu cache info in drivers base?
Date: Mon, 24 Nov 2014 09:33:57 -0800
Message-ID: <20141124173357.GA27211@kroah.com>
References: <20141124150048.GD3738@osiris>
 <5473577B.6010708@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53605 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754107AbaKXRd6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2014 12:33:58 -0500
Content-Disposition: inline
In-Reply-To: <5473577B.6010708@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Nov 24, 2014 at 04:06:19PM +0000, Sudeep Holla wrote:
> Hi Heiko,
> 
> On 24/11/14 15:00, Heiko Carstens wrote:
> >Hi there,
> >
> >I'm just wondering what the point of the current cpu cache info
> >within drivers/base is?
> >If I startup linux-next (as of today) all I get is an error message
> >"error detecting cacheinfo..cpu0".
> 
> That's correct, I did post a patch[1] to suppress that given not all
> architectures might add support.
> 
> >Which naturally comes from:
> >
> >int __weak init_cache_level(unsigned int cpu)
> >{
> >	return -ENOENT;
> >}
> >
> >Given that there is no implementation without __weak I'm wondering
> >what the point is? Also it looks like no architecture has been
> >converted to the new infrastructure, even though such patches have
> >been posted in the past?
> 
> Yes, I asked Greg to hold off on the architecture patches for next
> versions as there may be conflicts(though we can have solve it using
> a common baseline, but I thought it was too late to try that). Also
> I have not got testing on few other architectures(ppc, ia64, amd). I
> will post those patches individually on respective arch lists and
> chase after the v3.19-rc1 release. Is that OK ?

Sorry for the delay, that patch is now applied.

greg k-h
