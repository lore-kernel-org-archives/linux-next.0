From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [BUILD-FAILURE] next-20090114 - drivers/staging/meilhaus
Date: Wed, 14 Jan 2009 10:11:58 -0800
Message-ID: <496E2AEE.3060709@oracle.com>
References: <20090114165002.3bbe49d7.sfr@canb.auug.org.au> <20090114180024.GB4796@linux.vnet.ibm.com> <20090114180403.GA16974@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:24089 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752778AbZANSMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Jan 2009 13:12:14 -0500
In-Reply-To: <20090114180403.GA16974@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Greg KH wrote:
> On Wed, Jan 14, 2009 at 11:30:24PM +0530, Kamalesh Babulal wrote:
>> Hi Stephen,
>>
>> 	next-20090114 randconfig build on x86_64 machine fails,
>>
>>   LD      drivers/staging/meilhaus/built-in.o
>> drivers/staging/meilhaus/me1600.o: In function `cleanup_module':
>> (.exit.text+0x0): multiple definition of `cleanup_module'
>> drivers/staging/meilhaus/memain.o:memain.c:(.exit.text+0x0): first defined here
> 
> Yeah, a lot of these staging drivers can't handle being built into the
> kernel.
> 
> At first glance, I don't see a way to prevent this, is there some
> Kconfig option I can use to say, "this can only be a module or disabled,
> not build statically"?

	depends on m


-- 
~Randy
