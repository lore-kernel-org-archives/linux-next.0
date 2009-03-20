From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Fri, 20 Mar 2009 11:32:42 +1100
Message-ID: <20090320113242.bfe7fe62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_11_32_42_+1100_rVwGJPljZy6HKsG5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34022 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756017AbZCTAcw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 20:32:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Mark McLoughlin <markmc@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, Pantelis Koukousoulas <pktoss@gmail.com>

--Signature=_Fri__20_Mar_2009_11_32_42_+1100_rVwGJPljZy6HKsG5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/virtio_net.c between commit
4783256ef92f5aecd6d54693b16386f2a0021c2a ("virtio_net: Make virtio_net
support carrier detection") from the net-current tree and commit
9f4d26d0f3016cf8813977d624751b94465fa317 ("virtio_net: add link status
handling") from the net tree.

I think that the latter patch means that the former is not needed, so I
used the version from the net tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_11_32_42_+1100_rVwGJPljZy6HKsG5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC5CsACgkQjjKRsyhoI8wJ6QCfW46o+deEkAnz3Gr65HnrLSKV
sL8Anj0Aro9xdsL4+gyeNrdNjk6LrlGK
=jm9b
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_11_32_42_+1100_rVwGJPljZy6HKsG5--
