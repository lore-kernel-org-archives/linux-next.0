From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Thu, 26 Aug 2010 10:35:00 +0200
Message-ID: <4C762734.1030402@kernel.org>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <alpine.DEB.2.00.1008241256280.4763@router.home> <4C741029.7090300@cs.helsinki.fi> <alpine.DEB.2.00.1008241352240.5388@router.home> <4C74D1D7.4080608@kernel.org> <4C74DB05.7000101@cs.helsinki.fi> <alpine.DEB.2.00.1008250846590.13026@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:59605 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753104Ab0HZIlb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Aug 2010 04:41:31 -0400
In-Reply-To: <alpine.DEB.2.00.1008250846590.13026@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On 08/25/2010 03:50 PM, Christoph Lameter wrote:
> Can we just get rid of the special UP case and just run the percpu
> subsystem even for UP?

Yeah, maybe.  Then we also can guarantee that percpu allocator always
honors alignment (which wq code currently requires and papers over
with similarly ugly workaround).  It would add a mostly redundant
allocator code tho.  I'll look into how easily it can be done.

Thanks.

-- 
tejun
