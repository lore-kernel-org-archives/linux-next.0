From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the hid tree
Date: Fri, 20 Mar 2009 12:10:03 +1100
Message-ID: <20090320121003.9dae7789.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_12_10_03_+1100_Q=8Z+eUIDunyv6XP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43776 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750977AbZCTBKN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 21:10:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Jiri Slaby <jirislaby@gmail.com>, Oliver Neukum <oliver@neukum.org>, Jiri Kosina <jikos@jikos.cz>

--Signature=_Fri__20_Mar_2009_12_10_03_+1100_Q=8Z+eUIDunyv6XP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/hid/hid-core.c between commits
8390887fae55be9c06e3f064464d2bc8e908b8df ("HID: autosuspend support for
USB HID") and 76bb16394583f56c14cc90dc3746178d67eb5ed8 ("HID: remove
compat stuff") from the hid tree and commit
73a2ee6c5e4cff36772564f8150890ceaca776fb ("use the new
request_module_nowait() in the hid driver") from the rr tree.

Just overlapping removes/additions.  I fixed it up and can carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_12_10_03_+1100_Q=8Z+eUIDunyv6XP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC7OsACgkQjjKRsyhoI8yVigCgm76vhXpplZ521HuFanigdtj9
I9sAnivwIGpJ8Qykp2s+P+pkYPwkDdia
=0l4d
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_12_10_03_+1100_Q=8Z+eUIDunyv6XP--
