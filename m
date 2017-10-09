From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 9th
Date: Mon, 9 Oct 2017 22:21:22 +0100
Message-ID: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="72fid4vymnxizmy7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52088 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbdJIVVY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 17:21:24 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--72fid4vymnxizmy7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For my birthday I've gone and got myself a linux-next tree:

Changes since 20170929:

The net-next and drm trees lost their build failures but the rcu tree
gained one.

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

--72fid4vymnxizmy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnb6FIACgkQJNaLcl1U
h9B02wf/XJSfqCc9liCooM5/ustwu5ZJUt3XrYOGL3aDE1K0dJzsqI1r5tYX/0ZP
714Q6Xz0P5vOJRkJQncqVOPFy1WvsqoY9+1HrLeGvK9Zxj/O35pig7p2s2CcFpxV
L209A05G3GbpFcFqmDgeHbrSXV2PYELujMsb9GIiE0x73L4nlfilH85w9nnEX3nS
ZMOjD7Mv9/Mzl11RV6Y88GZ8WYXA4OQ5Fq9Evw/b3gsGvBHK8UTs6a4KT2kkDMcE
0JCVgrYrYVPzC1K4BhkZrgVDxYRil/nr0MUQRbKNB9fiJoroFFg07UoAyD9X96IT
xAxFFNbR/jo/GSOo41YdfilnY+xsFQ==
=Iixg
-----END PGP SIGNATURE-----

--72fid4vymnxizmy7--
