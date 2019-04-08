From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the sound-asoc tree
Date: Tue, 9 Apr 2019 07:27:20 +1000
Message-ID: <20190409072720.0f51ff2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pQyu_hxH_r8UsjTVlhUT5z/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-Id: linux-next.vger.kernel.org

--Sig_/pQyu_hxH_r8UsjTVlhUT5z/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b4ed6b51f356 ("ASoC: core: conditionally increase module refcount on comp=
onent open")

Fixes tag

  Fixes: b450b878('ASoC: core: don't increase component module refcount

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not wrap FIxes tags over more than one line.


In commit

  17d3069ccf06 ("ASoC: stm32: fix sai driver name initialisation")

Fixes tag

  Fixes: 3e086ed ("ASoC: stm32: add SAI driver")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/pQyu_hxH_r8UsjTVlhUT5z/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyrvLgACgkQAVBC80lX
0GyBJQf+JTDG0sHcZEmjh5Z2Sz3cfy7m2JX7WlH7U0/kSTZKGc/zUCWUfwV38DH3
z4lLIZIwtlb0dyjbGbXAahq065eBV1oMl68i9ppLwtXpuY3oyUP10Blq0sXvou+p
hoRmfjtZP0sK3GgeZILI2ydMrhsBcY1g74tZF8WwJ+wA6gfoG1xZAxb++79qKDfz
B4I3ixjHI9Lo9ULVw/crOiL/hlHI1+KeT45GeK4MhoAtzBI4QR/8Wpxb2Zn4WLIJ
z/sp9hbXQHrG6tHHcUPF3socU3X9vFN+9U1RZV/C3zzwwk7CQht9/SAaZehQOtmM
cty7uTbedG1yPFyz+e+dyjQvEx2M0Q==
=dR/G
-----END PGP SIGNATURE-----

--Sig_/pQyu_hxH_r8UsjTVlhUT5z/--
