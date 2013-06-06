From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-06-05-17-24 uploaded (rtc)
Date: Wed, 05 Jun 2013 21:31:46 -0700
Message-ID: <51B010B2.10309@infradead.org>
References: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38158 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab3FFEcv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2013 00:32:51 -0400
In-Reply-To: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com

On 06/05/13 17:26, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-06-05-17-24 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 

on i386 when CONFIG_PM is not enabled:

drivers/rtc/class.c:339:18: error: lvalue required as unary '&' operand

due to:
#define rtc_class_dev_pm_ops	NULL



-- 
~Randy
