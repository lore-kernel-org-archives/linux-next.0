From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: linux-next: Tree for Aug 30 (brcmfmac)
Date: Sat, 31 Aug 2013 20:40:33 +0200
Message-ID: <522238A1.3080008@hauke-m.de>
References: <20130829200013.d9dde1eb64686a32c661b5d3@canb.auug.org.au> <52210AB9.2090104@infradead.org> <CAMuHMdXFmWyiUJF+4HbD=6oGPVXHBAVx=rOC7u=motTQFCKn7g@mail.gmail.com> <5222341B.4070205@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <5222341B.4070205@broadcom.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Arend van Spriel <arend@broadcom.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, brcm80211-dev-list@broadcom.com, linux-kbuild <linux-kbuild@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/31/2013 08:21 PM, Arend van Spriel wrote:
> On 08/31/13 19:37, Geert Uytterhoeven wrote:
>> On Fri, Aug 30, 2013 at 11:12 PM, Randy Dunlap<rdunlap@infradead.org> 
>> wrote:
>>> This bool kconfig symbol:
>>>
>>> config BRCMFMAC_SDIO
>>>          bool "SDIO bus interface support for FullMAC driver"
>>>          depends on MMC
>>>
>>> allows BRCMFMAC_SDIO to be y even when MMC=m.
>>>
>>> Is there a reasonable solution to this?
> 
> Actually, BRCMFMAC should be built in same form as the MMC and/or USB,
> but only when BRCMFMAC_SDIO or BRCMFMAC_USB are selected.
> 
> So valid combinations are:
> MMC=m, USB=m, BRCMFMAC_SDIO=y, BRCMFMAC_USB=y => BRCMFMAC=m
> MMC=m, USB=y, BRCMFMAC_SDIO=y, BRCMFMAC_USB=y => BRCMFMAC=m
> MMC=y, USB=m, BRCMFMAC_SDIO=y, BRCMFMAC_USB=y => BRCMFMAC=m
> MMC=m, USB=y, BRCMFMAC_SDIO=y, BRCMFMAC_USB=n => BRCMFMAC=m
> MMC=m, USB=y, BRCMFMAC_SDIO=n, BRCMFMAC_USB=y => BRCMFMAC=m|y
> MMC=y, USB=m, BRCMFMAC_SDIO=y, BRCMFMAC_USB=n => BRCMFMAC=m|y
> MMC=y, USB=m, BRCMFMAC_SDIO=n, BRCMFMAC_USB=y => BRCMFMAC=m
> MMC=y, USB=y, BRCMFMAC_SDIO=y, BRCMFMAC_USB=y => BRCMFMAC=m|y
> MMC=y, USB=y, BRCMFMAC_SDIO=y, BRCMFMAC_USB=n => BRCMFMAC=m|y
> MMC=y, USB=y, BRCMFMAC_SDIO=n, BRCMFMAC_USB=y => BRCMFMAC=m|y
> 
> Not sure how to express the above.

This should be expressed with this Kconfig:

config BRCMFMAC_USB
	bool "USB bus interface support for FullMAC driver"
	depends on (USB = y || USB = BRCMFMAC)
	depends on BRCMFMAC

config BRCMFMAC_SDIO
	bool "SDIO bus interface support for FullMAC driver"
	depends on (MMC = y || MMC = BRCMFMAC)
	depends on BRCMFMAC
	select FW_LOADER

I haven't tested it, but we had a similar problem in b43 and fixed it
like this.

Hauke
