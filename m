From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: thermal patches in linux-next
Date: Fri, 10 Aug 2012 10:44:48 +0800
Message-ID: <1344566688.1682.711.camel@rui.sh.intel.com>
References: <1344308038.1682.637.camel@rui.sh.intel.com>
	 <1344494746.1682.669.camel@rui.sh.intel.com>
	 <20120810090859.7ec67594f794c38c52096544@canb.auug.org.au>
	 <1344562866.1682.698.camel@rui.sh.intel.com>
	 <20120810122355.8d6429ac84aa26d296a89e7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:15751 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060Ab2HJCnk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Aug 2012 22:43:40 -0400
In-Reply-To: <20120810122355.8d6429ac84aa26d296a89e7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Amit Kachhap <amit.kachhap@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On =E4=BA=94, 2012-08-10 at 12:23 +1000, Stephen Rothwell wrote:
> Hi Rui,
>=20
> On Fri, 10 Aug 2012 09:41:06 +0800 Zhang Rui <rui.zhang@intel.com> wr=
ote:
> >
> > > > And could you please drop these commits
> > > > ef25a0fe0087963c1611c1c8903886fbea053f76
> > > > 09ec52fca274ba88d68df3198de92abdaaff417b
> > > > ab6d2f029358c917508bf88bbd6a9193a8e39fc8
> > > > 66447fa993cbce56b4076f169a56f62350f6c7b8
> > > > ec62abb8b46021ca9ee6b8692b26974ace9007f0
> > > > 5ecbaf57d7885eedd924e391d91847d3df9fe0f8
> > > > 851414b2249afd8c128d29912dfd7060eaea8932
> > > > and pull my next branch instead?
> > >=20
> > > That is not how linux-next normally works.  Those commits are in =
Adnrew's
> > > quilt series, so you need to ask him to drop them.  However, beca=
use of
> > > the way the akpm tree works, any duplicate patches will disappear=
 from my
> > > copy of Andrew's series.
> >=20
> > could you please drop these patches?
> > these commits either will be or has been re-based on top of my tree=
=2E
>=20
> You should always quote the summary line of commits.  Andrew is using
> quilt to manage his patches and so those commit ids mean nothing to h=
im
> (and they have changed in today's linux-next anyway).
>=20
got it.

Andrew,
could you please drop these patches from Amit for now?

ARM: exynos: add thermal sensor driver platform data support
thermal: exynos: register the tmu sensor with the kernel thermal layer
thermal: exynos5: add exynos5 thermal sensor driver support
hwmon: exynos4: move thermal sensor driver to driver/thermal directory
thermal: add generic cpufreq cooling implementation

these patches can not build because of the recent thermal changes, and
Amit agreed with me to re-base them on top of my tree.

thanks,
rui
