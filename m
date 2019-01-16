From: Sinan Kaya <okaya@kernel.org>
Subject: Re: linux-next: Tree for Jan 16 (PCI config warning?)
Date: Wed, 16 Jan 2019 12:23:05 -0500
Message-ID: <0acd12dd-b281-446e-60c9-141732d0299b@kernel.org>
References: <20190116173838.042db659@canb.auug.org.au>
 <bc18898a-8619-fc46-7c42-3d51969ee7f7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bc18898a-8619-fc46-7c42-3d51969ee7f7@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 1/16/2019 12:00 PM, Randy Dunlap wrote:
> On 1/15/19 10:38 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20190115:
>>
> 
> on x86_64:
> 
> when CONFIG_PCI is not enabled (via randconfig):
> 
> WARNING: unmet direct dependencies detected for PCI_LOCKLESS_CONFIG
>    Depends on [n]: PCI [=n]
>    Selected by [y]:
>    - X86 [=y]
> 
> 

It looks like we'll have to continue peeling the onion some more time.
Can you please attach the kernel configuration file used?

Can I assume that this tree includes Rafael's latest pm pull?

Sinan
