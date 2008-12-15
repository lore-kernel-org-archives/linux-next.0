From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  spaseirq tree build warning
Date: Tue, 16 Dec 2008 01:52:38 +1100
Message-ID: <20081216015238.8bea9fcb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_01_52_38_+1100_s_HVhhM=+dO7hgOV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34845 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752016AbYLOOwp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 09:52:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

--Signature=_Tue__16_Dec_2008_01_52_38_+1100_s_HVhhM=+dO7hgOV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next build (sparc64 defconfig) produced this warning:

kernel/irq/handle.c:26: warning: 'irq_desc_lock_class' defined but not used

Introduced by commit 0b8f1efad30bd58f89961b82dfe68b9edf8fd2ac ("sparse
irq_desc[] array: core kernel and x86 changes") from the sparseirq tree.
irq_desc_lock_class is only used if CONFIG_SPARSE_IRQ is set (I think).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_01_52_38_+1100_s_HVhhM=+dO7hgOV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklGbzYACgkQjjKRsyhoI8z0vACeJ78zgRxJpK97YCCFPrUqdd/R
7+kAoJmXroQiSZevZx+Fea1LtAWf6OlB
=+lHn
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_01_52_38_+1100_s_HVhhM=+dO7hgOV--
