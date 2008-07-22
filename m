From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Tue, 22 Jul 2008 13:43:28 +1000
Message-ID: <20080722134328.879fe332.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_13_43_28_+1000_jMspkzk2ngEaJxg/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44983 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753810AbYGVDnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 23:43:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__22_Jul_2008_13_43_28_+1000_jMspkzk2ngEaJxg/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got conflicts in
arch/powerpc/kvm/Makefile arch/x86/kvm/mmu.c, arch/x86/kvm/svm.c,
arch/x86/kvm/vmx.c, arch/x86/kvm/x86.c, arch/x86/kvm/x86_emulate.c,
include/asm-x86/kvm.h, include/asm-x86/kvm_host.h, include/linux/kvm.h
and virt/kvm/kvm_trace.c against Linus' tree.

It looks like a subset of the kvm tree in linux-next has been submitted
to Linus.  I have dropped the kvm tree form linux-next until it is fixed
up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_13_43_28_+1000_jMspkzk2ngEaJxg/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFV2AACgkQjjKRsyhoI8xrEACgo2PC4nwNCXg/lUrNN/c0lzAU
sLoAn1b2fuRLfLPG6cm16cGQhAC2O+hE
=Ky/L
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_13_43_28_+1000_jMspkzk2ngEaJxg/--
