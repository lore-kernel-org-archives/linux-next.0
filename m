From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 09 Feb 2015 13:36:07 +0800
Message-ID: <54D84747.10501@linux.intel.com>
References: <20150209132642.0d61b6ed@canb.auug.org.au> <54D82111.9090003@linux.intel.com> <2611810.oabrJWIJSx@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:52855 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751101AbbBIFgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2015 00:36:12 -0500
In-Reply-To: <2611810.oabrJWIJSx@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

Hi Rafael and Lorenzo,
	With more closer review, I suspect statement "kfree(bus_range)"
in commit d2be00c0fb5a ("of/pci: Free resources on failure in
of_pci_get_host_bridge_resources()") may cause double free of bus_range
because bus_range will also be freed by kfree(window->res);
Regards!
Gerry

On 2015/2/9 11:22, Rafael J. Wysocki wrote:
> On Monday, February 09, 2015 10:53:05 AM Jiang Liu wrote:
>>
>> On 2015/2/9 10:26, Stephen Rothwell wrote:
>>> Hi Rafael,
> 
> [cut]
> 
>>>                ^
>>>
>>> Caused by commit 14d76b68f281 ("PCI: Use common resource list
>>> management code instead of private implementation") interacting with
>>> commit d2be00c0fb5a ("of/pci: Free resources on failure in
>>> of_pci_get_host_bridge_resources()") from the pci tree.
>>>
>>> I applied the following merge fix patch (which may need more work?).
>> Hi Stephen,
>> 	Thanks for fixing it and there should no more work needed.
> 
> Can you please have a look at my linux-next branch now and see if the code
> is correct in there as well?
> 
> Rafael
> 
