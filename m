From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] sound/soc: fix printk format warning
Date: Tue, 28 Sep 2010 10:41:34 -0700
Message-ID: <4CA228CE.9000707@oracle.com>
References: <20100928141823.8c61000e.sfr@canb.auug.org.au> <20100928095846.9d4c7641.randy.dunlap@oracle.com> <20100928173303.GD10739@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:50844 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753022Ab0I1RmU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2010 13:42:20 -0400
In-Reply-To: <20100928173303.GD10739@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On 09/28/10 10:33, Mark Brown wrote:
> On Tue, Sep 28, 2010 at 09:58:46AM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
>> Fix dev_printk format warning:
> 
>> sound/soc/codecs/wm8985.c:731: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
> 
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Takashi already fixed that (and the change already seems to be in
> -next...).

I don't see the fix in linux-next 2010-0928.
Aha, he changed the variable type.  OK, thanks.

> When reporting type based warnings please always report the
> architecture you're building for, GCC seems to only generate the
> warnings if there's a difference in the underlying typedef which means
> that they don't always trigger on every architecture.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
