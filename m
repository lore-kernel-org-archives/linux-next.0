From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: LATEST-IS naming
Date: Mon, 19 May 2008 17:08:33 +1000
Message-ID: <20080519170833.e9490a73.sfr@canb.auug.org.au>
References: <Pine.LNX.4.64.0805151457570.16405@shark.he.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_17_08_33_+1000_Qjnx+Q6ywhWzm9Pr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43058 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753253AbYESHIl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 03:08:41 -0400
In-Reply-To: <Pine.LNX.4.64.0805151457570.16405@shark.he.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_17_08_33_+1000_Qjnx+Q6ywhWzm9Pr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Thu, 15 May 2008 15:03:54 -0700 (PDT) "Randy.Dunlap" <rdunlap@xenotime.n=
et> wrote:
>
> With the patch-vXYZ-next-datestamp.{gz,bz2} naming, having a file
> named LATEST-IS-next-datestamp doesn't help scripts fill in the
> vXYZ part of the patch filename.  Would it be possible/feasible
> for the LATEST-IS file to have content to tell what the patch
> file applies to, like:
> v2.6.26-rc2

OK, I have done that for now.  I may start also making patches against
the most recent -git snapshot in which case I will put that name in the
LATEST file as well.

I will stop making full tarballs tomorrow.  Unless someone screams.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_17_08_33_+1000_Qjnx+Q6ywhWzm9Pr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMSd2TgG2atn1QN8RAsbxAJ9IaBT+2OhkgUVjCmSS/4nA4MFpdwCggn/1
Gq9ITN9HYoSBK0qJLlV2tAI=
=MDt2
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_17_08_33_+1000_Qjnx+Q6ywhWzm9Pr--
