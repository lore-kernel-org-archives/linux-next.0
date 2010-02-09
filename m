From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fsnotify tree with the vfs tree
Date: Tue, 9 Feb 2010 16:37:18 +1100
Message-ID: <20100209163718.4924e2ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Feb_2010_16_37_18_+1100_p39cEe+LUR.skfcn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__9_Feb_2010_16_37_18_+1100_p39cEe+LUR.skfcn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the fsnotify tree got a conflict in
kernel/auditsc.c between commit cccc6bba3f771ef29b33e4f79e70ebc3dba245b0
("Lose the first argument of audit_inode_child()") from the vfs tree and
commit 2df5764e29a813f6ba63be094ab8aadc704a78fd ("fsnotify: use unsigned
char * for dentry->d_name.name") from the fsnotify tree.

The former removed the code changed by the latter, so I used the former.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Feb_2010_16_37_18_+1100_p39cEe+LUR.skfcn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktw9I4ACgkQjjKRsyhoI8xvEQCdGGwBcyAaBXS8ukqnQwofiE79
ooAAn3IosbBR7AHS84m8iyZurEkTbnbN
=BBLZ
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Feb_2010_16_37_18_+1100_p39cEe+LUR.skfcn--
