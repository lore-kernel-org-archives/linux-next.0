From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the slab tree
Date: Wed, 13 Aug 2008 17:36:17 +1000
Message-ID: <20080813173617.eabff119.sfr@canb.auug.org.au>
References: <20080813145741.43da1fc8.sfr@canb.auug.org.au>
	<48A27CEF.3040708@cs.helsinki.fi>
	<20080813171116.6cce0139.sfr@canb.auug.org.au>
	<48A288F7.6060901@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_17_36_17_+1000_QjbT_6.6lyMVhtqQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43687 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752083AbYHMHgY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 03:36:24 -0400
In-Reply-To: <48A288F7.6060901@cs.helsinki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, vegard.nossum@gmail.com

--Signature=_Wed__13_Aug_2008_17_36_17_+1000_QjbT_6.6lyMVhtqQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Wed, 13 Aug 2008 10:10:47 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> OK, thanks! But what about kmemcheck then? We have conflicts there that=20
> won't be resolved until 2.6.28. Does this mean I should grab the=20
> kmemcheck patches to my tree now to fix them?

I wouldn't worry about it for now, the conflicts are all trivial.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_17_36_17_+1000_QjbT_6.6lyMVhtqQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiijvEACgkQjjKRsyhoI8z5fQCgqcsObsi0dBbZBfOK9V81ocBc
+s4An0SEm2iMEqG813rX8GNcVzAFRXOK
=gEMh
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_17_36_17_+1000_QjbT_6.6lyMVhtqQ--
