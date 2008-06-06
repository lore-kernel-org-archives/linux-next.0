From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr merge conflict
Date: Fri, 6 Jun 2008 10:02:27 +1000
Message-ID: <200806061002.27870.rusty@rustcorp.com.au>
References: <20080605143859.53705782.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:58134 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753138AbYFFACa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 20:02:30 -0400
In-Reply-To: <20080605143859.53705782.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mark McLoughlin <markmc@redhat.com>, Jeff Garzik <jeff@garzik.org>

On Thursday 05 June 2008 14:38:59 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's merge of the rr tree got a conflict in drivers/net/virtio_net.c
> between commits 11a3a1546d0adc36485c2ad4af7ab950712df6ff ("virtio: fix
> delayed xmit of packet and freeing of old packets.") and
> 7eb2e25112bf920bb0a4d1cca445f3d96874c25f ("virtio: fix virtio_net xmit of
> freed skb bug") from the net-current tree and commits
> c95d10b237db3449ccb7c8ba1675f0bd83722d19
> ("virtio:net-force-callback-on-empty"),
> 5a37649cd6d69a0ded7cf32c89107f542ea4c69b ("virtio:net-fix-last-xmit") and
> a13dd9f483bd628423b2351ca757f641370c1227
> ("virtio:net-fix-dangling-packets") from the rr tree. (I think :-))
>
> Some of these commits do basically the same things, but are also mixed up
> with other changes to this file in the rr tree.  I used the rr tree version
> but you should check that it makes sense.  This should go away once
> net-current gets merged into Linus' tree and you merge (or rebase) against
> that.

Ack.  Jeff has taken the patches I sent, but I have a few more which require 
minor virtio changes first.  So resorting to the -rr ones is the correct 
workaround for the moment.

Thanks,
Rusty.
