From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 07 Apr 2010 11:20:09 +0800
Message-ID: <4BBBF9E9.4080504@redhat.com>
References: <20100407125836.3c7f1095.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38627 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753337Ab0DGDQa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Apr 2010 23:16:30 -0400
In-Reply-To: <20100407125836.3c7f1095.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Pirko <jpirko@redhat.com>

Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/bonding/bond_main.c between commit
> 9e2e61fbf8ad016d24e4af0afff13505f3dd2a2a ("bonding: fix potential
> deadlock in bond_uninit()") from Linus' tree and commit
> 22bedad3ce112d5ca1eaf043d4990fa2ed698c87 ("net: convert multicast list to
> list_head") from the net tree.
> 
> Just context changes.  If fixed it up (see below) and can carry the fix
> for a while.

Hi, Stephen,

If I read the combined diff correctly, it looks fine for me.

Thanks for letting me know!
