From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Subject: Re: ppc elf_map breakage with MAP_FIXED_NOREPLACE
Date: Tue, 23 Jan 2018 16:55:18 +0530
Message-ID: <082aa008-c56a-681d-0949-107245603a97@linux.vnet.ibm.com>
References: <7e35e16a-d71c-2ec8-03ed-b07c2af562f8@linux.vnet.ibm.com>
 <20180105084631.GG2801@dhcp22.suse.cz>
 <e81dce2b-5d47-b7d3-efbf-27bc171ba4ab@linux.vnet.ibm.com>
 <20180107090229.GB24862@dhcp22.suse.cz>
 <87mv1phptq.fsf@concordia.ellerman.id.au>
 <7a44f42e-39d0-1c4b-19e0-7df1b0842c18@linux.vnet.ibm.com>
 <87tvvw80f2.fsf@concordia.ellerman.id.au>
 <96458c0a-e273-3fb9-a33b-f6f2d536f90b@linux.vnet.ibm.com>
 <20180109161355.GL1732@dhcp22.suse.cz>
 <a495f210-0015-efb2-a6a7-868f30ac4ace@linux.vnet.ibm.com>
 <20180117080731.GA2900@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20180117080731.GA2900@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@kernel.org>, Anshuman Khandual <khandual@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

On 01/17/2018 01:37 PM, Michal Hocko wrote:
> On Thu 11-01-18 15:38:37, Anshuman Khandual wrote:
>> On 01/09/2018 09:43 PM, Michal Hocko wrote:
> [...]
>>> Did you manage to catch _who_ is requesting that anonymous mapping? Do
>>> you need a help with the debugging patch?
>>
>> Not yet, will get back on this.
> 
> ping?

Hey Michal,

Missed this thread, my apologies. This problem is happening only with
certain binaries like 'sed', 'tmux', 'hostname', 'pkg-config' etc. As
you had mentioned before the map request collision is happening on
[10030000, 10040000] and [10030000, 10040000] ranges only which is
just a single PAGE_SIZE. You asked previously that who might have
requested the anon mapping which is already present in there ? Would
not that be the same process itself ? I am bit confused. Would it be
helpful to trap all the mmap() requests from any of the binaries
and see where we might have created that anon mapping ?



--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
