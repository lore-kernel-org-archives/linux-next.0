From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: linux-next: build failure after merge of the vhost tree
Date: Wed, 7 Feb 2018 04:52:56 +0200
Message-ID: <20180207045240-mutt-send-email-mst@kernel.org>
References: <20180207130423.4f9c1ad0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207130423.4f9c1ad0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Wang <wei.w.wang@intel.com>, Liang Li <liang.z.li@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 07, 2018 at 01:04:23PM +1100, Stephen Rothwell wrote:
> Hi Michael,
> 
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> 
> Caused by commit
> 
>   96bcd04462b9 ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> 
> I have used the vhost tree from next-20180206 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks, I'll revert to that too.

-- 
MST
