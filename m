From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core merge conflict
Date: Fri, 13 Jun 2008 00:34:27 +1000
Message-ID: <20080613003427.9866ff07.sfr@canb.auug.org.au>
References: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
	<20080610190434.GC15983@uranus.ravnborg.org>
	<20080611095226.f798bb6a.sfr@canb.auug.org.au>
	<20080612141022.GA28001@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_00_34_28_+1000_m3i9LhtdLl5HdcRB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56653 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752983AbYFLOei (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 10:34:38 -0400
In-Reply-To: <20080612141022.GA28001@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Fri__13_Jun_2008_00_34_28_+1000_m3i9LhtdLl5HdcRB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 12 Jun 2008 16:10:22 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> i think it might be a communications issue - as conflicts are not a=20
> problem per se, they are just a complication that you resolve.
>=20
> So it might make sense to change the subject line of your merge=20
> resolution mails from:
>=20
>   linux-next: tip-core merge conflict
>=20
> to:
>=20
>   linux-next: manual merge of tip-core
>=20
> that way people still stay informed about interactions between trees=20
> (and can reduce them when they are avoidable, and can check the result=20
> as well since it was done manually), but dont see it as some sort of=20
> failure that needs to be 'resolved' via dropping patches.

Thanks for the suggestion, I like it.  Look forward to calmer subjects
from now on. :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_00_34_28_+1000_m3i9LhtdLl5HdcRB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhRM/QACgkQTgG2atn1QN/34QCeMXoHOYoPEnGnuLGSWcujI8x+
DtoAniqVwH2SB3y+4RdyOORNNkMUq5Ic
=n5ox
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_00_34_28_+1000_m3i9LhtdLl5HdcRB--
