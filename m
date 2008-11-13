From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 16:24:04 +1100
Message-ID: <20081113162404.e8d64523.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_16_24_04_+1100_4af6p.6jVhZaq+8i"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55410 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751052AbYKMFYR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 00:24:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, "Serge E. Hallyn" <serue@us.ibm.com>

--Signature=_Thu__13_Nov_2008_16_24_04_+1100_4af6p.6jVhZaq+8i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got conflicts against the
security-testing tree (besides the two I tried to fix up).

I have dropped it again for today.

I think the only way forward is for you and James to come to some
arrangement.  Probably this will involve James merging your tree into his
and me removing creds as a separate tree from linux-next.

You may have to consider what happens to the userns tree as well (which I
have had to drop today as well since it depends on the creds tree).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_16_24_04_+1100_4af6p.6jVhZaq+8i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkbufQACgkQjjKRsyhoI8yehgCguWtgdk0y0Zp22Gne0xbLGkC4
IIgAnR6x1ZRKiNA5wzjKlRinmZqdWB5H
=PcR4
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_16_24_04_+1100_4af6p.6jVhZaq+8i--
