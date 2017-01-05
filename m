From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: bad rebase of the rdma-leon tree
Date: Thu, 5 Jan 2017 08:46:08 +0200
Message-ID: <20170105064608.GZ12077@mtr-leonro.local>
References: <20170105093453.71ff8281@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+S4DbcR7QPeSsP0V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170105093453.71ff8281@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Reynes <tremyfr@gmail.com>
List-Id: linux-next.vger.kernel.org


--+S4DbcR7QPeSsP0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 05, 2017 at 09:34:53AM +1100, Stephen Rothwell wrote:
> Hi Leon,
>
> In rebasing the rdma-leon tree, you have cherry-picked several patches
> that were in the net-next tree:
>
> Commit 8e4881aa == 90af6fea  net: mdio: add mdio45_ethtool_ksettings_get
> Commit e938ed15 == 9aee5260  net: sfc: falcon: use new api ethtool_{get|set}_link_ksettings
> Commit 41a65f70 == fae73a50  net: dec: de2104x: use new api ethtool_{get|set}_link_ksettings
> Commit 6711a87a == acbf8e3c  net: dec: uli526x: use new api ethtool_{get|set}_link_ksettings
> Commit 453e5f3d == edffccbc  net: dec: winbond-840: use new api ethtool_{get|set}_link_ksettings
> Commit 90222550 == 8c2863a7  net: dlink: dl2k: use new api ethtool_{get|set}_link_ksettings
> Commit 88c513d4 == c9abb356  net: dlink: sundance: use new api ethtool_{get|set}_link_ksettings
> Commit fd90095d == ba141e8e  net: emulex: benet: use new api ethtool_{get|set}_link_ksettings
> Commit 9da12b64 == 4c8dff9c  net: faraday: ftmac100: use new api ethtool_{get|set}_link_ksettings
> Commit 0a0a8d6b == 98192246  net: fealnx: use new api ethtool_{get|set}_link_ksettings
>
> (The first SHA1s above are in the net-next tree.)

Thanks Stephen,
I'm sorry for the mess that I produced in last days with my branches.
It seems that I did git rebase instead of git reset.
>
> --
> Cheers,
> Stephen Rothwell

--+S4DbcR7QPeSsP0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlht67AACgkQ5GN7iDZy
WKeNyBAAkjoFbj56k46xbq5gRlRQx432M8JZC3RY6ZXnOJOPPkQxQ1OtoKeGoA1B
wvHavRQ5L+SDRhxBdjQMEvB4Ib8peLGGGrAhhwTBYoW/1edv51xthFRtgLY/WKtw
Sk+d45v5by4hi807zTbTVN96NjncdB0y2Dz/RWDoO1HqO1FBd5UzHBjPcMeHAP/p
nvfVSmk7I/l7oM8JJwOvV6UabHNngmqHZzGj/2jpTIwglmY3GFp/5/gya1cJECP4
rDZ+3WZxuuslV+xo0Z6tu6jHT0oo5VYyAVRSuksl+bnOpCZWr6pWRBO1WWs0bemS
pGD853BLznvozjdRfvY/EiyaEcCL76U73A8/T2SXU/cBSpB2kvmgekc5hZOnfLNq
dmrgb6rhb5FpKoSa7ZcLy99h3sSPc10pZHIUzY3jJueC0hJVSjXel5awKNNoAZcs
Y0c01FDWLBvAPmc+mxu8sO+gzmibFkbNMP8GZ7bDPXTewslwxjvRoQ2D2dgXiiFz
9EORbavfn/Tw5h7yx+ADfokzv3yF/BjquRt0xIPUqPqVK4gM8UYskGWowHkHUv6l
+26fOcWfDCxOTL0TzTdxUsg7oVZaKUeQn0/5IPmrpqVbA09cKcvwEVg8Y+WYkie/
3QPPD1xIIbvNQMd6T02lDlbbfBk53H9ilcaWGR/ooLQZqDJPhKA=
=mQE8
-----END PGP SIGNATURE-----

--+S4DbcR7QPeSsP0V--
