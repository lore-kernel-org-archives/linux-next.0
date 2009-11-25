From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: percpu tree build warning
Date: Wed, 25 Nov 2009 21:42:19 +1100
Message-ID: <20091125214219.f37935e8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_21_42_19_+1100_l7GA/DqL0xFSjZIT"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758664AbZKYKmW@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__25_Nov_2009_21_42_19_+1100_l7GA/DqL0xFSjZIT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

arch/x86/kernel/hw_breakpoint.c: In function 'arch_install_hw_breakpoint':
arch/x86/kernel/hw_breakpoint.c:121: warning: assignment from incompatible =
pointer type
arch/x86/kernel/hw_breakpoint.c: In function 'arch_uninstall_hw_breakpoint':
arch/x86/kernel/hw_breakpoint.c:156: warning: assignment from incompatible =
pointer type

I am not sure where this one came from ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_21_42_19_+1100_l7GA/DqL0xFSjZIT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNCgsACgkQjjKRsyhoI8yBRgCfSAJAd8UCzWc5TlUP412hENbt
01cAn2Qzh2V2vARLB1TNddaO2f+k/V6U
=WxLm
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_21_42_19_+1100_l7GA/DqL0xFSjZIT--
