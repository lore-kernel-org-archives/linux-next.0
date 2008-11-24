From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Mon, 24 Nov 2008 18:15:59 +1100
Message-ID: <20081124181559.3896a756.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_18_15_59_+1100_bJw2gNFqEyGwwns4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58210 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750751AbYKXHQS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 02:16:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Ken Chen <kenchen@google.com>, Ingo Molnar <mingo@elte.hu>, "David S. Miller" <davem@davemloft.net>

--Signature=_Mon__24_Nov_2008_18_15_59_+1100_bJw2gNFqEyGwwns4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Today's linux-next build (sparc64 allmodconfig) failed like this:

fs/proc/base.c:362: undefined reference to `save_stack_trace_tsk'

It has been failing like this for some time.

Caused by commit 788ff43b53179f3af8677d59c87104aff1f75bde ("proc:
add /proc/*/stack") which has been fixed up for MIPS, but needs another
fix for Sparc.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_18_15_59_+1100_bJw2gNFqEyGwwns4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqVK8ACgkQjjKRsyhoI8z8BgCgwCPhC4lraR/06n0pD1VsuuLw
9BYAn3ocHAKOGjMnj1O1/kmFSskXDmkY
=ll3h
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_18_15_59_+1100_bJw2gNFqEyGwwns4--
