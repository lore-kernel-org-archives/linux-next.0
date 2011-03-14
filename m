From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (powerpc tree related)
Date: Mon, 14 Mar 2011 13:51:16 -0700 (PDT)
Message-ID: <20110314.135116.112600339.davem@davemloft.net>
References: <20110314203827.4b61818e.sfr@canb.auug.org.au>
	<1300135074.22236.788.camel@pasglop>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1300135074.22236.788.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org
Cc: sfr@canb.auug.org.au, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, buytenh@secretlab.ca, grant.likely@secretlab.ca, tglx@linutronix.de
List-Id: linux-next.vger.kernel.org

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Tue, 15 Mar 2011 07:37:54 +1100

> On Mon, 2011-03-14 at 20:38 +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the final tree, today's linux-next build (powerpc
>> allyesconfig) failed like this:
>> 
>> drivers/gpio/langwell_gpio.c: In function 'lnw_irq_handler':
>> drivers/gpio/langwell_gpio.c:210: error: 'struct irq_desc' has no member named 'chip'
>> drivers/gpio/langwell_gpio.c:211: error: 'struct irq_desc' has no member named 'chip'
>> 
>> Caused by commit 17b9f9e2653a ("powerpc: Enable
>> GENERIC_HARDIRQS_NO_DEPRECATED") enabling
>> CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED for powerpc without previously
>> fixing up the above driver.
>> 
>> I have reverted that commit for today.
> 
> Except that the above driver has nothing to do with powerpc, it's some
> Intel Moorestown stuff...
> 
> It should be fixed regardless I suppose, CC'ing Thomas.

I've had to make fixes to this driver in sparc64 allmodconfig builds
too :-)
