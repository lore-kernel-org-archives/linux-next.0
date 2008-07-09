From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the nfs tree
Date: Thu, 10 Jul 2008 03:20:33 +1000
Message-ID: <20080710032033.a239e265.sfr@canb.auug.org.au>
References: <20080709125611.f25a9467.sfr@canb.auug.org.au>
	<1215621873.7214.15.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_03_20_33_+1000_etG1tFc6PfTSnugi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50764 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750982AbYGIRUl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 13:20:41 -0400
In-Reply-To: <1215621873.7214.15.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__10_Jul_2008_03_20_33_+1000_etG1tFc6PfTSnugi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Wed, 09 Jul 2008 12:44:33 -0400 Trond Myklebust <trond.myklebust@fys.uio=
.no> wrote:
>
> Sorry about that: I cherry-picked those patches from my 'devel' branch.
> I should probably have used some other method.

Its not really a problem.  Since the patch is the same in both trees and
only one tree further modifies the code, I just take that.  This will
happen occasionally as fixes go into Linus' tree.

> Anyhow, the nfs tree has now been rebased onto today's mainline kernel,
> and so the conflict should now be eliminated.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_03_20_33_+1000_etG1tFc6PfTSnugi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh082EACgkQjjKRsyhoI8xg2ACePVHWctMO01PKyrDhGvmtPZfO
/GsAnAr6AC2kEd6DKSm6YizsWjeaHAcO
=43YR
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_03_20_33_+1000_etG1tFc6PfTSnugi--
