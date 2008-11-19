From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Wed, 19 Nov 2008 14:21:05 +1100
Message-ID: <20081119142105.43c0e9bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_14_21_05_+1100_W6TT+rBpawTeUaO0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51550 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751479AbYKSDVY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 22:21:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Zhaolei <zhaolei@cn.fujitsu.com>, Fernando Luis =?UTF-8?B?VsOhenF1ZXo=?= Cao <fernando@oss.ntt.co.jp>

--Signature=_Wed__19_Nov_2008_14_21_05_+1100_W6TT+rBpawTeUaO0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/block/xen-blkfront.c between commit
68aee07f9bad2c830a898cf6d6bfc11ea24efc40 ("Release old elevator on change
elevator") from Linus' tree and commit
f7ed11048c85660828fa2017ea2e3da27235f76a ("xen-blkfront: set queue
paravirt flag") from the block tree.

I used the version from the block tree and will carry this fix for a
while but assume that you will fix the conflict in the block tree soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_14_21_05_+1100_W6TT+rBpawTeUaO0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjhiEACgkQjjKRsyhoI8ypPQCcCubvFv7IEdUS+ThN+ezii9WR
CyQAn1is+rYxTBRsWYy2wYy2BRxA8/nA
=XHBg
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_14_21_05_+1100_W6TT+rBpawTeUaO0--
