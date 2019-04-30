From: Luciano Coelho <luciano.coelho@intel.com>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Tue, 30 Apr 2019 08:30:32 +0300
Message-ID: <bad0f559fdd6eb83c9354ee473c1d7377e83b4d9.camel@intel.com>
References: <20190430140831.6095243c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430140831.6095243c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shahar S Matityahu <shahar.s.matityahu@intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2019-04-30 at 14:08 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in:
> 
>   drivers/net/wireless/intel/iwlwifi/fw/file.h
> 
> between commit:
> 
>   b35f63972c5c ("iwlwifi: dbg_ini: check debug TLV type explicitly")
> 
> from the wireless-drivers tree and commit:
> 
>   aee1b6385e29 ("iwlwifi: support fseq tlv and print fseq version")
> 
> from the wireless-drivers-next tree.
> 
> I fixed it up (the latter is a superset of the former) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thanks, Stephen!

Your resolution is correct, thanks.  I accidentally included the block
that was already in b35f63972c5c when I rebased aee1b6385e29, but it's
harmless (except for the minimal conflict it causes).

--
Cheers,
Luca.
