From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Sep 5
Date: Fri, 5 Sep 2014 17:50:52 +0100
Message-ID: <20140905165052.GF29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8ysciihHaYDTQsg3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--8ysciihHaYDTQsg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Changes since 20140904:

None.

Non-merge commits (relative to Linus' tree): 3727
 3261 files changed, 133225 insertions(+), 99782 deletions(-)
=20
I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git .
If you are tracking the linux-next tree using git, you should not use
git pull" to do so as that will try to merge the new linux-next release
with the old one.  You should use "git fetch" and checkout or reset to
the new master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log files
in the Next directory.  Between each merge, the tree was built with an
allmodconfig for x86_64 and a multi_v7_defconfig for arm.

Below is a summary of the state of the merge.

I am currently merging 215 trees (counting Linus' and 30 trees of patches
pending for Linus' tree).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of Stephen's local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

--8ysciihHaYDTQsg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUCenpAAoJELSic+t+oim9bX8P/3k6mDnMZQqvjMlHn5NnkFj0
P9gYh4gsYyWy9QV33ev/8pnMb5F4o7BXdM+WftBvIJ3tUeiMSuOOViwxO+PB1Xg0
KMicyd9RmzFKIg319PtxtAW89OHEXKcq7DG57ndCUsaeaTG3qkpObdHrM0Wn7xVj
wFQ6OMH7doEEwgwFSt5CEXwJwlozDOOk05dWe2w3y/O2HLB0Ska1jfRVI+bb4gPi
Wig4BcJiM9EtBSUx7r+7sR6NAE/r/QWqyi7fe9ER5PcSCZRB5QqmDwc5X70uRhWS
UDyMS+Y9NnUNf28C7tKi6UqNOB7mTgSWbm94r4WO1vJZJQeA8PLR1jnpZBS9ZJhJ
IGgeu9EFcAFl4W3RCde+pNfntkiRGMMgyfKcVsDuXvBoWeOzsj64iNRBZtgDFiyl
OzK28FxHe0zTmOE780BVIW6O25VUuZfs3y2utisD3yA0qGkg+puOoi/0RQIHqlF0
P/rQsBL3vCjM5g17AU/jl7b5Ma/wTOEoFde2ALLWxHBMSAIeyZ0UYh06kc6tJhMF
RT5Du/0kBijbOZyw88M62RChjevuH94sNegl28o2R3RdMsnpp781Yn91xUij0TzW
s4uptYzfjY7f0YtXS6RYYHSt7pOSAyzx3tukMWZk1BTOQkMIhJKBxsq2QWbNcDo/
Tq5ir1mckuLciAXglS3b
=I/kV
-----END PGP SIGNATURE-----

--8ysciihHaYDTQsg3--
