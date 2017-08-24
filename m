From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 24 Aug 2017 18:54:13 +1000
Message-ID: <20170824185413.01229bab@canb.auug.org.au>
References: <20170824133203.18512289@canb.auug.org.au>
        <20170824133455.7fb963ca@canb.auug.org.au>
        <20170824084410.GC19313@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824084410.GC19313@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Christoph,

On Thu, 24 Aug 2017 10:44:10 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> Keith already sent a patch for this, it was a rebase failure :(

Ah, OK, thanks.

> The documentation one is intentional - the document is completely
> out of data, so doctoring around a bit won't help.  I'll try to find
> some time to replace it with a sane new doc that use the ReST stuff
> to not duplicate the structure. 

Seems like a plan.

-- 
Cheers,
Stephen Rothwell
