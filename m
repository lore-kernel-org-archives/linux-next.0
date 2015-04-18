From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on score/paris/..
Date: Fri, 17 Apr 2015 22:52:43 -0700
Message-ID: <5531F12B.7010401@roeck-us.net>
References: <20150414165000.GA19434@roeck-us.net> <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com> <552E6722.1080507@roeck-us.net> <20150415211956.GA6703@chrystal.uk.oracle.com> <552F13AF.5030606@roeck-us.net> <20150416082116.GB6703@chrystal.uk.oracle.com> <552FAF4C.2050202@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35660 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbbDRFwp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Apr 2015 01:52:45 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YjLgL-004MvY-5d
	for linux-next@vger.kernel.org; Sat, 18 Apr 2015 05:52:45 +0000
In-Reply-To: <552FAF4C.2050202@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

Hi Quentin,

it looks like there is another failure in linux-next, this time with sparc64:allmodconfig:

WARNING: arch/sparc/kernel/built-in.o(__ex_table+0x3b4): Section mismatch in reference from the (unknown reference) (unknown) to the variable :__retl_efault
/bin/sh: line 1: 22844 Floating point exception(core dumped) scripts/mod/modpost arch/sparc/kernel/built-in.o

The problem was previously hidden by a different build failure.

Guenter
