From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: manual merge of the kspp-gustavo tree with Linus'
 tree
Date: Mon, 8 Apr 2019 18:53:16 -0500
Message-ID: <558944e8-5912-dc7c-637c-61dc892bae75@embeddedor.com>
References: <20190408071731.6bd422f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408071731.6bd422f3@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org



On 4/7/19 4:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp-gustavo tree got a conflict in:
> 
>   arch/x86/include/asm/syscall.h
> 
> between commits:
> 
>   b35f549df1d7 ("syscalls: Remove start and number from syscall_get_arguments() args")
>   32d92586629a ("syscalls: Remove start and number from syscall_set_arguments() args")
> 
> from Linus' tree and commit:
> 
>   1f7ae812f87e ("x86/syscalls: Mark expected switch fall-throughs")
> 

I just removed the above commit from my tree.

Thanks for the report, Stephen.
--
Gustavo
