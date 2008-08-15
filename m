From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Fri, 15 Aug 2008 14:46:41 +1000
Message-ID: <20080815144641.43dd547c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_14_46_41_+1000_i0/AqZJFeUJkEMck"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35184 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbYHOEqu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 00:46:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__15_Aug_2008_14_46_41_+1000_i0/AqZJFeUJkEMck
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a trivial conflict in
include/asm-x86/kvm.h between commit
77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
guards") from the x86 tree and commit
caa03c6696f78684a8396c63518fc84ed5922d44 ("KVM: Move KVM TRACE
DEFINITIONS to common header") from the kvm tree.

I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_14_46_41_+1000_i0/AqZJFeUJkEMck
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilCjEACgkQjjKRsyhoI8xwKQCeMLUQNvqlc+5kFsk6Ywc73lFi
+sYAn14WYo25cKL4w5gObLVjLwmj7q+d
=8YkM
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_14_46_41_+1000_i0/AqZJFeUJkEMck--
