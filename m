From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next 20080528: XEN build error when no Power Mgt enabled
Date: Wed, 28 May 2008 22:33:00 +0100
Message-ID: <483DCF8C.80700@goop.org>
References: <20080528143817.d639123b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw.goop.org ([64.81.55.164]:43011 "EHLO mail.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752196AbYE1Vdf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 17:33:35 -0400
In-Reply-To: <20080528143817.d639123b.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, chrisw@sous-sol.org, virtualization@lists.osdl.org, lkml <linux-kernel@vger.kernel.org>

Randy Dunlap wrote:
> linux-next-20080528/drivers/xen/manage.c: In function 'xen_suspend':
> linux-next-20080528/drivers/xen/manage.c:43: error: implicit declaration of function 'device_power_down'
> linux-next-20080528/drivers/xen/manage.c:65: error: implicit declaration of function 'device_power_up'
> linux-next-20080528/drivers/xen/manage.c: In function 'do_suspend':
> linux-next-20080528/drivers/xen/manage.c:114: error: implicit declaration of function 'device_resume'
> make[3]: *** [drivers/xen/manage.o] Error 1
>   

Thanks for the reminder.  That was on my TODO list.

    J
