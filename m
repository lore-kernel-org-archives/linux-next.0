From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: changes in the maintainership of the percpu tree
Date: Tue, 18 Sep 2018 00:00:03 +1000
Message-ID: <20180918000003.1ecd47b1@canb.auug.org.au>
References: <20180917210339.21ebb029@canb.auug.org.au>
        <CAOS58YNVTVLzBhQSQBkQkh_Zr101L9_cjhPSK3iTQSScjjYFrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7SfTbO3LG8=meyGLg=eapV="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOS58YNVTVLzBhQSQBkQkh_Zr101L9_cjhPSK3iTQSScjjYFrg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/7SfTbO3LG8=meyGLg=eapV=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dennis,

On Mon, 17 Sep 2018 07:53:29 -0400 Tejun Heo <tj@kernel.org> wrote:
>
> Ah, yeah, please switch the tree to Dennis's for-next branch instead of
> mine.
>=20
> Thanks.
>=20
> On Mon, Sep 17, 2018 at 7:03 AM Stephen Rothwell <sfr@canb.auug.org.au>
> wrote:
>=20
> > I noticed commit
> >
> >   1194c4154662 ("MAINTAINERS: Make Dennis the percpu tree maintainer")
> >
> > Just wondering if this means any changes to the tree/branch I should
> > fetch or the contacts I should use for the percpu tree in linux-next.

I have switched the percpu tree to be the for-next branch of

  git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git

and added you to the contacts for problems with that tree.

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

--Sig_/7SfTbO3LG8=meyGLg=eapV=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlufs2MACgkQAVBC80lX
0Gxzkgf+PnH3rZ5wPB9u1Q2xDyV1NGZLaXQza85B4hZyyWB1SeF+LS3CC0nj5dt4
6htgPJTOzIYsAwz4EBoOi0FI67m6wb6NXIuP1bhZ1lcmOtEiwCpktE5lhucO6Ju4
fYA00ys3L3V5acHkH/ZULbInx1+Vq6xmeXS6bYjSTLuQcrumtb5OKXCq4xalnZbx
p/vyclLMVlQop8Ow6mJjr+2uLpVJihMDyrF+CAIvP0vE6grf5LsDKPtrxn189MHT
GrkjRfnC33fmcsXx1sojzSrhdMmRIK6xOg1WP4g5REzcWE/i8ZsnUCi5ZB7jx8Bo
VZULNwlUkata8TkFISWtOXgMhIF3/w==
=hW0G
-----END PGP SIGNATURE-----

--Sig_/7SfTbO3LG8=meyGLg=eapV=--
