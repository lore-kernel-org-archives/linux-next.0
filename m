From: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 9 Jun 2017 13:28:20 +0900
Message-ID: <e56ef218-bbbd-2445-3cd4-4ff1dd05d3e7@wdc.com>
References: <20170609131237.41b77828@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:55916 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdFIE23 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2017 00:28:29 -0400
In-Reply-To: <20170609131237.41b77828@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Stephen,

On 6/9/17 12:12, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/md/dm-zoned-target.c:947:2: error: unknown field 'suspend' specified in initializer
>   .suspend  = dmz_suspend,
>   ^
> drivers/md/dm-zoned-target.c:947:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .suspend  = dmz_suspend,
>               ^
> 
> Caused by commit
> 
>   02da2e15e81f ("dm zoned: drive-managed zoned block device target")
> 
> I have used the device-mapper tree from next-20170608 for today.

My apologies for that. My mistake.
I just posted a patch to dm-devel to fix this.
Everything should come in order after Mike's review.

Best regards.

-- 
Damien Le Moal, Ph.D.
Sr Manager, System Software Group,
Western Digital Research
Damien.LeMoal@wdc.com
Tel: (+81) 0466-98-3593 (Ext. 51-3593)
1 kirihara-cho, Fujisawa, Kanagawa, 252-0888 Japan
www.wdc.com, www.hgst.com
