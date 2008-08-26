From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparseirq tree build failure
Date: Tue, 26 Aug 2008 17:53:24 +1000
Message-ID: <20080826175324.fe4f38db.sfr@canb.auug.org.au>
References: <20080825195024.d42b72e6.sfr@canb.auug.org.au>
	<86802c440808251042t79b9a9a7nd6fef3b9c3d37b25@mail.gmail.com>
	<86802c440808251045j351756c1oc825fc6f39a026a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__26_Aug_2008_17_53_24_+1000_resgTm0Rt8PfdL77"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47641 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089AbYHZHxd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 03:53:33 -0400
In-Reply-To: <86802c440808251045j351756c1oc825fc6f39a026a@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yhlu.kernel@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

--Signature=_Tue__26_Aug_2008_17_53_24_+1000_resgTm0Rt8PfdL77
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yinghai,

On Mon, 25 Aug 2008 10:45:22 -0700 "Yinghai Lu" <yhlu.kernel@gmail.com> wro=
te:
>
> On Mon, Aug 25, 2008 at 10:42 AM, Yinghai Lu <yhlu.kernel@gmail.com> wrot=
e:
> >
> > seems there is some merge problem...
> > please check.
> >
> > diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
> > index f106167..3cd7389 100644
> > --- a/include/linux/kernel_stat.h
> > +++ b/include/linux/kernel_stat.h
> > @@ -28,7 +28,7 @@ struct cpu_usage_stat {
> >
> >  struct kernel_stat {
> >        struct cpu_usage_stat   cpustat;
> > -#ifndef CONFIG_GENERIC_HARDIRQS
> > +#ifndef CONFIG_HAVE_SPARSE_IRQ
> >        unsigned int irqs[NR_IRQS];
> >  #endif
> >  };
>=20
> more than that, will double check that.

I applied the above patch and it allows the tree to build, so I will
leave it in for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__26_Aug_2008_17_53_24_+1000_resgTm0Rt8PfdL77
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiztnQACgkQjjKRsyhoI8zkCQCfdQDPEHv7xSnuFEx6MBF1rFKE
IE4An0TTBhgc75HKtA3/pYP4wucj2JNO
=hAR9
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Aug_2008_17_53_24_+1000_resgTm0Rt8PfdL77--
