From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext4 tree build failure
Date: Thu, 10 Dec 2009 11:38:12 +1100
Message-ID: <20091210113812.9d1e4bb4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Dec_2009_11_38_12_+1100_UDIMOzHHzEZZQjsG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53281 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756418AbZLJAiN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 19:38:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

--Signature=_Thu__10_Dec_2009_11_38_12_+1100_UDIMOzHHzEZZQjsG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "jbd2_log_start_commit" [fs/ext4/ext4.ko] undefined!

Caused by commit b436b9bef84de6893e86346d8fbf7104bc520645 ("ext4: Wait
for proper transaction commit on fsync") which I have reverted for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Dec_2009_11_38_12_+1100_UDIMOzHHzEZZQjsG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksgQvQACgkQjjKRsyhoI8wDCgCgnEnwYs8D/RIBMiFc9mIQI0zu
TegAoJUfEF8xqtGgPIQ4X9G7pjE/S/2z
=lqlF
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Dec_2009_11_38_12_+1100_UDIMOzHHzEZZQjsG--
