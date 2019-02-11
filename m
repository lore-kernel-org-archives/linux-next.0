From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the wireless-drivers-next tree
Date: Mon, 11 Feb 2019 08:12:52 +0200
Message-ID: <87lg2m7t0b.fsf@kamboji.qca.qualcomm.com>
References: <20190211072814.7428f192@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211072814.7428f192@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 11 Feb 2019 07:28:14 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org
List-Id: linux-next.vger.kernel.org

+ ath10k

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Commit
>
>   768ec4c012ac ("ath10k: update HOST capability qmi message")
>
> is missing a Signed-off-by from its author.

Oh, I had missed that. Thanks for reporting.

Unfortunately it would be difficult to rebase wireless-drivers-next so I
can't (easily) fix this. But v1 had s-o-b so at least we have the sign
off publically available:

https://patchwork.kernel.org/patch/10688563/

-- 
Kalle Valo
