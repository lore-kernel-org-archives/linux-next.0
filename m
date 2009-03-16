From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: New linux-next tree suspend-2.6
Date: Mon, 16 Mar 2009 20:05:57 +1100
Message-ID: <20090316200557.3542847a.sfr@canb.auug.org.au>
References: <200903151754.37147.rjw@sisk.pl>
	<20090316131647.48d632fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_20_05_57_+1100_fOhj1L/sDKRdZMCJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58457 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752109AbZCPJGF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 05:06:05 -0400
In-Reply-To: <20090316131647.48d632fb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Mon__16_Mar_2009_20_05_57_+1100_fOhj1L/sDKRdZMCJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

On Mon, 16 Mar 2009 13:16:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I notice that your resolution is to revert a patch from the pci tree.  As
> an alternative, you could apply the pci tree patch to your tree.

Which I now see is exactly what you did.  This makes the resolution for
me very easy as I just need to use your version of the changes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_20_05_57_+1100_fOhj1L/sDKRdZMCJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+FnUACgkQjjKRsyhoI8yWawCfQDrMFIhL68ZQpLyNmoz1bAbc
RGcAn25MJpbYCj3KMvDboFzh/vrH6uIg
=ZVUJ
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_20_05_57_+1100_fOhj1L/sDKRdZMCJ--
