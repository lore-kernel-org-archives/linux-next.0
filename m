From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure in Linus' tree
Date: Mon, 7 May 2012 01:10:47 +0100
Message-ID: <20120507001047.GB22082@ZenIV.linux.org.uk>
References: <20120507100856.a54d45c94b395de81dd2b207@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:55914 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754620Ab2EGAKu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 May 2012 20:10:50 -0400
Content-Disposition: inline
In-Reply-To: <20120507100856.a54d45c94b395de81dd2b207@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 07, 2012 at 10:08:56AM +1000, Stephen Rothwell wrote:
> Hi Linus,
> 
> While building your tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "set_personality_ia32" [arch/x86/ia32/ia32_aout.ko] undefined!
> 

Grr...  My fault - forgot to export it.
