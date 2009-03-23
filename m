From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH] p54: fix SoftLED compile dependencies
Date: Mon, 23 Mar 2009 10:13:20 -0400
Message-ID: <20090323141320.GC3285@tuxdriver.com>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <200903210057.47067.chunkeey@web.de> <87eiwre61a.fsf@litku.valot.fi> <200903211322.01654.chunkeey@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200903211322.01654.chunkeey-S0/GAf8tV78@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-S0/GAf8tV78@public.gmane.org>
Cc: Kalle Valo <kalle.valo-X3B1VOXEql0@public.gmane.org>, Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Sat, Mar 21, 2009 at 01:22:01PM +0100, Christian Lamparter wrote:
> On Saturday 21 March 2009 07:36:33 Kalle Valo wrote:
> > Christian Lamparter <chunkeey-S0/GAf8tV78@public.gmane.org> writes:
> > 
> > > This patch fixes a compile problem when the MAC80211_LEDS
> > > triggers are enabled but not LED class itself. 
> > > (which is sort of pointless, but anyway...)
> > 
> > [...]
> > 
> > > @@ -17,31 +18,6 @@ config P54_USB
> > >  	select CRC32
> > >  	---help---
> > >  	  This driver is for USB isl38xx based wireless cards.
> > > -	  These are USB based adapters found in devices such as:
> > > -
> > > -	  3COM 3CRWE254G72
> > > -	  SMC 2862W-G
> > > -	  Accton 802.11g WN4501 USB
> > > -	  Siemens Gigaset USB
> > > -	  Netgear WG121
> > > -	  Netgear WG111
> > > -	  Medion 40900, Roper Europe
> > > -	  Shuttle PN15, Airvast WM168g, IOGear GWU513
> > > -	  Linksys WUSB54G
> > > -	  Linksys WUSB54G Portable
> > > -	  DLink DWL-G120 Spinnaker
> > > -	  DLink DWL-G122
> > > -	  Belkin F5D7050 ver 1000
> > > -	  Cohiba Proto board
> > > -	  SMC 2862W-G version 2
> > > -	  U.S. Robotics U5 802.11g Adapter
> > > -	  FUJITSU E-5400 USB D1700
> > > -	  Sagem XG703A
> > > -	  DLink DWL-G120 Cohiba
> > > -	  Spinnaker Proto board
> > > -	  Linksys WUSB54AG
> > > -	  Inventel UR054G
> > > -	  Spinnaker DUT
> > 
> > This change wasn't mentioned in the commit log. Did this get included
> > by accident?
> > 
> heh true... should I add them back? after all this list hasn't changed in years
> and we have a much nicer one on http://www.prism54.org/
> ( http://wireless.kernel.org/en/users/Drivers/p54/devices )

Getting rid of them is fine, but it should probably be done in a different patch.

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
