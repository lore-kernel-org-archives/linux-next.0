From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: fastboot tree build warning
Date: Thu, 4 Sep 2008 22:55:44 +1000
Message-ID: <20080904225544.805aee10.sfr@canb.auug.org.au>
References: <20080903173448.55f2745b.sfr@canb.auug.org.au>
	<20080904100425.GA25428@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Sep_2008_22_55_44_+1000_POy6JwbjhfauoNYF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53906 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751543AbYIDMz7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Sep 2008 08:55:59 -0400
In-Reply-To: <20080904100425.GA25428@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Arjan van de Ven <arjan@linux.intel.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__4_Sep_2008_22_55_44_+1000_POy6JwbjhfauoNYF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 4 Sep 2008 12:04:25 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> i have this already fixed via the commit below - not yet pushed into the=
=20
> auto branches.

Thanks, looks good.  I noticed that there have been no changes in the tip
auto trees for a while - I assumed you were all on vacation :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Sep_2008_22_55_44_+1000_POy6JwbjhfauoNYF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki/2tAACgkQjjKRsyhoI8wSxgCguJtFZ24bmmGnA0WFYCh6bSzN
pVoAoJ4FvcofV4qHZrZ/dYkHyNhzWS5+
=FzJp
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Sep_2008_22_55_44_+1000_POy6JwbjhfauoNYF--
