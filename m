From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 2 May 2018 15:50:14 +1000
Message-ID: <20180502155014.4f5acdcb@canb.auug.org.au>
References: <20180502120921.654cc338@canb.auug.org.au>
        <0942C278-336F-4795-BE63-FAD7FBAA231B@fb.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S_M1RAlcT1kN14QJvW+92YW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0942C278-336F-4795-BE63-FAD7FBAA231B@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Song Liu <songliubraving@fb.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/S_M1RAlcT1kN14QJvW+92YW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Song,

On Wed, 2 May 2018 04:40:20 +0000 Song Liu <songliubraving@fb.com> wrote:
>
> > - 	CHECK(build_id_matches < 1, "build id match",
> > - 	      "Didn't find expected build ID from the map\n");
> > + 	if (CHECK(build_id_matches < 1, "build id match",
> > -		  "Didn't find expected build ID from the map"))
> > ++		  "Didn't find expected build ID from the map\n")) =20
>=20
> ^^^  Is there a "+" at the beginning of this line?=20

No, this is a merge resolution diff, so the ++ means that the line did
not appear in either parent commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/S_M1RAlcT1kN14QJvW+92YW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrpUZYACgkQAVBC80lX
0GyfMgf/TX4gdDqM4rEbYNUQ7x6XsvDvo4sZDQTMS2OiI/RlRJE3HR3A+IzbIi/f
cIMBpoQR4EmNie2Zj/YRvwvMfFqJz1Ce47W85KWOmHghXgG9WQbHN40khS++9dIV
QSkqx9XfU6EGa2Li4Glmqyu901jt9xPNeYpYpau293pelf8+lh9IEqOm38+717JZ
qV3A3rkSO0NaClafP1agRpLYE4vU358XX7KROFqEPkIeIoTMXRr/DXgrlVjT7jrE
ATXMa+5Ch7JZV8Ufj5lvdgy5h93DOQEah71xLbu+fFtY1eHb1t0IogTJaHyYQv5y
L1hGokQ6vO0anRLWOeKgGNQTRBaMQg==
=rOmh
-----END PGP SIGNATURE-----

--Sig_/S_M1RAlcT1kN14QJvW+92YW--
