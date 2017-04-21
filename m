From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Fri, 21 Apr 2017 12:21:54 +1000
Message-ID: <20170421122154.45e1f0f2@canb.auug.org.au>
References: <20170421114216.7878bee4@canb.auug.org.au>
        <1492739935.30293.20.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1034645AbdDUCV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 22:21:56 -0400
In-Reply-To: <1492739935.30293.20.camel@perches.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>

Hi Joe,

On Thu, 20 Apr 2017 18:58:55 -0700 Joe Perches <joe@perches.com> wrote:
>
> Pretty sure there were crossing commits adding PDBG()
> as the original patches were written against next-20170209
> 
> From my tree:
> 
> $ git log --pretty=oneline -5 747edc68212781296de30dd2b4e63711240da7a9
> 747edc68212781296de30dd2b4e63711240da7a9 cxgb4: Convert PDBG to pr_debug
> d054cd530aeef452c7c252504f7d4d6ebba31ae3 cxgb4: Use more common logging style
> 41a74ceecd35cf2f38e2a1a1a394c7718547deb6 cxgb3: Convert PDBG to pr_debug
> 15772862930dfd2f2e10574b86c063d781976a89 cxgb3: Use more common logging style
> 9f7e70ff42dbf3af7ed0699906b699c41930b265 Add linux-next specific files for 20170209
> 
> $ git grep -w PDBG 747edc68212781296de30dd2b4e63711240da7a9
> $

In the rdma tree:

$ git log --pretty=oneline -5 a9a42886d0b3
a9a42886d0b3b989166472b7ea59b1c157d90f9b cxgb4: Convert PDBG to pr_debug
700456bd25946ef531773d1ad2dd511e1cc4515e cxgb4: Use more common logging style
b7b37ee0e137c8384c6cb3a37c4621649d5acdf6 cxgb3: Convert PDBG to pr_debug
46b2d4e8eca752003b903e68c3bec6b15fd7eba0 cxgb3: Use more common logging style
cd565b4b51e5fe258d6ce9ddc167ee51f3044ba5 IB/IPoIB: Support acceleration options callbacks
$ git grep -w PDBG a9a42886d0b3
a9a42886d0b3:drivers/infiniband/hw/cxgb4/cm.c:                          PDBG("%s snd_isn %u\n", __func__, t6req->rsvd);
a9a42886d0b3:drivers/infiniband/hw/cxgb4/cm.c:                          PDBG("%s snd_isn %u\n", __func__, t6req6->rsvd);

So these were added somewhere in Doug's tree and they need to be fixed
up there.  Your patches were rebased/cherrypicked/applied on to Doug's tree.

Ah, the new ones come from commit

  192539f4ce36 "iw_cxgb4: clean up send_connect()"

but that is in v4.11-rc1 and so should would not have been in next-20170209.
-- 
Cheers,
Stephen Rothwell
