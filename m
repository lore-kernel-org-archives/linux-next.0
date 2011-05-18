From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rr tree
Date: Wed, 18 May 2011 13:41:03 +1000
Message-ID: <20110518134103.f99c75a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_May_2011_13_41_03_+1000_QOHzmWrpldvEYyQM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43736 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932807Ab1ERDlL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 May 2011 23:41:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessio Igor Bogani <abogani@kernel.org>

--Signature=_Wed__18_May_2011_13_41_03_+1000_QOHzmWrpldvEYyQM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr tree, today's linux-next build produced this warning:

kernel/module.c: In function 'lookup_symbol':
kernel/module.c:2058: warning: unused variable 'ks'

Introduced by commit 903996de9b35 ("module: Use binary search in lookup_sym=
bol()").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_May_2011_13_41_03_+1000_QOHzmWrpldvEYyQM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN0z/PAAoJEDMEi1NhKgbsjVkH/R3T2nYobv0Eu1JFeEoskV5N
jIZrP3SATsc5ET9DNWrMZFT6iFgCLhtdYBLy8OjwkbexqYipKwP/mbwcU55WJGHR
8wCabIG3MuBNqNJU2Rkkgbpt3meV+1ZJ6lspOD21XKXBx8l7zEnCOAU1kpIjdV/6
DS2A3XptNvd6m/w/u8lDf2sH9CJF+UmRiYpv83f13GxS44GCcxCIxvm2TVSc9Tkh
H3uJJscBZjq14UZj+r/ifuu3KfcF7PHScGQiWobn/z9MWbKV5cbOCzg+g57Z0oMu
SLPl7+KTDlXdIBGtVVEOySm/fNU6QHPF/ubmGI35lEqKh8qZuF0aMUO3Y4iynWE=
=MUxW
-----END PGP SIGNATURE-----

--Signature=_Wed__18_May_2011_13_41_03_+1000_QOHzmWrpldvEYyQM--
