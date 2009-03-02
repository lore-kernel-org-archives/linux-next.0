From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: Re: linux-next: Tree for March 2 (wireless/b43)
Date: Mon, 2 Mar 2009 18:17:12 +0100
Message-ID: <200903021817.12441.mb@bu3sch.de>
References: <20090302182217.90ca3356.sfr@canb.auug.org.au> <49AC0FAB.6000604@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49AC0FAB.6000604-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Monday 02 March 2009 17:56:11 Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090227:
> > 
> > Undropped trees:
> > 	wireless
> 
> when CONFIG_SSB_DRIVER_PCICORE=n:
> 
>         if ((bus->bustype == SSB_BUSTYPE_PCI) &&
>             (bus->pcicore.dev->id.revision <= 10))
>                 hf |= B43_HF_PCISCW; /* PCI slow clock workaround. */
> 
> ==>
> drivers/net/wireless/b43/main.c:4182: error: 'struct ssb_pcicore' has no member named 'dev'
> 
> 
> 
> 

I'll send a fix asap.

-- 
Greetings, Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
