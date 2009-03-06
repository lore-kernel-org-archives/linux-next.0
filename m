From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for March 6
Date: Fri, 6 Mar 2009 11:24:50 -0800
Message-ID: <20090306112450.12901a19.akpm@linux-foundation.org>
References: <20090306191311.697e7b97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52631 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751149AbZCFTZW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2009 14:25:22 -0500
In-Reply-To: <20090306191311.697e7b97.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Fri, 6 Mar 2009 19:13:11 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Dropped trees (temporary):
> 	rr (build problem)

It's quite irritating and somewhat risky when this happens.  It means
that I have to teporarily drop or rework patches to fix things up. 
Then the patch needs to be undropped or unreworked when the offending
tree gets restored.

Is it possible to just drop back to the previous day's version when
something gets screwed up?
