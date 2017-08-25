From: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 25 Aug 2017 15:41:50 -0500
Message-ID: <df4641f2-93ca-4923-bb6b-5a43f709859c@amd.com>
References: <20170825143930.494744fe@canb.auug.org.au>
 <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
 <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
 <a71c9dbd-ec32-8bb6-9d36-c138d9b4f001@amd.com>
 <2b021bf3-9ace-8678-0793-c0048500469c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2b021bf3-9ace-8678-0793-c0048500469c@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: brijesh.singh@amd.com, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, paolo.bonzini@gmail.com
List-Id: linux-next.vger.kernel.org



On 08/25/2017 03:05 PM, Paolo Bonzini wrote:
> On 25/08/2017 18:53, Brijesh Singh wrote:
>>>

> Neither my version nor yours is correct. :)  The right one has [0][i]
> and [1][i] (I inverted the indices by mistake).
> 
> With that change, you can include my
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Ingo,

I assuming that this patch should be sent through the tip since SME support
came from tip. I will be submitting the patch very soon.

-Brijesh
