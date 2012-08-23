From: "ABRAHAM, KISHON VIJAY" <kishon@ti.com>
Subject: Re: linux-next: Tree for Aug 23 (drivers/bus/omap-ocp2scp.c)
Date: Thu, 23 Aug 2012 22:16:17 +0530
Message-ID: <CAAe_U6+tDERZK8nBdEpOWuBaZNpW8YVc2vYQ+Ju1tACjTVk8ow@mail.gmail.com>
References: <20120823152203.34297f3bc5fbb43d10653fcc@canb.auug.org.au>
	<50365CC1.3080402@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog137.obsmtp.com ([74.125.149.18]:41511 "EHLO
	na3sys009aog137.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752323Ab2HWQqT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Aug 2012 12:46:19 -0400
Received: by vcbfo14 with SMTP id fo14so1163892vcb.31
        for <linux-next@vger.kernel.org>; Thu, 23 Aug 2012 09:46:17 -0700 (PDT)
In-Reply-To: <50365CC1.3080402@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Aug 23, 2012 at 10:09 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 08/22/2012 10:22 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120822:
>>
>
>
> on i386:
>
>   CC [M]  drivers/bus/omap-ocp2scp.o
> drivers/bus/omap-ocp2scp.c:70:1: error: '__mod_of_device_table' aliased to undefined symbol 'omap_usb2_id_table'

Sorry. Will send the correct version to be merged.

-Kishon
