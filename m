From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rr tree build failure
Date: Mon, 10 Aug 2009 13:55:46 +1000
Message-ID: <20090810135546.2f1d079a.sfr@canb.auug.org.au>
References: <20090803133203.81174a8e.sfr@canb.auug.org.au>
	<200908031422.28171.bjorn.helgaas@hp.com>
	<200908040848.27364.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Aug_2009_13_55_46_+1000_4B0Na0p1JC+Jng0K"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755341AbZHJDzz@vger.kernel.org>
In-Reply-To: <200908040848.27364.rusty@rustcorp.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__10_Aug_2009_13_55_46_+1000_4B0Na0p1JC+Jng0K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guys,

On Tue, 4 Aug 2009 08:48:26 +0930 Rusty Russell <rusty@rustcorp.com.au> wro=
te:
>
> On Tue, 4 Aug 2009 05:52:27 am Bjorn Helgaas wrote:
> > On Sunday 02 August 2009 09:32:03 pm Stephen Rothwell wrote:
> > > Hi Rusty,
> > >=20
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > >=20
> > > drivers/acpi/osl.c: In function 'bind_to_cpu0':
> > > drivers/acpi/osl.c:194: error: implicit declaration of function 'set_=
cpus_allowed'

Still getting this ...

> > Here's a patch to fix this.  Since Linus' tree still contains instances
> > of set_cpus_allowed(), I'm guessing this patch should be added to the rr
> > tree?

Since set_cpus_allowed_ptr() aleeady exists in Linus' tree, you could put
that patch in your tree, Bjorn.

> Yep, my series removes it, at least for CONFIG_CPUMASK_OFFSTACK=3Dy.

So one of you (at least) should apply that patch to your tree!  Please?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_Aug_2009_13_55_46_+1000_4B0Na0p1JC+Jng0K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp/mkIACgkQjjKRsyhoI8wBVACeJxJMEg5lIdSXTj4fy76iHCU6
4dgAoJc53dhprIpprjKrOjHvTLrVZClJ
=g8zm
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Aug_2009_13_55_46_+1000_4B0Na0p1JC+Jng0K--
