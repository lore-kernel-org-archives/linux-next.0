From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next tree
Date: Fri, 03 Aug 2018 12:09:59 +0300
Message-ID: <874lgb7r4o.fsf@kamboji.qca.qualcomm.com>
References: <20180803182942.4de98df2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803182942.4de98df2@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 3 Aug 2018 18:29:42 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> After merging the wireless-drivers-next tree, today's linux-next build
> (powerpc allyesconfig) failed like this:
>
> ld: drivers/net/wireless/mediatek/mt76/mt76x0/trace.o:(__tracepoints+0x0): multiple definition of `__tracepoint_set_shared_key'; drivers/net/wireless/mediatek/mt7601u/trace.o:(__tracepoints+0x0): first defined here

[...]

> Caused by commit
>
>   7b4859026ccd ("mt76x0: core files")
>
> and following ones.
>
> I have just marked that driver broken for now:

Thanks Stephen for the report. Odd that kbuild bot didn't catch this, I
did have these patches in my pending branch for several days.

Stanislaw, could you please send a fix for this ASAP? I can't submit a
pull request to Dave until this is fixed.

-- 
Kalle Valo
