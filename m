From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip-core tree
Date: Mon, 7 Jul 2008 16:39:13 +1000
Message-ID: <20080707163913.e4725683.sfr@canb.auug.org.au>
References: <20080707131538.25a05c1c.sfr@canb.auug.org.au>
	<20080707061232.GC16144@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_16_39_13_+1000_gwxfT7XTThKV3dma"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49572 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbYGGGjT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:39:19 -0400
In-Reply-To: <20080707061232.GC16144@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>

--Signature=_Mon__7_Jul_2008_16_39_13_+1000_gwxfT7XTThKV3dma
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 7 Jul 2008 08:12:32 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next merge of the tip-core tree got a trivial conflict=20
> > in kernel/softlockup.c between commit=20
> > 3b7253238801a7b97b3929d8db2fa7a0721fb17b ("softlockup: print a module=20
> > list on being stuck") from Linus' tree (which also exists in the=20
> > tip-core tree) and commit 8d5be7f4e8515af461cbc8f07687ccc81507d508=20
> > ("softlockup: show irqtrace") from the tip-core tree.
> >=20
> > It is just tha the latter change modifies the section of code modified=
=20
> > by the former.  I fixed it up and can carry the fix.
>=20
> Thanks Stephen - this should be resolved by today's auto-core-next=20
> iteration as well. (which you'll pick up tomorrow-ish)

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_16_39_13_+1000_gwxfT7XTThKV3dma
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxuhEACgkQjjKRsyhoI8zoawCgg9jnm9RScJucf/nwCQXcksxw
5CMAn0IFSDAGQ/0p33ei5mxZHVvLjevo
=XNGR
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_16_39_13_+1000_gwxfT7XTThKV3dma--
