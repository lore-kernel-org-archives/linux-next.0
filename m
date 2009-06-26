From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: block tree build failure
Date: Fri, 26 Jun 2009 14:34:37 +1000 (EST)
Message-ID: <f236aae1aa8ea7c4f3700dbca2f3ae14.squirrel@neil.brown.name>
References: <20090626125331.89c689f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:47796 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750892AbZFZEeo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2009 00:34:44 -0400
In-Reply-To: <20090626125331.89c689f2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, June 26, 2009 12:53 pm, Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> block/blk-core.c: In function '__make_request':
> block/blk-core.c:1179: error: expected ';' before 'return'
>
> Caused by commit 6cf2a6c8d01514e86a8d38e4eeed402378b635dc ("Restore
> barrier support for md and probably other virtual devices") which I have
> reverted for today.

Arg, that's my fault - sorry.

+               bio_endio(bio, -EOPNOTSUPP)
+                       return 0;

should of course be

+               bio_endio(bio, -EOPNOTSUPP);
+               return 0;

NeilBrown
