From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 18 (XEN build error)
Date: Wed, 18 Jun 2008 12:43:31 -0700
Message-ID: <20080618124331.04e27900.randy.dunlap@oracle.com>
References: <20080618175753.2a519b71.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:33735 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470AbYFRToP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jun 2008 15:44:15 -0400
In-Reply-To: <20080618175753.2a519b71.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, jeremy@xensource.com, chrisw@sous-sol.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.osdl.org

linux-next-20080618/drivers/xen/manage.c: In function 'xen_suspend':
linux-next-20080618/drivers/xen/manage.c:66: error: too few arguments to function 'device_power_up'
linux-next-20080618/drivers/xen/manage.c: In function 'do_suspend':
linux-next-20080618/drivers/xen/manage.c:115: error: too few arguments to function 'device_resume'
make[3]: *** [drivers/xen/manage.o] Error 1

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
