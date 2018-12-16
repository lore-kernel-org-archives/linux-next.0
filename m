From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [linux-next] Request to add auxdisplay tree
Date: Sun, 16 Dec 2018 16:23:45 +1100
Message-ID: <20181216162345.24fa1876@canb.auug.org.au>
References: <CANiq72=EefCCj=ErujVHZesn0aiO5aDT2tKobzUCVw3aTsRS0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xW=uoNGq3157LHUHVF1MAIz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANiq72=EefCCj=ErujVHZesn0aiO5aDT2tKobzUCVw3aTsRS0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/xW=uoNGq3157LHUHVF1MAIz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Fri, 14 Dec 2018 17:11:09 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> Can you please add the auxdisplay tree into linux-next?
>=20
>     https://github.com/ojeda/linux.git auxdisplay
>=20
> It is extremely low volume, but from time to time there is a patch.

Added from Monday.  Out of interest, will this tree be sent directly to
Linus or merged vi some other tree?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/xW=uoNGq3157LHUHVF1MAIz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwV4WEACgkQAVBC80lX
0GzRhgf/SXcTPiWLNiP63WWI2ynEkKjwrDr8y5kVrfHUKpaHYPKdrOjdqlk5DOuv
n7AsUGE4gMHyO2fE0RzHIoraC7nkw/FT50JlqdAW0y1FEmE3Li2aFH7ZUqFCM/nQ
RuB0WKEqyWgNFMGefZfbRVu3fuMUy73dmtoLL8R0FKTEGDT/lLmHATyUqtFiZ70S
oeUGOPz26voiC3s8xjFpIQVqQaSEMR9YCvT+n9Oy5fGx98GmX6z+y1b58Dtp54pM
G4eEg01y6KyMjzBxLZoH+HgHf50k2C6HYlmgts1FiOTGNq2XMP2MnnFHxG1T++XD
E6sHg/k3Zgh21LPFikj0bEfTgYNdaQ==
=tZ95
-----END PGP SIGNATURE-----

--Sig_/xW=uoNGq3157LHUHVF1MAIz--
