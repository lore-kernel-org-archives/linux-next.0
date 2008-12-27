From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUG] next-20081216 - WARNING: at kernel/smp.c:333
	smp_call_function_mask
Date: Sat, 27 Dec 2008 09:37:58 +0100
Message-ID: <20081227083758.GA12138@elte.hu>
References: <49529CE1.4040005@kernel.org> <20081226091217.GA5100@linux.vnet.ibm.com> <4954AC7B.3020603@kernel.org> <20081226102716.GA31450@uranus.ravnborg.org> <20081226152804.GB5100@linux.vnet.ibm.com> <20081226153318.GA4514@elte.hu> <20081226170452.GC5100@linux.vnet.ibm.com> <20081226181733.GA24439@elte.hu> <20081227071138.GA4530@linux.vnet.ibm.com> <4955DBBC.4070508@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:36771 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751295AbYL0Ii3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Dec 2008 03:38:29 -0500
Content-Disposition: inline
In-Reply-To: <4955DBBC.4070508@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie


* Yinghai Lu <yinghai@kernel.org> wrote:

> +extern int arch_init_chip_data(struct irq_desc *desc, int cpu);

when you change a function declaration's return type, you _must_ double 
check whether you properly updated all instances of that function. In this 
case you forgot about the io_apic.c instance.

	Ingo
