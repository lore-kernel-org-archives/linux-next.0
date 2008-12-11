From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Thu, 11 Dec 2008 07:46:36 -0700
Message-ID: <494127CC.6060800@intel.com>
References: <20081211172645.f40c8b9f.sfr@canb.auug.org.au> <20081211102122.5fe69850@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42112 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755834AbYLKOqi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 09:46:38 -0500
In-Reply-To: <20081211102122.5fe69850@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, David Daney <ddaney@caviumnetworks.com>

Alan Cox wrote:
> On Thu, 11 Dec 2008 17:26:45 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi Alan,
>>
>> Today's linux-next merge of the ttydev tree got a conflict in
>> drivers/serial/8250.c between commit
>> 507ce132910803e8fd1116467e99f59da3d526f0 ("iop13xx: workaround errata
>> that causes uart interrupts to be missed") from the async_tx tree and
>> commit 63c4074301f79f1620d6c880973d6ef1cc770990
>> ("tty-serial-8250-regops") from the ttydev tree.
>>
>> I have reverted the async_tx commit for today. Please try to figure out
>> what should happen here.
> 
> Dan - can you feed the uart 8250 patches through the ttydev tree or are
> there dependancies on other parts of async_tx ?
> 


No, this purely my fault.  That is a debugging patch I use when testing 
my tree on iop13xx and I inadvertantly included it in my latest push to 
-next.  It has been removed.  Sorry for the noise.

Regards,
Dan
