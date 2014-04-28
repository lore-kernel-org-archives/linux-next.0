From: Richard Weinberger <richard@nod.at>
Subject: Re: mmotm 2014-04-24-13-07 uploaded
Date: Mon, 28 Apr 2014 19:21:27 +0200
Message-ID: <535E8E17.2050600@nod.at>
References: <20140424200837.727695A407C@corp2gmr1-2.hot.corp.google.com> <535992DD.3060808@infradead.org> <20140425100459.7824f676@annuminas.surriel.com> <535AC91A.1070504@infradead.org> <535ACB0E.4070600@infradead.org> <20140427062650.GW4496@linux.vnet.ibm.com> <20140428135540.GA14661@linux.vnet.ibm.com> <535E8D14.7080405@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <535E8D14.7080405@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: Randy Dunlap <rdunlap@infradead.org>, Rik van Riel <riel@redhat.com>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, umgwanakikbuti@gmail.com
List-Id: linux-next.vger.kernel.org

Am 28.04.2014 19:17, schrieb Randy Dunlap:
> 
> uml defconfig on x86_64:
> 
>   CC      arch/um/kernel/asm-offsets.s
> In file included from include/linux/sem.h:5:0,
>                  from include/linux/sched.h:35,
>                  from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
>                  from arch/um/kernel/asm-offsets.c:1:
> include/linux/rcupdate.h:257:20: error: static declaration of 'rcu_sysrq_start' follows non-static declaration
> include/linux/rcupdate.h:250:6: note: previous declaration of 'rcu_sysrq_start' was here
> include/linux/rcupdate.h:260:20: error: static declaration of 'rcu_sysrq_end' follows non-static declaration
> include/linux/rcupdate.h:251:6: note: previous declaration of 'rcu_sysrq_end' was here
> make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1
> 
> 
> Please test your patch(es).

Just in case, to build an x86_64 UML please run:

make defconfig ARCH=um SUBARCH=x86_64
make linux ARCH=um SUBARCH=x86_64

Thanks,
//richard
