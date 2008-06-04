From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hid/upstream merge conflicts
Date: Wed, 4 Jun 2008 18:19:30 +1000
Message-ID: <20080604181930.46cfc172.sfr@canb.auug.org.au>
References: <20080604120831.80410876.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0806041008270.10085@jikos.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_18_19_30_+1000_.KZamvI_WIoet_y7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58591 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752187AbYFDITg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 04:19:36 -0400
In-Reply-To: <Pine.LNX.4.64.0806041008270.10085@jikos.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, Alexandre Karpenko <alexander@comm.utoronto.ca>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__4_Jun_2008_18_19_30_+1000_.KZamvI_WIoet_y7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Wed, 4 Jun 2008 10:09:46 +0200 (CEST) Jiri Kosina <jkosina@suse.cz> wrot=
e:
>
> On Wed, 4 Jun 2008, Stephen Rothwell wrote:
>=20
> > Today's linux-next merge of the hid tree got a conflict in=20
> > drivers/hid/usbhid/hid-quirks.c between commit=20
> > 6e7045990f35ef9250804b3fd85e855b8c2aaeb6 ("HID: split Numlock emulation=
=20
> > quirk from HID_QUIRK_APPLE_HAS_FN.") from Linus' tree and commit=20
> > 6560721d37b404f3c16ce3dfe7517386198fa13a ("HID: add fn key support on=20
> > Macbook Pro 4,1 and Macbook Air") from the hid tree.
>=20
> thanks for notification, I have rebased and this should be fixed now.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_18_19_30_+1000_.KZamvI_WIoet_y7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRlAWTgG2atn1QN8RAsI1AJ9nyv5hY4x7OZ6/O/gRoQR1KewI6ACeOsbu
lt1b4JpJW2SrSrj4AADUJGE=
=FaiT
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_18_19_30_+1000_.KZamvI_WIoet_y7--
