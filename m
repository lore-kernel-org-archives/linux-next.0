From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build failure
Date: Thu, 12 Nov 2009 21:50:55 +1100
Message-ID: <20091112215055.25405fc3.sfr@canb.auug.org.au>
References: <20091112190308.443d97a3.sfr@canb.auug.org.au>
	<1258016520.2140.329.camel@pasglop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Nov_2009_21_50_55_+1100_GusNWkD_jNf+rZcx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38510 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbZKLKu4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 05:50:56 -0500
In-Reply-To: <1258016520.2140.329.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Thu__12_Nov_2009_21_50_55_+1100_GusNWkD_jNf+rZcx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Thu, 12 Nov 2009 20:02:00 +1100 Benjamin Herrenschmidt <benh@kernel.cras=
hing.org> wrote:
>
> Thanks. Our EXPORTs are bogus (probably leftovers) it seems. I'll dbl
> check tomorrow but that looks like a patch I should pickup in powerpc
> -next anyways.

That was the idea, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Nov_2009_21_50_55_+1100_GusNWkD_jNf+rZcx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr76I8ACgkQjjKRsyhoI8yvAQCeOBxfl9MaJNSiimwVyVoNMYdM
ZcwAoJcuKSpgUOQ0f34B+12Bh6R5Kyuz
=/e+g
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Nov_2009_21_50_55_+1100_GusNWkD_jNf+rZcx--
