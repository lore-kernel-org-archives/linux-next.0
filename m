From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 17th
Date: Tue, 17 Oct 2017 21:44:07 +0100
Message-ID: <20171017204407.rtmdu67wyvmgo5uc@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5rejzj3eyqppxt72"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55800 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754553AbdJQUoJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2017 16:44:09 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--5rejzj3eyqppxt72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Changes since 20171016:

The akpm series gained even more conflicts and the net-next tree gained
two build failures for which I reverted commits as reverting the tree
triggered other issues.  I also dropped several commits from Kees Cook
=66rom the -next tree after discussion while issues are being
investigated.

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

--5rejzj3eyqppxt72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnma5YACgkQJNaLcl1U
h9Bwswf+KkGHfyAb+yvrdol2CaLEesFoudfrIkKaLAYGnk48IdJxH2dm2qAC5qaZ
0HGsSwlVI0rMsVdJaJimUmLMaSd06fWmwJsFSbM/woz5WXcdY495RMzZ3DeJmUZ1
50w0oRUy4S2fdB5WGjbH5VURDbBAPhPTRcxt0XPDE7AYBWA3NnmhfBpU8Yrf2ztk
f6mGj9Se9KGB0y3njua/qzpCKEdQpihWQ71p2YAFn5KRoraVRHO5RD0nz6sddOcZ
JLW5o4RUt/WfiuiHB+Sh35fTVOdfHGgYurqkKoM+AzD97w0DTtqA6WOvbHWuGZPn
ZdDZ2IvFDbH7jyhV2NMWoTcMA+Obig==
=wwtK
-----END PGP SIGNATURE-----

--5rejzj3eyqppxt72--
