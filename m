From: Sage Weil <sage@inktank.com>
Subject: Re: linux-next: manual merge of the ceph tree with Linus' tree
Date: Tue, 9 Jul 2013 20:57:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1307092056360.22858@cobra.newdream.net>
References: <20130710112410.f786035ff9202e773aa052c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cobra.newdream.net ([66.33.216.30]:52395 "EHLO
	cobra.newdream.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753410Ab3GJD5Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2013 23:57:16 -0400
In-Reply-To: <20130710112410.f786035ff9202e773aa052c9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sage Weil <sage@newdream.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Wed, 10 Jul 2013, Stephen Rothwell wrote:
> Hi Sage,
> 
> Today's linux-next merge of the ceph tree got conflicts in
> drivers/block/rbd.c and net/ceph/osd_client.c because the ceph tree was
> rebased before being sent to Linus and it looks like one patch
> was dropped and several more added.
> 
> I just used the upstream version of the cpeh tree for today - please
> clean up.

Fixed, thanks!

sage
