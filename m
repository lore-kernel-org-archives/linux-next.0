From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Mon, 4 Jan 2016 08:49:15 -0500
Message-ID: <20160104134915.GC19838@thunk.org>
References: <20160104103419.56719f0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:41907 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753246AbcADNv1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2016 08:51:27 -0500
Content-Disposition: inline
In-Reply-To: <20160104103419.56719f0b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Xi <pkuelelixi@gmail.com>

On Mon, Jan 04, 2016 at 10:34:19AM +1100, Stephen Rothwell wrote:
> Hi Ted,
> 
> After merging the ext4 tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:...

Thanks for pointing this out!  I fixed it last night so it should be
ready for the next linux-build integration cycle.

						- Ted
