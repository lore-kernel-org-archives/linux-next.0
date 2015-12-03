From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for 3rd December
Date: Thu, 3 Dec 2015 23:31:43 +0000
Message-ID: <20151203233143.GI5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sl5MdczEF/OU2Miu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59762 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753293AbbLCXbw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 18:31:52 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org


--sl5MdczEF/OU2Miu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20151202:

Both of Andrew's trees are included.

The block and gpio trees still have their build failures so I used the
versions from next-20151127.

There were several new conflicts between the drm-intel-fixes and
drm-next trees.

It is very unlikely that there will be a build tomorrow, Stephen will be
back and -next will be back to normal on Monday.

Non-merge commits (relative to Linus' tree): 3709
 5435 files changed, 721155 insertions(+), 627700 deletions(-)

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

--sl5MdczEF/OU2Miu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYNDfAAoJECTWi3JdVIfQ2ikH/RcYMuPj2voEuxXuohbgAsQH
/LscKqMACavbeAqtaPi3BPglVsdnNUxxDlyKSlFEI43BmXxA2Upp84YN96l3KC4D
CIdHS06XoSDaSHIxPqwtYiEQmd35jrBC+rPDM2soENvi6KJmsXiidmJZkMQIpHlP
XdYCJIpgVS3MLmLRvSWWqsg9yeisbWfMZgSKHyOnhGKrJJIux+KyNU2X4f8qTanZ
vvFf0r3muJtKlD30w5rbdy//B6sBB5c4cyxJPAn5pC7dVKbgAf86ZRtfwSIlPBhf
TIVOBP+SdwIvCWL6ZFA8b8xC8GpFRhOJ71LIFX1KnxcTi2g12p2dNXDJw5QFrZ4=
=CxFT
-----END PGP SIGNATURE-----

--sl5MdczEF/OU2Miu--
