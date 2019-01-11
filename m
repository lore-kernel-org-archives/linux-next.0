From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: Tree for Jan 10 (iwlwifi)
Date: Fri, 11 Jan 2019 13:51:47 +0200
Message-ID: <87pnt35s4s.fsf@purkki.adurom.net>
References: <20190110151409.7d0916c8@canb.auug.org.au>
        <2069197c-c758-6c4e-d30c-3f6baa10b841@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2069197c-c758-6c4e-d30c-3f6baa10b841@infradead.org> (Randy
        Dunlap's message of "Thu, 10 Jan 2019 13:41:33 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxwifi <linuxwifi@intel.com>, linux-wireless <linux-wireless@vger.kernel.org>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> On 1/9/19 8:14 PM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20190109:
>> 
>
> on x86_64:
>
> WARNING: unmet direct dependencies detected for MAC80211_LEDS
>   Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=n] && LEDS_CLASS [=y]
>   Selected by [y]:
>   - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=IWLWIFI [=y])
>
> and then
>
> ld: drivers/net/wireless/intel/iwlwifi/iwl-eeprom-parse.o: in function `iwl_parse_eeprom_data':
> iwl-eeprom-parse.c:(.text+0x7c4): undefined reference to `ieee80211_channel_to_frequency'
> ld: drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.o: in function `iwl_init_sbands':
> iwl-nvm-parse.c:(.text+0x37f): undefined reference to `ieee80211_channel_to_frequency'
> ld: drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.o: in function `iwl_parse_nvm_mcc_info':
> iwl-nvm-parse.c:(.text+0xce9): undefined reference to `ieee80211_channel_to_frequency'
> ld: iwl-nvm-parse.c:(.text+0xe9b): undefined reference to `reg_query_regdb_wmm'
> ld: drivers/net/wireless/intel/iwlwifi/pcie/tx.o: in function `iwl_trans_pcie_tx':
> tx.c:(.text+0x344d): undefined reference to `ieee80211_hdrlen'
> ld: drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.o: in function `iwl_trans_pcie_gen2_tx':
> tx-gen2.c:(.text+0xd93): undefined reference to `ieee80211_hdrlen'
> ld: drivers/net/wireless/intel/iwlwifi/iwl-devtrace.o: in function `iwl_rx_trace_len':
> iwl-devtrace.c:(.text+0x974): undefined reference to `ieee80211_hdrlen'

Kbuild bot also reported this and Luca (CCed) is working on a fix.
Thanks for the report.

-- 
Kalle Valo
