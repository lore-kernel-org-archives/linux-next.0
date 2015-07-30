From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 30 Jul 2015 22:24:30 +1000
Message-ID: <20150730222430.775c3079@canb.auug.org.au>
References: <20150730141713.001bf7d6@canb.auug.org.au>
	<20150730061951.GA29312@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150730061951.GA29312@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Christoph,

On Thu, 30 Jul 2015 08:19:51 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> Can you please drop staging and especially lustre from these runs?

One problem with that is that staging is expected to at least build.
and when Linus eventually merges this code in the block tree, he will
do an allmodconfig build and it will fail.  I don't really care about
how things get fixed in the staging tree (as you can see from the patch
I applied to get it to build) and sometimes mostly I just disable an
affected driver.  This was just as easy.

At least this way people know ahead of time that it needs an update.

> Conditions of the staging tree are they don't need to update.

See above - it is expected to build.  Linus himself asked me to make
sure that remains true.

> Nevermind that
> it never should have grown something as big and stale as lustre without
> any prospects of being merged.

You can have that discussion with Greg and the Lustre maintainers. :-)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
