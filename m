From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kbuild tree build failure
Date: Mon, 7 Jul 2008 23:08:43 +1000
Message-ID: <20080707230843.ec0b4efb.sfr@canb.auug.org.au>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
	<20080707125138.GA16569@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_23_08_43_+1000_ixfaJZ=WcnuFfbzh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59843 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753400AbYGGNIx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 09:08:53 -0400
In-Reply-To: <20080707125138.GA16569@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Mon__7_Jul_2008_23_08_43_+1000_ixfaJZ=WcnuFfbzh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 7 Jul 2008 14:51:38 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> I see what is wrong - we use a int to hold the value above
> and it does not fit.
>=20
> Will fix tonight or tomorrow.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_23_08_43_+1000_ixfaJZ=WcnuFfbzh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyFVsACgkQjjKRsyhoI8yXewCfWft6NI3GMjZdcbc9wrMzMgbx
pQgAoICmDMvt6308gBtrNHuiB4/9b8R2
=7IP2
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_23_08_43_+1000_ixfaJZ=WcnuFfbzh--
