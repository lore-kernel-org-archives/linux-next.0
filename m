From: David Vrabel <david.vrabel@csr.com>
Subject: Re: linux-next: Tree for November 2 (usb/whci)
Date: Tue, 17 Nov 2009 11:40:43 +0000
Message-ID: <4B028BBB.1080803@csr.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au> <20091102091339.479a3ddb.randy.dunlap@oracle.com> <20091111090403.5fb0229e.randy.dunlap@oracle.com> <20091111173015.GA9641@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([208.87.233.190]:36644 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270AbZKQLlk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 06:41:40 -0500
In-Reply-To: <20091111173015.GA9641@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, lud <linux-usb@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Greg KH wrote:
> On Wed, Nov 11, 2009 at 09:04:03AM -0800, Randy Dunlap wrote:
>> On Mon, 2 Nov 2009 09:13:39 -0800 Randy Dunlap wrote:
>>
>>> On Mon, 2 Nov 2009 17:38:45 +1100 Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20091030: <<<<<<<<<<<<<<<<<<<<<<<<<<
>>>
>>> whci build fails on i386 due to 64-bit multiply & divide:
>>>
>>> ERROR: "__udivdi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
>>> ERROR: "__umoddi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
>>
>> Still present in linux-next-20091111.
> 
> David, can you please look into this and resolve it?

Yes,  I've been on holiday and haven't had a change to look into it yet.

I can't immediately think of any 64 bit maths and I don't understand why
 I haven't seen it.  I always build for i386.

David


Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
