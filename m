From: Luca Coelho <luca@coelho.fi>
Subject: Re: linux-next: manual merge of the net-next tree with the
 wireless-drivers tree
Date: Mon, 29 Apr 2019 08:19:34 +0300
Message-ID: <cc5e71b2ae7c72b643b9666897bbf6eda4bddbb6.camel@coelho.fi>
References: <20190429115338.5decb50b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429115338.5decb50b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, 2019-04-29 at 11:54 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c
> 
> between commits:
> 
>   154d4899e411 ("iwlwifi: mvm: properly check debugfs dentry before using it")
>   d156e67d3f58 ("iwlwifi: mvm: fix merge damage in iwl_mvm_vif_dbgfs_register()")
> 
> from the wireless-drivers tree and commit:
> 
>   c9af7528c331 ("iwlwifi: mvm: no need to check return value of debugfs_create functions")
> 
> from the net-next tree.
> 
> I fixed it up (the latter removed the code modified by the former, so I
> just did that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

I checked your merge and it looks good, thanks!

--
Cheers,
Luca.
