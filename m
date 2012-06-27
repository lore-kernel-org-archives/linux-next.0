From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
	(device-mapper tree related)
Date: Wed, 27 Jun 2012 11:11:29 +0100
Message-ID: <20120627101128.GD22768@agk-dp.fab.redhat.com>
References: <20120627130221.803b4144284489498aa9b8af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59106 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754433Ab2F0KLd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jun 2012 06:11:33 -0400
Content-Disposition: inline
In-Reply-To: <20120627130221.803b4144284489498aa9b8af@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

On Wed, Jun 27, 2012 at 01:02:21PM +1000, Stephen Rothwell wrote:
> Caused by commit 30ebb0baeef5 ("If CONFIG_DM_DEBUG_SPACE_MAPS is enabled
> and memory is fragmented and a") from the device-mapper tree.  Presumably
> a missing include of vmalloc.h.
 
Hopefully fixed for tomorrow now, thanks.

Alasdair
