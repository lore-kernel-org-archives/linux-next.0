From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Mon, 7 Sep 2009 20:38:57 +1000
Message-ID: <20090907203857.023912f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_20_38_57_+1000_nLRe0TdKgUSwoYdl"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752899AbZIGKjF@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__7_Sep_2009_20_38_57_+1000_nLRe0TdKgUSwoYdl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

Today's linux-next build (sparc64 defconfig) failed like this:

cc1: warnings being treated as errors
include/linux/security.h:3012: error: 'security_key_session_to_parent' decl=
ared 'static' but never defined

Caused by commit ee18d64c1f632043a02e6f5ba5e045bb26a5465f ("KEYS: Add a
keyctl to install a process's session keyring on its parent [try #6]")
which I have reverted for today.

(I also reverted commit 945af7c3289c26c9070d6b1bf3ca759d36643e0b ("KEYS:
security_cred_alloc_blank() should return int under all circumstances")
which is a fix for the above commit.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_20_38_57_+1000_nLRe0TdKgUSwoYdl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqk4sEACgkQjjKRsyhoI8zVkACdGOaXzC6YtFZiU2StsheV5dz3
CFwAn0QolGT8C0q0fDEP/VQjwu4TQ/hf
=I0lG
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_20_38_57_+1000_nLRe0TdKgUSwoYdl--
