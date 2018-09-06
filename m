From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Thu, 6 Sep 2018 10:02:20 +1000
Message-ID: <20180906100220.4df8ac0e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.LPULtNEbtKo+7d4njr6UeL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.LPULtNEbtKo+7d4njr6UeL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

security/selinux/hooks.c:2835:12: warning: 'selinux_sb_remount' defined but=
 not used [-Wunused-function]
 static int selinux_sb_remount(struct super_block *sb, void *data, size_t d=
ata_size)
            ^~~~~~~~~~~~~~~~~~

Introduced by commit

  dfcf373eab92 ("vfs: Remove unused code after filesystem context changes")

[For some reason this warning only appeared after I merged the net-next tre=
e.]
--=20
Cheers,
Stephen Rothwell

--Sig_/.LPULtNEbtKo+7d4njr6UeL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluQbowACgkQAVBC80lX
0GzJAgf6Apn0Y1bHENyqyUZT5g4g7tuB4gF9Igi5Z5bur11fVuHdQFoWqdSVAD8l
eQJ5HF/YBPR6YcNoRXZ1x0+2DhqiuQEgvg66vZBiR8eEnCc2iNQFSRsrdW6jsHHd
8DI669vq7wmXSa7voOWNiAGijRxodqpURyXEJNzVJuqpMWUX132dIJ4z+z9xm+Lp
LtEwp1o7bp35DVot/LehggINi7wncUaZRva80Vl9KWYqXnyPRSG8JawH3qagXVaW
9wKIGnj8mV/FPw+7H0gZR3i3KIl4KyCb6Ev8YKRAw+UeF3PFnAWpzV389tcn7UPh
se/cgSFUc1Ce8YPfp4aKYZazrWvUYA==
=xlC5
-----END PGP SIGNATURE-----

--Sig_/.LPULtNEbtKo+7d4njr6UeL--
