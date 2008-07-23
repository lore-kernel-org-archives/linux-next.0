From: James Morris <jmorris@namei.org>
Subject: Re: Labeled Networking tree for linux-next
Date: Thu, 24 Jul 2008 04:16:27 +1000 (EST)
Message-ID: <Xine.LNX.4.64.0807240415200.14401@us.intercode.com.au>
References: <200807231244.45084.paul.moore@hp.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([69.55.235.186]:54256 "EHLO us.intercode.com.au"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751914AbYGWSQv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 14:16:51 -0400
In-Reply-To: <200807231244.45084.paul.moore@hp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

On Wed, 23 Jul 2008, Paul Moore wrote:

> Hello,
> 
> I've created a new labeled networking tree to feed bits into linux-next 
> which should replace the lblnet-2.6_testing tree which is currently 
> used.  The new tree (currently empty) can be found here:
> 
>  * git://git.infradead.org/users/pcmoore/lblnet-2.6_next

Is this stuff likely to affect more of net/ or security/ ?   I think it 
should go in via either the networking or security-testing trees.

-- 
James Morris
<jmorris@namei.org>
