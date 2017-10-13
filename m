From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 12th
Date: Fri, 13 Oct 2017 03:43:22 +0100
Message-ID: <20171013024322.vk6hounnbf5lhja5@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qbst7m3h5xzheqkt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41038 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753291AbdJMCnY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2017 22:43:24 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--qbst7m3h5xzheqkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

--qbst7m3h5xzheqkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlngKEkACgkQJNaLcl1U
h9AY2Af6A22rBI5agqPNsRSJk+W2Wj7emIY6TnRsN8DDhKd86DgcvSwvr26vh1eo
7vcOWlwyETDAJXZssNatfjiHghWf3C31PwuLgnSRiEovWDK/ka9aWR0wSN8o5RvG
oEEMOqoLpwQmfJs0IFCaOy8L1P8C7dDlSaIx/ojQ8Vk57TBb/u8Rr+A7Idtot9g4
GnjCn3e2bf0K/hscrqhsyl3+k7Tc5ulN/qVP3oehDVpRIypgWecTWQI2vKTJmjum
mJFXdqaTMVCCAvq6gt7Qa3DAe6AgNtyKq3sPsgiOUjbM8cCMuHIoUUUSXtiE0bBd
hYa0km+8euOMc36W5kwyNoTAPCDYXw==
=a8yt
-----END PGP SIGNATURE-----

--qbst7m3h5xzheqkt--
