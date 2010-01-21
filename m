From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build warning
Date: Thu, 21 Jan 2010 13:19:08 +1100
Message-ID: <20100121131908.fd4c91a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__21_Jan_2010_13_19_08_+1100_bFqW4quhASsVGUGs"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754131Ab0AUCTb@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Hofstaedtler <ch@zeha.at>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__21_Jan_2010_13_19_08_+1100_bFqW4quhASsVGUGs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

arch/x86/kernel/reboot.c: In function 'native_machine_emergency_restart':
arch/x86/kernel/reboot.c:575: warning: enumeration value 'BOOT_UNDECIDED' n=
ot handled in switch

Introduced by commit 42b6f08e3f79a802332db1ce4a343923e690fc32 ("Default
to ACPI reboots on newish X86 hardware").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__21_Jan_2010_13_19_08_+1100_bFqW4quhASsVGUGs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktXuZwACgkQjjKRsyhoI8wvgACgpozV3gae5FvtIq4pq8AqBlUn
BcwAoKfbJc6CK9VhaTnPCEvApwv5TBnJ
=sndd
-----END PGP SIGNATURE-----

--Signature=_Thu__21_Jan_2010_13_19_08_+1100_bFqW4quhASsVGUGs--
