From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Thu, 13 Nov 2008 15:21:51 +1100
Message-ID: <20081113152151.6dc38681.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_15_21_51_+1100_tF09DTf9qPGEKZvt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39746 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751024AbYKMEWa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 23:22:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof =?UTF-8?B?SGHFgmFzYQ==?= <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Thu__13_Nov_2008_15_21_51_+1100_tF09DTf9qPGEKZvt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

I have been carrying a conflict between your tree, Linus' and the net
trees.  Could you please do the following:
	merge Linus' tree into yours and fix up the conflict
(Documentation/DocBook/wanbook.tmpl is modified in Linus' tree and
removed in yours)
	send commit 8a8c8f08abe7d3fd82c2853d0e1f391f8bfc96db ("WAN:
syncppp.c is no longer used by any kernel code. Remove it") to Dave
Miller to include in the net tree.  You can keep it in your tree as well.

Thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_15_21_51_+1100_tF09DTf9qPGEKZvt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkbq2AACgkQjjKRsyhoI8y+tQCdFW+0B3Y3OXSE47KPAyZ2dFS8
WtQAoLsxJScBZiFOZGVFYVTw1jTuFLas
=AtMv
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_15_21_51_+1100_tF09DTf9qPGEKZvt--
