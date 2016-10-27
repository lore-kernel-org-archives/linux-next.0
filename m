From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: bad commit in the sunxi tree
Date: Thu, 27 Oct 2016 22:41:37 +0200
Message-ID: <20161027204137.ef6kxlzyvftcdomn@lukather>
References: <20161025092255.3f4f59e2@canb.auug.org.au>
 <20161025094409.hhf5rg3gbzaryjom@lukather>
 <20161027104225.4f0f2774@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gkaorutjsb7z52fr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161027104225.4f0f2774@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--gkaorutjsb7z52fr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Oct 27, 2016 at 10:42:25AM +1100, Stephen Rothwell wrote:
> Hi Maxime,
>=20
> On Tue, 25 Oct 2016 11:44:09 +0200 Maxime Ripard <maxime.ripard@free-elec=
trons.com> wrote:
> >
> > On Tue, Oct 25, 2016 at 09:22:55AM +1100, Stephen Rothwell wrote:
> > > Hi Maxime,
> > >=20
> > > In today's sunxi tree
> > > (git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunx=
i/for-next)
> > > I noticed that commit
> > >=20
> > >   3861b711f8b5 ("ARM: sun5i: chip: add a node for the w1 gpio control=
ler")
> > >=20
> > > has no Signed-off-by from its committer. =20
> >=20
> > Thanks, this has been fixed.
> >=20
> > Just out of curiosity, what command do you run to catch this?
>=20
> None :-)  I look at the differences in each tree as I fetch it and
> just happen to notice some of these sometimes.  I should have a git
> hook to check that there is a Signed-off-by for the author and
> committer, but I would have to invest some time to figure out how :-)

Ok, that's actually the real question I had in mind, if you had a hook
I could use in order to avoid that kind of things in the future :)

I guess I have a new item on my todo list.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gkaorutjsb7z52fr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYEmZ9AAoJEBx+YmzsjxAgA6QQALE4cnz5UfCafR500CvmepFa
wJkIv3XQxQc9fix2R+TrbsHRkESBGHtl3ZttwwGcwaYyrT+dF3Et7L15+0I7ALrX
49GKXWvORynQnqTnHckvm5mUJkJUEqypN1/lW4AZNmi+CmcvcBks4qQeA9HOP0Sm
vSvBJpQetcYuU9q3mDga1D78O3RM0Q04s6Lzl94uflPo0zhVW0yJSEQ4uWsk1uLZ
JQIqhlLPEFOLg6M3yJjNU/6WTlLjBZSInAjLXsvjLhR2TmSaFQxjXhIv91rkr0eN
0+CKr3beSAXvO1wRI6sP3yDpW+Bt5U1XWCpiCPDwjX5zp1G5Aq+bqpT5KHur+wpw
4k7aA+MzghDiytzZbRjcPpgSuO11SzGQHWdfII/NExrrXtoS2qfK76HE163YmMYy
GnGlaJ22p9eT/6OkNp3VWMgBDdukSL+XvKAuKv1bFhtbaI/i3Bn1nkaXsiKfNgvA
ivxYdfQldUv+wUsLRYbTrQ+dHpWrYAMP7ZsKu3AO1F6DM98JxOE6GQKi2sKQ8BIx
lEIY1k5wmgKdFX4ZCIa6Dr8f0LAVRl8b8SrTpxPhgTP6r6IRLy3b1Rk61bGgKVKQ
sq8m5LFyIUDdnthOC18DRbnX2MHg/QQtQLeUS1C1AJ9/fVSVKv+4LYsowpsxTnuI
b3Wcq66Cewb0iJVhSQfa
=2vcR
-----END PGP SIGNATURE-----

--gkaorutjsb7z52fr--
