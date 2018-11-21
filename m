From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the regulator
 tree
Date: Thu, 22 Nov 2018 08:29:49 +1100
Message-ID: <20181122082949.2c9717f1@canb.auug.org.au>
References: <20181122072528.11372826@canb.auug.org.au>
        <CAD=FV=WErS73ZLVmnP1o1WYX1VfrhwhCa6yhRC4gS9B=3vPYGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4AbEjVOapkp6lbHgFTQ7RGN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WErS73ZLVmnP1o1WYX1VfrhwhCa6yhRC4gS9B=3vPYGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4AbEjVOapkp6lbHgFTQ7RGN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Wed, 21 Nov 2018 12:39:45 -0800 Doug Anderson <dianders@chromium.org> wr=
ote:
>
> Argh.  When I squashed two commits together I must have clobbered the
> Signed-off-by.  :(  Is there a suggested way that I can fix this?

The only way it can be fixed is for Mark to rebase his tree and fix the
commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/4AbEjVOapkp6lbHgFTQ7RGN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv1zk0ACgkQAVBC80lX
0Gx6yQf9Gk3gakP2lHnZJL1q/JReTXsOfR9qn63o8z2KcFH72fxNxvXGph3xNPPX
8c8YvqSwmiEng7arwL6wQRvTBZcXGoIj2r0LY98MZfS5YmiNE+B0cd6q0Yya6TQP
Lz3LLaFYTTVYbaNBJoyx4CBjAhR4VHVnoDYzfmdFn6oMGOLvAu38BuOQrtf1h+8N
P4/zwX+P7Nvf94tKr+HeM2U29vnJZl10yLPu85nE/KGbM3eyLPxsO2rVf2ReOXB1
4VG7cbpnGawy8lxEHb/Vr7ITEFE1NxbZfB9x1iEXx06tAXbbTt5kUKnL4hpxsA2V
YmB9TSrMBN3fNR0gPQhaZBqqhh8kvw==
=R94f
-----END PGP SIGNATURE-----

--Sig_/4AbEjVOapkp6lbHgFTQ7RGN--
