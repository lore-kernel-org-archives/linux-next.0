From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Tree for October 21 (printk format warnings)
Date: Tue, 21 Oct 2008 22:07:54 -0700 (PDT)
Message-ID: <20081021.220754.06835391.davem@davemloft.net>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au>
	<20081021215725.b9c2b941.randy.dunlap@oracle.com>
	<20081022050142.GA11674@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50328
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750946AbYJVFIR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 01:08:17 -0400
In-Reply-To: <20081022050142.GA11674@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: randy.dunlap@oracle.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Greg KH <greg@kroah.com>
Date: Tue, 21 Oct 2008 22:01:42 -0700

> What's the expected modifier for "size_t" to work on all arches?

Put "%Z" in front of the output specifier you want to use,
for example %Zd for decimal and %Zx for hex.

> Same goes for the result of "size_of()", what should we use there?  Or
> are we just required to always cast things?

Sizeof should use the same as above.
