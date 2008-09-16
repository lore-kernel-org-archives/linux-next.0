From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparc tree
Date: Wed, 17 Sep 2008 06:27:46 +1000
Message-ID: <20080917062746.b292a96a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Sep_2008_06_27_46_+1000_Fi0Jp.Rq7JXCMZS4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39551 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750749AbYIPU15 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 16:27:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__17_Sep_2008_06_27_46_+1000_Fi0Jp.Rq7JXCMZS4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the sparc tree got a conflict in
arch/sparc64/kernel/pci_psycho.c between commit
f948cc6ab9e61a8e88d70ee9aafc690e6d26f92c("sparc64: Fix OOPS in
psycho_pcierr_intr_other()") from the sparc-current tree and commit
e6e003720fd7123482f77dcec19e930d272937fe ("sparc64: Commonize large
portions of PSYCHO error handling") from the sparc tree.

The latter moves code that the former modifies.  So, as discsussed, I
dropped the former fix for today as I assume you will fix it when you
merge sparc-current.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Sep_2008_06_27_46_+1000_Fi0Jp.Rq7JXCMZS4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjQFsIACgkQjjKRsyhoI8xDbQCfZ/HyakldiwQLgvRfXutF6gEM
WIcAnjzOht4Q9HyPaApIikCpV2P+MWTK
=rlCT
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Sep_2008_06_27_46_+1000_Fi0Jp.Rq7JXCMZS4--
