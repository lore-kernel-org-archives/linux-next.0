From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: IO BAR sizing warning
Date: Fri, 12 Jun 2009 07:39:29 +1000
Message-ID: <1244756369.5739.51.camel@pasglop>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
	 <4A013A70.30101@kernel.org> <20090506092418.3fffab6b@hobbes>
	 <CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
	 <20090506110034.3c7d6e67@hobbes>
	 <20090603164954.2a7aa3f4.sfr@canb.auug.org.au>
	 <20090611120739.012a0306@jbarnes-g45>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:38248 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753553AbZFKVkf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2009 17:40:35 -0400
In-Reply-To: <20090611120739.012a0306@jbarnes-g45>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>, Yinghai Lu <yinghai@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2009-06-11 at 12:07 -0700, Jesse Barnes wrote:

> > I am still getting the original warning.  For reference, the following
> > architectures will probably have the same:
> > 
> > ia64:		0xffffffffffffff
> > powerpc:	~(0UL)
> > sparc64:	0xffffffffffffffffUL
> 
> Any comments here Ben?  Seems this define is overloaded...

Ah, forgot to look at that. Will do ASAP.

Cheers,
Ben.
