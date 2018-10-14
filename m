From: "Kiyanovski, Arthur" <akiyano@amazon.com>
Subject: RE: linux-next: manual merge of the net-next tree with the net tree
Date: Sun, 14 Oct 2018 07:58:46 +0000
Message-ID: <d8dffd253dc143169c9bef29c519b963@EX13D22EUA004.ant.amazon.com>
References: <20181012104501.063dcc4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012104501.063dcc4a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Friday, October 12, 2018 2:45 AM
> To: David Miller <davem@davemloft.net>; Networking
> <netdev@vger.kernel.org>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Kiyanovski, Arthur
> <akiyano@amazon.com>
> Subject: linux-next: manual merge of the net-next tree with the net tree
>=20
> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   drivers/net/ethernet/amazon/ena/ena_eth_com.c
>=20
> between commit:
>=20
>   248ab77342d0 ("net: ena: fix auto casting to boolean")
>=20
> from the net tree and commit:
>=20
>   cb36bb36e1f1 ("net: ena: use CSUM_CHECKED device indication to report
> skb's checksum status")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This is now=
 fixed
> as far as linux-next is concerned, but any non trivial conflicts should b=
e
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer o=
f
> the conflicting tree to minimise any particularly complex conflicts.
>=20
> --
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/net/ethernet/amazon/ena/ena_eth_com.c
> index 2b3ff0c20155,6f8e15b9b3cf..000000000000
> --- a/drivers/net/ethernet/amazon/ena/ena_eth_com.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
> @@@ -245,11 -349,14 +349,14 @@@ static inline void ena_com_rx_set_flags
>   		(cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L4_PROTO_IDX_MASK) >>
>   		ENA_ETH_IO_RX_CDESC_BASE_L4_PROTO_IDX_SHIFT;
>   	ena_rx_ctx->l3_csum_err =3D
>  -		(cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_MASK) >>
>  -		ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_SHIFT;
>  +		!!((cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_MASK) >>
>  +		ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_SHIFT);
>   	ena_rx_ctx->l4_csum_err =3D
>  -		(cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_MASK) >>
>  -		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_SHIFT;
>  +		!!((cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_MASK) >>
>  +		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_SHIFT);
> + 	ena_rx_ctx->l4_csum_checked =3D
> + 		!!((cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_CHECKED_MASK) >>
> + 		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_CHECKED_SHIFT);
>   	ena_rx_ctx->hash =3D cdesc->hash;
>   	ena_rx_ctx->frag =3D
>   		(cdesc->status &
> ENA_ETH_IO_RX_CDESC_BASE_IPV4_FRAG_MASK) >>

Hi Stephen,=20

The merge looks good.
I will know to mention conflicts in my future upstream releases.
Sorry for the trouble caused.

Thanks,
Arthur
