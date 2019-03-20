From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
Date: Wed, 20 Mar 2019 09:26:23 +0200
Message-ID: <87ftrit3a8.fsf@codeaurora.org>
References: <20190320081549.7112c33c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190320081549.7112c33c@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 20 Mar 2019 08:15:49 +1100")
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Wireless <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> In commit
>
>   13f61dfc5235 ("mt76: fix schedule while atomic in mt76x02_reset_state")
>
> Fixes tag
>
>   Fixes: e4ebb8b403d1 ("mt76: mt76x2: implement full device restart on watchdog reset")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean:
>
>   004960423fe1 ("mt76: mt76x2: implement full device restart on watchdog reset")

Sorry, I missed this but too late to fix now.

-- 
Kalle Valo
