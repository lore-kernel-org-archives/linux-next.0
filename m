From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Date: Fri, 1 Feb 2019 07:42:29 +1100
Message-ID: <20190201074229.072c93fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TFHTk7i4P=s6TGRQ6DUjrQ1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/TFHTk7i4P=s6TGRQ6DUjrQ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  24d742a3417e ("KVM: arm/arm64: Move kvm_is_write_fault to header file")
  b39baf6f4327 ("KVM: arm/arm64: timer: Rework data structures for multiple=
 timers")
  3e6cb42d0c31 ("KVM: arm/arm64: Factor out VMID into struct kvm_vmid")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/TFHTk7i4P=s6TGRQ6DUjrQ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTXbUACgkQAVBC80lX
0GxMNQf8Dy9gP6WLFFchH/yyG3NQXfxxQJ0HEgWjZT7Wwqg8P8J0lHHhn6YQqxAU
wp54k/h+SrxftyWK1y5tS/i0BsuslBvyeiUjiT6pr1YozKA2Ek5JsfqT/ESBDBjT
IoFxz0NhzZd3KTKKL9pjoYd8bO3BnIGaAzOwkL2TOJGM426eMB3YeHG5X3lhwPob
NfJheRij8K7D7qOP03eHQts5X/jDhUnEg9xyA3tyBiLnCbi6Gv6NA9OpcWpCjr1l
7OlMOAtxEvIYVqIVl+V8ZdZ46oYrKzU3C7Fu9aWJe/3GTOeXp0dF/Jd0KFxhM3Pl
JsEO8KgRDO3EvmJJFBNxu8gP2IufWg==
=pFV7
-----END PGP SIGNATURE-----

--Sig_/TFHTk7i4P=s6TGRQ6DUjrQ1--
