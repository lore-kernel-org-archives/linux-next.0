From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Date: Tue, 19 Jul 2016 11:46:22 +1000
Message-ID: <20160719114622.577185f5@canb.auug.org.au>
References: <20160719105930.39012675@canb.auug.org.au>
	<20160719012039.GA18583@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51188 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751492AbcGSBq0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 21:46:26 -0400
In-Reply-To: <20160719012039.GA18583@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Graham Moore <grmoore@opensource.altera.com>, Marek Vasut <marex@denx.de>

Hi Brian,

On Mon, 18 Jul 2016 18:20:39 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>
> Known:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2016-July/068569.html
> 
> > Missing include of linux/io.h ...  
> 
> It's not missing linux/io.h; x86 is missing readsl()/writesl(). If x86
> folks don't have a solution, then I guess we'll just make this depend on
> !X86.

or remove COMPILE_TEST if it can't compile for everyone ...

-- 
Cheers,
Stephen Rothwell
