From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Fri, 17 May 2019 11:16:59 +1000
Message-ID: <20190517111659.0abd4659@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Je8SHF0vaegqUhEkF/nQ7iM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Je8SHF0vaegqUhEkF/nQ7iM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  tools/testing/selftests/kvm/dirty_log_test.c

between commit:

  76d58e0f07ec ("KVM: fix KVM_CLEAR_DIRTY_LOG for memory slots of unaligned=
 size")

from Linus' tree and commit:

  65c4189de8c1 ("KVM: fix KVM_CLEAR_DIRTY_LOG for memory slots of unaligned=
 size")

from the kvm tree.

I fixed it up (the only difference was a comment, so I just used the
former evrsion) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Je8SHF0vaegqUhEkF/nQ7iM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzeC4sACgkQAVBC80lX
0GwJBQf/VxQyU+e+oOJtg/JYzZqy+NvzQ3vIIBLL1lbF5xsHIBsV3punUZXliCrZ
diJpeO2yiMlCl8q2q1QLJXYUnGcebwwfLHXS/tUhyYz8GmF3Bo1wSMkdQt8T63Vg
fTRdGYMpAdy8cUBD1HDs5CRiygD3EDq7/FI2vexsuF/H0lF41lqJovzn/4AKYb2A
SUdND7SnJ2rMJxcSSwQUcB1Ece7c8FCa2xT9BToA5fVZUfTE6LAXQ9k5yjwymr7O
O7egXL0anA846Eunw0dvJcZ203Hl6sYksmC7Zm9vKADaVVnHE44GEqIeOe9SBBSz
ALVmJM4Xe0UpYeERXt4kkF+ash19gA==
=hWq6
-----END PGP SIGNATURE-----

--Sig_/Je8SHF0vaegqUhEkF/nQ7iM--
