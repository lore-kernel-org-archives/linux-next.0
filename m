From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: failed import of the rr tree
Date: Thu, 23 Oct 2008 12:12:11 +1100
Message-ID: <200810231212.11891.rusty@rustcorp.com.au>
References: <20081023102951.db38e08c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60879 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754328AbYJWBMJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 21:12:09 -0400
In-Reply-To: <20081023102951.db38e08c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mark McLoughlin <markmc@redhat.com>

On Thursday 23 October 2008 10:29:51 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next import of the rr tree failed like this:
>
> virtio:net-mergeable-rx-bufs.patch
> error: patch failed: include/linux/virtio_net.h:44
> error: include/linux/virtio_net.h: patch does not apply
>
> patch(1) will not apply that patch either ...

Yes, just found this now.  emacs diff mode got confused by the "--" at the 
bottom of the patch, and "fixed" the @@ line.

Dropping it was the right thing, and I've fixed it.

Sorry,
Rusty.
