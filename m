From: "Sachin P. Sant" <sachinp@in.ibm.com>
Subject: Re: next Feb 10: mm/slqb build break
Date: Thu, 12 Feb 2009 16:58:37 +0530
Message-ID: <499407E5.1070705__30788.0425746136$1234438249$gmane$org@in.ibm.com>
References: <20090210194121.80256b72.sfr@canb.auug.org.au>
	<49914790.6050008@in.ibm.com> <49914EE7.7030205@in.ibm.com>
	<84144f020902100353x4074f342ne4d61483074a06b7@mail.gmail.com>
	<20090212014503.GD30043@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20090212014503.GD30043@wotan.suse.de>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Nick Piggin <npiggin@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org
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
