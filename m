From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mmc tree build failure
Date: Tue, 9 Dec 2008 14:42:44 +1100
Message-ID: <20081209144244.fc3ebaa0.sfr@canb.auug.org.au>
References: <20081204152829.69a795a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_14_42_44_+1100_bn/XRutpvIY_kimC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53807 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751369AbYLIDnA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 22:43:00 -0500
In-Reply-To: <20081204152829.69a795a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>, Philip Langdale <philipl@overt.org>

--Signature=_Tue__9_Dec_2008_14_42_44_+1100_bn/XRutpvIY_kimC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

On Thu, 4 Dec 2008 15:28:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/mmc/host/ricoh_mmc.c:235: error: variable 'ricoh_mmc_pm_ext_opts'=
 has initializer but incomplete type
> drivers/mmc/host/ricoh_mmc.c:236: error: unknown field 'suspend_noirq' sp=
ecified in initializer
> drivers/mmc/host/ricoh_mmc.c:236: warning: excess elements in struct init=
ializer
> drivers/mmc/host/ricoh_mmc.c:236: warning: (near initialization for 'rico=
h_mmc_pm_ext_opts')
> drivers/mmc/host/ricoh_mmc.c:237: error: unknown field 'resume_noirq' spe=
cified in initializer
> drivers/mmc/host/ricoh_mmc.c:237: warning: excess elements in struct init=
ializer
> drivers/mmc/host/ricoh_mmc.c:237: warning: (near initialization for 'rico=
h_mmc_pm_ext_opts')
> drivers/mmc/host/ricoh_mmc.c:245: error: unknown field 'pm' specified in =
initializer
> drivers/mmc/host/ricoh_mmc.c:245: warning: initialization from incompatib=
le pointer type
>=20
> Due to commit 75766a3cee0a1eb2f373e8112a73e69262e7831a ("ricoh_mmc: Use
> suspend/resume_noirq") clashing with commit
> 6e674b2ed59695a90166d9500aa2696a495696e7 ("PM: Simplify the new
> suspend/hibernation framework for devices") from the driver-core tree.
>=20
> I am not sure what to do with this, so I have reverted the mmc tree
> commit above for today.  Hopefully, Rafael can suggest a fix.

Since I am still getting this error, I have dropped the mmc tree for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_14_42_44_+1100_bn/XRutpvIY_kimC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk96TQACgkQjjKRsyhoI8wJ5QCgkPLwNIUo8UWhyj2lUW5SGRMs
OWEAoJPc57k6Fvw6rYkA3pTsPMagxkI1
=/xv+
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_14_42_44_+1100_bn/XRutpvIY_kimC--
