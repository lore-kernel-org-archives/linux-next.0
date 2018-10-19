From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 19 Oct 2018 14:25:08 +1100
Message-ID: <20181019142508.72650fa8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2CB9Ba.p/spzxBLrrZ/338C"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2CB9Ba.p/spzxBLrrZ/338C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  tools/include/uapi/linux/kvm.h

between commit:

  25fe15e54fe5 ("tools headers uapi: Sync kvm.h copy")

from the tip tree and commit:

  c939989d74e2 ("tools/headers: update kvm.h")

from the kvm tree.

I fixed it up (the latter is a superset of the former) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2CB9Ba.p/spzxBLrrZ/338C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvJTpQACgkQAVBC80lX
0Gx+Egf8CQ7DNoiYjZHbVoyzcV8ARP63u7zlJ+MmmaX+DDeA2VyOxJZ1xH3ihCvV
eEjIMkx6anherK7UUHYNYvrHyUBZbeASboSKeVU3ibsUQwcS8gD5o1KV4N4nO20i
NjfgDKQdZAwco3GAqdXTzuI/vXFcV+3OSkt5y31xs/DSP8BdvpJPa66bx5GHEVu7
kqwAdMDR95X4MvyAkC32clXlESdcVxZEWDNdnf350blspUpjifK02dKenUMiY2Ut
9E1hRtc7eCzBnKNFg2r0IbjbtFW82Rgiuucj0QaGZP0XWuCfZrGKx/YFt9mXwE3q
+R3q2FaQUxhSi55MBWOzCWm0GRrnFQ==
=FxcI
-----END PGP SIGNATURE-----

--Sig_/2CB9Ba.p/spzxBLrrZ/338C--
