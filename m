From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 18 Nov 2008 22:55:55 -0800
Message-ID: <20081119065555.GA4853@kroah.com>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au> <20081119164317.9bfff78d.sfr@canb.auug.org.au> <20081119062644.GB4444@kroah.com> <20081119175112.416adc24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60156 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751769AbYKSHAF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 02:00:05 -0500
Content-Disposition: inline
In-Reply-To: <20081119175112.416adc24.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Wed, Nov 19, 2008 at 05:51:12PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 18 Nov 2008 22:26:44 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > Right now there is no such dependancy (USB should build and apply just
> > fine without driver core, and staging depends on neither of these from
> > what I can see.)
> 
> The real problem is that because you tell me that usb is based on
> driver-core, then if I merge the usb tree it will pull in all of
> driver-core again after I have dropped it.  So if the trees are really
> independent, you could change (or remove) the NEXT-BASE comment in the
> series files.  But that means that you do have to test them independently
> as well, so it is probably not worth the effort.

Yeah, for now, it's fine, no big deal, I can live with being dropped for
a day :)

thanks,

greg k-h
