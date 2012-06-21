From: Robert Richter <robert.richter@amd.com>
Subject: Re: What is the right practice to get new code upstream( was Fwd:
 [patch] a simple hardware detector for latency as well as throughput ver.
 0.1.0)
Date: Thu, 21 Jun 2012 15:29:14 +0200
Message-ID: <20120621132914.GA24632@erda.amd.com>
References: <CAJRGBZw2TctmBxRuA-byaGNCs=1v+M-1PXSm+OuwWApSqu7UjA@mail.gmail.com>
 <1339668296.2559.25.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1339668296.2559.25.camel@twins>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Luming Yu <luming.yu@gmail.com>, LKML <linux-kernel@vger.kernel.org>, tglx@linutronix.de, sfr@canb.auug.org.au, Andrew Morton <akpm@linux-foundation.org>, jcm@jonmasters.org, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, torvalds@linux-foundation.org
List-Id: linux-next.vger.kernel.org

On 14.06.12 12:04:56, Peter Zijlstra wrote:
 For AMD there's only event 02Bh, which is SMIs Received. I'm not sure it
> has anything like the FREEZE or if the event is modifyable to count the
> cycles in SMI.

Peter, which use cases do you have in mind. Is it to root cause
latencies? Or just to see what happens on the system, you long it
spends in smi mode? On current systems counting smi cycles seems not
to be possible.

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
