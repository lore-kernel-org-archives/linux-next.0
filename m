From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the hwpoison tree
Date: Tue, 1 Jun 2010 16:00:50 +1000
Message-ID: <20100601160050.91404d78.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jun_2010_16_00_50_+1000_xsnyU_jkT4ionoZc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49741 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671Ab0FAGA6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jun 2010 02:00:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

--Signature=_Tue__1_Jun_2010_16_00_50_+1000_xsnyU_jkT4ionoZc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

After merging the hwpoison tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "PageHuge" [mm/hwpoison-inject.ko] undefined!

Caused by commit 0bfc18afbf46bf2d93d55ec64501fff17067a1c2 ("HWPOISON,
hugetlb: support hwpoison injection for hugepage").

I have used the hwpoison tree from next-20100531 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jun_2010_16_00_50_+1000_xsnyU_jkT4ionoZc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwEohIACgkQjjKRsyhoI8w0MwCfZjlGCblNEkwJrFVn1IMb4Cvy
RJgAoJBd4QRosd9D/OscBFohzZ6HCdC4
=GA01
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jun_2010_16_00_50_+1000_xsnyU_jkT4ionoZc--
