From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the fastboot tree
Date: Fri, 15 Aug 2008 17:57:05 +1000
Message-ID: <20080815175705.a187e05b.sfr@canb.auug.org.au>
References: <20080815174415.985eb69c.sfr@canb.auug.org.au>
	<20080815075006.GA2399@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_17_57_05_+1000_hrY2V7YJ3Rwt3L4="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55086 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbYHOH5S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 03:57:18 -0400
In-Reply-To: <20080815075006.GA2399@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Dave Hansen <haveblue@us.ibm.com>, Greg KH <greg@kroah.com>

--Signature=_Fri__15_Aug_2008_17_57_05_+1000_hrY2V7YJ3Rwt3L4=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 15 Aug 2008 09:50:06 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > Today's linux-next merge of the fastboot tree got a trivial conflict=20
> > in include/linux/init.h between commit=20
> > 95fc5687f58152d62904e7dea36dca3a52514160 ("Dave Hansen=20
> > <haveblue@us.ibm.com>") from the driver-core tree and commit=20
>=20
> [ sidenote: interesting commit name ;-) ]

:-)

"warn when statically-allocated kobjects are used"

> > [I have been asked to try adding the merge result diff, so just as a=20
> > test I have included it below.]
>=20
> that's a very good idea!
>=20
> [ The inlining seems a bit weird though - Mutt didnt show it in its
>   default form, it only showed up when i did a reply to the mail.=20
>   Strange. I use mutt-1.5.18-2.fc8. ]

Probably a side effect of the fact that I GPG sign most of my emails.  I
usually don't do that when I include a patch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_17_57_05_+1000_hrY2V7YJ3Rwt3L4=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilNtEACgkQjjKRsyhoI8wMcgCfUCDekbIa7yB1i9TwFrR6E2Ac
9vQAn0OppZtix0/DQHrf5sCecxxFwUhG
=GQKF
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_17_57_05_+1000_hrY2V7YJ3Rwt3L4=--
