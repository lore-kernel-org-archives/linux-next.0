From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the sparc-next tree with the
 dma-mapping tree
Date: Wed, 12 Dec 2018 08:44:20 +0100
Message-ID: <20181212074420.GB29137@lst.de>
References: <20181212093042.00fbf6be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181212093042.00fbf6be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 12, 2018 at 09:30:42AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sparc-next tree got a conflict in:
> 
>   arch/sparc/kernel/ioport.c
> 
> between commit:
> 
>   53b7670e5735 ("sparc: factor the dma coherent mapping into helper")
> 
> from the dma-mapping tree and commit:
> 
>   86ef771ed543 ("sparc: Use DT node full_name instead of name for resources")
> 
> from the sparc-next tree.

Dave, Sam:

should I just apply a version of Rob's tree that takes the refactoring
into account to the dma-mapping tree?  That way we should get the right
result independent of the merge order.
