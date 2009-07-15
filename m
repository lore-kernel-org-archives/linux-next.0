From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for July 6-July 9-July 15 (percpu/x86)
Date: Wed, 15 Jul 2009 15:17:20 +0530
Message-ID: <20090715094720.GA6674@linux.vnet.ibm.com>
References: <20090706162632.fdde002e.sfr@canb.auug.org.au> <20090706095343.df21d4c9.rdunlap@xenotime.net> <20090709102248.01e2312c.randy.dunlap@oracle.com>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([59.145.155.9]:56862 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707AbZGOJrZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2009 05:47:25 -0400
Content-Disposition: inline
In-Reply-To: <20090709102248.01e2312c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Tejun Heo <htejun@gmail.com>

* Randy Dunlap <randy.dunlap@oracle.com> [2009-07-09 10:22:48]:

> On Mon, 6 Jul 2009 09:53:43 -0700 Randy Dunlap wrote:
> 
> > On Mon, 6 Jul 2009 16:26:32 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20090703:
> > > 
> > > The percpu tree lost all its conflicts but gained another against the tip
> > > tree.
> > 
> > arch/x86/mm/pageattr.c: In function 'cpa_process_alias':
> > arch/x86/mm/pageattr.c:749: error: implicit declaration of function 'pcpu_lpage_remapped'
> > 
> > config attached.
> 
> 
> Still present in 20090709...
> 
still seen in 20090715 with allnoconfig.


					Kamalesh
