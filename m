From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tracing/powerpc tree build failure
Date: Tue, 31 Mar 2009 16:54:30 +1100
Message-ID: <20090331165430.383fe51d.sfr@canb.auug.org.au>
References: <20090327230834.93d0221d.sfr@canb.auug.org.au>
	<1238158131.22033.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__31_Mar_2009_16_54_30_+1100_2IaZ7=rgQfAzyF8W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41744 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755560AbZCaFyk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2009 01:54:40 -0400
In-Reply-To: <1238158131.22033.10.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Tue__31_Mar_2009_16_54_30_+1100_2IaZ7=rgQfAzyF8W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

This patch is now applicable to the tracing tree after merging with
Linus' tree.

On Fri, 27 Mar 2009 08:48:51 -0400 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
>=20
> On Fri, 2009-03-27 at 23:08 +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> >=20
> > arch/powerpc/kernel/ftrace.c: In function 'prepare_ftrace_return':
> > arch/powerpc/kernel/ftrace.c:612: warning: passing argument 3 of 'ftrac=
e_push_return_trace' makes pointer from integer without a cast
> > arch/powerpc/kernel/ftrace.c:612: error: too many arguments to function=
 'ftrace_push_return_trace'
> >=20
> > Caused by commit 5d1a03dc541dc6672e60e57249ed22f40654ca47
> > ("function-graph: moved the timestamp from arch to generic code") from
> > the tracing tree which (removed an argument from
> > ftrace_push_return_trace()) interacting with commit
> > 6794c78243bfda020ab184d6d578944f8e90d26c ("powerpc64: port of the
> > function graph tracer") from the powerpc tree.
> >=20
> > I added the following patch and can carry it as necessary.
>=20
> Thanks Stephen!!!
>=20
> I knew this was going to break, but I needed to wait till powerpc merged
> with tip before I could make the change.
>=20
> > --=20
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 27 Mar 2009 22:47:58 +1100
> > Subject: [PATCH] tracing: fixup for ftrace_push_return_trace API change
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/powerpc/kernel/ftrace.c |    6 +-----
> >  1 files changed, 1 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/ftrace.c b/arch/powerpc/kernel/ftrace.c
> > index 5b5d16b..5455943 100644
> > --- a/arch/powerpc/kernel/ftrace.c
> > +++ b/arch/powerpc/kernel/ftrace.c
> > @@ -557,7 +557,6 @@ extern void mod_return_to_handler(void);
> >  void prepare_ftrace_return(unsigned long *parent, unsigned long self_a=
ddr)
> >  {
> >  	unsigned long old;
> > -	unsigned long long calltime;
> >  	int faulted;
> >  	struct ftrace_graph_ent trace;
> >  	unsigned long return_hooker =3D (unsigned long)&return_to_handler;
> > @@ -606,10 +605,7 @@ void prepare_ftrace_return(unsigned long *parent, =
unsigned long self_addr)
> >  		return;
> >  	}
> > =20
> > -	calltime =3D cpu_clock(raw_smp_processor_id());
> > -
> > -	if (ftrace_push_return_trace(old, calltime,
> > -				self_addr, &trace.depth) =3D=3D -EBUSY) {
> > +	if (ftrace_push_return_trace(old, self_addr, &trace.depth) =3D=3D -EB=
USY) {
>=20
> This is exactly what I would have done.
>=20
> Acked-by: Steven Rostedt <srostedt@redhat.com>
>=20
> -- Steve
>=20
> >  		*parent =3D old;
> >  		return;
> >  	}
>=20


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__31_Mar_2009_16_54_30_+1100_2IaZ7=rgQfAzyF8W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknRsBYACgkQjjKRsyhoI8wDywCggcuq1n0GiqZ5iAzBnPdEhMmq
GEUAoIAmTcRoMbcIDeLZo5F/5Q3SoSue
=b1uh
-----END PGP SIGNATURE-----

--Signature=_Tue__31_Mar_2009_16_54_30_+1100_2IaZ7=rgQfAzyF8W--
