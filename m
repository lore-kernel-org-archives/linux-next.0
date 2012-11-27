From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [RFC PATCH] Fix abnormal rcu dynticks_nesting values related to
 async page fault
Date: Tue, 27 Nov 2012 17:31:14 +0100
Message-ID: <CAFTL4hw5fgZccTMhV81OxVVfitUtqWXQi9djTCPJz7-4ff35Pg@mail.gmail.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
	<CAFTL4hydk-FT_hqCbcSPFcNCKnqxtWGz0VjTu3nNnQYfbtTz6Q@mail.gmail.com>
	<20121127161639.GF2474@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121127161639.GF2474@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, sasha.levin@oracle.com, gleb@redhat.com, avi@redhat.com
List-Id: linux-next.vger.kernel.org

2012/11/27 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> It is OK to call rcu_irq_exit() without a matching rcu_irq_enter() -only-
> if you have also called rcu_idle_exit() since the last rcu_idle_enter().
> There will be a similar rule for rcu_user_exit().
>
> More generally, it is OK to call rcu_irq_exit() without a matching
> rcu_irq_enter() only if RCU believes that the CPU you are running on is
> non-idle.

Perfect!

>  On 32-bit systems, you are only allowed a few tens of million
> such unmatched rcu_irq_enter() calls in a given RCU-non-idle region.
>
> All courtesy of RCU's need to tolerate architectures that enter
> interrupt handlers without ever leaving them and vice versa.  ;-)

RCU idle mode in a hostile environment ;-)
