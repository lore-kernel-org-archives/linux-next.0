From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: [PATCH] ftrace: handle archs that do not support irqs_disabled_flags
Date: Fri, 24 Oct 2008 15:54:40 +0200
Message-ID: <c62985530810240654o3e58a0abt12221507855be005@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <49008D12.5090204@gmail.com>
	 <Pine.LNX.4.64.0810231635440.18978@anakin>
	 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
	 <Pine.LNX.4.64.0810231727430.18978@anakin>
	 <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
	 <20081023163850.GB16591@elte.hu> <4901D8CD.7000405@gmail.com>
	 <alpine.DEB.1.10.0810240937130.3882@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.157]:6401 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040AbYJXNym (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Oct 2008 09:54:42 -0400
Received: by fg-out-1718.google.com with SMTP id 19so977834fgg.17
        for <linux-next@vger.kernel.org>; Fri, 24 Oct 2008 06:54:40 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.10.0810240937130.3882@gandalf.stny.rr.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

2008/10/24 Steven Rostedt <rostedt@goodmis.org>:
> This patch adds a 'X' in the output to let the user know that the
> architecture they are running on does not support a way for the tracer
> to determine if interrupts were enabled or disabled. It also lets those
> same archs compile with tracing enabled.

That's almost exactly what I thought to repair the warning caused by those
FLAG_IRQS_NOSUPPORT archs :)

So we have now all the three patches that correct the warning reported
by Alexey in
Linux-next: http://lkml.org/lkml/2008/10/23/145
