From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 28 ( net/wireless)
Date: Tue, 28 Jun 2011 15:07:16 -0700
Message-ID: <20110628150716.cd10cc04.randy.dunlap@oracle.com>
References: <20110628170927.5a226855.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110628170927.5a226855.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 28 Jun 2011 17:09:27 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110627:
> 
> The net tree still has its 2 build failures and gained a conflict against
> the wireless-current tree.


  LD      drivers/net/wireless/rtlwifi/built-in.o
drivers/net/wireless/rtlwifi/rtl8192de/built-in.o: In function `rtl92ce_sw_led_on':
(.text+0x11fb6): multiple definition of `rtl92ce_sw_led_on'
drivers/net/wireless/rtlwifi/rtl8192ce/built-in.o:(.text+0xa326): first defined here
drivers/net/wireless/rtlwifi/rtl8192de/built-in.o:(.bss+0x0): multiple definition of `dm_digtable'
drivers/net/wireless/rtlwifi/rtl8192c/built-in.o:(.bss+0x0): first defined here
ld: Warning: size of symbol `dm_digtable' changed from 40 in drivers/net/wireless/rtlwifi/rtl8192c/built-in.o to 48 in drivers/net/wireless/rtlwifi/rtl8192de/built-in.o
drivers/net/wireless/rtlwifi/rtl8192de/built-in.o: In function `rtl92ce_sw_led_off':
(.text+0x11cfe): multiple definition of `rtl92ce_sw_led_off'
drivers/net/wireless/rtlwifi/rtl8192ce/built-in.o:(.text+0xa06e): first defined here

config file excerpt:

CONFIG_RTL8192CE=y
# CONFIG_RTL8192SE is not set
CONFIG_RTL8192DE=y
# CONFIG_RTL8192CU is not set
CONFIG_RTLWIFI=y
CONFIG_RTL8192C_COMMON=y

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
