From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: driver-core tree build failure
Date: Thu, 26 Mar 2009 16:00:50 -0700
Message-ID: <20090326160050.350edcd3@hobbes>
References: <20090326183433.75a895c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-117.bluehost.com ([69.89.22.17]:40376 "HELO
	outbound-mail-117.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754514AbZCZXHe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 19:07:34 -0400
In-Reply-To: <20090326183433.75a895c7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Trent Piepho <xyzzy@speakeasy.org>, Kay Sievers <kay.sievers@vrfy.org>

On Thu, 26 Mar 2009 18:34:33 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg, Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/pci/hotplug/fakephp.c: In function 'legacy_add_slot':
> drivers/pci/hotplug/fakephp.c:91: error: 'struct device' has no
> member named 'bus_id'
> 
> Caused by commit 83dbf66f04b96e65c6c18436c16d40f9cf8630aa ("PCI
> Hotplug: restore fakephp interface with complete reimplementation")
> from the pci tree which added another use of bus_id. (Commit
> c32e967b935450c5178ebeaabb9ed889b14ed197 ("driver core: get rid of
> struct device's bus_id string array") removes bus_id.)
> 
> I applied the batch below.  Jesse, this is suitable for the pci tree
> as the dev_name() interface already exists in Linus' tree.

Applied, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
