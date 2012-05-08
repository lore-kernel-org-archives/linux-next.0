From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: failed import of rr tree
Date: Tue, 08 May 2012 14:11:39 +0930
Message-ID: <87397bcmik.fsf@rustcorp.com.au>
References: <20120508105904.1709f6f2b7da99e86327e3e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:46332 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752033Ab2EHEpR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 May 2012 00:45:17 -0400
In-Reply-To: <20120508105904.1709f6f2b7da99e86327e3e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 8 May 2012 10:59:04 +1000, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
> 
> Importing the rr tree today produced this:
> 
> $ git am ../quilt/rr/virtio:balloon_separate_out_common_code_between_remove_and_freeze_functions.patch
> Applying: virtio: balloon: separate out common code between remove and freeze functions
> error: patch failed: drivers/virtio/virtio_balloon.c:381
> error: drivers/virtio/virtio_balloon.c: patch does not apply
> Patch failed at 0001 virtio: balloon: separate out common code between remove and freeze functions

My mistake, I slapped those in at the last minute, and put them in the
wrong order.

I've fixed it for tomorrow.

Thanks,
Rusty.
