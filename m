From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 18th
Date: Thu, 19 Oct 2017 01:15:59 +0100
Message-ID: <20171019001559.fbubnkm23spmov7r@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6z6buxdvwh4ep34t"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60376 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751077AbdJSAQB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2017 20:16:01 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--6z6buxdvwh4ep34t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm going to have a go at doing a -next build tomorrow but I'm starting
pre-Prague travel in the evening so it's pot luck if it completes in
time.  If not this will be the last build before Stephen returns to work
and your usual levels of competence.

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

--6z6buxdvwh4ep34t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnn7r4ACgkQJNaLcl1U
h9A/9gf/XLv/WiKrnlQUbUPQYtsCEKqay7bRPT9lfgXyzIvTU70FF3MENq5GZkn8
g84H3vAyCOLz0Z2Dy+2Y8fYddihE7gyPfmG2SIXn9A0uSHCuQLTLtN23aE6xGJdg
Mewf0F5a9O+DV5O5oezYTZdtDcdknxtDqtQC+u1whCTGd+Je2fs+ic1MAvj84Se4
LCsj//1XU6IOEdWguorPsCFdOkteYTTaDdsXvTQl3o1xrM4Zj+IyBSJ7y0Y1YaOW
TzsvW9algUWF5qgmme0vlVJuO9vbD5AuccS9NpS/zWZ/gwBhHrfz9CLawFMEDkpE
lCFm0EpkMY/Fmr3qd7lgrstkoOZWkA==
=CFva
-----END PGP SIGNATURE-----

--6z6buxdvwh4ep34t--
