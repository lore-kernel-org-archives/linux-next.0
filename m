From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] fix IBM Summit based systems' phys_cpu_present_map on
	32-bit kernels
Date: Sat, 26 Jul 2008 15:00:12 +0200
Message-ID: <20080726130012.GC5418@elte.hu>
References: <20080725020609.GB11800@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52935 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751600AbYGZNAY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 26 Jul 2008 09:00:24 -0400
Content-Disposition: inline
In-Reply-To: <20080725020609.GB11800@us.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Chris McDermott <lcm@linux.vnet.ibm.com> wrote:

> x86 kernels on IBM Summit based systems will only online 1 CPU because 
> the phys_cpu_present_map is not set up correctly. Patch below applied 
> to 2.6.26-git10.

applied to tip/x86/urgent - thanks Chris!

	Ingo
