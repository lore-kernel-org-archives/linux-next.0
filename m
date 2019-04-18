From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the printk tree
Date: Thu, 18 Apr 2019 14:14:11 +1000
Message-ID: <20190418141411.417e5c99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_vOeBQlSfJaWe6hFJ8BwoxI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/_vOeBQlSfJaWe6hFJ8BwoxI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/irq_64.c

between commit:

  d75f773c86a2 ("treewide: Switch printk users from %pf and %pF to %ps and =
%pS, respectively")

from the printk tree and commit:

  117ed4548541 ("x86/irq/64: Remove stack overflow debug code")

from the tip tree.

I fixed it up (the latter removed taht code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/_vOeBQlSfJaWe6hFJ8BwoxI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly3+ZMACgkQAVBC80lX
0GzMbwgAhbS4CbE61NbDYUAffPKO7r8e31VCo7CsSPAWcztIdusvrFELeMe0A8J0
ut0F75yv4xCSNrM7aMM7nO+k3wajCecGmXZqzjExqQ+qVZJhxUOP54TYcwPeCI4I
hyLSpasLKjD/UzRZG6P82CeUaJBVNRdz9QWg+UJx9aabObHMy2QfxNNu3J+XkU8S
mroxvEoHc1mLtDHIH9+251k0rznFsvaT7Ih+MR/TUCesXLY/Gm66aujZk3IXaulg
MvUPbokNbifYQ3y/rs+FtQ3oSbLzkhyLzMb5fUf/TIob97GJexphqbYJtKacCELW
XVAHUnSzuYbv+lW91g55FDrnwE0M4A==
=paty
-----END PGP SIGNATURE-----

--Sig_/_vOeBQlSfJaWe6hFJ8BwoxI--
