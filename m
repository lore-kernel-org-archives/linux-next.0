From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for March 2 (wireless/b43)
Date: Mon, 02 Mar 2009 08:56:11 -0800
Message-ID: <49AC0FAB.6000604@oracle.com>
References: <20090302182217.90ca3356.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090302182217.90ca3356.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090227:
> 
> Undropped trees:
> 	wireless

when CONFIG_SSB_DRIVER_PCICORE=n:

        if ((bus->bustype == SSB_BUSTYPE_PCI) &&
            (bus->pcicore.dev->id.revision <= 10))
                hf |= B43_HF_PCISCW; /* PCI slow clock workaround. */

==>
drivers/net/wireless/b43/main.c:4182: error: 'struct ssb_pcicore' has no member named 'dev'


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
