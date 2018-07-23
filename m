From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the arm64 tree
Date: Tue, 24 Jul 2018 09:05:45 +1000
Message-ID: <20180724090545.2270d975@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jN7heVklmlR9WX36Z.SMHz5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/jN7heVklmlR9WX36Z.SMHz5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm64 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/acpi/Kconfig:6:error: recursive dependency detected!
drivers/acpi/Kconfig:6:	symbol ACPI depends on EFI
arch/x86/Kconfig:1920:	symbol EFI depends on ACPI
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"

Introduced by commit

  5bcd44083a08 ("drivers: acpi: add dependency of EFI for arm64")

--=20
Cheers,
Stephen Rothwell

--Sig_/jN7heVklmlR9WX36Z.SMHz5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltWX0kACgkQAVBC80lX
0GzRbQgAlEZ8ZMHeOq65ZF6UPW1pUTvOAfGcxsKpe9ibZERHJtWjjSlvD02v4BLc
Y74KCIhysKHbQFjI4emZUce1573E70gvDMqoe8JIYqAY2x3DdkUOh2sqge5yPQMB
XCInvqs7LlkiObH8VFjRMr81CeH7OqvYUsDu9lEBrvc9HCIzFtM8e+f2WWsiLGW6
e9gTEHrsoMMOb7qi2vSPtXl5gdl5HHUbw/Cmhy7ZKyjOdUML1m/qmnwm0meeDq3a
RNj/joNkt2H+fRA1Ym4J7qfX7k1+V7A7VTsGJRGIcj2LIGVsuoo16K3B9zUofYcg
QPhrfTv7FryyVR2sbt9JzJGOzCfQQg==
=UW3N
-----END PGP SIGNATURE-----

--Sig_/jN7heVklmlR9WX36Z.SMHz5--
