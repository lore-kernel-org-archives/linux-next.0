From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 3 (cpufreq)
Date: Tue, 03 Mar 2009 08:46:59 -0800
Message-ID: <49AD5F03.2050409@oracle.com>
References: <20090303182633.4ad7831b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:22262 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755996AbZCCQpj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2009 11:45:39 -0500
In-Reply-To: <20090303182633.4ad7831b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090302:
> 
> Undropped trees:
> 	acpi
> 	v4l-dvb


arch/x86/kernel/cpu/cpufreq/longhaul.c:308: error: implicit declaration of function 'acpi_set_register'



I can't find any such function in the linux-next tree.


-- 
~Randy
