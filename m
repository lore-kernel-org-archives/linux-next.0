From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 8 Jul 2016 14:14:29 +1000
Message-ID: <20160708141429.05d542cd@canb.auug.org.au>
References: <20160708130750.1ef2ffc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56097 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751225AbcGHEOd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jul 2016 00:14:33 -0400
In-Reply-To: <20160708130750.1ef2ffc9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bob Liu <bob.liu@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Mike Christie <mchristi@redhat.com>, Christoph Hellwig <hch@lst.de>

Hi all,

On Fri, 8 Jul 2016 13:07:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>  +			 * Get the bios in the request so we can re-queue them.
>  +			 */
> - 			if (shadow[j].request->cmd_flags &
> - 					(REQ_FLUSH | REQ_FUA | REQ_DISCARD | REQ_SECURE)) {
> ++			if (req_op(shadow[j].request) == REQ_OP_FLUSH ||
> ++			    req_op(shadow[j].request) == REQ_OP_DISCARD ||
> ++			    req_op(shadow[j].request) == REQ_OP_SECURE_ERASE ||
> ++			    shadow[j].request->cmd_flags & REQ_FUA)) {
                                                                  ^
That is an extra ')' which I have now removed.

-- 
Cheers,
Stephen Rothwell
