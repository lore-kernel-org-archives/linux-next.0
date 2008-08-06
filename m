From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mfd tree build failure
Date: Wed, 6 Aug 2008 10:40:11 +1000
Message-ID: <20080806104011.233e1443.sfr@canb.auug.org.au>
References: <20080806000856.a5609577.sfr@canb.auug.org.au>
	<1217950794.18866.32.camel@wirenth>
	<20080806020540.c22b1fa0.sfr@canb.auug.org.au>
	<20080805160840.GC6335@caravaggio>
	<20080806021614.965a5389.sfr@canb.auug.org.au>
	<20080805174047.GE6335@caravaggio>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_10_40_11_+1000_AS2UNV+20MtqvBb3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40592 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751667AbYHFAkS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 20:40:18 -0400
In-Reply-To: <20080805174047.GE6335@caravaggio>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: ian <spyro@f2s.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__6_Aug_2008_10_40_11_+1000_AS2UNV+20MtqvBb3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Samuel,

On Tue, 5 Aug 2008 19:40:48 +0200 Samuel Ortiz <sameo@openedhand.com> wrote:
>
> On Wed, Aug 06, 2008 at 02:16:14AM +1000, Stephen Rothwell wrote:
> > On Tue, 5 Aug 2008 18:08:42 +0200 Samuel Ortiz <sameo@openedhand.com> w=
rote:
> > >
> > > :-) I'll take care of it, yep.
> >=20
> > Thanks, I look forward to it.
> It should be fixed by now.
> All TMIO devices depend on ARM, and the MMC and NAND drivers now depend
> on a new symbol (MFD_TMIO) selected when choosing one of the TMIO devices.

OK, thanks.  What I fetched looks good.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_10_40_11_+1000_AS2UNV+20MtqvBb3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiY8usACgkQjjKRsyhoI8yXWACeNCLm+zl8hNR8PTEML87NFqQh
GXYAn3rQ87DQgB1Ri2UawiPSN2t0CqNf
=g3ka
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_10_40_11_+1000_AS2UNV+20MtqvBb3--
