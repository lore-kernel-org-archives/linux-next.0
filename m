From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 6 Aug 2018 15:21:00 +1000
Message-ID: <20180806152100.05589155@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R53ma/=8.4uMOEcQeyNSd1I"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/R53ma/=8.4uMOEcQeyNSd1I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between a series of commits in Linus' tree and a series of commits in
the kvm tree.

I have no idea how to fix all this up, so I just dropped all the changes
from Linus' tree (all those commits only touched this file).  Please do
this merge your self or provide me (and Linus) with the necessary
resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/R53ma/=8.4uMOEcQeyNSd1I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltn2rwACgkQAVBC80lX
0GwoMwf/Sbs14WZIEagm9z7rfSXl3VvLXCJuPfimOQVoW2t2kEArUVFxAdXuI4oT
F1MC1cCth0AK98vrCO7gxSV1VPSRPFNQPpfJRrVrUXRoniM4fuLRfEYlsl9wzWaT
/Er9ZMUK/n5FaNoUmo/gxSolu47rV8Cf6cqc7beyJnYwqkN4AEf3mvPxHa985JU/
vkf37saLsll8QO/fTayBcGotqe2he4AhQo2DoVqjFqAssTNiainnARDB1fcRF+VT
n9TWfTixDdDH0v+nFjU33WX+v19fN2UbxRrv8BbrhDHrUXHFSSghFT54sNor/eKu
EngNbtvACirEEhBVQXfxqHql9qlBNQ==
=RdcZ
-----END PGP SIGNATURE-----

--Sig_/R53ma/=8.4uMOEcQeyNSd1I--
