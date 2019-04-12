From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 12 (net/sched/sch_taprio.c)
Date: Fri, 12 Apr 2019 08:13:58 -0700
Message-ID: <39fbf66e-b816-447a-f214-50909aec9dfc@infradead.org>
References: <20190412181707.51c073c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412181707.51c073c3@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Vinicius Costa Gomes <vinicius.gomes@intel.com>
List-Id: linux-next.vger.kernel.org

On 4/12/19 1:17 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190411:
> 


on i386:

ld: net/sched/sch_taprio.o: in function `advance_sched':
sch_taprio.c:(.text+0x55d): undefined reference to `__divdi3'
ld: net/sched/sch_taprio.o: in function `taprio_dequeue':
sch_taprio.c:(.text+0x76d): undefined reference to `__divdi3'
ld: net/sched/sch_taprio.o: in function `taprio_init':
sch_taprio.c:(.text+0x12bb): undefined reference to `__divdi3'



-- 
~Randy
