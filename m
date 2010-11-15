From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the xen tree with
	Linus' tree
Date: Mon, 15 Nov 2010 13:04:59 -0800
Message-ID: <4CE1A07B.5010202@goop.org>
References: <20101115112352.6cbf5604.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xensource.com>
In-Reply-To: <20101115112352.6cbf5604.sfr@canb.auug.org.au>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Xen Devel <Xen-devel@lists.xensource.com>, Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 11/14/2010 04:23 PM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the xen tree got a conflict in
> drivers/block/xen-blkfront.c between commit
> 02e031cbc843b010e72fcc05c76113c688b2860f ("block: remove
> REQ_HARDBARRIER") from Linus' tree and commits
> c64e38ea17a81721da0393584fd807f8434050fa ("xen/blkfront: map REQ_FLUSH
> into a full barrier") and be2f8373c188ed1f5d36003c9928e4d695213080
> ("xen/blkfront: Implement FUA with BLKIF_OP_WRITE_BARRIER") from the xen
> tree.
>
> I used the xen tree version.

I'll drop that because you should be seeing those changes come via Jens.

    J
