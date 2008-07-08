From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree
Date: Tue, 8 Jul 2008 10:16:26 +1000
Message-ID: <20080708101626.bac19ed7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_10_16_26_+1000_0ZC3ul18BBGxp/gX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42534 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753939AbYGHAQe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 20:16:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_Jul_2008_10_16_26_+1000_0ZC3ul18BBGxp/gX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
lib/vsprintf.c between several commits from Linus' tree and commit
bf4bb495e5dc8f1abba98bb6cb08b2d94446a662 ("printk: add support for '%
pS'") from the tip-core tree.

I just used Linus' version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_10_16_26_+1000_0ZC3ul18BBGxp/gX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhysdoACgkQjjKRsyhoI8yTDgCgmVfXXi/A+K2UvgalhwkaBpIr
3j8An3sCkzsOpHTLbcfITaYSrC6a8ph9
=m3t+
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_10_16_26_+1000_0ZC3ul18BBGxp/gX--
