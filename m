From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG? -next] WARNING: at mm/slub.c:1511
Date: Thu, 16 Jan 2014 16:25:24 +0100
Message-ID: <20140116152524.GC5660@osiris>
References: <20140116145813.GB5660@osiris>
 <20140116152203.GV30183@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:40232 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbaAPPZd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 10:25:33 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 16 Jan 2014 15:25:32 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4EE2F1B08066
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 15:24:52 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s0GFPHqN44236874
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 15:25:17 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s0GFPQi6021634
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2014 08:25:28 -0700
Content-Disposition: inline
In-Reply-To: <20140116152203.GV30183@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Pekka Enberg <penberg@kernel.org>, linux-next@vger.kernel.org

On Thu, Jan 16, 2014 at 04:22:03PM +0100, Peter Zijlstra wrote:
> On Thu, Jan 16, 2014 at 03:58:13PM +0100, Heiko Carstens wrote:
> > Hi Peter, Pekka,
> > 
> > the patch "slub: use lockdep_assert_held" reveals possible missing locking,
> > even though I don't think it will do any harm.
> > However somebody familar with slab/slub should have a look and fix this:
> > 
> Dave Hansen already send a fix for that:
> 
> lkml.kernel.org/r/52D5746F.2040604@intel.com

Ok, thanks for the pointer!
