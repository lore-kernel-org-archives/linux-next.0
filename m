From: Dou Liyang <douly.fnst@cn.fujitsu.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 16 Mar 2018 13:52:19 +0800
Message-ID: <3b2889c6-3f0b-b0f4-d5a7-3b4cf5c5ef75@cn.fujitsu.com>
References: <20180316163716.5525294f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316163716.5525294f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

At 03/16/2018 01:37 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, yesterday's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> kernel/cpu.c:129:13: warning: 'cpuhp_is_ap_state' defined but not used [-Wunused-function]
>   static bool cpuhp_is_ap_state(enum cpuhp_state state)
>               ^~~~~~~~~~~~~~~~~
> 

Yes, Jiangshan has replaced it with cpuhp_hp_states. So it is obsolete,
it should be removed.

Thanks,
	dou.
> Introduced by commit
> 
>    17a2f1ced028 ("cpu/hotplug: Merge cpuhp_bp_states and cpuhp_ap_states")
> 
