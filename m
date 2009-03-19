From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: manual merge of the iommu tree with the kernel-doc
 tree
Date: Thu, 19 Mar 2009 09:27:14 -0700
Message-ID: <49C27262.4050405@oracle.com>
References: <20090319185732.b8cc98a8.sfr@canb.auug.org.au> <20090319080244.GA4595@elte.hu> <49C26F74.7000003@oracle.com> <20090319162322.GA18465@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:42042 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbZCSQZK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 12:25:10 -0400
In-Reply-To: <20090319162322.GA18465@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>

Ingo Molnar wrote:
> * Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
>> Ingo Molnar wrote:
>>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>> Hi Ingo,
>>>>
>>>> Today's linux-next merge of the iommu tree got a conflict in
>>>> Documentation/kernel-parameters.txt between commit
>>>> 8e141e0b33e2fd17540881a1ead5103dd229bf81 ("docum-kernprms-alpha3") from
>>>> the kernel-doc tree and commit 59d3daafa17265f01149df8eab3fb69b9b42cb2e
>>>> ("dma-debug: add kernel command line parameters") from the iommu tree.
>>> a sidenote for Randy, the commit title looks weird:
>>>
>>>   From 8e141e0b33e2fd17540881a1ead5103dd229bf81 Mon Sep 17 00:00:00 2001
>>>   From: Randy Dunlap <randy.dunlap@oracle.com>
>>>   Date: Tue, 24 Feb 2009 11:11:44 +1100
>>>   Subject: [PATCH] docum-kernprms-alpha3
>>>
>>> this is not really acceptable for upstream.
>> Yes, I agree.
>>
>> Stephen, that's just the filename (with .patch) from the quilt
>> series file, right?  I could expand the filename... are there
>> any other options here?
> 
> If you put a "Subject: " line into the .patch that should get 
> imported as the commit title.

OK, I'll give that a shot.  Thanks.

-- 
~Randy
