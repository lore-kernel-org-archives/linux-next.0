From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Wed, 29 Oct 2008 13:58:07 +1100
Message-ID: <20081029135807.110c8735.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Oct_2008_13_58_07_+1100_MfWfm_Zm50P5FqII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40833 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752213AbYJ2C6S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 22:58:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Sheng Yang <sheng@linux.intel.com>, Amit Shah <amit.shah@redhat.com>, Xiantao Zhang <xiantao.zhang@intel.com>

--Signature=_Wed__29_Oct_2008_13_58_07_+1100_MfWfm_Zm50P5FqII
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
include/linux/kvm_host.h virt/kvm/kvm_main.c between commit
5550af4df179e52753d3a43a788a113ad8cd95cd ("KVM: Fix guest shared
interrupt with in-kernel irqchip") from Linus' tree and commit
89c6b6a1b5059efa255ec254c8ee6667bdf6b2a0 ("KVM: IRQ ACK notifier should
be used with in-kernel irqchip") from the kvm tree.

Just a context change.  I fixed it up (taking the kvm tree's removal of
the first argument of kvm_unregister_irq_ack_notifier).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Oct_2008_13_58_07_+1100_MfWfm_Zm50P5FqII
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkH0UAACgkQjjKRsyhoI8zNuACfd0E6UpYgzlhElfpJrwHUqEdQ
+wIAnRx3FQTRLxRG7wpCcLDepbEcIcAG
=qYDZ
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Oct_2008_13_58_07_+1100_MfWfm_Zm50P5FqII--
