From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hwpoison tree build failure
Date: Tue, 8 Dec 2009 19:14:18 +1100
Message-ID: <20091208191418.79270012.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Dec_2009_19_14_18_+1100_vLQBTig6._DhNGnh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48015 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752364AbZLHIOR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2009 03:14:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__8_Dec_2009_19_14_18_+1100_vLQBTig6._DhNGnh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "set_migratetype_isolate" [mm/hwpoison-inject.ko] undefined!
ERROR: "unset_migratetype_isolate" [mm/hwpoison-inject.ko] undefined!

I have used the version from next-20091207 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Dec_2009_19_14_18_+1100_vLQBTig6._DhNGnh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkseCtoACgkQjjKRsyhoI8yEzACeM7Myq3ewL1pf0bEzrkef0EQE
wM4AnREZC4TlDkd30hMwU5NizBntZfSl
=Luf0
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Dec_2009_19_14_18_+1100_vLQBTig6._DhNGnh--
