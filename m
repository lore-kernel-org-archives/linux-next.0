From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 23
Date: Mon, 23 Nov 2009 15:37:46 -0800
Message-ID: <4B0B1CCA.7070500@oracle.com>
References: <20091123185232.1423c56b.sfr@canb.auug.org.au>	<20091123111510.9b0c0714.randy.dunlap@oracle.com>	<200911240924.54675.rusty@rustcorp.com.au>	<4B0B1507.4060202@oracle.com> <20091124103641.abd7bd6b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:49667 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756356AbZKWXjB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2009 18:39:01 -0500
In-Reply-To: <20091124103641.abd7bd6b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi Randy,
> 
> On Mon, 23 Nov 2009 15:04:39 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> I decided to check on linux-next (only checked x86_64 allmodconfig),
>> and viola:
>>
>> CONFIG_STAGING=y
>> CONFIG_STAGING_EXCLUDE_BUILD=y
>>
>> That is just too helpful.  :(
> 
> The Kconfig was deliberately done so that the all{no,yes,mod}config
> builds don't build the staging stuff.  You need to explictly ask for it.
> Otherwise I would spend all my time reporting/fixing errors and warnings
> in linux-next.
> 

no, you should just drop it after one build error.


-- 
~Randy
