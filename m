From: wwguy <wey-yi.w.guy@intel.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (wireless tree related)
Date: Fri, 25 Feb 2011 12:33:43 -0800
Message-ID: <1298666023.2603.15.camel@wwguy-ubuntu>
References: <20110225171625.60e967f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:65364 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755925Ab1BYUfn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Feb 2011 15:35:43 -0500
In-Reply-To: <20110225171625.60e967f8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Venkataraman, Meenakshi" <meenakshi.venkataraman@intel.com>

Hi Stephen,

On Thu, 2011-02-24 at 22:16 -0800, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x29f0): multiple definition of `iwl_rates'
> drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0xa68): first defined here
> powerpc64-linux-ld: Warning: size of symbol `iwl_rates' changed from 143 in drivers/net/wireless/iwlwifi/built-in.o to 130 in drivers/net/wireless/iwlegacy/built-in.o
> drivers/net/wireless/iwlegacy/built-in.o:(.data+0x0): multiple definition of `bt_coex_active'
> drivers/net/wireless/iwlwifi/built-in.o:(.data+0x668): first defined here
> drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x750): multiple definition of `iwl_eeprom_band_1'
> drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0x27d0): first defined here
> drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x3f0): multiple definition of `iwl_bcast_addr'
> drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0x24f8): first defined here
> drivers/net/wireless/iwlegacy/built-in.o:(.bss+0x3d48): multiple definition of `iwl_debug_level'
> drivers/net/wireless/iwlwifi/built-in.o:(.bss+0x21950): first defined here
> 
> Presumably caused by commit be663ab67077fac8e23eb8e231a8c1c94cb32e54
> ("iwlwifi: split the drivers for agn and legacy devices 3945/4965").
> 
> I have just left this one as it will only break strange configs (like
> allyesconfig) but it needs to be fixed soon.

Thanks for let us know, we will submit separated patch to fix it asap

Wey
