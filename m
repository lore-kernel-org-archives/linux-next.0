From: "Sachin P. Sant" <sachinp@in.ibm.com>
Subject: Re: next Feb 10: mm/slqb build break
Date: Thu, 12 Feb 2009 16:58:37 +0530
Message-ID: <499407E5.1070705__15788.8660360642$1234439427$gmane$org@in.ibm.com>
References: <20090210194121.80256b72.sfr@canb.auug.org.au> <49914790.6050008@in.ibm.com> <49914EE7.7030205@in.ibm.com> <84144f020902100353x4074f342ne4d61483074a06b7@mail.gmail.com> <20090212014503.GD30043@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758225AbZBLLsj@vger.kernel.org>
In-Reply-To: <20090212014503.GD30043@wotan.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Piggin <npiggin@suse.de>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: linux-next.vger.kernel.org

Nick Piggin wrote:
>> Actually, that's not the root cause here. You seem to have CONFIG_SMP
>> disabled but CONFIG_NUMA enabled. That's not possible on x86 which
>> makes me think it's a ppc kconfig bug. Hmm?
>>     
>
> If it is really a valid config, then we should be able to make
> slqb build with it...
I am not sure if this is a valid config. According to arch/powerpc/Kconfig
NUMA depends on PPC64 and defaults to y if SMP & PPC_PSERIES is set.

If this is not a valid config then may be the make randconfig rules
need to be changed accordingly.

Ben should know. Ben ??

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
