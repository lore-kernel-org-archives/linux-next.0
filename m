From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the thermal-soc tree with Linus'
 tree
Date: Tue, 14 May 2019 14:40:06 +1000
Message-ID: <20190514144006.60df13bb@canb.auug.org.au>
References: <20190513104928.0265b40f@canb.auug.org.au>
        <20190514034409.GA5691@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2EkBLwMj1P8kge3EWnSyVJG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514034409.GA5691@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@mellanox.com>, Talel Shenhar <talel@amazon.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2EkBLwMj1P8kge3EWnSyVJG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

On Mon, 13 May 2019 20:44:11 -0700 Eduardo Valentin <edubezval@gmail.com> w=
rote:
>
> Thanks for spotting this. I am re-doing the branch based off v5.1-rc7,
> where the last conflict went in with my current queue.

Its really not worth the rebase.  Just fix the build problem and send it
all to Linus.

--=20
Cheers,
Stephen Rothwell

--Sig_/2EkBLwMj1P8kge3EWnSyVJG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzaRqYACgkQAVBC80lX
0GxmzAf+OnMWPR/PLV6gW4+7P0DgN4H8+d6uMwOlG5XPsTAqH7IwFFj9HQNjtsRM
GNMme0P2d3HRc9M9cIUAkZca29knRKS6lvE8QJPna3FDv5ma3T0Mjt5QE0EGCber
Z+mXUPksD+qgyZ6TyOmj8v7Ih+38+4wzMRzW1DPF4bl4feyO6G4m3Lbcqg7EqplS
3Peo7QW1s/l0vDJk3Ai6h7D0usNpW2ku8ba7geDPK2CyyaS9dWi4v72s2f2lt8M/
hT2PL3XrM/qrRzR7qC0+V2T6SLT81F4J21hUNRjGndP7yziybuHG2vLJu0lWQDjg
3CMRX+RT3RDRV1/6MfPmB466+o2/0Q==
=8J15
-----END PGP SIGNATURE-----

--Sig_/2EkBLwMj1P8kge3EWnSyVJG--
