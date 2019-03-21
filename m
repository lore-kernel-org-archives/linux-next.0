From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Thu, 21 Mar 2019 16:10:38 -0700
Message-ID: <f0d954ad-f35c-c7c5-6de9-eebabcf88617@gmail.com>
References: <20190322100512.51b5ea25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322100512.51b5ea25@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Scott Branden <scott.branden@broadcom.com>
List-Id: linux-next.vger.kernel.org

On 3/21/19 4:05 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/net/phy/Kconfig:276:warning: prompt redefined
> 
> Introduced by commit
> 
>   17cc9821766c ("net: phy: Move Omega PHY entry to Cygnus PHY driver")
> 

Whoops yes, that should not be there, thanks Stephen.
--
Florian
