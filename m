From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 4 (staging/dt3155v4l)
Date: Tue, 4 May 2010 11:36:04 -0700
Message-ID: <20100504113604.fe00959d.randy.dunlap@oracle.com>
References: <20100504162305.4a07a18a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:35547 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760043Ab0EDSgh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 May 2010 14:36:37 -0400
In-Reply-To: <20100504162305.4a07a18a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marin Mitov <mitov@issp.bas.bg>

On Tue, 4 May 2010 16:23:05 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100503:


drivers/staging/dt3155v4l/dt3155v4l.c:73: error: implicit declaration of function 'udelay'
drivers/staging/dt3155v4l/dt3155v4l.c:616: warning: assignment from incompatible pointer type
drivers/staging/dt3155v4l/dt3155v4l.c:1270: error: implicit declaration of function 'msleep'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
