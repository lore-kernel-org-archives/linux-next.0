From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Tue, 2 Feb 2010 17:10:54 +1100
Message-ID: <20100202171054.aaf86072.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Feb_2010_17_10_54_+1100_2a3TXM5_XCxSikvv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37380 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752774Ab0BBGLA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 01:11:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

--Signature=_Tue__2_Feb_2010_17_10_54_+1100_2a3TXM5_XCxSikvv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/usb/host/isp1760-hcd.c:22:24: error: asm/memory.h: No such file or =
directory

Caused by commit 571da0df39107568bb137d928862121ddae6aad1 ("isp1760:
Flush the D-cache for the pipe-in transfer buffers").

Only arm has an asm/memory.h ... so I guess it was only tested there?

I reverted that patch for today ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Feb_2010_17_10_54_+1100_2a3TXM5_XCxSikvv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktnwe4ACgkQjjKRsyhoI8w/igCfZNI+/UQcEZ3PlIG9JywLg6uj
CTYAniBnxGqbAZgFe2vsc3MVaWxftpUe
=KuLt
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Feb_2010_17_10_54_+1100_2a3TXM5_XCxSikvv--
