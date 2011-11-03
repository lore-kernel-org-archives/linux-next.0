From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 3 (staging/et131x)
Date: Thu, 03 Nov 2011 14:47:55 -0700
Message-ID: <4EB30C0B.8080200@xenotime.net>
References: <20111103172036.0795ce9559ab2dbfd5740a26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:41147 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752403Ab1KCVsg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Nov 2011 17:48:36 -0400
In-Reply-To: <20111103172036.0795ce9559ab2dbfd5740a26@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Greg KH <gregkh@suse.de>, Mark Einon <mark.einon@gmail.com>

On 11/02/2011 11:20 PM, Stephen Rothwell wrote:
> Hi all,


When CONFIG_PM_SLEEP is not enabled:

drivers/staging/et131x/et131x.c:5489:12: error: 'et131x_pci_setup' undeclared here (not in a function)


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
