From: Jessica Yu <jeyu@kernel.org>
Subject: Re: linux-next: manual merge of the ipmi tree with the modules tree
Date: Thu, 2 Nov 2017 15:27:23 +0100
Message-ID: <20171102142722.xletcv3hip3x7qmc@redbean>
References: <20171102145808.5bb97c3a@canb.auug.org.au>
 <16c92e03-98b8-3121-cdd8-2e6371451724@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16c92e03-98b8-3121-cdd8-2e6371451724@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, Kees Cook <keescook@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

+++ Corey Minyard [02/11/17 08:31 -0500]:
>On 11/01/2017 10:58 PM, Stephen Rothwell wrote:
>>Hi Corey,
>>
>>Today's linux-next merge of the ipmi tree got a conflict in:
>>
>>   drivers/char/ipmi/ipmi_si_intf.c
>>
>>between commit:
>>
>>   e4dca7b7aa08 ("treewide: Fix function prototypes for module_param_call()")
>>
>>from the modules tree and commit:
>>
>>   44814ec982d2 ("ipmi_si: Move the hotmod handling to another file.")
>>
>>from the ipmi tree.
>
>Thanks Stephen.
>
>Kees, do you have a tree I can merge so we can avoid this going upstream?

Hi Corey,

the modules-next tree (with the conflicting commit) is found here: 

    git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git#modules-next

Thanks,

Jessica 
