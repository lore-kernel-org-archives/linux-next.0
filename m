From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hdlc tree build failure
Date: Fri, 15 Aug 2008 10:27:52 +1000
Message-ID: <20080815102752.2126c64d.sfr@canb.auug.org.au>
References: <20080814153732.63307d0e.sfr@canb.auug.org.au>
	<m34p5nmo4x.fsf@maximus.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_10_27_52_+1000_EoHe9d5yaCZDTeLj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40486 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751864AbYHOA2B (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 20:28:01 -0400
In-Reply-To: <m34p5nmo4x.fsf@maximus.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__15_Aug_2008_10_27_52_+1000_EoHe9d5yaCZDTeLj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Aug 2008 20:45:34 +0200 Krzysztof Halasa <khc@pm.waw.pl> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > drivers/net/wan/hdlc_ppp.c: In function 'ppp_cp_parse_cr':
> > drivers/net/wan/hdlc_ppp.c:384: error: 'struct hdlc_device' has no
> > member named 'stats'
>=20
> Oops, sorry about that, my fault, already fixed it.

Ok, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_10_27_52_+1000_EoHe9d5yaCZDTeLj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkikzYgACgkQjjKRsyhoI8znUQCguva8XsCH0M03sY6wKPheVQRY
ZxEAnibZ3kolwf01nVUXFiWEpXrDpHNc
=3dB9
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_10_27_52_+1000_EoHe9d5yaCZDTeLj--
