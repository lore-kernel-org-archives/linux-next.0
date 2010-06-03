From: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Subject: Re: linux-next: Tree for June 3 (qlcnic)
Date: Thu, 3 Jun 2010 10:31:40 -0700
Message-ID: <4A3D4210-F6CF-4D74-A21A-F6AA4A287445@qlogic.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
 <20100603084618.387a39fa.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20100603084618.387a39fa.randy.dunlap@oracle.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux Driver <Linux-Driver@qlogic.com>
List-Id: linux-next.vger.kernel.org


On Jun 3, 2010, at 8:46 AM, Randy Dunlap wrote:

> On Thu, 3 Jun 2010 13:47:53 +1000 Stephen Rothwell wrote:
> 
>> Hi all,
>> 
>> Changes since 20100602:
> 
> 
> when CONFIG_INET=n:
> 
> ERROR: "qlcnicvf_set_ilb_mode" [drivers/net/qlcnic/qlcnic.ko] undefined!
> ERROR: "qlcnicvf_config_bridged_mode" [drivers/net/qlcnic/qlcnic.ko] undefined!
> ERROR: "qlcnicvf_config_led" [drivers/net/qlcnic/qlcnic.ko] undefined!
> ERROR: "qlcnicvf_clear_ilb_mode" [drivers/net/qlcnic/qlcnic.ko] undefined!
> ERROR: "qlcnicvf_start_firmware" [drivers/net/qlcnic/qlcnic.ko] undefined!
> 
> full config is attached.
> 

Sorry about that. I will send fix right away.

thanks,
Anirban

