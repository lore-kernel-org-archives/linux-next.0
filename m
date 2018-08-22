From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: linux-next: build warning after merge of the net tree
Date: Wed, 22 Aug 2018 12:26:24 -0700
Message-ID: <CAM_iQpUDjemL5OQt=D3hr6dCfqcKoi1w-CM9SHyTRcZ=aPeWsQ@mail.gmail.com>
References: <20180822080449.5887e244@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180822080449.5887e244@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Linux Kernel Network Developers <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 21, 2018 at 3:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the net tree, today's linux-next build (KCONFIG_NAME)
> produced this warning:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c: In function 'tc_fill_actions':
> drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:64:6: warning: unused variable 'i' [-Wunused-variable]
>   int i;
>       ^
>
> Introduced by commit
>
>   244cd96adb5f ("net_sched: remove list_head from tc_action")

I bet you have CONFIG_NET_CLS_ACT=n?

Here is a quick fix:

diff --git a/include/net/pkt_cls.h b/include/net/pkt_cls.h
index c17d51865469..9ec471ffaa5d 100644
--- a/include/net/pkt_cls.h
+++ b/include/net/pkt_cls.h
@@ -303,7 +303,7 @@ static inline void tcf_exts_put_net(struct tcf_exts *exts)
        for (i = 0; i < TCA_ACT_MAX_PRIO && ((a) = (exts)->actions[i]); i++)
 #else
 #define tcf_exts_for_each_action(i, a, exts) \
-       for (; 0; )
+       for ((void)i, (void)a; 0; )
 #endif

 static inline void

Interestingly, neither my compiler nor kbuild-bot's compiler doesn't
catch this.

Thanks.
