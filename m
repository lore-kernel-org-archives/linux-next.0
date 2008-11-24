From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Mon, 24 Nov 2008 13:43:01 +1100
Message-ID: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_13_43_01_+1100_K8c=RGQDl3JCPlwn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35931 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbYKXCnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 21:43:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>

--Signature=_Mon__24_Nov_2008_13_43_01_+1100_K8c=RGQDl3JCPlwn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/pcmcia/axnet_cs.c:908: error: static declaration of 'ei_tx_time=
out' follows non-static declaration
drivers/net/pcmcia/../8390.h:36: error: previous declaration of 'ei_tx_time=
out' was here
drivers/net/pcmcia/axnet_cs.c:1056: error: static declaration of 'ei_start_=
xmit' follows non-static declaration
drivers/net/pcmcia/../8390.h:37: error: previous declaration of 'ei_start_x=
mit' was here

Caused by commit 4e4fd4e485ad63a9074ff09a9b53ffc7a5c594ec ("ne2k: convert
to net_device_ops").

I have dropped the net tree again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_13_43_01_+1100_K8c=RGQDl3JCPlwn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqFLUACgkQjjKRsyhoI8wqyQCeJnaTYTlzcoCh08JNzdEs1h+b
NaIAoL3td4ZTJGzszYntfXASyYcyzeXt
=x49L
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_13_43_01_+1100_K8c=RGQDl3JCPlwn--
