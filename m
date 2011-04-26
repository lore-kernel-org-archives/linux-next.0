From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ
 related?)
Date: Tue, 26 Apr 2011 12:06:57 +0200
Message-ID: <1303812417.20212.239.camel@twins>
References: <20110422005046.GQ2235@linux.vnet.ibm.com>
	 <BANLkTi=W=s876U===LVfp59Nnfui8d-1RQ@mail.gmail.com>
	 <20110422150222.GA2300@linux.vnet.ibm.com>
	 <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
	 <20110423210539.GI2628@linux.vnet.ibm.com>
	 <BANLkTimXW2=PYOXkKjnLuH+eN2TjZBqAxw@mail.gmail.com>
	 <BANLkTi=ntjm-5D=OD1oFogpNjmJSJiZygQ@mail.gmail.com>
	 <BANLkTim9H1k4c7xSZZJ09WXs8WCeCQQJJg@mail.gmail.com>
	 <20110424062728.GM2628@linux.vnet.ibm.com>
	 <BANLkTinTd10K6Ho6FhuynROT7yDLHNLojw@mail.gmail.com>
	 <20110424164331.GN2628@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110424164331.GN2628@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, 2011-04-24 at 09:43 -0700, Paul E. McKenney wrote:
> 
> Peter, any thoughts on what I might have done wrong to get the scheduler
> into a state where it was ignoring a runnable realtime task? 

Not really, the only thing I can think of is something like poking at
task->state while its sleeping. One you set it to TASK_RUNNING wakeups
will be ignored since its already running ;-)
