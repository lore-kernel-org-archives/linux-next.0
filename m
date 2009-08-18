From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the configfs tree with Linus' tree
Date: Tue, 18 Aug 2009 18:30:21 +1000
Message-ID: <20090818183021.e7eeb124.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__18_Aug_2009_18_30_21_+1000_XEeZE/Flf26NCui+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43242 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753149AbZHRIak (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2009 04:30:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joel Becker <Joel.Becker@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__18_Aug_2009_18_30_21_+1000_XEeZE/Flf26NCui+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joel,

The linux-next merge of the configfs tree gets a conflict in
fs/configfs/dir.c between commit 420118caa32c8ccdf9fce5a623b9de3f951573c5
("configfs: Rework configfs_depend_item() locking and make lockdep
happy") from Linus' tree and commit
8af7d5ffe1b6468ed0de1c2bb5335ad40b755ba3 ("configfs: Rework
configfs_depend_item() locking and make lockdep happy") from the configfs
tree.  I have been getting this for some time.

The former is just a newer version of the latter.  Since all the commits
in the configfs tree seem to be in Linus' tree now, could you please
update it to be his tree to fix the above conflict, thanks.  (The
configfs tree for linux-next hasn't been updated since April 30.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__18_Aug_2009_18_30_21_+1000_XEeZE/Flf26NCui+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqKZp4ACgkQjjKRsyhoI8wM7ACdEimF8SXxqhR3yHqbNTRXsI64
7AgAn27CSGD1Q3p3qc5kRIX+KqR7+L86
=006s
-----END PGP SIGNATURE-----

--Signature=_Tue__18_Aug_2009_18_30_21_+1000_XEeZE/Flf26NCui+--
