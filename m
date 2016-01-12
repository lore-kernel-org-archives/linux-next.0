From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 12 Jan 2016 15:20:25 -0500 (EST)
Message-ID: <20160112.152025.2172413970912429668.davem@davemloft.net>
References: <20160112131505.2228f559@canb.auug.org.au>
	<20160112091102.GA12607@colbert.idosch.org>
	<20160112225811.2c70c1a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:53699 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752218AbcALUU3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2016 15:20:29 -0500
In-Reply-To: <20160112225811.2c70c1a4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: idosch@mellanox.com, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@mellanox.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Jan 2016 22:58:11 +1100

> Hi Ido,
> 
> On Tue, 12 Jan 2016 11:11:02 +0200 Ido Schimmel <idosch@mellanox.com> wrote:
>>
>> The lock can be moved further down, just before mlxsw_reg_sfd_pack.
>> Other than that everything looks fine. Thank you!
> 
> Thanks, I wasn't sure but I will do that tomorrow (unless Dave beats me to it).

I did the merge but did not move the locking.  Feel free to send me
a patch to do so.
