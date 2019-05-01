From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kvm-fixes tree
Date: Wed, 1 May 2019 22:06:13 +1000
Message-ID: <20190501220613.635a5bf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Uxctia6sdY12mvb7htqdSoi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jim Mattson <jmattson@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Uxctia6sdY12mvb7htqdSoi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e8ab8d24b488 ("KVM: nVMX: Fix size checks in vmx_set_nested_state")

Fixes tag

  Fixes: 8fcc4b5923af5de58b80b53a069453b135693304

has these problem(s):

  - missing subject

Did you mean

Fixes: 8fcc4b5923af ("kvm: nVMX: Introduce KVM_CAP_NESTED_STATE")

You can just use:

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

--=20
Cheers,
Stephen Rothwell

--Sig_/Uxctia6sdY12mvb7htqdSoi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzJi7UACgkQAVBC80lX
0GxOngf+PrnVpQsVNa+lQCveDJpr1DxQwBxQwnH6T+Z5BAKNbEhVa0YhGcB8Kv+I
WrHRP/9+Y2xk1k6T9qaWTWU7DtG7bUuS+CQCf3MpHjAg4oMJ34rrl5muW/8x8Fgs
8jdISLjNuRUZplcilZ+l0CmEOY2OuyMwDQ+IAq/0wwVmG3W9KViwLq764SqAnmbw
n87vfS+9hUB5jo50pWW7TMaAKTkfhvBSm5XsudZZ97g4M/ABMaXFqjXVlJFug3IX
3AF0fYzS1Y5vbJ08NCPG72FQd/VZTqpQftT6bO0sZDSRKj0M7H6zEGcrKAutob/Z
E1Z8aXcfTO7sEBtI4mKKjeZIO0xaUg==
=kmKd
-----END PGP SIGNATURE-----

--Sig_/Uxctia6sdY12mvb7htqdSoi--
