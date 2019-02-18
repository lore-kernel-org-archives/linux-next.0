From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the kvm-fixes tree
Date: Mon, 18 Feb 2019 14:27:49 +1100
Message-ID: <20190218142749.04daecaa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zq4D+8ArvcK_JRDm6BNeBnl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luwei Kang <luwei.kang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zq4D+8ArvcK_JRDm6BNeBnl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got conflicts in:

  arch/x86/kvm/vmx/vmx.c
  arch/x86/kvm/vmx/vmx.h

between commit:

  c112b5f50232 ("KVM: x86: Recompute PID.ON when clearing PID.SN")

from the kvm-fixes tree and commit:

  abd2fb15a57e ("KVM: x86: Sync the pending Posted-Interrupts")

from the kvm tree.

These 2 commits are very similar so I just used the latter version of
the comflicting bits.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/zq4D+8ArvcK_JRDm6BNeBnl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxqJjUACgkQAVBC80lX
0Gz+Nwf/WVzAAx/aqMYuwqlu9CBxLl71/F19xDtrLRYZmNOVihMu6UWezsKEgPDp
+ICSAyMI7rdgkSIml2kcdrPj7IVRUMw7dXUe2iU3/zT9ccg6qLrGZDwj7tCz5Qmo
MojziMb6YILT3lG2moiTQiCQk52X2AEfC/YupHL1ANk0DldqdWWVfTfg9JGnuWK5
X6LIOIYDKuMtduN6L8ardPgXeIYqJ7vKtDG4XRaTMnxR3DamzA5vPnym9Q0BSR2I
CNyt2vFJBon26NJqp1J4Ow9c70flDAJNEhY0PbuEfHrKSVdYYyVJUJhuf19EHLC2
r3J1hGdQB3MMLpGK0NEcU4RHvxYLCg==
=8t9u
-----END PGP SIGNATURE-----

--Sig_/zq4D+8ArvcK_JRDm6BNeBnl--
