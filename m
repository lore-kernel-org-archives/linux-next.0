From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Thu, 14 Jun 2012 00:10:40 +0200
Message-ID: <20120613221040.GJ30400@pengutronix.de>
References: <20120522234621.GA3610@windriver.com>
 <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:35457 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231Ab2FMWKz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Jun 2012 18:10:55 -0400
Content-Disposition: inline
In-Reply-To: <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: viresh kumar <viresh.linux@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King <linux@arm.linux.org.uk>, Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fengguang.wu@intel.com, spear-devel <spear-devel@list.st.com>

Hi Viresh,

On Tue, Jun 12, 2012 at 11:57:07AM +0100, viresh kumar wrote:
> Hi Paul/Russell,
>=20
> On Wed, May 23, 2012 at 12:46 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > Hi Viresh,
> >
> > The above listed commit, in linux-next as:
> >
> > commit ebbf0cb5d39cc3e22ef4c425475e76b7f45027de
> >
> > =A0 =A0"clk: add non CONFIG_HAVE_CLK routines"
> >
> > shows up as failures in the netx_defconfig, since there
> > are duplicate stub functions between your changes and the
> > file below:
> >
> > =A0arch/arm/mach-netx/fb.c:72:6: error: redefinition of 'clk_disabl=
e'
> > =A0include/linux/clk.h:299:51: note: previous definition of 'clk_di=
sable' was here
> > =A0arch/arm/mach-netx/fb.c:76:5: error: redefinition of 'clk_set_ra=
te'
> > =A0include/linux/clk.h:306:50: note: previous definition of 'clk_se=
t_rate' was here
> > =A0arch/arm/mach-netx/fb.c:81:5: error: redefinition of 'clk_enable=
'
> > =A0include/linux/clk.h:294:50: note: previous definition of 'clk_en=
able' was here
> > =A0arch/arm/mach-netx/fb.c:86:13: error: redefinition of 'clk_get'
> > =A0include/linux/clk.h:280:58: note: previous definition of 'clk_ge=
t' was here
> > =A0arch/arm/mach-netx/fb.c:91:6: error: redefinition of 'clk_put'
> > =A0include/linux/clk.h:290:51: note: previous definition of 'clk_pu=
t' was here
> > =A0make[2]: *** [arch/arm/mach-netx/fb.o] Error 1
>=20
> Following are present in mach-netx/fb.c:
>=20
>=20
> void clk_disable(struct clk *clk)
> {
> }
>=20
> int clk_set_rate(struct clk *clk, unsigned long rate)
> {
> 	return 0;
> }
>=20
> int clk_enable(struct clk *clk)
> {
> 	return 0;
> }
>=20
> void clk_put(struct clk *clk)
> {
> }
>=20
> struct clk *clk_get(struct device *dev, const char *id)
> {
> 	return dev && strcmp(dev_name(dev), "fb") =3D=3D 0 ? NULL : ERR_PTR(=
-ENOENT);
> }
>=20
> I can remove first four without any issues, but just can't remove the=
 last one.
> The dummy clk_get() always returns NULL, whereas this one returns NUL=
L only for
> fb device.
>=20
> How should I fix this?

As the netx does not have fb support in mainline you can just drop this
one aswell. It has no use.

Sascha


--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
