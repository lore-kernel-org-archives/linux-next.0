From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 20 Jun 2012 02:06:11 -0700 (PDT)
Message-ID: <20120620.020611.1696375957120854262.davem@davemloft.net>
References: <D5ECB3C7A6F99444980976A8C6D896384FAA275CBE@EAPEX1MAIL1.st.com>
	<4FE18A5E.204@pengutronix.de>
	<3170667.1PZa2330KE@harkonnen>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:35922 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755583Ab2FTJGM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jun 2012 05:06:12 -0400
In-Reply-To: <3170667.1PZa2330KE@harkonnen>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: federico.vaga@gmail.com
Cc: mkl@pengutronix.de, bhupesh.sharma@st.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, giancarlo.asnaghi@st.com, wg@grandegger.com

From: Federico Vaga <federico.vaga@gmail.com>
Date: Wed, 20 Jun 2012 11:03:08 +0200

>> I think the driver is currently used/tested only on ARM only, so what
>> about adding a HAVE_CLK dependency, until Viresh Kumar's patches are
>> available in net-next. Later we can remove it.
> 
> This driver is tested only on an x86 with AMBA peripherals on PCI. We 
> are developing the clk side for this new platform. 

Then the driver should NEVER have been submitted without the
required infrastructure in place first.

If what you say is true, I'm extremely pissed off about this now.

This submission was a complete cluster fuck, and it means the person
who submitted this to me didn't test the damn build even.
