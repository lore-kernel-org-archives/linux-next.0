From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 27 Sep 2017 07:50:51 -0400
Message-ID: <620d1233-e6c5-f773-b308-b68698191446@redhat.com>
References: <20170927134256.3e8d3b9c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927134256.3e8d3b9c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 09/26/2017 11:42 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> kernel/printk/printk.c:1983:12: warning: 'printk_time' defined but not used [-Wunused-variable]
>  static int printk_time;
>             ^
> 
> Introduced by commit
> 
>   310b454a8653 ("printk: Add monotonic, boottime, and realtime timestamps")
> 

Fix sent upstream here:

https://marc.info/?l=linux-kernel&m=150644159607745&w=2

P.
