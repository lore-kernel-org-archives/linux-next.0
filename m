From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 9 Oct 2018 12:21:13 +1100
Message-ID: <20181009122113.05fbf12a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ksmFf./sUIVCigUxh1ESQ.Y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Jamal Hadi Salim <jhs@mojatatu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ksmFf./sUIVCigUxh1ESQ.Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/cls_u32.c

between commit:

  6d4c407744dd ("net: sched: cls_u32: fix hnode refcounting")

from the net tree and commit:

  a030598690c6 ("net: sched: cls_u32: simplify the hell out u32_delete() em=
ptiness check")

from the net-next tree.

I fixed it up (I reverted the net tree commit as I could not tell
wich parts of it, if any, are still needed) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ksmFf./sUIVCigUxh1ESQ.Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu8AokACgkQAVBC80lX
0GwQEgf/RaP9DHjICf/RIPnuGarpgfSaFxHWmH2MFA3FEYFYGgX69V81hAofrfER
Vqz5Bumis6QPg6VHf2mrV66wEnEl9Ztf39KWRQzntfMtYYlhb2r+yVXnxpvyTNHy
d/HRC9X80SwotO1Y8PC9alG8g8ryRhgTBj9ci3ikYe6U0BPOUHxGUlbONulzjGzr
nrFF8T/Hjaw13/W6UcqWxj9opGtrMXOrot3ADL7/kV1qNny+1sK35U3YusBaG4wV
lyckh+SLZVJjHSYg3morS1WoMDngXM/5zFLH4OQq/ycWMsu2aQ1oys8MENP8kNDP
V+yQvH6eHPvcZOXc5cIah7VjozCk3w==
=ueao
-----END PGP SIGNATURE-----

--Sig_/ksmFf./sUIVCigUxh1ESQ.Y--
