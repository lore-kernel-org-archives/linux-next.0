From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Fri, 2 Jun 2017 14:11:59 +1000
Message-ID: <20170602141159.197ec84f@canb.auug.org.au>
References: <20170602140535.17d87d58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751124AbdFBEMC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Jun 2017 00:12:02 -0400
In-Reply-To: <20170602140535.17d87d58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Fri, 2 Jun 2017 14:05:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the target-bva tree got a conflict in:
> 
>   drivers/target/target_core_tpg.c
> 
> between commits:
> 
>   06fd91ce633d ("target/configfs: Kill se_lun->lun_link_magic")
>   4f61e1e687c4 ("target: Avoid target_shutdown_sessions loop during queue_depth change")
> 
> from the target-updates tree and commits:
> 
>   ba438d7c8d39 ("target: Avoid target_shutdown_sessions loop during queue_depth change")
>   b968ec8ff101 ("target/configfs: Kill se_lun->lun_link_magic")
> 
> from the target-bva tree.
> 
> I fixed it up (I used the version from the target-updates tree) and can

Which turned out to be the wrong thing to do (or more was needed) as
the result does not build :-(.

I have just dropped the target-bva tree for today.
-- 
Cheers,
Stephen Rothwell
