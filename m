From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ia64 tree
Date: Tue, 2 Apr 2013 11:20:17 +1100
Message-ID: <20130402112017.8c5e288cbbd31f93788df9d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__2_Apr_2013_11_20_17_+1100_s8EG/KBpP0VUapAv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56448 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758322Ab3DBAUa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Apr 2013 20:20:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, "Luck, Tony" <tony.luck@intel.com>

--Signature=_Tue__2_Apr_2013_11_20_17_+1100_s8EG/KBpP0VUapAv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
arch/ia64/kernel/palinfo.c between commit 40c275bd92b8 ("[IA64] Fix stack
overflow in create_palinfo_proc_entries") from the ia64 tree and commit
d8e904861a28 ("palinfo fixes") from the vfs tree.

I fixed it up (arbitrarily choosing the vfs tree version) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__2_Apr_2013_11_20_17_+1100_s8EG/KBpP0VUapAv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRWiRBAAoJEECxmPOUX5FEz1MP/Au28Vtsm6l6/bCDJJphGT8K
1t8nHPXWTuNlpRkFmQn6dIp9Lqz2Y2mqqkTuI+UIMnd5m7S9ghCsXXHIZ9FHHkPB
xM1j9j5ROrIX9oenf1yaDdNvBiJnkNWk0uMsWHaa1WrtJHe9YOlIqzXist/ONSEP
IA1gHqtUEgQDVjieLDSUjfMTDOxqkl44l7qfqNXW533dSsnGpXvKu/aPqJyzIISO
17OhlOqhgSkwfCKGVNHXT/rQt+0z/yaAHShKNwhIGN1169OTkSW6czNweDSrLMfY
NHsQ6kEOu9k5xzHrcgKwQFLwzL7/T6/9wYwwz26M1c6LClYq5KVdCGjaKeZRUXWt
ylkUzuqdRPtijIb/20PuUFbAgO0XPIYhtIqUkNltOUyvlgefVkFMVssvf2dOwPnP
Qu+K7PF37OPnPmteFlBWueL0FwKmqg5j902eEKebjIogSdaorAEVRJvzxNUpmt3Z
L8CTX4PaADE6RHZVwYxwork02YhhWcvlCU3h0ivGGSJpJwA7IUe3oRsueSOjsYxu
AC93znJVjVzwBi+/UGqPkdh2Y/AWkqK/Lo+mcc7Ij+QiA33Yu8rw+DYf4DZy2Dom
dTXzgNNuSpljShSZQhSWOcHGr7sN6LCsAk9CWrZN01zDHjkku31VI9n0ZqWVqFag
shVNA0cBjjSFqRcrOlKC
=I5mJ
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Apr_2013_11_20_17_+1100_s8EG/KBpP0VUapAv--
