From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Tue, 2 Dec 2008 10:31:51 +1100
Message-ID: <20081202103151.fb8f7227.sfr@canb.auug.org.au>
References: <20081201111552.8b1cbf9b.sfr@canb.auug.org.au>
	<1228152771.25929.109.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Dec_2008_10_31_51_+1100_vXejbPf7vxl5foWI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42259 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751068AbYLAXcN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 18:32:13 -0500
In-Reply-To: <1228152771.25929.109.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Kay Sievers <kay.sievers@vrfy.org>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__2_Dec_2008_10_31_51_+1100_vXejbPf7vxl5foWI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Mon, 01 Dec 2008 17:32:51 +0000 Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>
> On Mon, 2008-12-01 at 11:15 +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the driver-core tree got a conflict in
> > drivers/mtd/maps/integrator-flash.c between commit
> > ffc86cf850dcd0e181a69c6fa0217d6c7ddf9c85 ("Add armflash support for
> > multiple blocks of flash") from the arm tree and commit
> > 0b1ea7e6450b3cc2e87d1c7295439483d007bb6e ("mtd: struct device - replace
> > bus_id with dev_name(), dev_set_name()") from the driver-core tree.
> >=20
> > I fixed it up (see below). =20
>=20
> I'll send a separate patch on linux-mtd to make the third argument of
> mtd_concat_create a "const char *" to avoid a warning (dev_name returns
> const char *).

That would be good.

> > Maybe you, Russell and David Woodhouse could
> > sort out who should coordinate these updates.
>=20
> I dropped the patch from my series and I suspect Russell will re-merge
> my tree (there shouldn't be other conflicts via the arm tree).
>=20
> Now the question, where should I send the changes to integrator-flash.c
> to? I assume it's linux-mtd with ack from Russell.

I would guess that makes sense.

> Anyway, no matter who'll merge it, as long as it is based on the
> mainline kernel it will create a conflict in linux-next. Is the rule
> that there shouldn't be any conflicts in linux-next at this stage? The
> alternative is to get it merged via the driver-core tree.

There will always be conflicts between trees in linux-next.  My concern
is to try to minimise them if possible.  I can carry fixes to the merges
I do without to much pain and presumably Linus can cope with anything I
can.  Conflicts against Linus' tree should be fixed as soon as makes
sense, but some conflicts between the other constituent trees of
linux-next can only be resolved during the next merge window.

(I usually put "and I can carry the fix as necessary" in my messages, but
I missed that in this case, sorry).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Dec_2008_10_31_51_+1100_vXejbPf7vxl5foWI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk0c+cACgkQjjKRsyhoI8xkHACcDlLxrL2usJnnGUs/Jfc/uP2V
CTQAoKeb5UDDrqaSm02Z5Et25PLJAe51
=dlOf
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Dec_2008_10_31_51_+1100_vXejbPf7vxl5foWI--
