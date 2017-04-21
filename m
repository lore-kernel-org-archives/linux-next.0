From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Thu, 20 Apr 2017 18:58:55 -0700
Message-ID: <1492739935.30293.20.camel@perches.com>
References: <20170421114216.7878bee4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170421114216.7878bee4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-04-21 at 11:42 +1000, Stephen Rothwell wrote:
> Hi Doug,
> 
> After merging the rdma tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/infiniband/hw/cxgb4/cm.c: In function 'send_connect':
> drivers/infiniband/hw/cxgb4/cm.c:830:5: error: implicit declaration of function 'PDBG' [-Werror=implicit-function-declaration]
>      PDBG("%s snd_isn %u\n", __func__, t6req->rsvd);
>      ^
> 
> Caused by commit
> 
>   a9a42886d0b3 ("cxgb4: Convert PDBG to pr_debug")
> 
> I have used the rdma tree from next-20170420 for today.
> 
> There was another PDBG() missed in that file as well.

Pretty sure there were crossing commits adding PDBG()
as the original patches were written against next-20170209

>From my tree:

$ git log --pretty=oneline -5 747edc68212781296de30dd2b4e63711240da7a9
747edc68212781296de30dd2b4e63711240da7a9 cxgb4: Convert PDBG to pr_debug
d054cd530aeef452c7c252504f7d4d6ebba31ae3 cxgb4: Use more common logging style
41a74ceecd35cf2f38e2a1a1a394c7718547deb6 cxgb3: Convert PDBG to pr_debug
15772862930dfd2f2e10574b86c063d781976a89 cxgb3: Use more common logging style
9f7e70ff42dbf3af7ed0699906b699c41930b265 Add linux-next specific files for 20170209

$ git grep -w PDBG 747edc68212781296de30dd2b4e63711240da7a9
$
