From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 15 (phy/phy-meson-usb2.c)
Date: Thu, 15 Sep 2016 08:01:54 -0700
Message-ID: <d8adb2cf-ac81-7bf7-8dae-aca9475fe736@infradead.org>
References: <20160915165008.40acdecf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160915165008.40acdecf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 09/14/16 23:50, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160914:
> 

on x86_64:

drivers/built-in.o: In function `phy_meson_usb2_probe':
phy-meson-usb2.c:(.text+0x350c): undefined reference to `of_usb_get_dr_mode_by_phy'


when CONFIG_USB_SUPPORT is not enabled.

-- 
~Randy
