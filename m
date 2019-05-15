From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the thermal-soc tree with Linus'
 tree
Date: Wed, 15 May 2019 10:44:31 +1000
Message-ID: <20190515104431.5e353729@canb.auug.org.au>
References: <20190513104928.0265b40f@canb.auug.org.au>
        <20190514034409.GA5691@localhost.localdomain>
        <20190514144006.60df13bb@canb.auug.org.au>
        <20190514141531.GA16968@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uTS4l0NsRToI.fEYJBxFZ_1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514141531.GA16968@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@mellanox.com>, Talel Shenhar <talel@amazon.com>
List-Id: linux-next.vger.kernel.org

--Sig_/uTS4l0NsRToI.fEYJBxFZ_1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

On Tue, 14 May 2019 07:15:33 -0700 Eduardo Valentin <edubezval@gmail.com> w=
rote:
>
> On Tue, May 14, 2019 at 02:40:06PM +1000, Stephen Rothwell wrote:
> > Hi Eduardo,
> >=20
> > On Mon, 13 May 2019 20:44:11 -0700 Eduardo Valentin <edubezval@gmail.co=
m> wrote: =20
> > >
> > > Thanks for spotting this. I am re-doing the branch based off v5.1-rc7,
> > > where the last conflict went in with my current queue. =20
> >=20
> > Its really not worth the rebase.  Just fix the build problem and send it
> > all to Linus. =20
>=20
> Yeah, I think I was not super clear in my first email. I am about to
> send the content of my branch to Linus.  This specific conflict was
> because a change in MAINTAINERS went in before the change I have in it,
> causing a conflict there. The rebase is simply to make it easier for him
> to pull when I send the git pull.

Linus has repeated told people not to do that.  He wants to see the
conflicts.  You should mention any conflicts you know about in your pull
request - just as a heads up to him.

However, if a conflict is particularly tricky, it may be worth while to
a test merge in another branch and tell him about that other branch in
your pull request.

--=20
Cheers,
Stephen Rothwell

--Sig_/uTS4l0NsRToI.fEYJBxFZ_1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzbYO8ACgkQAVBC80lX
0GxFZggAkigHuDUvAYNu/uw54AEl7CZreJllX9bepthDOydVa+XIVsMgUEMbpcXl
r+CB+XIpZpvW7s5gTH7znt0qSEszkjdOM/+gaOpF0BN37lpx0+nitJaZPk8kUg98
OvpHr0P2S/87M/PUbCXSn43pEZlKIC7q94OB5jFkkBgYWtZ+K99Ux2t2zLYKGD7D
ztdu3yhP4orVqHulmHUca9TcJBQxiVqzGBQtoiUyHpU/A7sXw5POnZQ7Tq2XDLZT
XX6vYJ+msIREeDukfNLejL8O3xhzYZP8jnFgcAC1t2gX9rM+7mDcphiVQVLb0Eee
RqRbAUuKQlM0bN1P2u12nNgF++a8Kg==
=Hyzb
-----END PGP SIGNATURE-----

--Sig_/uTS4l0NsRToI.fEYJBxFZ_1--
