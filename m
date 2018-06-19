From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the vfs tree
Date: Tue, 19 Jun 2018 14:56:05 +1000
Message-ID: <20180619145605.1eb8e86f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/59UMffTH7U2/QUbpeeP3iOj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/59UMffTH7U2/QUbpeeP3iOj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got conflicts in:

  fs/proc/inode.c
  fs/proc/root.c

between commits:

  0223e0999be2 ("procfs: Move proc_fill_super() to fs/proc/root.c")
  83cd45075c36 ("proc: Add fs_context support to procfs")

from the vfs tree and commit:

  cc8cda3af2ba ("proc: Simplify and fix proc by removing the kernel mount")

from the userns tree.

I don't know how to fix this up, so I just dropped the userns tree for
today (since it only contained that one commit).

--=20
Cheers,
Stephen Rothwell

--Sig_/59UMffTH7U2/QUbpeeP3iOj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsojOUACgkQAVBC80lX
0Gzugwf+OutsKhrbGfS+oySE/YiolPEO81HpD+GYWQtKZGeaJHQKMAlXfhu4QURE
DnjuN0p6dImod/bJLR+DAJUr3SghNpyu2LLKKqtY5l/8qLdh7Q8bi1IwNNWZx5Ft
KEi16mgHyQBHW9sGW7AzLUtzFsSxCji4Z9LrwtIoSrYUWXCZqsHgVpdnpfWvnTF2
It93bz0ysbY/WfCRHYxSlWstZXDG2wFNeHRyr5jxwIQbHbnRkbK7zuCtQkHbQT9E
hdkARVwrCFhCfqml+e96Ig5JTRCb+hVbjcwc4MEIJvzlzmIg40LS84HNnAAvCZPI
Vx+eFEqEJDLvC0S3U5ubq4QJLf/3Tw==
=Eh/Y
-----END PGP SIGNATURE-----

--Sig_/59UMffTH7U2/QUbpeeP3iOj--
