From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 18 Jun 2013 16:56:21 +0400
Message-ID: <51C058F5.80609@cogentembedded.com>
References: <20130618161239.5ce92432180d9418831d2514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130618161239.5ce92432180d9418831d2514@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

Hello.

On 18-06-2013 10:12, Stephen Rothwell wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/usb/phy/phy-rcar-usb.c between commit 56a9a6de2a87 ("usb: phy:
> rcar-usb: Fix comment w.r.t. devm_ioremap_resource") from the usb tree
> and commit 725bf9dcafe1 ("phy-rcar-usb: correct base address") from the
> arm-soc tree.

    Darn, and I forewarned not to apply the former commit.

WBR, Sergei
