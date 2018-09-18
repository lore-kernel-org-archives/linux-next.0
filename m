From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: Tree for Sep 18 (kernel/bpf/syscall)
Date: Tue, 18 Sep 2018 17:41:04 +0200
Message-ID: <a1129d67-97e3-8f10-c938-0de72fee9377@iogearbox.net>
References: <20180918151235.4284275f@canb.auug.org.au>
 <0dc91212-54e8-d2f0-a4e3-30a468c20b8d@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0dc91212-54e8-d2f0-a4e3-30a468c20b8d@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, ppenkov@google.com, willemb@google.com
List-Id: linux-next.vger.kernel.org

[ Cc Petar and Willem ]

On 09/18/2018 05:37 PM, Randy Dunlap wrote:
> On 9/17/18 10:12 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20180913:
> 
> on i386 or x86_64: (in 6 of 20 randconfigs)
> 
> kernel/bpf/syscall.o: In function `__x64_sys_bpf':
> syscall.c:(.text+0x3278): undefined reference to `skb_flow_dissector_bpf_prog_attach'
> syscall.c:(.text+0x3310): undefined reference to `skb_flow_dissector_bpf_prog_detach'
> kernel/bpf/syscall.o:(.rodata+0x3f0): undefined reference to `flow_dissector_prog_ops'
> kernel/bpf/verifier.o:(.rodata+0x250): undefined reference to `flow_dissector_verifier_ops'
> 
> Full randconfig file is attached.

Looks like we need a wrapper for these, config had:

# CONFIG_NET is not set
