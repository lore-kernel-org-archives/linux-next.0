From: "Yinghai Lu" <yinghai@kernel.org>
Subject: Re: [BUG] next-20081216 - WARNING: at kernel/smp.c:333 smp_call_function_mask
Date: Fri, 19 Dec 2008 03:51:53 -0800
Message-ID: <86802c440812190351q3118516aif664dd5869c21b2a@mail.gmail.com>
References: <20081216223754.0c8e21d4.sfr@canb.auug.org.au>
	 <20081219105441.GA19750@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:60588 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbYLSLvy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Dec 2008 06:51:54 -0500
In-Reply-To: <20081219105441.GA19750@linux.vnet.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mingo@elte.hu, mel@csn.ul.ie

On Fri, Dec 19, 2008 at 2:54 AM, Kamalesh Babulal
<kamalesh@linux.vnet.ibm.com> wrote:
> Hi,
>
>        next-200816 kernel panics, while boot up on x86_64 machine.
>
> Initializing CPU#0
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000048
> IP: [<ffffffff80700449>] init_ISA_irqs+0x18/0x53

.config and good boot log?

YH
