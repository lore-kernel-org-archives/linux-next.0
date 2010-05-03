From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 03 May 2010 04:58:30 -0300
Message-ID: <4BDE8226.3010402@infradead.org>
References: <20100412124041.4876c3f9.sfr@canb.auug.org.au>	<20100428110710.cec8acdb.sfr@canb.auug.org.au> <20100503150123.8fab27b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:59849 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932153Ab0ECH6e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2010 03:58:34 -0400
In-Reply-To: <20100503150123.8fab27b1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Mauro,
> 
> On Wed, 28 Apr 2010 11:07:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Mon, 12 Apr 2010 12:40:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> After merging the v4l-dvb tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> drivers/input/input.c: In function 'input_default_setkeycode':
>>> drivers/input/input.c:691: error: 'keycode' undeclared (first use in this function)
>>>
>>> Caused by commit df7ad46fc171965103f02649f6c2f02c6ca8b331 ("Merge branch
>>> 'master' of /home/v4l/bare_trees/v4l-dvb").  The merge resolution is not
>>> quite right.
>>>
>>> I have used the v4l-dvb tree from next-20100409 for today.
>> I am still getting this build failure ...
> 
> Any chance of it being fixed?

Done. 


-- 

Cheers,
Mauro
