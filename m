From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: linux-next: manual merge of the staging tree with the at91 tree
Date: Tue, 18 Sep 2018 09:27:37 +0200
Message-ID: <982f3fea-27f7-2349-51dc-24e34ef7176e@microchip.com>
References: <20180918131238.2838bedd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918131238.2838bedd@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>
List-Id: linux-next.vger.kernel.org

On 18/09/2018 at 05:12, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>    MAINTAINERS
> 
> between commit:
> 
>    5ae2f1f30197 ("MAINTAINERS: move former ATMEL entries to proper MICROCHIP locatioat91n")
> 
> from the at91 tree and commit:
> 
>    010de20412fc ("MAINTAINERS: Add entry for mcp3911 ADC driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Resolution looks good to me.

Thanks. Best regards,
-- 
Nicolas Ferre
