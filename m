From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 27 (watchdog/hpwdt)
Date: Wed, 27 Jul 2011 09:41:12 -0700
Message-ID: <20110727094112.89ab9901.rdunlap@xenotime.net>
References: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:47014 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753572Ab1G0QlR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2011 12:41:17 -0400
In-Reply-To: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Mingarelli <thomas.mingarelli@hp.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org

On Wed, 27 Jul 2011 14:11:51 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Just in case anyone needs reminding:  Please do not add anything destined
> for v3.2 into linux-next included trees until after v3.1-rc1.


When CONFIG_HPWDT_NMI_DECODING is not enabled:

drivers/watchdog/hpwdt.c:833: error: 'allow_kdump' undeclared (first use in this function)
drivers/watchdog/hpwdt.c:833: error: 'priority' undeclared (first use in this function)

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
