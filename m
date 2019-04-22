From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kvm-fixes tree
Date: Tue, 23 Apr 2019 07:01:08 +1000
Message-ID: <20190423070108.5069d3d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cJEY4fCYAenYlXf.xvVhVVC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@ozlabs.org>
List-Id: linux-next.vger.kernel.org

--Sig_/cJEY4fCYAenYlXf.xvVhVVC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  345077c8e172 ("KVM: PPC: Book3S: Protect memslots while validating user a=
ddress")

Fixes tag

  Fixes: 42de7b9e2167 ("KVM: PPC: Validate TCEs against preregistered memor=
y page sizes", 2018-09-10)

has these problem(s):

  - the ", 2018-09-10" is unexpected in a Fixes tag
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/cJEY4fCYAenYlXf.xvVhVVC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+K5QACgkQAVBC80lX
0Gymzwf6Av3z+KQHk30XQxaQ6/SHXSCqD+K1qmLpD5CxLkVMdoshEZPA1nfID9le
DkQiV6WLSgm86zL7KMXhHFl7SgdCdBC4ySef4RuVdwROXDIVFjYnmNP9Uk0oafgE
LMYpsORDvz/S0SQlh8ayOHQIl1jTc/Cq41cZRl7ZngHLmP2iIw1xE0YVXBfx8+J9
1kE/nZLub7POwjVnn85DhrNOEVjF3TFxw+MODFEibBpMC4z7BkcxJUVfsghbUTjw
fKHOBevrXb7KrSy3OjWU5Kauf/ckHQJ7+P29R0U4g4ve56tsnmOfnf8rc59Z7BVV
+TSfSlY120XESkb0KF92eXJYWqcRuQ==
=C6H4
-----END PGP SIGNATURE-----

--Sig_/cJEY4fCYAenYlXf.xvVhVVC--
