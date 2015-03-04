From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Wed, 4 Mar 2015 13:48:44 +1100
Message-ID: <20150304134844.66ccc958@canb.auug.org.au>
References: <20150302165057.29087a08@canb.auug.org.au>
	<20150302170345.742add96@notabene.brown>
	<20150302171149.0a62b072@canb.auug.org.au>
	<20150303133531.72f10682@canb.auug.org.au>
	<20150304134418.70bc4457@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/anjMutmLy7Wce1tEWK5HpyH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36718 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755221AbbCDCsw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2015 21:48:52 -0500
In-Reply-To: <20150304134418.70bc4457@notabene.brown>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: NeilBrown <neilb@suse.de>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/anjMutmLy7Wce1tEWK5HpyH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Wed, 4 Mar 2015 13:44:18 +1100 NeilBrown <neilb@suse.de> wrote:
>
> sector_div() leave the remainder in it's first argument, so this isn't qu=
ite
> correct - you need to store resync_max_sectors in a temp variable.
> So I made that change and applied you patch.

OK, good catch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/anjMutmLy7Wce1tEWK5HpyH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU9nKRAAoJEMDTa8Ir7ZwV/iQP/3MCMKrlh2nN4/4h9bqtbH0r
FlXt0HGU2tk9lxKpBMwq/hpz3rQOjXwqHa5ysgsTGSGgiE3eSjaH8q5Z7LsaPsUs
MeoZO3DAzguaSHMt5wmbVTdOAPqs7k2aXOLW5Icw2422ytQWGKO87oXJc3HBZ6e6
ps1wEGxMyqA1xaWajw9sw2HlRWoC6oHf0IVaQiVg38uFMmtQm3Gpanv18UGWQwtM
kJxDp1BRRpbikOIPatI5RIvWIyOgIJXrizhG7uTx5mVws3cExI/jQ069wc7b8mjE
C92sgdjUpIZ0e55pe6R17j4VymDmEegFmFR86+q9yABVzg0+7qIDmhP5e7rE/3zr
Zl0gYUmtPevs2ubZfcu3CHuAjP7i6sUPDUYFn90T0Freppeuik/MXBvOON4sG3P4
UqEOVEY8XmIAM1e15qSyJj78rTsLa/Zz5LNt/jisydA9umc2INZZCTYynw5dFSGv
Mz9i+NRWZeeJo3wDBzrav5Bqh1HJT7/+PDRDpeeK4VOuVJMsIwbd3wCf+J/9GmJg
9ZqcjCgCNzSWKvNU61O4KGnaY1YiLfmKuKgy1nTbwxtZ4efPxyAt/R77F9QjEVSQ
U59d0GIveioOAoLpPqxauFd9uF+iiuhppPGLKC0iz5LQ8C6L5pxpf+wQSaZZ1wim
wI/q9UoqofGvzCIa/fOq
=XhKd
-----END PGP SIGNATURE-----

--Sig_/anjMutmLy7Wce1tEWK5HpyH--
