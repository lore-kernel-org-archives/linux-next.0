From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Sat, 22 Aug 2015 21:16:59 +1000
Message-ID: <1440242219.28532.2.camel@ellerman.id.au>
References: <20150821182535.4423868e@canb.auug.org.au>
	 <55D6E86E.105@linux.vnet.ibm.com> <1440200403.13795.1.camel@ellerman.id.au>
	 <55D7F616.1060308@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43654 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753495AbbHVLRD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 22 Aug 2015 07:17:03 -0400
In-Reply-To: <55D7F616.1060308@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>

On Sat, 2015-08-22 at 09:39 +0530, Vasant Hegde wrote:
> On 08/22/2015 05:10 AM, Michael Ellerman wrote:
> > On Fri, 2015-08-21 at 14:29 +0530, Vasant Hegde wrote:
> >> On 08/21/2015 01:55 PM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> After merging the nvdimm tree, today's linux-next build (powerpc
> >>> allyesconfig) failed like this:
> >>
> >> Stephen,
> >>
> >> Thanks for reporting! I checked powerpc tree.. This is because of commit
> >> 8a8d9181 in powerpc tree.. Basically Michael missed one hunk (below hunk in
> >> opal-api.h)
> > 
> > Hmm, looks like it.
> > 
> > I do remember the patch didn't apply to my tree, so I guess I accidentally
> > dropped a hunk when I was forcing it to apply.
> 
> Hmmm yeah..My patchset was based on upstream tree (4.2-rc7) instead of powerpc
> next tree.

That's OK. Usually that works fine, and usually when there is a conflict I can
just fix it up. I'm not sure how I managed to drop that chunk, I'll have to go
back and look at what I did. I suspect I hand-edited the patch, and if you do
that wrong it can lead to patch just ignoring the rest of the patch.

I probably should have just asked you to rebase on my next, but given it was
already version 10 I didn't really feel like doing another revision :)

> > Also we're obviously not building this in any of our defconfigs. Can you please
> > send a patch to enable it for pseries_defconfig and ppc64_defconfig.
> 
> Sure.. Will send separate patch.

Thanks.

cheers
