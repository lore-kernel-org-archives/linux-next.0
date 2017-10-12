From: Luca Coelho <luca@coelho.fi>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Thu, 12 Oct 2017 21:29:39 +0300
Message-ID: <1507832979.5497.4.camel@coelho.fi>
References: <20171012172512.tlsdjhppfz2hu4vr@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171012172512.tlsdjhppfz2hu4vr@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Chaya Rachel Ivgi <chaya.rachel.ivgi@intel.com>, Shahar S Matityahu <shahar.s.matityahu@intel.com>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2017-10-12 at 18:25 +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
> 
>   drivers/net/wireless/intel/iwlwifi/iwl-config.h
> 
> between commit:
> 
>    dd05f9aab4426f ("iwlwifi: pcie: dynamic Tx command queue size")
> 
> from the wireless-drivers tree and commit:
> 
>    44fd09dad5d2b7 ("iwlwifi: nvm: set the correct offsets to 3168
> series")
> 
> from the wireless-drivers-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any
> particularly
> complex conflicts.
> 
> diff --cc drivers/net/wireless/intel/iwlwifi/iwl-config.h
> index 71cb1ecde0f7,b9f3b350fe34..000000000000
> --- a/drivers/net/wireless/intel/iwlwifi/iwl-config.h
> +++ b/drivers/net/wireless/intel/iwlwifi/iwl-config.h
> @@@ -332,7 -320,9 +332,9 @@@ struct iwl_pwr_tx_backoff 
>    * @integrated: discrete or integrated
>    * @gen2: a000 and on transport operation
>    * @cdb: CDB support
>  - * @ext_nvm: extended NVM format
>  + * @nvm_type: see &enum iwl_nvm_type
> +  * @tx_cmd_queue_size: size of the cmd queue. If zero, use the same
> value as
> +  *	the regular queues
>    *
>    * We enable the driver to be backward compatible wrt. hardware
> features.
>    * API differences in uCode shouldn't be handled here but through
> TLVs
> @@@ -382,7 -371,9 +384,8 @@@ struct iwl_cfg 
>   	    use_tfh:1,
>   	    gen2:1,
>   	    cdb:1,
>  -	    ext_nvm:1,

nvm_type seems to be missing from here?

>   	    dbgc_supported:1;
> + 	u16 tx_cmd_queue_size;
>   	u8 valid_tx_ant;
>   	u8 valid_rx_ant;
>   	u8 non_shared_ant;

--
Luca.
