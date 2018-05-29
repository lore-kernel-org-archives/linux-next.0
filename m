From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Tue, 29 May 2018 08:22:43 -0600
Message-ID: <83024e98-8719-7ed2-a5d5-e1653162bacc@kernel.dk>
References: <20180529143357.2a66b0af@canb.auug.org.au>
 <20180529081205.GB1416@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529081205.GB1416@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

On 5/29/18 2:12 AM, Christoph Hellwig wrote:
> Meh.  Do we really need these switch to octal patches to start
> with?  I mean, I personally prefer octal, but just switching around
> in random code that isn't otherwise changed creates nothing but churn.

This is exactly why I hesitated doing it, I knew it would end up
with conflicts. The main reason was to get rid of the inconsistency,
since we had a fair mix of octal and symbolic names.

-- 
Jens Axboe
