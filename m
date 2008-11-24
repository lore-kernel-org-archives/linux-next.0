From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cpu_alloc tree build failure
Date: Mon, 24 Nov 2008 16:36:12 +1100
Message-ID: <20081124163612.11c6f13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_16_36_12_+1100_kl/6DAkkiwFM=HcS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39771 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750733AbYKXFgk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:36:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__24_Nov_2008_16_36_12_+1100_kl/6DAkkiwFM=HcS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

I have dropped the cpu_alloc tree for today (it is my day for being hard
on people :-)) because it breaks the build on a few architectures and the
fix has been know since at least Nov 7 (when you published a patch that
doesn't appear in your tree).

If this is caused by an interaction with another tree (and I don't think
it is), let me know and I will carry the patch.  Otherwise you need to
fix the cpu_alloc tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_16_36_12_+1100_kl/6DAkkiwFM=HcS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqPUwACgkQjjKRsyhoI8zirgCguk8rSOf1pLPpKb88/D1z72o3
Sb0An0J8M4jfzY9tJWM847aRC3i2yw54
=J8a5
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_16_36_12_+1100_kl/6DAkkiwFM=HcS--
