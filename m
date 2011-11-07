From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 3 (KVMTOOL_TEST_ENABLE)
Date: Mon, 07 Nov 2011 09:34:50 -0800
Message-ID: <4EB816BA.3030406@xenotime.net>
References: <20111103172036.0795ce9559ab2dbfd5740a26@canb.auug.org.au>	<4EB33525.808@xenotime.net>	<4EB419F5.6070308@xenotime.net> <CAOJsxLGnUk9NaV2dNZH3rOMaRcCvn7Hb6w=Gn_fq9eEv2NXQnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOJsxLGnUk9NaV2dNZH3rOMaRcCvn7Hb6w=Gn_fq9eEv2NXQnA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Enberg <penberg@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, x86 maintainers <x86@kernel.org>, Sasha Levin <levinsasha928@gmail.com>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

On 11/04/2011 01:03 PM, Pekka Enberg wrote:
> On Fri, Nov 4, 2011 at 6:59 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>> On 11/03/2011 05:43 PM, Randy Dunlap wrote:
>>> On 11/02/2011 11:20 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>
>>>
>>> When KVMTOOL_TEST_ENABLE is enabled but CONFIG_BLOCK is not enabled, there are
>>> MANY build errors.  This one (case) is probably fixed by adding "select BLOCK", but it's
>>> all rather ugly.
>>
>> kconfig even tells us:
>>
>> warning: (KVMTOOL_TEST_ENABLE) selects KGDB which has unmet direct dependencies (HAVE_ARCH_KGDB && DEBUG_KERNEL && EXPERIMENTAL)
>> warning: (KVMTOOL_TEST_ENABLE) selects BLK_DEV which has unmet direct dependencies (BLOCK)
> 
> Sasha, I guess your patch fixes this? Can you send me a version that
> doesn't add the oldconfig magic that Ingo objected to?


Here is more of the twisty maze (from linux-next 2011-1107):

warning: (KVMTOOL_TEST_ENABLE && AMD_IOMMU) selects PCI_MSI which has unmet direct dependencies (PCI && ARCH_SUPPORTS_MSI)
warning: (KVMTOOL_TEST_ENABLE) selects KGDB which has unmet direct dependencies (HAVE_ARCH_KGDB && DEBUG_KERNEL && EXPERIMENTAL)


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
