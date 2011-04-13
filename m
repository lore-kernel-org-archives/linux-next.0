From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: manual merge of the gfs2 tree with Linus' tree
Date: Wed, 13 Apr 2011 11:14:57 +0100
Message-ID: <1302689697.2613.6.camel@dolmen>
References: <20110401105545.b2873be4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29341 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757164Ab1DMKMK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Apr 2011 06:12:10 -0400
In-Reply-To: <20110401105545.b2873be4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <jaxboe@fusionio.com>

Hi,

On Fri, 2011-04-01 at 10:55 +1100, Stephen Rothwell wrote:
> Hi Steven,
> 
> Today's linux-next merge of the gfs2 tree got a conflict in fs/gfs2/log.c
> between commit 721a9602e660 ("block: kill off REQ_UNPLUG") from Linus'
> tree and commit 7ef2a4f51303 ("GFS2: Use filemap_fdatawrite() to write
> back the AIL") from the gfs2 tree.
> 
> The former removed some of the code modified by the latter, so I did that.

Sorry for the delay as I was away last week. That was the correct fix
and I've updated the tree so that it shouldn't be an issue any more,

Steve.
