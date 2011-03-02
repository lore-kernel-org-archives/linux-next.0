From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] staging/brcm80211: fix printk format warnings
Date: Wed, 2 Mar 2011 16:02:29 -0500
Message-ID: <20110302210229.GB20522@kroah.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
 <20110301162948.34c28d6e.randy.dunlap@oracle.com>
 <4D6E4F18.4060505@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54647 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757122Ab1CBVJr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2011 16:09:47 -0500
Content-Disposition: inline
In-Reply-To: <4D6E4F18.4060505@broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Vossen <rvossen@broadcom.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "gregkh@suse.de" <gregkh@suse.de>, driverdevel <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arend Van Spriel <arend@broadcom.com>

On Wed, Mar 02, 2011 at 03:07:20PM +0100, Roland Vossen wrote:
> >drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:1379: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> >drivers/staging/brcm80211/sys/wl_mac80211.c:1827: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> >drivers/staging/brcm80211/sys/wl_mac80211.c:1832: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> >
> >Signed-off-by: Randy Dunlap<randy.dunlap@oracle.com>
> 
> Acked-by: Roland Vossen<rvossen@broadcom.com>

Please note you need a ' ' before the '<' character.  I'm getting tired
of adding it myself :)

thanks,

greg k-h
