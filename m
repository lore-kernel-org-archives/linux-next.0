From: Richard Holden <aciddeath@gmail.com>
Subject: Re: linux-next: Tree for November 19 (section mismatche fpu_init)
Date: Wed, 19 Nov 2008 14:17:15 -0700
Message-ID: <FF8068EB-1E4F-4D84-93B3-520922C5C1D4@gmail.com>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:11337 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085AbYKSVRT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 16:17:19 -0500
Received: by yw-out-2324.google.com with SMTP id 9so88573ywe.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2008 13:17:18 -0800 (PST)
In-Reply-To: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

WARNING: arch/x86/kernel/built-in.o(.cpuinit.text+0x1d6): Section  
mismatch in reference from the function fpu_init() to the  
function .init.text:init_thread_xstate()
The function __cpuinit fpu_init() references
a function __init init_thread_xstate().
If init_thread_xstate is only used by fpu_init then
annotate init_thread_xstate with a matching annotation.

appears in arch/x86/kernel/built-in.o

-Richard Holden
