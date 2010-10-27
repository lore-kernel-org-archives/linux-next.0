From: Jesse Gross <jesse@nicira.com>
Subject: Re: linux-next: build warning from Linus' tree
Date: Tue, 26 Oct 2010 17:58:55 -0700
Message-ID: <AANLkTimyUzz1Bf+FsYjoRdL80mCB83cq_qoBUupJJ92i@mail.gmail.com>
References: <20101027112904.461a0143.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:44142 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760748Ab0J0A65 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2010 20:58:57 -0400
In-Reply-To: <20101027112904.461a0143.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 26, 2010 at 5:29 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> While building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> drivers/net/igb/igb_main.c: In function 'igb_xmit_frame_ring_adv':
> drivers/net/igb/igb_main.c:4110: warning: unused variable 'adapter'
>
> Introduced by commit eab6d18d20fc5b5ba04a7e7fcd6f357197870e51 ("vlan:
> Don't check for vlan group before vlan_tx_tag_present").

Patch sent out to resolve this.
