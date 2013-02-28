From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] linux-next: Tree for Feb 28 (dm-cache)
Date: Thu, 28 Feb 2013 19:58:05 +0000
Message-ID: <20130228195805.GB8373@agk.fab.redhat.com>
References: <20130228132713.b88634cfd1eb2e19770997ad@canb.auug.org.au> <512FA744.1080100@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:13789 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750916Ab3B1T6M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Feb 2013 14:58:12 -0500
Content-Disposition: inline
In-Reply-To: <512FA744.1080100@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dmdevel <dm-devel@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 28, 2013 at 10:51:48AM -0800, Randy Dunlap wrote:
> Also, drivers/md/Kconfig contains "select DM_PRISON" but there is no
> DM_PRISON defined anywhere that I can find...
 
Thanks! Hopefully fixed now: It's DM_BIO_PRISON.

Alasdair
