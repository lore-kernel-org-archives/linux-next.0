From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: What's *NOT* in linux-next
Date: Mon, 4 Aug 2008 16:32:20 +0200
Message-ID: <20080804143220.GD4182@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:35144 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757496AbYHDOcW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 10:32:22 -0400
Received: from denkbrett.schottelius.org (natgw.netstream.ch [62.65.128.28])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.schottelius.org (Postfix) with ESMTPSA id 38E112F9DAF
	for <linux-next@vger.kernel.org>; Mon,  4 Aug 2008 16:32:17 +0200 (CEST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

As I've the problem that linux-next is rebased and I want a merged path,
I am also interested in what is in the trees Stephen follows, but is not
merged into linux-next.

The script at

   http://unix.schottelius.org/cgi-bin/gitweb.cgi?p=3Dnsbin;a=3Dblob;f=3Dli=
nux/cherry-branches.sh;h=3D15006458d51d049f6453cb8f9459a068baf8f0dc;hb=3D38=
01d72e51a1c72dd10bac6c715b532ed8e17a4d

prints out the missing commits, prefixed by the remote name.

This allows me now to check those remote with changes and check whether
they could be merged without the need to rebase stuff.

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiXEvQACgkQuL75KpiFGIwORgCgq8Fr3otALIcW4fyPVywLnbre
+ewAoIMlUiSdCR+IkBdZo3Et6Lp28KYV
=hyc0
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--
