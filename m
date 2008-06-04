From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: firmware merge conflicts
Date: Wed, 4 Jun 2008 20:44:34 +1000
Message-ID: <20080604204434.5ec125ea.sfr@canb.auug.org.au>
References: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
	<s5hprqx5z3b.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_20_44_34_+1000_8Dg60hmJXxZ3qb/_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41087 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754570AbYFDKom (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 06:44:42 -0400
In-Reply-To: <s5hprqx5z3b.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>

--Signature=_Wed__4_Jun_2008_20_44_34_+1000_8Dg60hmJXxZ3qb/_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Wed, 04 Jun 2008 11:27:52 +0200 Takashi Iwai <tiwai@suse.de> wrote:
>
> At Wed, 4 Jun 2008 16:07:42 +1000,
> Stephen Rothwell wrote:
> >=20
> > Simple conflicts in sound/pci/maestro3.c and
> > sound/pci/ymfpci/ymfpci_main.c because "maestro3: treat firmware data as
> > const" and "ymfpci: treat firmware data as const" appear in both the
> > driver-core tree and the firmware tree.  The conflicts are because the
> > firmware tree further modifies these files.
> >=20
> > So, you and Alan need to come to an agreement about ti_usb (and inform
> > Greg :-)).  And you should probably ask Greg to drop the to "const"
> > patches (or maybe the other way around).
>=20
> Or just let me know if you guys want to put the changes into sound
> tree.  I'm willing to apply them...

That would also work.

> >  And I can carry the
> > sound/Kconfig fixup.
>=20
> ... together with this :)

I guess that conflict would go away if they did the above.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_20_44_34_+1000_8Dg60hmJXxZ3qb/_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRnIXTgG2atn1QN8RAq2BAJ9xWY7J5KzatatJxEfvmrMoHSF5vgCeOwaV
+4PxlSDIidUZdUWQg6zfiqI=
=/aDX
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_20_44_34_+1000_8Dg60hmJXxZ3qb/_--
