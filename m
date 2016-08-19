From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Fri, 19 Aug 2016 10:37:00 +0200
Message-ID: <5babe9ef-0e3d-6975-9ba4-9a29a700b24d@suse.cz>
References: <20160817114443.67675413@canb.auug.org.au>
 <e6fbe17c-1981-1579-433d-88462d2efb58@suse.cz>
 <20160818110948.52f1322d@roar.ozlabs.ibm.com>
 <20160819133854.17a7b1ca@canb.auug.org.au>
 <20160819150914.36106b5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819150914.36106b5b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On 2016-08-19 07:09, Stephen Rothwell wrote:
> Hi Nick,
> 
> On Fri, 19 Aug 2016 13:38:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Thu, 18 Aug 2016 11:09:48 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:
>>>
>>> On Wed, 17 Aug 2016 14:59:59 +0200
>>> Michal Marek <mmarek@suse.cz> wrote:
>>>   
>>>> On 2016-08-17 03:44, Stephen Rothwell wrote:    
>>>>>
>>>>> After merging the kbuild tree, today's linux-next build (powerpc
>>>>> ppc64_defconfig) produced these warnings:
>>>>>
>>>>> WARNING: 25 bad relocations
>>>>> c000000000cf2570 R_PPC64_ADDR64    __crc___arch_hweight16      
>>>> [...]    
>>>>> Introduced by commit
>>>>>
>>>>>   9445aa1a3062 ("ppc: move exports to definitions")
>>>>>
>>>>> I have reverted that commit for today.
>>>>>
>>>>> [cc-ing the ppc guys for clues - also involved is commit
>>>>>
>>>>>   22823ab419d8 ("EXPORT_SYMBOL() for asm")
>>>>> ]      
>>>>
>>>> FWIW, I see these warnings as well. Any help from ppc developers is
>>>> appreciated - should the R_PPC64_ADDR64 be whitelisted for exported asm
>>>> symbols (their CRCs actually)?    
>>>
>>> The dangling relocation is a side effect of linker unable to resolve the
>>> reference to the undefined weak symbols. So the real question is, why has
>>> genksyms not overridden these symbols with their CRC values?
>>>
>>> This may not even be powerpc specific, but  I'll poke at it a bit more
>>> when I get a chance.  
>>
>> Not sure if this is relevant, but with the commit reverted, the
>> __crc___... symbols are absolute.
>>
>> 00000000f55b3b3d A __crc___arch_hweight16
> 
> Ignore that :-)
> 
> I just had a look at a x86_64 allmodconfig result and it looks like the
> weak symbols are not resolved their either ...
> 
> I may be missing something, but genksyms generates the crc's off the
> preprocessed C source code and we don't have any for the asm files ...

Of course you are right. Which means that we are losing type information
for these exports for CONFIG_MODVERSIONS purposes. I guess it's
acceptable, since the asm functions are pretty basic and their
signatures do not change.

Michal
