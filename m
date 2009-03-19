From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the iommu tree with the kernel-doc
	tree
Date: Thu, 19 Mar 2009 17:23:22 +0100
Message-ID: <20090319162322.GA18465@elte.hu>
References: <20090319185732.b8cc98a8.sfr@canb.auug.org.au> <20090319080244.GA4595@elte.hu> <49C26F74.7000003@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:49463 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751434AbZCSQXl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 12:23:41 -0400
Content-Disposition: inline
In-Reply-To: <49C26F74.7000003@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> Ingo Molnar wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> >> Hi Ingo,
> >>
> >> Today's linux-next merge of the iommu tree got a conflict in
> >> Documentation/kernel-parameters.txt between commit
> >> 8e141e0b33e2fd17540881a1ead5103dd229bf81 ("docum-kernprms-alpha3") from
> >> the kernel-doc tree and commit 59d3daafa17265f01149df8eab3fb69b9b42cb2e
> >> ("dma-debug: add kernel command line parameters") from the iommu tree.
> > 
> > a sidenote for Randy, the commit title looks weird:
> > 
> >   From 8e141e0b33e2fd17540881a1ead5103dd229bf81 Mon Sep 17 00:00:00 2001
> >   From: Randy Dunlap <randy.dunlap@oracle.com>
> >   Date: Tue, 24 Feb 2009 11:11:44 +1100
> >   Subject: [PATCH] docum-kernprms-alpha3
> > 
> > this is not really acceptable for upstream.
> 
> Yes, I agree.
> 
> Stephen, that's just the filename (with .patch) from the quilt
> series file, right?  I could expand the filename... are there
> any other options here?

If you put a "Subject: " line into the .patch that should get 
imported as the commit title.

	Ingo
