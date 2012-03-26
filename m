From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: Inconsistent kallsyms data on ARM.
Date: Mon, 26 Mar 2012 09:45:33 +0200
Message-ID: <20120326074533.GL15647@pengutronix.de>
References: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com>
 <201203141321.47010.arnd@arndb.de>
 <20120325112035.GE5611@n2100.arm.linux.org.uk>
 <4F6FB170.1040109@jonmasters.org>
 <20120326073704.GH5611@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120326073704.GH5611@n2100.arm.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jon Masters <jonathan@jonmasters.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello,

On Mon, Mar 26, 2012 at 08:37:04AM +0100, Russell King - ARM Linux wrot=
e:
> On Sun, Mar 25, 2012 at 07:59:44PM -0400, Jon Masters wrote:
> > As to longer term, I am happy to work up something that will spot t=
his
> > particular kind of failure (symbol changes type) and output somethi=
ng
> > more useful during the kallsyms generation if you would like.
> >=20
> > Are you planning to pull in either of the fixes you mention?
>=20
> I'm not, because those are all sub-optimal - I don't see why we shoul=
d
> bloat the kernel image just for the sake of working around kallsyms.
>=20
> The best I've come up with so far which avoids that is to force
> KALLSYMS_EXTRA_PASS to always be set on ARM.
Just to let you know: I even saw failures with KALLSYMS_EXTRA_PASS set.
Not so in the recent past and sometimes not even reproducible IIRC.
I will save the build results next time it happens now that I saw what
to look for.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
