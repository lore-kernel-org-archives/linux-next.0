From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Date: Mon, 25 May 2015 18:19:38 +1000
Message-ID: <20150525181938.278a605c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+hm6+oYnKi+C+ZdsjmhRyMN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Martin <Dave.Martin@arm.com>, Jakub Kicinski <kubakici@wp.pl>
List-Id: linux-next.vger.kernel.org

--Sig_/+hm6+oYnKi+C+ZdsjmhRyMN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in
drivers/tty/serial/amba-pl011.c between commit 43dd1f9a5b05
("serial/amba-pl011: Unconditionally poll for FIFO space before each TX
char") from the tty.current tree and commit 1e84d22322ce
("serial/amba-pl011: Refactor and simplify TX FIFO handling") from the
tty tree.

I fixed it up (I just used the version from the tty tree) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/+hm6+oYnKi+C+ZdsjmhRyMN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYtseAAoJEMDTa8Ir7ZwVtLIP/2y5gbtqJ8WHUqjjLiQ7fCB8
GhIEu/MqTD51GfDcE+BRbx0dxh5DqKbJl2oQUQ0IQktY8o6c6OKMQgQmxrfauWYx
IAkH/58d6pTirrZ22vQnl1NLjHj4UnsbfyGQ5u6cvk5zdVLHCzPX4mX4wMZ4b1mR
KoLs/kkF7BRVWWYoAdnnxkdGvqXo+K3QbKayzvcxPUvLLHpZw+knyT0ALDzExUtU
pUwGh05oymHIHWT7OQ5e2kZakkDjBUEkpmdYrtKQwI6424rLAZ2FapBf9TC35myR
TunslfvJXXpzhDikxF805Jj8u+P6qwlzgVEwdatbzXOJhOhvBhBN+r0s5/mrVvV/
7r0s0cORofoDNtXUrj3W51kvUEikVegAPrfFK+q05SgdxumzRP9LfXsS8ttBxLqz
mnh0cnxqHSF+51jBbNfd4U0a+bcCeN92i6aT9AynGCPXuRPE9cn/Mrcho2Pil9W3
NRxSkQGpV3qm6bA1hp6pn/OAeC42IgHy4HR9E+J6Givzai91v6zhfrESbso+ZDxr
MAAcEy/7mHe0ciqrZU99vRp4ukQEiuCOAVNwhLXA92grLEewfTnhQBkKVGGvwCf5
w5n7+Iz43Ql8xuBkiRq0kw6i38KH5lJp6GTHKzSp4RMY995Ecdd8sc9nEC7coO3W
u7FsozMmGPYS+lBRRnaj
=GD6S
-----END PGP SIGNATURE-----

--Sig_/+hm6+oYnKi+C+ZdsjmhRyMN--
