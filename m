From: Daniel Walker <dwalker@mvista.com>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Mon, 07 Jul 2008 14:13:15 -0700
Message-ID: <1215465195.15313.6.camel@localhost.localdomain>
References: <20080707230717.10429faf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gateway-1237.mvista.com ([63.81.120.158]:42779 "EHLO
	gateway-1237.mvista.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756610AbYGGVNT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jul 2008 17:13:19 -0400
In-Reply-To: <20080707230717.10429faf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>


On Mon, 2008-07-07 at 23:07 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the powerpc tree got a conflict in
> drivers/macintosh/mediabay.c between commit
> 7ad963b103d3863b1161c59f3e65a435979804ed ("ide-pmac: media-bay support
> fixes (take 4)") from the ide tree and commit
> 9a24729d8aeef967eac7af71c6a69edc83d06558 ("macintosh/media bay: Convert
> semaphore to mutex") from the powerpc tree.
> 
> I just applied the up/down -> mutex_unlock/mutex_lock change to the ide
> tree version.


It doesn't look like the IDE patches change the locking at all, so the
semaphore to mutex change should still be safe every with the IDE
changes.

>From an organizational prospective, I think it makes sense for the IDE
changes to go on top of the powerpc.git mediabay changes .. Since the
most current mediabay driver is in the powerpc.git AFAIK.

Daniel
