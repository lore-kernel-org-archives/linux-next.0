From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for 2nd December
Date: Thu, 3 Dec 2015 01:18:14 +0000
Message-ID: <20151203011814.GC5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58392 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757429AbbLCBSV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 20:18:21 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20151127:

The block and gpio trees gained build failures so I used the versions
=66rom next-20151127.

There were quite a lot of new conflicts from Arnd's arm multiplatform
series which I fixed up, plus a few other new conflicts from other
sources.

I messed up using Stephen's scripts so only the akpm-current tree was
merged of Andrew Morton's trees.  Sorry about that, it's gone 1am so I'm
not about to try to fix anything up.

I will run a build again tomorrow (Thursday 3rd).  I *may* also do one
on Friday but it will have less build coverage and may not appear till
Saturday if I do.

Non-merge commits (relative to Linus' tree): 3399
 5261 files changed, 719667 insertions(+), 620445 deletions(-)

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
If you are tracking the linux-next tree using git, you should not use
"git pull" to do so as that will try to merge the new linux-next release
with the old one.  You should use "git fetch" and checkout or reset to
the new master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a defconfig for arm64 and an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf.

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX5hVAAoJECTWi3JdVIfQkKoH/jS9BgE6DUgciKGljJ/mEz98
L9lB9hBbJnybX//18pvHuaCzIfhJi18ovqjTS45P2JMAhrOpGeUblRwIBSaUwFIM
Y0BFT5M3Zo9lTSeIakCPBCxmWcHEIpel4FQFlDg88dDGcSTXnODo7Io+B5X3bf2Y
t6n2Nhiw5d8sidSeiIcRNN9P7tAWkaAM0H0PGLM1JwVvH1fZhBZKQc2RnnsJJdWh
JUYEbmG70+aFmRa8WhGOH3eaIWAAEqUETuRm/05AyK6jl09xa5HbgBx6H/0YSCZK
WaRkWLodIDFo/m6td5RSb6Aw5NFtgIgSXrxMbIh+9q/8v4qAQV4qPsTemfyuVIM=
=2xn+
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
