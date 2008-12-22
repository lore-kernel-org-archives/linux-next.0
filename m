From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Mon, 22 Dec 2008 14:52:55 +1100
Message-ID: <20081222145255.17f885f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Dec_2008_14_52_56_+1100_vN1xpKMQwzA7pi+="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53439 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752276AbYLVDxO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 22:53:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kumar Gala <galak@kernel.crashing.org>, Hollis Blanchard <hollisb@us.ibm.com>

--Signature=_Mon__22_Dec_2008_14_52_56_+1100_vN1xpKMQwzA7pi+=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
arch/powerpc/kvm/powerpc.c between commit
2a4aca1144394653269720ffbb5a325a77abd5fa ("powerpc/mm: Split low level
tlb invalidate for nohash processors") from the powerpc tree and commit
48e5562f7278782ae5d1772b7baa1ff76f035285 ("KVM: ppc: Refactor powerpc.c
to relocate 440-specific code") from the kvm tree.

The former patch changes the _tlbia() to _tlbil_all() in
kvm_arch_vcpu_put().  The latter restructures this code.

I don't know enough to fix this up, so for today I have merely used the
kvm tree version.  Please come up with something better (if needed) and I
can use that as a merge resolution.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Dec_2008_14_52_56_+1100_vN1xpKMQwzA7pi+=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklPDxgACgkQjjKRsyhoI8wbAQCeL1kJJljsNdOTab6iaw49+n8F
Q4cAnRUbNiKFa1Ss8scYS1qKFpLY0hUi
=7KSh
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Dec_2008_14_52_56_+1100_vN1xpKMQwzA7pi+=--
