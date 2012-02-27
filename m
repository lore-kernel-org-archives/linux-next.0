From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Sun, 26 Feb 2012 22:02:11 -0800
Message-ID: <4F4B1C63.8050108@zytor.com>
References: <20120227165356.6119ac92eabd7052fc56c741@canb.auug.org.au> <20120227055725.GC1904@moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120227055725.GC1904@moon>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrill Gorcunov <gorcunov@openvz.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 02/26/2012 09:57 PM, Cyrill Gorcunov wrote:
> On Mon, Feb 27, 2012 at 04:53:56PM +1100, Stephen Rothwell wrote:
>> Hi Andrew,
>>
>> Today's linux-next merge of the akpm tree got a conflict in
>> arch/x86/syscalls/syscall_64.tbl between commit
>> arch/x86/syscalls/syscall_64.tbl ("x32: Add x32 system calls to
>> syscall/syscall_64.tbl") from the tip tree and commit "syscalls, x86: add
>> __NR_kcmp syscall" from the akpm tree.
>>
>> I fixed it up (see below) but did not know if this call should be marked
>> "common".
> 
> Hi Stephen, letme fetch both trees to figure out what this new column means.
> Will ping back shortly. Thanks!
> 
> 	Cyrill

Hi Cyrill,

"common" means the same entry point is used for x86-64 and x32.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
