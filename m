From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 27 Feb 2019 13:23:14 +1100
Message-ID: <20190227132314.16dd9257@canb.auug.org.au>
References: <20190225190034.0cad4e3d@canb.auug.org.au>
        <0788736a-dfba-edd1-f62d-2205d6702f4b@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v5Gv7/8/PvwYbgq2qPELyxu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0788736a-dfba-edd1-f62d-2205d6702f4b@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tanhuazhong <tanhuazhong@huawei.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jian Shen <shenjian15@huawei.com>, Peng Li <lipeng321@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/v5Gv7/8/PvwYbgq2qPELyxu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 27 Feb 2019 09:12:57 +0800 tanhuazhong <tanhuazhong@huawei.com> wro=
te:
>
> It is my mistake, so sorry about this. There is a redundant "net: hns3:=20
> " in the fixes tag.
>=20
> How could I fix it?

Since Dave doesn't rebase his tree, there is no way to fix it (and it
is not that important any in this case), just use this as a learning
experience for next time :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/v5Gv7/8/PvwYbgq2qPELyxu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx19JIACgkQAVBC80lX
0GymYwf/WnsyKFMcu0U5ZauVBV5cU51Tmv1UVIhWPZfKsG9U9pl/FkEYSB1Srnwx
JIdTRT+1B1weSJmVdoqGrby7T5OJY0u094Nrv2X2O3z8kVItWT4Xqk4u3+dxlkNI
c3cQEJA8waAzLwos4d9BZjcv8JKhTYYOtZ6e0yiok6h2+/Cqqku6oNQB6YvAX32i
RlsKqQz+MFX+X+uWI2YUZEuZ/E4762bHkF9AtuuGwWNASn9D39w7YfyZQane6dxY
AKpDPSByAKY9W/ctofwy0/IvbGEN850xZ5iItKMJ455KcjNcN/fHVz2/uxg9F1+o
zuuyblSK4Hl/2TBWzQsLlyW45hH0sg==
=HzPf
-----END PGP SIGNATURE-----

--Sig_/v5Gv7/8/PvwYbgq2qPELyxu--
