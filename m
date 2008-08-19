From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of ttydev failed
Date: Tue, 19 Aug 2008 10:49:52 +1000
Message-ID: <20080819104952.ddf914e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Aug_2008_10_49_52_+1000_KPrxA3vbAn=x1+Fa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757332AbYHSAuB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 20:50:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__19_Aug_2008_10_49_52_+1000_KPrxA3vbAn=x1+Fa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Firstly, can you put a line in your series files that looks like this:

# BASE <sha1|git commit identifier>

This could replace the current first line you have or be another line
with the same id in it.

Next, the import failed like this:

tty-remove-resize-special
error: No changes

The same for tty-fix-cdc-acm.

Not a biggy, I just removed those patches from the series file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Aug_2008_10_49_52_+1000_KPrxA3vbAn=x1+Fa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiqGLAACgkQjjKRsyhoI8ytoQCfaoz1Wsb360n29CCY+s1Qfzec
S7UAnRHMlSNb+m5E2f8SKcQ1T0IcRT7h
=nqyp
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Aug_2008_10_49_52_+1000_KPrxA3vbAn=x1+Fa--
