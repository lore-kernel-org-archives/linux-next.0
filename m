From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the  wireless-drivers-next tree
Date: Sun, 09 Aug 2015 11:41:45 +0300
Message-ID: <8737zszwdy.fsf@kamboji.qca.qualcomm.com>
References: <20150807131615.535d4c04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150807131615.535d4c04@canb.auug.org.au> (Stephen Rothwell's
	message of "Fri, 7 Aug 2015 13:16:15 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>, linux-wireless@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> After merging the wireless-drivers-next tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>
> drivers/net/wireless/ath/ath9k/debug_sta.c: In function 'read_file_node_aggr':
> drivers/net/wireless/ath/ath9k/debug_sta.c:54:25: error: 'struct ath_node' has no member named 'ac'
>   for (acno = 0, ac = &an->ac[acno];
>                          ^

[...]

> Caused by commits
>
>   592fa228f213 ("ath9k: remove struct ath_atx_ac")
>   d70d848a75fd ("ath9k: remove the sched field in struct ath_atx_tid")
>
> I have used the wireless-drivers-next tree from next-20150806 for today.

Sorry about that, the commit below should fix the issue. This seems to
be a frequent problem, I think I need to start running more extensive
build tests before applying wireless-drivers patches.

commit 12e035968191c05a574c9c20367cb3090bc7d99d
Author: Felix Fietkau <nbd@openwrt.org>
Date:   Thu Aug 6 12:44:30 2015 +0200

    ath9k: fix build with CONFIG_ATH9K_STATION_STATISTICS=y
    
    kbuild bot reported that commit 592fa228f213 ("ath9k: remove struct
    ath_atx_ac") broke the build when CONFIG_ATH9K_STATION_STATISTICS is y.
    
    Reported-by: kbuild test robot <fengguang.wu@intel.com>
    Fixes: 592fa228f213 ("ath9k: remove struct ath_atx_ac")
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Kalle Valo <kvalo@codeaurora.org>


-- 
Kalle Valo
