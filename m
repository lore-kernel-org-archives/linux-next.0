From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: firmware merge conflicts
Date: Wed, 4 Jun 2008 20:50:40 +1000
Message-ID: <20080604205040.18ee59cf.sfr@canb.auug.org.au>
References: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
	<s5hprqx5z3b.wl%tiwai@suse.de>
	<1212573389.4042.89.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_20_50_40_+1000_5CTQDKFSmkJUc8aQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51140 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753970AbYFDKus (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 06:50:48 -0400
In-Reply-To: <1212573389.4042.89.camel@shinybook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>

--Signature=_Wed__4_Jun_2008_20_50_40_+1000_5CTQDKFSmkJUc8aQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 04 Jun 2008 10:56:29 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> > >  And I can carry the sound/Kconfig fixup.
>=20
> That conflict is just selecting FW_LOADER unconditionally, and changing
> the default of SND_*_FIRMWARE_IN_KERNEL to 'n'. The latter you could do
> in the sound tree quite happily. The former too, perhaps -- but then
> there's Adrian's patch to make FW_LOADER unconditional if !EMBEDDED
> anyway, which I think is probably a good idea.

The conflict is actually caused because all the sections lose a "depends
on SND" (realtive to the firmware tree) which can only go away when the
two trees get merged i.e. in my tree.  I have no problem carrying these
trivial merge fixups.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_20_50_40_+1000_5CTQDKFSmkJUc8aQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRnOGTgG2atn1QN8RApMQAJsFflu2L8JBGmRhpNih4Musp0FXvgCgh66R
0mV2iIrQX3NHy2W/ulu2neI=
=mTZi
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_20_50_40_+1000_5CTQDKFSmkJUc8aQ--
