From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Wed, 19 Dec 2018 15:12:52 +1100
Message-ID: <20181219151252.3e27a7f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Wy72QkJ_3RjgB0ZhYvD/jBY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, Marc Orr <marcorr@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Wy72QkJ_3RjgB0ZhYvD/jBY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/x86.c

between commit:

  eb012ef3b4e3 ("x86: Remove Intel MPX")

from the tip tree and commit:

  b666a4b69739 ("kvm: x86: Dynamically allocate guest_fpu")

from the kvm tree.

I fixed it up (the former removed some code updated by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wy72QkJ_3RjgB0ZhYvD/jBY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwZxUQACgkQAVBC80lX
0GxkgAf+KpOi5GYRWrCxptB3CZfRzKSZWoR3G20znQtTlsDyUq3dbmsv8LUOZv6q
U0f1z0LnpmqQ/fjbdtn+nh+pESsV/W6HPQOmd+ya9kClEXN7wzmXaaxMDg66i1jh
2VrEps5Nzw8RTh43eyA0Yn+iyB0GpuJk06uiV9FL9yVzhDoX+hrtwIQpvSgbp5pq
R91tjiGLKrWHS1CZN7cmeG8MdzxcB86MG94m5sg416/y4iBBD0peWF7hd3y1PEbH
lzbBI2EsXJmXW6iuqBYe3GSuxINAzwdQ2T22eTLSonEV2hQPUyOXf6kPOwfTt89o
ErLokEJGCOJf+/tD3oJtgrwEY+Wslw==
=2Igu
-----END PGP SIGNATURE-----

--Sig_/Wy72QkJ_3RjgB0ZhYvD/jBY--
