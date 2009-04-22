From: "Jussi Kivilinna" <jussi.kivilinna-E01nCVcF24I@public.gmane.org>
Subject: Re: linux-next: Tree for April 22 (rndis_wlan)
Date: Thu, 23 Apr 2009 00:08:20 +0300
Message-ID: <20090423000820.82452fzhxxsz1c8w@hayate.sektori.org>
References: <20090422154247.dbffd285.sfr@canb.auug.org.au>
	<49EF4B73.2050702@oracle.com> <20090422172804.GE3288@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090422172804.GE3288-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Quoting "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>:

>> # CONFIG_CFG80211 is not set
>
> No doubt this is the problem...
>
> ---
>
> From bce85c97aeeb9c34098951e9ef3de425c6830b63 Mon Sep 17 00:00:00 2001
> From: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> Date: Wed, 22 Apr 2009 13:27:08 -0400
> Subject: [PATCH] rndis_wlan: select CFG80211 in Kconfig
>
> Signed-off-by: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>

Acked-by: Jussi Kivilinna <jussi.kivilinna-E01nCVcF24I@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
