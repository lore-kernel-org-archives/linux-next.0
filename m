From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the iommu tree with the
	kmemcheck/x86 trees
Date: Thu, 19 Mar 2009 09:43:43 +0100
Message-ID: <20090319084343.GA9038@elte.hu>
References: <20090319190653.540eab18.sfr@canb.auug.org.au> <20090319193903.eb51e389.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35496 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752477AbZCSInv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 04:43:51 -0400
Content-Disposition: inline
In-Reply-To: <20090319193903.eb51e389.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Vegard Nossum <vegard.nossum@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Thu, 19 Mar 2009 19:06:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> This is, of course how it was fixed in tip/master as well.

yeah. This file is a common source of conflicts - eventually we will 
sort those kconfig variables alphabetically to reduce the chance of 
interaction.

	Ingo
