From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: acpi/cpus4096 merge conflict
Date: Fri, 13 Jun 2008 01:25:44 +1000
Message-ID: <20080613012544.b06605b7.sfr@canb.auug.org.au>
References: <20080612135032.b5d0c684.sfr@canb.auug.org.au>
	<alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>
	<20080612121824.GA26504@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_01_25_44_+1000_lcZk1=Hz2GX+J1Z1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44414 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752096AbYFLPZz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 11:25:55 -0400
In-Reply-To: <20080612121824.GA26504@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Mike Travis <travis@sgi.com>

--Signature=_Fri__13_Jun_2008_01_25_44_+1000_lcZk1=Hz2GX+J1Z1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 12 Jun 2008 14:18:24 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Len Brown <lenb@kernel.org> wrote:
>=20
> > > Today's linux-next merge of the acpi tree got a trivial conflict in
> > > drivers/acpi/processor_throttling.c between commit
> > > 141ad0688adb53094d6f75b39b4b3b0625de0e07 ("acpi: use performance vari=
ant
> > > for_each_cpu_mask_nr") from the cpus4096 tree and commit
> > > 08a4ab4a5fd58438840524ce22199c6bbd05816f ("ACPI: change processors fr=
om
> > > array to per_cpu variable") from the acpi tree.
> > >=20
> > > It is just a context conflict and I did the obvious fixup.
> >=20
> > thanks.
> >=20
> > it would be ideal if the cpus4096 tree didn't scribble on drivers/acpi=
=20
> > -- though I don't know if partitioning those patches is practical.
>=20
> well, it's a tree-wide API change and thus maintained in a separate=20
> tree.

Just a suggestion for next time (or this time if you don't mind a bit of
rearrangement):

Having now settled the interface changes down you could submit a patch to
Linus for his current tree that defines next_cpu_nr, cpus_weight_nr and
for_each_cpu_mask_nr to be next_cpu, cpus_weight and for_each_cpu_mask
respectively (just as they still will be for NR_CPUS <=3D 64).  Once that
has gone in (and I see no reason it wouldn't) you can send the patches
that only depend on those three interfaces existing to their respective
subsystem maintainers who will be now be able to apply them to their own
trees (maybe after merging in Linus' tree).

This way I don't have ongoing manual merges to do in the -next tree and
life is easier all round when we come to the next merge window at which
point the actual new implementations can go in.

This has been partially done (and more is being done) with dev_name() and
dev_set_name().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_01_25_44_+1000_lcZk1=Hz2GX+J1Z1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhRP/gACgkQTgG2atn1QN+KrwCfYuYS8494EgnADhlOE/iqHGtT
UYMAoJL0qLinjXzkpyCJHIhImv76tKXQ
=RnK/
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_01_25_44_+1000_lcZk1=Hz2GX+J1Z1--
