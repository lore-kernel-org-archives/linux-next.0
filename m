From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH] staging/lustre/lloop: Update call to bio_endio() to match new prototype
Date: Fri, 31 Jul 2015 12:51:45 -0400
Message-ID: <0CCD5889-DAA6-4A16-B832-FB1307A868B6@linuxhacker.ru>
References: <20150730141713.001bf7d6@canb.auug.org.au> <1438268615-1685381-1-git-send-email-green@linuxhacker.ru> <20150731112709.GA8541@sudip-pc>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from linuxhacker.ru ([217.76.32.60]:41215 "EHLO fiona.linuxhacker.ru"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751791AbbGaQwI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Jul 2015 12:52:08 -0400
In-Reply-To: <20150731112709.GA8541@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Andreas Dilger <andreas.dilger@intel.com>

On Jul 31, 2015, at 7:27 AM, Sudip Mukherjee wrote:

> On Thu, Jul 30, 2015 at 11:03:35AM -0400, green@linuxhacker.ru wrote:
>> From: Oleg Drokin <green@linuxhacker.ru>
>> 
>> Also while we are at it, drop all cfs_bio_* wrappers.
>> 
>> Signed-off-by: Oleg Drokin <oleg.drokin@intel.com>
>> ---
> Is it dependent on some other patch? This applies cleanly but is
> breaking the build. "error: too few arguments to function bio_endio"

Yes, this is for block/linux-next specifically.
For current staging tree a corresponding one is 
http://www.gossamer-threads.com/lists/linux/kernel/2227687
