From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 19 (vhost_scsi)
Date: Thu, 19 Jun 2014 10:15:59 -0700
Message-ID: <53A31ACF.5020302@infradead.org>
References: <20140619161632.58b442e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56914 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933287AbaFSRQA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jun 2014 13:16:00 -0400
In-Reply-To: <20140619161632.58b442e4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

On 06/18/14 23:16, Stephen Rothwell wrote:
> Hi all,
> 
> The powerpc allyesconfig is again broken more than usual.
> 
> Changes since 20140618:
> 

on x86_64:
CONFIG_NET is not enabled.

ERROR: "memcpy_fromiovecend" [drivers/vhost/vhost_scsi.ko] undefined!

drivers/vhost/scsi.c calls memcpy_fromiovecend().
This function is not available when CONFIG_NET is not enabled.


-- 
~Randy
