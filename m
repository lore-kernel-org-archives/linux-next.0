From: Yang Hongyang <yanghy@cn.fujitsu.com>
Subject: Re: linux-next: wireless tree build failure
Date: Mon, 23 Mar 2009 13:06:37 +0800
Message-ID: <49C718DD.3080201@cn.fujitsu.com>
References: <20090323153954.95094b80.sfr@canb.auug.org.au> <20090322.215541.205935147.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:50003 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752812AbZCWFHX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2009 01:07:23 -0400
In-Reply-To: <20090322.215541.205935147.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

David Miller wrote:
> Stephen does this fix the build for you?
>=20
> I want to have you test it before I commit because unlike
> some people I'd like to build test changes before submitting
> them anywhere.
>=20
> Yang, I am pretty pissed at you, this is beyond unforgivable.
> There is zero excuse for this build regression.

I'm so sorry for that.This is the only patch that I do not build
test for because I think it's too simple.It turns out that I am
totally wrong and I was shamed about that.It's a painful lesson
to me.

>=20
> Grumble!
>=20
> diff --git a/drivers/net/spider_net.c b/drivers/net/spider_net.c
> index 136d9f1..0288054 100644
> --- a/drivers/net/spider_net.c
> +++ b/drivers/net/spider_net.c
> @@ -2260,18 +2260,18 @@ spider_net_tx_timeout(struct net_device *netd=
ev)
>  }
> =20
>  static const struct net_device_ops spider_net_ops =3D {
> -	.ndo_open		=3D spider_net_open;
> -	.ndo_stop		=3D spider_net_stop;
> -	.ndo_start_xmit		=3D spider_net_xmit;
> -	.ndo_set_multicast_list	=3D spider_net_set_multi;
> -	.ndo_set_mac_address	=3D spider_net_set_mac;
> -	.ndo_change_mtu		=3D spider_net_change_mtu;
> -	.ndo_do_ioctl		=3D spider_net_do_ioctl;
> -	.ndo_tx_timeout		=3D spider_net_tx_timeout;
> +	.ndo_open		=3D spider_net_open,
> +	.ndo_stop		=3D spider_net_stop,
> +	.ndo_start_xmit		=3D spider_net_xmit,
> +	.ndo_set_multicast_list	=3D spider_net_set_multi,
> +	.ndo_set_mac_address	=3D spider_net_set_mac,
> +	.ndo_change_mtu		=3D spider_net_change_mtu,
> +	.ndo_do_ioctl		=3D spider_net_do_ioctl,
> +	.ndo_tx_timeout		=3D spider_net_tx_timeout,
>  	/* HW VLAN */
>  #ifdef CONFIG_NET_POLL_CONTROLLER
>  	/* poll controller */
> -	.ndo_poll_controller	=3D spider_net_poll_controller;
> +	.ndo_poll_controller	=3D spider_net_poll_controller,
>  #endif /* CONFIG_NET_POLL_CONTROLLER */
>  };
> =20
>=20
>=20


--=20
Regards
Yang Hongyang

=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86
=E2=97=86
=E2=97=87   =E5=AF=8C=E5=A3=AB=E9=80=9A=E9=82=80=E8=AF=B7=E6=82=A8=E5=8F=
=82=E5=8A=A0=E2=80=9C=E5=9C=B0=E7=90=83=E4=B8=80=E5=B0=8F=E6=97=B6=E2=80=
=9D=E6=B4=BB=E5=8A=A8=20
=E2=97=86      http://www.fujitsu.com/cn/about/earth_hour.html
=E2=97=87  =20
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=
=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86=E2=97=87=E2=97=86
