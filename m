From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the
 wireless-next tree
Date: Mon, 10 Nov 2014 15:34:26 +1100
Message-ID: <20141110153426.616e1f19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s51G6A5wb7zLmkVq1U_kPfU"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47696 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751158AbaKJEed (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2014 23:34:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Alexander Aring <alex.aring@gmail.com>, Marcel Holtmann <marcel@holtmann.org>

--Sig_/s51G6A5wb7zLmkVq1U_kPfU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/net/ieee802154/fakehard.c between commit 36426484fcac
("ieee802154: remove fakehard driver") from the wireless-next tree and
commit bb1f1107858c ("net: ieee802154: drop owner assignment from
platform_drivers") from the driver-core tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/s51G6A5wb7zLmkVq1U_kPfU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUYEBXAAoJEMDTa8Ir7ZwVw7oP/Ru/7ipe1t4I4IpC+3bdCf4N
Mg6lmr0syfNe+S+ewhuM/e5lq12CoPZZc4No9s6juDh89bevZ4NDgV28gBvYS/XX
pEv8wHDGBaMMyPdU5/y08FiQvSJU600IVNNH4DY6/pR0osPDx207/yqx9+iWyCgl
6NOJXqKGT3d+E1ptTx2jBN1usvkTWawsUUTISdLJ8v9x1dJrhy8+wxElVtIfN6eM
T36c4aVFcUnc8E4Bk943t7o+9aFt9Dfg1XOFMRJOQUplL+p7i9CrZZYZLk/3MRHw
g2fytHKqPQR1c0tK+jeLRw+3pfwkP+Iekyzf4eNKQoKBQ85rSkBf34yPKpjxRoPx
FCmoBo0i9EEQpTsjllzCa7lS/uLz4ufnxBGfVFFRv+/FB9oYcNihO0245JPO5N+N
VVaaUWGxx+fEKDtN1bBCqZ83lEtZzXGpjdLwJtovak74QXTuy8crvdUC69TkCcH+
lUqKO9PFJaqHwA+/qJ4pgJlqrseYj5cdQjUjHHCdSHrRJODT24XQzfhPUp6Ztxlq
BsAdHzeFUxd11XfeHhjE0Y24xhnBLY+qsy90TEOyQF+H5ANx8SAwE6ObE6TJNjh5
SBR5KwXsFCEV0hZfM3JK0unJiWbU+4vNCiukBHEALhB/x2xwmyy0+wMTpwepjjcs
kyBpiyGdqbuyGwo545Th
=LXcO
-----END PGP SIGNATURE-----

--Sig_/s51G6A5wb7zLmkVq1U_kPfU--
