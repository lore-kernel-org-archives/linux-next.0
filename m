From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with Linus' tree
Date: Fri, 04 Aug 2017 09:36:26 +0300
Message-ID: <87efsrn8k5.fsf@kamboji.qca.qualcomm.com>
References: <20170804120408.0d147e86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170804120408.0d147e86@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 4 Aug 2017 12:04:08 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Berg <johannes.berg@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
>
>   drivers/net/wireless/intel/iwlwifi/mvm/ops.c
>
> between commit:
>
>   bf8b286f86fc ("iwlwifi: mvm: defer setting IWL_MVM_STATUS_IN_HW_RESTART")
>
> from Linus' tree and commit:
>
>   7174beb60c53 ("iwlwifi: refactor firmware debug code")
>
> from the wireless-drivers-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the resolution looks good. I'll notify Dave about this when I
send the wireless-drivers-next pull request to him.

-- 
Kalle Valo
