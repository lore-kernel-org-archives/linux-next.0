From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [BUILD FAILURE 04] Next April 9 : PPC64 randconfig [drivers/net/ibm_newemac/core.c]
Date: Thu, 9 Apr 2009 09:28:23 -0500
Message-ID: <BE92FB74-1784-414B-B27F-8329185EB3AE@kernel.crashing.org>
References: <1239285152.5188.66.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset=WINDOWS-1252;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <1239285152.5188.66.camel@subratamodak.linux.ibm.com>
Sender: linux-net-owner@vger.kernel.org
To: subrata@linux.vnet.ibm.com
Cc: Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-net@vger.kernel.org, Greg KH <greg@kroah.com>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org


On Apr 9, 2009, at 8:52 AM, Subrata Modak wrote:

> Observed the following build error:
>
> CC      drivers/net/ibm_newemac/core.o
> drivers/net/ibm_newemac/core.c: In function =91emac_probe=92:
> drivers/net/ibm_newemac/core.c:2831: error: =91struct net_device=92 h=
as no
> member named =91open=92
> drivers/net/ibm_newemac/core.c:2834: error: =91struct net_device=92 h=
as no
> member named =91tx_timeout=92
> drivers/net/ibm_newemac/core.c:2836: error: =91struct net_device=92 h=
as no
> member named =91stop=92
> drivers/net/ibm_newemac/core.c:2837: error: =91struct net_device=92 h=
as no
> member named =91get_stats=92
> drivers/net/ibm_newemac/core.c:2838: error: =91struct net_device=92 h=
as no
> member named =91set_multicast_list=92
> drivers/net/ibm_newemac/core.c:2839: error: =91struct net_device=92 h=
as no
> member named =91do_ioctl=92
> drivers/net/ibm_newemac/core.c:2841: error: =91struct net_device=92 h=
as no
> member named =91hard_start_xmit=92
> drivers/net/ibm_newemac/core.c:2842: error: =91struct net_device=92 h=
as no
> member named =91change_mtu=92
> drivers/net/ibm_newemac/core.c:2845: error: =91struct net_device=92 h=
as no
> member named =91hard_start_xmit=92
> make[3]: *** [drivers/net/ibm_newemac/core.o] Error 1
> make[2]: *** [drivers/net/ibm_newemac] Error 2
> make[1]: *** [drivers/net] Error 2
> make: *** [drivers] Error 2
>
> Regards--
> Subrata
>
> <randconfig4-ppc64-next20090409.txt>

This is because CONFIG_COMPAT_NET_DEV_OPS isnt set and needs to be for =
=20
this driver to build.  I've asked the netdev guys about either fixing =20
the driver or adding the proper thing to Kconfig to select =20
CONFIG_COMPAT_NET_DEV_OPS.

- k