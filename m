From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Tue, 12 Aug 2014 03:10:28 +0200
Message-ID: <2030987.QX9qPAsCsv@vostro.rjw.lan>
References: <20140811115726.0bcf3b66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:57862 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751512AbaHLAvk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2014 20:51:40 -0400
In-Reply-To: <20140811115726.0bcf3b66@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>

On Monday, August 11, 2014 11:57:26 AM Stephen Rothwell wrote:
> 
> --Sig_/+JDUwDarNoGtzkfUjWIyaKJ
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/sec-core.c: In function 'sec_pmic_suspend':
> drivers/mfd/sec-core.c:438:29: error: 'PM_SUSPEND_MEM' undeclared (first us=
> e in this function)
>    regulator_suspend_prepare(PM_SUSPEND_MEM);
>                              ^
> 
> Caused by commit bb3274b6442d ("PM / sleep: Rename symbols, functions
> and variables related to sleep") interacting with commit b7cde7078d23
> ("mfd: sec-core: Prepare regulators for suspend state to reduce
> power-consumption") from Linus' tree.

I dropped that commit from linux-next, sorry for the breakage.

Rafael
