From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Tue, 11 Sep 2018 13:53:47 +1000
Message-ID: <20180911135347.0af423f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PdVK_xcHAtsPUE5Is.0h_F="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/PdVK_xcHAtsPUE5Is.0h_F=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

arch/x86/kernel/cpu/common.c: In function 'syscall_init':
arch/x86/kernel/cpu/common.c:1534:6: warning: unused variable 'cpu' [-Wunus=
ed-variable]
  int cpu =3D smp_processor_id();
      ^~~

Introduced by commit

  86635715ee42 ("x86/pti/64: Remove the SYSCALL64 entry trampoline")

--=20
Cheers,
Stephen Rothwell

--Sig_/PdVK_xcHAtsPUE5Is.0h_F=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluXPEsACgkQAVBC80lX
0Gyv4wf6A9EUl1isf2tWoyRA+rpUyU35DDMG861H8dApxf0Hw4WevT7GIzyfNb07
6Sv17/6uXD6wxrP0xPe4L7hZGRDfE3NqTZaCzlaXJaJ5xnXlLhbrdKYoEOdLe7vy
qwrRcGO9sdMx68Y/ksPQf0ADocNDc59HQWlCp1d7OXPTJ6Xtwg/3THnYjpd2FPQV
7c1hKvMSUi88GpUQwt7HhtpQ2WLIH1DxP9WuL0xic8I0dFaNH92JErbeh2ugycVs
bK/SFj8EDUGaMleNwtOTuOEJyPTorNLoFBciJ3IBHhYszeOCDXriNLlnMM6YBfK3
h7g01nAH5soEwQ2141heyv8V/nIcZA==
=av4c
-----END PGP SIGNATURE-----

--Sig_/PdVK_xcHAtsPUE5Is.0h_F=--
