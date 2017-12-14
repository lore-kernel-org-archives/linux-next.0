From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 14 (usb/dwc3)
Date: Thu, 14 Dec 2017 09:40:19 -0800
Message-ID: <9d07169a-c00d-e302-f373-f4431899941b@infradead.org>
References: <20171214180617.5bbff2ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214180617.5bbff2ec@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/13/2017 11:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20171213:
> 

on i386:

ERROR: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3.ko] undefined!
ERROR: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3.ko] undefined!



I can send the randconfig file is you need it.

-- 
~Randy
