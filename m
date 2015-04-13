From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 14 Apr 2015 09:44:03 +1000
Message-ID: <20150414094403.30126f2d@canb.auug.org.au>
References: <20150409143309.3a1fac67@canb.auug.org.au>
	<20150409093556.GP6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gskaob1+xf5twBEM2Ar2_Ob"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34687 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752052AbbDMXoK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 19:44:10 -0400
In-Reply-To: <20150409093556.GP6023@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

--Sig_/gskaob1+xf5twBEM2Ar2_Ob
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 Apr 2015 10:35:56 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Apr 09, 2015 at 02:33:09PM +1000, Stephen Rothwell wrote:
>=20
> > After merging the regulator tree, today's linux-next build (arm multi_v=
7_defconfig)
> > failed like this:
>=20
> > drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_regulator_dis=
able':
> > drivers/gpu/drm/msm/dsi/dsi_host.c:330:4: error: implicit declaration o=
f function 'regulator_set_optimum_mode' [-Werror=3Dimplicit-function-declar=
ation]
> >     regulator_set_optimum_mode(s[i].consumer,
> >     ^
>=20
> > Caused by commit a689554ba6ed ("drm/msm: Initial add DSI connector
> > support") from the drm tree interacting with commit ae6e808f1574
> > ("regulator: Drop temporary regulator_set_optimum_mode wrapper") from
> > the regulator tree.
>=20
> > This happens every time someone renames/changes an API :-(
>=20
> It's *really* questionable if anyone should be using that API in the
> first place, one of the reasons it's being removed is that it's really
> unclear that anything would be able to successfully use it as-is.  The
> easist thing might be to drop the new usage for the time being.

This fix up patch is now needed when the drm tree is merged with Linus'
tree (the regulator part has been merged).

Mark, what did you above response mean?  Should the drm tree be using
something different?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/gskaob1+xf5twBEM2Ar2_Ob
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLFTIAAoJEMDTa8Ir7ZwVz+kQAI/5vcsuWyE5qB+NAOZIyWya
9A8bIYjdvRdCYanQ26b+22FK8lw4PN1OyWcVcFFXG47Tf6HjS5SwkMO0SAWGflfl
l3m2mx93Dawfc2QJah8KyEpl1/FkID9+1mVtnjwn7pMay7/9yA3Z/sbtvGqXB8G6
eeAvgrkUdzJpkbmulZNhaFEeQ6D+W/cHK8tV0bZQafY2PgEv+gM0Y5lHcILtzQGj
SE34n1ISNF5hd2EcUlpBe/nnVll/jniU7TnSpM0sFeqMbUbJcH+o1PKYVrLTiTPW
0VMG7lRmifs/zIHZjvSUXl1XUb3BAZ29Q0rV/XArBfx/K1BSwYRAyQ6iMSOqthH/
q534z5Ir5TOxGKutozbEzNpBPK+cDlt9RLx7innmEGEaT+/fp4uMTTGoOkzUNp0Q
H8if+9kjpO/PPiBihmPyrHkbnDwkKfbtACSkP3XdTcs9oCvSV4yev/tBee77lKPq
1xFa6DFyFo+Rlyd1iwzoTqmeoWjYOOY5IEm69ibCcolyd889+XFspYoXlJl1KNBY
rjI/GqnGmuQRu7ivTTPCbYJyx/MSCJxFFy7e0vKon7z6SVeos0D0xuDJV/HoW9hV
gD1Llpc4sjr3IPJ5UIl4u3aMNFYtMNMfSBV0S4KItLWXnJ9irRom5fr5bDiBV/5J
voO4HoMWUzOF3urLIl+g
=PGPz
-----END PGP SIGNATURE-----

--Sig_/gskaob1+xf5twBEM2Ar2_Ob--
