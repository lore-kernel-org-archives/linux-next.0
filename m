From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [BUG? -next] WARNING: at mm/slub.c:1511
Date: Thu, 16 Jan 2014 16:22:03 +0100
Message-ID: <20140116152203.GV30183@twins.programming.kicks-ass.net>
References: <20140116145813.GB5660@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39838 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752599AbaAPPWU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 10:22:20 -0500
Content-Disposition: inline
In-Reply-To: <20140116145813.GB5660@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Pekka Enberg <penberg@kernel.org>, linux-next@vger.kernel.org

On Thu, Jan 16, 2014 at 03:58:13PM +0100, Heiko Carstens wrote:
> Hi Peter, Pekka,
> 
> the patch "slub: use lockdep_assert_held" reveals possible missing locking,
> even though I don't think it will do any harm.
> However somebody familar with slab/slub should have a look and fix this:
> 
Dave Hansen already send a fix for that:

lkml.kernel.org/r/52D5746F.2040604@intel.com
