From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 29 Jun 2017 07:33:22 +1000
Message-ID: <20170629073322.1b007407@canb.auug.org.au>
References: <20170628180456.30cb9242@canb.auug.org.au>
        <664cc88d-18a5-18c4-5bce-4d4352d15f4f@kernel.dk>
        <2bd17edb-4a5b-5bf8-7074-1156a5249325@kernel.dk>
        <2c4503f8-8284-2578-3622-03529cc8bffe@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751548AbdF1Vd0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 17:33:26 -0400
In-Reply-To: <2c4503f8-8284-2578-3622-03529cc8bffe@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

Hi Jens,

On Wed, 28 Jun 2017 09:11:32 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 06/28/2017 08:01 AM, Jens Axboe wrote:
> > But put_user() is fine? Just checking here, since the change adds
> > both a u64 put and get user.  

Yes, put_user is fine (it does 2 4 byte moves.  The asm is there to do
the 8 byte get_user, but the surrounding C code uses an unsigned long
for the destination in all cases (some other arches do the same).  I
don't remember why it is like that.

> I just changed all 4, at least that provides some symmetry in how
> we copy things in and out for that set of fcntls.

OK, thanks.

-- 
Cheers,
Stephen Rothwell
