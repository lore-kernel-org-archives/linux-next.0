From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [linux-next] rtlwifi commit contains a patch reject file
Date: Tue, 23 Apr 2019 08:41:48 +0300
Message-ID: <87a7ghxopv.fsf@purkki.adurom.net>
References: <20190420155008.GM23044@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190420155008.GM23044@windriver.com> (Paul Gortmaker's message
        of "Sat, 20 Apr 2019 11:50:09 -0400")
Sender: netdev-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-next@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Paul Gortmaker <paul.gortmaker@windriver.com> writes:

> I'm kind of surprised sfr doesn't have a bot to complain when it sees
> a foo.c.rej or foo.c.orig in a commit...
>
> Paul.
> ---
>
> $ git show --stat ddab2eee794
> commit ddab2eee7949f94b8ecdc5c84ae238826142d35d
> Author: Larry Finger <Larry.Finger@lwfinger.net>
> Date:   Thu Apr 4 13:29:31 2019 -0500
>
>     rtlwifi: Convert the wake_match variable to local
>     
>     In five of the drivers, the contents of bits 29-31 of one of the RX
>     descriptors is used to set bits in a variable that is used to save the
>     wakeup condition for output in a debugging statement. The resulting
>     variable is not used anywhere else even though it is stored in a struct
>     and could be available in other routines. This variable is changed to be
>     local.
>     
>     Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
>     Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
>  drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c     | 15 ++++++++-------
>  drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c.rej | 10 ++++++++++

Thanks for the report, the issue was fixed by this:

b5250c9c14c1 rtlwifi: rtl8188ee: Remove extraneous file

-- 
Kalle Valo
