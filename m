From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Wed, 9 Jul 2008 12:47:44 +1000
Message-ID: <20080709124744.2468d3fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_12_47_44_+1000_1_yxLVoAt.b7=eZk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49513 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751046AbYGICrv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 22:47:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__9_Jul_2008_12_47_44_+1000_1_yxLVoAt.b7=eZk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got a conflict in
drivers/ide/pci/it8213.c between commit
be305042b7a01a1ab03a8adfa95f57bc63e012e1 ("it8213: fix return value in
it8213_init_one()") from Linus' tree (which is also in the ide tree) and
commit 0524d020934e71bad3b9ea60e1c98ab7725c8aad ("ide: add ->dev and
->host_priv fields to struct ide_host") from the ide tree.

I just used the ide tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_12_47_44_+1000_1_yxLVoAt.b7=eZk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0JtAACgkQjjKRsyhoI8w5ygCcCG9WFT6p7XRd8w2BJ9OhWec5
eHgAoKKHN/QC158L5vO67StRTEtJCTp6
=DN0j
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_12_47_44_+1000_1_yxLVoAt.b7=eZk--
