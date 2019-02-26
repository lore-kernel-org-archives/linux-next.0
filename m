From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 26 (net/sched/sch_pie.c)
Date: Tue, 26 Feb 2019 08:21:32 -0800
Message-ID: <6ecd1bde-c15b-0568-2b72-6e0796a87864@infradead.org>
References: <20190226190859.624e21f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226190859.624e21f0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Vijay Subramanian <vijaynsu@cisco.com>, Mythili Prabhu <mysuryan@cisco.com>
List-Id: linux-next.vger.kernel.org

On 2/26/19 12:08 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190225:
> 

on i386:

ld: net/sched/sch_pie.o: in function `pie_timer':
sch_pie.c:(.text+0x604): undefined reference to `__udivdi3'



-- 
~Randy
