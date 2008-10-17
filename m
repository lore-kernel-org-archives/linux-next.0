From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v9fs tree
Date: Fri, 17 Oct 2008 15:17:29 +1100
Message-ID: <20081017151729.0cd36dae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_15_17_29_+1100_9jyTOneylpf9QvEE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36431 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750838AbYJQERj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 00:17:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__17_Oct_2008_15_17_29_+1100_9jyTOneylpf9QvEE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the v9fs tree got a conflict in
include/net/9p/9p.h between commit
d5c003b4d1690e666dbab02bc8e705947baa848c ("include: replace __FUNCTION__
with __func__") from Linus' tree and commit
33363af997469100ed3f56c2eb43da06f2a1795b ("9p: eliminate depricated conv
functions") from the v9fs tree.

The latter included the former's change, so I just used the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_15_17_29_+1100_9jyTOneylpf9QvEE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj4EdkACgkQjjKRsyhoI8wGvACfUUDbcOX5zjIRN0ehrSlUNQev
xoAAnjW3rgD2u9C55SRGtqjRbJ6ancxW
=yqOe
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_15_17_29_+1100_9jyTOneylpf9QvEE--
