From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: linux-next: Tree for May 17
Date: Fri, 17 May 2019 14:56:34 -0700 (PDT)
Message-ID: <mhng-10bb9bbb-5f65-4ed6-8496-317d80be8dfb@palmer-si-x1e>
References: <07e1a10a-5348-2d2e-fb6a-c9ef837185fe@virtuozzo.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <07e1a10a-5348-2d2e-fb6a-c9ef837185fe@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ktkhai@virtuozzo.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, atish.patra@wdc.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 17 May 2019 02:43:08 PDT (-0700), ktkhai@virtuozzo.com wrote:
> On 17.05.2019 12:41, Kirill Tkhai wrote:
>> On 17.05.2019 07:21, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Please do not add any v5.3 material to your linux-next included
>>> trees/branches until after v5.2-rc1 has been released.
>>>
>>> Changes since 20190516:
>>>
>>> The kvm tree gained conflicts against Linus' tree.
>>>
>>> Non-merge commits (relative to Linus' tree): 1023
>>>  1119 files changed, 27058 insertions(+), 7629 deletions(-)
>>
>> Binary file was added:
>>
>> ~/linux-next$ git log --oneline ./modules.builtin.modinfo
>> 4cbb0d07b4d1 RISC-V: Support nr_cpus command line option.
>
> CC Palmer.

Ya, sorry about that.  It should have been fixed as of last night -- I must
have just done something stupid.
