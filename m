From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Thu, 13 Aug 2009 12:58:40 +1000
Message-ID: <20090813125840.048af293.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Aug_2009_12_58_40_+1000_K.H+UJW_RLzvL7Ab"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59222 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbZHMC6q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2009 22:58:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__13_Aug_2009_12_58_40_+1000_K.H+UJW_RLzvL7Ab
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

x86_64-linux-gcc: arch/x86/kvm/x86_emulate.c: No such file or directory

Caused by commit 5383e9982ee230b06b3c385e675ae6fc7846c40f ("KVM: Rename
x86_emulate.c to emulate.c").

I have used the version of the kvm tree from next-20090812 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Aug_2009_12_58_40_+1000_K.H+UJW_RLzvL7Ab
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqDgWAACgkQjjKRsyhoI8wBwwCcCLpWhhdhFpw3xCw0C9L4mezt
57AAnAyJFp5uRQVQ8xEz9PAAREi9wTt1
=L+1u
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Aug_2009_12_58_40_+1000_K.H+UJW_RLzvL7Ab--
