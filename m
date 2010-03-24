From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] iwlwifi: fix build error for CONFIG_IWLAGN=n
Date: Wed, 24 Mar 2010 14:33:46 -0700
Message-ID: <1269466426.6935.8.camel@jlt3.sipsolutions.net>
References: <4BAA73D2.1000301@oracle.com>
	 <1269465799-19060-1-git-send-email-linville@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1269465799-19060-1-git-send-email-linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Reinette Chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2010-03-24 at 17:23 -0400, John W. Linville wrote:
> drivers/net/wireless/iwlwifi/iwl-rx.c: In function 'iwl_good_ack_health':
> drivers/net/wireless/iwlwifi/iwl-rx.c:647: error: 'struct iwl_priv' has no member named '_agn'
> 
> Reported-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> ---
>  drivers/net/wireless/iwlwifi/iwl-rx.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/net/wireless/iwlwifi/iwl-rx.c b/drivers/net/wireless/iwlwifi/iwl-rx.c
> index b6a64d8..2fa30df 100644
> --- a/drivers/net/wireless/iwlwifi/iwl-rx.c
> +++ b/drivers/net/wireless/iwlwifi/iwl-rx.c
> @@ -621,6 +621,7 @@ static void iwl_accumulative_statistics(struct iwl_priv *priv,
>  #define BA_TIMEOUT_CNT (5)
>  #define BA_TIMEOUT_MAX (16)
>  
> +#if defined(CONFIG_IWLAGN) || defined(CONFIG_IWLAGN_MODULE)
>  /**
>   * iwl_good_ack_health - checks for ACK count ratios, BA timeout
> retries.

I thought we had a patch moving it?

johannes

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
