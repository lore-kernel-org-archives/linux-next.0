From: Paul Moore <pmoore@redhat.com>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next tree
Date: Thu, 05 Jan 2012 16:25:53 -0500
Message-ID: <27624574.j8RvKjachg@sifl>
References: <20120105151255.f72ad113a93493bb55844034@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47280 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758302Ab2AEV0E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jan 2012 16:26:04 -0500
In-Reply-To: <20120105151255.f72ad113a93493bb55844034@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Emeltchenko <andrei.emeltchenko@intel.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, "Gustavo F. Padovan" <padovan@profusion.mobi>

On Thursday, January 05, 2012 03:12:55 PM Stephen Rothwell wrote:
> Hi Eric,
> 
> Today's linux-next merge of the selinux tree got a conflict in
> net/bluetooth/l2cap_sock.c between commit 15770b1ab974 ("Bluetooth:
> convert force_active variable to flag in l2cap chan") from the net-next
> tree and commit 53860f3d0499 ("bluetooth: Properly clone LSM attributes
> to newly created child connections") from the selinux tree.
> 
> These both remove the same line, but there is probably something more
> subtle going on ...  I just used the version from the net-next tree.

Something is a bit odd.  When I look in the current linux-next tree I see two 
commits which fix a Bluetooth/LSM bug; the first is correct, the second one 
appears to be some other commit which just hijacked the description from the 
first ... I have no idea what is going on in the second commit; I'll leave 
that to you git gurus :)

 * Correct commit -> 6230c9b4f8957c8938ee4cf2d03166d3c2dc89de

 * Garbage commit -> 53860f3d0499992855d58e33f0f79bfe642dfccb

-- 
paul moore
virtualization @ redhat
