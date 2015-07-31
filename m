From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] staging/lustre/lloop: Update call to bio_endio() to
 match new prototype
Date: Fri, 31 Jul 2015 16:57:09 +0530
Message-ID: <20150731112709.GA8541@sudip-pc>
References: <20150730141713.001bf7d6@canb.auug.org.au>
 <1438268615-1685381-1-git-send-email-green@linuxhacker.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35742 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036AbbGaL1V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 07:27:21 -0400
Content-Disposition: inline
In-Reply-To: <1438268615-1685381-1-git-send-email-green@linuxhacker.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: green@linuxhacker.ru
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

On Thu, Jul 30, 2015 at 11:03:35AM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Also while we are at it, drop all cfs_bio_* wrappers.
> 
> Signed-off-by: Oleg Drokin <oleg.drokin@intel.com>
> ---
Is it dependent on some other patch? This applies cleanly but is
breaking the build. "error: too few arguments to function bio_endio"

regards
sudip
