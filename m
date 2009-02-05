From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: acpi tree build failure
Date: Wed, 4 Feb 2009 21:00:56 -0800
Message-ID: <20090205050056.GA7651@kroah.com>
References: <20090202132254.456b7725.sfr@canb.auug.org.au> <20090205131340.edc6e6a8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:34377 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752963AbZBEFju (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 00:39:50 -0500
Content-Disposition: inline
In-Reply-To: <20090205131340.edc6e6a8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Kay Sievers <kay.sievers@vrfy.org>

On Thu, Feb 05, 2009 at 01:13:40PM +1100, Stephen Rothwell wrote:
> Greg, Len,
> 
> On Mon, 2 Feb 2009 13:22:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > drivers/platform/x86/oqo-wmi.c: In function 'oqo_kine_init':
> > drivers/platform/x86/oqo-wmi.c:595: error: 'struct device' has no member named 'bus_id'
> > 
> > Caused by commit 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86:
> > Add oqo-wmi driver for model 2 OQO backlight and rfkill control")
> > interacting with commit c44c8304353aa6da82cbf98040c6a9c254e68e1c ("driver
> > core: get rid of struct device's bus_id string array") from the
> > driver-core tree.
> 
> Still getting this (of course).  Can you guys come up with a fix, please?

Len, you have the patch from Kay, what do you want to do with it?

thanks,

greg k-h
