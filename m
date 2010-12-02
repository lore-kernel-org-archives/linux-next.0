From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commit ...
Date: Fri, 3 Dec 2010 09:29:28 +1100
Message-ID: <20101203092928.367d45c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Dec_2010_09_29_28_+1100_gt3mI4p/uckfhjG7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42355 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757274Ab0LBW3l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Dec 2010 17:29:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

--Signature=_Fri__3_Dec_2010_09_29_28_+1100_gt3mI4p/uckfhjG7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Commit 676dac4b1bee0469d6932f698aeb77e8489f5861 ("This patch adds a new
security attribute to Smack called") that was added to your tree today
has no Signed-off-by and could do with a better summary line in the
commit message.  And probably a better explanation of what it does.

Makes me wonder about the level of review it received :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Dec_2010_09_29_28_+1100_gt3mI4p/uckfhjG7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM+B3IAAoJEDMEi1NhKgbsBiEH/R8RqwbsRuoKBk4n6zWNZj/K
UCWHmvENxFMoDEfMpOaiHToZ96Ha0ihIlwRDS1qusFv+eMN8cNqBs7wi5eaBCyPc
X0MeXxLRZ4mNmyP+BkdaD4SWbG/gaytIrp2bUDBcoY1/yh5MbP5kNIA2ZdnIWSkx
03lWXP4nIGRw9rLPGhf2mN+QOn3uqxoy4Fit/kksP3oav8a8iHFaq1j8n7coGZqk
nC1pklxDXGXehAs9sbQiJVnmpoBlXMMEjPnINtt4Oi7DTXU668O3QC0zF0LtXwms
tNKY5UlP+XHqXSXcprQBm6DTnzTTZPAFPV82yLYrXA14nQjiuS8IAnvwGuyjNos=
=UToS
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Dec_2010_09_29_28_+1100_gt3mI4p/uckfhjG7--
