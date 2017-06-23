From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 23 Jun 2017 13:24:33 +1000
Message-ID: <20170623132433.5aff6b19@canb.auug.org.au>
References: <20170623130632.03bc60af@canb.auug.org.au>
        <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753925AbdFWDYf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 23:24:35 -0400
In-Reply-To: <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jens,

On Thu, 22 Jun 2017 21:09:22 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> I'll cherry pick that commit into the 4.13 branch to get this resolved.

Merging commit 8e8320c9315c might give a better result ...

-- 
Cheers,
Stephen Rothwell
