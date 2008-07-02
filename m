From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree
Date: Wed, 2 Jul 2008 13:19:14 +1000
Message-ID: <20080702131914.c1cc1555.sfr@canb.auug.org.au>
References: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
	<20080701055844.GB14658@elte.hu>
	<20080701162920.9e9e5c8f.sfr@canb.auug.org.au>
	<200807011856.09249.jbarnes@virtuousgeek.org>
	<86802c440807011909l739e0273t132d50de7a4e31ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_13_19_14_+1000_8s.3a15GmqxKwOiI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752688AbYGBDTX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 23:19:23 -0400
In-Reply-To: <86802c440807011909l739e0273t132d50de7a4e31ac@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yhlu.kernel@gmail.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Wed__2_Jul_2008_13_19_14_+1000_8s.3a15GmqxKwOiI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2008 19:09:21 -0700 "Yinghai Lu" <yhlu.kernel@gmail.com> wrot=
e:
>
> >> +++ b/arch/x86/kernel/setup.c
> >> @@ -596,6 +596,13 @@ void __init setup_arch(char **cmdline_p)
> >>
> >>       parse_early_param();
> >>
> >> +#ifdef CONFIG_X86_64
> >> +#ifdef CONFIG_PCI
> >> +     if (pci_early_dump_regs)
> >> +             early_dump_pci_devices();
> >> +#endif
> >> +#endif
> >
> > Yeah, I think this would be safe to enable generally though (certainly =
useful
> > to enable everwhere)... Yinghai?
> >
> yes. please remove #ifdef CONFIG_X86_64, so 32 bit could use that too.

OK, tomorrow I will do that (today is too late as I have already merged
it).=20
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_13_19_14_+1000_8s.3a15GmqxKwOiI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhq87IACgkQjjKRsyhoI8z6qQCfdKPPv58an/wpLePgsTQBOR+4
BdAAoIV0bDmdfxcOiP9gKk53944xANPd
=bA0m
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_13_19_14_+1000_8s.3a15GmqxKwOiI--
