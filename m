From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the v9fs tree
Date: Thu, 01 Dec 2011 08:57:06 -0800
Message-ID: <1322758626.30801.5.camel@joe2Laptop>
References: <20111201120215.4320090bef1da653abad3392@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111201120215.4320090bef1da653abad3392@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 2011-12-01 at 12:02 +1100, Stephen Rothwell wrote:
> Hi Eric,
> 
> After merging the v9fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "_p9_debug" [net/9p/9pnet_virtio.ko] undefined!
> ERROR: "_p9_debug" [net/9p/9pnet_rdma.ko] undefined!
> ERROR: "_p9_debug" [net/9p/9pnet.ko] undefined!
> 
> Caused by commit be9e4aa9e783 ("9p: Reduce object size with
> CONFIG_NET_9P_DEBUG").
> 
> I have used the v9fs tree from next-20111130 for today.

Thanks Stephen.

Clearly I didn't sufficiently compile test this.
Sorry.  I'll resubmit.
