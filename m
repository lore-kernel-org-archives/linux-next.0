From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Date: Mon, 27 Oct 2014 23:29:10 -0700
Message-ID: <20141027232910.952850f8.akpm@linux-foundation.org>
References: <20141028152444.79bd9fe9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141028152444.79bd9fe9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, 28 Oct 2014 15:24:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the akpm-current tree got a conflict in
> mm/cma.c between commit 16195ddd4ebc ("mm: cma: Ensure that
> reservations never cross the low/high mem boundary") from the
> dma-mapping tree and commit 2a70e5a78672 ("mm/cma: ake kmemleak ignore
> CMA regions") from the akpm-current tree.

hm, we have multiple trees altering mm/cma.c?

I'm a bit surprised that this series was merged, given that Laurent
said he would be sending out a v2...
