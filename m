From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mfd tree with the tmio-mmc tree
Date: Mon, 8 Mar 2010 13:16:18 +1100
Message-ID: <20100308131618.6ca82b1d.sfr@canb.auug.org.au>
References: <20100107141613.62ca1bbd.sfr@canb.auug.org.au>
	<20100107185154.GB11239@sortiz.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Mar_2010_13_16_18_+1100_8yQTvpasUVDlvBmh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48768 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752497Ab0CHCQ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Mar 2010 21:16:27 -0500
In-Reply-To: <20100107185154.GB11239@sortiz.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ian Molton <ian@mnementh.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__8_Mar_2010_13_16_18_+1100_8yQTvpasUVDlvBmh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Thu, 7 Jan 2010 19:51:55 +0100 Samuel Ortiz <sameo@linux.intel.com> wrot=
e:
>
> On Thu, Jan 07, 2010 at 02:16:13PM +1100, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the mfd tree got conflicts in
> > drivers/mfd/asic3.c, drivers/mfd/t7l66xb.c, drivers/mfd/tc6387xb.c,
> > drivers/mfd/tc6393xb.c, drivers/mfd/tmio_core.c,
> > drivers/mmc/host/tmio_mmc.c, drivers/mmc/host/tmio_mmc.h and
> > include/linux/mfd/tmio.h between commit
> > 4cd83bd05e6c817a4a72ababd82bf5ae700c021d ("MMC: hardware abstraction for
> > CNF area") from the tmio-mmc tree and commit
> > b3df6513659704ece28da3b80cc36c2a8de315ce ("mfd: tmio_mmc hardware
> > abstraction for CNF area") from the mfd tree.
> >=20
> > These are very similar patches, I used the version from the mfd tree as
> > that appears to be a later version.  Can you and Ian please sort this o=
ut
> > between you.
> Ian, could you please remove this commit from your tree ? I'm planning to=
 send
> the one in my mfd tree soon to Linus.

The above conflict still occurs and there are more.  I am assuming that
this is because I have not been able to fetch the tmio-mmc tree for some
time (I get "git.mnementh.co.uk[0: 173.45.232.4]: errno=3DConnection
refused") (and your mail server will not accept mail from me either - I
hope you see this on lkml or linux-next).

I have dropped the tmio-mmc tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Mar_2010_13_16_18_+1100_8yQTvpasUVDlvBmh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuUXfIACgkQjjKRsyhoI8zZbwCgqJ/3Tb2sAtLlbeTv9FxgM+0q
AaMAn3xVeSwcb8LgMu9AbFzRh4wL/jDJ
=ZYZU
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Mar_2010_13_16_18_+1100_8yQTvpasUVDlvBmh--
