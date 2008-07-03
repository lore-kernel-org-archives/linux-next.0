From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bkl-removal tree
Date: Thu, 3 Jul 2008 15:39:35 +1000
Message-ID: <20080703153935.0a23ddf8.sfr@canb.auug.org.au>
References: <20080701194544.f2109cdd.sfr@canb.auug.org.au>
	<20080702151021.56570002@bike.lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_15_39_35_+1000_+E+HASJ=V7aV+5Dl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41706 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754846AbYGCFjq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 01:39:46 -0400
In-Reply-To: <20080702151021.56570002@bike.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>

--Signature=_Thu__3_Jul_2008_15_39_35_+1000_+E+HASJ=V7aV+5Dl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Wed, 2 Jul 2008 15:10:21 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Tue, 1 Jul 2008 19:45:44 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next merge of the bkl-removal tree got a conflict in
> > drivers/s390/char/monreader.c between commit
> > 4b45ec0706ac12bf0c790747e55b4f3fec776c7a ("[S390] Cleanup monreader
> > printk messages.") from the s390 tree and commit
> > 167ae8a4822ed405037e72d660acf3294ab32807 ("monreader: BKL pushdown")
> > from the bkl-removal tree.
>=20
> That one's a simple matter of moving the include of
> <linux/smp_lock.h>.  I've done that, so this conflict should be gone
> now.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_15_39_35_+1000_+E+HASJ=V7aV+5Dl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsZhcACgkQjjKRsyhoI8z2ygCfbNp1wWx8IhHXcSBEFE9wGG6Y
k00AoI6Duz/kcrd8Tz8SgiNq/dO75S0U
=ZXU/
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_15_39_35_+1000_+E+HASJ=V7aV+5Dl--
