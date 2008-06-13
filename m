From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of acpi tree
Date: Fri, 13 Jun 2008 16:02:01 +1000
Message-ID: <20080613160201.ac0ffd5f.sfr@canb.auug.org.au>
References: <20080613145357.1ea9f643.sfr@canb.auug.org.au>
	<alpine.LFD.1.10.0806130107530.8340@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_16_02_01_+1000_ndtGstZtC.Qcxqp5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51897 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751765AbYFMGCJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 02:02:09 -0400
In-Reply-To: <alpine.LFD.1.10.0806130107530.8340@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Fri__13_Jun_2008_16_02_01_+1000_ndtGstZtC.Qcxqp5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Fri, 13 Jun 2008 01:09:31 -0400 (EDT) Len Brown <lenb@kernel.org> wrote:
>
> On Fri, 13 Jun 2008, Stephen Rothwell wrote:
>=20
> > Today's linux-next merge of the acpi tree got a context conflict in
> > drivers/acpi/sleep/main.c between commit
> > d8f3de0d2412bb91639cfefc5b3c79dbf3812212 ("Suspend-related patches for
> > 2.6.27") from the pci tree and a couple of commits that are duplicate in
> > the pci and acpi trees ("ACPI PM: acpi_pm_device_sleep_state() cleanup"
> > and "ACPI PM: Remove obsolete Toshiba workaround").
>=20
> What do you use to merge?

git, gitk and vi (and my eyes :-))

> Jesse pulled my suspend branch, so you should get the exact same commit=20
> id's for 3 patches in both his tree and mine.

they are not the same commits:
"ACPI PM: acpi_pm_device_sleep_state() cleanup"
06166780eb53685e72b589814d535d1f9948e761	in the pci tree
0cc5ddb904162f611568d4db66ccd8af61dffc16	int the acpi tree
"ACPI PM: Remove obsolete Toshiba workaround"
0e6859d49ff194e01afc229c996e3aefca1a0539	in the pci tree
f7259bd5d588d59816e1f4d5d4f3da9382916dac	in the acpi tree

In the acpi tree (I pull the test branch into linux-next) the former has
a different parent to the one on the pci tree since Jesse pulled your
"suspend" branch into his pci tree.

So the git merge sees them as overlapping changes to the same file (as
well as the other commit above) and generates a conflict.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_16_02_01_+1000_ndtGstZtC.Qcxqp5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhSDVkACgkQTgG2atn1QN/gXQCglsQ2dDoxUSXvoHEXOYFXTGbq
ekIAnihRCUJrcREDyx6x+Gdc0NBz3+Mv
=vqMM
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_16_02_01_+1000_ndtGstZtC.Qcxqp5--
