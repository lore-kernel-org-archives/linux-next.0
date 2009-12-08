From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hwpoison tree build failure
Date: Wed, 9 Dec 2009 10:25:47 +1100
Message-ID: <20091209102547.c6f03d75.sfr@canb.auug.org.au>
References: <20091208191418.79270012.sfr@canb.auug.org.au>
	<20091208095147.GS18989@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Dec_2009_10_25_47_+1100_MFJx/B6QC.R1tkxM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33860 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935902AbZLHX0A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2009 18:26:00 -0500
In-Reply-To: <20091208095147.GS18989@one.firstfloor.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__9_Dec_2009_10_25_47_+1100_MFJx/B6QC.R1tkxM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, 8 Dec 2009 10:51:47 +0100 Andi Kleen <andi@firstfloor.org> wrote:
>
> Ah these symbols need to be exported and made sure to be enabled
> in the Kconfig. Thanks I'll fix and push out a new tree.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Dec_2009_10_25_47_+1100_MFJx/B6QC.R1tkxM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkse4HsACgkQjjKRsyhoI8zE4QCff21oCNhtau1O46cYkElKcD6w
wpEAoK97WhEOEe4THeFC1bWBmwWBNZm8
=uX2N
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Dec_2009_10_25_47_+1100_MFJx/B6QC.R1tkxM--
