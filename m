From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Date: Thu, 5 Jul 2018 12:47:01 +1000
Message-ID: <20180705124701.0454b482@canb.auug.org.au>
References: <20180704133006.4d42d1a6@canb.auug.org.au>
        <20180704042017.GW22377@vkoul-mobl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Qifk6047KtBFWimBiNkb0x3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704042017.GW22377@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>
List-Id: linux-next.vger.kernel.org

--Sig_/Qifk6047KtBFWimBiNkb0x3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Wed, 4 Jul 2018 09:50:17 +0530 Vinod <vkoul@kernel.org> wrote:
>
> On 04-07-18, 13:30, Stephen Rothwell wrote:
> >=20
> > After merging the slave-dma tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-edma-comm=
on.o =20
>=20
> Thanks for the report, I have fixed it by adding this and pushed out.

Unfortunately, my arm multi_v7_defconfig build now gets this failure:

drivers/dma/fsl-edma-common.c:672:16: error: expected declaration specifier=
s or '...' before string constant
 MODULE_LICENSE("GPL v2");  =20
                ^~~~~~~~

presumable a missing include of module.h ...

I have gone back to the slave-dma tree from next-20180704 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Qifk6047KtBFWimBiNkb0x3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls9hqUACgkQAVBC80lX
0GzMugf+KsTnYTIgs5Jt+p0VYehF3gBUyQztjbu0wvBpbXcKxP51Gv9os3J9/wZV
HlrsPrPLA+sh7YF7lO+97O/ZZTBEKmN8PpzkWgIEfZot95gmoAoz8i4QnZ4tKsX+
FRsTpXa/GNnBmajM45bj5QUeYiAojXrAVP0sVflk2ltcBT8hfTdWCjLlZwtfh3Qt
Ov5Q627Lke3sXEJzaz2hQ4nfTWyYGQwaLqN7TfuPPyFNScaUkbbfooTTxmiRHgkD
1QlSRmzauWKcSQ95bbbJWHpn4ieQw8CHreWVBvLzzJ+N98jwCDGEBLaLnzVVnxkG
o33pHf95e8+WIueKQ/vqogavYwqfww==
=hO0j
-----END PGP SIGNATURE-----

--Sig_/Qifk6047KtBFWimBiNkb0x3--
