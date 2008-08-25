From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Mon, 25 Aug 2008 21:56:47 +1000
Message-ID: <20080825215647.28b9b780.sfr@canb.auug.org.au>
References: <20080815115410.458633f1.sfr@canb.auug.org.au>
	<20080825120140.af8e1fb5.sfr@canb.auug.org.au>
	<20080825091643.GD9114@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_21_56_47_+1000_h+Q2l6rzcMqPL5Tn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35934 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752935AbYHYL5D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 07:57:03 -0400
In-Reply-To: <20080825091643.GD9114@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>, Greg KH <greg@kroah.com>, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Mon__25_Aug_2008_21_56_47_+1000_h+Q2l6rzcMqPL5Tn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 25 Aug 2008 11:16:43 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > On Fri, 15 Aug 2008 11:54:10 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > Today's linux-next merge of the ftrace tree got a conflict in
> > > kernel/module.c between commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e=
26
> > > ("driver core: basic infrastructure for per-module dynamic debug
> > > messages") from the driver-core tree and commit
> > > e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoint=
s")
> > > from the ftrace tree.
> > >=20
> > > Overlapping additions.  I fixed it up. Probably worth a look once I
> > > publish the tree.
> >=20
> > Today this has expanded to include commit=20
> > be1c870c22e9b27170b5dd5028b6eaf2aab7b508 ("ftrace: enable mcount=20
> > recording for modules") also from the ftrace tree.  I have fixed it up=
=20
> > as below.
>=20
> Thanks Stephen. I suspect there's not much we can do at this point to=20
> resolve this conflict sooner than at the linux-next level, as Rusty uses=
=20
                                                                ^^^^^
I assume you mean Greg.

> Quilt queues.

But yeah, not much we can do, but it is not a problem.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_21_56_47_+1000_h+Q2l6rzcMqPL5Tn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiynf8ACgkQjjKRsyhoI8z4LQCfXGjkX2YF/8Uu6rrSvzo3n+YD
zLsAoLUvDWlGZoVX0WxW3aai8hQtbAdI
=xXNr
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_21_56_47_+1000_h+Q2l6rzcMqPL5Tn--
