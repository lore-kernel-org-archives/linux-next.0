From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 6 (nouveau)
Date: Thu, 6 May 2010 11:18:56 -0700
Message-ID: <20100506111856.ae15cd03.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:36205 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699Ab0EFSVJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 May 2010 14:21:09 -0400
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On Thu, 6 May 2010 15:15:02 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100505:


When CONFIG_ACPI_BUTTON=m:

drivers/built-in.o: In function `nouveau_connector_detect':
nouveau_connector.c:(.text+0x1d81cf): undefined reference to `acpi_lid_open'


#ifdef CONFIG_ACPI
		if (!nouveau_ignorelid && !acpi_lid_open())
			status = connector_status_unknown;
#endif


Do you want that to be
#ifdef CONFIG_ACPI_BUTTON
?
That will still only be built when CONFIG_ACPI_BUTTON=y (not =m).

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
