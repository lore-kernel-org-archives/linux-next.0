From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree
Date: Tue, 1 Jul 2008 16:29:20 +1000
Message-ID: <20080701162920.9e9e5c8f.sfr@canb.auug.org.au>
References: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
	<20080701055844.GB14658@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_16_29_20_+1000_QVWNjvLN=.PJTEGZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44178 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753317AbYGAG31 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:29:27 -0400
In-Reply-To: <20080701055844.GB14658@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Tue__1_Jul_2008_16_29_20_+1000_QVWNjvLN=.PJTEGZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 1 Jul 2008 07:58:44 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
>=20
> hm, the commit looks a bit weird: why the ifdefs? There's nothing 64-bit=
=20
> about being able to dump early resources, and the CONFIG_PCI could be=20
> hidden as well.

I added the 64 bit config test as the original patch was to setup_64.c
only (I think).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_16_29_20_+1000_QVWNjvLN=.PJTEGZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhpzsAACgkQjjKRsyhoI8yJ9wCfQ3XkT2miqkJncsL9EKiTpxhZ
08oAni7dsfzkhFgQAGdELzzpzAgHu2QM
=FpE6
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_16_29_20_+1000_QVWNjvLN=.PJTEGZ--
