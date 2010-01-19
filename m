From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Tue, 19 Jan 2010 12:42:59 +1100
Message-ID: <20100119124259.e0d77b47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Jan_2010_12_42_59_+1100_H0TUy7yTDbs5uB3/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752696Ab0ASBnH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 20:43:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gleb Natapov <gleb@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>

--Signature=_Tue__19_Jan_2010_12_42_59_+1100_H0TUy7yTDbs5uB3/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

usr/include/asm/kvm_para.h:5: included file 'asm-x86/hyperv.h' is not expor=
ted

Caused by commit 328aca1e523bedc49592bbdd65bedaa690b8df29 ("KVM:
Implement bare minimum of HYPER-V MSRs").

I have used the kvm tree from next-20100118 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Jan_2010_12_42_59_+1100_H0TUy7yTDbs5uB3/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktVDiMACgkQjjKRsyhoI8wKZgCcDCyYSFyqxhF6xyIjW1GWbHVQ
jH4An2kd/tk8k3Ufl2JklMV9KTeNnP84
=o7Ol
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Jan_2010_12_42_59_+1100_H0TUy7yTDbs5uB3/--
