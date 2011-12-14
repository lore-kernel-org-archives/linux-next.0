From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: linux-next: Tree for Dec 14 (phy vs. bcma)
Date: Wed, 14 Dec 2011 15:08:41 -0500
Message-ID: <20111214200841.GC2607@tuxdriver.com>
References: <20111214182643.06262d032298672024ba8a76@canb.auug.org.au>
 <4EE90EB1.4060903@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EE90EB1.4060903-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 14, 2011 at 01:01:37PM -0800, Randy Dunlap wrote:
> On 12/13/2011 11:26 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20111213:
> 
> 
> drivers/built-in.o: In function `b43_nphy_pmu_spur_avoid.clone.8':
> phy_n.c:(.text+0x1589d8): undefined reference to `bcma_chipco_pll_write'
> phy_n.c:(.text+0x1589e9): undefined reference to `bcma_chipco_pll_write'
> phy_n.c:(.text+0x1589fa): undefined reference to `bcma_chipco_pll_write'
> phy_n.c:(.text+0x158a08): undefined reference to `bcma_chipco_pll_write'
> phy_n.c:(.text+0x158a1d): undefined reference to `bcma_chipco_pll_write'
> drivers/built-in.o:phy_n.c:(.text+0x158a2e): more undefined references to `bcma_chipco_pll_write' follow
> 
> 
> BCMA is not enabled.
> Full randconfig file is attached.

I've already merged a patch to address this.

Thanks,

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
