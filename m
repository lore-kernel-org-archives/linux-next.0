From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 26 (kexec/percpu/non-SMP)
Date: Thu, 26 Nov 2009 22:02:38 -0800
Message-ID: <4B0F6B7E.8000904@oracle.com>
References: <20091126203837.b64fb4d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:55341 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbZK0GEI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 01:04:08 -0500
In-Reply-To: <20091126203837.b64fb4d3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20091125:

in drivers/base/cpu.c, when CONFIG_SMP=n, per_cpu_ptr_to_phys() is not available
(inside #ifdef CONFIG_KEXEC):

in function show_crash_notes():

	addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpunum));



drivers/base/cpu.c:100: error: implicit declaration of function 'per_cpu_ptr_to_phys'
-- 
~Randy
