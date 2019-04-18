From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with the wireless-drivers tree
Date: Thu, 18 Apr 2019 16:49:02 +0300
Message-ID: <87o9532zld.fsf@kamboji.qca.qualcomm.com>
References: <20190415120133.40c0f343@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415120133.40c0f343@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 15 Apr 2019 12:01:33 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shahar S Matityahu <shahar.s.matityahu@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the wireless-drivers-next tree got a conflict
> in:
>
>   drivers/net/wireless/intel/iwlwifi/iwl-trans.h
>
> between commit:
>
>   07d35b4270ef ("iwlwifi: use sync nmi in case of init flow failure")
>
> from the wireless-drivers tree and commit:
>
>   4b1831e48974 ("iwlwifi: dbg_ini: support HW error trigger")
>
> from the wireless-drivers-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, I'll let Dave know about this when he pulls w-d-next.

-- 
Kalle Valo
