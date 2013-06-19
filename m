From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the akpm tree with the ext4 tree
Date: Wed, 19 Jun 2013 14:59:17 -0400
Message-ID: <20130619185917.GC24587@thunk.org>
References: <20130619172721.00e757acd76e1f9d362f59be@canb.auug.org.au>
 <20130619074402.GC1990@localhost.localdomain>
 <20130619142031.GC24194@thunk.org>
 <20130619100635.72acbd05.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:59505 "EHLO
	imap.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756776Ab3FSS71 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Jun 2013 14:59:27 -0400
Content-Disposition: inline
In-Reply-To: <20130619100635.72acbd05.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Glauber Costa <glommer@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Liu <wenqing.lz@taobao.com>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>

On Wed, Jun 19, 2013 at 10:06:35AM -0700, Andrew Morton wrote:
> 
> Merge the ext4 change early, please.  The core shrinker changes aren't
> 100% certain at this time - first they need to stop oopsing ;)

Ack, sounds like a plan.

Are they oopsing often enough that they are likely to interfere with
running regression tests on linux-next?

					- Ted
