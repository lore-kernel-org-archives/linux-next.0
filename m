From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the  tree
Date: Thu, 18 Aug 2011 14:14:36 +1000
Message-ID: <20110818141436.90346525d4d39314c7931357@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Aug_2011_14_14_36_+1000_Rr0ehqou2Rc6CU2E"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__18_Aug_2011_14_14_36_+1000_Rr0ehqou2Rc6CU2E
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/mm/fault.c between commit cedf03bd9aa5 ("x86: fix mm/fault.c
build") from Linus' tree and commit fab1167c4698 ("x86, vsyscall: Add
missing <asm/fixmap.h> to arch/x86/mm/fault.c") from the tip tree.

These are both fixing the same problem but differently.  Given the
comments in the latter, I have used its version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__18_Aug_2011_14_14_36_+1000_Rr0ehqou2Rc6CU2E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOTJGsAAoJEDMEi1NhKgbs0OoH/jdgha19mYWuIOwX/h4snZpc
Qp68/09ITg6tthyyRePGpflMzb4zArJLAoidGq0WH2pG9M7ftNiVOm7KiC/+xgP+
ZO4eBsf7U6fkH9y5k6wgAmYICMf23hnxEsbsOojIsnQRsI0DrfjwG5WjhlzLRn70
q5tx6a65E6xl7dV/eLnSw4w2GflGvZLASAlUCk4fHNDPvU5MQdwPhm/+TnNdYhKo
/aavkIjAlEI+N8yM6SY9b2bYG+zt+4L0o48Qd8KSGFB71EoHmpY9W61w4saQJQU/
/VSX37GAide0LcTxfJhnmeNN5lhpUtTyEDdtlKQ0ybkCSQrN+UQhW1EosbuQqg8=
=PCC4
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Aug_2011_14_14_36_+1000_Rr0ehqou2Rc6CU2E--
