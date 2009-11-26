From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Thu, 26 Nov 2009 20:16:07 +1100
Message-ID: <20091126201607.023e1269.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_20_16_07_+1100_qat5QJAOuINjMpIY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47143 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760140AbZKZJQG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 04:16:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Thu__26_Nov_2009_20_16_07_+1100_qat5QJAOuINjMpIY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc32 defconfig) failed like this:

arch/sparc/lib/atomic32.c: In function '__atomic_add_return':
arch/sparc/lib/atomic32.c:34: error: implicit declaration of function '__ra=
w_spin_lock_irqsave'
arch/sparc/lib/atomic32.c:38: error: implicit declaration of function '__ra=
w_spin_unlock_irqrestore'

Caused by commit 4df286e52917c95c415400367cfd523dfbb0f93a ("sparc: Make
atomic locks raw") which I have reverted for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_20_16_07_+1100_qat5QJAOuINjMpIY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksOR1cACgkQjjKRsyhoI8wX1gCfTmC0BR9HKkzjTrLFL2V9Qf94
zfAAn0JK1hHQiR7KRVMZyPq37XQ9Kidj
=wTGG
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_20_16_07_+1100_qat5QJAOuINjMpIY--
