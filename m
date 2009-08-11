From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfsd tree build warning
Date: Tue, 11 Aug 2009 11:07:49 +1000
Message-ID: <20090811110749.040661e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__11_Aug_2009_11_07_49_+1000_fiRVmH6tk3hGNdDL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37717 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752355AbZHKBHz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Aug 2009 21:07:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__11_Aug_2009_11_07_49_+1000_fiRVmH6tk3hGNdDL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

net/sunrpc/svc_xprt.c: In function 'svc_pool_stats_show':
net/sunrpc/svc_xprt.c:1211: warning: too few arguments for format

Caused by commit ffcef87a1f31094709da615454b5911f3711bc65 ("Revert
"knfsd: avoid overloading the CPU scheduler with enormous load
averages"").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__11_Aug_2009_11_07_49_+1000_fiRVmH6tk3hGNdDL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqAxGYACgkQjjKRsyhoI8xB5ACdFrXlHQWcg18dPHgl3ZZixujP
tZEAn34n5h30wBuuDMyqDPYjYs/shXyu
=srBG
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Aug_2009_11_07_49_+1000_fiRVmH6tk3hGNdDL--
