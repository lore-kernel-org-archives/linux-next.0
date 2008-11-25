From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 18:43:35 +1100
Message-ID: <20081125184335.330cf28e.sfr@canb.auug.org.au>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
	<20081125072801.GA15592@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_18_43_35_+1100_WYFt1W3ykbMBIppm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35436 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750958AbYKYHnx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:43:53 -0500
In-Reply-To: <20081125072801.GA15592@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Tue__25_Nov_2008_18_43_35_+1100_WYFt1W3ykbMBIppm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 25 Nov 2008 08:28:01 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> this fix is wrong - the intention of that line was to add a proper=20
> WARN(), not a WARN_ON(). Your change loses the message that WARN()=20
> prints.
>=20
> i posted a tested fix for this two days ago:
>=20
>   http://marc.info/?l=3Dlinux-kernel&m=3D122745649425646&w=3D2
>=20
> see it also below.

Yeah, Steve told me.  However, it might have been useful to tell the
wireless maintainer, the network maintainer and the original author (and
probably netdev - which I also left off).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_18_43_35_+1100_WYFt1W3ykbMBIppm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrrKcACgkQjjKRsyhoI8y2EwCaA8Mg4aF+bPEETRMTVGTemuYm
S3sAn0X0CXVm7fHuvyz3ZHT7HaZTcQ7C
=HrXy
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_18_43_35_+1100_WYFt1W3ykbMBIppm--
