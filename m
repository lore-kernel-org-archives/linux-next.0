From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparseirq tree
Date: Tue, 16 Sep 2008 00:58:47 +1000
Message-ID: <20080916005847.fba3582d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Sep_2008_00_58_47_+1000_.va/LuEvXK0+/LKO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49087 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753219AbYIOO7R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 10:59:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Sheng Yang <sheng.yang@intel.com>, Avi Kivity <avi@qumranet.com>

--Signature=_Tue__16_Sep_2008_00_58_47_+1000_.va/LuEvXK0+/LKO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the sparseirq tree got a trivial conflict in
arch/x86/kvm/vmx.h and include/asm-x86/msr-index.h between commit
f5dd05a1980ab0770f1889fbc3ad2daa5ff89d6d ("x86: Move FEATURE_CONTROL bits
to msr-index.h") from the kvm tree and commit
315a6558f30a264c88274fa70626615d1c7851c7 ("x86: move VMX MSRs to
msr-index.h") from the sparseirq tree.

Just context changes.  I fixed it up and can carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Sep_2008_00_58_47_+1000_.va/LuEvXK0+/LKO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjOeCcACgkQjjKRsyhoI8wLqQCgrvZNAgV4MSxVQEKHEztAOZne
mwsAn0cr11Mi/8kt/W8GHMOwdZ475Smk
=W1XO
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Sep_2008_00_58_47_+1000_.va/LuEvXK0+/LKO--
