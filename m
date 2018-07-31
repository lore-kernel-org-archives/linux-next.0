From: Anna Schumaker <schumaker.anna@gmail.com>
Subject: Re: linux-next: build warning after merge of the nfs-anna tree
Date: Tue, 31 Jul 2018 09:46:52 -0400
Message-ID: <35966b8f-43c9-ed1c-215e-f26a0fc1395b@gmail.com>
References: <20180730185200.0d836ca7@canb.auug.org.au>
 <1533027885.3710.2.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533027885.3710.2.camel@redhat.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: David Wysochanski <dwysocha@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi David,

On 07/31/2018 05:04 AM, David Wysochanski wrote:
> On Mon, 2018-07-30 at 18:52 +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the nfs-anna tree, today's linux-next build (powerpc
>> ppc44x_defconfig, sparc defconfig) produced this warning:
>>
>> net/sunrpc/stats.c: In function 'rpc_clnt_show_stats':
>> /home/sfr/next/next/net/sunrpc/stats.c:258:32: warning: excess elements in struct initializer
>>    struct rpc_iostats stats = { 0 };
>>         
> 
> Apologies I did not see this before submission.
> 
> The below fixup compiles without warning for me on ppc64le.
> 
>    struct rpc_iostats stats = {};

Can you resend the patch with that change, please?

Thanks,
Anna

> 
> 
>>                         ^
>>
>> Introduced by commit
>>
>>   c3b588a2d5be ("sunrpc: Change rpc_print_iostats to rpc_clnt_show_stats and handle rpc_clnt clones")
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
