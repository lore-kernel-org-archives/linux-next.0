From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
 (device-mapper tree related)
Date: Wed, 27 Jun 2012 13:02:21 +1000
Message-ID: <20120627130221.803b4144284489498aa9b8af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__27_Jun_2012_13_02_21_+1000_G9PwA3nNnJfe3b3x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:48488 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753821Ab2F0DCf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Jun 2012 23:02:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

--Signature=_Wed__27_Jun_2012_13_02_21_+1000_G9PwA3nNnJfe3b3x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/md/persistent-data/dm-space-map-checker.c: In function 'ca_create':
drivers/md/persistent-data/dm-space-map-checker.c:96:3: error: implicit dec=
laration of function 'vzalloc' [-Werror=3Dimplicit-function-declaration]
drivers/md/persistent-data/dm-space-map-checker.c:96:14: warning: assignmen=
t makes pointer from integer without a cast [enabled by default]
drivers/md/persistent-data/dm-space-map-checker.c: In function 'ca_destroy':
drivers/md/persistent-data/dm-space-map-checker.c:106:2: error: implicit de=
claration of function 'vfree' [-Werror=3Dimplicit-function-declaration]
drivers/md/persistent-data/dm-space-map-checker.c: In function 'ca_extend':
drivers/md/persistent-data/dm-space-map-checker.c:139:21: warning: initiali=
zation makes pointer from integer without a cast [enabled by default]

Caused by commit 30ebb0baeef5 ("If CONFIG_DM_DEBUG_SPACE_MAPS is enabled
and memory is fragmented and a") from the device-mapper tree.  Presumably
a missing include of vmalloc.h.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__27_Jun_2012_13_02_21_+1000_G9PwA3nNnJfe3b3x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP6ne9AAoJEECxmPOUX5FEvMcP/02AVFbEbdLkOBcVhMK444XT
WsCkbDgG8+rvUhNOmPEW+Bmpk60tuJVzYfvb6yua+XTOVJRK/IrJM5KXxF6atTsr
6FKrDRJUqmqyLYewUVKhnR4ePH0Fp4Ubc1T9BE0Ar28iffmBWt0l26oCDYr/pbX0
JyY1k9QNgWIDbaaXpUDQ4PvgVUyGvTrrlsmMOQ+E6rVhYHld0EIzPdRtJD8FqyDl
l93fGcWZ8Ov2UFULGh6MejNwde/ruRF0rZJR9TRbjMTUsvUoOyY+SWtlFWwC6wse
CXeIcjSQOWuYZwg3Uqm3jCZghSzsgF2IA2xsb1OnfSCE1FZ0X6CS2CpxdkBUhn7j
nvFck2q9IR+Hn1oBAFOLSi+djYCZVxC2zjo+aLyM8OOsERRKdogxiyhpiko2eOlF
8EiNSyEZMcAiBtR4OH6xvliIGM4NCVuJnOA2Qo4h1HOw0PL7bWj350VqeYn9cFsX
Wfi+9rbVwKqXnH66zbTuR9toniP6t+hfKieEABm2nOmZHvvBGotyjb5wbO4z3O8u
Yq3d8GcOf3AU0sxF1a7YXLuWKtIH9bt0tyr3V5dygBnAiM5SYouMRiyn5x0ZqWtP
jwbLz6yiIIRfOAhV2IkuT6SGxbLZU4TJM6CHZauDnqu6SNDVteeOGVTnTHe3lsV4
PfCkT6KBFgoUIPDm6QFP
=6/ax
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Jun_2012_13_02_21_+1000_G9PwA3nNnJfe3b3x--
