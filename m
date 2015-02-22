From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Sun, 22 Feb 2015 11:57:55 +1100
Message-ID: <20150222115755.7f9ba531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EnJf76uJ5eE70yJVtPxOgf."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37894 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbbBVA6C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:58:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Tom Haynes <thomas.haynes@primarydata.com>

--Sig_/EnJf76uJ5eE70yJVtPxOgf.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/nfs/write.c between commit d15bc38df607 ("nfs: Provide and use
helper functions for marking a page as unstable") from Linus' tree and
commit d92dd5c34974 ("VFS: (Scripted) Convert ->d_inode to fs_inode()
in fs/nfs/") from the vfs tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EnJf76uJ5eE70yJVtPxOgf.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6SmYAAoJEMDTa8Ir7ZwVe6MP/13BPNpD0mtFreB0uvOpBdHX
S+wRG953NsqD7cakAk7zduU2w4iTfsq4d6bqq+LE7RfQlaw3IeYRcF5SspMxevAj
F0VBJ16odoDRWNuo3Dl9mwlMKHHCW3xUESvf1ZpHMalsNw1C2Zy7d0LPN4gEYHIM
mL1eaCOllZMaarYWuu4Kt7A2cY3as2cxF0yCoPvLGEV7hTUv4IW3C9wVM2ECB4t8
HXkHBKj2/lfMwZsXGk73SLjMLkHO88tDA6oluBZ1EG3SDLa7+L7+6iAehWVFEOY1
b4FZmyHf2hhnSvUMZ4crApwtSCuxl+LcrIrg0bKQMVnV/KpV06Vy7hGEq74GM5he
NA+dxd4LTxHGcmhEjBMYaZioT7QwV4IHCnLrKqc783zlTkVZXKmtqiU0jgjqAur1
M3TJgieYadEyKDP3RoFWpUzRDGyxNamH4R8PKETpK4mBrMlGNKvmEPJVBEy214ND
RQFSOoAlqmJjWw6ICRFOfI8koW8MmVhrZsPf5Ps4t4FP1aj3gV6yXGchI8XLAFt9
yIXUsEGpF7Waswc/CkvYKe/L8cqfVxo7u4gELU4Ab9CaNVUiJt30otAG9DDoexWg
x3PKpBveBAOWABZ1NzAx4yhdrNC/7pTHhRJkuGGyCB4yXeUd0j/LRVLFxm9hQMu5
hrrp1wI0j25BtOULeBeu
=xK6y
-----END PGP SIGNATURE-----

--Sig_/EnJf76uJ5eE70yJVtPxOgf.--
