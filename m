From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2013-06-05-17-24 uploaded (rtc)
Date: Thu, 6 Jun 2013 13:07:01 -0700
Message-ID: <20130606130701.a17b25ed7cabde2fc9621800@linux-foundation.org>
References: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
	<51B010B2.10309@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:52276 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101Ab3FFUHD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2013 16:07:03 -0400
In-Reply-To: <51B010B2.10309@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Shuah Khan <shuah.kh@samsung.com>

On Wed, 05 Jun 2013 21:31:46 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

> On 06/05/13 17:26, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2013-06-05-17-24 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> 
> on i386 when CONFIG_PM is not enabled:
> 
> drivers/rtc/class.c:339:18: error: lvalue required as unary '&' operand
> 
> due to:
> #define rtc_class_dev_pm_ops	NULL

hm, OK, thanks.  Shuah's "drivers/rtc/class: convert from Legacy pm ops
to dev_pm_ops" is busted and I'm not seeing a quick fix - the ifdeffery
in drivers/rtc/class.c is a bit odd (uses CONFIG_PM instead of
CONFIG_PM_SLEEP, for a start).  I'll drop it.
