From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure in Linus' tree
Date: Sun, 30 May 2010 10:43:03 +1000
Message-ID: <20100530104303.15864d35.sfr@canb.auug.org.au>
References: <20100528105719.a356ba4f.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.1005271807470.11382@i5.linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__30_May_2010_10_43_03_+1000__MvVWbMZ85qqb=j_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33182 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756906Ab0E3AnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 29 May 2010 20:43:12 -0400
In-Reply-To: <alpine.LFD.2.00.1005271807470.11382@i5.linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jack Steiner <steiner@sgi.com>, Lee Schermerhorn <lee.schermerhorn@hp.com>

--Signature=_Sun__30_May_2010_10_43_03_+1000__MvVWbMZ85qqb=j_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 27 May 2010 18:09:17 -0700 (PDT) Linus Torvalds <torvalds@linux-fou=
ndation.org> wrote:
>
> On Fri, 28 May 2010, Stephen Rothwell wrote:
> >=20
> > Caused by commit 0ac0c0d0f837c499afd02a802f9cf52d3027fa3b ("cpusets:
> > randomize node rotor used in cpuset_mem_spread_node()").
> >=20
> > This commit assumes that __node_random() exists if (MAX_NUMNODES > 1) a=
nd
> > uses it if CONFIG_CPUSETS is set, but only creates it for x86 ...  there
> > is at least one other architecture where those conditions are true.
>=20
> Yeah, looking at that, it seems totally idiotic.
>=20
> Why is that "__node_random()" in x86 code at all? There is absolutely=20
> nothing x86 about it that I can tell. And now I have an ia64 merge that=20
> just duplicates that moronic function.

So, is it reasonable for me to ask you to revert commit
0ac0c0d0f837c499afd02a802f9cf52d3027fa3b ("cpusets: randomize node rotor
used in cpuset_mem_spread_node()")?  Reverting it won't break ia64 (since
their fix was to just add code that would then be unreferenced).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__30_May_2010_10_43_03_+1000__MvVWbMZ85qqb=j_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwBtJcACgkQjjKRsyhoI8wN1QCfXy6phQG05R6wsflQPUV37afj
+BkAoIW8l469CvRK4RksvXk8JXYQS/Zl
=Px2r
-----END PGP SIGNATURE-----

--Signature=_Sun__30_May_2010_10_43_03_+1000__MvVWbMZ85qqb=j_--
