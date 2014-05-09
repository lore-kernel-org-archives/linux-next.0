From: Scott Wood <scottwood@freescale.com>
Subject: linux-next: add scottwood/linux.git
Date: Fri, 9 May 2014 16:15:33 -0500
Message-ID: <1399670133.15726.440.camel@snotra.buserror.net>
References: <20140320042527.GA23206@home.buserror.net>
	 <1395616617.3460.109.camel@pasglop> <1395617608.3460.113.camel@pasglop>
	 <1395709794.12479.411.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1blp0188.outbound.protection.outlook.com ([207.46.163.188]:17607
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757919AbaEIVPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 9 May 2014 17:15:43 -0400
In-Reply-To: <1395709794.12479.411.camel@snotra.buserror.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, galak@kernel.crashing.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-next@vger.kernel.org

On Mon, 2014-03-24 at 20:09 -0500, Scott Wood wrote:
> On Mon, 2014-03-24 at 10:33 +1100, Benjamin Herrenschmidt wrote:
> > On Mon, 2014-03-24 at 10:16 +1100, Benjamin Herrenschmidt wrote:
> > > On Wed, 2014-03-19 at 23:25 -0500, Scott Wood wrote:
> > > > The following changes since commit c7e64b9ce04aa2e3fad7396d92b5cb92056d16ac:
> > > > 
> > > >   powerpc/powernv Platform dump interface (2014-03-07 16:19:10 +1100)
> > > > 
> > > > are available in the git repository at:
> > > > 
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next
> > > > 
> > > > for you to fetch changes up to 48b16180d0d91324e5d2423c6d53d97bbe3dcc14:
> > > > 
> > > >   fsl/pci: The new pci suspend/resume implementation (2014-03-19 22:37:44 -0500)
> > > 
> > > Stephen just informed me that your tree wasn't in -next ... Kumar's
> > > still is.
> > > 
> > > Can you guys fix that up ? I somewhat rely on the FSL stuff to simmer
> > > in -next on its own.
> 
> Stephen, what's the process for adding a tree?

ping

-Scott


> 
> I suppose we should update MAINTAINERS while we're at it.
> 
> > Oh and where is my little summary to put in the merge commit ?
> > 
> > I made one up for this time around.
> 
> Oops, forgot again.  Now I've added something to the script I use to
> generate pull requests, to give me a reminder.
> 
> -Scott
> 
