From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] eeepc: needs to depend on INPUT
Date: Thu, 19 Feb 2009 10:17:25 -0800
Message-ID: <499DA235.6090700@oracle.com>
References: <20090220002832.cad00fcd.sfr@canb.auug.org.au>	 <499D93F0.2090803@oracle.com> <71cd59b00902191012k764bab32n85f54fc049e35035@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:61467 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751881AbZBSSRS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Feb 2009 13:17:18 -0500
In-Reply-To: <71cd59b00902191012k764bab32n85f54fc049e35035@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Corentin Chary wrote:
> On Thu, Feb 19, 2009 at 6:16 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> EEEPC_LAPTOP needs to depend on INPUT to fix build errors that
>> can happen when EEEPC_LAPTOP=y and INPUT=m:
> 
> There is already a patch sent to linux-acpi and Len Brown.
> 
> http://patchwork.kernel.org/patch/7354/

Today's linux-next doesn't build (doesn't have that patch).  :(

-- 
~Randy
