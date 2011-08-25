From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the xen tree with the
	tip tree
Date: Thu, 25 Aug 2011 11:26:37 -0700
Message-ID: <4E5693DD.2010307@zytor.com>
References: <20110825142450.c84e02d8763cfd1a93411844@canb.auug.org.au>
	<4E5690C3.2050706@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xensource.com>
In-Reply-To: <4E5690C3.2050706@goop.org>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Xen Devel <Xen-devel@lists.xensource.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

On 08/25/2011 11:13 AM, Jeremy Fitzhardinge wrote:
> On 08/24/2011 09:24 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the xen tree got a conflict in
>> arch/x86/include/asm/spinlock.h between a series of commits from the tip
>> tree and a smaller series of similar commits from the xen tree.
>>
>> I see that Linus is commenting on these patches at the moment, and its
>> not easy to resolve the conflicts, so I will just use the xen tree from
>> next-20110824 for today.
>>
> 
> Thanks Stephen; the xen tree ones are more current, and I want to make
> sure I didn't screw up any of the cmpxchg/xadd changes in a wider test env.
> 

Stephen: the x86/spinlocks branch in the -tip tree is obsolete and
should be dropped.

	-hpa
