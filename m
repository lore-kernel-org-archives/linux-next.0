From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Wed, 29 Oct 2008 15:28:49 +1100
Message-ID: <20081029152849.3883d072.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Oct_2008_15_28_49_+1100_s18S.h1SEWKQmRdx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55315 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869AbYJ2E27 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 00:28:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__29_Oct_2008_15_28_49_+1100_s18S.h1SEWKQmRdx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got quite a few conflicts - too
many for me to fix up right now.  I shall drop it for today and try again
tomorrow.

One thing:  You need to sort out where patches belong as at least one
change that conflicted was because different versions of the same fix was
applied to the rr and cpus4096 trees.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. looking at commit dba205acec6f7db0b53abdf5b26802c19c0d9abf
("cpumask: fixlets") from the cpus4096 tree, "Signed-of-by: has two
'f's :-)

--Signature=_Wed__29_Oct_2008_15_28_49_+1100_s18S.h1SEWKQmRdx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkH5oEACgkQjjKRsyhoI8zQ8QCgkXSqmzfOOS+y6khODilmyraM
K2cAoJ7agyvNZ9xGG9O6D/AbRfo5+nWM
=aCxe
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Oct_2008_15_28_49_+1100_s18S.h1SEWKQmRdx--
