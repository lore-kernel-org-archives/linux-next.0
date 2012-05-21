From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 21 May 2012 11:28:23 +0100
Message-ID: <4FBA18C7.4030800@linaro.org>
References: <20120521134219.6d6396802bd6a097503bac92@canb.auug.org.au> <4FB9F818.4030801@linaro.org> <20120521184005.3b7661ec6468c5878a22615d@canb.auug.org.au> <4FBA0460.1070300@linaro.org> <20120521191007.9347651e88add2e7c247a24f@canb.auug.org.au> <4FBA08A4.6030706@linaro.org> <20120521095427.GA30045@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120521095427.GA30045@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

> Since there's no dependencies which would stop it being selected
> anything like allyesconfig or randconfig might enable it.  In general
> it's normal to allow this in order to make it easier to build test
> things like subsystem wide changes.

Ah, I see. In which case Stephen was correct in that it's an issue with=
=20
Kconfig logic (but not an issue with the patch alluded to). I'm going t=
o=20
have to pass this one over to Linus (CC'ed), as it's his train-set and =
I=20
don't want to do the wrong thing.

Linus,

When CONFIG_AB8500_CORE is set, building ab8500-core.c and=20
!(CONFIG_UX500_SOC_DB8500 | CONFIG_MFD_DB8500_PRCMU), both=20
db8500-prcmu.h and dbx500-prcmu.h take it upon themselves to _both_=20
create 'return 0' inline functions for the following:

prcmu_abb_read()
prcmu_abb_write()
prcmu_config_clkout()
prcmu_ac_wake_req()
prcmu_ac_sleep_req()

I think we need a Kconfig rule to prevent this from happening, but I'm=20
not sure what the correct logic would be. The other option would be to=20
explicitly include db8500-prcmu.h instead of dbx500-prcmu.h in=20
ab0500-core.c (which in turn includes db8500-prcmu.h (and used to=20
include db5500-prcmu.h)), but this seems wrong to me.

As you have a clearer insight to these things would you care to take=20
this on?

Kind regards,
Lee

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
