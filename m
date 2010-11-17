From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 17 Nov 2010 08:03:01 -0800
Message-ID: <4CE3FCB5.6030909@oracle.com>
References: <20101117134820.bca8d764.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:18514 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757826Ab0KQQD1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2010 11:03:27 -0500
In-Reply-To: <20101117134820.bca8d764.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/16/10 18:48, Stephen Rothwell wrote:
> Hi John,
> 
> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_reset_tsf':
> (.opd+0xf00): multiple definition of `iwl_legacy_mac_reset_tsf'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x90): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_config':
> (.text+0x50ae4): multiple definition of `.iwl_legacy_mac_config'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x2b34): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_bss_info_changed':
> (.text+0x4f778): multiple definition of `.iwl_legacy_mac_bss_info_changed'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x17c8): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_tx_cmd_protection':
> (.text+0x4dfb0): multiple definition of `.iwl_legacy_tx_cmd_protection'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x0): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_bss_info_changed':
> (.opd+0xee8): multiple definition of `iwl_legacy_mac_bss_info_changed'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x78): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_tx_cmd_protection':
> (.opd+0xe70): multiple definition of `iwl_legacy_tx_cmd_protection'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x0): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_isr_legacy':
> (.text+0x4e0e0): multiple definition of `.iwl_isr_legacy'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x130): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_reset_tsf':
> (.text+0x50620): multiple definition of `.iwl_legacy_mac_reset_tsf'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x2670): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_isr_legacy':
> (.opd+0xe88): multiple definition of `iwl_isr_legacy'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x18): first defined here
> drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_config':
> (.opd+0xf18): multiple definition of `iwl_legacy_mac_config'
> drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0xa8): first defined here
> 
> I should have known when I reported the warning ...
> 
> Caused by commit dd0dd411f7178a20ea93a3cfa39123f078a07e25 ("iwlwifi: fix
> modular legacy build errors").
> 
> I have reverted that commit for today.

Ack.  John, please drop/revert that patch.

Sorry about the problem.
-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
