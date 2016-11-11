From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [linux-next] RCU: dyntick_idle warnings
Date: Fri, 11 Nov 2016 09:27:32 +0900
Message-ID: <20161111002732.GB4682@swordfish>
References: <20161110075719.GA502@swordfish>
 <20161110145456.GA4127@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161110145456.GA4127@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On (11/10/16 06:54), Paul E. McKenney wrote:
[..]
> Hello, Sergey,
> 
> Should be fixed by 0ea13930e9a8 ("rcu: Maintain special bits at bottom
> of ->dynticks counter"), which should be in -next today.
> 
> And thank you for your testing efforts!

Thanks, Paul! will give it a try.

	-ss
