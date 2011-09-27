From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 27 (power/qos.c)
Date: Tue, 27 Sep 2011 09:30:22 -0700
Message-ID: <4E81FA1E.3060702@xenotime.net>
References: <20110927173530.ceae2e49537a81da65287bf3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:45069 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750926Ab1I0QaY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 12:30:24 -0400
In-Reply-To: <20110927173530.ceae2e49537a81da65287bf3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, pm list <linux-pm@lists.linux-foundation.org>

On 09/27/2011 12:35 AM, Stephen Rothwell wrote:
> Hi all,


When CONFIG_PM_SLEEP is not enabled:

drivers/base/power/qos.c:231:29: error: 'struct dev_pm_info' has no member named 'entry'


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
