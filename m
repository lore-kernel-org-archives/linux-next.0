From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kvm-fixes tree
Date: Wed, 1 May 2019 08:01:44 +1000
Message-ID: <20190501080144.639ed144@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aZ/E_6A3AqwvrrjhIZx4R.0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/aZ/E_6A3AqwvrrjhIZx4R.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  76d58e0f07ec ("KVM: fix KVM_CLEAR_DIRTY_LOG for memory slots of unaligned=
 size")

Fixes tag

  Fixes: 98938aa8edd6 ("KVM: validate userspace input in kvm_clear_dirty_lo=
g_protect()", 2019-01-02)

has these problem(s):

  - The trailing date ine the fixes tag is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/aZ/E_6A3AqwvrrjhIZx4R.0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzIxcgACgkQAVBC80lX
0Gz04gf+OOlOZJQ0JfEk03Rm/muVUhLvu5k7kUeDkdbeAl4krsvvg+XghkAm/s+q
qP66SXi9c3ANrFgBhZ2lycwWyGW9vStBAsCJRN0OvfB2Bj0F4ebEJNTYKl5tc+ja
8qWpNdPkOUlnJR+TIoIW8+c2wV2olI6w4lb1Dm4r3HIK+tmAWmXx/12boXKSLwiH
iz6G3nC4VGD3mbuY7lww4S8DD2AsFllTa1IzGm14RvSGgjn4/peMWkEE2vU64Jz4
Yi1xF7RJUbUg24tGRwve8vmR7Dv20Uqv4G1apd+E+jqnF7FQKbeQx8rwlq8WHDoR
WfntJQ/wmnWfzCtTw+frXNt2F95uyA==
=pFs9
-----END PGP SIGNATURE-----

--Sig_/aZ/E_6A3AqwvrrjhIZx4R.0--
