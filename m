From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the oprofile tree with the tip tree
Date: Tue, 12 Oct 2010 23:23:49 +1100
Message-ID: <20101012232349.938f83c0.sfr@canb.auug.org.au>
References: <20101012131828.5fedf1bf.sfr@canb.auug.org.au>
	<20101012060327.GA13409@console-pimps.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Oct_2010_23_23_49_+1100_JxCDahWEsLvTMxPe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34228 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753963Ab0JLMYE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Oct 2010 08:24:04 -0400
In-Reply-To: <20101012060327.GA13409@console-pimps.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matt Fleming <matt@console-pimps.org>
Cc: Robert Richter <robert.richter@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Helsley <matthltc@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

--Signature=_Tue__12_Oct_2010_23_23_49_+1100_JxCDahWEsLvTMxPe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, 12 Oct 2010 07:03:27 +0100 Matt Fleming <matt@console-pimps.org> wr=
ote:
>
> >  		return 0;
> > =20
> >  	pevent =3D perf_event_create_kernel_counter(&counter_config[event].at=
tr,
> > -						  cpu, -1,
> > +						  cpu, NULL1,
> >  						  op_overflow_handler);
>=20
> Is that a typo? Shouldn't that be NULL, and not NULL1?

Yes, its a typo in my patch :-( .  I will fix it for tomorrow. Sorry about =
that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Oct_2010_23_23_49_+1100_JxCDahWEsLvTMxPe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMtFNVAAoJEDMEi1NhKgbs6/EIAJHRRArr8fUtu+4RZJobfndC
/uB5Yv0QjZOGvr/NKQqje63V2IZph1XnhcYdqUewufut6Qalo8lFoNFOry/oxQB/
eubTGT5xebYHXCvfWGUCvOk0IW7xDYZYUQqys5NpusZbQWMpEv6XR1CE3WTFMrH/
4in0AtWuv+4Y4iG1jHUXxUCjSIWrxVzmfsTgKr9D/f1IRPr9x1XNko8kedwSBnyS
qR+gb7AOwVf7qn/25NhdiWB1sG57Gzqz8hVEaE/ISfCN+ferj44fI1sj2C+RbLyj
jcAA+YnSxnkAIqulQt/6PfJlsCX4PoIF85IKivbJMlPX6gjvMtepX4z4x0NYrOo=
=adua
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Oct_2010_23_23_49_+1100_JxCDahWEsLvTMxPe--
