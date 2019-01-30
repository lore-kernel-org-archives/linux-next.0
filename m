From: Luca Coelho <luca@coelho.fi>
Subject: Re: linux-next: build warning after merge of the
 wireless-drivers-next tree
Date: Thu, 31 Jan 2019 01:51:44 +0200
Message-ID: <9455f1b9e746f2c28d1573ccdce3836ece42cd8a.camel@coelho.fi>
References: <20190131104626.62ff05ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131104626.62ff05ce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Berg <johannes.berg@intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2019-01-31 at 10:46 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the wireless-drivers-next tree, today's linux-next
> build
> (x86_64 allmodconfig) produced this warning:
> 
> drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:195:13: warning:
> 'iwl_mvm_add_rtap_sniffer_config' defined but not used [-Wunused-
> function]
>  static void iwl_mvm_add_rtap_sniffer_config(struct iwl_mvm *mvm,
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   9bf13bee2d74 ("iwlwifi: mvm: include configured sniffer AID in
> radiotap")

This was a conflict resolution damage in one of the patches I applied. 
We already have a fix for it[1] and Kalle will apply it to wireless-
drivers-next soon.

Sorry for the trouble, but somehow I didn't see this warning and
kbuildbot also reported successful compilation with it. :(

[1] https://patchwork.kernel.org/patch/10788503/

--
Cheers,
Luca.
