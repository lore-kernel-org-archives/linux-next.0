From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 26 Jun 2014 19:36:40 +0200
Message-ID: <20140626173640.GF27687@wotan.suse.de>
References: <20140626162257.45f8e2aa@canb.auug.org.au> <20140626082940.GE27687@wotan.suse.de> <20140626114512.GO8769@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39757 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756633AbaFZRgn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2014 13:36:43 -0400
Content-Disposition: inline
In-Reply-To: <20140626114512.GO8769@pathway.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Petr =?iso-8859-1?Q?Ml=E1dek?= <pmladek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 26, 2014 at 01:45:13PM +0200, Petr Ml=E1dek wrote:
> On Thu 2014-06-26 10:29:40, Luis R. Rodriguez wrote:
> > On Thu, Jun 26, 2014 at 04:22:57PM +1000, Stephen Rothwell wrote:
> > > Hi Andrew,
> > >=20
> > > After merging the akpm tree, today's linux-next build (powerpc
> > > ppc44x_defconfig) failed like this:
> > >=20
> > > kernel/printk/printk.c: In function 'log_buf_add_cpu':
> > > kernel/printk/printk.c:269:37: error: 'CONFIG_LOG_CPU_MAX_BUF_SHI=
=46T' undeclared (first use in this function)
> > >  #define __LOG_CPU_MAX_BUF_LEN (1 << CONFIG_LOG_CPU_MAX_BUF_SHIFT=
)
> > >                                      ^
> > > kernel/printk/printk.c:864:42: note: in expansion of macro '__LOG=
_CPU_MAX_BUF_LEN'
> > >   cpu_extra =3D (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN=
;
> > >                                           ^
> > > kernel/printk/printk.c:269:37: note: each undeclared identifier i=
s reported only once for each function it appears in
> > >  #define __LOG_CPU_MAX_BUF_LEN (1 << CONFIG_LOG_CPU_MAX_BUF_SHIFT=
)
> > >                                      ^
> > > kernel/printk/printk.c:864:42: note: in expansion of macro '__LOG=
_CPU_MAX_BUF_LEN'
> > >   cpu_extra =3D (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN=
;
> > >                                           ^
> > >=20
> > > Caused by commit 58209adf633e ("printk: allow increasing the ring
> > > buffer depending on the number of CPUs").  CONFIG_LOG_CPU_MAX_BUF=
_SHIFT
> > > is not defined for this configuration.
> >=20
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 573d3f6..2339118 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -822,10 +822,9 @@ config LOG_BUF_SHIFT
> > =20
> >  config LOG_CPU_MAX_BUF_SHIFT
> >  	int "CPU kernel log buffer size contribution (13 =3D> 8 KB, 17 =3D=
> 128KB)"
> > -	range 0 21
> > -	default 12
> > -	depends on SMP
> > -	depends on !BASE_SMALL
> > +	range 0 21 if SMP && !BASE_SMALL
> > +	default 12 if SMP && !BASE_SMALL
> > +	default 0 if !SMP || BASE_SMALL
>=20
> There are situations when the default value is not defined, for
> example, when both SMP and BASE_SMALL are set.
>=20
> I would ignore SMP. It is handled in the code. If SMP is not defined,
> num_possible_cpus() returns 1 and "cpu_extra" is always 0. Then we
> could have:
>=20
>        range 0 21
>        default 12 if !BASE_SMALL
>        default 0 if BASE_SMALL
>=20
>=20
> What about the following patch? It does the above change. Plus
> it tries to make the help text better readable. It says the basic
> details first. Then it says other useful information in
> separate paragraphs. Also I removed the computation example. It was
> not easy to parse. Interested people might want to look into sources.
>=20
> It could be merged into
> printk-allow-increasing-the-ring-buffer-depending-on-the-number-of-cp=
us.patch

Looks good to me, Andrew let me know how you prefer to amend queued up =
patches
on your end.

  Luis
