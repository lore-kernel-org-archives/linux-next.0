From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 25 (mm/slub.c)
Date: Fri, 25 Feb 2011 10:52:05 -0800
Message-ID: <20110225105205.5a1309bb.randy.dunlap@oracle.com>
References: <20110225175924.a95d616d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:37299 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756230Ab1BYSw5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2011 13:52:57 -0500
In-Reply-To: <20110225175924.a95d616d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 25 Feb 2011 17:59:24 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110224:


when CONFIG_SLUB_DEBUG is not enabled:

mm/slub.c:2728: error: implicit declaration of function 'slab_ksize'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
