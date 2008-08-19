From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Tue, 19 Aug 2008 15:23:01 +1000
Message-ID: <20080819152301.b36efbc3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Aug_2008_15_23_01_+1000_LIl8a3TrUJIkR_wl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33484 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752053AbYHSFXL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 01:23:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "Luck, Tony" <tony.luck@intel.com>

--Signature=_Tue__19_Aug_2008_15_23_01_+1000_LIl8a3TrUJIkR_wl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
arch/ia64/ia32/sys_ia32.c between commit
37c23e7fda6913d133ac12012395e58af1fe24c6 ("[IA64] use generic
compat_old_sys_readdir") from the ia64 tree and commit
8d88103c3046cd44df7591cb008afc22d526139b ("[PATCH] fix ia64 compat
readdir/getdents") from the vfs tree.

The former removes the code that the latter updates.  I used the version
from the ia64 tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Aug_2008_15_23_01_+1000_LIl8a3TrUJIkR_wl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiqWLUACgkQjjKRsyhoI8yQ2wCgr+cdCNpTASlIHvkRKMYwi2bt
UYQAnjHtxfLdgGXjJDpAjuGkesuSt9YY
=Vtvy
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Aug_2008_15_23_01_+1000_LIl8a3TrUJIkR_wl--
