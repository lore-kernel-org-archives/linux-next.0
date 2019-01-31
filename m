From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the
 wireless-drivers-next tree
Date: Fri, 1 Feb 2019 07:52:09 +1100
Message-ID: <20190201075209.1a91a472@canb.auug.org.au>
References: <20190131104626.62ff05ce@canb.auug.org.au>
        <9455f1b9e746f2c28d1573ccdce3836ece42cd8a.camel@coelho.fi>
        <875zu5j5yc.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F3jxl5ezEzL=gD4wT7YNFve"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zu5j5yc.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Luca Coelho <luca@coelho.fi>, Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Berg <johannes.berg@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/F3jxl5ezEzL=gD4wT7YNFve
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 31 Jan 2019 15:46:03 +0200 Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Luca Coelho <luca@coelho.fi> writes:
>=20
> >
> > This was a conflict resolution damage in one of the patches I applied.=
=20
> > We already have a fix for it[1] and Kalle will apply it to wireless-
> > drivers-next soon.
> >
> > Sorry for the trouble, but somehow I didn't see this warning and
> > kbuildbot also reported successful compilation with it. :(
> >
> > [1] https://patchwork.kernel.org/patch/10788503/ =20
>=20
> I applied the fix now:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-ne=
xt.git/commit/?id=3D3864be551405b582ae38fbcdfdbb6e49052f5f6d

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/F3jxl5ezEzL=gD4wT7YNFve
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTX/kACgkQAVBC80lX
0GyaOgf/UALlkaKxtkl5KQ27Sj7t8RCKTcyUuNwIIVKhBogm77UYD99n4FReTBhN
/EP6sGkQhZxgWPhYV3xOq6o+zTkfr7Yc93sQ00T+Ma8jyTOA9H77EUCJwU0E75fU
Bhm5bUa6zbcIwc3xzB2WtXRhbFsuGoipBjuvCT8QP64qBcmVpJknh6+kaiXETSSG
7XOIPpDFU0tPoBxfetGvvVMMoeQBQSgXgVJG64lXVdZtm/77XTCOVF2RofGXg7uk
FU3MBV7+GSXzQWfOaSkoxbhG804tLQ29l4/Gg0YQF99Fc0p/MhPlnTvvYzivs+el
49uycgwCs2uM4HT0G/e68Otm11vOqA==
=jtkV
-----END PGP SIGNATURE-----

--Sig_/F3jxl5ezEzL=gD4wT7YNFve--
