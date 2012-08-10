From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: thermal patches in linux-next
Date: Fri, 10 Aug 2012 09:41:06 +0800
Message-ID: <1344562866.1682.698.camel@rui.sh.intel.com>
References: <1344308038.1682.637.camel@rui.sh.intel.com>
	 <1344494746.1682.669.camel@rui.sh.intel.com>
	 <20120810090859.7ec67594f794c38c52096544@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:8302 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755941Ab2HJBj6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Aug 2012 21:39:58 -0400
In-Reply-To: <20120810090859.7ec67594f794c38c52096544@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Amit Kachhap <amit.kachhap@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Hi, Stephen,

On =E4=BA=94, 2012-08-10 at 09:08 +1000, Stephen Rothwell wrote:
> Hi Rui,
>=20
> On Thu, 09 Aug 2012 14:45:46 +0800 Zhang Rui <rui.zhang@intel.com> wr=
ote:
> >
> > On =E4=BA=8C, 2012-08-07 at 10:53 +0800, Zhang Rui wrote:
> > > Hi, all,
> > >=20
> > > I just created a git tree for catching all thermal changes.
> > > http://git.kernel.org/?p=3Dlinux/kernel/git/rzhang/linux.git;a=3D=
summary
> > > and I also created the next branch, which I'd like to be set for
> > > linux-next inclusion, but don't know how.
> > >=20
> > I create a tree for thermal management,
> > git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git
> >=20
> > could you please include my next branch for linux-next?
>=20
> Included from today.
>=20
Thank you.

> > And could you please drop these commits
> > ef25a0fe0087963c1611c1c8903886fbea053f76
> > 09ec52fca274ba88d68df3198de92abdaaff417b
> > ab6d2f029358c917508bf88bbd6a9193a8e39fc8
> > 66447fa993cbce56b4076f169a56f62350f6c7b8
> > ec62abb8b46021ca9ee6b8692b26974ace9007f0
> > 5ecbaf57d7885eedd924e391d91847d3df9fe0f8
> > 851414b2249afd8c128d29912dfd7060eaea8932
> > and pull my next branch instead?
>=20
> That is not how linux-next normally works.  Those commits are in Adnr=
ew's
> quilt series, so you need to ask him to drop them.  However, because =
of
> the way the akpm tree works, any duplicate patches will disappear fro=
m my
> copy of Andrew's series.
>=20
Andrew,

could you please drop these patches?
these commits either will be or has been re-based on top of my tree.

thanks,
rui
>=20
> In this case, I will remove them if they conflict too much or you tak=
e
> them (rebased) into your tree.
>=20
> Andrew, any chance of a new mmotm series?  I am still working off (a =
reduced
> part) of the mmotm series from July 21 ...
>=20
> Thanks for adding your subsystem tree as a participant of linux-next.=
  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.=20
>=20
> You will need to ensure that the patches/commits in your tree/series =
have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor'=
s
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree)=
,
>      * successfully unit tested, and=20
>      * destined for the current or next Linux merge window.
>=20
> Basically, this should be just what you would send to Linus (or ask h=
im
> to fetch).  It is allowed to be rebased if you deem it necessary.
>=20
