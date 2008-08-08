From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 8 Aug 2008 16:01:43 +1000
Message-ID: <20080808160143.bd1c7ea3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Aug_2008_16_01_43_+1000_k4z0iFeA/KDtZRA0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33205 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752567AbYHHGBw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 02:01:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>, Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org

--Signature=_Fri__8_Aug_2008_16_01_43_+1000_k4z0iFeA/KDtZRA0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got conflicts in fs/cifs/dir.c
between commits 4e1e7fb9e879d48011a887715d7966484d9644ea ("bundle up Unix
SET_PATH_INFO args into a struct and change name") and
95089910933e10768cfef1ab0bab0c55b962aacb ("[CIFS] cifs_mkdir and
cifs_create should respect the setgid bit on parent dir") from the cifs
tree and commit 785af0f385cd424d4b40908bf0e467df3dc05434 ("CRED: Change
current->fs[ug]id to current_fs[ug]id()") from the creds tree.

I fixed it up as best I could.  Might be worth a check once I publish the
tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Aug_2008_16_01_43_+1000_k4z0iFeA/KDtZRA0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkib4UcACgkQjjKRsyhoI8zhFgCfU026isjR35bBN4aBzzTDYS3O
YHIAn3CpRYjrcjUlBi570XCiYAOPFRoz
=Ia5v
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Aug_2008_16_01_43_+1000_k4z0iFeA/KDtZRA0--
