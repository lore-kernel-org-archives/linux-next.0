From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 20:10:06 +0900
Message-ID: <4BB08A8E.6050101@kernel.org>
References: <20100329160250.1515a2ca.sfr@canb.auug.org.au>	<s5hy6hb4p6u.wl%tiwai@suse.de> <20100329173852.3550bbea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:43488 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755193Ab0C2LKV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 07:10:21 -0400
In-Reply-To: <20100329173852.3550bbea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>

Hello, Stephen.

On 03/29/2010 03:38 PM, Stephen Rothwell wrote:
> Again, thanks.  They were just one liner because I found them one at a
> time :-(

Yikes, sorry about many failures.  Now that I think about it, it
probably would have been wiser to run the conversion script on top of
linux-next so that new ones in linux-next aren't missed by default.
I'll do that and send out respective patches to each subsystem tree.

Thank you very much for taking the trouble to fix them up.  I'll soon
submit more comprehensive fix up patches for code in linux-next but
not in mainline.

-- 
tejun
