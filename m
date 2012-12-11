From: Glauber Costa <glommer@parallels.com>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 11 Dec 2012 11:58:03 +0400
Message-ID: <50C6E78B.6010809@parallels.com>
References: <20121211162210.14ddcdc4d37c40520b0fa88a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.parallels.com ([64.131.90.16]:48424 "EHLO mx2.parallels.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751660Ab2LKH6D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Dec 2012 02:58:03 -0500
In-Reply-To: <20121211162210.14ddcdc4d37c40520b0fa88a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On 12/11/2012 09:22 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> include/linux/gfp.h between commit caf491916b1c ("Revert "revert "Revert
> "mm: remove __GFP_NO_KSWAPD""" and associated damage") from Linus' tree
> and commit "mm: add a __GFP_KMEMCG flag" from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
Fix is fine, thanks.
