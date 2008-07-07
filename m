From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Mon, 7 Jul 2008 20:49:55 +1000
Message-ID: <20080707204955.67914f3b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_20_49_55_+1000_D1ZHif7K8T0FqUP4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36176 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752775AbYGGKuC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 06:50:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__7_Jul_2008_20_49_55_+1000_D1ZHif7K8T0FqUP4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got a conflict in
drivers/ide/ide.c between commits
2b54ed9467697b0ce2d60d89e5e4253c9e322c26 ("ide: ide_unregister() locking
bugfix"), bd8a59e29726b2a5ff7baefe995febdc63044a61 ("ide: ide_unregister
() warm-plug bugfix") and 7cd95f56cb61f5348d062527c9d3653196f6e629 ("ide:
fix hwif->gendev refcounting") from Linus' tree (which all exist in the
ide tree as well) and bits from the ide tree (since it does more work in
the same areas).

I took the ide tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_20_49_55_+1000_D1ZHif7K8T0FqUP4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhx9NMACgkQjjKRsyhoI8xxPQCggBNb7KOkkq3QvAC8yqaCJWcA
sBkAoJgGX5cyY/zuhJVbApkrwniczQPH
=zvA+
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_20_49_55_+1000_D1ZHif7K8T0FqUP4--
