From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build warning
Date: Mon, 11 Jan 2010 19:25:08 +1100
Message-ID: <20100111192508.d98b1c2b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__11_Jan_2010_19_25_08_+1100_u7fLP1zzrbtuzL2b"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37776 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752580Ab0AKIZN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jan 2010 03:25:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>

--Signature=_Mon__11_Jan_2010_19_25_08_+1100_u7fLP1zzrbtuzL2b
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (powerpc allyesconfig) produced this warning:

arch/powerpc/kvm/powerpc.c: In function 'kvm_arch_vcpu_ioctl_run':
arch/powerpc/kvm/powerpc.c:278: warning: 'gpr' may be used uninitialized in=
 this function

Yes, I know it is probably a false positive.

Introduced by commit 7f31fad9aad3bb9df95793d72e037bb4d587ee83 ("KVM: PPC:
Use accessor functions for GPR access").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__11_Jan_2010_19_25_08_+1100_u7fLP1zzrbtuzL2b
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktK4GQACgkQjjKRsyhoI8yJJQCgrH8CfDAN+kQjSMpC/8XPsXwU
Fv0AoJujyY5vFiKCoHROSkIOPyCjuDoE
=mwN/
-----END PGP SIGNATURE-----

--Signature=_Mon__11_Jan_2010_19_25_08_+1100_u7fLP1zzrbtuzL2b--
