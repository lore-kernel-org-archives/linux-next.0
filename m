From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for June 7 (iwlwifi)
Date: Mon, 7 Jun 2010 09:02:30 -0700
Message-ID: <20100607090230.deed8bd1.randy.dunlap@oracle.com>
References: <20100607142034.c96c2509.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100607142034.c96c2509.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 7 Jun 2010 14:20:34 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100604:


2 different builds:

drivers/net/wireless/iwlwifi/iwl-rx.c: In function 'iwl_accumulative_statistics':
drivers/net/wireless/iwlwifi/iwl-rx.c:304: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:305: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:306: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-rx.c:321: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:323: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:325: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:327: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:329: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:331: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c: In function 'iwl_reply_statistics':
drivers/net/wireless/iwlwifi/iwl-rx.c:484: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:486: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-rx.c:488: error: 'struct iwl_priv' has no member named 'max_delta'


--and--

drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c: In function 'iwl_ucode_rx_stats_read':
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:86: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:87: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:88: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:89: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:90: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:91: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:92: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:93: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:94: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:95: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:96: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:97: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c: In function 'iwl_ucode_tx_stats_read':
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:564: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:565: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:566: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c: In function 'iwl_ucode_general_stats_read':
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:783: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:784: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:785: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:786: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:787: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:788: error: 'struct iwl_priv' has no member named 'max_delta'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:789: error: 'struct iwl_priv' has no member named 'accum_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:790: error: 'struct iwl_priv' has no member named 'delta_statistics'
drivers/net/wireless/iwlwifi/iwl-agn-debugfs.c:791: error: 'struct iwl_priv' has no member named 'max_delta'


config files available if needed.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
