From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 10 Apr 2017 12:11:07 +1000
Message-ID: <20170410121107.69b83963@canb.auug.org.au>
References: <20170404164453.677dc74a@canb.auug.org.au>
        <20170404081937.npgk3cwx7bv5igzg@dell>
        <20170404082156.yhepja5bveahlegr@dell>
        <1491309075.708.125.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34001 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751200AbdDJCLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Apr 2017 22:11:09 -0400
In-Reply-To: <1491309075.708.125.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Tue, 04 Apr 2017 15:31:15 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>
> On Tue, 2017-04-04 at 09:21 +0100, Lee Jones wrote:
> > On Tue, 04 Apr 2017, Lee Jones wrote:
> >  =20
> > > On Tue, 04 Apr 2017, Stephen Rothwell wrote:
> > >  =20
> > > > After merging the mfd tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > >=20
> > > > /home/sfr/next/next/drivers/mfd/intel_soc_pmic_bxtwc.c:25:31:
> > > > fatal error: asm/intel_pmc_ipc.h: No such file or directory
> > > >=20
> > > > Caused by commit
> > > >=20
> > > > =C2=A0 eb2a445f7d8f ("mfd: intel_soc_pmic: Fix a mess with compilat=
ion
> > > > units")
> > > >=20
> > > > I have reverted that commit for today. =20
> > >=20
> > > Andy,
> > >=20
> > > I'm pulling this commit.=C2=A0=C2=A0Despite you thinking the error is=
 unrelated
> > > to your patch, something is clearly wrong and I don't have time to
> > > investigate.
> > >=20
> > > Ball is in your court. =20
> >=20
> > Okay, I've had a *very* quick looks. =20
>=20
> > Seems as if you should be depending on INTEL_PMC_IPC. =20
>=20
> As a quick fix, yes. As a proper fix the PMC/SCU mess should be fixed in
> a way to provide a header in include/platform_data/x86.
>=20
> I will prepare v4.
> Thanks.

Ping?

--=20
Cheers,
Stephen Rothwell
