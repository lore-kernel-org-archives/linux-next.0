From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the tip tree with the bpf-next tree
Date: Mon, 7 May 2018 10:15:45 +0200
Message-ID: <84481a2d-3930-93c5-9d4f-55b3d066050f@iogearbox.net>
References: <20180507120909.1fee1683@canb.auug.org.au>
 <20180507141003.79783848@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507141003.79783848@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 05/07/2018 06:10 AM, Stephen Rothwell wrote:
> On Mon, 7 May 2018 12:09:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the tip tree got a conflict in:
>>
>>   arch/x86/net/bpf_jit_comp.c
>>
>> between commit:
>>
>>   e782bdcf58c5 ("bpf, x64: remove ld_abs/ld_ind")
>>
>> from the bpf-next tree and commit:
>>
>>   5f26c50143f5 ("x86/bpf: Clean up non-standard comments, to make the code more readable")
>>
>> from the tip tree.
>>
>> I fixed it up (the former commit removed some code modified by the latter,
>> so I just removed it) and can carry the fix as necessary. This is now
>> fixed as far as linux-next is concerned, but any non trivial conflicts
>> should be mentioned to your upstream maintainer when your tree is
>> submitted for merging.  You may also want to consider cooperating with
>> the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Actually the tip tree commit has been added to the bpf-next tree as a
> different commit, so dropping it from the tip tree will clean this up.

Yep, it's been cherry-picked into bpf-next to avoid merge conflicts with
ongoing work.
