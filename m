From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: linux-next: Tree for November 5
Date: Thu, 05 Nov 2009 16:08:27 +0530
Message-ID: <4AF2AB23.9000907@in.ibm.com>
References: <20091105190426.c9cadada.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp08.in.ibm.com ([59.145.155.8]:50844 "EHLO
	e28smtp08.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbZKEKi0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2009 05:38:26 -0500
In-Reply-To: <20091105190426.c9cadada.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, jbarnes@virtuousgeek.org, bjorn.helgaas@hp.com

Today's next tree fails to build on i386 with

arch/x86/pci/built-in.o: In function `align_resource':
arch/x86/pci/acpi.c:82: undefined reference to `__udivdi3'

The code in question was added by commit
03db42adfeeabe856dbb6894dd3aaff55838330a.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
