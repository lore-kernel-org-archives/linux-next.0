From: Christian Lamparter <chunkeey@web.de>
Subject: Re: [PATCH] p54: fix SoftLED compile dependencies
Date: Sat, 21 Mar 2009 13:22:01 +0100
Message-ID: <200903211322.01654.chunkeey@web.de>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <200903210057.47067.chunkeey@web.de> <87eiwre61a.fsf@litku.valot.fi>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fmmailgate03.web.de ([217.72.192.234]:47144 "EHLO
	fmmailgate03.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428AbZCUMWG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Mar 2009 08:22:06 -0400
In-Reply-To: <87eiwre61a.fsf@litku.valot.fi>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kalle.valo@iki.fi>
Cc: Michael Buesch <mb@bu3sch.de>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

On Saturday 21 March 2009 07:36:33 Kalle Valo wrote:
> Christian Lamparter <chunkeey@web.de> writes:
> 
> > This patch fixes a compile problem when the MAC80211_LEDS
> > triggers are enabled but not LED class itself. 
> > (which is sort of pointless, but anyway...)
> 
> [...]
> 
> > @@ -17,31 +18,6 @@ config P54_USB
> >  	select CRC32
> >  	---help---
> >  	  This driver is for USB isl38xx based wireless cards.
> > -	  These are USB based adapters found in devices such as:
> > -
> > -	  3COM 3CRWE254G72
> > -	  SMC 2862W-G
> > -	  Accton 802.11g WN4501 USB
> > -	  Siemens Gigaset USB
> > -	  Netgear WG121
> > -	  Netgear WG111
> > -	  Medion 40900, Roper Europe
> > -	  Shuttle PN15, Airvast WM168g, IOGear GWU513
> > -	  Linksys WUSB54G
> > -	  Linksys WUSB54G Portable
> > -	  DLink DWL-G120 Spinnaker
> > -	  DLink DWL-G122
> > -	  Belkin F5D7050 ver 1000
> > -	  Cohiba Proto board
> > -	  SMC 2862W-G version 2
> > -	  U.S. Robotics U5 802.11g Adapter
> > -	  FUJITSU E-5400 USB D1700
> > -	  Sagem XG703A
> > -	  DLink DWL-G120 Cohiba
> > -	  Spinnaker Proto board
> > -	  Linksys WUSB54AG
> > -	  Inventel UR054G
> > -	  Spinnaker DUT
> 
> This change wasn't mentioned in the commit log. Did this get included
> by accident?
> 
heh true... should I add them back? after all this list hasn't changed in years
and we have a much nicer one on http://www.prism54.org/
( http://wireless.kernel.org/en/users/Drivers/p54/devices )

Regards,
	Chr
