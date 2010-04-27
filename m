From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-ioctl tree with the bkl-procfs
 tree
Date: Tue, 27 Apr 2010 15:06:04 +1000
Message-ID: <20100427150604.2ad0b3fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_Apr_2010_15_06_04_+1000_MOIoqftT.bxhJO1f"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__27_Apr_2010_15_06_04_+1000_MOIoqftT.bxhJO1f
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the bkl-ioctl tree got conflicts in
drivers/char/i8k.c, net/sunrpc/cache.c and
drivers/isdn/divert/divert_procfs.c between commit
64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: Push down the bkl from
ioctl") from the bkl-procfs tree and commit
1dd97d3d546aa14db7efa5366b21d1336b91379e ("Rename 'struct
file_operations' 'ioctl' fn pointer to 'bkl_ioctl'") from the bkl-ioctl
tree.

I used the versions from the bkl-procfs tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_Apr_2010_15_06_04_+1000_MOIoqftT.bxhJO1f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvWcLwACgkQjjKRsyhoI8zfbACgmdLPe8b3W3qqK7oGhDItvGSN
DvIAoLvfoT5N2eajFYo4+Qd5bs0epNn7
=rFYQ
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Apr_2010_15_06_04_+1000_MOIoqftT.bxhJO1f--
