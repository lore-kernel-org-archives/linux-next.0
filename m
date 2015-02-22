From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Sun, 22 Feb 2015 11:55:44 +1100
Message-ID: <20150222115544.22dca998@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8bZ+_SgBSvEChs4RIPvX.I="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47621 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751744AbbBVAzw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:55:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Tom Haynes <thomas.haynes@primarydata.com>

--Sig_/8bZ+_SgBSvEChs4RIPvX.I=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/nfs/flexfilelayout/flexfilelayout.c between commit d15bc38df607
("nfs: Provide and use helper functions for marking a page as
unstable") from Linus' tree and commit d92dd5c34974 ("VFS: (Scripted)
Convert ->d_inode to fs_inode() in fs/nfs/") from the vfs tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/8bZ+_SgBSvEChs4RIPvX.I=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6SkVAAoJEMDTa8Ir7ZwV1WUP/0Kuw4YncoIrZTIlsXdPp0Yi
4ySv+V33LYgftJj2dAjy9PXn3KXW3HGiW48PCEiHSOekl9azhQlcWtgaS2VGPq7a
oQ99uNQGZzRHibxkD9U9sJOcNBZy8sOp56d/UQfHgrL1ISdLIvdKuLNO322pBHIn
yBXh1yKQLSfPiHIbNk0CD/QpYAa3no06MT5XSnD3p7I/5lOnJI0MibHQwFJusLE7
rDyJ+3VXw5CwpskGus9L0TnEmRV2wG8Vkblzj6RpbEFulSjFZTam+Jdrfj08vG0f
+pJNXFYwmRdK2fNlfIGnopdGv+APvB6gmsERhf78STtuqt/ZOc00hY+6Ds8c+Gim
qEVIBW+en4tf3mIe3JGWClVEX/vUrJj0GhUZB15KXRnF2BPMgtGwSbjyS6HI4mjE
LIiG7SI1HdO629kvjcbjqxJnd2BmYtc1sIMCp3zn0EEfxwgGPVWOSvsEmO1oXQSX
lVOo132ZPEzBnPyOj8UBGgMHZNspSWOfbuCRTrHsDsym2qYr4CKqWykRhpIUC06B
Fd+YdoHTxmw35rYC+LUX2tQabsPbKEBQMafNtgOZYbOzP0wrEdoIq6slZ4t8KlS0
coK3JIR5lsKnSjHRy2UIfXdhM0Ji20pVmgtc2RoP4ZznMOLcpezKHcaEKi7fAO9C
tZU8+1xyFs+yRu9QxZ6i
=6WWj
-----END PGP SIGNATURE-----

--Sig_/8bZ+_SgBSvEChs4RIPvX.I=--
