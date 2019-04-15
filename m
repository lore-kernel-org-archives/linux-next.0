From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 15 Apr 2019 08:15:55 -0600
Message-ID: <66a7abb7-7550-b2df-698b-b59932290f8a@kernel.dk>
References: <20190415130608.02fabb3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415130608.02fabb3e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 4/14/19 9:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   include/linux/bvec.h
> 
> between commit:
> 
>   1200e07f3ad4 ("block: don't use for-inside-for in bio_for_each_segment_all")
> 
> from Linus' tree and commit:
> 
>   52d52d1c98a9 ("block: only allow contiguous page structs in a bio_vec")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks fine Stephen - but due to this and the BFQ one, I've merged in
5.1-rc5 and resolved them as well. Tomorrow's branch should merge
cleanly for you.

-- 
Jens Axboe
