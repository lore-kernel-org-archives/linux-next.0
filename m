From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: next-20081030: voyager compile busted
Date: Thu, 30 Oct 2008 16:47:46 -0500
Message-ID: <1225403266.19324.42.camel@localhost.localdomain>
References: <20081030173030.d8847df6.sfr@canb.auug.org.au>
	 <20081030180323.GA13399@x200.localdomain>
	 <1225398287.19324.1.camel@localhost.localdomain>
	 <20081030205230.GO27407@elte.hu>
	 <1225400283.19324.6.camel@localhost.localdomain>
	 <20081030210704.GA25665@elte.hu>
	 <1225401708.19324.35.camel@localhost.localdomain>
	 <490A2A30.5040905@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:33217 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760080AbYJ3Vrv (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 17:47:51 -0400
In-Reply-To: <490A2A30.5040905@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>

On Thu, 2008-10-30 at 14:42 -0700, H. Peter Anvin wrote:
> James Bottomley wrote:
> > 
> > Before you advocate this, think what it would entail.  Voyager replaces
> > (and has to replace because its not apic based) the entirety of smp.c
> > and smpboot.c ... they'd all have to be abstracted through function
> > pointers.
> > 
> 
> ... or through patched direct calls, which is of course also a possibility.

Yes ... been having IRC conversations about that.  We'd need to use
runtime patching to fix the performance regressions virtualisation has
been causing us first ... but then we could use it for voyager.

James
