From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kselftest-fixes
 tree
Date: Thu, 14 May 2015 14:35:16 +1000
Message-ID: <20150514143516.3dd92949@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AgDJiNAKWnZd6wjXtbTea29"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47592 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760AbbENEfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2015 00:35:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

--Sig_/AgDJiNAKWnZd6wjXtbTea29
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
tools/testing/selftests/x86/run_x86_tests.sh between commit
c1e6e5cb941b ("selftests, x86: Remove useless run_tests rule") from the
kselftest-fixes tree and commit e22438f8e997 ("x86, selftests: Add a
test for the "sysret_ss_attrs" bug") from the tip tree.

I fixed it up (I removed the file) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/AgDJiNAKWnZd6wjXtbTea29
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVVCYJAAoJEMDTa8Ir7ZwVAtAP/i56L6zQe3x4tBECihyQzFt+
tMZvkWxQe+j55A/5aOGCoBg719NCGiBmRAcrNisWredDcSkasEjPgHBLnbyS5aCH
4C2/gxkKG2aRGyC1MMILdQ7dC5c8/Xy3BX+89wOpvgftdsm9GbrLuwmq1Vtme6O7
af6j2gX87DN0+zyPf2kksztpSQ08wTZPhKzwN7OA2Un7022mH8gC/a2Bh80Uyqzb
1vjQ9Nxz1ylD5Bm8+CoBmPD0whHM1ozMgMSmh6l+Xx6mMy1X3DbvELwoOquVULNM
+31e5ciii5YSawk9GCuNCUz0thv5CKWfwePEyqEOJs0tiaeqB/o9eGIqZiaupXPy
BP6SV9OjyoBpIkE0hhX2UTHxRFXDhpxUe8j8HUqqJ+svCNq59YEne4QH4IAPmoxx
HffeYXkfwGNl27wXBMquQxDllSiH5e0evx4ZbWM2gABY1PRCbgEYBZ407bAV1sL0
GXxhNtWp3QbMDozrPGDzf6xwkEJ5TZWsZI4obDmx3wlexW3Si67BN9qXlu1NKNKQ
Mc0pRFfZ7mqUfrpe6Iv1Zfa13qy+MZw/rvBSproVVC1BfhiIvl3vxU1GBmDY8YMc
o+fLGXoxsadvP7MD16et1MvkjqJcDnAOQ2t90V2+RpAcmFJpZKiAUiB2sLDfSeFd
Zevxitv7tcRxpcMrmnWI
=6y/N
-----END PGP SIGNATURE-----

--Sig_/AgDJiNAKWnZd6wjXtbTea29--
