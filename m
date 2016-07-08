From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 8 Jul 2016 10:11:30 -0400
Message-ID: <20160708141130.GF22329@char.us.oracle.com>
References: <20160708130750.1ef2ffc9@canb.auug.org.au>
 <20160708141429.05d542cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21810 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911AbcGHOLq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jul 2016 10:11:46 -0400
Content-Disposition: inline
In-Reply-To: <20160708141429.05d542cd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bob Liu <bob.liu@oracle.com>, Mike Christie <mchristi@redhat.com>, Christoph Hellwig <hch@lst.de>

On Fri, Jul 08, 2016 at 02:14:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 8 Jul 2016 13:07:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >  +			 * Get the bios in the request so we can re-queue them.
> >  +			 */
> > - 			if (shadow[j].request->cmd_flags &
> > - 					(REQ_FLUSH | REQ_FUA | REQ_DISCARD | REQ_SECURE)) {
> > ++			if (req_op(shadow[j].request) == REQ_OP_FLUSH ||
> > ++			    req_op(shadow[j].request) == REQ_OP_DISCARD ||
> > ++			    req_op(shadow[j].request) == REQ_OP_SECURE_ERASE ||
> > ++			    shadow[j].request->cmd_flags & REQ_FUA)) {
>                                                                   ^
> That is an extra ')' which I have now removed.

Stephen,

Thanks as always for doing this!
> 
> -- 
> Cheers,
> Stephen Rothwell
