From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Tue, 19 Jul 2016 04:41:52 +0200
Message-ID: <2565257.LbcJLfl1sl@vostro.rjw.lan>
References: <20160715121723.0f21f148@canb.auug.org.au> <2196027.ndrBocBl2R@vostro.rjw.lan> <20160717181448.GC1814@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3147126.euzTHokrIU"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:52344 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752152AbcGSChH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 22:37:07 -0400
In-Reply-To: <20160717181448.GC1814@katana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>


--nextPart3147126.euzTHokrIU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, July 17, 2016 08:14:48 PM Wolfram Sang wrote:
> 
> > > > > > I fixed it up (I think, but it needs more work - see below) and can
> > > > > 
> > > > > For a start, it generates this warning, now:
> > > > > 
> > > > > drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
> > > > > static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
> > > > >                    ^
> > > > 
> > > > OK, thanks for the heads-up.
> > > 
> > > Yes, thanks!
> > > 
> > > > 
> > > > Wolfram, what about if I exposed my "acpi-tables" branch for you to pull?
> > > > 
> > > > You could resolve this in your tree then.
> > > 
> > > I can pull it in, sure. For the fixup, I'd like a commitment from one of
> > > the ACPI experts (Jarkko, Mika, Andy), though. Otherwise I'd need to
> > > revert given that we are quite late in the cycle already.
> > 
> > The branch is here:
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-tables
> > 
> > The top-most commit is:
> > 
> > fafe5306f201 ACPI: Rename configfs.c to acpi_configfs.c to prevent link error
> > 
> > I won't rebase this branch going forward, so it is safe to pull.
> > 
> > Please let me know how I can help with the conflict resolution.
> 
> Well, not knowing much about ACPI, I just need the conflict resolution
> for my latest i2c/for-next and your above branch. If you want to do it,
> fine with me. But maybe Jarkko will be back to office on Monday, too.

Unfortunately, I don't see how these branches can be merged in a sensible
way without adding too much new code into the merge itself.

Something needs to be dropped and then rebased and applied again.

Thanks,
Rafael

--nextPart3147126.euzTHokrIU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJXjZN2AAoJEILEb/54YlRxl14P+QE0tEn0W3Vm6AR+KHANpw6r
167wRwBiAVO5uvlJu1+tN8EYfOvps6hmv2LWZ+N2AqFxsXssoDf78aDQmVcCjWiU
sYtw7HZWj6zzoYTKTbtgitfaVgRO3oN5UkcxuKX15K/J4hT4xb62Z5fgieu5471G
Nos/Gtl/LF9xgdkk953ekn5d5cwSIbqjbev//hzrgBTGeu0NTeIuZrfQgz/QSUA7
VrAru37ZjvV3qjGQQtiJN1vtwTbTFsIEA2OA8mRX/gXlKjDIo11UhKo84/eLYoTP
CkIsToHcc0xhxRRbvZmr8ioxcMpYHcWBYs8FU8EySrs7Qq+n8c04rGu/cLjoJO5n
aHEGXJTyNqjHAlwChaW5fAG7bSmrIQqvKm6K+98uIuMkgeM5V9lc6qPgG7NanY/R
LJIRmESh7B+YCV57hRR9VA09Zm8+aZtecRn35z7qMqOOMUcL+FnSVCVJeEHRN4SR
laRHMJcGREalacGnavHjjM0oBJYAljEsNAWWuifeKUijd5K0bD8XQuj+nVx1IACr
LOvVF9uS8h1vp/BJlnZC69mu5pud5lnaS0X+zmWZeNEpi488WUHY6iSAtNp1gQ2T
pk2NGl4teehkO20D74+C108uQwpeqUm/e8bh9cHuDBsv15WGKLYgRdfB3l7Bb9Ob
8Kb9LINMRRCV46ZWbDae
=HC5D
-----END PGP SIGNATURE-----

--nextPart3147126.euzTHokrIU--
