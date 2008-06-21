From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc64 build failure
Date: Sat, 21 Jun 2008 10:02:06 +1000
Message-ID: <20080621100206.2249be7f.sfr@canb.auug.org.au>
References: <20080620104352.1358ff2a.sfr@canb.auug.org.au>
	<20080619.175520.231354507.davem@davemloft.net>
	<20080620073444.GA23126@uranus.ravnborg.org>
	<20080620175311.3ef1ea8b.sfr@canb.auug.org.au>
	<20080620083443.GA23523@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__21_Jun_2008_10_02_06_+1000_uNTYlS5MLNGfKD3P"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36514 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751229AbYFUACN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 20:02:13 -0400
In-Reply-To: <20080620083443.GA23523@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

--Signature=_Sat__21_Jun_2008_10_02_06_+1000_uNTYlS5MLNGfKD3P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Fri, 20 Jun 2008 10:34:43 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> I have not looked into it yet. But I assume this is a merge issue.
> sparc-next.git is OK
> kbuild-next.git is OK
>=20
> But when merged we break sparc64.
> So I need to feed David a patch so I do not break it with kbuild-next.git,
> or I need to do something in kbuil-next.git to avoid the breakage.
>=20
> I will sort it out in the weekend.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__21_Jun_2008_10_02_06_+1000_uNTYlS5MLNGfKD3P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhcRP4ACgkQTgG2atn1QN/2xgCfYOwwJz0F46vOVPjTEcMSUpmF
mDQAnjUZbGI02SilGdprLuisP7jB78dl
=s7nB
-----END PGP SIGNATURE-----

--Signature=_Sat__21_Jun_2008_10_02_06_+1000_uNTYlS5MLNGfKD3P--
