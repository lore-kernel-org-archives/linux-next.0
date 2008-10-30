From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: next-20081030: voyager compile busted
Date: Thu, 30 Oct 2008 14:42:08 -0700
Message-ID: <490A2A30.5040905@zytor.com>
References: <20081030173030.d8847df6.sfr@canb.auug.org.au>	 <20081030180323.GA13399@x200.localdomain>	 <1225398287.19324.1.camel@localhost.localdomain>	 <20081030205230.GO27407@elte.hu>	 <1225400283.19324.6.camel@localhost.localdomain>	 <20081030210704.GA25665@elte.hu> <1225401708.19324.35.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:56281 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759494AbYJ3Vmi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 17:42:38 -0400
In-Reply-To: <1225401708.19324.35.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>

James Bottomley wrote:
> 
> Before you advocate this, think what it would entail.  Voyager replaces
> (and has to replace because its not apic based) the entirety of smp.c
> and smpboot.c ... they'd all have to be abstracted through function
> pointers.
> 

... or through patched direct calls, which is of course also a possibility.

	-hpa
