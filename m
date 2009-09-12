From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Warning from ring buffer code (Was: Re: linux-next: tip tree
 build warning)
Date: Sat, 12 Sep 2009 20:46:30 +1000
Message-ID: <20090912204630.b1e355c5.sfr@canb.auug.org.au>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au>
	<1249403089.4634.139.camel@localhost.localdomain>
	<20090912165300.9d257283.sfr@canb.auug.org.au>
	<20090912073906.GA3972@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__12_Sep_2009_20_46_30_+1000_Ww_T6._P.shjFgZs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53161 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753538AbZILKqf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 12 Sep 2009 06:46:35 -0400
In-Reply-To: <20090912073906.GA3972@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Sat__12_Sep_2009_20_46_30_+1000_Ww_T6._P.shjFgZs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Sat, 12 Sep 2009 09:39:06 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > On Tue, 04 Aug 2009 12:24:49 -0400 Steven Rostedt <srostedt@redhat.com>=
 wrote:
> > >
> > > On Tue, 2009-08-04 at 16:16 +1000, Stephen Rothwell wrote:
> > > >=20
> > > > Today's linux-next build (powerpc ppc64_defconfig) produced these w=
arnings:
> > > >=20
> > > > kernel/trace/ring_buffer.c: In function 'rb_head_page_set':
> > > > kernel/trace/ring_buffer.c:704: warning: initialization makes point=
er from integer without a cast
> > > > kernel/trace/ring_buffer.c:704: warning: initialization makes point=
er from integer without a cast
> > > > kernel/trace/ring_buffer.c: In function 'rb_head_page_replace':
> > > > kernel/trace/ring_buffer.c:797: warning: initialization makes integ=
er from pointer without a cast
> > > >=20
> > > > Introduced by commit 77ae365eca895061c8bf2b2e3ae1d9ea62869739
> > > > ("ring-buffer: make lockless").
> > >=20
> > > Thanks, I'll take a look at it.
> >=20
> > Now that this is in Linus' tree, can we have a fix for the waning,=20
> > please?
>=20
> The first warning got fixed 1.5 months ago - the second one at line=20
> 797 is still there but harmless - you can ignore it for now, it will=20
> be fixed.

Well linux-next builds still gave both warnings yesterday, so I was just
asking to make sure they were not forgotten.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__12_Sep_2009_20_46_30_+1000_Ww_T6._P.shjFgZs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqrfAYACgkQjjKRsyhoI8zBcQCfVziWSri2mxj63hABBKzQzgNd
HKIAoLZKb57PMLLk4Id+M3U3Jzm9e61/
=IXsh
-----END PGP SIGNATURE-----

--Signature=_Sat__12_Sep_2009_20_46_30_+1000_Ww_T6._P.shjFgZs--
