From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Sun, 22 Feb 2015 11:51:59 +1100
Message-ID: <20150222115159.124ff660@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7m1BnlUiZGtiZG7CxV0kBEQ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44958 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751744AbbBVAwG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:52:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Tom Haynes <thomas.haynes@primarydata.com>

--Sig_/7m1BnlUiZGtiZG7CxV0kBEQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/nfs/filelayout/filelayout.c between commit 338d00cfef07 ("pnfs:
Refactor the *_layout_mark_request_commit to use
pnfs_layout_mark_request_commit") from Linus' tree and commit
d92dd5c34974 ("VFS: (Scripted) Convert ->d_inode to fs_inode() in
fs/nfs/") from the vfs tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/7m1BnlUiZGtiZG7CxV0kBEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6Sg0AAoJEMDTa8Ir7ZwVcsEP/R7GqvHL4jTDLTypKp4aEITn
l3VXkIgB9h0Z7gQAkK6i4YAJXwl9UIWBaAtEuVK9lirukEeQi985Gn0teU6OUh7y
snyCqHGG1cBqtHDbbYmq+V3hWi10mENcLhXNGCOF/fa0cViUohjsXllBzogOFswp
eQQ/gQ4NnM7H5MjDBQFTywXY0FYRiU+nJJ+JGTZ1+19jc0mmQw6aNyiTMrZeK5Bz
BlWBI+izvpcsd27E/e6rtQQWjzwLJQxySa3KQyYtYBQI4lq0OcJ9dm5xvo6s1rlP
nG72ao8CSYYaVpDX6pSeEZWUcyCEuymgVq9rqPMLcx2sdZqWQ8nD8kFzpA3Vr1Du
dxxnEN0eyOw/QTKoE6s6KGvReoxGQmQ9QomceK51K6iVoOzoQnpkSdmNELGbqooW
QznJCiCufcNPBQ5I3NsSv0tONho79USIC/kqgVIc42R9U+lDlqUBTiayvGDZfxCG
wkPY5Wq/huGgpYs3shJ5j6MQSu6ZFE8hUusboax4str37ugPgtfWkXh41xMTialx
A/sQlUWHRCi9isINZdOlkkfE9uavRH9Uw8wn+iW8Co7njEcto/kq8iQjO2l+Y8AC
QZUHvDKlaCxF6zWbZhubysi5jnUiWqlpETmuLxhM+ISeV2XbWXXk9w7luoZn7I4D
4zinNnC0ggs7bXbYqlg4
=pfyw
-----END PGP SIGNATURE-----

--Sig_/7m1BnlUiZGtiZG7CxV0kBEQ--
