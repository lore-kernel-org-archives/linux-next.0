From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the xtensa tree
Date: Tue, 6 Nov 2018 10:19:41 +1100
Message-ID: <20181106101941.458c46f8@canb.auug.org.au>
References: <20181106100856.0c9bdf3a@canb.auug.org.au>
        <CAMo8BfLfkk864aRwy0jG9Tq5CizyDax85Sq6+5=3N0wrA_Cg5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gk8UFKR49FldlWIkYZpK2dP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMo8BfLfkk864aRwy0jG9Tq5CizyDax85Sq6+5=3N0wrA_Cg5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gk8UFKR49FldlWIkYZpK2dP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Max,

On Mon, 5 Nov 2018 15:14:44 -0800 Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Mon, Nov 5, 2018 at 3:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> > Commit
> >
> >   12e90ddd8dbf ("Revert "xtensa: xtfpga: implement platform DMA address=
 helpers"")
> >
> > is missing a Signed-off-by from its author and committer.
> >
> > Reverts are commits too. =20
>=20
> Thanks for catching that. Should I rewrite that branch fixing up that com=
mit?

There is nothing else you can do.  The only reason not to is if you
strictly do not rebase your branch (or there has been lots of other
activity - which there is not in this case).

--=20
Cheers,
Stephen Rothwell

--Sig_/gk8UFKR49FldlWIkYZpK2dP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvg0A0ACgkQAVBC80lX
0GzGuwf/e2WEiT7htd3FFPfPcxhlIVJdHeJGOJGD/I/0UNg06Bg4ly66x3CKqnQ7
BcXCDUDv4IHd1Ll1qCyopc3gE85T4dUgcbnuNTeXs+wu8nm7woJNdF0TJKn3WnNg
YDUjZUh2B5GAhD7u2zSSDrIegYKfW7C5CHegeIlHGppOdc0RFcPemwqoVWndyejf
GUkAmfy0awMF7y4vXHEs8GdmelCI/zVtKueBXyvGCkwAfbuwMvSEyEEEfXM0cLTN
TSDz4RFSvjLsimQbB4wPXTnItI7la93LhBcYgKysEcQn8nDez9YPtOutO1WsfNqI
V8Jd57b5PnPsdxEGoz5MVl/4t+byCA==
=gh6J
-----END PGP SIGNATURE-----

--Sig_/gk8UFKR49FldlWIkYZpK2dP--
