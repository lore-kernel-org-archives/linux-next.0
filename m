From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error fetching the apm tree
Date: Tue, 24 May 2011 14:21:47 +1000
Message-ID: <20110524142147.369dd3ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_May_2011_14_21_47_+1000_KZtVgkW_bB7FCi_3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37006 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751246Ab1EXEWB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 May 2011 00:22:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_May_2011_14_21_47_+1000_KZtVgkW_bB7FCi_3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

$ git fetch apm
fatal: Couldn't find remote ref refs/heads/for-next

Looks like the apm tree lost its for-next branch
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_May_2011_14_21_47_+1000_KZtVgkW_bB7FCi_3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN2zJbAAoJEDMEi1NhKgbsK8wH/2mStGRUMvHCPg1WhY9Nf5r4
ZcQoND5rYKwgPN0GBpxx6df0tB+CktVibbyaAXZ2UuxL+j0Q14hHw3Q3oLD7z3L7
8xzTJH/LfFs16xXyG+ZwiwT3nODjupLo5uKeiGTbuC+RrwDKDtih3qv/GLLrs7v6
CqeEzrcKMmsX7TiOLlYcfJNtHq1xsA5g8FcNQzdvi9uKyHsWjp+367/uTJElicu2
axvzZbFXu5Q/i9rOoRE8GqCLQG/0jsRjsOyo1LjiXjFQl4HTBcssETSlOaPVJu7/
Kej3ZfZ4TvswB3zxJuQOAqsAeiSCrSl7OXrfJ3XhHyIXgb04wH7E+AfEmSAuJPs=
=yPA0
-----END PGP SIGNATURE-----

--Signature=_Tue__24_May_2011_14_21_47_+1000_KZtVgkW_bB7FCi_3--
