From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 29 Dec 2008 17:45:47 +1100
Message-ID: <20081229174547.e0434a8a.sfr@canb.auug.org.au>
References: <20081120133036.3a4aea4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_17_45_47_+1100_AccYnpi.3JuM9ZHO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47095 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751945AbYL2GqU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 01:46:20 -0500
In-Reply-To: <20081120133036.3a4aea4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>

--Signature=_Mon__29_Dec_2008_17_45_47_+1100_AccYnpi.3JuM9ZHO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 20 Nov 2008 13:30:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>=20
> net/core/dev.c: In function 'net_dev_init':
> net/core/dev.c:4775: error: implicit declaration of function 'netdev_dma_=
register'
>=20
> A bad interaction between commit 505d4f73dda9e20d59da05008f1f5eb432613e71
> "net: Guaranetee the proper ordering of the loopback device. v2" from the
> net tree (which moved a call to netdev_dma_register) and commit
> 8f3da0d613494b02f8628bb5dbf2366f0298505c "dmaengine: kill struct
> dma_client and supporting infrastructure" from the async_tx tree (which
> removes the call).
>=20
> I added the below patch to fix up the merge and can carry it.

This now occurs when I merge the async_tx tree as the net tree has been
merged into Linus' tree.  You should fix this (by merging Linus' tree
into yours and doing the fixup below as part of the merge commit) before
asking Linus to pull your tree.

> diff --git a/net/core/dev.c b/net/core/dev.c
> index c3f5713..e9cf36e 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -4772,8 +4772,6 @@ static int __init net_dev_init(void)
>  	if (register_pernet_device(&default_device_ops))
>  		goto out;
> =20
> -	netdev_dma_register();
> -
>  	open_softirq(NET_TX_SOFTIRQ, net_tx_action);
>  	open_softirq(NET_RX_SOFTIRQ, net_rx_action);
> =20

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_17_45_47_+1100_AccYnpi.3JuM9ZHO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYchsACgkQjjKRsyhoI8yO6wCfUAwvQAsCfAVhrD4TBkE1aXK6
uAYAnRvz4bM2dixodAuiWet2mXCxKcCy
=Ifud
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_17_45_47_+1100_AccYnpi.3JuM9ZHO--
