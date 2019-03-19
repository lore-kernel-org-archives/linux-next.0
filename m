From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the selinux tree
Date: Tue, 19 Mar 2019 12:40:34 +1100
Message-ID: <20190319124034.13ff6044@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ky35U.Xly5mQAanE43DmKpK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, Dominick Grift <dominick.grift@defensec.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/ky35U.Xly5mQAanE43DmKpK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the selinux tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from /home/sfr/next/next/scripts/selinux/mdp/mdp.c:35:
/home/sfr/next/next/include/linux/kconfig.h:5:10: fatal error: generated/au=
toconf.h: No such file or directory
 #include <generated/autoconf.h>
          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  e37c1877ba5b ("scripts/selinux: modernize mdp")

I have used the selinux tree from next-20190318 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ky35U.Xly5mQAanE43DmKpK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQSJIACgkQAVBC80lX
0GzVZwgAlQ516J43HIE13qa4LP9Sohe8B6vzwsb8i4ZMg8gxdAiuw4noquSkZsgV
v1EYe7QL5WvlBnh6CBucw2IXgveIaOs5Yi5D87P17eqxIcPadlmKRwyvSQDCzezI
RvWnNlbV2y/l6jNxuvNidCie7bnY0tVzwcyRXOhhfU2cHvbrUMMOqwYh51xW4LLb
eHRUzScL3p+eDiY5e2Nz5NP5eJNDJ3gYwKLqwFleihai3HR/adcEiBWQ0/p4Q24a
+DcO8nlhWDQ79vxjJvVJWkIrlXhhC7uqMs5/YfcLrs9cFVdz3FLCNe14f1VwRoB7
nvMkqkp+DwurodZLqnWD8yAp8bCJLg==
=Tj/j
-----END PGP SIGNATURE-----

--Sig_/ky35U.Xly5mQAanE43DmKpK--
