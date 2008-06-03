From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upstream,rr merge conflict
Date: Tue, 3 Jun 2008 14:33:14 +1000
Message-ID: <20080603143314.78b775b0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Jun_2008_14_33_14_+1000_sEb.QAcgH4HmyS_K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37812 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751518AbYFCEdU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2008 00:33:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__3_Jun_2008_14_33_14_+1000_sEb.QAcgH4HmyS_K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
include/linux/virtio_config.h between commit
b4f68be6c5d507afdcd74f5be3df0b1209cda503 ("virtio: force callback on
empty.") from Linus' tree and commit
47f299f584f925ee0bd7ae05c5a85efbcb1e6022 ("virtio:transport-features")
from the rr tree.  I kept both additions to the file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Jun_2008_14_33_14_+1000_sEb.QAcgH4HmyS_K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRMmOTgG2atn1QN8RAlRgAJ49hHIvMmBKNvuiPfP8+2+swCmXxwCfVTlL
5dlT7uy7BKrits0euTE3guA=
=qrJc
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Jun_2008_14_33_14_+1000_sEb.QAcgH4HmyS_K--
