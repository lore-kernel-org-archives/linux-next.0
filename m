From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 20 Jun 2012 02:58:37 -0700 (PDT)
Message-ID: <20120620.025837.721158723130014230.davem@davemloft.net>
References: <3170667.1PZa2330KE@harkonnen>
	<20120620.020611.1696375957120854262.davem@davemloft.net>
	<5059693.iaLYtpk3E4@harkonnen>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:36558 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811Ab2FTJ6i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Jun 2012 05:58:38 -0400
In-Reply-To: <5059693.iaLYtpk3E4@harkonnen>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: federico.vaga@gmail.com
Cc: mkl@pengutronix.de, bhupesh.sharma@st.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, giancarlo.asnaghi@st.com, wg@grandegger.com

From: Federico Vaga <federico.vaga@gmail.com>
Date: Wed, 20 Jun 2012 11:59:26 +0200

>> Then the driver should NEVER have been submitted without the
>> required infrastructure in place first.
> 
> This particular driver don't use the clk framework at the moment. I put 
> that lines about clk to try to be generic as possibile, but I see that I 
> made a mistake: I'm sorry.

Why would you try to be generic by using an interface currently
only available on certain platforms?

That is how you make drivers non-portable, and not generic.
