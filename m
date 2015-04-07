From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 07 Apr 2015 13:13:36 +0200
Message-ID: <5523BBE0.8030400@iogearbox.net>
References: <20150407171858.2ad46594@canb.auug.org.au>	<20150407084829.GA9577@gmail.com>	<55239BAD.6040304@iogearbox.net> <20150407190527.1633a186@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:56792 "EHLO
	www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbbDGLOR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 07:14:17 -0400
In-Reply-To: <20150407190527.1633a186@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, davem@davemloft.net

[ Cc'ing Dave, fyi ]

On 04/07/2015 11:05 AM, Stephen Rothwell wrote:
> On Tue, 07 Apr 2015 10:56:13 +0200 Daniel Borkmann <daniel@iogearbox.net> wrote:
>> On 04/07/2015 10:48 AM, Ingo Molnar wrote:
>>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>> After merging the tip tree, today's linux-next build (powerpc
>>>> ppc64_defconfig) failed like this:
>>>>
>>>> kernel/events/core.c: In function 'perf_event_set_bpf_prog':
>>>> kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no member named 'prog_type'
>>>>     if (prog->aux->prog_type != BPF_PROG_TYPE_KPROBE) {
>>>>                  ^
>>>>
>>>> Caused by commit 2541517c32be ("tracing, perf: Implement BPF programs
>>>> attached to kprobes").
>>>
>>> Note, this must be some (rarely triggered) aspect of the ppc64
>>> defconfig that neither x86 randconfigs nor most other arch defconfigs
>>> expose?
>>
>> Note, this is a merge conflict with the work that went via net-next tree,
>> i.e. 24701ecea76b ("ebpf: move read-only fields to bpf_prog and shrink
>> bpf_prog_aux"). I believe that is why it didn't trigger on tip tree.
>>
>> You should be able to resolve it in linux-next by changing the test to:
>>
>>     if (prog->prog_type != BPF_PROG_TYPE_KPROBE) {
>
> Thanks Daniel, I will do that tomorrow.  Someone will have to remember
> to tell Linus.

Yes, indeed, depending which tree is merged first.

Thanks,
Daniel
