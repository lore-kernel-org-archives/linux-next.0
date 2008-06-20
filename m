From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc64 build failure
Date: Fri, 20 Jun 2008 17:53:11 +1000
Message-ID: <20080620175311.3ef1ea8b.sfr@canb.auug.org.au>
References: <20080620104352.1358ff2a.sfr@canb.auug.org.au>
	<20080619.175520.231354507.davem@davemloft.net>
	<20080620073444.GA23126@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Jun_2008_17_53_11_+1000_Wu1BTeIbzwUMhcYN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50240 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751240AbYFTHxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 03:53:18 -0400
In-Reply-To: <20080620073444.GA23126@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

--Signature=_Fri__20_Jun_2008_17_53_11_+1000_Wu1BTeIbzwUMhcYN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Fri, 20 Jun 2008 09:34:44 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Thu, Jun 19, 2008 at 05:55:20PM -0700, David Miller wrote:
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 20 Jun 2008 10:43:52 +1000
> >=20
> > > Yesterday's linux-next build (sparc64 allmodconfig) failed like this:
> >=20
> > Sam knowingly added this problem :-)
> Yes - this is all my fault.
> It must hurt a little before it becomes good!

Yep, OK.

Seriously, though the sparc64 allmodconfig has been broken by this for
two days and we really don't want any deliberate bisection breakage if we
can avoid it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Jun_2008_17_53_11_+1000_Wu1BTeIbzwUMhcYN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhbYecACgkQTgG2atn1QN/pAQCeKlGYUnsraqTWP8XhhlfN938M
DrgAnjxs4M+eEVYAfpVkNuC0qsV5hHNC
=GvQ3
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Jun_2008_17_53_11_+1000_Wu1BTeIbzwUMhcYN--
