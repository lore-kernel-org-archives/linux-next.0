From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 7 (x86, not SMP)
Date: Wed, 07 Dec 2011 11:10:29 -0800
Message-ID: <4EDFBA25.1020102@xenotime.net>
References: <20111207171218.e11db78531e7f20659e2ca65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:52300 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757148Ab1LGSLK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 13:11:10 -0500
In-Reply-To: <20111207171218.e11db78531e7f20659e2ca65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Don Zickus <dzickus@redhat.com>

On 12/06/2011 10:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111206:


When CONFIG_SMP is not enabled:
(I think that's the cause, but it could be some other kconfig option.)


arch/x86/built-in.o: In function `test_nmi_ipi':
nmi_selftest.c:(.text+0xf7a0): undefined reference to `apic'

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
