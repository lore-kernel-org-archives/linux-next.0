From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sparc tree
Date: Wed, 17 Sep 2008 07:40:23 +1000
Message-ID: <20080917074023.a696e02f.sfr@canb.auug.org.au>
References: <20080917062746.b292a96a.sfr@canb.auug.org.au>
	<20080916.143137.134226448.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Sep_2008_07_40_23_+1000_19CJuSF7UvpAA.ZS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40752 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751823AbYIPVkf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 17:40:35 -0400
In-Reply-To: <20080916.143137.134226448.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__17_Sep_2008_07_40_23_+1000_19CJuSF7UvpAA.ZS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 16 Sep 2008 14:31:37 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> I just pushed a merge resolution to this by pulling sparc-2.6
> into sparc-next-2.6, moving the PCI config space address
> computer into psycho_common.h, and propagating the bug fix
> from sparc-2.6 into where the code lives now in psycho_common.c

Thanks for that it will get picked up tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Sep_2008_07_40_23_+1000_19CJuSF7UvpAA.ZS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjQJ8cACgkQjjKRsyhoI8zcjACgpJPxJlhsHq8b1wWK2WVq9XBi
fa4An19yPQmN9uOBZV/v7+jnrPJeHzJb
=CrC3
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Sep_2008_07_40_23_+1000_19CJuSF7UvpAA.ZS--
