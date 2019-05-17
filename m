From: Kirill Tkhai <ktkhai@virtuozzo.com>
Subject: Re: linux-next: Tree for May 17
Date: Fri, 17 May 2019 12:43:08 +0300
Message-ID: <07e1a10a-5348-2d2e-fb6a-c9ef837185fe@virtuozzo.com>
References: <20190517142152.588edb6e@canb.auug.org.au>
 <a119ca58-6771-cc36-fe5a-187ba500010a@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a119ca58-6771-cc36-fe5a-187ba500010a@virtuozzo.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, atish.patra@wdc.com, palmer@sifive.com, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 17.05.2019 12:41, Kirill Tkhai wrote:
> On 17.05.2019 07:21, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.3 material to your linux-next included
>> trees/branches until after v5.2-rc1 has been released.
>>
>> Changes since 20190516:
>>
>> The kvm tree gained conflicts against Linus' tree.
>>
>> Non-merge commits (relative to Linus' tree): 1023
>>  1119 files changed, 27058 insertions(+), 7629 deletions(-)
> 
> Binary file was added:
> 
> ~/linux-next$ git log --oneline ./modules.builtin.modinfo
> 4cbb0d07b4d1 RISC-V: Support nr_cpus command line option.

CC Palmer.
