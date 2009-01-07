From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Subject: Re: linux-next: Tree for January 6 (wimax errs)
Date: Wed, 7 Jan 2009 00:09:57 -0800
Message-ID: <200901070009.57582.inaky@linux.intel.com>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au> <20090106132321.8a330942.randy.dunlap@oracle.com> <200901061350.02562.inaky.perez-gonzalez@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:20635 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751121AbZAGIKp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 03:10:45 -0500
In-Reply-To: <200901061350.02562.inaky.perez-gonzalez@intel.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: wimax@linuxwimax.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wimax@intel.com

On Tuesday 06 January 2009, I=C3=B1aky P=C3=A9rez-Gonz=C3=A1lez wrote:
> On Tuesday 06 January 2009, Randy Dunlap wrote:
> > On Tue, 6 Jan 2009 18:23:11 +1100 Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > This tree will not build a powerpc ppc4xx_defconfig due to a kvm
> > > problem.
> > >
> > > Changes since 20090105:
> >
> > wimax build fails when CONFIG_INPUT=3Dn:
>
> Ops -- my fault -- working on a fix.
>
> > Also, this warning needs to be fixed:
> >
> > linux-next-20090106/net/wimax/id-table.c:133: warning: ISO C90 forb=
ids
> > mixed declarations and code
>
> Will fix too.

I just submitted a patchset to gregkh that fixes these issues and just=20
realized I didn't CC you guys:

http://linuxwimax.org/pipermail/wimax/2009-January/000397.html

My apologies for missing out,

--=20
Inaky
