From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 4/4] [tip:x86/mm] RO/NX protection for loadable kernel
 modules
Date: Fri, 2 Apr 2010 19:01:59 +0200
Message-ID: <20100402170159.GA11611@elte.hu>
References: <g2g817ecb6f1003311859k505d752pb6f2a5d7a31e392@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43449 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755652Ab0DBRCW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Apr 2010 13:02:22 -0400
Content-Disposition: inline
In-Reply-To: <g2g817ecb6f1003311859k505d752pb6f2a5d7a31e392@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>


just wondering, is the boot crash related to the earlier version of this patch 
fixed in this version? If yes, what was the root cause?

Thanks,

	Ingo
