From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build warnings after merge of the wireless-drivers-next tree
Date: Fri, 30 Nov 2018 06:33:47 +0200
Message-ID: <87lg5b5glw.fsf@kamboji.qca.qualcomm.com>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130120555.1d35eb6b@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 30 Nov 2018 12:05:55 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sara Sharon <sara.sharon@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the wireless-drivers-next tree, today's linux-next build
> (x86_64 allmodconfig) produced these warnings:
>
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c: In function 'iwl_parse_tlv_firmware':
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1098:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     if (iwlwifi_mod_params.enable_ini)
>        ^
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1100:3: note: here
>    default:
>    ^~~~~~~
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: In function 'iwl_parse_fw_dbg_tlv':
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:203:4: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     iwl_fw_dbg_copy_tlv(trans, tlv, true);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:204:3: note: here
>    default:
>    ^~~~~~~
>
> Introduced by commit
>
>   f14cda6f3b31 ("iwlwifi: trans: parse and store debug ini TLVs")
>
> These are noted because I use -Wimplict-fallthrough
>
> The warnings can be suppressed by adding a comment like
> 	/* fall through */
> at the appropriate place to indicate that the fallthough is intended.

I take it that -Wimplict-fallthrough is not enabled by default yet? So
Dave and Linus won't see these warnings?

What I'm planning is to send a pull request to Dave today and fix these
warnings in the next pull request. Does that sound good?

-- 
Kalle Valo
