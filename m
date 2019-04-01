From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Mar 27 (sunxi clk & mfd)
Date: Mon, 1 Apr 2019 22:36:24 +1100
Message-ID: <20190401223624.6b4f8c42@canb.auug.org.au>
References: <20190327145020.2fff97b8@canb.auug.org.au>
        <641a04ec-e2e6-4263-e77e-d272058c18c9@infradead.org>
        <20190328095036.734adbba@canb.auug.org.au>
        <20190401102732.GD4187@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TQEStlbOBWCvct8AwL66QLQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401102732.GD4187@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

--Sig_/TQEStlbOBWCvct8AwL66QLQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Mon, 1 Apr 2019 11:27:32 +0100 Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 28 Mar 2019, Stephen Rothwell wrote:
>=20
> > I reported that a while ago (x86_64 allmodconfig after the merge of the
> > sunxi tree).  Apparently there is a fix out there but it hasn't been
> > applied yet. =20
>=20
> Where is the fix to be applied?  SUNXI or MFD?

Well, I only see the problem after applying the sunxi tree (which
happens before I merge the mfd tree).

Maxime said:

> I've just sent a patch fixing this:
> https://lore.kernel.org/lkml/20190322091650.5189-1-maxime.ripard@bootlin.=
com/

So maybe if you (Lee) acked it, Maxime could apply it to the sunxi
tree, so we keep the breakage and fix together?  Assuming that the fix
is acceptable (and works :-)).
--=20
Cheers,
Stephen Rothwell

--Sig_/TQEStlbOBWCvct8AwL66QLQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyh97gACgkQAVBC80lX
0GyxLAf/bFGw4fX8AubeNHrIvatp3/buMOEzbllGr7f9Fb6GNcEk5KrQZ41JrB86
eMw0kKGbelqGGBE1Lq2T5LvdsWataFx2nQGLy4hyX/sIPgq7p7BF/Qj9kwcgAehF
kgPfvpcmOZ1xYnbq6YG1CCKKDpTCnD3Nm5IOCFVO0FjHfuzQKUQ24S0Ua+Ieq4gk
EHjLZIGdK99j0RZKM1Z1zzzw4mzQRJ3eL2FsSTjfMNj9X5DmPstlnoYi4ZmA8l+/
4NxDc1htdOczmfG9cSxv/lqFUXIOIoa7HFElS71xBB81s9erFvRkw5v+DmdllGwh
CaOI1qJZXmQFCpqOR6CUf9tUnwmuFw==
=uXY6
-----END PGP SIGNATURE-----

--Sig_/TQEStlbOBWCvct8AwL66QLQ--
