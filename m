From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Date: Thu, 9 Jun 2016 14:02:53 +1000
Message-ID: <20160609140253.183a1428@canb.auug.org.au>
References: <20160609135932.39c8ddd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34236 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbcFIECz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2016 00:02:55 -0400
In-Reply-To: <20160609135932.39c8ddd7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

On Thu, 9 Jun 2016 13:59:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   50d14ab0130a ("dm: move request-based code out to dm-rq.[hc]")

By the way, resolving these conflicts would have been easier if this
commit had been split into "move with no changes" followed by "small
changes" commits.

-- 
Cheers,
Stephen Rothwell
