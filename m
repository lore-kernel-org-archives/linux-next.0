From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bdev tree
Date: Thu, 16 Oct 2008 19:48:38 +1100
Message-ID: <20081016194838.8ec9ca9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Oct_2008_19_48_38_+1100_XDHztJsPZCGKY0gz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60576 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752733AbYJPIsw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 04:48:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__16_Oct_2008_19_48_38_+1100_XDHztJsPZCGKY0gz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

I tried to merge the bdev tree, but even the first commit had conflicts
so I have dropped it for today.  Given that it is based on next-20080919
and there has been a lot of changes since then, I was not hopeful. :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Oct_2008_19_48_38_+1100_XDHztJsPZCGKY0gz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj2/+YACgkQjjKRsyhoI8zBvQCfQNe5aSnsKzUWHRtPl7YnoMrc
9+IAmgL4Rwf/7IqebykRpEaQlMYCpHqN
=o4Zn
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Oct_2008_19_48_38_+1100_XDHztJsPZCGKY0gz--
