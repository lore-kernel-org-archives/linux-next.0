From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: input tree build failure
Date: Mon, 7 Dec 2009 20:03:44 +1100
Message-ID: <20091207200344.01323cb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Dec_2009_20_03_44_+1100_TT0ptRm63hu/WCLA"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759257AbZLGJDr@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__7_Dec_2009_20_03_44_+1100_TT0ptRm63hu/WCLA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/input/sparse-keymap.c:101: error: __ksymtab_sparse_keymap_setkeycod=
e causes a section type conflict

Caused by commit a2dd9f7ceeb28f495587834aa5778c721611d61b ("Input: add
generic support for sparse keymaps").

static functions should not given to EXPORT_SYMBOL().

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Dec_2009_20_03_44_+1100_TT0ptRm63hu/WCLA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkscxPAACgkQjjKRsyhoI8x38gCdHnlLDc9/m2N2NYopnNBBDT6Y
M0kAn2j8UehX5/K8aW9kCtW8cZwviL88
=1AB5
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Dec_2009_20_03_44_+1100_TT0ptRm63hu/WCLA--
