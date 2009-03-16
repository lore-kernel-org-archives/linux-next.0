From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: New linux-next tree suspend-2.6
Date: Mon, 16 Mar 2009 23:16:10 +0100
Message-ID: <200903162316.11139.rjw@sisk.pl>
References: <200903151754.37147.rjw@sisk.pl> <20090316131647.48d632fb.sfr@canb.auug.org.au> <20090316200557.3542847a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:51031 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752422AbZCPWQU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:16:20 -0400
In-Reply-To: <20090316200557.3542847a.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Monday 16 March 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> On Mon, 16 Mar 2009 13:16:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I notice that your resolution is to revert a patch from the pci tree.  As
> > an alternative, you could apply the pci tree patch to your tree.
> 
> Which I now see is exactly what you did.  This makes the resolution for
> me very easy as I just need to use your version of the changes.

Jesse is going to drop the conflicting patch from his tree, so this issue
will go away shortly.

Thanks,
Rafael
