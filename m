From: Tejun Heo <tj@kernel.org>
Subject: Re: problems in linux-next (Was: Re: linux-next: Tree for December
 1)
Date: Wed, 02 Dec 2009 14:40:29 +0900
Message-ID: <4B15FDCD.7040401@kernel.org>
References: <20091201190301.0fb7abad.sfr@canb.auug.org.au>	<4B14D6E2.2040704@petalogix.com> <20091201210343.f0a1d353.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751495AbZLBFlF@vger.kernel.org>
In-Reply-To: <20091201210343.f0a1d353.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: michal.simek@petalogix.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

Hello,

On 12/01/2009 07:03 PM, Stephen Rothwell wrote:
> cc'ing the percpu and workqueue folks ...
> 
> On Tue, 01 Dec 2009 09:42:10 +0100 Michal Simek <michal.simek@petalogix.com> wrote:
>>
>> It seems to me that percpu has more other troubles too.
>> Look at boolog below for Microblaze with MMU.
> 
> Or may the workqueue additions?

The wq changes need to be rebased due to scheduler related bits.  I'm
backing them out for now.  I'll fix this problem before pushing the
series out again.

Thanks.

-- 
tejun
