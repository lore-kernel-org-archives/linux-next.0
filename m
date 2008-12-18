From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 17 (DVB)
Date: Thu, 18 Dec 2008 09:19:00 -0800
Message-ID: <20081218091900.84d510a1.randy.dunlap@oracle.com>
References: <20081217232536.0b18f4a7.sfr@canb.auug.org.au>
	<20081217161311.454e58ce.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:33978 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751838AbYLRRTy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Dec 2008 12:19:54 -0500
In-Reply-To: <20081217161311.454e58ce.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: v4l-dvb-maintainer@linuxtv.org, mchehab@infradead.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 17 Dec 2008 16:13:11 -0800 Randy Dunlap wrote:

> On Wed, 17 Dec 2008 23:25:36 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20081216:
> > 
> > Undropped tree:
> > 	v4l-dvb
> 
> 
> build-r7329.out:/local/linsrc/linux-next-20081217/drivers/media/video/tuner-core.c:1111: error: 'tuner_ioctl' undeclared here (not in a function)
> build-r7329.out:make[4]: *** [drivers/media/video/tuner-core.o] Error 1
> 
> config attached.


Same build error in next-20081218.


---
~Randy
