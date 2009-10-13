From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip tree build warning
Date: Tue, 13 Oct 2009 14:42:23 +1100
Message-ID: <20091013144223.369d616d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Oct_2009_14_42_23_+1100_tJsupIpg72h_.9nt"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758915AbZJMDnJ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephane Eranian <eranian@googlemail.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__13_Oct_2009_14_42_23_+1100_tJsupIpg72h_.9nt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

arch/x86/kernel/cpu/perf_event.c: In function 'intel_get_event_idx':
arch/x86/kernel/cpu/perf_event.c:1445: warning: 'event_constraint' is used =
uninitialized in this function

Introduced by commit b690081d4d3f6a23541493f1682835c3cd5c54a1
("perf_events: Add event constraints support for Intel processors").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Oct_2009_14_42_23_+1100_tJsupIpg72h_.9nt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrT9x8ACgkQjjKRsyhoI8x2vACeMhamiBrRtoCxBPhuq5qjkebp
37AAn1SrUMkVynwR6Xp5XJR5PVVhAMIy
=sBuC
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Oct_2009_14_42_23_+1100_tJsupIpg72h_.9nt--
