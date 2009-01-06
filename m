From: =?utf-8?q?I=C3=B1aky_P=C3=A9rez-Gonz=C3=A1lez?=
	<inaky.perez-gonzalez@intel.com>
Subject: Re: linux-next: Tree for January 6 (wimax errs)
Date: Tue, 6 Jan 2009 13:50:02 -0800
Message-ID: <200901061350.02562.inaky.perez-gonzalez@intel.com>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au> <20090106132321.8a330942.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58046 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753349AbZAFVui (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 16:50:38 -0500
In-Reply-To: <20090106132321.8a330942.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wimax@intel.com, wimax@linuxwimax.org

On Tuesday 06 January 2009, Randy Dunlap wrote:
> On Tue, 6 Jan 2009 18:23:11 +1100 Stephen Rothwell wrote:
> > Hi all,
> >
> > This tree will not build a powerpc ppc4xx_defconfig due to a kvm problem.
> >
> > Changes since 20090105:
>
> wimax build fails when CONFIG_INPUT=n:

Ops -- my fault -- working on a fix.

> Also, this warning needs to be fixed:
>
> linux-next-20090106/net/wimax/id-table.c:133: warning: ISO C90 forbids
> mixed declarations and code

Will fix too.

Thanks Randy,
