From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kgdb tree
Date: Mon, 1 Feb 2010 17:29:52 +1100
Message-ID: <20100201172952.95fe2150.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Feb_2010_17_29_52_+1100_cvaf=FuKjfr/a5Vc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__1_Feb_2010_17_29_52_+1100_cvaf=FuKjfr/a5Vc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/x86/kernel/kgdb.c between commit
53a2aa296b5108e9bfdcda7f41221e721d9c7474 ("x86,hw_breakpoint,kgdb: kgdb
to use hw_breakpoint API") from the kgdb tree and commit
cc0967490c1c3824bc5b75718b6ca8a51d9f2617 ("x86, hw_breakpoints, kgdb: Fix
kgdb to use hw_breakpoint API") from the tip tree.

These two commits are similar but sufficiently different to make a mess.
I effectively reverted the kgdb tree version and used the tip tree
version.  This also involved reverting the kgdb tree changes to
arch/x86/kernel/hw_breakpoint.c.  I hope I got it right (since I had to
reapply a few other kgdb changes by hand) (an x86_64 allmodconfig build
produces no new warnings or errors, so I have some hope).

Someone should give me some guidance as to a way forward here, please.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Feb_2010_17_29_52_+1100_cvaf=FuKjfr/a5Vc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktmdOAACgkQjjKRsyhoI8zLIQCeM7IsO5cPX+4mahlCTxeb6wyP
GCIAn2BtZ7T77zCSKLqYLJaQbfdgYULb
=MA3t
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Feb_2010_17_29_52_+1100_cvaf=FuKjfr/a5Vc--
