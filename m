From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the rr tree
Date: Wed, 31 Aug 2011 14:06:27 +0930
Message-ID: <87zkiq5h9w.fsf@rustcorp.com.au>
References: <20110830140325.7af8d5d4e88d907aed45780e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:51646 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753402Ab1HaFsM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 31 Aug 2011 01:48:12 -0400
In-Reply-To: <20110830140325.7af8d5d4e88d907aed45780e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Sheng-Hui <shhuiw@gmail.com>

On Tue, 30 Aug 2011 14:03:25 +1000, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
> 
> After merging the rr tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

Gah, I took a trivial replacement and didn't actually compile-check it
myself.

Fixed with the obvious addition, thanks.
Rusty.
