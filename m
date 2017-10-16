From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 16th
Date: Mon, 16 Oct 2017 21:08:33 +0100
Message-ID: <20171016200833.zdbu7zbcw5tknle6@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vuleqmdkdhheino4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--vuleqmdkdhheino4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Changes since 20171013:

The thermal, net-next and several more DRM trees gained conflicts, as
did the akpm series.

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with an arm64 defconfig, an allmodconfig (with
CONFIG_BUILD_DOCSRC=3Dn) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
and arm64 allnoconfig=20

--vuleqmdkdhheino4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnlEcAACgkQJNaLcl1U
h9DnXgf/YVB3WaCFGMtkFk52900hXbpiqD5UVpTO2vlj15B8CSaO8elZI5IRmF9H
qMTEH0CNri4DVtC2/a8twM601xl79bfKHVjZ+R4WE/OS7QR17Wdb3+2+sfqTDP8g
WOPeHTS1JDVct31UJrk5IhOtMyEpeDviKCG99TJ7bB0wh3nBgFsXkOjPAUrf87Du
Ks/vgqQa1I4Wpoyx0q/2QsFdb108cVIQWX0dxvTG4nJiNmr4BvLU6aaJXRUrrTeZ
brYUBZXzPqXiF6NlzIFprNUG9WXQ0rhc6sIJ+EDMLl/4FOB+xLMH3/igDmEZJand
Rhqh7J1PWq9jBpeigU857aADQ2blZA==
=S9NN
-----END PGP SIGNATURE-----

--vuleqmdkdhheino4--
